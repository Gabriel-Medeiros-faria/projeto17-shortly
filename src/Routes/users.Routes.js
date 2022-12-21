import { Router } from "express";
import { create } from "../Controllers/users.controller.js";
const router = Router()

router.post("/users", create)

export default router