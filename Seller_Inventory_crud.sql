-- =========================================================
-- MEESHO WOMEN'S FASHION DATABASE
-- SELLER AND INVENTORY MANAGEMENT
-- DBMS TASK - WEEK 3
-- =========================================================


-- =========================================================
-- 1. CREATE SELLER TABLE
-- =========================================================

CREATE TABLE Meesho_Seller (
    Seller_ID NUMBER PRIMARY KEY,
    Seller_Name VARCHAR2(100) NOT NULL,
    Contact_Number VARCHAR2(15),
    Email VARCHAR2(100)
);


-- =========================================================
-- 2. CREATE INVENTORY TABLE
-- =========================================================

CREATE TABLE Inventory (
    Inventory_ID NUMBER PRIMARY KEY,
    Seller_ID NUMBER,
    Product_ID NUMBER,
    Stock_Quantity NUMBER NOT NULL,
    Inventory_Status VARCHAR2(20),

    FOREIGN KEY (Seller_ID)
        REFERENCES Meesho_Seller(Seller_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES Meesho_Product(Product_ID)
);


-- =========================================================
-- 3. INSERT SELLER DETAILS
-- =========================================================

INSERT INTO Meesho_Seller
(Seller_ID, Seller_Name, Contact_Number, Email)
VALUES
(1, 'Fashion Hub', '9876543210', 'fashionhub@gmail.com');

INSERT INTO Meesho_Seller
(Seller_ID, Seller_Name, Contact_Number, Email)
VALUES
(2, 'Style Collection', '9876543211', 'stylecollection@gmail.com');

INSERT INTO Meesho_Seller
(Seller_ID, Seller_Name, Contact_Number, Email)
VALUES
(3, 'Trendy Store', '9876543212', 'trendystore@gmail.com');

INSERT INTO Meesho_Seller
(Seller_ID, Seller_Name, Contact_Number, Email)
VALUES
(4, 'Fashion World', '9876543213', 'fashionworld@gmail.com');

INSERT INTO Meesho_Seller
(Seller_ID, Seller_Name, Contact_Number, Email)
VALUES
(5, 'Elegant Wear', '9876543214', 'elegantwear@gmail.com');


-- =========================================================
-- 4. INSERT INVENTORY DETAILS
-- =========================================================

INSERT INTO Inventory
(Inventory_ID, Seller_ID, Product_ID, Stock_Quantity, Inventory_Status)
VALUES
(1, 1, 101, 25, 'Available');

INSERT INTO Inventory
(Inventory_ID, Seller_ID, Product_ID, Stock_Quantity, Inventory_Status)
VALUES
(2, 2, 102, 30, 'Available');

INSERT INTO Inventory
(Inventory_ID, Seller_ID, Product_ID, Stock_Quantity, Inventory_Status)
VALUES
(3, 3, 103, 20, 'Available');

INSERT INTO Inventory
(Inventory_ID, Seller_ID, Product_ID, Stock_Quantity, Inventory_Status)
VALUES
(4, 1, 104, 40, 'Available');

INSERT INTO Inventory
(Inventory_ID, Seller_ID, Product_ID, Stock_Quantity, Inventory_Status)
VALUES
(5, 2, 105, 15, 'Available');


-- =========================================================
-- 5. DISPLAY SELLER INFORMATION
-- =========================================================

SELECT * 
FROM Meesho_Seller;


-- =========================================================
-- 6. DISPLAY INVENTORY INFORMATION
-- =========================================================

SELECT * 
FROM Inventory;


-- =========================================================
-- 7. MAINTAIN SELLER PRODUCT INFORMATION
-- =========================================================

SELECT
    S.Seller_ID,
    S.Seller_Name,
    I.Product_ID,
    I.Stock_Quantity,
    I.Inventory_Status
FROM Meesho_Seller S
JOIN Inventory I
ON S.Seller_ID = I.Seller_ID;


-- =========================================================
-- 8. TRACK AVAILABLE PRODUCTS
-- =========================================================

SELECT
    Inventory_ID,
    Seller_ID,
    Product_ID,
    Stock_Quantity,
    Inventory_Status
FROM Inventory
WHERE Inventory_Status = 'Available';


-- =========================================================
-- 9. TRACK UNAVAILABLE PRODUCTS
-- =========================================================

SELECT
    Inventory_ID,
    Seller_ID,
    Product_ID,
    Stock_Quantity,
    Inventory_Status
FROM Inventory
WHERE Inventory_Status = 'Unavailable';


-- =========================================================
-- 10. UPDATE PRODUCT AS UNAVAILABLE
-- =========================================================

UPDATE Inventory
SET Inventory_Status = 'Unavailable'
WHERE Product_ID = 105;


-- =========================================================
-- 11. DISPLAY UPDATED UNAVAILABLE PRODUCT
-- =========================================================

SELECT *
FROM Inventory
WHERE Product_ID = 105;


-- =========================================================
-- 12. UPDATE PRODUCT AS AVAILABLE
-- =========================================================

UPDATE Inventory
SET Inventory_Status = 'Available'
WHERE Product_ID = 105;


-- =========================================================
-- 13. PRODUCT-WISE INVENTORY REPORT
-- =========================================================

SELECT
    Product_ID,
    Stock_Quantity,
    Inventory_Status
FROM Inventory
ORDER BY Product_ID;


-- =========================================================
-- 14. AVAILABILITY STATUS REPORT
-- =========================================================

SELECT
    Inventory_Status,
    COUNT(*) AS Total_Products
FROM Inventory
GROUP BY Inventory_Status;


-- =========================================================
-- 15. TOTAL STOCK BY SELLER
-- =========================================================

SELECT
    S.Seller_ID,
    S.Seller_Name,
    SUM(I.Stock_Quantity) AS Total_Stock
FROM Meesho_Seller S
JOIN Inventory I
ON S.Seller_ID = I.Seller_ID
GROUP BY
    S.Seller_ID,
    S.Seller_Name
ORDER BY S.Seller_ID;


-- =========================================================
-- 16. COMPLETE INVENTORY STATUS REPORT
-- =========================================================

SELECT
    S.Seller_Name AS Seller,
    I.Product_ID AS Product,
    I.Stock_Quantity AS Stock,
    I.Inventory_Status AS Status
FROM Meesho_Seller S
JOIN Inventory I
ON S.Seller_ID = I.Seller_ID
ORDER BY S.Seller_Name;


-- =========================================================
-- 17. COMMIT CHANGES
-- =========================================================

COMMIT;
