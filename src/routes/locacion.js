const express = require('express');
const router = express.Router();
var bodyParser = require('body-parser')
var jsonParser = bodyParser.json();

const mysqlConnection = require('../database');

router.get('/locaciones-tipo/:id', (req, res) => {

    const { id } = req.params;
    const sp = `CALL locacionesByTipo(${id})`;
    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

router.get('/categorias', (req, res) => {

    const sp = `CALL categorias()`;
    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

router.get('/locaciones', (req, res) => {

    const sp = `CALL locaciones()`;
    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});
router.get('/locaciones-usuario/:usr', (req, res) => {
    console.log(req.params);
    const { usr } = req.params;
    console.log(usr);
    const sp = `CALL locaciones_por_usuario("${usr}")`;
    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

router.post('/crearlocacion', jsonParser, (req, res) => {
    const {
        nombre,
        direccion,
        ciudad,
        provincia,
        tipoLocacion,
        esPublica,
        usuario
    } = req.body;
    console.log(req.body);
    const sp = `CALL crear_locacion("${nombre}", "${direccion}", "${ciudad}", "${provincia}", "${tipoLocacion}", ${esPublica}, "${usuario}")`;
    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

router.get('/provincias', (req, res) => {

    const sp = `CALL provincias()`;
    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});


module.exports = router;