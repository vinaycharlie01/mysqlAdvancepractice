CREATE DATABASE partitions;




USE partitions;

CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
)

PARTITION BY RANGE COLUMNS(hire_date) (
    PARTITION p_january VALUES LESS THAN ('2022-02-01'),
    PARTITION p_february VALUES LESS THAN ('2022-03-01'),
    PARTITION p_march VALUES LESS THAN ('2022-04-01'),
    PARTITION p_april VALUES LESS THAN ('2022-05-01'),
    PARTITION p_max VALUES LESS THAN (MAXVALUE)
);


SELECT * FROM information_schema.PARTITIONS WHERE TABLE_SCHEMA = 'partitions' AND TABLE_NAME = 'employee';

ALTER TABLE employee REMOVE PARTITIONING;





INSERT INTO employee 
VALUES
(1, 'John Doe', 'IT', 5000.00, '2022-01-05'),
(2, 'Jane Smith', 'HR', 4000.00, '2022-01-12'),
(3, 'Mike Johnson', 'Finance', 6000.00, '2022-01-15'),
(4, 'Sarah Brown', 'Marketing', 4500.00, '2022-01-22'),
(5, 'David Lee', 'Operations', 5500.00, '2022-01-29');

SELECT * FROM employee  PARTITION ( p_max);

INSERT INTO employee 
VALUES
(11, 'Emily Wilson', 'IT', 5200.00, '2022-07-03');


CREATE TABLE customers (
    id INT,
    name VARCHAR(50),
    country VARCHAR(50),
    user_id INT
)
PARTITION BY LIST(user_id) (
    PARTITION p_usa VALUES IN (1,2,3,4,5),
    PARTITION p_uk VALUES IN (6,7,8,9,10)

);

ALTER TABLE customers
PARTITION BY HASH(id)
PARTITIONS 20;

ALTER TABLE customers
DROP PARTITION HASH(id);



INSERT INTO customers VALUES (1,"VINAY","India",2);

SELECT * FROM customers PARTITION (id) ;


INSERT INTO customers VALUES (1,"VINAY","India",10);


SELECT *
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'partitions' AND TABLE_NAME = 'customers';
