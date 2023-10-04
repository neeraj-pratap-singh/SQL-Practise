Expert-Level Queries:

17. Retrieve a list of customers who have placed orders for every product in a specific category.
Query:-
SELECT c.customer_id, c.first_name, c.last_name
FROM Customers c
WHERE NOT EXISTS (
    SELECT p.product_id
    FROM Products p
    WHERE p.category_id = 2 -- specify the category_id here
    AND NOT EXISTS (
        SELECT o.order_id
        FROM Orders o
        JOIN OrderDetails od ON o.order_id = od.order_id
        WHERE od.product_id = p.product_id AND o.customer_id = c.customer_id
    )
);


18. Calculate the average order amount for each month over the past year.
Query:-
SELECT 
    MONTH(order_date) AS month,
    YEAR(order_date) AS year,
    AVG(total_amount) AS average_order_amount
FROM Orders
WHERE order_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND CURDATE()
GROUP BY MONTH(order_date), YEAR(order_date)
ORDER BY year, month;


19. Find the customers who have placed orders with a total amount that is significantly higher than their average order amount.
Query:-
SELECT o.customer_id, c.first_name, c.last_name, o.order_id, o.total_amount, avg_orders.avg_amount
FROM Orders AS o
JOIN Customers AS c ON o.customer_id = c.customer_id
JOIN (
    SELECT customer_id, AVG(total_amount) AS avg_amount
    FROM Orders
    GROUP BY customer_id
) AS avg_orders ON o.customer_id = avg_orders.customer_id
WHERE o.total_amount > avg_orders.avg_amount * 1.5 -- 1.5 times the average as a threshold
ORDER BY o.customer_id, o.total_amount DESC;


20. Create a report that displays the top 5 best-selling products in each category.
Query:-
SELECT c.category_name, p.product_name, SUM(od.quantity) AS total_sales
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
JOIN OrderDetails od ON p.product_id = od.product_id
JOIN Orders o ON od.order_id = o.order_id
GROUP BY c.category_id, p.product_id
HAVING total_sales = (
  SELECT MAX(S.total_sales)
  FROM (
    SELECT SUM(od2.quantity) AS total_sales
    FROM Products p2
    JOIN OrderDetails od2 ON p2.product_id = od2.product_id
    JOIN Orders o2 ON od2.order_id = o2.order_id
    WHERE p2.category_id = c.category_id
    GROUP BY p2.product_id
  ) S
)
ORDER BY c.category_id;
