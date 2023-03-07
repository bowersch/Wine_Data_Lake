DROP TABLE IF EXISTS ava CASCADE;
DROP TABLE IF EXISTS varietals CASCADE;
DROP TABLE IF EXISTS regional_varietals CASCADE;
DROP TABLE IF EXISTS techsheets CASCADE;
DROP TABLE IF EXISTS winemakers CASCADE;
DROP TABLE IF EXISTS wineries CASCADE;
DROP TABLE IF EXISTS bottle_data CASCADE;
DROP TABLE IF EXISTS qualities CASCADE;
DROP TABLE IF EXISTS wine_qualities CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS favorite_ava CASCADE;
DROP TABLE IF EXISTS favorite_qualities CASCADE;
DROP TABLE IF EXISTS favorite_techsheets CASCADE;
DROP TABLE IF EXISTS favorite_wineries CASCADE;
DROP TABLE IF EXISTS wine_views CASCADE;

CREATE TABLE IF NOT EXISTS ava
(
	ava_id           SERIAL PRIMARY KEY,

	ava_name         VARCHAR(255) UNIQUE NOT NULL,

	location	     VARCHAR(800),
	climate		     VARCHAR(800),
	soils			 VARCHAR(800),
	topography       VARCHAR(800)
);

CREATE TABLE IF NOT EXISTS varietals
(
	varietal_id      SERIAL PRIMARY KEY,

	varietal_name    VARCHAR(255) UNIQUE NOT NULL

);

CREATE TABLE IF NOT EXISTS regional_varietals
(

	reg_varietals_id SERIAL PRIMARY KEY,

	ava_id		     INTEGER REFERENCES ava(ava_id),
	varietal_id      INTEGER REFERENCES varietals(varietal_id)
);

CREATE TABLE IF NOT EXISTS techsheets
(
	techsheet_id     SERIAL PRIMARY KEY,

	source_file      VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS winemakers
(
	winemaker_id     SERIAL PRIMARY KEY,
	winemaker_name   VARCHAR(255) UNIQUE NOT NULL

);

CREATE TABLE IF NOT EXISTS wineries
(
	winery_id        SERIAL PRIMARY KEY,

	winery_name      VARCHAR(255) UNIQUE NOT NULL,
	winemaker_id     INTEGER REFERENCES winemakers(winemaker_id),

	address	         VARCHAR(255),
	phone_number     VARCHAR(30),
	winery_url		 VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS bottle_data
(
    bottle_id          SERIAL PRIMARY KEY,
    winery_id          INTEGER REFERENCES wineries(winery_id),
    year               VARCHAR(6) NOT NULL,
    wine_name          VARCHAR(255) NOT NULL,
    pct_alcohol        VARCHAR(10),
    ta                 VARCHAR(10),
    ph                 VARCHAR(10),
    soils              VARCHAR(255),
    varietal_id        INTEGER REFERENCES varietals(varietal_id),
    clones		       VARCHAR(255),
    clusters           VARCHAR(10),
    aging_process      VARCHAR(255),
    cases_produced     INTEGER,
    ava_id             INTEGER REFERENCES ava(ava_id),
    techsheet_id       INTEGER REFERENCES techsheets(techsheet_id),
    run_date           DATE DEFAULT CURRENT_DATE,
	winemaker_id       INTEGER REFERENCES winemakers(winemaker_id),
	description        VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS qualities
(
	quality_id	      SERIAL PRIMARY KEY,

	quality_name	  VARCHAR(30) UNIQUE NOT NULL,
	description		  VARCHAR(1000)

);

CREATE TABLE IF NOT EXISTS wine_qualities
(

	wine_quality_id  SERIAL PRIMARY KEY,

	bottle_id        INTEGER REFERENCES bottle_data(bottle_id),
	quality_id       INTEGER REFERENCES qualities(quality_id)
);

CREATE TABLE IF NOT EXISTS users
(	
	user_id         SERIAL PRIMARY KEY,

	username        VARCHAR(30) UNIQUE NOT NULL,
	user_auth		VARCHAR(255) NOT NULL,
	email           VARCHAR(50) UNIQUE NOT NULL

);

CREATE TABLE IF NOT EXISTS favorite_ava
(

	fav_ava_id       SERIAL PRIMARY KEY,

	user_id          INTEGER REFERENCES users(user_id),
	ava_id           INTEGER REFERENCES ava(ava_id),
	favorite_date	 DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS favorite_qualities
(

	fav_qualities_id SERIAL PRIMARY KEY,

	user_id          INTEGER REFERENCES users(user_id),
	quality_id       INTEGER REFERENCES qualities(quality_id),
	favorite_date	 DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS favorite_techsheets
(

	fav_techsheet_id SERIAL PRIMARY KEY,

	user_id          INTEGER REFERENCES users(user_id),
	techsheet_id     INTEGER REFERENCES techsheets(techsheet_id),
	favorite_date	 DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS favorite_wineries
(

	fav_winery_id    SERIAL PRIMARY KEY,

	user_id          INTEGER REFERENCES users(user_id),
	winery_id        INTEGER REFERENCES wineries(winery_id),
	favorite_date	 DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS wine_views
(

	wine_view_id	SERIAL PRIMARY KEY,
	user_id			INTEGER REFERENCES users(user_id),
	bottle_id		INTEGER REFERENCES bottle_data(bottle_id),
	view_date		DATE DEFAULT CURRENT_DATE,
	viewer_ip		VARCHAR(15)

);