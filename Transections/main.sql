

CREATE DATABASE transection;


USE transection;

SHOW TABLES;


CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT
);

DROP TABLE IF EXISTS employee;

-- SET AUTOCOMMIT =0;


START TRANSACTION;
INSERT INTO employees (id, name, age) VALUES (3, 'John', 30), (4, 'Sarah', 28);
SAVEPOINT p1;
ROLLBACK;


INSERT INTO employees (id, name, age) VALUES (5, 'John', 30), (6, 'Sarah', 28);
SAVEPOINT p2;


INSERT INTO employees (id, name, age) VALUES (7, 'John', 30), (8, 'Sarah', 28);
SAVEPOINT p3;

ROLLBACK TO  p1;


TRUNCATE employees;

SELECT * FROM employees;


UPDATE employees SET age = age + 1 WHERE id = 1;
COMMIT;


START TRANSACTION;
UPDATE employees SET age = age + 1 WHERE id = 1;
ROLLBACK;



START TRANSACTION;
UPDATE employees SET age = age + 1 WHERE id = 1;
SAVEPOINT up2;

START TRANSACTION;
UPDATE employees SET age = age + 1 WHERE id = 1;
SAVEPOINT up1;

START TRANSACTION;
UPDATE employees SET age = age + 1 WHERE id = 1;
SAVEPOINT sp1;
UPDATE employees SET age = age + 1 WHERE id = 2;
ROLLBACK ;
COMMIT;

SELECT * FROM employees;

SHOW SAVEPOINT;





