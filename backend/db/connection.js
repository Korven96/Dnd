const mysql = require('mysql2/promise');

const db = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '', // En WAMP por defecto está vacía
  database: 'dnd',
});

module.exports = db;
