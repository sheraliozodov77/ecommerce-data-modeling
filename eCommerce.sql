-- 1. Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50)
);

-- 2. Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    customer_address TEXT,
    customer_state_code VARCHAR(2),
    customer_zipcode VARCHAR(10),
    registration_date DATE
);


-- 3. Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);



-- 4. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);



-- 5. Order Details Table
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    price_at_time_of_order DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);



-- 6. Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(20),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);



-- Insert into Categories Table
INSERT INTO Categories (category_name)
VALUES ('Electronics'), ('Appliances'), ('Apparel'), ('Books'), ('Toys');



-- Insert into Customers
INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, customer_address, customer_state_code, customer_zipcode, registration_date)
VALUES
(3, 'Steven', 'Guzman', 'herringwilliam@hotmail.com', '319-150-8751', '53373 James Loop', 'GA', '08148', '2020-05-11'),
(4, 'Cory', 'Pena', 'bakermark@yahoo.com', '520-844-2197', '265 Espinoza Grove', 'CT', '89745', '2022-02-05'),
(5, 'Robert', 'Ferguson', 'dpatterson@gmail.com', '831-828-2224', '738 Logan Passage', 'AL', '23677', '2022-08-16'),
(13, 'Christopher', 'Taylor', 'zbrown@gmail.com', '847-689-6816', '39122 Charles Stravenue', 'ID', '23380', '2023-11-13'),
(18, 'Sean', 'Cook', 'alan69@yahoo.com', '554-977-9877', '537 Krueger Road', 'NE', '36881', '2021-05-21'),
(21, 'Sara', 'Holloway', 'michele85@yahoo.com', '169-181-1444', '410 Steven Forges', 'MO', '03231', '2022-08-16'),
(23, 'Donna', 'Davidson', 'patriciahamilton@gmail.com', '748-995-0405', '834 Tammy Spur', 'SC', '03367', '2023-05-03'),
(26, 'Shaun', 'Burns', 'pbarrett@gmail.com', '441-266-8305', '739 Amanda Parks', 'MD', '72928', '2024-07-16'),
(27, 'Tina', 'Butler', 'sgraham@hotmail.com', '896-802-4008', '553 Becker Stravenue', 'WA', '63047', '2020-01-15'),
(28, 'Jason', 'Cook', 'matthewsantiago@hotmail.com', '484-139-7774', '55841 Andrea Island', 'ME', '61731', '2020-08-18'),
(33, 'Michael', 'Thompson', 'masseykatrina@gmail.net', '840-234-8780', '57798 Timothy Motorway', 'SD', '03395', '2021-08-20'),
(35, 'Ryan', 'Solis', 'william08@gmail.com', '461-636-4098', '38468 Christine Underpass', 'OH', '33245', '2024-03-27');



-- Insert into Products
INSERT INTO Products (product_id, product_name, description, price, category_id)
VALUES
(108, 'Blender', 'High-speed blender', 100, 2),
(105, 'Smartwatch', 'Fitness tracking watch', 250, 1),
(103, 'Coffee Maker', '12-cup coffee maker', 80, 2),
(110, 'Tablet', '10-inch tablet', 300, 1),
(101, 'Laptop', 'High-performance laptop', 1200, 1),
(102, 'Headphones', 'Noise-cancelling headphones', 150, 1),
(107, 'Toy Car', 'Remote-controlled toy car', 40, 5),
(106, 'Novel', 'Bestselling fiction novel', 20, 4),
(109, 'T-shirt', 'Cotton t-shirt', 25, 3),
(104, 'Running Shoes', 'Lightweight running shoes', 60, 3);



-- Insert into Orders
INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status)
VALUES
(1098, 3, '2024-01-13', 976.9, 'cancelled'),
(1073, 4, '2024-06-27', 1485.58, 'cancelled'),
(1049, 4, '2024-09-24', 353.44, 'cancelled'),
(1018, 4, '2024-03-02', 464.89, 'cancelled'),
(1012, 5, '2024-08-17', 1306.7, 'pending'),
(1057, 5, '2024-04-08', 1362.64, 'delivered'),
(1023, 5, '2024-07-19', 113.1, 'pending'),
(1100, 5, '2024-07-08', 471.53, 'cancelled'),
(1030, 5, '2024-04-07', 428.43, 'cancelled'),
(1050, 5, '2024-01-23', 246.62, 'delivered'),
(1053, 5, '2024-07-08', 690.26, 'cancelled'),
(1036, 13, '2024-08-16', 673.75, 'delivered'),
(1026, 18, '2024-05-22', 173.74, 'delivered'),
(1003, 18, '2024-07-05', 357.22, 'delivered'),
(1086, 21, '2024-09-29', 63.37, 'cancelled'),
(1060, 23, '2024-07-14', 1135.98, 'shipped'),
(1019, 26, '2024-05-15', 320.13, 'delivered'),
(1033, 28, '2024-04-22', 123.79, 'shipped'),
(1001, 28, '2024-03-15', 517.53, 'shipped'),
(1037, 28, '2024-05-31', 128.7, 'shipped'),
(1041, 28, '2024-02-16', 444.85, 'delivered'),
(1011, 33, '2024-03-22', 93.95, 'delivered'),
(1031, 35, '2024-03-03', 609.31, 'pending'),
(1061, 35, '2024-07-13', 213.29, 'cancelled'),
(1038, 35, '2024-07-07', 1464.76, 'delivered'),
(1078, 35, '2024-05-04', 1467.32, 'delivered');



-- Insert into OrderDetails
INSERT INTO OrderDetails (order_id, product_id, quantity, price_at_time_of_order)
VALUES
(1098, 108, 5, 500),
(1073, 105, 1, 250),
(1049, 103, 4, 320),
(1018, 110, 2, 600),
(1012, 110, 5, 1500),
(1057, 103, 1, 80),
(1023, 108, 5, 500),
(1100, 110, 2, 600),
(1030, 101, 3, 3600),
(1050, 105, 5, 1250),
(1053, 110, 2, 600),
(1036, 103, 4, 320),
(1026, 110, 1, 300),
(1003, 102, 3, 450),
(1086, 107, 5, 200),
(1060, 106, 4, 80),
(1019, 102, 3, 450),
(1086, 108, 3, 300),
(1053, 102, 4, 600),
(1033, 102, 2, 300),
(1001, 102, 4, 600),
(1037, 110, 2, 600),
(1041, 105, 1, 250),
(1011, 102, 2, 300),
(1031, 109, 2, 50),
(1061, 106, 4, 80),
(1038, 107, 4, 160),
(1078, 110, 5, 1500),
(1033, 110, 4, 1200),
(1050, 110, 2, 600);




-- Insert into Payments
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status)
VALUES
(5089, 1098, '2024-04-08', 'Credit Card', 'successful'),
(5064, 1073, '2024-08-02', 'PayPal', 'successful'),
(5072, 1049, '2024-09-28', 'Debit Card', 'failed'),
(5046, 1018, '2024-07-19', 'PayPal', 'pending'),
(5056, 1012, '2024-09-17', 'PayPal', 'failed'),
(5017, 1023, '2024-07-25', 'Credit Card', 'successful'),
(5030, 1100, '2024-08-12', 'Credit Card', 'successful'),
(5069, 1030, '2024-05-20', 'Debit Card', 'successful'),
(5025, 1050, '2024-10-17', 'Credit Card', 'successful'),
(5059, 1053, '2024-08-16', 'Debit Card', 'successful'),
(5011, 1036, '2024-09-04', 'Debit Card', 'successful'),
(5093, 1026, '2024-06-11', 'Debit Card', 'pending'),
(5022, 1003, '2024-08-13', 'Debit Card', 'successful'),
(5020, 1086, '2024-10-15', 'Credit Card', 'failed'),
(5023, 1060, '2024-07-20', 'PayPal', 'successful'),
(5052, 1019, '2024-06-15', 'Credit Card', 'pending'),
(5065, 1086, '2024-10-09', 'Credit Card', 'pending'),
(5088, 1053, '2024-09-19', 'PayPal', 'pending'),
(5042, 1033, '2024-10-14', 'Debit Card', 'successful'),
(5006, 1001, '2024-07-19', 'Debit Card', 'pending'),
(5054, 1037, '2024-06-09', 'Credit Card', 'successful'),
(5048, 1011, '2024-09-18', 'Credit Card', 'failed'),
(5028, 1031, '2024-06-26', 'Debit Card', 'pending'),
(5029, 1061, '2024-07-30', 'Credit Card', 'pending'),
(5040, 1038, '2024-07-26', 'PayPal', 'failed'),
(5009, 1078, '2024-05-19', 'PayPal', 'successful'),
(5034, 1050, '2024-08-17', 'Debit Card', 'failed'),
(5060, 1053, '2024-09-29', 'Debit Card', 'pending');




--
SELECT * FROM Categories
ORDER BY category_id


--
SELECT * FROM Customers
ORDER BY customer_id



--
SELECT * FROM Products
ORDER BY product_id


--
SELECT * FROM Orders


--
SELECT * FROM OrderDetails
ORDER BY order_id, product_id


--
SELECT * FROM Payments
ORDER BY payment_id


--
SELECT * FROM eCommerce.OrderDetails od
INNER JOIN eCommerce.Orders o ON od.order_id = o.order_id 
INNER JOIN eCommerce.Products p ON p.product_id  = od.product_id 


--
SELECT 
    Customers.customer_id, 
    Customers.first_name, 
    Customers.last_name, 
    Orders.order_id, 
    Orders.order_date, 
    Orders.total_amount
FROM Customers
LEFT OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id
ORDER BY Customers.customer_id;


--
SELECT c.customer_id, c.first_name, c.last_name, o.total_amount
FROM eCommerce.Customers c
INNER JOIN eCommerce.Orders o ON c.customer_id = o.customer_id
WHERE o.total_amount = (
    SELECT MAX(total_amount) 
    FROM eCommerce.Orders
)
ORDER BY c.customer_id;


--
SELECT o.order_id, o.customer_id, o.order_date, o.total_amount
FROM eCommerce.Orders o
WHERE o.customer_id IN (
    SELECT customer_id
    FROM eCommerce.Customers
    WHERE YEAR(registration_date) = 2022
)
ORDER BY o.order_id;


--
SELECT 
    customer_id, 
    SUM(total_amount) AS total_spent, 
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id;

--
SELECT p.product_id, p.product_name
FROM Products p
WHERE p.product_id NOT IN (
    SELECT DISTINCT od.product_id
    FROM OrderDetails od
)
ORDER BY p.product_id;


--
SELECT 
    o.order_id,
    o.total_amount,
    CASE 
        WHEN o.total_amount > 1000 THEN 'High Value'
        WHEN o.total_amount BETWEEN 500 AND 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_category
FROM Orders o
ORDER BY o.order_id;


--
SELECT c.customer_id, c.first_name, c.last_name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
)
ORDER BY c.customer_id;


--
SELECT p.product_id, p.product_name, p.price
FROM Products p
WHERE p.product_id IN (
    SELECT od.product_id
    FROM OrderDetails od
    WHERE od.quantity IS NOT NULL
)
ORDER BY p.product_id;

