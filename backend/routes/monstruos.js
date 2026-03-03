const express = require('express');
const router = express.Router();
const db = require('../db/connection');

// GET /api/monstruos → Lista todos los monstruos
router.get('/', async (req, res) => {
  try {
    const [monstruos] = await db.query('SELECT id, nombre, tipo, desafio FROM monstruos');
    res.json(monstruos);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener los monstruos' });
  }
});

// GET /api/monstruos/:id → Ficha completa de un monstruo
router.get('/:id', async (req, res) => {
  const { id } = req.params;

  try {
    // 1. Datos básicos
    const [monstruo] = await db.query('SELECT * FROM monstruos WHERE id = ?', [id]);
    if (!monstruo.length) return res.status(404).json({ error: 'Monstruo no encontrado' });

    // 2. Atributos
    const [atributos] = await db.query(
      `
      SELECT a.nombre, ma.valor
      FROM monstruo_atributos ma
      JOIN atributos a ON a.id = ma.atributo_id
      WHERE ma.monstruo_id = ?`,
      [id],
    );

    // 3. Habilidades
    const [habilidades] = await db.query(
      `
      SELECT h.nombre, mh.modificador
      FROM monstruo_habilidades mh
      JOIN habilidades h ON h.id = mh.habilidad_id
      WHERE mh.monstruo_id = ?`,
      [id],
    );

    // 4. Rasgos
    const [rasgos] = await db.query(
      `
      SELECT r.nombre, r.descripcion
      FROM monstruo_rasgos mr
      JOIN rasgos r ON r.id = mr.rasgo_id
      WHERE mr.monstruo_id = ?`,
      [id],
    );

    // 5. Acciones
    const [acciones] = await db.query(
      `
      SELECT nombre, descripcion, tipo
      FROM monstruo_acciones
      WHERE monstruo_id = ?`,
      [id],
    );

    // 6. JSON estructurado
    res.json({
      ...monstruo[0],
      atributos,
      habilidades,
      rasgos,
      acciones,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

module.exports = router;
