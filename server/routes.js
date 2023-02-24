module.exports = function(app, client, queryHelper) {

    app.get('/', (req, res, next) => {
        res.cookie('userId', '1');
        res.locals.pack.template = 'demo';
        res.locals.pack.config.css = ['demo.css'];
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
        if(!req.cookies.userId) res.status(400).send('No user signed in.');
        else {
            queryHelper.getUserFavoriteInfo(req.cookies.userId, client, data => {
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