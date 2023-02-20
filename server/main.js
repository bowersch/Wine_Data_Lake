const express = require('express');
const handlebars = require('express-handlebars');
const app = express();
const port = process.env.PORT || 8080;

const { Client } = require("pg");
const secrets = require("./secrets.json")

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

const testData = require('./demo.json');
const resultsDummy = require('./resultsDummy.json');

app.set('view engine', 'handlebars');

app.engine('handlebars', handlebars.engine({
    layoutsDir: './views/layouts/'
}));

app.use(express.static('public'));

app.get('/wines/demo', (req, res) => {
    res.render('wineEntry', {
        layout : 'main',
        css: ["wineEntry.css"],
        data: testData
    });
});

app.get('/wines/:id', (req, r0) => {
    var q = 'SELECT bottle_data.wine_name, bottle_data.pct_alcohol, bottle_data.ta, bottle_data.ph, bottle_data.year, techsheets.source_file, wineries.winery_name FROM bottle_data INNER JOIN wineries ON bottle_data.winery_id = wineries.winery_id INNER JOIN techsheets ON bottle_data.techsheet_id = techsheets.techsheet_id WHERE bottle_id = $1;';
    client.query(q, [req.params.id], (err, r1) => {
        if (err) throw err;
        r0.render('wineEntry', {
            layout : 'main',
            css: ["wineEntry.css"],
            data: {
                "name" : r1.rows[0].wine_name,
                "keywords" : [r1.rows[0].year],
                "description" : r1.rows[0].winery_name + " winery",
                "techSheet" : r1.rows[0].source_file,
                "properties": {
                    "ABV" : r1.rows[0].pct_alcohol,
                    "Tannins" : r1.rows[0].ta,
                    "pH" : r1.rows[0].ph
                }
            }
        });
    });
});

app.get('/results/*', (req, res) => {
    res.render('wineResults', {
        layout : 'main',
        css: ["wineResults.css"],
        data: resultsDummy
    });
});

app.get('/directory', (req, res) => {
    var q = 'SELECT wineries.winery_id, wineries.winery_name FROM wineries ORDER BY winery_name ASC';
    client.query(q, (err, r1) => {
        if (err) throw err;
        var wineries = [];
        for (let i = 0; i < r1.rows.length; i++) {
            client.query("SELECT bottle_data.bottle_id, bottle_data.year, bottle_data.wine_name FROM bottle_data WHERE bottle_data.winery_id = $1;",
                [r1.rows[i].winery_id],
                (err, r2) => {
                    if (err) throw err;
                    let x = {
                        "winery_name" : r1.rows[i].winery_name,
                        "wines": r2.rows
                    };
                    wineries[i] = x;
                    if(i == r1.rows.length - 1) {
                        res.render('directory', {
                            layout : 'main',
                            css: ["directory.css"],
                            wineries: wineries
                        });
                    }
                }
            );
        };
    });
});

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
