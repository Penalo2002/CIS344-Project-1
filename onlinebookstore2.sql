-- Create Book table
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    ShippingAddress TEXT NOT NULL
);

-- Create Order table
CREATE TABLE `Order` (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create Payment table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);

-- Create Junction table for Book ↔ Order relationship (Many-to-Many)
CREATE TABLE BookOrder (
    BookID INT,
    OrderID INT,
    PRIMARY KEY (BookID, OrderID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);

