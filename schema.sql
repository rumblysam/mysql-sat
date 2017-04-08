CREATE DATABASE IF NOT EXISTS TopSongs_DB;

USE TopSongs_DB;

CREATE TABLE IF NOT EXISTS songs (
    position INT NOT NULL,
    artist VARCHAR(100) NULL,
    song VARCHAR(100) NULL,
    year INT NULL,
    raw_total DECIMAL(10,4) NULL,
    raw_usa DECIMAL(10,4) NULL,
    raw_eur DECIMAL(10,4) NULL,
    raw_rwo DECIMAL(10,4) NULL,
    primary KEY (position)
);

LOAD DATA INFILE '/Users/samanthasmith/Documents/UT-coursework/Week13/sat/mysql-sat/TopSongs.csv'
INTO TABLE songs
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT * FROM songs;
