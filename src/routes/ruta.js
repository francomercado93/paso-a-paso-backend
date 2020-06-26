const express = require('express');
const router = express.Router();
var bodyParser = require('body-parser');

const mysqlConnection = require('../database');
const { json } = require('body-parser');

var jsonParser = bodyParser.json();

router.get('/rutas-por-locacion/:id', (req, res) => {

    const { id } = req.params;

    const sp = `CALL rutasPorLocacion(${id})`;

    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            // Revisar
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

router.get('/rutas/:id', (req, res) => {

    const { id } = req.params;

    const sp = `CALL rutaPorId(${id})`;

    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            // Revisar
            res.json(rows[0][0]);
        }
        else {
            console.log(err);
        }
    })
});

router.post('/rutas', (req, res) => {
    const {
        esPublica,
        locacion,
        nombre,
        usuario,
        fechaCreacion,
        descripcion,
        estado,
    } = req.body;
    const spRuta = `CALL nuevaRuta(${esPublica}, "${locacion}", "${nombre}", "${usuario}", "${fechaCreacion}", "${descripcion}", ${estado})`;
    mysqlConnection.query(spRuta, (err, result) => {
        if (!err) {
            const { id_ruta } = result[0][0];
            console.log(id_ruta);
            res.json(id_ruta);
        }
        else {
            res.sendStatus(400);
            console.log(err);
        }
    });
});

router.post('/instrucciones/:id', (req, res) => {

    const { id } = req.params;

    const { tipoInstruccion, cantidad, numeroInstruccion } = req.body;
    console.log(req.body);

    const spInstruccion = `CALL insertInstruccion(${id}, "${tipoInstruccion}", ${cantidad}, ${numeroInstruccion})`;

    mysqlConnection.query(spInstruccion, (err, rows) => {
        if (!err) {
            console.log("Insert correcto de instruccion");
            res.json(rows[0]);
        }
        else {
            res.sendStatus(400);
            console.log(err);
        }
    });
});


router.get('/rutas-usuario/:usuario', (req, res) => {

    const { usuario } = req.params;

    const sp = `CALL rutasUsuario("${usuario}")`;

    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

router.get('/instrucciones/:id', (req, res) => {

    const { id } = req.params;

    const sp = `CALL instruccionesRuta(${id})`;

    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            // Revisar
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

router.get('/tipos-instrucciones', (req, res) => {

    const sp = `CALL tiposInstrucciones()`;

    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

router.put('/publicar-ruta/:idRuta', jsonParser, (req, res) => {
    const { idRuta } = req.params;
    console.log(req.params);
    const sp = `CALL publicarRuta(${idRuta})`;
    mysqlConnection.query(sp, (err, rows) => {
        if (!err) {
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

router.get('/locacion/:id', (req, res) => {
    console.log(req.params);
    const { id } = req.params;
    const sp = `CALL locacionById(${id})`;
    mysqlConnection.query(sp, (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

router.post('/actualizarlocacion', jsonParser, (req, res) => {
    const {
        id,
        nombre,
        direccion,
        ciudad,
        provincia,
        tipoLocacion,
        esPublica,
        usuario
    } = req.body;
    console.log(req.body);
    const sp = `CALL actualizar_locacion("${id}", "${nombre}", "${direccion}", "${ciudad}", "${provincia}", "${tipoLocacion}", ${esPublica}, "${usuario}")`;
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