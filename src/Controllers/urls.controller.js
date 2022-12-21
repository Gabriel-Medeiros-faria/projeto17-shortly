import { connectionDB } from "../database/db.js";
import { nanoid } from "nanoid";

export async function create(req, res){
    const {url} = req.body
    const {authorization} = req.headers
    const token = authorization?.replace("Bearer ", "")
    const shortlyUrl = nanoid(8)

    try{
        const session = await connectionDB.query('SELECT * FROM session WHERE token = $1;',[token])
        if(!session.rows[0]){
            return res.status(401).send("Não autorizado")
        }
        await connectionDB.query('INSERT INTO urls ("userId", link, "shortlyLink") VALUES ($1, $2, $3);',
        [session.rows[0].userId, url, shortlyUrl])
        res.status(201).send({shortUrl: shortlyUrl})


    }catch(err){
        console.log(err)
        res.status(500).send(err)
    }
}

export async function findById(req, res){
    const {id} = req.params

    try{
        const urlId = await connectionDB.query("SELECT * FROM urls WHERE id=$1;", [id])
    if(!urlId.rows[0]){
        return res.sendStatus(404)
    }
    res.send({id: urlId.rows[0].id.toString(),
    shortUrl: urlId.rows[0].shortlyLink,
    url: urlId.rows[0].link
    })
    }catch(err){
        res.status(500).send(err)
    }
}

export async function openUrl(req, res){
    const {shortUrl} = req.params
    try{
        const url = await connectionDB.query('SELECT * FROM urls WHERE "shortlyLink"=$1;', [shortUrl])
        if(!url.rows[0]){
            return res.sendStatus(404)
        }
        await connectionDB.query('UPDATE urls SET amount = amount + 1 WHERE "shortlyLink"=$1;', [shortUrl])
        res.redirect(url.rows[0].link)
    }catch(err){
        console.log(err)
        res.status(500).send(err)
    }
}

export async function deleteUrl(req, res){
    const {id} = req.params
    const {authorization} = req.headers
    const token = authorization?.replace("Bearer ", "")

    try{
        const session = await connectionDB.query('SELECT * FROM session WHERE token = $1;',[token])
        const url = await connectionDB.query('SELECT * FROM urls WHERE id=$1;', [id])

        if(!session.rows[0]){
            return res.status(401).send("Não autorizado")
        }

        if(url.rows[0].userId !== session.rows[0].userId){
            return res.status(401).send("Link não pertence ao usuário!")
        }

        if(!url.rows[0]){
            return res.status(401).send("Url não existente!")
        }
        await connectionDB.query('DELETE FROM urls WHERE id=$1;',[id])
        res.sendStatus(204)
    }catch(err){
        console.log(err)
        res.status(500).send(err)
    }
}