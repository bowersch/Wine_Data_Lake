const express = require('express');
const handlebars = require('express-handlebars');
const app = express();
const port = 3000;

const config = require('./config.json');
const test_data = require('./' + config.test_data);

app.set('view engine', 'handlebars');

app.engine('handlebars', handlebars.engine({
    layoutsDir : config.layouts_path
}));

app.use(express.static('public'))

app.get('/userfavorites/*', (req, res) => {
    res.render(config.template2, {
        layout: config.layout_template,
        css: ["userFavorites.css"],
        data: test_data
    });
});

app.get('/', (req, res) => {
    res.render(config.template, {
        layout : config.layout_template, 
        css: ["directory.css"],
        data : test_data
    });
});

app.get('/about*', (req, res) => {
    res.render(config.template3, {
        layout : config.layout_template, 
        css: ["about.css"],
        data : test_data
    });
});

app.get('/contact*', (req, res) => {
    res.render(config.template4, {
        layout : config.layout_template, 
        css: ["about.css"],
        data : test_data
    });
});

app.get('/developer*', (req, res) => {
    res.render(config.template5, {
        layout : config.layout_template, 
        css: ["about.css"],
        data : test_data
    });
});

app.get('/help*', (req, res) => {
    res.render(config.template6, {
        layout : config.layout_template, 
        css: ["about.css"],
        data : test_data
    });
});

app.listen(port, () => console.log(`App open at http://localhost:${port}/`));