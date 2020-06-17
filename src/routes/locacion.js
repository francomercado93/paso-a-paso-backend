const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database');

router.get('/locaciones-tipo/:id', (req, res) => {

    const { id } = req.params;
    const sp = `CALL locacionesByTipo(${id})`;
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

// router.get('/locaciones-por-nombre/:nombre', (req, res) => {

//     const { nombre } = req.params;
//     console.log(req.params);
//     const sp = `CALL locacionesPorNombre(${nombre})`;
//     mysqlConnection.query(sp, (err, rows, fields) => {
//         if (!err) {
//             // Revisar
//             res.json(rows[0]);
//         }
//         else {
//             console.log(err);
//         }
//     })
// });

router.get('/categorias', (req, res) => {

    const sp = `CALL categorias()`;
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

router.get('/locaciones', (req, res) => {

    const sp = `CALL locaciones()`;
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