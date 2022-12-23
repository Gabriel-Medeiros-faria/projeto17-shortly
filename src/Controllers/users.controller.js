import { connectionDB } from "../database/db.js";
import bcrypt from "bcrypt"

export async function create(req, res){
    const {name, email, password, confirmPassword} = req.body

    const hashPassword = bcrypt.hashSync(password, 10)

    try{
        if(password!=confirmPassword){
            return res.status(422).send("Senhas diferentes")
        }

        const user = await connectionDB.query("SELECT email FROM users WHERE email=$1;",[email])

        if(user.rows[0]){
            return res.status(409).send(({message: "Esse email ja existe"}))
        }

        await connectionDB.query("INSERT INTO users (name, email, password) VALUES ($1, $2, $3);", 
        [name, email, hashPassword])

        res.sendStatus(201)
    }catch(err){
        res.status(500).send(err)
    }
}

export async function FindUserInfo(req, res){
    const {authorization} = req.headers
    const token = authorization?.replace("Bearer ", "")

    try{
        const session = await connectionDB.query('SELECT * FROM session WHERE token = $1;',[token])
        const url = await connectionDB.query('SELECT * FROM urls WHERE "userId"=$1;', [session.rows[0].userId])
        const user = await connectionDB.query('SELECT * FROM users WHERE id=$1;', [session.rows[0].userId])
        const visitCount = await connectionDB.query('SELECT SUM(amount) FROM urls WHERE "userId"=$1;',
        [session.rows[0].userId]);

        if(!session.rows[0]){
            return res.status(401).send("Não autorizado")
        }
        if(url.rows[0].userId !== session.rows[0].userId){
            return res.sendStatus(404)
        }
        const obj = await connectionDB.query('SELECT urls.id AS "ulrId", urls."shortlyLink", urls.link, urls.amount AS "visitCount" FROM urls JOIN users ON urls."userId" = users.id  WHERE urls."userId" = $1;', 
        [session.rows[0].userId])

        const userUrls = {
            id: session.rows[0].userId,
            name: user.rows[0].name,
            visitCount: visitCount.rows[0].sum,
            shortenedUrls: obj.rows
        }
        res.send(userUrls)
    }catch(err){
        console.log(err)
        res.status(500).send(err)
    }
}

export async function ranking(req, res){
    try{
        const ranking = await connectionDB.query(`SELECT users.id, users.name, COUNT(urls.link) AS "linkCount", COALESCE(SUM(urls.amount),0) AS "visitCount" FROM users
        LEFT JOIN urls ON urls."userId" = users.id
        GROUP BY users.id ORDER BY "visitCount" DESC, "linkCount" DESC LIMIT 10`)
        res.send(ranking.rows)
    }catch(err){
        console.log(err)
        res.status(500).send(err)
    }
}