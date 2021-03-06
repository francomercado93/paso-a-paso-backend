const express = require('express')
const app = express();

// Settings
app.set('port', process.env.PORT || 3000);

// Middlewares
app.use(express.json());
// app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
// app.use(bodyParser.json())

// Routes
app.use(require('./routes/locacion'));
app.use(require('./routes/ruta'));
app.use(require('./routes/usuario'));
// Starting the server


app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});