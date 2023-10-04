Intermediate Queries:

5. Find all customers who have not placed any orders.
Query:-
SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


6. List the products with the highest and lowest prices.
Query:-
-- Fetch the product with the highest price
SELECT product_id, product_name, price
FROM Products
WHERE price = (SELECT MAX(price) FROM Products)
UNION ALL
-- Fetch the product with the lowest price
SELECT product_id, product_name, price
FROM Products
WHERE price = (SELECT MIN(price) FROM Products);


7. Calculate the average order amount for each customer.
Query:-
SELECT o.customer_id, c.first_name, c.last_name, AVG(o.total_amount) AS avg_order_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.first_name, c.last_name;


8. Find the categories that do not have any products.
Query:-
SELECT c.category_id, c.category_name
FROM Categories c
LEFT JOIN Products p ON c.category_id = p.category_id
WHERE p.product_id IS NULL;
