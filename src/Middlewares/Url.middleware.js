import { UrlSchema } from "../Schemas/Url.schemas.js";

export async function ShchemaUrl(req, res, next){
    const url = req.body

    const {error} = UrlSchema.validate(url, {abortEarly: false})

    if(error){
        const error = error.details.map((detail)=> detail.message)
        return res.status(422).send(error)
    }

    next()
}