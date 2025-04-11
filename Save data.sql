-- Clients (Individual and Company)
INSERT INTO Client (Name, ClientType, CpfCnpj, Address) VALUES 
('John Doe', 'PF', '123.456.789-00', '123 Maple Street'),
('ACME Corp.', 'PJ', '12.345.678/0001-99', '456 Oak Avenue');

-- Payment Methods
INSERT INTO PaymentMethod (PaymentType, CardNumber, CardExpiration, TransactionToken, Client_idClient) VALUES 
('Credit Card', '4111111111111111', '2025-12-31', 'TOKEN123', 1),
('Boleto', NULL, NULL, 'TOKEN456', 2);

-- Third Party Sellers
INSERT INTO ThirdPartySeller (BusinessName, Location) VALUES 
('ElectroStore', 'São Paulo'),
('FashionPlus', 'Rio de Janeiro');

-- Suppliers
INSERT INTO Supplier (BusinessName, CNPJ) VALUES 
('TechSupplier', '11.222.333/0001-44'),
('StyleSupplier', '55.666.777/0001-88');

-- Products
INSERT INTO Product (Category, Description, Price) VALUES 
('Electronics', 'Smartphone XYZ', 1500.00),
('Clothing', 'Jeans Blue', 120.00);

-- Product by Seller
INSERT INTO ProductBySeller (Product_idProduct, ThirdPartySeller_idThirdPartySeller, Quantity) VALUES 
(1, 1, 50),
(2, 2, 100);

-- Product by Supplier
INSERT INTO ProductBySupplier (Product_idProduct, Supplier_idSupplier) VALUES 
(1, 1),
(2, 2);

-- Inventory
INSERT INTO Inventory (Location) VALUES 
('Main Warehouse'),
('Secondary Warehouse');

-- Product Inventory
INSERT INTO ProductInventory (Product_idProduct, Inventory_idInventory, Quantity) VALUES 
(1, 1, 30),
(2, 2, 60);

-- Orders
INSERT INTO OrderTable (OrderStatus, Description, Client_idClient) VALUES 
('Processing', 'Order for electronics', 1),
('Shipped', 'Order for clothes', 2);

-- OrderProduct
INSERT INTO OrderProduct (Order_idOrder, Product_idProduct, Quantity) VALUES 
(1, 1, 1),
(2, 2, 2);

-- Delivery
INSERT INTO Delivery (DeliveryStatus, TrackingCode, ExpectedDeliveryDate, Order_idOrder, Client_idClient) VALUES 
('Shipped', 'TRACK12345', '2025-04-15', 1, 1),
('Delivered', 'TRACK67890', '2025-04-12', 2, 2);
