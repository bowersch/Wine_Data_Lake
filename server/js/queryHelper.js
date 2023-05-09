exports.getWineriesWines = (client, callback) => {
    var q = "SELECT wineries.winery_id, wineries.winery_name FROM wineries ORDER BY winery_name ASC;";
    client.query(q, (err, res) => {
        if (err) {
            console.log(err);
            callback(null);
        }
        else {
            var wineries = [];
            var done = 0;
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
                        done++;
                        if(done == res.rows.length) {
                            callback(wineries);
                        }
                    }
                );
            }
        }
    });
}

exports.getWineInfo = (wine_id, user_id, client, callback) => {
    var q = "SELECT bottle_data.bottle_id, bottle_data.description, bottle_data.wine_name, bottle_data.pct_alcohol, bottle_data.ta, bottle_data.ph, bottle_data.year, techsheets.source_file, wineries.winery_name FROM bottle_data INNER JOIN wineries ON bottle_data.winery_id = wineries.winery_id INNER JOIN techsheets ON bottle_data.techsheet_id = techsheets.techsheet_id WHERE bottle_id = $1;";
    client.query(q, [wine_id], async (err, res) => {
        if (err) {
            console.log(err);
            callback(null);
        } else {
            this.getWineQualities(res.rows[0].bottle_id, user_id, client, qualities => {
                for(q in qualities) q.current_favorite = (q.current_favorite == 0 ? null : q.current_favorite);
                callback({
                    "id" : res.rows[0].bottle_id,
                    "name" : res.rows[0].wine_name,
                    "keywords" : [res.rows[0].year],
                    "description" : res.rows[0].description,
                    "techSheet" : res.rows[0].source_file,
                    "properties": qualities
                });
            });
        }
    });
}

exports.getWineQualities = (wine_id, user_id, client, callback) => {
    client.query("SELECT qualities.quality_id, qualities.quality_name, qualities.description, CASE WHEN EXISTS (SELECT 1 FROM favorite_qualities WHERE favorite_qualities.quality_id = qualities.quality_id AND favorite_qualities.user_id = $2) THEN 1 ELSE 0 END AS current_favorite FROM qualities INNER JOIN wine_qualities ON wine_qualities.quality_id = qualities.quality_id WHERE wine_qualities.bottle_id = $1;",
        [wine_id, user_id],
        (err, res) => {
            if(err) {
                console.log(err);
                callback([]);
            } else {
                callback(res.rows);
            }
        }
    );
}

exports.getUserFavoriteInfo = (id, client, callback) => {
    client.query("SELECT users.username FROM users WHERE users.user_id = $1;",
        [id], 
        (err, res) => {
        if(err) console.log(err);
        client.query("SELECT qualities.quality_name FROM favorite_qualities INNER JOIN qualities ON qualities.quality_id = favorite_qualities.quality_id WHERE favorite_qualities.user_id = $1;",
            [id],
            (err2, res2) => {
                if(err2) console.log(err2);
                client.query("SELECT wineries.winery_name FROM favorite_wineries INNER JOIN wineries ON wineries.winery_id = favorite_wineries.winery_id WHERE favorite_wineries.user_id = $1;",
                    [id],
                    (err3, res3) => {
                        if(err3) console.log(err3);
                        client.query("SELECT techsheets.source_file FROM favorite_techsheets INNER JOIN techsheets ON techsheets.techsheet_id = favorite_techsheets.techsheet_id WHERE favorite_techsheets.user_id = $1;",
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

exports.logWineView = (userId, bottleId, ip, location_id, client, callback) => {
    client.query("INSERT INTO wine_views (user_id, bottle_id, user_ip, user_location) VALUES ($1, $2, $3, $4);",
    [userId, bottleId, ip, location_id],
    (err, res) => {
        if(err) console.log(err);
        callback();
    });
}

exports.logLocation = (client, city, region, country, continent, postal, latitude, longitude, callback) => {
    client.query("INSERT INTO locations (city, region, country, continent, postal, latitude, longitude) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING location_id;",
    [city, region, country, continent, postal, latitude, longitude],
    (err, res) => {
        if(err) {
            console.log(err);
            callback(null);
        } else {
            callback(res.rows[0].location_id);
        }
    })
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

exports.addFavoriteWinery = (userId, wineryId, ip, location_id, client) => {
    client.query("INSERT INTO favorite_wineries (user_id, winery_id, user_ip, location_id) VALUES ($1, $2, $3, $4);",
        [userId, wineryId, ip, location_id],
        (err, res) => {
            if(err) console.log(err);
        });
}

exports.delFavoriteWinery = (userId, wineryId, client) => {
    client.query("DELETE FROM favorite_wineries WHERE user_id = $1 AND winery_id = $2;",
        [userId, wineryId],
        (err, res) => {
            if(err) console.log(err);
        });
}

exports.addFavoriteAva = (userId, avaId, ip, location_id, client) => {
    client.query("INSERT INTO favorite_ava (user_id, ava_id, user_ip, user_location) VALUES ($1, $2, $3, $4);",
        [userId, avaId, ip, location_id],
        (err, res) => {
            if(err) console.log(err);
        });
}

exports.delFavoriteAva = (userId, avaId, client) => {
    client.query("DELETE FROM favorite_ava WHERE user_id = $1 AND ava_id = $2;",
        [userId, avaId],
        (err, res) => {
            if(err) console.log(err);
        });
}

exports.addFavoriteQuality = (userId, qualityId, ip, location_id, client) => {
    client.query("INSERT INTO favorite_qualities (user_id, quality_id, user_ip, user_location) VALUES ($1, $2, $3, $4);",
        [userId, qualityId, ip, location_id],
        (err, res) => {
            if(err) console.log(err);
        }
    );
}

exports.delFavoriteQuality = (userId, qualityId, client) => {
    client.query("DELETE FROM favorite_qualities WHERE user_id = $1 AND quality_id = $2;",
        [userId, qualityId],
        (err, res) => {
            if(err) console.log(err);
        }
    );
}

exports.addFavoriteSheet = (userId, sheetId, ip, location_id, client) => {
    client.query("INSERT INTO favorite_techsheets (user_id, techsheet_id, user_ip, user_location) VALUES ($1, $2, $3, $4);",
        [userId, sheetId, ip, location_id],
        (err, res) => {
            if(err) console.log(err);
        }
    );
}

exports.delFavoriteSheet = (userId, sheetId, client, callback) => {
    client.query("DELETE FROM favorite_techsheets WHERE user_id = $1 AND techsheet_id = $2;",
        [userId, sheetId],
        (err, res) => {
            if(err) console.log(err);
            callback();
        }
    );
}