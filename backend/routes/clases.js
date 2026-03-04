const express = require('express');
const router = express.Router();
const db = require('../db/connection');

// GET /api/clases → Lista todas las clases
router.get('/', async (req, res) => {
  try {
    const [clases] = await db.query(`
      SELECT id, nombre, descripcion, dado_golpe, tipo_lanzador,
             color_primario, color_secundario, icono
      FROM clases
    `);
    res.json(clases);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener las clases' });
  }
});

// GET /api/clases/:id
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [clase] = await db.query(
      `
      SELECT id, nombre, descripcion, dado_golpe, tipo_lanzador,
             color_primario, color_secundario, icono
      FROM clases WHERE id = ?
    `,
      [id],
    );

    if (!clase.length) return res.status(404).json({ error: 'Clase no encontrada' });

    // 2. Rasgos de la clase con nivel requerido
    const [rasgos] = await db.query(
      `
      SELECT r.nombre, r.descripcion, cr.nivel_requerido
      FROM clase_rasgos cr
      JOIN rasgos r ON r.id = cr.rasgo_id
      WHERE cr.clase_id = ?
      ORDER BY cr.nivel_requerido
    `,
      [id],
    );

    // 3. Subclases
    const [subclases] = await db.query(
      `
      SELECT id, nombre, descripcion
      FROM subclases
      WHERE clase_id = ?
    `,
      [id],
    );

    // 4. Rasgos de cada subclase
    for (let subclase of subclases) {
      const [rasgosSubclase] = await db.query(
        `
        SELECT r.nombre, r.descripcion, sr.nivel_requerido
        FROM subclase_rasgos sr
        JOIN rasgos r ON r.id = sr.rasgo_id
        WHERE sr.subclase_id = ?
        ORDER BY sr.nivel_requerido
      `,
        [subclase.id],
      );
      subclase.rasgos = rasgosSubclase;
    }

    // 5. Hechizos (si la clase tiene)
    const [hechizos] = await db.query(
      `
      SELECT h.id, h.nombre
      FROM clase_hechizos ch
      JOIN hechizos h ON h.id = ch.hechizo_id
      WHERE ch.clase_id = ?
    `,
      [id],
    );

    // 6. JSON estructurado
    res.json({
      ...clase[0],
      rasgos,
      subclases,
      hechizos,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

module.exports = router;
