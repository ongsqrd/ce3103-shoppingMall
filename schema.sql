CREATE DATABASE IF NOT EXISTS shopDB;
USE shopDB;

DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Deliveries;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS CartItems;
DROP TABLE IF EXISTS ProductDiscount;
DROP TABLE IF EXISTS SectionStock;
DROP TABLE IF EXISTS WarehouseStock;
DROP TABLE IF EXISTS EmployeeRoles;

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Carts;
DROP TABLE IF EXISTS Discounts;

DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS SubCategories;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Sections;
DROP TABLE IF EXISTS Blocks;

DROP TABLE IF EXISTS Warehouses;
DROP TABLE IF EXISTS CustomerAddresses;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Roles;

CREATE TABLE Roles (
	RoleID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	RoleName 	VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Departments (
	DepartmentID 	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	DepartmentName 	VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Employees (
	EmployeeID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	EmployeeName 	VARCHAR(100) NOT NULL,
	DepartmentID 	INT NOT NULL,
	SupervisorID 	INT,
	Phone 			VARCHAR(20),
	Email 			VARCHAR(255) UNIQUE,
	Salary 			DECIMAL(10,2) CHECK(Salary >= 0),
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
	FOREIGN KEY (SupervisorID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Customers (
	CustomerID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	CustomerName 	VARCHAR(100) NOT NULL,
	Phone 			VARCHAR(20),
	Email 			VARCHAR(255) UNIQUE,
	RegisteredAt 	DATETIME
);

CREATE TABLE CustomerAddresses (
	AddressID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	CustomerID 		INT NOT NULL,
	AddressLine 	VARCHAR(255) NOT NULL,
	City 			VARCHAR(100) NOT NULL,
	PostalCode 		VARCHAR(10)	NOT NULL,
	IsDefault 		BOOLEAN,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Warehouses (
	WarehouseID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	WarehouseName 		VARCHAR(100) NOT NULL,
	WarehouseAddress 	VARCHAR(255)
);

CREATE TABLE Blocks (
	BlockID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	BlockNumber 	VARCHAR(10) NOT NULL,
	BlockName 		VARCHAR(100) NOT NULL
);

CREATE TABLE Sections (
	SectionID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	SectionName 	VARCHAR(100) NOT NULL,
	FloorNumber 	INT NOT NULL,
	BlockID 		INT NOT NULL,
	FOREIGN KEY (BlockID) REFERENCES Blocks(BlockID)
);

CREATE TABLE Categories (
	CategoryID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	CategoryName 	VARCHAR(100) NOT NULL,
	SectionID 		INT NOT NULL,
	FOREIGN KEY (SectionID) REFERENCES Sections(SectionID)
);

CREATE TABLE SubCategories (
	SubCategoryID 	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	SubCategoryName VARCHAR(100) NOT NULL,
	CategoryID 		INT NOT NULL,
	FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Products (
	ProductID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	ProductName 	VARCHAR(150) NOT NULL,
	SubCategoryID 	INT NOT NULL,
	UnitPrice 		DECIMAL(10,2) NOT NULL CHECK(UnitPrice >= 0),
	Description 	TEXT,
	IsActive 		BOOLEAN,
	FOREIGN KEY (SubCategoryID) REFERENCES SubCategories(SubCategoryID)
);

CREATE TABLE Discounts (
	DiscountID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	DiscountName 	VARCHAR(100) NOT NULL,
	DiscountType 	ENUM('percentage','fixed') NOT NULL,
	Value 			DECIMAL(10,2) NOT NULL CHECK(Value >= 0),
	StartsAt 		DATETIME NOT NULL,
	EndsAt 			DATETIME NOT NULL,
	IsActive 		BOOLEAN,
	CHECK (EndsAt > StartsAt)
);

CREATE TABLE Carts (
	CartID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	CustomerID 	INT NOT NULL,
	CreatedAt 	DATETIME,
	CartStatus 	ENUM('active','converted','abandoned'),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Orders (
	OrderID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	ReferenceNumber VARCHAR(30) NOT NULL UNIQUE,
	CartID 			INT,
	CustomerID 		INT NOT NULL,
	EmployeeID 		INT,
	Channel 		ENUM('online','onsite') NOT NULL,
	CreatedAt 		DATETIME,
	OrderStatus 	ENUM('pending','confirmed','completed','cancelled') NOT NULL,
	FOREIGN KEY (CartID) REFERENCES Carts(CartID),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE EmployeeRoles (
	EmployeeID 		INT,
	RoleID 			INT,
	AssignedDate 	DATE,
	PRIMARY KEY (EmployeeID, RoleID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

CREATE TABLE WarehouseStock (
	WarehouseID 	INT,
	ProductID 		INT,
	QuantityOnHand 	INT NOT NULL DEFAULT 0,
	LastUpdated 	DATETIME,
	PRIMARY KEY (WarehouseID, ProductID),
	FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE SectionStock (
	SectionID 		INT,
	ProductID 		INT,
	QuantityOnHand 	INT NOT NULL DEFAULT 0,
	PRIMARY KEY (SectionID, ProductID),
	FOREIGN KEY (SectionID) REFERENCES Sections(SectionID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ProductDiscount (
	DiscountID 		INT,
	ProductID 		INT,
	PRIMARY KEY (DiscountID, ProductID),
	FOREIGN KEY (DiscountID) REFERENCES Discounts(DiscountID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE CartItems (
	CartID 		INT,
	ProductID 	INT,
	Quantity 	INT NOT NULL CHECK(Quantity > 0),
	AddedAt 	DATETIME,
	PRIMARY KEY (CartID, ProductID),
	FOREIGN KEY (CartID) REFERENCES Carts(CartID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE OrderItems (
	OrderID 			INT,
	ProductID 			INT,
	Quantity 			INT NOT NULL CHECK(Quantity > 0),
	ListPriceAtPurchase DECIMAL(10,2) NOT NULL CHECK(ListPriceAtPurchase >= 0),
	UnitPriceAtPurchase DECIMAL(10,2) NOT NULL CHECK(UnitPriceAtPurchase >= 0),
	DiscountID 			INT,
	LineTotal 			DECIMAL(12,2) NOT NULL CHECK(LineTotal >= 0),
	PRIMARY KEY (OrderID, ProductID),
	FOREIGN KEY (OrderID) 		REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) 	REFERENCES Products(ProductID),
	FOREIGN KEY (DiscountID) 	REFERENCES Discounts(DiscountID)
);

CREATE TABLE Deliveries (
	DeliveryID 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	OrderID 			INT NOT NULL,
	FulfillmentType 	ENUM('pickup','delivery','grab_and_go') NOT NULL,
	DeliveryStatus  	ENUM('preparing','in_transit','delivered','cancelled') NOT NULL,
	AddressID 			INT,
	WarehouseID 		INT,
	ScheduleDate 		DATE,
	CompleteAt 			DATETIME,
	FOREIGN KEY (OrderID) 		REFERENCES Orders(OrderID),
	FOREIGN KEY (AddressID) 	REFERENCES CustomerAddresses(AddressID),
	FOREIGN KEY (WarehouseID) 	REFERENCES Warehouses(WarehouseID)
);

CREATE TABLE Payments (
	PaymentID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	OrderID 		INT NOT NULL,
	PaymentMethod   ENUM('cash','credit_card','qr','bank_transfer') NOT NULL,
	Amount 			DECIMAL(12,2) NOT NULL CHECK(Amount >= 0),
	PaymentStatus 	ENUM('pending','paid','failed','refunded') NOT NULL,
	PaidAt 			DATETIME,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);