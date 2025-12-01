const express = require('express');
const EjerciciosController = require('../controllers/EjerciciosController');
const router = express.Router();

router.get('/', EjerciciosController.getAllEjercicios);
router.post('/phase/:phaseId', EjerciciosController.postEjercicio);
router.delete('/:idEjercicio', EjerciciosController.deleteEjercicio);
router.get('/:idEjercicio', EjerciciosController.getOneEjercicios);
router.put('/:idEjercicio', EjerciciosController.updateEjercicio);
router.get('/asignaturas/:idAsignatura', EjerciciosController.getEjerciciosFromAsignatura);

module.exports = router;