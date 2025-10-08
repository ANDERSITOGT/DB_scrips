/**
 * ===========================================================
 *  script.js – Lógica del frontend
 *  Autor: Sławek & ChatGPT
 *  Descripción:
 *    Este archivo se comunica con el servidor Node.js
 *    para ejecutar los procedimientos almacenados
 *    del esquema ganaderia (crear, actualizar, eliminar,
 *    listar y obtener compras).
 * ===========================================================
 */

// ---------------- [1] CREAR COMPRA ----------------
async function crearCompra() {
  const data = {
    proveedor_id: document.getElementById("proveedor_id").value,
    fecha: document.getElementById("fecha").value,
    tipo_pago: document.getElementById("tipo_pago").value,
    total: document.getElementById("total").value
  };

  const res = await fetch("/crear", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data)
  });

  const json = await res.json();
  alert(json.ok ? `✅ Compra creada con ID: ${json.id}` : `❌ Error: ${json.error}`);
}

// ---------------- [2] ACTUALIZAR COMPRA ----------------
async function actualizarCompra() {
  const data = {
    id_compra: document.getElementById("act_id_compra").value,
    proveedor_id: document.getElementById("act_proveedor_id").value,
    fecha: document.getElementById("act_fecha").value,
    tipo_pago: document.getElementById("act_tipo_pago").value,
    total: document.getElementById("act_total").value
  };

  const res = await fetch("/actualizar", {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data)
  });

  const json = await res.json();
  alert(json.ok ? json.message : `❌ Error: ${json.error}`);
}

// ---------------- [3] ELIMINAR COMPRA ----------------
async function eliminarCompra() {
  const id = document.getElementById("elim_id").value;
  const res = await fetch(`/eliminar/${id}`, { method: "DELETE" });
  const json = await res.json();
  alert(json.ok ? json.message : `❌ Error: ${json.error}`);
}

// ---------------- [4] LISTAR TODAS LAS COMPRAS ----------------
async function listarCompras() {
  const res = await fetch("/listar");
  const data = await res.json();
  document.getElementById("resultado").textContent = JSON.stringify(data, null, 2);
}

// ---------------- [5] OBTENER COMPRA DETALLADA ----------------
async function buscarCompra() {
  const id = document.getElementById("buscar_id").value;
  const res = await fetch(`/obtener/${id}`);
  const data = await res.json();
  document.getElementById("detalle").textContent = JSON.stringify(data, null, 2);
}
