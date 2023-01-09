const express = require('express');
const handlebars = require('express-handlebars');
const app = express();
const port = 3000;

app.set('view engine', 'handlebars');

app.engine('handlebars', handlebars.engine({
    layoutsDir : __dirname + '/views/layouts'
}));

app.use(express.static(__dirname + '/public'))

app.get('/*', (req, res) => {
    res.render('demo', {layout : 'main'});
});

app.listen(port, () => console.log(`App open at http://localhost:${port}/`));