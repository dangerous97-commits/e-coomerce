-- 1.1 Customers Name,Emails
SELECT name, email FROM Customers;

-- 1.2 Where Clause
SELECT * FROM Customers
WHERE country = 'India';

-- 1.3 Order By
SELECT order_id, customer_id, total_amount
FROM Orders
ORDER BY total_amount DESC;

-- 1.4 Group By
SELECT p.category, SUM(od.price * od.quantity) AS total_sales
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.category;

-- 2.1 INNER JOIN:
SELECT o.order_id, c.name, o.total_amount
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

-- 2.2 LEFT JOIN:
SELECT p.product_name, COALESCE(SUM(od.quantity), 0) AS total_sold
FROM Products p
LEFT JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.product_name;

-- 2.3 RIGHT JOIN: 
SELECT c.name, o.order_id, o.total_amount
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;




--Sub-query
SELECT name
FROM Customers
WHERE customer_id = (
    SELECT TOP 1 customer_id
    FROM Orders
    GROUP BY customer_id
    ORDER BY SUM(total_amount) DESC
);



