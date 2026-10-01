-- Meesho DBMS Week-5: Payment Management

-- Create Payment Table
CREATE TABLE Meesho_Payments (
    Payment_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER,
    Payment_Mode VARCHAR2(20) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Amount NUMBER(10,2) NOT NULL,
    Payment_Status VARCHAR2(20) NOT NULL,
    FOREIGN KEY (Order_ID)
    REFERENCES Meesho_Orders(Order_ID)
);

-- Payment Data Insertion
INSERT INTO Meesho_Payments
VALUES (101, 1, 'UPI', DATE '2026-09-01', 799.00, 'Successful');

INSERT INTO Meesho_Payments
VALUES (102, 2, 'Card', DATE '2026-09-02', 1299.00, 'Successful');

INSERT INTO Meesho_Payments
VALUES (103, 3, 'Cash', DATE '2026-09-03', 599.00, 'Successful');

INSERT INTO Meesho_Payments
VALUES (104, 4, 'UPI', DATE '2026-09-04', 999.00, 'Failed');

INSERT INTO Meesho_Payments
VALUES (105, 5, 'Card', DATE '2026-09-05', 1499.00, 'Successful');

COMMIT;

-- Display Successful Payments
SELECT *
FROM Meesho_Payments
WHERE Payment_Status = 'Successful';

-- Display Failed Payments
SELECT *
FROM Meesho_Payments
WHERE Payment_Status = 'Failed';

-- Modify Payment Status
UPDATE Meesho_Payments
SET Payment_Status = 'Successful'
WHERE Payment_ID = 104;

COMMIT;

-- Verify Updated Payment Status
SELECT *
FROM Meesho_Payments
WHERE Payment_ID = 104;

-- Analyze Payment Methods
SELECT Payment_Mode,
       COUNT(*) AS Number_Of_Transactions,
       SUM(Payment_Amount) AS Total_Amount_Collected
FROM Meesho_Payments
WHERE Payment_Status = 'Successful'
GROUP BY Payment_Mode;

-- Payment Transaction Report
SELECT Payment_ID,
       Order_ID,
       Payment_Mode,
       Payment_Date,
       Payment_Amount,
       Payment_Status
FROM Meesho_Payments
ORDER BY Payment_Date;
