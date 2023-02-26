module.exports = function(app, client, queryHelper) {

    app.get('/', (req, res, next) => {
        res.locals.pack.template = 'demo';
        res.locals.pack.config.css = ['demo.css'];
        next();
    });

    app.post('/authenticate', 
        (req, res, next) => {
            res.locals.userId = 1;
            next();
        },
        (req, res) => {
            req.session.userId = res.locals.userId;
            queryHelper.getUsername(res.locals.userId, client, username => {
                req.session.username = username;
                res.redirect('/favorites');
            });
        }
    );

    app.post('/logout', (req, res) => {
        req.session.destroy((err) => {
            res.redirect('/');
        });
    });
    
    app.get('/results/*', (req, res, next) => {
        res.locals.pack.template = 'wineResults';
        res.locals.pack.config.css = ['wineResults.css'];
        res.locals.pack.config.data = require('./resultsDummy.json');;
        next();
    });

    app.get('/wines/:id', (req, res, next) => {
        queryHelper.getWineInfo(req.params.id, client, data => {
            res.locals.pack.template = 'wineEntry';
            res.locals.pack.config.css = ['wineEntry.css'];
            res.locals.pack.config.data = data;
            next();
        });
    });
    
    app.get('/directory', (req, res, next) => {
        queryHelper.getWineriesWines(client, data => {
            res.locals.pack.template = 'directory';
            res.locals.pack.config.css = ['directory.css'];
            res.locals.pack.config.data = data;
            next();
        });
    });

    app.get('/favorites', (req, res, next) => {
        if(!req.session.userId) res.status(400).send('No user signed in.');
        else {
            queryHelper.getUserFavoriteInfo(req.session.userId, client, data => {
                res.locals.pack.template = 'userFavorites';
                res.locals.pack.config.css = ['userFavorites.css'];
                res.locals.pack.config.data = data;
                next();
            });
        }
    });

    app.get('/about', (req, res, next) => {
        res.locals.pack.template = 'about';
        res.locals.pack.config.css = ['about.css'];
        next();
    });
    
    app.get('/contact', (req, res, next) => {
        res.locals.pack.template = 'contact';
        res.locals.pack.config.css = ['about.css'];
        next();
    });

    app.get('/developers', (req, res, next) => {
        res.locals.pack.template = 'developers';
        res.locals.pack.config.css = ['about.css'];
        next();
    });

    app.get('/help', (req, res, next) => {
        res.locals.pack.template = 'help';
        res.locals.pack.config.css = ['about.css'];
        next();
    });

};