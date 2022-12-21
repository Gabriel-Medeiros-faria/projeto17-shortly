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