import express from "express";
import { addRumah, deleteRumah, editRumah, getRumah } from "../controllers/rumah.js";

const router = express.Router();

router.get('/rumah',getRumah);
router.post('/rumah',addRumah);
router.delete('/rumah',deleteRumah)
router.put('/rumah',editRumah);

export default router;
