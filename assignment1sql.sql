DROP DATABASE IF EXISTS Shopping_Management;

CREATE DATABASE Shopping_Management;

USE Shopping_Management;

CREATE TABLE customers (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone_Number CHAR(10) NOT NULL UNIQUE,
    Age INT CHECK (Age > 0),
    Gender ENUM('Male', 'Female', 'Other'),
    Country VARCHAR(50) DEFAULT 'India',
    City VARCHAR(50) NOT NULL,
    Pincode CHAR(6) DEFAULT '201301',
    Registration_Date DATE DEFAULT (CURRENT_DATE),
    Registration_Time TIME DEFAULT (CURRENT_TIME),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Address VARCHAR(250),
    Customer_Status ENUM('Active', 'Inactive', 'Blocked') DEFAULT 'Active',
    Customer_Notes TINYTEXT
);

SELECT * FROM customers;

INSERT INTO customers
(Customer_Name, Email, Phone_Number, Age, Gender, City, Address)
VALUES
('Suhail Choudhary', 'Suhail@gmail.com', '9876000000', 19, 'Male', 'Noida', 'Sector 6 Noida'),
('Sameer Choudhary', 'Sameer@gmail.com', '9123000000', 20, 'Female', 'Delhi', 'Sector 43 Delhi'),
('Harsh Dubey', 'Harsh@gmail.com', '9988000000', 29, 'Male', 'Mumbai', 'Sector 4 Mumbai'),
('Zubair Choudhary', 'Zubair@gmail.com', '9654320000', 18, 'Female', 'Jaipur', 'Sector 126 Jaipur'),
('Vaibhav Panchal', 'Vaibhav@gmail.com', '9345670000', 18, 'Male', 'Lucknow', 'Ring Road Lucknow');

SELECT * FROM customers;

CREATE TABLE orders (
    Order_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Id INT,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Order_Amount DECIMAL(10,2) NOT NULL,
    Order_Status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    Payment_Method ENUM('Cash', 'Card', 'UPI', 'Net Banking'),
    Payment_Status ENUM('Pending', 'Paid', 'Failed') DEFAULT 'Pending',
    Shipping_Address VARCHAR(250) NOT NULL,
    Delivery_Pincode CHAR(6),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Discount_Amount DECIMAL(10,2) DEFAULT 0.00,
    Delivery_Date DATE NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tracking_Number VARCHAR(30) UNIQUE,
    Delivery_Status ENUM('Not Dispatched', 'In Transit', 'Delivered', 'Returned') DEFAULT 'Not Dispatched',
    Order_Notes TINYTEXT,

    FOREIGN KEY (Customer_Id)
    REFERENCES customers(Customer_Id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

SELECT * FROM orders;

INSERT INTO orders
(Customer_Id, Order_Amount, Order_Status, Payment_Method,
 Payment_Status, Shipping_Address, Delivery_Pincode, Quantity,
 Discount_Amount, Delivery_Date, Tracking_Number, Delivery_Status)
VALUES
(1, 1500.50, 'Shipped', 'UPI', 'Paid', 'Sector 6 Noida', '201301', 2, 100.00, NULL, 'TRK1001', 'In Transit'),

(1, 2200.00, 'Pending', 'Cash', 'Pending', 'Sector 6 Noida', '201301', 1, 0.00, NULL, 'TRK1002', 'Not Dispatched'),

(2, 500.75, 'Delivered', 'Card', 'Paid', 'Sector 43 Delhi', '110001', 1, 50.00, '2026-10-25', 'TRK1003', 'Delivered'),

(2, 1800.00, 'Cancelled', 'UPI', 'Failed', 'Sector 43 Delhi', '110001', 3, 0.00, NULL, 'TRK1004', 'Returned'),

(3, 750.25, 'Processing', 'Net Banking', 'Paid', 'Sector 4 Mumbai', '400001', 2, 25.00, NULL, 'TRK1005', 'Not Dispatched');


SELECT * FROM orders;

DESC customers;

DESC orders;

SELECT * FROM customers;

SELECT * FROM orders;