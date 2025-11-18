const db = require('../db');


const config = require('../config').config;

const getAllImagenes = () => {
    return new Promise((resolve, reject) => {
        db.query('SELECT * FROM imagenes', (err, results) => {
            if (err) return reject(err);
            resolve(results);
        });
    });
};

const getOneImagen = (idImagen) => {
    return new Promise((resolve, reject) => {
        db.query('SELECT * FROM imagenes WHERE id = ?', [idImagen], (err, results) => {
            if (err) return reject(err);
            if (!results || results.length === 0) return reject({ status: 404, message: 'Imagen no encontrada' });
            resolve(results[0]);
        });
    });
};
const postImagen = (body) => {
    return new Promise((resolve, reject) => {
        const { nombre,descripcion,tipo } = body;
        if (!nombre) return reject({ status: 400, message: 'Nombre son requeridos' });
          // Extraer la extensión del nombre del archivo (sin el punto). Si no hay, dejar cadena vacía
    const extension = nombre.includes('.') ? nombre.split('.').pop() : '';
    console.log('Extensión extraída:', extension);
        const id = Date.now().toString(30) + Math.random().toString(30).substring(2);
        const nombrearchivo=id + (extension ? '.' + extension : '');
        console.log(nombrearchivo);
        db.query(
            'INSERT INTO imagenes (id, nombre,descripcion,tipo) VALUES (?, ?, ?, ?)',
            [id, nombrearchivo,descripcion,tipo], (err) => {
                if (err) return reject(err);
                resolve({ message: 'Imagen creada', imagen: { id, nombre, descripcion,tipo } });
            });
    });
};
const deleteImagen = (idImagen) => {
    return new Promise((resolve, reject) => {
        db.query('DELETE FROM imagenes WHERE id = ?', [idImagen], (err, results) => {
            if (err) return reject(err);
            if (results.affectedRows === 0) {
                return reject({ status: 404, message: 'Imagen no encontrada' });
            }
            resolve( {message: 'Imagen eliminada correctamente' });
        });
    });
};
module.exports = {
    getAllImagenes,
    getOneImagen,
    postImagen,
    deleteImagen
};