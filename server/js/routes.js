const axios = require('axios')
const parser = require('body-parser');
const jsonParser = parser.json();

module.exports = function(app, client, queryHelper, passport, bcrypt, flash) {

    console.log("routes loaded.");

    app.get('/', (req, res, next) => {
        res.locals.pack.template = 'home';
        res.locals.pack.config.css = ['home.css'];
        next();
    });

    app.get('/login', checkAuthenticated, (req, res, next) => {
        res.locals.pack.template ='login';
        res.locals.pack.config.css = ['login.css'];
        next();
    });

    app.get('/register', checkAuthenticated, (req, res, next) => {
        res.locals.pack.template = 'register';
        res.locals.pack.config.css = ['register.css'];
        next();
    });

    app.get("/logout", (req, res) => {
        req.logout(req.user, err => {
            if(err) return next(err);
            req.flash("success_msg", "You have logged out");
            res.redirect("/");
        });
    });

    app.get('/results/*', (req, res, next) => {
        res.locals.pack.template = 'wineResults';
        res.locals.pack.config.css = ['wineResults.css'];
        res.locals.pack.config.data = require('../resultsDummy.json');;
        next();
    });

    // Citation
    // Date: 03/12/2023
    // Source: https://github.com/osu-cs340-ecampus/nodejs-starter-app/tree/main/Step%206%20-%20Dynamically%20Filling%20Dropdowns%20and%20Adding%20a%20Search%20Box
    // Comment: Referred to search bar implementation for this query!
    app.get('/search-results', (req, res) => {
            
        let query1;

        let search = '%' + req.query.search + '%';

        //if text box is empty when submit is done, set to a basic query
        //otherwise, set to a search query
        if(search === undefined){
            query1 = "SELECT * FROM wine_data LIMIT 100;";
        }
        else {
            // For Postgresql use ILIKE because database defaulted to case-sensitive
            query1 = `SELECT * FROM wine_data WHERE wine_name ILIKE $1 OR
                    winery_name ILIKE $1 OR varietal_name ILIKE $1 OR
                    winemaker_name ILIKE $1 OR ava_name ILIKE $1 OR
                    year ILIKE $1`
        }

        client.query(query1, [search], function(error, rows, fields) {
            return res.render("wineResults", {
                layout: "main",
                css: ["wineResults.css"],
                data: rows});
        })
    });

    app.get('/wines/random', (req, res, next) => {
        queryHelper.randomWineId(client, id => {
            if (!id) res.status(400).send('Error.');
            else {
                res.redirect('/wines/' + id);
            }
        });
    });

    app.get('/wines/:bottle_id', (req, res, next) => {
        queryHelper.getWineInfo(req.params.bottle_id, req.isAuthenticated() ? req.session.passport.user.id : null, client, data => {
            if(!data) res.status(400).send('Error.');
            else {
                res.locals.pack.template = 'wineEntry';
                res.locals.pack.config.css = ['wineEntry.css'];
                res.locals.pack.config.js = ['wineEntry.js'];
                res.locals.pack.config.data = data;
                axios.get('https://api.ipify.org?format=json').then(response => {
                    const ip = response.data.ip;
                    axios.get('https://ipapi.co/' + ip + '/' + 'json').then(response => {
                        if(!response.error) {
                                queryHelper.logViewLocation(client,
                                response.data.city,
                                response.data.region,
                                response.data.country,
                                response.data.continent_code,
                                response.data.postal,
                                response.data.latitude,
                                response.data.longitude,
                                location_id => {
                                    queryHelper.logWineView(
                                        req.passport ? req.passport.user.id : null,
                                        req.params.bottle_id,
                                        ip,
                                        location_id,
                                        client, () => {
                                            next();
                                        }
                                    );
                                }
                            );
                        } else {
                            queryHelper.logWineView(
                                req.passport ? req.passport.user.id : null,
                                req.params.bottle_id,
                                ip,
                                null,
                                client, () => {
                                    next();
                                }
                            );
                        }
                    });
                });
            }
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

    app.get('/favorites', checkNotAuthenticated, (req, res, next) => {
        queryHelper.getUserFavoriteInfo(req.session.passport.user.id, client, data => {
            res.locals.pack.template = 'userFavorites';
            res.locals.pack.config.css = ['userFavorites.css'];
            res.locals.pack.config.data = data;
            next();
        });
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

    app.post('/login', passport.authenticate("local", {
        successRedirect: "/favorites",
        failureRedirect: "/login",
        failureFlash: true
    }));

    app.post('/register', async(req, res) => {
        let { username, email, password, password2 } = req.body;

        let errors = [];

        if(!username || !email || !password || !password2) {
            errors.push({ message: "Please enter all fields" });
        }

        if(password.length < 6) {
            errors.push({ message: "Password should be at least 6 characters" });
        }

        if(password != password2) {
            errors.push({ message: "Passwords do not match" });
        }

        if(errors.length > 0) {
            res.render("register", { errors });
        } else {
            //form validation has passed
            let hashedPassword = await bcrypt.hash(password, 10);

            //check if email already exists
            client.query(`SELECT * FROM users WHERE email = $1;`,
                [email],
                (err, results) => {
                     if(err){
                        throw err;
                    }
                    console.log(results.rows);

                    //if true, email is already in database
                    if(results.rows.length > 0) {
                        errors.push({ message: "Email already registered" });
                        res.render('register', { errors });
                    }
                    else{
                        //add new user
                        client.query(
                            "INSERT INTO users (username, email, user_auth) VALUES ($1, $2, $3) RETURNING user_id, user_auth;",
                            [username, email, hashedPassword],
                            (err, results) => {
                                if(err) {
                                    throw err;
                                }
                                console.log(results.rows);
                                req.flash("success_msg", "You are now registered. Please log in");
                                res.redirect('/login');
                            }
                        )
                    }
                }
            )
        }
    });

    app.post('/addFavorite', jsonParser, (req, res) => {

        var data = {
            itemType : req.body.itemType,
            itemId : req.body.itemId,
            userId : req.isAuthenticated() ? req.session.passport.user.id : null
        };
        if(data.userId == null) return;
        switch(data.itemType) {
            case 'quality': {
                queryHelper.addFavoriteQuality(data.userId, data.itemId, client);
            }
        }

    });

    app.post('/removeFavorite', jsonParser, (req, res) => {

        var data = {
            itemType : req.body.itemType,
            itemId : req.body.itemId,
            userId : req.isAuthenticated() ? req.session.passport.user.id : null
        };
        if(data.userId == null) return;
        switch(data.itemType) {
            case 'quality': {
                queryHelper.delFavoriteQuality(data.userId, data.itemId, client);
            }
        }

    });

};

function checkAuthenticated(req, res, next) {
    if(req.isAuthenticated()) {
        return res.redirect('/favorites');
    }
    next();
}

function checkNotAuthenticated(req, res, next) {
    if(req.isAuthenticated()) {
        return next();
    }
    res.redirect('/login');
}
