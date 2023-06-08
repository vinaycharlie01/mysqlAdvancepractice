


USE relationships;

SHOW TABLES;

CREATE TABLE city(
  city_id INT PRIMARY KEY,
  city_name VARCHAR(50),
  country VARCHAR(50)
);

SELECT * FROM City;


CREATE TABLE Citizen (
  citizen_id INT PRIMARY KEY,
  citizen_name VARCHAR(50),
  city_id INT,
  CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES City(city_id)
);

SELECT * FROM  Citizen;


INSERT INTO City (city_id, city_name, country) VALUES (1, 'New York', 'USA');
INSERT INTO City (city_id, city_name, country) VALUES (2, 'London', 'UK');

INSERT INTO Citizen (citizen_id, citizen_name, city_id) VALUES (1, 'John Doe', 1);
INSERT INTO Citizen (citizen_id, citizen_name, city_id) VALUES (2, 'Jane Smith', 1);
INSERT INTO Citizen (citizen_id, citizen_name, city_id) VALUES (3, 'Michael Johnson', 2);



SELECT Citizen.citizen_name, Citizen.citizen_id, City.city_name
FROM Citizen
INNER JOIN City ON Citizen.city_id = City.city_id;


SELECT *
FROM Citizen
INNER JOIN City ON Citizen.city_id = City.city_id;