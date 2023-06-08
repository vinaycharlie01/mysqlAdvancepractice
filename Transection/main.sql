
CREATE DATABASE IF NOT EXISTS tcl;

USE tcl;


CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT
);


INSERT INTO employees (id, name, age) VALUES (1, 'John', 30), (2, 'Sarah', 28);

START TRANSACTION;
UPDATE employees SET age = age + 1 WHERE id = 1;
COMMIT;

SELECT * FROM employees;


START TRANSACTION;
UPDATE employees SET age = age + 1 WHERE id = 1;
ROLLBACK;