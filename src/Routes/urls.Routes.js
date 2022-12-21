import { Router } from "express";
import { create, findById, openUrl, deleteUrl } from "../Controllers/urls.controller.js";
const router = Router()

router.post("/urls/shorten", create)
router.get("/urls/:id", findById)
router.get("/urls/open/:shortUrl", openUrl)
router.delete("/urls/:id", deleteUrl)
export default router