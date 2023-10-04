Complex Queries:

13. Retrieve the names of customers who have placed orders in the last 30 days.
Query:-
SELECT DISTINCT c.first_name, c.last_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;


14. List the products that have been out of stock for more than 7 days.
-- In order to list products that have been out of stock for more than 7 days, we need a field in the Products table that indicates the date when the product went out of stock. Let's add such a field named out_of_stock_date.
Query:-
SELECT product_id, product_name
FROM Products
WHERE out_of_stock_date <= CURDATE() - INTERVAL 7 DAY;


15. Find the products that have the highest fluctuation in price (i.e., the products where the difference between the highest and lowest prices is the greatest).
Query:-
SELECT 
    p.product_id, 
    p.product_name,
    MAX(pph.price) - MIN(pph.price) AS price_fluctuation
FROM 
    ProductPriceHistory pph
JOIN 
    Products p ON pph.product_id = p.product_id
GROUP BY 
    p.product_id, p.product_name
ORDER BY 
    price_fluctuation DESC
LIMIT 1;


16. Create a summary report showing the category names, the total number of products in each category, and the total revenue generated from products in each category.
Query:-
SELECT 
    c.category_name,
    COUNT(DISTINCT p.product_id) AS total_products,
    SUM(o.total_amount) AS total_revenue
FROM 
    Categories c
LEFT JOIN 
    Products p ON c.category_id = p.category_id
LEFT JOIN 
    Orders o ON p.product_id = (SELECT product_id FROM Orders WHERE customer_id = o.customer_id LIMIT 1)
GROUP BY 
    c.category_id, c.category_name
ORDER BY 
    total_revenue DESC;
