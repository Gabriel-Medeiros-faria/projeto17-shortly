import { connectionDB } from "../database/db.js";
import { v4 as uuidV4} from "uuid";
import bcrypt from "bcrypt"

export async function login(req, res){
const {email, password} = req.body
const token = uuidV4()

try{
    const user = await connectionDB.query('SELECT * FROM users WHERE email=$1;', [email])
    if(!user.rows[0]){
        return res.status(401).send("Email não cadastrado!")
    }

    const passwordRight = bcrypt.compareSync(password, user.rows[0].password)
    if(!passwordRight){
        return res.status(401).send("Senha incorreta!")
    }

    const idUser = user.rows[0].id.toString();

    await connectionDB.query('INSERT INTO session ("userId", token) VALUES ($1, $2);',[idUser, token])

    const userOnline = {
        name: user.rows[0].name,
        token,
    }
    res.send(userOnline)
}catch(err){
    res.status(500).send(err.message)
}
}