CREATE TABLE IF NOT EXISTS regional_varietals
(
	ava_id		     INTEGER REFERENCES ava(ava_id),
	varietal_id      INTEGER REFERENCES varietals(varietal_id)
);

CREATE TABLE IF NOT EXISTS techsheets
(
	techsheet_id     SERIAL PRIMARY KEY,
	source_file      VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS varietals
(
	varietal_id      SERIAL PRIMARY KEY,
	varietal_name    VARCHAR(255)	
);

CREATE TABLE IF NOT EXISTS wineries
(
	winery_id        SERIAL PRIMARY KEY,
	winery_name      VARCHAR(255) NOT NULL,
	winemaker        VARCHAR(255),
	address	         VARCHAR(255),
	phone_number     VARCHAR(30),
	winery_url		 VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ava
(
	ava_id           SERIAL PRIMARY KEY,
	ava_name         VARCHAR(255) NOT NULL,
	location	     VARCHAR(800),
	climate		     VARCHAR(800),
	soils			 VARCHAR(800),
	topography       VARCHAR(800)
);

CREATE TABLE IF NOT EXISTS bottle_data
(
    bottle_id          serial PRIMARY KEY,
    winery_id          INTEGER REFERENCES wineries(winery_id),
    year               varchar(6) NOT NULL,
    wine_name          varchar(255),
    pct_alcohol        varchar(10),
    ta                 varchar(10),
    ph                 varchar(10),
    soils              varchar(255),
    varietal_id      INTEGER REFERENCES varietals(varietal_id),
    clones		      varchar(255),
    clusters           varchar(10),
    aging_process      varchar(255),
    cases_produced     integer,
    ava_id             INTEGER REFERENCES ava(ava_id),
    techsheet_id       INTEGER REFERENCES techsheets(techsheet_id),
    run_date           date DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS qualities
(
	quality_id	      SERIAL PRIMARY KEY,
	quality_name	VARCHAR(30),
	description		VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS wine_qualities
(
	bottle_id        INTEGER REFERENCES bottle_data(bottle_id),
	quality_id       INTEGER REFERENCES qualities(quality_id)
);

CREATE TABLE IF NOT EXISTS users
(	
	user_id          SERIAL PRIMARY KEY,
	username         VARCHAR(30) NOT NULL,
	user_auth		VARCHAR(255) NOT NULL,
	email            VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS favorite_ava
(
	user_id          INTEGER REFERENCES users(user_id),
	ava_id           INTEGER REFERENCES ava(ava_id)
);

CREATE TABLE IF NOT EXISTS favorite_qualities
(
	user_id          INTEGER REFERENCES users(user_id),
	quality_id       INTEGER REFERENCES qualities(quality_id)
);

CREATE TABLE IF NOT EXISTS favorite_techsheets
(
	user_id          INTEGER REFERENCES users(user_id),
	techsheet_id     INTEGER REFERENCES techsheets(techsheet_id)
);

CREATE TABLE IF NOT EXISTS favorite_wineries
(
	user_id          INTEGER REFERENCES users(user_id),
	winery_id        INTEGER REFERENCES wineries(winery_id)
);