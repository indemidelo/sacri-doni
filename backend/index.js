import express from "express";
import pkg from "pg";
import cors from "cors";

const { Pool } = pkg;
const app = express();
app.use(cors());
app.use(express.json());

const pool = new Pool({
  connectionString: process.env.DATABASE_URL
});

app.post("/login", async (req,res) => {
  const { name, pin } = req.body;
  const r = await pool.query(
    "SELECT id, name FROM users WHERE name=$1 AND pin=$2",
    [name, pin]
  );
  if (r.rows.length === 0) return res.status(401).end();
  res.json(r.rows[0]);
});

app.get("/stats/readers", async (_,res) => {
  const r = await pool.query(`
    SELECT u.name, ROUND(AVG(r.rating),2) avg
    FROM reviews r JOIN users u ON r.reviewer_id=u.id
    GROUP BY u.name
  `);
  res.json(r.rows);
});

app.listen(process.env.PORT || 3000);