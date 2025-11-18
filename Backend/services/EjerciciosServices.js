const db = require('../db');


const config = require('../config').config;

// Servicio de ejercicios
const getAllEjercicios = (email, role) => {
	return new Promise((resolve, reject) => {
		// Buscar usuario por email para obtener su id
		db.query('SELECT * FROM users WHERE email = ?', [email], (err, users) => {
			if (err) return reject(err);
			if (!users || users.length === 0) {
				return reject({ status: 404, message: 'Usuario no encontrado' });
			}
			const user = users[0];

			// Si es admin devolvemos todas las asignaturas con sus ejercicios
			if (role === 'admin') {
				const sql = `SELECT a.id AS asignatura_id, a.nombre AS asignatura_nombre, e.*
										 FROM asignatura a
										 LEFT JOIN ejercicios e ON e.asignatura = a.id GROUP BY a.id`;
				db.query(sql, (err, results) => {
					if (err) return reject(err);
					
					resolve(results);
				});
			} else {
				// Para profesores (y alumnos) devolvemos las asignaturas en las que está matriculado
				const sql = `SELECT a.id AS asignatura_id, a.nombre AS asignatura_nombre, e.*
										 FROM asignatura a
										 JOIN user_asignatura ua ON ua.asignatura = a.id
										 LEFT JOIN ejercicios e ON e.asignatura = a.id
										 WHERE ua.usuario = ? GROUP BY a.id`;
				db.query(sql, [user.id], (err, results) => {
					if (err) return reject(err);
					const grouped = groupByAsignatura(results);
					resolve(grouped);
				});
			}
		});
	});
};

// Agrupa filas SQL por asignatura: devuelve [{ asignatura: { id, nombre }, ejercicios: [...] }, ...]


const getOneEjercicio = (idEjercicio) => {
	return new Promise((resolve, reject) => {
		db.query('SELECT * FROM ejercicios WHERE id = ?', [idEjercicio], (err, results) => {
			if (err) return reject(err);
			if (!results || results.length === 0) return reject({ status: 404, message: 'Ejercicio no encontrado' });
			resolve(results[0]);
		});
	});
};

const postEjercicio = (body) => {
	return new Promise((resolve, reject) => {
		const { titulo, asignatura, descripcion, imagenes, pacientes } = body;
		if (!titulo || !asignatura) return reject({ status: 400, message: 'Titulo y asignatura son requeridos' });
		const id = Date.now().toString(30) + Math.random().toString(30).substring(2);
		// Insert básico; los campos dependen de la estructura real de la tabla
		db.query('INSERT INTO ejercicios (id, titulo, asignatura, descripcion) VALUES (?, ?, ?, ?)', [id, titulo, asignatura, descripcion || null], (err) => {
			if (err) return reject(err);
			
		});
	});
};



module.exports = {
	getAllEjercicios,
	getOneEjercicio,
	postEjercicio
};