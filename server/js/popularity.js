var table = [];
var lastUpdated = Date.now();
const loadDelay = 1000 * 60 * 60 * 12;

loadTable = (client, callback) => {
    table = [];
    client.query("SELECT wine_qualities.bottle_id, COUNT(*) AS score FROM wine_qualities INNER JOIN qualities ON wine_qualities.quality_id = qualities.quality_id INNER JOIN favorite_qualities ON wine_qualities.quality_id = favorite_qualities.quality_id GROUP BY wine_qualities.bottle_id;", 
    [], 
    (err, res) => {
        if(err) {
            console.log(err);
        } else {
            var done = 0;
            for(let i = 0; i < res.rows.length; i++) {
                client.query("SELECT COUNT(*) AS view_count, wine_views.view_date as date FROM wine_views WHERE wine_views.bottle_id = $1 GROUP BY wine_views.view_date ORDER BY wine_views.view_date DESC;",
                [res.rows[i].bottle_id],
                (err2, res2) => {
                    if(err2) console.log(err2);
                    else {
                        var pop = 1;
                        for(let j = 0; j < res2.rows.length; j++) {
                            pop = pop * .95 + Number(res2.rows[j].view_count ? res2.rows[j].view_count : 0) * .05;
                        }
                        var t = {id : res.rows[i].bottle_id, popularity : pop * Number(res.rows[i].score)};
                        table[i] = t;
                        done++;
                        if(done == res.rows.length) {
                            table.sort((a, b) => {
                                return b.popularity - a.popularity;
                            });
                            callback();
                        }
                    }
                });
            }
        }
    });
}

getTable = (client, callback) => {
    if(table.length == 0 || lastUpdated + loadDelay < Date.now()) {
        loadTable(client, () => {
            lastUpdated = Date.now();
            callback(table);
        });
    } else {
        callback(table);
    }
}

exports.getTopN = (n, offset, client, callback) => {
    getTable(client, tab => {
        callback(tab.slice(offset, offset + n));
    });
} 

exports.getTopPercentile = (id, client, callback) => {
    if(id != null) {
        getTable(client, tab => {
            for(let i = 0; i < tab.length; i++) {
                if(tab[i].id == id) {
                    var popStat = (i + 1.0) / tab.length;
                    callback(popStat);
                    return;
                }
            }
            callback(1.0);
        });
    } else callback(null);
}