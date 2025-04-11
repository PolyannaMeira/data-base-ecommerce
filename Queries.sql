-- 1. How many orders were made by each client?
SELECT 
  c.Name AS ClientName,
  COUNT(o.idOrder) AS TotalOrders
FROM Client c
LEFT JOIN OrderTable o ON c.idClient = o.Client_idClient
GROUP BY c.idClient;

-- 2. Is there any seller that is also a supplier? (By business name)
SELECT 
  t.BusinessName AS SellerName
FROM ThirdPartySeller t
INNER JOIN Supplier s ON t.BusinessName = s.BusinessName;

-- 3. Product, Supplier and Inventory quantity relationship
SELECT 
  p.Description AS Product,
  s.BusinessName AS Supplier,
  i.Location AS InventoryLocation,
  pi.Quantity AS StockQuantity
FROM Product p
JOIN ProductBySupplier ps ON p.idProduct = ps.Product_idProduct
JOIN Supplier s ON ps.Supplier_idSupplier = s.idSupplier
JOIN ProductInventory pi ON p.idProduct = pi.Product_idProduct
JOIN Inventory i ON pi.Inventory_idInventory = i.idInventory;

-- 4. List of supplier names and their products
SELECT 
  s.BusinessName AS Supplier,
  p.Description AS Product
FROM Supplier s
JOIN ProductBySupplier ps ON s.idSupplier = ps.Supplier_idSupplier
JOIN Product p ON ps.Product_idProduct = p.idProduct;

-- 5. Orders with derived attribute: total order value
SELECT 
  o.idOrder,
  c.Name AS Client,
  SUM(p.Price * op.Quantity) AS TotalValue
FROM OrderTable o
JOIN Client c ON o.Client_idClient = c.idClient
JOIN OrderProduct op ON o.idOrder = op.Order_idOrder
JOIN Product p ON op.Product_idProduct = p.idProduct
GROUP BY o.idOrder
ORDER BY TotalValue DESC;

-- 6. Clients with more than 1 order
SELECT 
  c.Name,
  COUNT(o.idOrder) AS OrdersMade
FROM Client c
JOIN OrderTable o ON c.idClient = o.Client_idClient
GROUP BY c.idClient
HAVING COUNT(o.idOrder) > 1;

-- 7. Deliveries and their status
SELECT 
  d.idDelivery,
  d.TrackingCode,
  d.DeliveryStatus,
  o.Description AS OrderDescription,
  c.Name AS ClientName
FROM Delivery d
JOIN OrderTable o ON d.Order_idOrder = o.idOrder
JOIN Client c ON d.Client_idClient = c.idClient
ORDER BY d.ExpectedDeliveryDate;
