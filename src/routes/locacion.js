const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database');

router.get('/locaciones-tipo/:id', (req, res) => {

    const { id } = req.params;
    const locacionesByTipo = `CALL locacionesByTipo(${id})`;
    mysqlConnection.query(locacionesByTipo, (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        }
        else {
            console.log(err);
        }
    })
})

module.exports = router;