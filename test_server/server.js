const express = require('express');
const handlebars = require('express-handlebars');
const app = express();
const { pool } = require("./dbConfig");
const bcrypt = require("bcrypt");
const session = require('express-session');
const flash = require('express-flash');
const passport = require('passport');

const port = 3000;

const initializePassport = require("./passportConfig");

initializePassport(passport);

const config = require('./config.json');
const test_data = require('./' + config.test_data);

app.set('view engine', 'handlebars');


app.engine('handlebars', handlebars.engine({
    layoutsDir : config.layouts_path
}));

app.use(express.urlencoded({ extended: false }));
app.use(express.static('public'));

app.use(session({
    secret: 'a4s5k6d87fds9f0acz1ve2w3m',

    //don't resave session variables if nothing has changed
    resave: false,

    //don't save session details if no values have been placed in the session
    saveUninitialized: false
}));

app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

app.get('/login*', checkAuthenticated, (req, res) => {
    res.render("login", {
        layout : "main",
        css: ["login.css"],
        data : test_data
    });
});

app.get('/register', checkAuthenticated, (req, res) => {
    res.render("register", {
        layout : "main",
        css: ["register.css"],
        data : test_data
    });
});

app.get('/wineEntry*', (req, res) => {
    res.render("wineEntry", {
        layout : "main",
        css: ["wineEntry.css"],
        data : test_data
    });
});

app.get('/userfavorites*', checkNotAuthenticated, (req, res) => {
    res.render("userFavorites", {
        layout: "main",
        css: ["userFavorites.css"],
        data: test_data
    });
});

app.get('/directory*', (req, res) => {
    res.render("directory", {
        layout : "main",
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

app.get("/logout", (req, res) => {
    req.logout(req.user, err => {
        if(err) return next(err);
        req.flash("success_msg", "You have logged out");
        res.redirect("/login");
    });
});

app.get('/', (req, res) => {
    res.render("home", {
        layout : "main",
        css: ["home.css"],
        data : test_data
    });
});

//POST
app.post('/register', async (req, res) => {
    let { username, email, password, password2 } = req.body;
    console.log({
        username,
        email,
        password,
        password2
    });

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

    if(errors.length > 0){
        res.render("register", { errors });
    }
    else {
        //form validation has passed
        let hashedPassword = await bcrypt.hash(password, 10);
        console.log(hashedPassword);

        //check if email already exists
        pool.query(
            `SELECT * FROM users
            WHERE email = $1`, [email], (err, results) => {
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
                    pool.query(
                        `INSERT INTO users (username, email, user_auth)
                        VALUES ($1, $2, $3) 
                        RETURNING user_id, user_auth`, [username, email, hashedPassword], (err, results) => {
                            if(err) {
                                throw err
                            }
                            console.log(results.rows);
                            req.flash("success_msg", "You are now registered. Please log in");
                            res.redirect("/login");
                        }
                    )
                }
            }
        )
    }
});

app.post("/login", passport.authenticate("local", {
    successRedirect: "/userFavorites", 
    failureRedirect: "/login",
    failureFlash: true
}));

function checkAuthenticated(req, res, next){
    if(req.isAuthenticated()) {
        return res.redirect("/userFavorites");
    }

    next();
}

function checkNotAuthenticated(req, res, next) {
    if(req.isAuthenticated()) {
        return next();
    }

    res.redirect("/login");
}

app.listen(port, () => console.log(`App open at http://localhost:${port}/`));
