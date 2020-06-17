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
            res.json(rows[0]);
        }
        else {
            console.log(err);
        }
    })
});

module.exports = router;