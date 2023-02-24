const express = require('express');
const handlebars = require('express-handlebars');
const queryHelper = require('./queryHelper.js');
const cookieParser = require('cookie-parser');


const secrets = require("./secrets.json");
const testData = require('./demo.json');
const resultsDummy = require('./resultsDummy.json');

const app = express();
const port = process.env.PORT || 8080;

const { Client } = require("pg");


const client = new Client({
    host: '34.168.133.161',
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

app.use(express.static('public'));
app.use(cookieParser());
app.use((req, res, next) => {
    res.locals.pack = {
        template: null,
        config: {
            layout: 'main',
            css: null,
            js: null,
            data: null,
            user: null
        }
    };
    if(req.cookies.userId && !res.locals.pack.config.user) {
        queryHelper.getUsername(req.cookies.userId, client, (username) => {
            res.locals.pack.config.user = username;
        });
    }
    next();
});

require('./routes.js')(app, client, queryHelper);

app.get('/results/*', (req, res) => {
    res.render('wineResults', {
        layout : 'main',
        css: ["wineResults.css"],
        data: resultsDummy
    });
});

app.use((req, res) => {
    res.render(res.locals.pack.template, res.locals.pack.config);
});

app.listen(port, () => console.log(`App open at http://localhost:${port}/`));