-- MEESHO WOMEN'S FASHION E-COMMERCE DATABASE
--  SQL QUERY IMPLEMENTATION

-- 1. BASIC SQL QUERIES

-- 1.1 Display all products
SELECT * FROM Meesho_Product;

-- 1.2 Display selected product details
SELECT Product_ID, Product_Name, Price
FROM Meesho_Product;

-- 1.3 Find products where Category ID is 1
SELECT Product_ID, Product_Name
FROM Meesho_Product
WHERE Category_ID = 1;

-- 1.4 Display products in descending order of price
SELECT Product_ID, Product_Name, Price
FROM Meesho_Product
ORDER BY Price DESC;

-- 1.5 Display products in ascending order of price
SELECT Product_ID, Product_Name, Price
FROM Meesho_Product
ORDER BY Price ASC;

-- 1.6 Display unique category IDs
SELECT DISTINCT Category_ID
FROM Meesho_Product;

-- 2. SEARCH PRODUCTS

-- 2.1 Search products based on price
SELECT Product_ID, Product_Name, Price
FROM Meesho_Product
WHERE Price BETWEEN 500 AND 1500;

-- 2.2 Search products based on category
SELECT Product_ID, Product_Name, Category_ID
FROM Meesho_Product
WHERE Category_ID = 2;

-- 3. RETRIEVE CUSTOMER INFORMATION

-- 3.1 Display all customers
SELECT * FROM Customer;

-- 3.2 Display customer ID, name and email
SELECT Customer_ID, Customer_Name, Email
FROM Customer;

-- 4. APPLY FILTERING CONDITIONS

-- 4.1 Products priced below 1000 with available stock
SELECT Product_ID, Product_Name, Price, Stock_Quantity
FROM Meesho_Product
WHERE Price < 1000
AND Stock_Quantity > 0;

-- 4.2 Products belonging to category 1 or category 2
SELECT Product_ID, Product_Name, Category_ID
FROM Meesho_Product
WHERE Category_ID = 1
OR Category_ID = 2;

-- 4.3 Products not belonging to category 1
SELECT Product_ID, Product_Name, Category_ID
FROM Meesho_Product
WHERE NOT Category_ID = 1;

-- 5. BASIC BUSINESS REPORTS

-- 5.1 Product Price Report
SELECT Product_ID, Product_Name, Price
FROM Meesho_Product
ORDER BY Price DESC;

-- 5.2 Customer Order Report
SELECT C.Customer_ID,
       C.Customer_Name,
       O.Order_ID,
       O.Order_Date,
       O.Total_Amount
FROM Customer C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

-- 5.3 Product Order Report
SELECT O.Order_ID,
       P.Product_ID,
       P.Product_Name,
       OD.Quantity,
       OD.Price
FROM Orders O
JOIN Order_Details OD
ON O.Order_ID = OD.Order_ID
JOIN Meesho_Product P
ON OD.Product_ID = P.Product_ID;

-- 5.4 Customer-wise Total Orders
SELECT C.Customer_ID,
       C.Customer_Name,
       COUNT(O.Order_ID) AS Total_Orders
FROM Customer C
LEFT JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name;

-- 5.5 Customer-wise Total Purchase Amount
SELECT C.Customer_ID,
       C.Customer_Name,
       NVL(SUM(O.Total_Amount), 0) AS Total_Purchase_Amount
FROM Customer C
LEFT JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name;

-- END OF SQL QUERY IMPLEMENTATION
