
SELECT * 
FROM Sales s 
INNER JOIN Product p 
ON p.product_id=s.product_id;


SELECT *
FROM Visits v 
INNER JOIN NOT EXISTS Transactions t 
ON v.visit_id  !=t.visit_id;