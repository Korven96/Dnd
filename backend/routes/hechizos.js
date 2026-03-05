const express = require('express');
const router = express.Router();
const db = require('../db/connection');

// GET /api/hechizos → Lista todos los hechizos
router.get('/', async (req, res) => {
  try {
    const [hechizos] = await db.query(`
      SELECT h.id, h.nombre, h.nivel, h.tiempo_lanzamiento,
             h.duracion, h.concentracion, em.nombre AS escuela
      FROM hechizos h
      JOIN escuelas_magia em ON em.id = h.escuela_id
      ORDER BY h.nivel, h.nombre
    `);
    res.json(hechizos);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener los hechizos' });
  }
});

// GET /api/hechizos/:id → Detalle completo de un hechizo
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [hechizo] = await db.query(`
      SELECT h.id, h.nombre, h.nivel, h.tiempo_lanzamiento,
             h.duracion, h.concentracion, h.descripcion,
             em.nombre AS escuela
      FROM hechizos h
      JOIN escuelas_magia em ON em.id = h.escuela_id
      WHERE h.id = ?
    `, [id]);

    if (!hechizo.length) return res.status(404).json({ error: 'Hechizo no encontrado' });

    res.json(hechizo[0]);

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});


module.exports = router;
