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

router.post('/rutas', jsonParser, (req, res) => {
    const {
        esPublica,
        locacion,
        nombre,
        usuario,
        fechaCreacion,
        descripcion,
        estado,
        instrucciones
    } = req.body;
    const spRuta = `CALL nuevaRuta(${esPublica}, "${locacion}", "${nombre}", "${usuario}", "${fechaCreacion}", "${descripcion}", ${estado})`;
    mysqlConnection.query(spRuta, (err, result) => {
        if (!err) {
            const { id_ruta } = result[0][0];
            console.log(id_ruta);
            instrucciones.forEach(inst => {
                const spInstruccion = `CALL insertInstruccion(${id_ruta}, "${inst.tipoInstruccion}", ${inst.cantidad})`;
                mysqlConnection.query(spInstruccion, err => {
                    if (!err) {
                        console.log("Insert correcto de instruccion");
                    }
                    else {
                        res.sendStatus(400).error("Ocurrio un error al ingresar instrucciones a la bd");
                        console.log(err);
                    }
                });
            })
            res.sendStatus(202);
        }
        else {
            res.sendStatus(400).error("Ocurrio un error al ingresar la ruta a la bd");
            console.log(err);
        }
    });
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

module.exports = router;