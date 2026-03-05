const path = require('path');

const config = {
  PORT: process.env.PORT || 3000,
  SALT_ROUNDS: parseInt(process.env.SALT_ROUNDS || '10'),
  JWT_SECRET: process.env.JWT_SECRET || 'your_jwt_secret_key',
};

const routes = {
  HOME: '/',
  API: '/api',
  ASSETS: process.env.ASSETS_PATH || path.join(__dirname, '../Frontend/src/assets'),
};

const admin = {
  email: process.env.ADMIN_EMAIL || 'admin@gmail.com',
  nickname: process.env.ADMIN_NICKNAME || 'admin',
  password: process.env.ADMIN_PASSWORD || 'admin123',
  role: 'admin',
};

const bbdd = {
  HOST: process.env.DB_HOST || 'localhost',
  USER: process.env.DB_USER || 'TFG',
  PASSWORD: process.env.DB_PASSWORD || 'cereza2610',
  DATABASE: process.env.DB_NAME || 'tfg',
  PORT: parseInt(process.env.DB_PORT || '3306'),
};

module.exports = { config, routes, bbdd, admin };