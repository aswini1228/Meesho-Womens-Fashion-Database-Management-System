-- ============================================
-- MEESHO SELLER & INVENTORY DATABASE
-- ============================================


-- 1. CREATE MEESHO_SELLER TABLE
CREATE TABLE Meesho_Seller (
    Seller_ID NUMBER PRIMARY KEY,
    Seller_Name VARCHAR2(100) NOT NULL,
    Contact_Number VARCHAR2(15),
    Email VARCHAR2(100)
);


-- 2. INSERT SELLER DATA

INSERT INTO Meesho_Seller
VALUES (1, 'Fashion Hub', '9876543210', 'fashionhub@gmail.com');

INSERT INTO Meesho_Seller
VALUES (2, 'Style Collection', '9876501234', 'stylecollection@gmail.com');

INSERT INTO Meesho_Seller
VALUES (3, 'Trendy Store', '9876512345', 'trendystore@gmail.com');

COMMIT;


-- 3. CREATE MEESHO_INVENTORY TABLE

CREATE TABLE Meesho_Inventory (
    Inventory_ID NUMBER PRIMARY KEY,
    Seller_ID NUMBER,
    Product_ID NUMBER,
    Stock_Quantity NUMBER NOT NULL,
    Inventory_Status VARCHAR2(20),

    FOREIGN KEY (Seller_ID)
    REFERENCES Meesho_Seller(Seller_ID),

    FOREIGN KEY (Product_ID)
    REFERENCES Meesho_Products(Product_ID)
);


-- 4. INSERT INVENTORY DATA

INSERT INTO Meesho_Inventory
VALUES (101, 1, 101, 25, 'Available');

INSERT INTO Meesho_Inventory
VALUES (102, 2, 102, 30, 'Available');

INSERT INTO Meesho_Inventory
VALUES (103, 3, 103, 20, 'Available');

INSERT INTO Meesho_Inventory
VALUES (104, 1, 104, 40, 'Available');

INSERT INTO Meesho_Inventory
VALUES (105, 2, 105, 15, 'Available');

COMMIT;


-- 5. DISPLAY SELLER INVENTORY

SELECT
    s.Seller_Name,
    i.Product_ID,
    i.Stock_Quantity,
    i.Inventory_Status
FROM Meesho_Seller s
JOIN Meesho_Inventory i
ON s.Seller_ID = i.Seller_ID;


-- 6. DISPLAY AVAILABLE INVENTORY

SELECT *
FROM Meesho_Inventory
WHERE Inventory_Status = 'Available';


-- 7. DISPLAY UNAVAILABLE INVENTORY

SELECT *
FROM Meesho_Inventory
WHERE Inventory_Status = 'Unavailable';


-- 8. UPDATE PRODUCT 101 STOCK

UPDATE Meesho_Inventory
SET Stock_Quantity = 10,
    Inventory_Status = 'Available'
WHERE Product_ID = 101;

COMMIT;


-- 9. DISPLAY PRODUCT, STOCK AND STATUS

SELECT
    Product_ID,
    Stock_Quantity,
    Inventory_Status
FROM Meesho_Inventory;


-- 10. COUNT PRODUCTS BY INVENTORY STATUS

SELECT
    Inventory_Status,
    COUNT(*) AS Total_Products
FROM Meesho_Inventory
GROUP BY Inventory_Status;


-- 11. TOTAL STOCK BY SELLER

SELECT
    s.Seller_Name,
    SUM(i.Stock_Quantity) AS Total_Stock
FROM Meesho_Seller s
JOIN Meesho_Inventory i
ON s.Seller_ID = i.Seller_ID
GROUP BY s.Seller_Name;
