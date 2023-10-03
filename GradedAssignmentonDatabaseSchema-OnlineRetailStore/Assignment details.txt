You are working with a database for an online retail store. Here's an overview of the database schema:

- Customers table:

- `customer_id` (Primary Key)

- `first_name'

- `last_name`

- `email`

- Orders table:

- `order_id` (Primary Key)

- `customer_id` (Foreign Key)

- `order_date`

- `total_amount`

- Products table:

- `product_id` (Primary Key)

- `product_name`

- `category_id` (Foreign Key)

- `price`

- Categories table:

- `category_id` (Primary Key)

- `category_name`

Instructions:

In this assignment, you will use SQL to retrieve and manipulate data from the database. The following queries involve complex scenarios:

Basic Queries:

1. Retrieve a list of all customers along with their email addresses.

2. Find the total number of orders placed by each customer.

3. List all products along with their prices.

4. Retrieve the category with the highest number of products.

Intermediate Queries:

5. Find all customers who have not placed any orders.

6. List the products with the highest and lowest prices.

7. Calculate the average order amount for each customer.

8. Find the categories that do not have any products.

Advanced Queries:

9. Retrieve a list of customers who have placed orders for products with a price higher than $100.

10. List the customers who have placed orders for products from at least three different categories.

11. Find the products with the highest and lowest average customer ratings (if a rating table is available).

12. Calculate the total revenue generated from each category.

Complex Queries:

13. Retrieve the names of customers who have placed orders in the last 30 days.

14. List the products that have been out of stock for more than 7 days.

15. Find the products that have the highest fluctuation in price (i.e., the products where the difference between the highest and lowest prices is the greatest).

16. Create a summary report showing the category names, the total number of products in each category, and the total revenue generated from products in each category.

Expert-Level Queries:

17. Retrieve a list of customers who have placed orders for every product in a specific category.

18. Calculate the average order amount for each month over the past year.

19. Find the customers who have placed orders with a total amount that is significantly higher than their average order amount.

20. Create a report that displays the top 5 best-selling products in each category.