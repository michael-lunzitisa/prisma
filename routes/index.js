import Router from "express";
import ApprenantRoutes from "apprenantRoutes.js";
const router = Router();

router.use("api/apprenant", ApprenantRoutes);

export default router;
