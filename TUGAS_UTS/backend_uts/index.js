import express from "express";
import cors from "cors";
import { json, static as expressStatic } from "express"; // Gunakan alias untuk menghindari konflik dengan kata kunci JavaScript 'static'

import router from "./routes/index.js"; // Perhatikan penggunaan import hanya sekali

const app = express();

const allowedOrigins = ["http://example.com", "http://localhost:3000"]; // Update dengan origin yang diizinkan

app.use(cors({
  credentials: true,
  origin: (origin, callback) => {
    if (!origin || allowedOrigins.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error("Not allowed by CORS"));
    }
  },
}));

app.use(json()); // Menggunakan JSON middleware untuk parsing body request dengan format JSON
app.use(expressStatic("public")); // Gunakan alias expressStatic

app.use(router); // Gunakan router dari file routes/index.js

app.listen(5000, () => console.log("Server running at port 5000"));
