const express = require('express');
const router = express.Router();
const db = require('../db/connection');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const SECRET_KEY = 'dnd_secret_key_2024';

// POST /api/auth/registro
router.post('/registro', async (req, res) => {
  try {
    const { username, email, password } = req.body; // línea 1 - recoge los datos que envió Angular

    // Verificar si email ya existe
    const [emailExiste] = await db.query(           // línea 2 - pregunta a MySQL si el email existe
      'SELECT id FROM usuarios WHERE email = ?',    // línea 3 - consulta SQL
      [email],                                      // línea 4 - el email que vino del formulario
    );
    if (emailExiste.length) {                       // línea 5 - si ya existe
      return res.status(400).json({                 // línea 6 - devuelve error a Angular
        error: 'El email ya está registrado',
      });
    }

    // Verificar si username ya existe
    const [usernameExiste] = await db.query('SELECT id FROM usuarios WHERE username = ?', [
      username,
    ]);
    if (usernameExiste.length) {
      return res.status(400).json({ error: 'El nombre de usuario ya está en uso' });
    }

    // Encriptar contraseña
    const passwordHash = await bcrypt.hash(password, 10);

    const [resultado] = await db.query(
                                                    // línea 7 - inserta en MySQL
      'INSERT INTO usuarios (username, email, password_hash) VALUES (?, ?, ?)',
      [username, email, passwordHash],              // línea 8 - con estos valores
    );

    const token = jwt.sign(                         // línea 9 - crea un token JWT
      { id, username, email },                      // línea 10 - con los datos del usuario
      'dnd_secret_key_2024',                        // línea 11 - firmado con esta clave secreta
      { expiresIn: '24h' },                         // línea 12 - válido durante 24 horas
    );

    // línea 13 - devuelve el token y usuario a Angular
    res.json({
      mensaje: 'Usuario registrado correctamente',
      token,
      usuario: { id: resultado.insertId, username, email },
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error del servidor' });
  }
});

// POST /api/auth/login
router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    const [usuarios] = await db.query(
      'SELECT * FROM usuarios WHERE email = ?', [email]
    );
    if (!usuarios.length) {
      return res.status(401).json({ error: 'Email o contraseña incorrectos' });
    }

    const usuario = usuarios[0];

    const bcrypt = require('bcryptjs');
    const passwordValida = await bcrypt.compare(password, usuario.password_hash);
    if (!passwordValida) {
      return res.status(401).json({ error: 'Email o contraseña incorrectos' });
    }

    const jwt = require('jsonwebtoken');
    const token = jwt.sign(
      { id: usuario.id, username: usuario.username, email: usuario.email },
      'dnd_secret_key_2024',
      { expiresIn: '24h' }
    );

    res.json({
      mensaje: 'Login correcto',
      token,
      usuario: { id: usuario.id, username: usuario.username, email: usuario.email }
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

module.exports = router;
