import { Router } from "express";
import { login } from "../Controllers/session.controller.js";
const router = Router()

router.post("/session", login)

export default router