module.exports = function(app, client, queryHelper, passport, bcrypt, flash, IP) {

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

    app.get('/wines/random', (req, res, next) => {
        queryHelper.randomWineId(client, id => {
            if (!id) res.status(400).send('Error.');
            else {
                res.redirect('/wines/' + id);
            }
        });
    });

    app.get('/wines/:id', (req, res, next) => {
        queryHelper.getWineInfo(req.params.id, client, data => {
            if(!data) res.status(400).send('Error.');
            else {
                res.locals.pack.template = 'wineEntry';
                res.locals.pack.config.css = ['wineEntry.css'];
                res.locals.pack.config.data = data;
                queryHelper.logWineView(req.passport ? req.passport.user.id : null,
                    req.params.id,
                    IP.address(), 
                    client, () => {
                        next();
                    }   
                );
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