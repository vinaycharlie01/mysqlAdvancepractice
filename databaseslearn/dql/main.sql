


CREATE DATABASE temp;


USE temp;


DROP DATABASE IF EXISTS temp;

SHOW DATABASES;

CREATE Table emp(
    id int,
    name VARCHAR(255),
    email VARCHAR(30)
);

RENAME TABLE emp to emp1;

RENAME TABLE emp1 to emp;


DESCRIBE emp;

ALTER TABLE emp
    ADD COLUMN city VARCHAR(255);

ALTER TABLE emp
    DROP COLUMN city ;

ALTER TABLE emp
    CHANGE COLUMN  city TO city VARCHAR(255);



ALTER Table emp
    MODIFY COLUMN _id int;


ALTER TABLE emp



INSERT INTO emp VALUES(_id,name,email,city);


use sakila;


SHOW TABLES;


SELECT * FROM country;

CREATE VIEW Helloworld AS
SELECT * 
FROM country
WHERE country_id =MOD(country_id,2)=0;


SELECT * FROM Helloworld;