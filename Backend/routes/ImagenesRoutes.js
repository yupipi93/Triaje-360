const express = require('express');
const imagenesController = require('../controllers/ImagenesController'); // Importar el controlador de imágenes
const router = express.Router();
// Definir las rutas específicas de imágenes
router.get('/', imagenesController.getAllImagenes);
router.post('/', imagenesController.postImagen);
router.delete('/:idImagen', imagenesController.deleteImagen);
router.get('/:idImagen', imagenesController.getOneImagen);

module.exports = router;