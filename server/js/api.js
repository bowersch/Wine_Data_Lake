module.exports = function(router, client, popularityJS) {

    console.log("api loaded.");

    router.get("/wines", (req, res) => {

        client.query("SELECT * FROM wine_data ORDER BY wine_name LIMIT $1 OFFSET $2;",
        [req.query.limit, req.query.offset],
        (err, res2) => {
            if(err) {
                console.log(err);
                res.status(500).send("[]");
            } else {
                res.send(res2.rows);
            }
        });

    });

    router.get("/winePopularity", (req, res) => {

        client.query("SELECT COUNT(*) AS view_count, wine_views.view_date as date FROM wine_views WHERE wine_views.bottle_id = $1 GROUP BY wine_views.view_date ORDER BY wine_views.view_date DESC;", 
        [req.query.id], 
        (err, res2) => {
            if(err) {
                console.log(err);
                res.status(500).send("[]");
            } else {
                res.send(res2.rows);
            }
        });

    });

    router.get("/favoriteScores", (req, res) => {
        client.query("SELECT wine_qualities.bottle_id, COUNT(*) AS score FROM wine_qualities INNER JOIN qualities ON wine_qualities.quality_id = qualities.quality_id INNER JOIN favorite_qualities ON wine_qualities.quality_id = favorite_qualities.quality_id GROUP BY wine_qualities.bottle_id ORDER BY score DESC;", 
        [], 
        (err, res2) => {
            if(err) {
                console.log(err);
                res.status(500).send([]);
            } else {
                res.send(res2.rows);
            }
        });
    });

    router.get("/test", (req, res) => {
        popularityJS.getTopN(5, req.query.page * 5, client, table => {
            res.send(table);
        })
    });

}