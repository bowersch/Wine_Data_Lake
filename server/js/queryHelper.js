exports.getWineriesWines = (client, callback) => {
    var q = "SELECT wineries.winery_id, wineries.winery_name FROM wineries ORDER BY winery_name ASC;";
    client.query(q, (err, res) => {
        if (err) {
            console.log(err);
            callback(null);
        }
        else {
            var wineries = [];
            for (let i = 0; i < res.rows.length; i++) {
                client.query("SELECT bottle_data.bottle_id, bottle_data.year, bottle_data.wine_name FROM bottle_data WHERE bottle_data.winery_id = $1;",
                    [res.rows[i].winery_id],
                    (err2, res2) => {
                        if (err2) console.log(err2);
                        let x = {
                            "winery_name" : res.rows[i].winery_name,
                            "wines": res2.rows
                        };
                        wineries[i] = x;
                        if(i == res.rows.length - 1) {
                            callback(wineries);
                        }
                    }
                );
            }
        }
    });
}

exports.getWineInfo = (id, client, callback) => {
    var q = "SELECT bottle_data.wine_name, bottle_data.pct_alcohol, bottle_data.ta, bottle_data.ph, bottle_data.year, techsheets.source_file, wineries.winery_name FROM bottle_data INNER JOIN wineries ON bottle_data.winery_id = wineries.winery_id INNER JOIN techsheets ON bottle_data.techsheet_id = techsheets.techsheet_id WHERE bottle_id = $1;";
    client.query(q, [id], (err, res) => {
        if (err) {
            console.log(err);
            callback(null);
        } else {
            callback({
                "name" : res.rows[0].wine_name,
                "keywords" : [res.rows[0].year],
                "description" : res.rows[0].winery_name + " winery",
                "techSheet" : res.rows[0].source_file,
                "properties": {
                    "ABV" : res.rows[0].pct_alcohol,
                    "Tannins" : res.rows[0].ta,
                    "pH" : res.rows[0].ph
                }
            });
        }
    });
}

exports.getUserFavoriteInfo = (id, client, callback) => {
    var q = "SELECT users.username FROM users WHERE users.user_id = $1;";
    client.query(q, [id], (err, res) => {
        if(err) console.log(err);
        client.query("SELECT qualities.quality_name FROM qualities WHERE qualities.quality_id = (SELECT favorite_qualities.quality_id FROM favorite_qualities WHERE favorite_qualities.user_id = $1);",
            [id],
            (err2, res2) => {
                if(err2) console.log(err2);
                client.query("SELECT wineries.winery_name FROM wineries WHERE wineries.winery_id = (SELECT favorite_wineries.winery_id FROM favorite_wineries WHERE favorite_wineries.user_id = $1);",
                    [id],
                    (err3, res3) => {
                        if(err3) console.log(err3);
                        client.query("SELECT techsheets.source_file FROM techsheets WHERE techsheets.techsheet_id = (SELECT favorite_techsheets.techsheet_id FROM favorite_techsheets WHERE favorite_techsheets.user_id = $1);",
                            [id],
                            (err4, res4) => {
                                if(err4) console.log(err4);
                                callback({
                                    "username": res.rows[0].username,
                                    "qualities": res2.rows,
                                    "wineries":  res3.rows,
                                    "techsheets": res4.rows
                                });
                            }   
                        );
                    }   
                );
            }
        );
    });
}

exports.getUsername = (id, client, callback) => {
    client.query("SELECT username FROM users WHERE user_id = $1;",
        [id],
        (err, res) => {
            if(err) {
                console.log(err);
                callback(null);
            } else {
                callback(res.rows[0].username);
            }
        }
    );
}

exports.logWineView = (userId, bottleId, client, callback) => {
    client.query("INSERT INTO wine_views (user_id, bottle_id) VALUES ($1, $2);",
    [userId, bottleId],
    (err, res) => {
        if(err) console.log(err);
        callback();
    });
}

exports.randomWineId = (client, callback) => {
    client.query("SELECT bottle_id FROM bottle_data ORDER BY RANDOM() LIMIT 1;",
    (err, res) => {
        if(err) {
            console.log(err);
            callback(null);
        } else {
            callback(res.rows[0].bottle_id);
        }
    });
}