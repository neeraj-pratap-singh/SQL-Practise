Basic Queries:

1. Retrieve a list of all customers along with their email addresses.
Query:-
SELECT first_name, last_name, email FROM Customers;


2. Find the total number of orders placed by each customer.
Query:-
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;


3. List all products along with their prices.
Query:-
SELECT product_id, product_name, price
FROM Products;


4. Retrieve the category with the highest number of products.
Query:-
SELECT category_id, COUNT(*) AS product_count
FROM Products
GROUP BY category_id
ORDER BY product_count DESC
LIMIT 1;