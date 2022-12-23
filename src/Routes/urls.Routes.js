import { Router } from "express";
import { create, findById, openUrl, deleteUrl } from "../Controllers/urls.controller.js";
import {ShchemaUrl} from "../Middlewares/Url.middleware.js"
const router = Router()

router.post("/urls/shorten", ShchemaUrl, create)
router.get("/urls/:id", findById)
router.get("/urls/open/:shortUrl", openUrl)
router.delete("/urls/:id", deleteUrl)
export default router