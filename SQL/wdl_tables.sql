DROP TABLE IF EXISTS ava CASCADE;
DROP TABLE IF EXISTS varietals CASCADE;
DROP TABLE IF EXISTS regional_varietals CASCADE;
DROP TABLE IF EXISTS techsheets CASCADE;
DROP TABLE IF EXISTS winemakers CASCADE;
DROP TABLE IF EXISTS wineries CASCADE;
DROP TABLE IF EXISTS sweetness CASCADE;
DROP TABLE IF EXISTS body CASCADE;
DROP TABLE IF EXISTS bottle_data CASCADE;
DROP TABLE IF EXISTS qualities CASCADE;
DROP TABLE IF EXISTS wine_qualities CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS favorite_ava CASCADE;
DROP TABLE IF EXISTS favorite_qualities CASCADE;
DROP TABLE IF EXISTS favorite_techsheets CASCADE;
DROP TABLE IF EXISTS favorite_wineries CASCADE;
DROP TABLE IF EXISTS wine_views CASCADE;
DROP TABLE IF EXISTS locations CASCADE;

CREATE TABLE IF NOT EXISTS locations 
(
	location_id		    SERIAL PRIMARY KEY,
	city			        VARCHAR(255),
	region			      VARCHAR(255),
	country			      VARCHAR(255),
	continent		      VARCHAR(255),
	postal			      VARCHAR(64),
	latitude		      FLOAT(12),
	longitude		      FLOAT(12)
);

CREATE TABLE IF NOT EXISTS ava
(
	ava_id            SERIAL PRIMARY KEY,

	ava_name          VARCHAR(255) UNIQUE NOT NULL,
	location	        VARCHAR(800),
	climate		        VARCHAR(800),
	soils			        VARCHAR(800),
	topography        VARCHAR(800)
);

CREATE TABLE IF NOT EXISTS varietals
(
	varietal_id       SERIAL PRIMARY KEY,

	varietal_name     VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS regional_varietals
(
	reg_varietals_id  SERIAL PRIMARY KEY,

	ava_id		        INTEGER REFERENCES ava(ava_id),
	varietal_id       INTEGER REFERENCES varietals(varietal_id)
);

CREATE TABLE IF NOT EXISTS techsheets
(
	techsheet_id      SERIAL PRIMARY KEY,

	source_file       VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS winemakers
(
	winemaker_id      SERIAL PRIMARY KEY,
	winemaker_name    VARCHAR(255) UNIQUE NOT NULL

);

CREATE TABLE IF NOT EXISTS wineries
(
	winery_id         SERIAL PRIMARY KEY,

	winery_name       VARCHAR(255) UNIQUE NOT NULL,
	winemaker_id      INTEGER REFERENCES winemakers(winemaker_id),

	address	          VARCHAR(255),
	phone_number      VARCHAR(30),
	winery_url		    VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS sweetness
(
	sweetness_id      SERIAL PRIMARY KEY,
	sweetness_level   VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS body
(
	body_id           SERIAL PRIMARY KEY,
	body_level        VARCHAR(8) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS bottle_data
(
    bottle_id       SERIAL PRIMARY KEY,
    winery_id       INTEGER REFERENCES wineries(winery_id),
    year            VARCHAR(6) NOT NULL,
    wine_name       VARCHAR(255) NOT NULL,
    pct_alcohol     VARCHAR(10),
    ta              VARCHAR(10),
    ph              VARCHAR(10),
    soils           VARCHAR(255),
    varietal_id     INTEGER REFERENCES varietals(varietal_id),
    clones		      VARCHAR(255),
    clusters        VARCHAR(10),
    aging_process   VARCHAR(255),
    cases_produced  INTEGER,
    ava_id          INTEGER REFERENCES ava(ava_id),
    techsheet_id    INTEGER REFERENCES techsheets(techsheet_id),
    run_date        DATE DEFAULT CURRENT_DATE,
    winemaker_id    INTEGER REFERENCES winemakers(winemaker_id),
    description     VARCHAR(1000),
    sweetness_id    INTEGER REFERENCES sweetness(sweetness_id),
    body_id         INTEGER REFERENCES body(body_id)
);

CREATE TABLE IF NOT EXISTS qualities
(
	quality_id	      SERIAL PRIMARY KEY,

	quality_name	    VARCHAR(30) UNIQUE NOT NULL,
	description		    VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS wine_qualities
(
	wine_quality_id  SERIAL PRIMARY KEY,

	bottle_id        INTEGER REFERENCES bottle_data(bottle_id),
	quality_id       INTEGER REFERENCES qualities(quality_id)
);

CREATE TABLE IF NOT EXISTS users
(	
	user_id          SERIAL PRIMARY KEY,

	username         VARCHAR(30) UNIQUE NOT NULL,
	user_auth		     VARCHAR(255) NOT NULL,
	email            VARCHAR(50) UNIQUE NOT NULL,
	token		         VARCHAR(10),
	token_created    BIGINT
);

CREATE TABLE IF NOT EXISTS favorite_ava
(
	fav_ava_id       SERIAL PRIMARY KEY,

	user_id          INTEGER REFERENCES users(user_id),
	ava_id           INTEGER REFERENCES ava(ava_id),
	favorite_date		 DATE DEFAULT CURRENT_DATE,
	user_ip		       VARCHAR(15),
	user_location	   INTEGER REFERENCES locations(location_id)
);

CREATE TABLE IF NOT EXISTS favorite_qualities
(
	fav_qualities_id SERIAL PRIMARY KEY,

	user_id          INTEGER REFERENCES users(user_id),
	quality_id       INTEGER REFERENCES qualities(quality_id),
	favorite_date		 DATE DEFAULT CURRENT_DATE,
	user_ip		       VARCHAR(15),
	user_location	   INTEGER REFERENCES locations(location_id)
);

CREATE TABLE IF NOT EXISTS favorite_techsheets
(
	fav_techsheet_id SERIAL PRIMARY KEY,

	user_id          INTEGER REFERENCES users(user_id),
	techsheet_id     INTEGER REFERENCES techsheets(techsheet_id),
	favorite_date		 DATE DEFAULT CURRENT_DATE,
	user_ip		       VARCHAR(15),
	user_location	   INTEGER REFERENCES locations(location_id)
);

CREATE TABLE IF NOT EXISTS favorite_wineries
(
	fav_winery_id    SERIAL PRIMARY KEY,

	user_id          INTEGER REFERENCES users(user_id),
	winery_id        INTEGER REFERENCES wineries(winery_id),
	favorite_date		 DATE DEFAULT CURRENT_DATE,
	user_ip		       VARCHAR(15),
	user_location	   INTEGER REFERENCES locations(location_id)
);


CREATE OR REPLACE VIEW wine_data AS
	SELECT 
		bd.bottle_id,
		bd.wine_name,
		v.varietal_name,
		w.winery_name,
		wm.winemaker_name,
		av.ava_name,
		bd.year,
		th.techsheet_id,
		ts.source_file,
		bd.description
	FROM bottle_data AS bd
		LEFT OUTER JOIN varietals AS v
			ON bd.varietal_id = v.varietal_id
		LEFT OUTER JOIN wineries AS w
			ON bd.winery_id = w.winery_id
		LEFT OUTER JOIN winemakers AS wm
			ON bd.winemaker_id = wm.winemaker_id
		LEFT OUTER JOIN ava AS av
			ON bd.ava_id = av.ava_id
		LEFT OUTER JOIN techsheets AS ts
			ON bd.techsheet_id = ts.techsheet_id;


CREATE TABLE IF NOT EXISTS wine_views
(
	wine_view_id	  SERIAL PRIMARY KEY,
	user_id			    INTEGER REFERENCES users(user_id),
	bottle_id		    INTEGER REFERENCES bottle_data(bottle_id),
	view_date		    DATE DEFAULT CURRENT_DATE,
	user_ip		      VARCHAR(15),
	user_location	  INTEGER REFERENCES locations(location_id)
);
