const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database');

router.get('/usuario', (req, res) => {

    const { usuario, password } = req.body;
    console.log(req.body);
    const sp = `CALL usuarioLogin(${usuario}, ${password})`;

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