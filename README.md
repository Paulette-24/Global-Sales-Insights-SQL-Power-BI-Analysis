# Global Sales Insights: SQL & Power BI Analysis

![Sales](https://your-image-link.com/powerbi_dashboard.png)

## Links  
- [Power BI Interactive Dashboard](https://app.powerbi.com/view?r=YOUR_EMBEDDED_LINK)  
- [GitHub Repository](https://github.com/YOUR-USERNAME/Global-Sales-Insights)  

---

## **Project Overview**  
This project analyzes e-commerce sales data collected from six different countries. The SQL queries clean, merge, and process raw data, while Power BI visualizations highlight sales trends, top-performing products, and profit insights.  

The project focuses on business questions such as:

i) Which countries generate the most revenue and profit?  

ii) Who are the top-performing sales representatives?  

iii) Which store locations generate the highest sales? 

iv) What are the top-selling products across all regions? 

v) How do discounts impact profitability? 

---

## **Stakeholder Audience**  
This analysis is intended for:  
- **Business Executives & Sales Teams** – to track performance across multiple countries.  
- **Marketing & Pricing Teams** – to analyze the effectiveness of discount strategies.  
- **Finance & Profitability Analysts** – to optimize revenue streams and manage costs.  

---

## Dataset Information 
The dataset contains sales transactions from multiple store locations across six countries. Each record includes product details, pricing, quantity, discounts, and customer demographics.

**Key Columns in the Dataset:**  
- `Transaction ID` – Unique ID for each sale  
- `Date` – Transaction date  
- `Country` – Country of purchase  
- `Product Name` – Name of the product sold  
- `Category` – Product category (Electronics, Clothing, etc.)  
- `Price Per Unit` – Unit price of the product  
- `Quantity Purchased` – Number of units sold  
- `Cost Price` – Cost of the product to the business  
- `Discount Applied` – Discount provided on the sale  
- `Total Amount` – Total revenue generated  
- `Profit` – Profit per transaction  
- `Store Location` – City where the transaction took place  
- `Sales Representative` – Salesperson handling the transaction  

---

## Data Preparation & SQL Queries 
### Data Cleaning & Processing 
**Steps Taken:** 
1. Merging multiple datasets into a single `Sales_Data` table  
2. Handling missing values (e.g., price, quantity, discount)  
3. Removing duplicate transactions  
4. Calculating key financial metrics (`Total Amount`, `Profit`)  
5. Filtering incorrect product categories  

### Key SQL Queries Used  
- Data Cleaning & Merging  
- Revenue & Profit Analysis by Country 
- Top-Selling Products & Sales Trends  
- Store Performance Analysis  
- Profitability vs Discounts  

📜 **Full SQL script available in** ➝ [`global_sales_analysis.sql`](sql_queries/global_sales_analysis.sql)  

---

## Data Analysis & Insights  
