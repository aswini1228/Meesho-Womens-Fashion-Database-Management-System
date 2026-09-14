CREATE TABLE Meesho_Category (
    Category_ID     NUMBER PRIMARY KEY,
    Category_Name   VARCHAR2(100) NOT NULL UNIQUE,
    Description     VARCHAR2(200)
);

INSERT INTO Meesho_Category
    (Category_ID, Category_Name, Description)
VALUES
    (1, 'Sarees', 'Traditional and designer sarees');

INSERT INTO Meesho_Category
    (Category_ID, Category_Name, Description)
VALUES
    (2, 'Kurtis', 'Women ethnic kurtis');

INSERT INTO Meesho_Category
    (Category_ID, Category_Name, Description)
VALUES
    (3, 'Western Wear', 'Modern western fashion');

INSERT INTO Meesho_Category
    (Category_ID, Category_Name, Description)
VALUES
    (4, 'Jewellery', 'Fashion jewellery and accessories');


CREATE TABLE Meesho_Product (
    Product_ID       NUMBER PRIMARY KEY,
    Product_Name     VARCHAR2(100) NOT NULL,
    Category_ID      NUMBER NOT NULL,
    Price            NUMBER(10,2) NOT NULL,
    Stock_Quantity   NUMBER NOT NULL,

    CONSTRAINT FK_Meesho_Category
        FOREIGN KEY (Category_ID)
        REFERENCES Meesho_Category(Category_ID)
);


INSERT INTO Meesho_Product
VALUES (101, 'Cotton Saree', 1, 599.00, 25);

INSERT INTO Meesho_Product
VALUES (102, 'Printed Kurti', 2, 499.00, 30);

INSERT INTO Meesho_Product
VALUES (103, 'Western Top', 3, 399.00, 20);

INSERT INTO Meesho_Product
VALUES (104, 'Fashion Earrings', 4, 199.00, 40);

INSERT INTO Meesho_Product
VALUES (105, 'Designer Kurti', 2, 799.00, 15);


SELECT * FROM Meesho_Category;

SELECT * FROM Meesho_Product;


UPDATE Meesho_Product
SET Price = 649.00,
    Stock_Quantity = 30
WHERE Product_ID = 101;

SELECT * FROM Meesho_Product
WHERE Product_ID = 101;


UPDATE Meesho_Product
SET Price = 549.00
WHERE Product_Name = 'Printed Kurti';

SELECT * FROM Meesho_Product
WHERE Product_Name = 'Printed Kurti';


DELETE FROM Meesho_Product
WHERE Product_ID = 103;

SELECT * FROM Meesho_Product
WHERE Product_ID = 103;


DELETE FROM Meesho_Product
WHERE Product_Name = 'Fashion Earrings';

SELECT * FROM Meesho_Product
WHERE Product_Name = 'Fashion Earrings';


SELECT * FROM Meesho_Product;


SELECT
    C.Category_Name,
    P.Product_ID,
    P.Product_Name,
    P.Price,
    P.Stock_Quantity
FROM Meesho_Category C
JOIN Meesho_Product P
    ON C.Category_ID = P.Category_ID
ORDER BY C.Category_Name, P.Product_Name;


SELECT
    P.Product_ID,
    P.Product_Name,
    C.Category_Name,
    P.Price
FROM Meesho_Product P
JOIN Meesho_Category C
    ON P.Category_ID = C.Category_ID
WHERE C.Category_Name IN
    ('Sarees', 'Kurtis', 'Western Wear');


SELECT
    C.Category_Name,
    COUNT(P.Product_ID) AS Total_Products
FROM Meesho_Category C
LEFT JOIN Meesho_Product P
    ON C.Category_ID = P.Category_ID
GROUP BY C.Category_Name
ORDER BY C.Category_Name;


COMMIT;
