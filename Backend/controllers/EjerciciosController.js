const express = require('express');
const EjerciciosService = require('../services/EjerciciosServices'); // Importar el servicio de usuarios
var jwt = require('../middlewares/validar-jwt');

const getAllEjercicios = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'prof') {
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            const ejercicios = await EjerciciosService.getAllEjercicios();
            res.status(200).json(ejercicios);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};

const postEjercicio = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'prof') {
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            const ejercicio = await EjerciciosService.postEjercicio(req.body, req.params.phaseId);
            res.status(200).json(ejercicio);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};

const deleteEjercicio = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'prof') {
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            const ejercicio = await EjerciciosService.deleteEjercicio(req.params.id);
            res.status(200).json(ejercicio);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};

const getOneEjercicios = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'prof') {
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            const ejercicio = await EjerciciosService.getOneEjercicios(req.params.id);
            res.status(200).json(ejercicio);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};

const updateEjercicio = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'prof') {
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            const ejercicio = await EjerciciosService.updateEjercicio(req.params.id, req.body);
            res.status(200).json(ejercicio);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};

const getEjerciciosFromAsignatura = async (req, res) => {
    jwt.comprobartoken(req, res, async function () {
        if (req.role !== 'admin' && req.role !== 'prof') {
            return res.status(403).json({ message: 'Acceso denegado' });
        }
        try {
            const ejercicios = await EjerciciosService.getEjerciciosFromAsignatura(req.params.id);
            res.status(200).json(ejercicios);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    });
};

module.exports = {
    getAllEjercicios,
    postEjercicio,
    deleteEjercicio,
    getOneEjercicios,
    updateEjercicio,
    getEjerciciosFromAsignatura
};
