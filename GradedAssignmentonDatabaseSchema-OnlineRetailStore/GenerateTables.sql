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

9. Create `OrderDetails` table:

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

10. Insert records into `OrderDetails` table:

INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES
(1, 1, 3),
(1, 2, 2),
(2, 3, 1),
(3, 4, 4),
(4, 1, 1),
(4, 3, 2),
(4, 5, 3),
(5, 2, 1),
(5, 4, 1),
(5, 6, 1);

11. Create `ProductPriceHistory` table:

CREATE TABLE ProductPriceHistory (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    price DECIMAL(10, 2),
    date_recorded DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


12. Insert records into `ProductPriceHistory` table:

-- Inserting historical prices for iPhone 13 with product_id = 1
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (1, 990.00, '2023-01-01');
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (1, 999.99, '2023-02-01');
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (1, 950.00, '2023-07-15');

-- Inserting historical prices for Nike Sneakers with product_id = 2
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (2, 115.00, '2023-01-01');
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (2, 120.00, '2023-02-01');

-- Inserting historical prices for Microwave Oven with product_id = 3
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (3, 85.00, '2023-01-01');
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (3, 80.00, '2023-02-01');

-- Inserting historical prices for Harry Potter Book with product_id = 4
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (4, 25.00, '2023-01-01');
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (4, 20.00, '2023-02-01');

-- Inserting historical prices for Soccer Ball with product_id = 5
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (5, 35.00, '2023-01-01');
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (5, 30.00, '2023-02-01');

-- Inserting historical prices for Nokia with product_id = 6
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (6, 45.00, '2023-01-01');
INSERT INTO ProductPriceHistory (product_id, price, date_recorded) VALUES (6, 40.00, '2023-02-01');
