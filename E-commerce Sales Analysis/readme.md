# 🛒 E-commerce Sales Analytics Dashboard

## 📖 Project Overview
The **E-commerce Sales Analytics Dashboard** delivers actionable insights into customer behavior, product performance, and regional sales distribution. This project supports **data-driven decisions** by empowering stakeholders with a clear understanding of how sales vary across demographics, time, and geography.

---

## 🛠 Tools Used
- **SQL** – Data analysis & querying  
- **Excel / CSV** – Data cleaning & preparation  
- **Power BI / Tableau** *(optional)* – Dashboard & visual storytelling  
- **Data Analytics Techniques** – Cohort analysis, sales breakdowns, demographic insights

---
## 🧼 Data Cleaning Summary

### ⚠️ Issues Identified
- Duplicate `customerid` and `productid` in raw data  
- Spaces in column headers  

### ✅ Actions Taken
- Ensured unique IDs in Excel before import  
- Removed column header spaces  
- Created relational tables with `PRIMARY` and `FOREIGN KEYS`  

---
## 🔍 Key Questions Explored
- 🧍‍♂️ Who are the top-spending customers in the last 6 months?  
- 📦 Which product categories contribute most to total sales?  
- 🌍 How is customer distribution spread across countries and regions?  
- 🔄 Which customers placed orders in multiple countries?  
- 👥 Which age groups are driving the most revenue?  

---

## 💻 SQL Queries & Insights

### 📊 Top 5 Products by Quantity Sold
```sql
SELECT 
    p.ProductName, 
    SUM(o.Quantity) AS total_quantity_sold
FROM orders o
JOIN products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY total_quantity_sold DESC
LIMIT 5;
```
### 🏷️ Sales by Product Category (% of Total)
```sql
SELECT 
    p.category,
    SUM(o.totalsales) AS category_sales,
    ROUND(SUM(o.totalsales) * 100.0 / (SELECT SUM(totalsales) FROM orders), 2) AS percentage_of_total_sales
FROM orders o
JOIN products p ON o.productid = p.productid
GROUP BY p.category
ORDER BY category_sales DESC;

```
### 🌐 Customers by Country
```sql
SELECT 
    country, 
    COUNT(customerid) AS number_of_customers
FROM customers
GROUP BY country
ORDER BY number_of_customers DESC;


```
### 💵 Sales Revenue by Country (% of Total)
```sql
SELECT 
    c.country, 
    SUM(o.totalsales) AS total_sales_revenue,
    ROUND(SUM(o.totalsales) * 100.0 / (SELECT SUM(totalsales) FROM orders), 2) AS percentage_of_total_sales
FROM orders o
JOIN customers c ON o.customerid = c.customerid
GROUP BY c.country
ORDER BY total_sales_revenue DESC;


```
### 👶 Revenue by Age Group
```sql
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
FROM orders o
JOIN customers c ON o.customerid = c.customerid
GROUP BY age_group
ORDER BY total_sales_revenue DESC;

```

### 🧾 Top Customers (Last 6 Months)
```sql
SELECT 
    c.CustomerName, 
    SUM(o.TotalSales) AS total_spent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.PurchaseDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY c.CustomerName
ORDER BY total_spent DESC
LIMIT 5;
```
![Dashboard](https://github.com/Ohenenanaannor/DA_Projects/blob/master/E-commerce%20Sales%20Analysis/images/Picture1.png)

## 💡 Recommendations
- 🎁 Reward top customers with loyalty programs  
- 🛍️ Boost popular categories with inventory focus and ads  
- 🌍 Target underperforming regions with localized marketing  
- 👵 Understand age trends to tailor product offerings  

---

## 📂 Data Source
The project uses **sample global e-commerce data**, consisting of:
- `customers`  
- `products`  
- `orders`

---

## 📎 How to Use This Report
1. Clone or download the project repository  
2. Load the SQL scripts into your preferred database environment  
3. Import data and run queries for insights  
4. *(Optional)* Build a Power BI / Tableau dashboard using query outputs
