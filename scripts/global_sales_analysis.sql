-- =======================================================
-- GLOBAL SALES DATA ANALYSIS | SQL POWER BI PROJECT
-- Description: SQL queries for cleaning, transforming, and analyzing
-- multi-country sales data using PostgreSQL.
-- =======================================================

----------------------------------------------------------
-- 1️⃣ MERGING MULTIPLE COUNTRY SALES DATASETS INTO ONE TABLE
----------------------------------------------------------
CREATE TABLE public."Sales_Data" AS
SELECT * FROM public."Sales_Canada"
UNION ALL
SELECT * FROM public."Sales_China"
UNION ALL
SELECT * FROM public."Sales_India"
UNION ALL
SELECT * FROM public."Sales_Nigeria"
UNION ALL
SELECT * FROM public."Sales_UK"
UNION ALL
SELECT * FROM public."Sales_US";

----------------------------------------------------------
-- 2️⃣ CHECKING FOR MISSING VALUES
----------------------------------------------------------
SELECT * 
FROM public."Sales_Data"
WHERE 
    "Country" IS NULL
    OR "Price Per Unit" IS NULL
    OR "Quantity Purchased" IS NULL
    OR "Cost Price" IS NULL
    OR "Discount Applied" IS NULL;

----------------------------------------------------------
-- 3️⃣ CHECKING FOR DUPLICATE TRANSACTIONS
----------------------------------------------------------
SELECT "Transaction ID", COUNT(*)
FROM public."Sales_Data"
GROUP BY "Transaction ID"
HAVING COUNT(*) > 1;

----------------------------------------------------------
-- 4️⃣ HANDLING MISSING VALUES
----------------------------------------------------------

-- Updating "Quantity Purchased" for a specific transaction
UPDATE public."Sales_Data"
SET "Quantity Purchased" = 3
WHERE "Transaction ID" = '00a30472-89a0-4688-9d33-67ea8ccf7aea';

-- Updating "Price Per Unit" using the average value
UPDATE public."Sales_Data"
SET "Price Per Unit" = (
    SELECT AVG("Price Per Unit")
    FROM public."Sales_Data"
    WHERE "Price Per Unit" IS NOT NULL
)
WHERE "Transaction ID" = '001898f7-b696-4356-91dc-8f2b73d09c63';

----------------------------------------------------------
-- 5️⃣ ADDING NEW COLUMNS: "TOTAL AMOUNT" AND "PROFIT"
----------------------------------------------------------

-- Adding "Total Amount" column
ALTER TABLE public."Sales_Data" 
ADD COLUMN "Total Amount" NUMERIC(10,2);

-- Calculating "Total Amount"
UPDATE public."Sales_Data"
SET "Total Amount" = ("Price Per Unit" * "Quantity Purchased") - "Discount Applied";

-- Adding "Profit" column
ALTER TABLE public."Sales_Data" 
ADD COLUMN "Profit" NUMERIC(10,2);

-- Calculating "Profit"
UPDATE public."Sales_Data"
SET "Profit" = "Total Amount" - ("Cost Price" * "Quantity Purchased");

----------------------------------------------------------
-- 6️⃣ REMOVING INCORRECT CATEGORY ENTRIES
----------------------------------------------------------

-- Identifying incorrect categories
SELECT *
FROM public."Sales_Data"
WHERE "Category" LIKE '%Again%';

-- Deleting incorrect categories
DELETE FROM public."Sales_Data"
WHERE "Category" LIKE '%Again%';

----------------------------------------------------------
-- 7️⃣ SALES PERFORMANCE ANALYSIS (FEB 10 - FEB 14, 2025)
----------------------------------------------------------

-- Sales Revenue & Profit by Country
SELECT 
    "Country",
    SUM("Total Amount") AS "Total Revenue",
    SUM("Profit") AS "Total Profit"
FROM public."Sales_Data"
WHERE "Date" BETWEEN '2025-02-10' AND '2025-02-14'
GROUP BY "Country"
ORDER BY "Total Revenue" DESC
LIMIT 5;

-- Top 5 Best-Selling Products
SELECT 
    "Product Name",
    SUM("Quantity Purchased") AS "Total Units Sold"
FROM public."Sales_Data"
WHERE "Date" BETWEEN '2025-02-10' AND '2025-02-14'
GROUP BY "Product Name"
ORDER BY "Total Units Sold" DESC
LIMIT 5;

-- Best Sales Representatives
SELECT 
    "Sales Representative",
    SUM("Total Amount") AS "Total Sales"
FROM public."Sales_Data"
WHERE "Date" BETWEEN '2025-02-10' AND '2025-02-14'
GROUP BY "Sales Representative"
ORDER BY "Total Sales" DESC
LIMIT 5;

-- Store Locations with the Highest Sales
SELECT 
    "Store Location",
    SUM("Total Amount") AS "Total Sales",
    SUM("Profit") AS "Total Profit"
FROM public."Sales_Data"
WHERE "Date" BETWEEN '2025-02-10' AND '2025-02-14'
GROUP BY "Store Location"
ORDER BY "Total Sales" DESC
LIMIT 5;

----------------------------------------------------------
-- 8️⃣ KEY SALES & PROFIT INSIGHTS (FEB 10 - FEB 14, 2025)
----------------------------------------------------------
SELECT 
    MIN("Total Amount") AS "Min Sales Value",
    MAX("Total Amount") AS "Max Sales Value",
    AVG("Total Amount") AS "Avg Sales Value",
    SUM("Total Amount") AS "Total Sales",
    MIN("Profit") AS "Min Profit",
    MAX("Profit") AS "Max Profit",
    AVG("Profit") AS "Avg Profit",
    SUM("Profit") AS "Total Profit"
FROM public."Sales_Data"
WHERE "Date" BETWEEN '2025-02-10' AND '2025-02-14';

-- =======================================================
