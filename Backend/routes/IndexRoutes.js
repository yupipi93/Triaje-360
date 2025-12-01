const express = require('express');
const userRoutes = require('./UserRoutes');
const asignatureRoutes = require('./AsignaturasRoutes');
const ejercicioRoutes = require('./EjerciciosRoutes');
const router = express.Router();

// Enlazar las rutas específicas bajo la ruta base '/api'
router.use('/users', userRoutes);    // Rutas para usuarios
router.use('/asignatures', asignatureRoutes); // Rutas para asignaturas
router.use('/ejercicios', ejercicioRoutes); // Rutas para ejercicios
module.exports = router;