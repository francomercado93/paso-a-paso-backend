const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database');

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
    
    // const { id, nombre } = req.params;
    console.log(req.body)
    res.json()
    // const sp = `CALL rutaPorId(${id})`;
    
    // mysqlConnection.query(sp, (err, rows, fields) => {
    //     if (!err) {
    //         // Revisar
    //         res.json(rows[0][0]);
    //     }
    //     else {
    //         console.log(err);
    //     }
    // })
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