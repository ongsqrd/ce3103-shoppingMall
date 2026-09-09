USE shopDB;

SET SQL_SAFE_UPADTES = 0;

DELETE FROM Payments;
DELETE FROM Deliveries;
DELETE FROM OrderItems;
DELETE FROM CartItems;
DELETE FROM ProductDiscount;
DELETE FROM SectionStock;
DELETE FROM WarehouseStock;
DELETE FROM EmployeeRoles;

DELETE FROM Orders;
DELETE FROM Carts;
DELETE FROM Discounts;

DELETE FROM Products;
DELETE FROM SubCategories;
DELETE FROM Categories;
DELETE FROM Sections;
DELETE FROM Blocks;

DELETE FROM Warehouses;
DELETE FROM CustomerAddresses;
DELETE FROM Customers;
DELETE FROM Employees;
DELETE FROM Departments;
DELETE FROM Roles;

INSERT INTO Roles (RoleID, RoleName) VALUES
(1, 'Manager'),
(2, 'Assistant Manager'),
(3, 'Supervisor'),
(4, 'Senior Specialist'),
(5, 'Staff'),
(6, 'Cashier'),
(7, 'Store Associate'),
(8, 'Inventory Clerk'),
(9, 'Delivery Coordinator'),
(10, 'System Administrator'),
(11, 'Customer Service Rep'),
(12, 'Accountant'),
(13, 'Purchasing Officer'),
(14, 'Security Guard'),
(15, 'Intern');

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Executive'),
(2, 'Sales & Retail'),
(3, 'Marketing'),
(4, 'Warehouse & Logistics'),
(5, 'Human Resources'),
(6, 'Customer Support'),
(7, 'Finance & Accounting'),
(8, 'IT & Systems'),
(9, 'Procurement'),
(10, 'Inventory Management'),
(11, 'Quality Control'),
(12, 'Facility Management'),
(13, 'Legal & Compliance'),
(14, 'Security'),
(15, 'E-Commerce');

INSERT INTO Customers (CustomerID, CustomerName, Phone, Email, RegisteredAt) VALUES
(1, 'Somchai Jaidee', '0812345678', 'somchai@email.com', '2024-01-10 08:30:00'),
(2, 'Somsri Manee', '0823456789', 'somsri@email.com', '2024-01-12 09:15:00'),
(3, 'Anan Prasert', '0834567890', 'anan@email.com', '2024-01-15 10:00:00'),
(4, 'Wipa Sukdee', '0845678901', 'wipa@email.com', '2024-01-18 11:20:00'),
(5, 'Kitti Chaimongkol', '0856789012', 'kitti@email.com', '2024-01-20 13:45:00'),
(6, 'Nareerat Ploy', '0867890123', 'nareerat@email.com', '2024-01-22 14:10:00'),
(7, 'Pravit Boon', '0878901234', 'pravit@email.com', '2024-01-25 15:30:00'),
(8, 'Ratana Dee', '0889012345', 'ratana@email.com', '2024-01-28 16:00:00'),
(9, 'Suthep Kaew', '0890123456', 'suthep@email.com', '2024-02-01 09:00:00'),
(10, 'Ubon Wong', '0801234567', 'ubon@email.com', '2024-02-03 10:30:00'),
(11, 'Vichai Siri', '0811112222', 'vichai@email.com', '2024-02-05 11:15:00'),
(12, 'Wanida Thong', '0822223333', 'wanida@email.com', '2024-02-08 12:00:00'),
(13, 'Yuttana Charoen', '0833334444', 'yuttana@email.com', '2024-02-10 14:20:00'),
(14, 'Zeenat Khan', '0844445555', 'zeenat@email.com', '2024-02-12 15:45:00'),
(15, 'Chana Rung', '0855556666', 'chana@email.com', '2024-02-15 17:00:00');

INSERT INTO Warehouses (WarehouseID, WarehouseName, WarehouseAddress) VALUES
(1, 'Bangkok Central Hub', '123 Bang Na-Trad Rd, Bangkok'),
(2, 'Nonthaburi Fulfillment Center', '45 Tiwanon Rd, Nonthaburi'),
(3, 'Pathum Thani Depot', '78 Phahonyothin Rd, Pathum Thani'),
(4, 'Samut Prakan Warehouse', '99 Sukhumvit Rd, Samut Prakan'),
(5, 'Chonburi Distribution Center', '12 Sukhumvit Rd, Chonburi'),
(6, 'Rayong Storage Facility', '34 Rayong Rd, Rayong'),
(7, 'Chiang Mai Logistics Hub', '56 Superhighway Rd, Chiang Mai'),
(8, 'Phitsanulok Depot', '89 Mittraphap Rd, Phitsanulok'),
(9, 'Khon Kaen Warehouse', '101 Mittraphap Rd, Khon Kaen'),
(10, 'Ubon Ratchathani Depot', '202 Chayangkun Rd, Ubon Ratchathani'),
(11, 'Nakhon Ratchasima Hub', '303 Mittraphap Rd, Nakhon Ratchasima'),
(12, 'Surat Thani Storage', '404 Asian Highway, Surat Thani'),
(13, 'Phuket Logistics Center', '505 Thep Krasattri Rd, Phuket'),
(14, 'Songkhla Hub', '606 Kanchanavanich Rd, Songkhla'),
(15, 'Ayutthaya Backup Warehouse', '707 Asian Highway, Ayutthaya');

INSERT INTO Blocks (BlockID, BlockNumber, BlockName) VALUES
(1, 'A1', 'North Wing Main'),
(2, 'A2', 'North Wing Upper'),
(3, 'B1', 'South Wing Main'),
(4, 'B2', 'South Wing Upper'),
(5, 'C1', 'East Wing Main'),
(6, 'C2', 'East Wing Upper'),
(7, 'D1', 'West Wing Main'),
(8, 'D2', 'West Wing Upper'),
(9, 'E1', 'Central Hub Ground'),
(10, 'E2', 'Central Hub Floor 2'),
(11, 'F1', 'Outdoor Section A'),
(12, 'F2', 'Outdoor Section B'),
(13, 'G1', 'Basement Storage A'),
(14, 'G2', 'Basement Storage B'),
(15, 'H1', 'Mezzanine Level');

INSERT INTO Discounts (DiscountID, DiscountName, DiscountType, Value, StartsAt, EndsAt, IsActive) VALUES
(1, 'New Year Mega Sale', 'percentage', 10.00, '2024-01-01 00:00:00', '2024-01-31 23:59:59', false),
(2, 'Valentine Special', 'fixed', 100.00, '2024-02-10 00:00:00', '2024-02-16 23:59:59', false),
(3, 'PayDay Discount', 'percentage', 15.00, '2024-02-25 00:00:00', '2024-03-02 23:59:59', true),
(4, 'Flash Sale Tech', 'fixed', 500.00, '2024-02-18 12:00:00', '2024-02-18 23:59:59', false),
(5, 'Summer Clearance', 'percentage', 20.00, '2024-03-01 00:00:00', '2024-03-15 23:59:59', true),
(6, 'Electronics Deal', 'percentage', 5.00, '2024-02-01 00:00:00', '2024-12-31 23:59:59', true),
(7, 'Apparel Coupon', 'fixed', 50.00, '2024-02-01 00:00:00', '2024-02-28 23:59:59', true),
(8, 'VIP Member Discount', 'percentage', 8.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', true),
(9, 'Snack Bundle Offer', 'fixed', 10.00, '2024-02-01 00:00:00', '2024-04-30 23:59:59', true),
(10, 'Mid Year Promo', 'percentage', 25.00, '2024-06-01 00:00:00', '2024-06-30 23:59:59', false),
(11, 'Welcome Coupon', 'fixed', 200.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', true),
(12, 'Black Friday', 'percentage', 30.00, '2024-11-25 00:00:00', '2024-11-30 23:59:59', false),
(13, '11.11 Shopping Festival', 'percentage', 11.00, '2024-11-11 00:00:00', '2024-11-11 23:59:59', false),
(14, '12.12 Sale', 'percentage', 12.00, '2024-12-12 00:00:00', '2024-12-12 23:59:59', false),
(15, 'Clearance Warehouse', 'fixed', 1000.00, '2024-02-01 00:00:00', '2024-02-29 23:59:59', true);

INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID, SupervisorID, Phone, Email, Salary) VALUES
(1, 'Somsak Leader', 1, NULL, '0899990001', 'somsak.l@company.com', 95000.00),
(2, 'Chaiwat Manager', 2, 1, '0899990002', 'chaiwat.m@company.com', 65000.00),
(3, 'Pimpa Director', 3, 1, '0899990003', 'pimpa.d@company.com', 70000.00),
(4, 'Sora LogiLead', 4, 1, '0899990004', 'sora.l@company.com', 60000.00),
(5, 'Nipon Officer', 2, 2, '0899990005', 'nipon.o@company.com', 35000.00),
(6, 'Malee Staff', 2, 2, '0899990006', 'malee.s@company.com', 28000.00),
(7, 'Kamon Tech', 8, 1, '0899990007', 'kamon.t@company.com', 50000.00),
(8, 'Siri HR', 5, 1, '0899990008', 'siri.h@company.com', 45000.00),
(9, 'Danai Accountant', 7, 1, '0899990009', 'danai.a@company.com', 48000.00),
(10, 'Aree Support', 6, 2, '0899990010', 'aree.s@company.com', 25000.00),
(11, 'Boon WhSupervisor', 4, 4, '0899990011', 'boon.w@company.com', 38000.00),
(12, 'Eak WhStaff', 4, 11, '0899990012', 'eak.w@company.com', 22000.00),
(13, 'Fah Buyer', 9, 1, '0899990013', 'fah.b@company.com', 42000.00),
(14, 'Golf Marketer', 3, 3, '0899990014', 'golf.m@company.com', 32000.00),
(15, 'Hana QC', 11, 4, '0899990015', 'hana.q@company.com', 30000.00);

INSERT INTO CustomerAddresses (AddressID, CustomerID, AddressLine, City, PostalCode, IsDefault) VALUES
(1, 1, '12/3 Sukhumvit Road', 'Bangkok', '10110', true),
(2, 2, '45/6 Phahonyothin Road', 'Bangkok', '10400', true),
(3, 3, '789 Charoen Krung Rd', 'Bangkok', '10500', true),
(4, 4, '101 Moo 5 Vibhavadi Rd', 'Pathum Thani', '12130', true),
(5, 5, '22/1 Mittraphap Rd', 'Nakhon Ratchasima', '30000', true),
(6, 6, '55 Nimmanhemin Rd', 'Chiang Mai', '50200', true),
(7, 7, '88 Beach Road', 'Pattaya', '20150', true),
(8, 8, '99/4 Central Rd', 'Surat Thani', '84000', true),
(9, 9, '33/2 Phetkasem Rd', 'Hua Hin', '77110', true),
(10, 10, '14 Borommaratchachonnani Rd', 'Bangkok', '10170', true),
(11, 11, '77 Rama 9 Rd', 'Bangkok', '10310', true),
(12, 12, '88/1 Bang Na Rd', 'Samut Prakan', '10540', true),
(13, 13, '120 Chaeng Watthana Rd', 'Nonthaburi', '11120', true),
(14, 14, '5 Office Park Rd', 'Khon Kaen', '40000', true),
(15, 15, '90 Phuket Rd', 'Phuket', '83000', true);

INSERT INTO Sections (SectionID, SectionName, FloorNumber, BlockID) VALUES
(1, 'Electronics Display', 1, 1),
(2, 'Home Appliances', 1, 1),
(3, 'Apparel Men', 2, 2),
(4, 'Apparel Women', 2, 2),
(5, 'Fresh Food', 1, 3),
(6, 'Dry Grocery', 1, 3),
(7, 'Furniture Showroom', 2, 4),
(8, 'Beauty & Cosmetics', 1, 5),
(9, 'Toys & Games', 2, 6),
(10, 'Sports Equipment', 1, 7),
(11, 'Books & Stationery', 2, 8),
(12, 'Garden Supplies', 1, 11),
(13, 'Automotive Parts', 1, 12),
(14, 'Bulk Storage A', -1, 13),
(15, 'Overstock B', -1, 14);

INSERT INTO EmployeeRoles (EmployeeID, RoleID, AssignedDate) VALUES
(1, 1, '2023-01-01'),
(2, 1, '2023-01-15'),
(3, 1, '2023-02-01'),
(4, 1, '2023-02-15'),
(5, 5, '2023-03-01'),
(6, 6, '2023-03-15'),
(7, 10, '2023-04-01'),
(8, 4, '2023-04-15'),
(9, 12, '2023-05-01'),
(10, 11, '2023-05-15'),
(11, 3, '2023-06-01'),
(12, 8, '2023-06-15'),
(13, 13, '2023-07-01'),
(14, 5, '2023-07-15'),
(15, 4, '2023-08-01');

INSERT INTO Carts (CartID, CustomerID, CreatedAt, CartStatus) VALUES
(1, 1, '2024-02-16 09:00:00', 'converted'),
(2, 2, '2024-02-16 10:15:00', 'converted'),
(3, 3, '2024-02-16 11:30:00', 'converted'),
(4, 4, '2024-02-16 13:00:00', 'converted'),
(5, 5, '2024-02-16 14:20:00', 'converted'),
(6, 6, '2024-02-17 09:10:00', 'converted'),
(7, 7, '2024-02-17 11:00:00', 'converted'),
(8, 8, '2024-02-17 14:00:00', 'converted'),
(9, 9, '2024-02-17 15:30:00', 'converted'),
(10, 10, '2024-02-18 10:00:00', 'converted'),
(11, 11, '2024-02-18 11:45:00', 'active'),
(12, 12, '2024-02-18 13:10:00', 'abandoned'),
(13, 13, '2024-02-18 16:00:00', 'active'),
(14, 14, '2024-02-19 09:30:00', 'converted'),
(15, 15, '2024-02-19 10:15:00', 'converted');

INSERT INTO Categories (CategoryID, CategoryName, SectionID) VALUES
(1, 'Smartphones & Tablets', 1),
(2, 'Computers & Laptops', 1),
(3, 'Kitchen Appliances', 2),
(4, 'Men Tops', 3),
(5, 'Women Dresses', 4),
(6, 'Beverages', 6),
(7, 'Snacks & Sweets', 6),
(8, 'Living Room Furniture', 7),
(9, 'Skincare', 8),
(10, 'Board Games', 9),
(11, 'Fitness Accessories', 10),
(12, 'Office Supplies', 11),
(13, 'Plant Tools', 12),
(14, 'Car Care', 13),
(15, 'Audio Systems', 1);

INSERT INTO SubCategories (SubCategoryID, SubCategoryName, CategoryID) VALUES
(1, 'Flagship Smartphones', 1),
(2, 'Gaming Laptops', 2),
(3, 'Air Fryers', 3),
(4, 'Microwaves', 3),
(5, 'Casual Shirts', 4),
(6, 'Summer Dresses', 5),
(7, 'Carbonated Drinks', 6),
(8, 'Potato Chips', 7),
(9, 'Sofas', 8),
(10, 'Face Serums', 9),
(11, 'Strategy Games', 10),
(12, 'Yoga Mats', 11),
(13, 'Notebooks', 12),
(14, 'Car Wash Shampoos', 14),
(15, 'Bluetooth Speakers', 15);

INSERT INTO Products (ProductID, ProductName, SubCategoryID, UnitPrice, Description, IsActive) VALUES
(1, 'UltraPhone Z1', 1, 35000.00, 'Latest flagship smartphone with 256GB', true),
(2, 'ProGamer X Laptop', 2, 49900.00, 'High performance gaming laptop 16GB RAM', true),
(3, 'CrispyAir Fryer 5L', 3, 2990.00, 'Digital oil-free air fryer', true),
(4, 'WaveMaster Microwave 23L', 4, 1890.00, '800W easy clean microwave', true),
(5, 'Cotton Casual Shirt White', 5, 590.00, '100% breathable cotton shirt', true),
(6, 'Floral Breeze Dress', 6, 890.00, 'Lightweight summer floral dress', true),
(7, 'Sparkling Cola 1.5L', 7, 35.00, 'Refreshing carbonated drink', true),
(8, 'Crunchy Potato Chips Sea Salt', 8, 30.00, 'Crispy potato chips 70g', true),
(9, 'Comfort Leather Sofa 3-Seater', 9, 15900.00, 'Genuine leather living room sofa', true),
(10, 'Glow Hydrating Serum 30ml', 10, 750.00, 'Hyaluronic acid face serum', true),
(11, 'Empire Builder Board Game', 11, 1250.00, 'Strategy game for 2-4 players', true),
(12, 'Eco Non-Slip Yoga Mat', 12, 450.00, '6mm TPE eco-friendly yoga mat', true),
(13, 'A5 Grid Journal Notebook', 13, 120.00, '100gsm paper hardcover journal', true),
(14, 'ShineMax Car Wash 1L', 14, 199.00, 'pH neutral car shampoo with wax', true),
(15, 'BoomBox Portable Speaker', 15, 1490.00, 'Waterproof Bluetooth speaker', true);

INSERT INTO WarehouseStock (WarehouseID, ProductID, QuantityOnHand, LastUpdated) VALUES
(1, 1, 50, '2024-02-15 08:00:00'),
(1, 2, 20, '2024-02-15 08:00:00'),
(1, 3, 100, '2024-02-15 08:00:00'),
(2, 4, 80, '2024-02-15 09:30:00'),
(2, 5, 200, '2024-02-15 09:30:00'),
(3, 6, 150, '2024-02-15 10:00:00'),
(3, 7, 500, '2024-02-15 10:00:00'),
(4, 8, 600, '2024-02-15 11:00:00'),
(4, 9, 10, '2024-02-15 11:00:00'),
(5, 10, 300, '2024-02-15 13:00:00'),
(5, 11, 40, '2024-02-15 13:00:00'),
(6, 12, 90, '2024-02-15 14:00:00'),
(6, 13, 400, '2024-02-15 14:00:00'),
(7, 14, 120, '2024-02-15 15:00:00'),
(7, 15, 75, '2024-02-15 15:00:00');

INSERT INTO SectionStock (SectionID, ProductID, QuantityOnHand) VALUES
(1, 1, 5),
(1, 2, 3),
(2, 3, 10),
(2, 4, 8),
(3, 5, 25),
(4, 6, 15),
(6, 7, 50),
(6, 8, 60),
(7, 9, 2),
(8, 10, 30),
(9, 11, 12),
(10, 12, 15),
(11, 13, 40),
(13, 14, 20),
(1, 15, 8);

INSERT INTO ProductDiscount (DiscountID, ProductID) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 5),
(3, 6),
(4, 1),
(5, 6),
(6, 15),
(7, 5),
(8, 9),
(9, 7),
(9, 8),
(11, 2),
(11, 9),
(15, 2);

INSERT INTO CartItems (CartID, ProductID, Quantity, AddedAt) VALUES
(1, 1, 1, '2024-02-16 09:05:00'),
(2, 3, 2, '2024-02-16 10:20:00'),
(3, 5, 3, '2024-02-16 11:32:00'),
(4, 7, 10, '2024-02-16 13:02:00'),
(5, 9, 1, '2024-02-16 14:22:00'),
(6, 10, 2, '2024-02-17 09:12:00'),
(7, 12, 1, '2024-02-17 11:05:00'),
(8, 14, 4, '2024-02-17 14:05:00'),
(9, 15, 1, '2024-02-17 15:35:00'),
(10, 2, 1, '2024-02-18 10:05:00'),
(11, 8, 5, '2024-02-18 11:50:00'),
(12, 4, 1, '2024-02-18 13:12:00'),
(13, 13, 2, '2024-02-18 16:05:00'),
(14, 6, 2, '2024-02-19 09:32:00'),
(15, 11, 1, '2024-02-19 10:20:00');

INSERT INTO Orders (OrderID, ReferenceNumber, CartID, CustomerID, EmployeeID, Channel, CreatedAt, OrderStatus) VALUES
(1, 'ORD-20240216-001', 1, 1, 5, 'online', '2024-02-16 09:10:00', 'completed'),
(2, 'ORD-20240216-002', 2, 2, 6, 'onsite', '2024-02-16 10:30:00', 'completed'),
(3, 'ORD-20240216-003', 3, 3, 5, 'online', '2024-02-16 11:45:00', 'completed'),
(4, 'ORD-20240216-004', 4, 4, 6, 'onsite', '2024-02-16 13:15:00', 'completed'),
(5, 'ORD-20240216-005', 5, 5, 5, 'online', '2024-02-16 14:30:00', 'confirmed'),
(6, 'ORD-20240217-006', 6, 6, 6, 'online', '2024-02-17 09:20:00', 'completed'),
(7, 'ORD-20240217-007', 7, 7, 5, 'onsite', '2024-02-17 11:15:00', 'completed'),
(8, 'ORD-20240217-008', 8, 8, 6, 'online', '2024-02-17 14:15:00', 'pending'),
(9, 'ORD-20240217-009', 9, 9, 5, 'online', '2024-02-17 15:45:00', 'cancelled'),
(10, 'ORD-20240218-010', 10, 10, 6, 'online', '2024-02-18 10:15:00', 'confirmed'),
(11, 'ORD-20240219-011', 14, 14, 5, 'onsite', '2024-02-19 09:40:00', 'completed'),
(12, 'ORD-20240219-012', 15, 15, 6, 'online', '2024-02-19 10:30:00', 'confirmed'),
(13, 'ORD-20240219-013', NULL, 1, 5, 'onsite', '2024-02-19 11:00:00', 'completed'),
(14, 'ORD-20240219-014', NULL, 2, 6, 'onsite', '2024-02-19 13:20:00', 'completed'),
(15, 'ORD-20240219-015', NULL, 3, 5, 'online', '2024-02-19 15:00:00', 'pending');

INSERT INTO OrderItems (OrderID, ProductID, Quantity, ListPriceAtPurchase, UnitPriceAtPurchase, DiscountID, LineTotal) VALUES
(1, 1, 1, 35000.00, 31500.00, 1, 31500.00),
(2, 3, 2, 2990.00, 2890.00, 2, 5780.00),
(3, 5, 3, 590.00, 501.50, 3, 1504.50),
(4, 7, 10, 35.00, 35.00, NULL, 350.00),
(5, 9, 1, 15900.00, 14628.00, 8, 14628.00),
(6, 10, 2, 750.00, 750.00, NULL, 1500.00),
(7, 12, 1, 450.00, 450.00, NULL, 450.00),
(8, 14, 4, 199.00, 199.00, NULL, 796.00),
(9, 15, 1, 1490.00, 1415.50, 6, 1415.50),
(10, 2, 1, 49900.00, 48900.00, 15, 48900.00),
(11, 6, 2, 890.00, 712.00, 5, 1424.00),
(12, 11, 1, 1250.00, 1250.00, NULL, 1250.00),
(13, 8, 5, 30.00, 20.00, 9, 100.00),
(14, 4, 1, 1890.00, 1890.00, NULL, 1890.00),
(15, 13, 3, 120.00, 120.00, NULL, 360.00);

INSERT INTO Payments (PaymentID, OrderID, PaymentMethod, Amount, PaymentStatus, PaidAt) VALUES
(1, 1, 'credit_card', 31500.00, 'paid', '2024-02-16 09:12:00'),
(2, 2, 'cash', 5780.00, 'paid', '2024-02-16 10:31:00'),
(3, 3, 'qr', 1504.50, 'paid', '2024-02-16 11:46:00'),
(4, 4, 'cash', 350.00, 'paid', '2024-02-16 13:16:00'),
(5, 5, 'credit_card', 14628.00, 'paid', '2024-02-16 14:32:00'),
(6, 6, 'bank_transfer', 1500.00, 'paid', '2024-02-17 09:22:00'),
(7, 7, 'qr', 450.00, 'paid', '2024-02-17 11:16:00'),
(8, 8, 'credit_card', 796.00, 'pending', NULL),
(9, 9, 'credit_card', 1415.50, 'refunded', '2024-02-17 15:50:00'),
(10, 10, 'bank_transfer', 48900.00, 'paid', '2024-02-18 10:20:00'),
(11, 11, 'cash', 1424.00, 'paid', '2024-02-19 09:41:00'),
(12, 12, 'qr', 1250.00, 'paid', '2024-02-19 10:32:00'),
(13, 13, 'cash', 100.00, 'paid', '2024-02-19 11:01:00'),
(14, 14, 'credit_card', 1890.00, 'paid', '2024-02-19 13:21:00'),
(15, 15, 'qr', 360.00, 'failed', NULL);

INSERT INTO Deliveries (DeliveryID, OrderID, FulfillmentType, DeliveryStatus, AddressID, WarehouseID, ScheduleDate, CompleteAt) VALUES
(1, 1, 'delivery', 'delivered', 1, 1, '2024-02-17', '2024-02-17 14:30:00'),
(2, 2, 'grab_and_go', 'delivered', NULL, NULL, '2024-02-16', '2024-02-16 10:35:00'),
(3, 3, 'delivery', 'delivered', 3, 1, '2024-02-17', '2024-02-17 16:00:00'),
(4, 4, 'grab_and_go', 'delivered', NULL, NULL, '2024-02-16', '2024-02-16 13:20:00'),
(5, 5, 'delivery', 'in_transit', 5, 4, '2024-02-18', NULL),
(6, 6, 'delivery', 'delivered', 6, 7, '2024-02-18', '2024-02-18 15:20:00'),
(7, 7, 'pickup', 'delivered', NULL, 1, '2024-02-17', '2024-02-17 12:30:00'),
(8, 8, 'delivery', 'preparing', 8, 12, '2024-02-20', NULL),
(9, 9, 'delivery', 'cancelled', 9, 1, '2024-02-18', NULL),
(10, 10, 'delivery', 'preparing', 10, 1, '2024-02-20', NULL),
(11, 11, 'grab_and_go', 'delivered', NULL, NULL, '2024-02-19', '2024-02-19 09:45:00'),
(12, 12, 'delivery', 'preparing', 15, 13, '2024-02-21', NULL),
(13, 13, 'grab_and_go', 'delivered', NULL, NULL, '2024-02-19', '2024-02-19 11:05:00'),
(14, 14, 'pickup', 'delivered', NULL, 2, '2024-02-19', '2024-02-19 14:15:00'),
(15, 15, 'delivery', 'cancelled', 3, 1, '2024-02-20', NULL);

SET SQL_SAFE_UPADTES = 1;