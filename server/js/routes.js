const axios = require('axios')
const parser = require('body-parser');
const randtoken = require('rand-token');
const nodemailer = require('nodemailer');

const jsonParser = parser.json();

module.exports = function(app, client, queryHelper, passport, bcrypt, flash, popularityJS) {

    console.log("routes loaded.");

    app.get('/', (req, res, next) => {
        res.locals.pack.template = 'home';
        res.locals.pack.config.css = ['home.css'];
        next();
    });

    app.get("/login", (req, res, next) => {
        res.locals.pack.template = 'login';
        res.locals.pack.config.css = ['login.css'];
        next();
    });

    app.get("/register", (req, res, next) => {
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

    // Citation
    // Date: 03/12/2023
    // Source: https://github.com/osu-cs340-ecampus/nodejs-starter-app/tree/main/Step%206%20-%20Dynamically%20Filling%20Dropdowns%20and%20Adding%20a%20Search%20Box
    // Comment: Referred to search bar implementation for this query!
    app.get('/search-results', (req, res, next) => {
            
        let query1;

        let search = '%' + req.query.search + '%';

        //if text box is empty when submit is done, set to a basic query
        //otherwise, set to a search query
        if(search === undefined){
            query1 = "SELECT * FROM wine_data LIMIT $2 OFFSET $3;";
        } else {
            // For Postgresql use ILIKE because database defaulted to case-sensitive
            query1 = `SELECT * FROM wine_data WHERE wine_name ILIKE $1 OR
                    winery_name ILIKE $1 OR varietal_name ILIKE $1 OR
                    winemaker_name ILIKE $1 OR ava_name ILIKE $1 OR
                    year ILIKE $1 LIMIT $2 OFFSET $3;`
        }

        var page = req.query.page ? Number(req.query.page) : 0;

        client.query(query1, [search, page * 10 + 10, page * 10], (err, res2) => {
            if(err) console.log(err);
            else {
                //results found
                if(res2.rows.length > 0) {
                    res.locals.pack.template = 'wineResults';
                    res.locals.pack.config.css = ['wineResults.css'];
                    res.locals.pack.config.data = res2.rows;
                    res.locals.pack.config.message = "";
                } else { //no results found
                    res.locals.pack.template = 'wineResults';
                    res.locals.pack.config.css = ['wineResults.css'];
                    res.locals.pack.config.message = "No Results Found";
                }
            }
            next();
        });
    });

    app.get('/search-filter', (req, res) => {
        let filter_search = req.query.filter_search;
        let filter_body = req.query.filter_body;
        let filter_sweet = req.query.filter_sweet;
        let filter_alcohol_from = req.query.filter_alcohol_from;
        let filter_alcohol_to = req.query.filter_alcohol_to;

        let query1;

        let search = '%' + filter_search + '%';

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
            // filter result
            let filter_rows = rows.rows;
            if (filter_body !== '' && filter_body !== undefined && filter_body !== null) {
                filter_rows = filter_rows.filter(item=>{
                   return item.body_level === filter_body;
                });
            }
            if (filter_sweet !== '' && filter_sweet !== undefined && filter_sweet !== null) {
                filter_rows = filter_rows.filter(item=>{
                    return parseFloat(item.sweetness_id) === parseFloat(filter_sweet);
                });
            }
            if (filter_alcohol_from !== '' && filter_alcohol_from !== undefined && filter_alcohol_from !== null) {
                filter_rows = filter_rows.filter(item=>{
                    let bool = parseFloat(item.pct_alcohol) >= parseFloat(filter_alcohol_from)
                    return bool;
                });
            }
            if (filter_alcohol_to !== '' && filter_alcohol_to !== undefined && filter_alcohol_to !== null) {
                filter_rows = filter_rows.filter(item=>{
                    let bool = parseFloat(item.pct_alcohol) <= parseFloat(filter_alcohol_to)
                    return bool;
                });
            }
            if(filter_rows.length > 0) {
                return res.render("wineResults", {
                    layout: "main",
                    css: ["wineResults.css"],
                    data: filter_rows,
                });
            }
            //no results found
            else {
                return res.render("wineResults", {
                    layout: "main",
                    css: ["wineResults.css"],
                    message: "No Results Found"});
            }
            
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
                popularityJS.getTopPercentile(req.params.bottle_id, client, stat => {
                    data.popStat = (stat * 100).toFixed(2);
                    res.locals.pack.config.data = data;
                        axios.get('https://api.ipify.org?format=json').then(response => {
                        const ip = response.data.ip;
                        axios.get('https://ipapi.co/' + ip + '/' + 'json').then(response => {
                            if(!response.error) {   
                                    queryHelper.logLocation(client,
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
                });
            }
        });
    });

    app.get('/directory', (req, res, next) => {
        queryHelper.getWineriesWines(client, data => {
            if(!data) res.status(400).send('Error.');

            res.locals.pack.template = 'directory';
            res.locals.pack.config.css = ['directory.css'];
            res.locals.pack.config.data = data;
            next();
        });
    });

    app.get('/favorites', checkNotAuthenticated, (req, res, next) => {
        queryHelper.getUserFavoriteInfo(req.session.passport.user.id, client, data => {
            if(!data) res.status(400).send('Error.');

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

    // Date: 02/25/2023
    // Source: https://www.youtube.com/watch?v=vxu1RrR0vbw
    // Comment: followed tutorial by Conor Bailey to get User Authentication working
    app.post('/register', async(req, res) => {
        let { username, email, password, password2 } = req.body;

        //other error checking done through form require
        //error: passwords do not match
        if(password != password2) {
            res.render("register", {
                layout:"main",
                css: ["register.css"],
                message: "Passwords do not match"
             });
        } else {
            //form validation has passed
            //hash the password
            let hashedPassword = await bcrypt.hash(password, 10);

            //check if email already exists
            client.query(`SELECT * FROM users WHERE email = $1;`,
                [email],
                (error, results) => {
                     if(error){
                        throw error;
                    }

                    //if true, email is already in database
                    if(results.rows.length > 0) {
                        //errors.push({ message: "Email already registered" });
                        res.render("register", {
                            layout:"main",
                            css: ["register.css"],
                            message: "Email already registered"
                        });
                    }
                    else{
                        //add new user
                        client.query(
                            "INSERT INTO users (username, email, user_auth) VALUES ($1, $2, $3) RETURNING user_id, user_auth;",
                            [username, email, hashedPassword],
                            (error, results) => {
                                if(error) {
                                    throw error;
                                }

                                res.render("login", {
                                    layout:"main",
                                    css: ["login.css"],
                                    message: "You are now registered. Please log in"
                                });
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
        if(data.userId == null || data.itemId == null) return;
        axios.get('https://api.ipify.org?format=json').then(response => {
            const ip = response.data.ip;
            axios.get('https://ipapi.co/' + ip + '/' + 'json').then(response => {
                if(!response.error) {
                        queryHelper.logLocation(client,
                        response.data.city,
                        response.data.region,
                        response.data.country,
                        response.data.continent_code,
                        response.data.postal,
                        response.data.latitude,
                        response.data.longitude,
                        location_id => {
                            switch(data.itemType) {
                                case 'quality': {
                                    queryHelper.addFavoriteQuality(data.userId, data.itemId, ip, location_id, client);
                                }
                                case 'wine': {
                                    queryHelper.addFavoriteSheet(data.userId, data.itemId, ip, location_id, client);
                                }
                            }
                        }
                    );
                }
            });
        });

    });

    app.post('/removeFavorite', jsonParser, (req, res) => {

        var data = {
            itemType : req.body.itemType,
            itemId : req.body.itemId,
            userId : req.isAuthenticated() ? req.session.passport.user.id : null
        };
        if(data.userId == null || data.itemId == null) return;
        switch(data.itemType) {
            case 'quality': {
                queryHelper.delFavoriteQuality(data.userId, data.itemId, client);
            }
            case 'wine': {
                queryHelper.addFavoriteSheet(data.userId, data.itemId, ip, location_id, client);
            }
        }

    });

    app.get("/popular", (req, res, next) => {
        var page = req.query.page ? Number(req.query.page) : 0;
        popularityJS.getTopN(page * 10 + 10, page * 10, client, table => {
            var done = 0;
            rows = [];
            for(let i = 0; i < table.length; i++) {
                client.query("SELECT * from wine_data WHERE bottle_id = $1;",
                [table[i].id],
                (err, res2) => {
                    if(err) {
                        console.log(err);
                    } else {
                        rows[i] = res2.rows[0];
                        done++;
                        if(done == table.length) {
                            res.locals.pack.template = 'wineResults';
                            res.locals.pack.config.css = ['wineResults.css'];
                            res.locals.pack.config.data = rows;
                            next();
                        }
                    }
                })
            }
        });
    });

    app.get('/forgot-password', (req, res, next) => {
        res.locals.pack.template = 'forgot-password';
        res.locals.pack.config.css = ['forgot-password.css'];
        next();
    });

    app.get('/forgot-password-success', (req, res, next) => {
        res.locals.pack.template = 'forgot-password-success';
        res.locals.pack.config.css = ['forgot-password.css'];
        next();
    })

    app.post('/forgot-password', function(req, res, next) {
        let email = req.body.email;
    
        //check if email is already registered
        client.query(`SELECT * FROM users WHERE email = $1;`,
            [email],
            async (error, results) => {
                if(error) {
                    throw error;
                }
    
                //user exists
                if(results.rows.length > 0) {
                    let token = randtoken.generate(10);
                    var sentEmail = await sendEmail(email, token);

                    //check if email sent successfully
                    if(sentEmail != '0'){
                        //update user token and time token was created
                        client.query(`UPDATE users SET token = $1, token_created = $2 WHERE email = $3;`,
                           [token, Math.floor(Date.now() / 1000), email], 
                           function(error, results) {
                            if(error){
                                throw error;
                            }

                            //email sent successfully, token and token_created added to user
                            res.render("forgot-password-success", {
                                layout:"main",
                                css: ["forgot-password-success.css"], 
                                message: "Link was sent successfully. Please check your email" 
                            });
                        })
                    }
                    //email not sent
                    else {
                        res.render("forgot-password", {
                            layout:"main",
                            css: ["forgot-password.css"], 
                            message: "Forgot password email was not sent. Please try again" 
                        });
                    }
                }
                //user does not exist
                else {
                    res.render("forgot-password", {
                        layout:"main",
                        css: ["forgot-password.css"], 
                        message: "Account does not exist. Please try again" 
                    });
                }
            })
    });

    app.get('/update-password/:token', (req, res, next) => {

        let token = req.params.token;

        //find user with matching token
        client.query(`SELECT * FROM users WHERE token = $1;`, 
            [token], 
            function(error, results) {
                if(error) {
                    throw error; 
                }

                //user found, load the update password page
                if(results.rows.length > 0) {
                    res.render('update-password', {
                        layout: "main",
                        css: ["login.css"],
                        data: token
                    })
                }
                //user with matching token not found
                else {
                    res.render('forgot-password', {
                        layout: "main",
                        css: ["forgot-password.css"],
                        message: "Token not found. Try again"
                    })
                }
        })
    })

    app.post('/update-password/:token', function(req, res, next) {

        let token = req.params.token;
        var password = req.body.password;
        var password2 = req.body.password2;

        //check if new passwords do not match
        if(password != password2) {
            res.render('update-password', {
                layout: "main",
                css: ["login.css"],
                data: token,
                message: "Passwords do not match"
            })
        } else {
            //form validation has passed
            client.query(`SELECT * FROM users WHERE token = $1;`, 
                [token], 
                async function(error, results) {
                    if(error) {
                        throw error;
                    }

                    //user is found
                    if(results.rows.length > 0) {
                        //hash the password
                        let hashedPassword = await bcrypt.hash(password, 10);

                        //will need to get current time and compare to the token_created from user table
                        //difference in time needs to be within 15 minutes (900 seconds)
                        var current_time = Math.floor(Date.now() / 1000.0);

                        if((current_time - results.rows[0].token_created) < 900){
                            //update the user's password
                            client.query(`UPDATE users SET user_auth = $1 WHERE email = $2;`,
                                [hashedPassword, results.rows[0].email], 
                                function (error, results) {
                                    if(error) {
                                        throw error;
                                    }

                                    res.render('login', {
                                        layout: "main",
                                        css: ["login.css"],
                                        message: "Password updated successfully"
                                    })
                                })
                        }
                        //token expired, need to retry
                        else {
                            res.render("forgot-password", {
                                layout:"main",
                                css: ["forgot-password.css"], 
                                message: "Token expired. Please try again" 
                            });
                        }
                    }
                    //user not found (wrong token)
                    else {
                        res.render("forgot-password", {
                            layout:"main",
                            css: ["forgot-password.css"], 
                            message: "Incorrect token. Please try again" 
                        });
                    }
                })
        }

    })
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

async function sendEmail(email, token) {

    let sender = nodemailer.createTransport({
        //depending on sender's email service, this might need to be changed 
        service: "outlook",
        host: "smtp-mail.outlook.com",
        port: 587,
        secureConnection: false,
        tls: {
            ciphers: 'SSLv3'
        },
        auth: {
            //need to add the sender's email(user) and password 
            user: "winedatalake@outlook.com",
            pass: "wine123data456"
        },
        from: "winedatalake@outlook.com"
    });

    let message = {
        from: "winedatalake@outlook.com",
        to: email,
        subject: "Reset Password Link",
        text: "This email is for your reset password link.", 
        html: '<p> Here is the link to reset your password. The link will expire in 15 minutes. <br> <a href="http://winedatalake.com/update-password/' + token + '">Reset Password</a>'
    }

    sender.sendMail(message, function(error, info) {

        //email was not sent
        if(error) {
            console.log('Error sending reset password link');
            return 0;
        }
        //email sent
        else {
            console.log("Reset password link sent successfully");
            return 1;
        }
    });

}