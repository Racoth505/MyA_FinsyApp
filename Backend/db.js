const mysql = require('mysql2/promise');

const db = mysql.createPool({
  // Si no existe la variable de entorno, usará 'localhost' por defecto (para desarrollo local)
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || 'contraseña',
  database: process.env.DB_NAME || 'Finanzas',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

module.exports = db;