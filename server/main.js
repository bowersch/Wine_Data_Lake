const express = require('express');
const handlebars = require('express-handlebars');
const app = express();
const PORT = process.env.PORT || 8080;

const { Client } = require("pg");
const secrets = require("./secrets.json")

const client = new Client({
    host: '34.168.133.161',
    port: 5432,
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
client.query('SELECT wine_name FROM bottle_data;', (err, res) => {
    if (err) throw err;
    console.log(res);
    client.end();
});

const testData = require('./demo.json')

app.set('view engine', 'handlebars');

app.engine('handlebars', handlebars.engine({
    layoutsDir: './views/layouts/'
}));

app.use(express.static('public'))

app.get('/*', (req, res) => {
    res.render('demo', {layout : 'main', css: ["demo.css"]});
});

app.listen(PORT, () => console.log(`App open.`));
