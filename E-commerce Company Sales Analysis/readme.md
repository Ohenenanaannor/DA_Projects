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
