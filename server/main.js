const express = require('express');
const handlebars = require('express-handlebars');
const app = express();
const port = 3000;

const testData = require('./demo.json')

app.set('view engine', 'handlebars');

app.engine('handlebars', handlebars.engine({
    layoutsDir: './views/layouts/'
}));

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

app.get('/favorites/*', (req, res) => {
    res.render('userFavorites', {
        layout: 'main', 
        css: ["userFavorites.css"],
        data: testData
    });
});

app.get('/*', (req, res) => {
    res.render('demo', {layout : 'main', css: ["demo.css"]});
});

app.listen(port, () => console.log(`App open at http://localhost:${port}/`));