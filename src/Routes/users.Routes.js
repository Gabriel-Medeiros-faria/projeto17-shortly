import { Router } from "express";
import { create, FindUserInfo} from "../Controllers/users.controller.js";
const router = Router()

router.post("/signup", create)
router.get("/users/me", FindUserInfo)
export default router