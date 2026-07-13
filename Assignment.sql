CREATE DATABASE DBS_CEP;
USE DBS_CEP;

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100),
  Address VARCHAR(255),
  City VARCHAR(50),
  State VARCHAR(20),
  ZipCode VARCHAR(10),
  Telephone VARCHAR(15),
  DateOfBirth DATE,
  PrimaryLanguage VARCHAR(50)
);

INSERT INTO Customer (Name, Address, City, State, ZipCode, Telephone, DateOfBirth, PrimaryLanguage) VALUES
('Ali Khan', 'House 123, Main Street', 'Karachi', 'Sindh', '74000', '0301-1234567', '1985-06-15', 'Urdu'),
('Ayesha Bano', 'Plot 456, Iqbal Road', 'Lahore', 'Punjab', '54000', '0321-2345678', '1990-02-20', 'Punjabi'),
('Usman Raza', 'Block C, Model Town', 'Islamabad', 'Islamabad', '44000', '0333-3456789', '1982-09-12', 'English'),
('Sara Ahmad', 'Sector F, Blue Area', 'Islamabad', 'Islamabad', '44000', '0345-4567890', '1995-11-05', 'Urdu'),
('Rehan Qureshi', 'Street 10, Defence', 'Lahore', 'Punjab', '54000', '0302-5678901', '1978-04-24', 'Sindhi'),
('Zara Sheikh', 'House 2, Clifton', 'Karachi', 'Sindh', '74000', '0314-6789012', '1987-03-13', 'English'),
('Hamza Malik', 'Phase 3, Bahria Town', 'Rawalpindi', 'Punjab', '46000', '0300-7890123', '1991-08-02', 'Punjabi'),
('Aqsa Riaz', 'Lane 5, Gulberg', 'Lahore', 'Punjab', '54000', '0324-8901234', '1983-06-17', 'Urdu'),
('Farhan Ali', 'Main Road, Saddar', 'Peshawar', 'Khyber Pakhtunkhwa', '25000', '0335-9012345', '1980-12-22', 'Pashto'),
('Ali Raza', 'Gul Center', 'Hyderabad', 'Sindh', '22000', '0302-9012345', '1780-12-22', 'Sindhi');

SELECT * FROM Customer;

CREATE TABLE Branch (
  BranchID INT PRIMARY KEY AUTO_INCREMENT,
  BranchNumber VARCHAR(10),
  Address VARCHAR(255),
  City VARCHAR(50),
  State VARCHAR(20),
  ZipCode VARCHAR(10),
  SquareFootage DECIMAL(10, 2)
);

INSERT INTO Branch (BranchNumber, Address, City, State, ZipCode, SquareFootage) VALUES
('B001', 'Gulshan Block 5', 'Karachi', 'Sindh', '74000', 1800.50),
('B002', 'Mall Road', 'Lahore', 'Punjab', '54000', 2000.75),
('B003', 'F-7 Markaz', 'Islamabad', 'Islamabad', '44000', 2500.25),
('B004', 'University Road', 'Peshawar', 'Khyber Pakhtunkhwa', '25000', 1700.00),
('B005', 'Saddar Bazaar', 'Rawalpindi', 'Punjab', '46000', 2100.30),
('B006', 'Shahrah-e-Faisal', 'Karachi', 'Sindh', '74000', 1900.45),
('B007', 'Satellite Town', 'Quetta', 'Balochistan', '87300', 1500.60),
('B008', 'Defence Phase 4', 'Lahore', 'Punjab', '54000', 2300.85),
('B009', 'Ring Road', 'Peshawar', 'Khyber Pakhtunkhwa', '25000', 2400.95),
('B010', 'Qasimabad', 'Hyderabd', 'Sindh', '22000', 2500.95);

SELECT * FROM Branch;


CREATE TABLE Item (
  ItemID INT PRIMARY KEY AUTO_INCREMENT,
  Description VARCHAR(100),
  Color VARCHAR(30),
  Size VARCHAR(30),
  Pattern VARCHAR(50),
  Type VARCHAR(50)
);

INSERT INTO Item (Description, Color, Size, Pattern, Type) VALUES
('Pakistani Floral Wallpaper', 'Red', 'Large', 'Floral', 'Wallpaper'),
('Traditional Striped Wallpaper', 'Blue', 'Medium', 'Striped', 'Wallpaper'),
('Modern Polka Dot Wallpaper', 'White', 'Small', 'Polka Dot', 'Wallpaper'),
('Geometric Wall Pattern', 'Green', 'Large', 'Geometric', 'Wallpaper'),
('Solid Color Plain Wallpaper', 'Yellow', 'Medium', 'Solid', 'Wallpaper'),
('Vintage Mughal Wallpaper', 'Beige', 'Large', 'Vintage', 'Wallpaper'),
('Textured Brick Style Wallpaper', 'Gray', 'Medium', 'Textured', 'Wallpaper'),
('Abstract Art Wallpaper', 'Purple', 'Small', 'Abstract', 'Wallpaper'),
('Modern Minimalist Wallpaper', 'Black', 'Large', 'Modern', 'Wallpaper'),
('Liquid Style Wallpaper', 'Blue', 'Large', 'Modern', 'Wallpaper');

SELECT * FROM Item;

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY AUTO_INCREMENT,
  OrderDate DATE,
  CreditAuthorizationStatus BOOLEAN,
  BranchID INT,
  CustomerID INT,
  FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Orders (OrderDate, CreditAuthorizationStatus, BranchID, CustomerID) VALUES
('2024-03-29', TRUE, 1, 1),
('2024-03-29', FALSE, 2, 2),
('2024-03-28', TRUE, 3, 3),
('2024-03-27', TRUE, 4, 4),
('2024-03-26', FALSE, 5, 5),
('2024-03-25', TRUE, 6, 6),
('2024-03-24', TRUE, 7, 7),
('2024-03-21', TRUE, 8, 8),
('2024-03-20', TRUE, 9, 9),
('2024-03-20', TRUE, 10, 10);

SELECT * FROM Orders;

CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100),
  Address VARCHAR(255),
  City VARCHAR(50),
  State VARCHAR(20),
  ZipCode VARCHAR(10),
  Telephone VARCHAR(15),
  DateOfHire DATE,
  Title VARCHAR(50),
  Salary DECIMAL(10, 2),
  Skill VARCHAR(50),
  Age INT,
  BranchID INT,
  FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

INSERT INTO Employee (Name, Address, City, State, ZipCode, Telephone, DateOfHire, Title, Salary, Skill, Age, BranchID) VALUES
('Bilal Ahmed', 'House 10, Defence Phase 2', 'Karachi', 'Sindh', '74000', '0301-1112233', '2020-05-01', 'Manager', 80000.00, 'Leadership', 42, 1),
('Hina Saeed', 'Flat 5, Gulberg Apartments', 'Lahore', 'Punjab', '54000', '0321-2223344', '2019-07-15', 'Sales Associate', 50000.00, 'Sales', 36, 2),
('Imran Abbas', 'Plot 23, F-8/3', 'Islamabad', 'Islamabad', '44000', '0333-3334455', '2021-03-10', 'Cashier', 35000.00, 'Cash Handling', 28, 3),
('Saba Qadir', 'Sector G-11', 'Islamabad', 'Islamabad', '44000', '0345-4445566', '2018-12-20', 'Sales Associate', 45000.00, 'Customer Service', 32, 4),
('Kashif Ali', 'Mohallah Noor, Saddar', 'Peshawar', 'Khyber Pakhtunkhwa', '25000', '0302-5556677', '2020-10-01', 'Assistant Manager', 60000.00, 'Management', 34, 5),
('Fatima Noor', 'House 34, Gulshan Iqbal', 'Karachi', 'Sindh', '74000', '0314-6667788', '2022-01-05', 'Stock Clerk', 30000.00, 'Inventory', 25, 6),
('Zeeshan Khan', 'Phase 2, Satellite Town', 'Quetta', 'Balochistan', '87300', '0300-7778899', '2017-09-30', 'Cashier', 38000.00, 'Cash Handling', 30, 7),
('Razia Bibi', 'Defence Road, Lahore', 'Lahore', 'Punjab', '54000', '0324-8889900', '2016-11-17', 'Manager', 82000.00, 'Strategic Planning', 45, 8),
('Hassan Tariq', 'Street 4, Saddar Road', 'Peshawar', 'Khyber Pakhtunkhwa', '25000', '0335-9990011', '2023-01-28', 'Sales Associate', 40000.00, 'Communication', 26, 9),
('Ahmed Raza', 'Naseem nagar, Qasimabad', 'Hyderabad', 'Sindh', '20000', '0325-9890011', '2022-12-28', 'Sales Associate', 40000.00, 'Communication', 26, 9);

SELECT * FROM Employee;

CREATE TABLE Orders_Item (
  OrderID INT,
  ItemID INT,
  Quantity INT,
  PRIMARY KEY (OrderID, ItemID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);

INSERT INTO Orders_Item (OrderID, ItemID, Quantity) VALUES
(1, 1, 2),
(1, 2, 3),
(2, 3, 1),
(3, 4, 4),
(4, 5, 2),
(5, 6, 5),
(6, 7, 1),
(7, 8, 3),
(8, 9, 2),
(9, 10, 5);

SELECT * FROM Orders_Item;


CREATE TABLE Account (
  AccountID INT PRIMARY KEY AUTO_INCREMENT,
  Balance DECIMAL(10, 2),
  LastPaymentDate DATE,
  LastPaymentAmount DECIMAL(10, 2),
  Type VARCHAR(50),
  CustomerID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Account (Balance, LastPaymentDate, LastPaymentAmount, Type, CustomerID) VALUES
(10000.00, '2024-03-29', 5000.00, 'Credit', 1),
(12000.50, '2024-03-29', 4000.00, 'Credit', 2),
(8000.75, '2024-03-28', 3000.00, 'Credit', 3),
(15000.25, '2024-03-27', 6000.00, 'Debit', 4),
(7000.30, '2024-03-26', 3500.00, 'Credit', 5),
(9000.45, '2024-03-25', 4500.00, 'Debit', 6),
(6500.60, '2024-03-24', 4000.00, 'Credit', 7),
(11000.85, '2024-03-21', 5500.00, 'Debit', 8),
(7500.95, '2024-03-20', 2000.00, 'Credit', 9),
(8500.95, '2024-03-20', 1500.00, 'Credit', 10);

SELECT * FROM Account;

-- Customer table indexes
CREATE INDEX idx_customer_city ON Customer (City);
CREATE INDEX idx_customer_state ON Customer (State);

-- Branch table indexes
CREATE INDEX idx_branch_city ON Branch (City);
CREATE INDEX idx_branch_state ON Branch (State);

-- Item table indexes
CREATE INDEX idx_item_type ON Item (Type);

-- Orders table indexes
CREATE INDEX idx_orders_orderdate ON Orders (OrderDate);
CREATE INDEX idx_orders_branchid ON Orders (BranchID);

-- Employee table indexes
CREATE INDEX idx_employee_branchid ON Employee (BranchID);

-- Account table indexes
CREATE INDEX idx_account_customerid ON Account (CustomerID);

-- Query 4: Retrieve order details for customers who ordered on 29-03-2024, then delete these orders.
-- Retrieve the orders
SELECT * FROM Orders
WHERE OrderDate = '2024-03-29';

-- Delete orders with OrderDate 20-03-2024
DELETE oi FROM Orders_Item AS oi
JOIN Orders o ON oi.OrderID = o.OrderID
WHERE o.OrderDate = '2024-03-20';

-- Query 5: Create a complex view showing items in each order, with relevant columns.
CREATE VIEW OrderItemView AS
SELECT o.OrderID, o.OrderDate, c.Name AS CustomerName, i.Description AS ItemDescription, oi.Quantity
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Orders_Item oi ON o.OrderID = oi.OrderID
JOIN Item i ON oi.ItemID = i.ItemID;

SELECT * FROM OrderItemView;


