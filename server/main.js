const express = require('express');
const handlebars = require('express-handlebars');
const cookieParser = require('cookie-parser');
const session = require('express-session');

const queryHelper = require('./js/queryHelper.js');

const secrets = require("./secrets.json");

const bcrypt = require("bcrypt");
const flash = require('express-flash');
const passport = require('passport');

const testData = require('./demo.json');

const app = express();
const port = process.env.PORT || 8080;

const initializePassport = require("./passportConfig");
initializePassport(passport);


const { Client } = require("pg");


const client = new Client({
    host: '34.168.239.168',
    port: 5432,
    database: "postgres",
    user: secrets.user,
    password: secrets.password
});
client.connect((err) => {
    if(err) {
        console.error('connection error', err.stack)
    } else {
        console.log('connected')
    }
});

app.set('view engine', 'handlebars');

app.engine('handlebars', handlebars.engine({
    layoutsDir: './views/layouts/'
}));

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

app.use((req, res) => {
    res.render(res.locals.pack.template, res.locals.pack.config);
});

app.listen(port, () => console.log(`App open at http://localhost:${port}/`));
