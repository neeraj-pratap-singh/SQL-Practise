1. Create `Categories` table:

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

2. Create `Products` table:

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT REFERENCES Categories(category_id),
    price DECIMAL(10, 2)
);

3. Create `Customers` table:

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

4. Create `Orders` table:

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

5. Insert records into `Categories` table:

INSERT INTO Categories (category_id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Home Appliances'),
(4, 'Books'),
(5, 'Sports');

6. Insert records into `Products` table:

INSERT INTO Products (product_id, product_name, category_id, price)
VALUES
(1, 'iPhone 13', 1, 999.99),
(2, 'Nike Sneakers', 2, 120.00),
(3, 'Microwave Oven', 3, 80.00),
(4, 'Harry Potter Book', 4, 20.00),
(5, 'Soccer Ball', 5, 30.00);

7. Insert records into `Customers` table:

INSERT INTO Customers (customer_id, first_name, last_name, email)
VALUES
(1, 'Neeraj', 'Singh', 'neeraj.singh@gmail.com'),
(2, 'Ishani', 'Singh', 'ishani.singh@gmail.com'),
(3, 'Neelam', 'Rani', 'neelam.rani@gmail.com'),
(4, 'Shailja', 'Singh', 'shailja.singh@gmail.com'),
(5, 'Ishita', 'Singh', 'ishita.singh@gmail.com');

8. Insert records into `Orders` table:

INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
(1, 1, '2023-09-18', 999.99),
(2, 2, '2023-09-17', 120.00),
(3, 3, '2023-09-16', 80.00),
(4, 1, '2023-09-15', 20.00),
(5, 5, '2023-09-14', 30.00);