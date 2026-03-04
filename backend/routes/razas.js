const express = require('express');
const router = express.Router();
const db = require('../db/connection');

// GET /api/razas → Lista todas las razas
router.get('/', async (req, res) => {
  try {
    const [razas] = await db.query(`
      SELECT r.id, r.nombre, r.descripcion, t.nombre AS tamano, r.velocidad_base
      FROM razas r
      JOIN tamanos t ON t.id = r.tamano_id
    `);
    res.json(razas);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener las razas' });
  }
});

// GET /api/razas/:id → Detalle completo de una raza
router.get('/:id', async (req, res) => {
  const { id } = req.params;

  try {
    // 1. Datos básicos
    const [raza] = await db.query(
      `
      SELECT r.id, r.nombre, r.descripcion, t.nombre AS tamano, r.velocidad_base
      FROM razas r
      JOIN tamanos t ON t.id = r.tamano_id
      WHERE r.id = ?
    `,
      [id],
    );

    if (!raza.length) return res.status(404).json({ error: 'Raza no encontrada' });

    // 2. Rasgos
    const [rasgos] = await db.query(
      `
      SELECT ra.nombre, ra.descripcion
      FROM raza_rasgos rr
      JOIN rasgos ra ON ra.id = rr.rasgo_id
      WHERE rr.raza_id = ?
    `,
      [id],
    );

    // 3. Bonificadores de raza
    const [bonificadores] = await db.query(
      `
      SELECT a.nombre AS atributo, rb.valor, rb.tipo, rb.descripcion
      FROM razas_bonificadores rb
      LEFT JOIN atributos a ON a.id = rb.atributo_id
      WHERE rb.raza_id = ?
    `,
      [id],
    );

    // 4. Idiomas
    const [idiomas] = await db.query(
      `
        SELECT i.nombre
        FROM raza_idiomas ri
        JOIN idiomas i ON i.id = ri.idioma_id
        WHERE ri.raza_id = ?
      `,
      [id],
    );

    // 5. Subrazas
    const [subrazas] = await db.query(
      `
      SELECT s.id, s.nombre, s.descripcion
      FROM subrazas s
      WHERE s.raza_id = ?
    `,
      [id],
    );

    // 6. Bonificadores de cada subraza
    for (let subraza of subrazas) {
      const [bonificadoresSubraza] = await db.query(
        `
        SELECT a.nombre AS atributo, sb.valor, sb.tipo, sb.descripcion
        FROM subrazas_bonificadores sb
        LEFT JOIN atributos a ON a.id = sb.atributo_id
        WHERE sb.subraza_id = ?
      `,
        [subraza.id],
      );
      subraza.bonificadores = bonificadoresSubraza;
    }

    // 7. JSON estructurado
    res.json({
      ...raza[0],
      rasgos,
      bonificadores,
      idiomas,
      subrazas,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

module.exports = router;
