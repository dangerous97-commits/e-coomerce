-- View 
CREATE VIEW top_customers AS
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

SELECT * 
FROM top_customers
ORDER BY total_spent DESC;

