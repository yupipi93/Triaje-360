const express = require('express');
const ejerciciosService = require('../services/EjerciciosServices'); // Importar el servicio de ejercicios
var jwt = require('../middlewares/validar-jwt');

// Obtener todos los ejercicios
const getAllEjercicios = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {    
        console.log(req.role);
        if (req.role !== 'admin' && req.role !== 'profesor' && req.role !== 'alumno') {
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            // Pasamos el email y el role del usuario autenticado al servicio
            const ejercicios = await ejerciciosService.getAllEjercicios(req.id, req.role);
            res.status(200).json(ejercicios);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};

const getOneEjercicio = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'profesor' && req.role !== 'alumno') { 
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            const ejercicio = await ejerciciosService.getOneEjercicio(req.params.idEjercicio);
            res.status(200).json(ejercicio);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};

const postEjercicio = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'profesor') {
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            const ejercicio = await ejerciciosService.postEjercicio(req.body);
            res.status(201).json(ejercicio);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};
const deleteEjercicio = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'profesor') {
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            await ejerciciosService.deleteEjercicio(req.params.idEjercicio);
            res.status(200).json({ message: 'Ejercicio eliminado correctamente' });
        } catch (error) {
            res.status(500).json({ message: error.message });
        }   
    });
};
const updateEjercicio = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'profesor') { 
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            const ejercicio = await ejerciciosService.updateEjercicio(req.params.idEjercicio, req.body);
            res.status(200).json(ejercicio);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};
const getEjerciciosByAsignatura = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'profesor' && req.role !== 'alumno') {
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            const ejercicios = await ejerciciosService.getEjerciciosByAsignatura(req.params.idAsignatura);
            res.status(200).json(ejercicios);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};

module.exports = {
    getAllEjercicios,
    getOneEjercicio,
    postEjercicio,
    deleteEjercicio,
    updateEjercicio,
    getEjerciciosByAsignatura
};
