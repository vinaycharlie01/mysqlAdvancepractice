

USE relationships;

SHOW TABLES;
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50)
  -- other customer columns
);


SELECT * FROM customers;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50)
  -- other product columns
);

SELECT * FROM products;


CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  order_date DATE,
  -- other order columns
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

SELECT * FROM orders;

INSERT INTO Customers (customer_id, customer_name)
VALUES (1, 'John Doe'),
       (2, 'Jane Smith');

INSERT INTO Products (product_id, product_name)
VALUES (1, 'Product A'),
       (2, 'Product B'),
       (3, 'Product C');

INSERT INTO Orders (order_id, customer_id, product_id, order_date)
VALUES (1, 1, 1, '2022-01-01'),
       (2, 1, 2, '2022-01-02'),
       (3, 2, 1, '2022-01-03');




-- Retrieve all orders with the corresponding customer and product information:

SELECT o.order_id, c.customer_name, p.product_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id;


-- Retrieve all orders placed by a specific customer:
SELECT o.order_id, p.product_name
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
WHERE o.customer_id = 1;


-- Retrieve all customers who have ordered a specific product:
SELECT c.customer_name, o.order_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.product_id = 1;