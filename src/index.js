const express = require('express');
const morgan = require('morgan');
const hbs = require('express-handlebars');
const path = require('path');


const router = require('./routes');


// inicializar express
const app = express()
const port = process.env.PORT || 4000;
app.set('views', path.join(__dirname,'views'));
app.engine('.hbs', hbs({
    defaultLayout: 'main',
    layoutDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname:'.hbs',
    helpers: require('./lib/helpers')
}));
app.set('view engine', '.hbs');

// Middleware
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

// Variables globales
app.use((req,res,next) => {
    next();
});

// Rutas
app.use('/', router);


//Publica
app.use(express.static(path.join(__dirname,'public')));


// Inicializacion de servidor
app.listen(port, () => console.log(`app listening on port: ${port}`))