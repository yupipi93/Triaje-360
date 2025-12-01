const db = require('../db');
const config = require('../config').config;

const getAllEjercicios = async () => {
    return new Promise((resolve, reject) => {
        db.query('SELECT * FROM ejercicios', (err, results) => {
            if (err) return reject(err);
            resolve(results);
        });
    });
};
const postEjercicio = async (body, phaseId) => {
    return new Promise((resolve, reject) => {
        if (!body || !phaseId) {
            return reject({ status: 400, message: 'Body y phaseId son requeridos' });
        }
        console.log(phaseId);
        switch (phaseId) {
            case "1":
                const id = Date.now().toString(30) + Math.random().toString(30).substring(2);
                if (body.numerointentos) {
                    db.query('INSERT INTO ejercicios (id,nombre, descripcion, fechaInicio, fechaFin, numerointentos,asignatura) VALUES (?, ?, ?, ?, ?, ?,?) ', [id, body.nombre, body.descripcion, body.fechaInicio, body.fechaFin, body.numerointentos, body.asignatura], (err, results) => {
                        if (err) return reject(err);
                        resolve({ status: 200, message: "Ejercicio creado correctamente", results });
                    });
                }
                else {
                    db.query('INSERT INTO ejercicios (id, nombre, descripcion, fechaInicio, fechaFin, numerointentos,asignatura) VALUES (?, ?, ?, ?, ?, ?,?) ', [id, body.nombre, body.descripcion, body.fechaInicio, body.fechaFin, 0, body.asignatura], (err, results) => {
                        if (err) return reject(err);
                        resolve({ status: 200, message: "Ejercicio creado correctamente", results });
                    });
                }

                break;
            default:
                return reject({ status: 400, message: 'PhaseId no valido' });
        }
    });
};

module.exports = {
    getAllEjercicios,
    postEjercicio
}