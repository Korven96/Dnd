const mysql = require('mysql2/promise');

const db = mysql.createPool({
  host: 'localhost', // MySQL está en tu propio ordenador
  user: 'root', // Usuario por defecto de WAMP
  password: '', // Sin contraseña en local
  database: 'dnd', // Nombre de tu base de datos
});

module.exports = db;
