const mysql = require('mysql2');
const { bbdd } = require('./config.js');

const pool = mysql.createPool({
  host: bbdd.HOST,
  user: bbdd.USER,
  password: bbdd.PASSWORD,
  database: bbdd.DATABASE,
  port: bbdd.PORT,
  ssl: { rejectUnauthorized: false },
  waitForConnections: true,
  connectionLimit: 5,
  queueLimit: 0,
});

pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error de conexión a la base de datos:', err);
  } else {
    console.log('Conectado a la base de datos');
    connection.release();
  }
});

module.exports = pool;