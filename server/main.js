const express = require('express');
const handlebars = require('express-handlebars');
const session = require('express-session');
const queryHelper = require('./js/queryHelper.js');
const bcrypt = require("bcrypt");
const flash = require('express-flash');
const passport = require('passport');

const app = express();
const port = process.env.PORT || 8080;
const api = express.Router();

const { Pool } = require("pg");

const popularityJS = require('./js/popularity.js');

//const secrets = require('./js/secrets.js');
//secrets.getSecret('DB_USER').then(user => { secrets.getSecret('DB_PASS').then(pass => {

    const conn = new Pool({
        host: "localhost",
        port: 5432,
        database: "Wine_Data_Lake",
        user: "postgres",
        password: "123456post"
    });
    
    conn.connect().then(() => {

        console.log('DB connected.');

        require("./js/api.js")(api, conn, popularityJS);
    
        const initializePassport = require("./js/passportConfig");
        initializePassport(passport, conn, bcrypt);
        
        app.set('view engine', 'handlebars');
        
        app.engine('handlebars', handlebars.engine({
            layoutsDir: './views/layouts/'
        }));
        
        app.use(express.urlencoded({ extended: false }));
        app.use(express.static('public'));
        app.use(session({
            secret: "akjfhakjaw8723bs873ka7ykhasi7yq2kjhfa8k72ydbk37",
            saveUninitialized: true,
            resave: false 
        }));
        
        app.use(passport.initialize());
        app.use(passport.session());
        app.use(flash());
        
        app.use("/api", api);
        
        app.use((req, res, next) => {
            res.locals.pack = {
                template: null,
                config: {
                    layout: 'main',
                    css: null,
                    js: null,
                    data: null,
                    user: req.session.passport ? req.session.passport.user.username : null
                }
            };
            next();
        });
        
        require('./js/routes.js')(app, conn, queryHelper, passport, bcrypt, flash, popularityJS);
        
        app.use((req, res) => {
            if(res.locals.pack.template) res.render(res.locals.pack.template, res.locals.pack.config);
        });
        
        app.listen(port, () => console.log(`App open at http://localhost:${port}/`));

    });

//});});