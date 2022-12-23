import joi from "joi";

export const UrlSchema = joi.object({
    url: joi.string().required().uri()
})