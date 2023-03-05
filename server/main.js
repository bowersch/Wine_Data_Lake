const express = require('express');
const handlebars = require('express-handlebars');
<<<<<<< Updated upstream
=======
const cookieParser = require('cookie-parser');
const session = require('express-session');
const { client } = require("./dbConfig");
const bcrypt = require("bcrypt");
const flash = require('express-flash');
const passport = require('passport');
const queryHelper = require('./js/queryHelper.js');

//const secrets = require("./secrets.json");
const testData = require('./demo.json');

>>>>>>> Stashed changes
const app = express();
const port = 8080;

<<<<<<< Updated upstream
const testData = require('./demo.json')
=======
const initializePassport = require("./passportConfig");
initializePassport(passport);

/*
const { Client } = require("pg");


const client = new Client({
    host: '34.168.133.161',
    port: 5432,
    database: "postgres",
    user: secrets.user,
    password: secrets.password
});
*/
client.connect((err) => {
    if(err) {
        console.error('connection error', err.stack)
    } else {
        console.log('connected')
    }
});
>>>>>>> Stashed changes

app.set('view engine', 'handlebars');

app.engine('handlebars', handlebars.engine({
    layoutsDir: './views/layouts/'
}));

<<<<<<< Updated upstream
app.use(express.static('public'))

app.get('/wines/*', (req, res) => {
    res.render('wineEntry', {
        layout : 'main',
        css: ["wineEntry.css"],
        data: testData
    });
});

app.get('/directory/*', (req, res) => {
    res.render('directory', {
        layout: 'main',
        css: ["directory.css"],
        data: testData
    });
});
=======
app.use(express.urlencoded({ extended: false }));
app.use(express.static('public'));
//app.use(cookieParser());
app.use(session({
    secret: "thisismysecrctekeyfhrgfgrfrty84fwir767",
    saveUninitialized: true,
    resave: false 
}));

app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

app.use((req, res, next) => {
    res.locals.pack = {
        template: null,
        config: {
            layout: 'main',
            css: null,
            js: null,
            data: null,
            user: req.session.username ? req.session.username : null
        }
    };
    next();
});

require('./js/routes.js')(app, client, queryHelper, passport, bcrypt, flash);
>>>>>>> Stashed changes

app.get('/favorites/*', (req, res) => {
    res.render('userFavorites', {
        layout: 'main',
        css: ["userFavorites.css"],
        data: testData
    });
});

app.get('/about*', (req, res) => {
    res.render('about', {
        layout: 'main',
        css: ["about.css"],
        data: testData
    });
});

app.get('/contact*', (req, res) => {
    res.render('contact', {
        layout: 'main',
        css: ["about.css"],
        data: testData
    });
});

app.get('/developers*', (req, res) => {
    res.render('developers', {
        layout: 'main',
        css: ["about.css"],
        data: testData
    });
});

app.get('/help*', (req, res) => {
    res.render('help', {
        layout: 'main',
        css: ["about.css"],
        data: testData
    });
});

app.get('/*', (req, res) => {
    res.render('demo', {layout : 'main', css: ["demo.css"]});
});

app.listen(port, () => console.log(`App open at http://localhost:${port}/`));
