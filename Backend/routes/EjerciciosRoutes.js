const express = require('express');
const ejerciciosController = require('../controllers/EjerciciosController'); // Importar el controlador de asignaturas
const router = express.Router();
// Definir las rutas específicas de ejercicios
router.get('/', ejerciciosController.getAllEjercicios);  // Ruta para obtener todos los ejercicios
router.post('/', ejerciciosController.postEjercicio);  // Ruta para crear un nuevo ejercicio
router.delete('/:idEjercicio', ejerciciosController.deleteEjercicio);  // Ruta para eliminar un ejercicio por ID
router.get('/:idEjercicio', ejerciciosController.getOneEjercicio);  // Ruta para obtener un ejercicio por ID
router.put('/:idEjercicio', ejerciciosController.updateEjercicio);  // Ruta para actualizar un ejercicio por ID
router.get('/asignatura/:idAsignatura', ejerciciosController.getEjerciciosByAsignatura);  // Ruta para obtener ejercicios de una asignatura
module.exports = router;