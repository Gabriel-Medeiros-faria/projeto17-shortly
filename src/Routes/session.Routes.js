import { Router } from "express";
import { login } from "../Controllers/session.controller.js";
const router = Router()

router.post("/signin", login)

export default router