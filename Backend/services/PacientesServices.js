const db = require('../db');
const config = require('../config').config;

const getPacientes = async () => {
    return new Promise((resolve, reject) => {
        db.query('SELECT * FROM Pacientes', (err, results) => {
            if (err) return reject(err);
            resolve(results);
        });
    });
};

const createPaciente = async (body) => {
    const accionesPacientes = body.accionesPacientes;
    const idPaciente = Date.now().toString(30) + Math.random().toString(30).substring(2);
    console.log(body.tiempoEmpeoramiento);
    return new Promise(async (resolve, reject) => {
        db.query('INSERT INTO Pacientes(id,nombre,descripcion,color,Tempeora) VALUES (?, ?, ?, ?, ?)', [idPaciente, body.nombre, body.descripcion, body.color, body.tiempoEmpeoramiento], async (err, results) => {
            if (err) return reject(err);

            // Si el insert de paciente ha ido bien, verificar si accionesPacientes es un array
            if (Array.isArray(accionesPacientes)) {
                // Iterar sobre cada acción y añadirla a la tabla acciones_paciente
                for (let i = 0; i < accionesPacientes.length; i++) {
                    const accionId = accionesPacientes[i];

                    try {
                        // Insertar cada acción de manera secuencial
                        await new Promise((resolveAccion, rejectAccion) => {
                            db.query('INSERT INTO acciones_paciente (paciente_id, acciones_id) VALUES (?, ?)', [idPaciente, accionId], (errAccion, resultsAccion) => {
                                if (errAccion) {
                                    console.error("Error al insertar acción:", errAccion);
                                    return rejectAccion(errAccion);
                                }
                                resolveAccion(resultsAccion);
                            });
                        });
                    } catch (errAccion) {
                        // Si ocurre un error al insertar una acción, lo informamos
                        console.error("Error al insertar acción del paciente:", errAccion);
                        return reject({ status: 500, message: "Error al insertar acciones del paciente", error: errAccion });
                    }
                }
            }

            resolve(results);
        });
    });
};

module.exports = {
    getPacientes,
    createPaciente
};