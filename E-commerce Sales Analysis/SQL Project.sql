# Which customers made the most purchases in the last 6 momnths?
# What percentages of total sales came from each product category?
# Which customers placed others in multiple countries?
# What percentage of total sales came from each product category?
# How many customers are from each country?
# What is the breakdown of total sales revenue by country?
# Which age contributes the most to total revenue?

# limitations:
# 1. Dupicate fields in the productid and customerid csv files
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
limit 5;


# what are the top 5 selling products by quantity sold?
SELECT 
    p.ProductName, 
    SUM(o.Quantity) AS total_quantity_sold
FROM orders o
JOIN products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY total_quantity_sold DESC
LIMIT 5;


# What percentage of total sales came from each product category?
SELECT 
    p.category,
    SUM(o.totalsales) AS category_sales,
    ROUND(SUM(o.totalsales) * 100.0 / (SELECT SUM(totalsales) FROM orders), 2) AS percentage_of_total_sales
FROM 
    orders o
JOIN 
    products p ON o.productid = p.productid
GROUP BY 
    p.category
order by 
	category_sales desc;

# How many customers are from each country?
SELECT 
    country, 
    COUNT(customerid) AS number_of_customers
FROM 
    customers
GROUP BY 
    country
order by number_of_customers desc;

# What is the breakdown of total sales revenue by country?
SELECT 
    c.country, 
    SUM(o.totalsales) AS total_sales_revenue,
    ROUND(SUM(o.totalsales) * 100.0 / (SELECT SUM(totalsales) FROM orders), 2) AS percentage_of_total_sales
FROM 
    orders o
JOIN 
    customers c ON o.customerid = c.customerid
GROUP BY 
    c.country
ORDER BY 
    total_sales_revenue DESC;


# Which age contributes the most to total revenue?
SELECT 
    CASE
        WHEN c.Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN c.Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN c.Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN c.Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN c.Age BETWEEN 55 AND 64 THEN '55-64'
        WHEN c.Age >= 65 THEN '65+'
        ELSE 'Unknown'
    END AS age_group,
    SUM(o.totalsales) AS total_sales_revenue
FROM 
    orders o
JOIN 
    customers c ON o.customerid = c.customerid
GROUP BY 
    age_group
ORDER BY 
    total_sales_revenue DESC;

