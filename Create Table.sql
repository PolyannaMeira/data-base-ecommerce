-- DATABASE CREATION
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- CLIENT TABLE (Individual or Company)
CREATE TABLE Client (
  idClient INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(45),
  ClientType ENUM('PF', 'PJ'),       -- PF: Individual, PJ: Company
  CpfCnpj VARCHAR(20),               -- Stores either CPF or CNPJ number
  Address VARCHAR(100)
);

-- PAYMENT METHODS TABLE
CREATE TABLE PaymentMethod (
  idPaymentMethod INT PRIMARY KEY AUTO_INCREMENT,
  PaymentType enum("Boleto", "Cartão", "Dois Cartões","Pix"),
  CardNumber VARCHAR(45),
  CardExpiration DATE,
  TransactionToken VARCHAR(45),
  Client_idClient INT,
  FOREIGN KEY (Client_idClient) REFERENCES Client(idClient)
);

-- THIRD-PARTY SELLER TABLE
CREATE TABLE ThirdPartySeller (
  idThirdPartySeller INT PRIMARY KEY AUTO_INCREMENT,
  BusinessName VARCHAR(45),
  Location VARCHAR(45)
);

-- SUPPLIER TABLE
CREATE TABLE Supplier (
  idSupplier INT PRIMARY KEY AUTO_INCREMENT,
  BusinessName VARCHAR(45),
  CNPJ VARCHAR(45)
);

-- PRODUCT TABLE
CREATE TABLE Product (
  idProduct INT PRIMARY KEY AUTO_INCREMENT,
  Category VARCHAR(45),
  Description VARCHAR(45),
  Price DECIMAL(10,2)
);

-- PRODUCT BY SELLER RELATION
CREATE TABLE ProductBySeller (
  Product_idProduct INT,
  ThirdPartySeller_idThirdPartySeller INT,
  Quantity INT,
  PRIMARY KEY (Product_idProduct, ThirdPartySeller_idThirdPartySeller),
  FOREIGN KEY (Product_idProduct) REFERENCES Product(idProduct),
  FOREIGN KEY (ThirdPartySeller_idThirdPartySeller) REFERENCES ThirdPartySeller(idThirdPartySeller)
);

-- PRODUCT BY SUPPLIER RELATION
CREATE TABLE ProductBySupplier (
  Product_idProduct INT,
  Supplier_idSupplier INT,
  PRIMARY KEY (Product_idProduct, Supplier_idSupplier),
  FOREIGN KEY (Product_idProduct) REFERENCES Product(idProduct),
  FOREIGN KEY (Supplier_idSupplier) REFERENCES Supplier(idSupplier)
);

-- INVENTORY TABLE
CREATE TABLE Inventory (
  idInventory INT PRIMARY KEY AUTO_INCREMENT,
  Location VARCHAR(45)
);

-- PRODUCT INVENTORY RELATION
CREATE TABLE ProductInventory (
  Product_idProduct INT,
  Inventory_idInventory INT,
  Quantity INT,
  PRIMARY KEY (Product_idProduct, Inventory_idInventory),
  FOREIGN KEY (Product_idProduct) REFERENCES Product(idProduct),
  FOREIGN KEY (Inventory_idInventory) REFERENCES Inventory(idInventory)
);

-- ORDER TABLE
CREATE TABLE OrderTable (
  idOrder INT PRIMARY KEY AUTO_INCREMENT,
  OrderStatus VARCHAR(45),
  Description VARCHAR(45),
  Client_idClient INT,
  FOREIGN KEY (Client_idClient) REFERENCES Client(idClient)
);

-- ORDER-PRODUCT RELATIONSHIP
CREATE TABLE OrderProduct (
  Order_idOrder INT,
  Product_idProduct INT,
  Quantity INT,
  PRIMARY KEY (Order_idOrder, Product_idProduct),
  FOREIGN KEY (Order_idOrder) REFERENCES OrderTable(idOrder),
  FOREIGN KEY (Product_idProduct) REFERENCES Product(idProduct)
);

-- DELIVERY TABLE
CREATE TABLE Delivery (
  idDelivery INT PRIMARY KEY AUTO_INCREMENT,
  DeliveryStatus enum("Preparação", "A caminho", "Entregue") default "Preparação",
  TrackingCode VARCHAR(45),
  ExpectedDeliveryDate DATE,
  Order_idOrder INT,
  Client_idClient INT,
  FOREIGN KEY (Order_idOrder) REFERENCES OrderTable(idOrder),
  FOREIGN KEY (Client_idClient) REFERENCES Client(idClient)
);
