const express = require('express');
const router = express.Router();
const db = require('../db/connection');

// GET /api/monstruos → Lista todos los monstruos
router.get('/', async (req, res) => {
  try {
    const [monstruos] = await db.query(`
      SELECT m.id, m.nombre, tc.nombre AS tipo, m.desafio
      FROM monstruos m
      JOIN tipos_criatura tc ON tc.id = m.tipo_id
    `);
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
    // 1. Datos básicos con JOINs
    const [monstruo] = await db.query(`
      SELECT
        m.id,
        m.nombre,
        tc.nombre AS tipo,
        a.nombre AS alineamiento,
        t.nombre AS tamano,
        m.clase_armadura,
        m.puntos_golpe,
        m.velocidad,
        m.bonificador_competencia,
        m.desafio,
        m.percepcion_pasiva,
        m.descripcion
      FROM monstruos m
      JOIN tipos_criatura tc ON tc.id = m.tipo_id
      JOIN alineamientos a ON a.id = m.alineamiento_id
      JOIN tamanos t ON t.id = m.tamano_id
      WHERE m.id = ?
    `, [id]);

    if (!monstruo.length) return res.status(404).json({ error: 'Monstruo no encontrado' });

    // 2. Atributos
    const [atributos] = await db.query(`
      SELECT a.nombre, ma.valor
      FROM monstruo_atributos ma
      JOIN atributos a ON a.id = ma.atributo_id
      WHERE ma.monstruo_id = ?
    `, [id]);

    // 3. Habilidades
    const [habilidades] = await db.query(`
      SELECT h.nombre, mh.modificador
      FROM monstruo_habilidades mh
      JOIN habilidades h ON h.id = mh.habilidad_id
      WHERE mh.monstruo_id = ?
    `, [id]);

    // 4. Rasgos
    const [rasgos] = await db.query(`
      SELECT r.nombre, r.descripcion
      FROM monstruo_rasgos mr
      JOIN rasgos r ON r.id = mr.rasgo_id
      WHERE mr.monstruo_id = ?
    `, [id]);

    // 5. Acciones
    const [acciones] = await db.query(`
      SELECT nombre, descripcion, tipo
      FROM monstruo_acciones
      WHERE monstruo_id = ?
    `, [id]);

    // 6. JSON estructurado
    res.json({
      ...monstruo[0],
      atributos,
      habilidades,
      rasgos,
      acciones
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

module.exports = router;
