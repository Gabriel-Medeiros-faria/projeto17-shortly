import { Router } from "express";
import { create, FindUserInfo, ranking} from "../Controllers/users.controller.js";
const router = Router()

router.post("/signup", create)
router.get("/users/me", FindUserInfo)
router.get("/ranking", ranking)
export default router