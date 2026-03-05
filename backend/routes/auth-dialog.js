const express = require('express');
const router = express.Router();
const db = require('../db/connection');

// POST /api/auth-dialog/registro
router.post('/registro', async (req, res) => {
  try {
    const { username, email, password } = req.body;

    const query = 'INSERT INTO usuarios (username, email, password_hash) VALUES (?, ?, ?)';
    await db.query(query, [username, email, password]);

    res.json({ message: 'Usuario registrado exitosamente' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error del servidor' });
  }
});

module.exports = router;
