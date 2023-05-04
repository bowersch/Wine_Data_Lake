// Date: 02/25/2023
// Source: https://www.youtube.com/watch?v=vxu1RrR0vbw
// Comment: followed tutorial by Conor Bailey to get User Authentication working

const LocalStrategy = require("passport-local").Strategy;

function initialize(passport, client, bcrypt) {

    const authenticateUser = (email, password, done) => {

        client.query( `SELECT * FROM users WHERE email = $1`, [email], (err, results) => {

            if(err) {
                throw err;
            }

            //find the user in the database
            if(results.rows.length > 0) {

                const user = results.rows[0];

                bcrypt.compare(password, user.user_auth, (err, isMatch) => {

                    if(err){
                        throw err
                    }

                    //does the password match what was found in the database
                    if(isMatch) {
                        return done(null, user);
                    } else {
                        return done(null, false, { message: "Password is not correct" });
                    }

                });

            } else {
                return done(null, false, { message: "Email is not registered "});
            }
            
        });
    };

    passport.use(new LocalStrategy({
        usernameField: "email",
        passwordField: "password"
    }, authenticateUser));

    passport.serializeUser((user, done) => done(null, {"id" : user.user_id, "username" : user.username}));

    passport.deserializeUser((user, done) => {
        client.query( `SELECT * FROM users WHERE user_id = $1`, [user.id], (err, results) => {
            if(err){
                throw err
            }
            return done (null, results.rows[0]);
        });
    });
}

module.exports = initialize;