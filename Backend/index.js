const express = require('express');
const app = express();
const cors = require('cors');
const fileUpload = require('express-fileupload');


const indexRoutes = require('./routes/IndexRoutes');  // Importar las rutas generales
var {config,routes} = require('./config.js')
app.use(express.json());
app.use(cors());
app.use(routes.API, indexRoutes);  // Aquí usamos el archivo de rutas general

app.use(fileUpload({
    limits: { fileSize: 5 * 1024 * 1024 }, //limita el tam max de img
    createParentPath: true,
}));

const userController = require('./controllers/UserController'); // Importar el controlador de usuarios
userController.iniUser0();

app.listen(config.PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${config.PORT}`);
});




