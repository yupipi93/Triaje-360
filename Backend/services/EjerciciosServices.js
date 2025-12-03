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
const getMaxOrden = (ejercicioId) => {
    return new Promise((resolve, reject) => {
        // Obtener el valor máximo de 'orden' para el ejercicio
        db.query('SELECT MAX(orden) as maxOrden FROM imagenes_ejercicio WHERE ejercicio = ?', [ejercicioId], (err, results) => {
            if (err) return reject(err);
            resolve(results[0].maxOrden || 0);  // Si no hay registros, devuelve 0
        });
    });
};
const postEjercicio = async (body, phaseId) => {
    return new Promise(async (resolve, reject) => {
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
                        resolve({
                            status: 200, message: "Ejercicio creado correctamente", ejercicio: {
                                id: id,
                                nombre: body.nombre,
                                descripcion: body.descripcion,
                                fechaInicio: body.fechaInicio,
                                fechaFin: body.fechaFin,
                                numerointentos: body.numerointentos,
                                asignatura: body.asignatura
                            }
                        });
                    });
                }

                break;
            case "2":
                console.log("es el caso 2");
                console.log(body.escenarios);

                var orden = 1;
                // Verificamos si body.escenarios es un array
                if (Array.isArray(body.escenarios)) {
                    console.log("es un array");
                    // Si es un array, recorremos cada imagen secuencialmente
                    for (let i = 0; i < body.escenarios.length; i++) {
                        const escenario = body.escenarios[i];
                        console.log("Insertando escenario:", escenario);

                        try {
                            // Realizamos la inserción de manera secuencial
                            await new Promise((resolve, reject) => {
                                db.query('INSERT INTO imagenes_ejercicio (imagen, ejercicio, orden) VALUES (?, ?, ?)', [escenario, body.ejercicio, orden], (err, results) => {
                                    if (err) {
                                        console.error("Error en la inserción:", err);
                                        return reject({ status: 500, error: err.message });
                                    }
                                    console.log("Orden:", orden);
                                    orden++;  // Incrementamos el orden para el siguiente escenario
                                    resolve(results);
                                });
                            });
                        } catch (err) {
                            // Si ocurre un error en alguna inserción, detenemos el proceso y lo informamos
                            console.error("Error al insertar escenario:", err);
                            return reject({ status: 500, message: err.message, error: err });
                        }
                    }

                    // Si todas las inserciones fueron exitosas
                    resolve({ status: 200, message: "Ejercicios creados correctamente" });
                } else {
                    console.log("no es un array");
                    // Si body.imagen no es un array, puedes hacer una sola inserción
                    console.log(body.imagen, body.ejercicio);  // Verifica los valores antes de la inserción
                    db.query('INSERT INTO imagenes_ejercicio (imagen, ejercicio) VALUES (?, ?)', [body.imagen, body.ejercicio], (err, results) => {
                        if (err) {
                            console.error("Error al crear el ejercicio:", err);
                            return reject({ status: 500, message: "Error al crear los ejercicios", error: err });
                        }
                        resolve({ status: 200, message: "Ejercicio creado correctamente", results });
                    });
                }

                break;
            default:
                return reject({ status: 400, message: 'PhaseId no valido' });
        }
    });
};




const getImagenes = async (tipo) => {
    return new Promise((resolve, reject) => {
        db.query('SELECT * FROM imagenes WHERE tipo = ?', [tipo], (err, results) => {
            if (err) return reject({ status: 500, message: "Error al obtener las imagenes", error: err });
            resolve(results);
        });
    });
}
module.exports = {
    getAllEjercicios,
    postEjercicio,
    getImagenes
}