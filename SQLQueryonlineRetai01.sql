CREATE DATABASE OnlineRetailDB;
GO

USE OnlineRetailDB;
GO

CREATE TABLE Suppliers (
    SupplierId INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(100),
    ContactNumber VARCHAR(11)
);

CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY,
    Name VARCHAR(50),
    Description VARCHAR(50),
    MainCategory INT,
    FOREIGN KEY (MainCategory) REFERENCES Categories(CategoryId)
);

CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    StockQuantity INT,
    Name VARCHAR(255),
    AddedDate DATETIME,
    Description VARCHAR(20),
    UnitPrice DECIMAL(10, 2),
    CategoryId INT,
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);

CREATE TABLE Products_Suppliers (
    SupplierId INT,
    ProductId INT,
    PRIMARY KEY (SupplierId, ProductId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplierId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);

CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    FullName VARCHAR(100),
    PhoneNumber VARCHAR(50),
    Email VARCHAR(100),
    ShippingAddress VARCHAR(200),
    RegistrationDate DATETIME
);

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    Status VARCHAR(50),
    TotalAmount DECIMAL(10, 2),
    OrderDate DATETIME,
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

CREATE TABLE OrderItems (
    OrderItemId INT PRIMARY KEY,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    ProductId INT,
    OrderId INT,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

CREATE TABLE Payments (
    PaymentId INT PRIMARY KEY,
    PaymentDate DATETIME,
    Amount DECIMAL(10, 2),
    Status VARCHAR(50),
    Method VARCHAR(50)
);

CREATE TABLE Orders_Payments (
    OrderId INT,
    PaymentId INT,
    PRIMARY KEY (OrderId, PaymentId),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (PaymentId) REFERENCES Payments(PaymentId)
);

CREATE TABLE Shipments (
    ShipmentId INT PRIMARY KEY,
    ShipmentDate DATETIME,
    Status VARCHAR(50),
    DeliveryDate DATETIME,
    CarrierName VARCHAR(100),
    TrackingNumber VARCHAR(100),
    OrderId INT,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

CREATE TABLE Reviews (
    ReviewId INT PRIMARY KEY,
    Rating INT,
    Date DATETIME,
    Comment VARCHAR(200),
    ProductID INT,
    CustomerId INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductId),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

CREATE TABLE StockTransactions (
    TranId INT PRIMARY KEY,
    TranDate DATETIME,
    QuantityChange INT,
    Type VARCHAR(50),
    Reference VARCHAR(100),
    ProductId INT,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);