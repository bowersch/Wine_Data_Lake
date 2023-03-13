module.exports = function(router, client) {

    console.log("api loaded.");

    router.get("/wines", (req, res) => {

        client.query("SELECT wine_name, year, pct_alcohol FROM bottle_data WHERE year = $1;",
        [req.query.year],
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

        client.query("SELECT locations.city, COUNT(city) FROM locations GROUP BY city ORDER BY COUNT(city) DESC;",
        [],
        (err, res2) => {
            if(err) {
                console.log(err);
                res.status(500).send("[]");
            } else {
                res.send(res2.rows);
            }
        });

    });

}