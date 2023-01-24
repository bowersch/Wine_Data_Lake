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

app.use(express.static('public'));

app.get('/*', (req, res) => {
    res.render(config.template, {
        layout : config.layout_template,
        data : test_data,
        css: ['wineEntry.css']/*,
        user: 'stinkyMcGee'*/
    });
});

app.listen(port, () => console.log(`App open at http://localhost:${port}/`));