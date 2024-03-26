import { Router, Router } from "express";
import { createApprenant } from "../Controller/apprenantController";
const router = Router();

router.post("/", createApprenant);

export default router;
