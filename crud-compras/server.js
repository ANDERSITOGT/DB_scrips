/**
 * ===========================================================
 *  Servidor Node.js – CRUD de Compras (PostgreSQL Heroku)
 *  Autor: Sławek & ChatGPT
 *  Descripción:
 *    API REST que se conecta a la base de datos "ganaderia"
 *    y ejecuta funciones almacenadas (crear, actualizar, eliminar,
 *    listar y obtener compras con detalles).
 * ===========================================================
 */

const express = require("express");
const bodyParser = require("body-parser");
const { Pool } = require("pg");
const path = require("path");

const app = express();

// Permitir recibir datos en formato JSON
app.use(bodyParser.json());

// Servir archivos estáticos (HTML, CSS, JS del frontend)
app.use(express.static(path.join(__dirname, "public")));

// ===========================================================
// 🔐 Conexión con la base de datos Heroku PostgreSQL
// ===========================================================
const pool = new Pool({
  connectionString:
    "postgres://uaqnjfoom6g0la:p6dc379ce4934a49eb6871ad64e72364fa69d765cdf56d173c6e2496beff5c40c@ca8lne8pi75f88.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com:5432/d63vkeok097gr6",
  ssl: { rejectUnauthorized: false } // Heroku requiere SSL
});

// ===========================================================
// 🟩 [1] CREAR COMPRA
// Llama a ganaderia.crear_compra() y devuelve el ID creado
// ===========================================================
app.post("/crear", async (req, res) => {
  const { proveedor_id, fecha, tipo_pago, total } = req.body;

  try {
    const result = await pool.query(
      "SELECT ganaderia.crear_compra($1, $2, $3, $4) AS id;",
      [proveedor_id, fecha, tipo_pago, total]
    );
    res.json({ ok: true, id: result.rows[0].id });
  } catch (err) {
    console.error("❌ Error al crear compra:", err);
    res.status(500).json({ ok: false, error: err.message });
  }
});

// ===========================================================
// 🟨 [2] ACTUALIZAR COMPRA
// Llama a ganaderia.actualizar_compra() con los datos nuevos
// ===========================================================
app.put("/actualizar", async (req, res) => {
  const { id_compra, proveedor_id, fecha, tipo_pago, total } = req.body;

  try {
    await pool.query(
      "SELECT ganaderia.actualizar_compra($1, $2, $3, $4, $5);",
      [id_compra, proveedor_id, fecha, tipo_pago, total]
    );
    res.json({ ok: true, message: "✅ Compra actualizada correctamente" });
  } catch (err) {
    console.error("❌ Error al actualizar compra:", err);
    res.status(500).json({ ok: false, error: err.message });
  }
});

// ===========================================================
// 🟥 [3] ELIMINAR COMPRA
// Llama a ganaderia.eliminar_compra() (elimina cascada)
// ===========================================================
app.delete("/eliminar/:id", async (req, res) => {
  const { id } = req.params;

  try {
    await pool.query("SELECT ganaderia.eliminar_compra($1);", [id]);
    res.json({ ok: true, message: "🗑️ Compra eliminada correctamente" });
  } catch (err) {
    console.error("❌ Error al eliminar compra:", err);
    res.status(500).json({ ok: false, error: err.message });
  }
});

// ===========================================================
// 🟦 [4] LISTAR TODAS LAS COMPRAS
// Ejecuta ganaderia.listar_compras()
// ===========================================================
app.get("/listar", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM ganaderia.listar_compras();");
    res.json(result.rows);
  } catch (err) {
    console.error("❌ Error al listar compras:", err);
    res.status(500).json({ ok: false, error: err.message });
  }
});

// ===========================================================
// 🟪 [5] OBTENER COMPRA POR ID
// Incluye los detalles de los productos
// ===========================================================
app.get("/obtener/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const result = await pool.query("SELECT * FROM ganaderia.obtener_compra($1);", [id]);
    res.json(result.rows);
  } catch (err) {
    console.error("❌ Error al obtener compra:", err);
    res.status(500).json({ ok: false, error: err.message });
  }
});

// ===========================================================
// 🚀 Iniciar servidor local
// ===========================================================
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`✅ Servidor corriendo en: http://localhost:${PORT}`);
});
