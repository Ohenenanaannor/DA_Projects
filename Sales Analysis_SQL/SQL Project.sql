# Group 2
# Which customers made the most purchases in the last 6 momnths?
# What percentages of total sales came from each product category?
# Which customers placed others in multiple countries?

# limitations:
# 1. Dupicate fields in the productid and customerid
# 2. Spaces in the column headers

# Data cleaning process:
# Create the table to remove the spaces in the column headers 
# In excel make the productid and customerid unique values

# creating customers table 
create table customers(
customerid varchar(10) primary key,
CustomerName varchar(100),
Age int,
Gender varchar(10),
country varchar(50),
Region varchar(50));

# creating product table 

create table products(
productid varchar(10) primary key,
Productname varchar(100),
category varchar(50),
price decimal(10,2));

# creating orders table 
CREATE TABLE orders (
    orderid VARCHAR(10) PRIMARY KEY,
    customerid VARCHAR(10),
    productid VARCHAR(10),
    quantity INT,
    totalsales DECIMAL(10,2),
    purchasedate DATE,
    paymentmethod VARCHAR(50),
    deliverytime_days INT ,
    FOREIGN KEY (customerid) REFERENCES customers(customerid) ,
    FOREIGN KEY (productid) REFERENCES products(productid)
);



# Make sure there are unique IDs for each field ( to remove duplicates in the customerid and productid )

desc orders;
desc customers;
desc products;
select * from orders;
select * from customers;
select * from products;


# Which customers made the most purchases in the last 6 momnths?
SELECT 
    c.CustomerName, 
    SUM(o.TotalSales) AS total_spent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.PurchaseDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY c.CustomerName
ORDER BY total_spent DESC
limit 10;


# what are the top 5 selling products by quantity sold?
SELECT 
    p.ProductName, 
    SUM(o.Quantity) AS total_quantity_sold
FROM orders o
JOIN products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY total_quantity_sold DESC
LIMIT 5;


# Which customers placed orders in multiple countries?
SELECT 
    c.CustomerName, 
    COUNT(DISTINCT c.Country) AS country_count
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
HAVING country_count > 1
ORDER BY country_count DESC;

# Jason Crosby Placed orders in two countries 

