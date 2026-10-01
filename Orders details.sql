-- ============================================
-- MEESHO ORDERS DATABASE
-- ============================================

-- 1. CREATE MEESHO_ORDERS TABLE
CREATE TABLE Meesho_Orders (
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount NUMBER(10,2) NOT NULL,

    FOREIGN KEY (Customer_ID)
    REFERENCES Meesho_Customers(Customer_ID)
);


-- 2. INSERT DATA INTO MEESHO_ORDERS
INSERT INTO Meesho_Orders
VALUES (101, 1, TO_DATE('01-09-2026','DD-MM-YYYY'), 799.00);

INSERT INTO Meesho_Orders
VALUES (102, 2, TO_DATE('02-09-2026','DD-MM-YYYY'), 499.00);

INSERT INTO Meesho_Orders
VALUES (103, 3, TO_DATE('03-09-2026','DD-MM-YYYY'), 1299.00);

INSERT INTO Meesho_Orders
VALUES (104, 4, TO_DATE('04-09-2026','DD-MM-YYYY'), 899.00);

INSERT INTO Meesho_Orders
VALUES (105, 5, TO_DATE('05-09-2026','DD-MM-YYYY'), 999.00);

COMMIT;


-- 3. CREATE MEESHO_ORDER_DETAILS TABLE
CREATE TABLE Meesho_Order_Details (
    Order_Detail_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER NOT NULL,
    Product_ID NUMBER NOT NULL,
    Quantity NUMBER NOT NULL,

    FOREIGN KEY (Order_ID)
    REFERENCES Meesho_Orders(Order_ID),

    FOREIGN KEY (Product_ID)
    REFERENCES Meesho_Products(Product_ID)
);


-- 4. INSERT DATA INTO MEESHO_ORDER_DETAILS
INSERT INTO Meesho_Order_Details
VALUES (1001, 101, 101, 2);

INSERT INTO Meesho_Order_Details
VALUES (1002, 102, 102, 1);

INSERT INTO Meesho_Order_Details
VALUES (1003, 103, 103, 3);

INSERT INTO Meesho_Order_Details
VALUES (1004, 104, 104, 1);

INSERT INTO Meesho_Order_Details
VALUES (1005, 105, 105, 2);

COMMIT;


-- 5. UPDATE ORDER TOTAL AMOUNT
UPDATE Meesho_Orders
SET Total_Amount = 899.00
WHERE Order_ID = 101;

COMMIT;


-- 6. UPDATE ORDER QUANTITY
UPDATE Meesho_Order_Details
SET Quantity = 3
WHERE Order_Detail_ID = 1001;

COMMIT;


-- 7. DISPLAY ALL ORDERS
SELECT *
FROM Meesho_Orders;


-- 8. DISPLAY ALL ORDER DETAILS
SELECT *
FROM Meesho_Order_Details;


-- 9. JOIN ORDERS AND ORDER DETAILS
SELECT 
    O.Customer_ID,
    O.Order_ID,
    O.Order_Date,
    OD.Product_ID,
    OD.Quantity,
    O.Total_Amount
FROM Meesho_Orders O
JOIN Meesho_Order_Details OD
ON O.Order_ID = OD.Order_ID
ORDER BY O.Customer_ID, O.Order_Date;


-- 10. JOIN CUSTOMERS, ORDERS AND ORDER DETAILS
SELECT 
    C.Customer_ID,
    C.Customer_Name,
    O.Order_ID,
    O.Order_Date,
    OD.Product_ID,
    OD.Quantity,
    O.Total_Amount
FROM Meesho_Customers C
JOIN Meesho_Orders O
ON C.Customer_ID = O.Customer_ID
JOIN Meesho_Order_Details OD
ON O.Order_ID = OD.Order_ID
ORDER BY C.Customer_ID, O.Order_Date;
