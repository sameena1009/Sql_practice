-- TOPIC: GROUP BY AND HAVING.. 

-- Employee by department 
SELECT Department, COUNT(*) AS Employee_count 
FROM employee_data
GROUP BY Department
HAVING COUNT(*)>5;

-- Customer by city. 
SELECT City, COUNT(*) AS Customer_count
FROM customer_data
GROUP BY City;

-- Sales by product.. 
SELECT Product,SUM(Unit_Price)
FROM sales_data
group by Product
HAVING SUM(Unit_Price)>50000;

-- Average salary by department. 
SELECT Department,AVG(Salary)
FROM employee_data
GROUP BY Department
HAVING AVG(Salary)>50000;

-- Total salary by department. 
SELECT Department,SUM(Salary)
FROM employee_data
GROUP BY Department;

-- higest salary by department 
SELECT Department,MAX(Salary)
FROM employee_data
GROUP BY Department;

-- lowest salary by departent. 
SELECT Department,MIN(Salary)
FROM employee_data
GROUP BY Department;

-- Total sales by customers. 
SELECT Customer_ID, SUM(Unit_Price)
FROM sales_data
GROUP BY Customer_ID;

-- Total quantity by product. 
SELECT Product, SUM(Quantity) AS Total_quantity
FROM sales_data
GROUP BY Product;

 -- average quantity by product. 
 SELECT Product,AVG(Quantity) AS Average_quantity
FROM sales_data
GROUP BY Product; 

-- sales count by payment method. 
SELECT Payment_Mode,COUNT(*) AS Sales_count
FROM sales_data
GROUP BY Payment_Mode; 

-- customerby city 
SELECT City,COUNT(*) AS Customer_count
FROM customer_data
GROUP BY City
HAVING COUNT(*)>20; 

-- Employee by city. 
SELECT City, COUNT(*) AS Employee_count
FROM employee_data
GROUP BY City; 

-- Average age by department. 
SELECT Department, AVG(Age)
FROM employee_data
GROUP BY Department; 

-- sales by month. 
SELECT MONTH(Order_Date) AS Sales_month, COUNT(*) AS Sales_count
FROM sales_data
GROUP BY MONTH(Order_Date); 

-- revenue by month 
SELECT MONTH(Order_Date) AS Sales_month, SUM(Unit_Price) AS Revenue
FROM sales_data
GROUP BY MONTH(Order_Date); 

-- orders by product.. 
SELECT Product, COUNT(*) AS Order_count
FROM sales_data
GROUP BY Product; 

-- quantity by city. 
SELECT Region, SUM(Quantity) AS Total_quantity
FROM sales_data
GROUP BY Region
HAVING SUM(Quantity)>200; 

-- sales by ccategory. 
SELECT Category, SUM(Unit_Price) as total_sales
FROM sales_data
GROUP BY Category; 

-- Reveue y city. 
SELECT Region, SUM(Unit_Price) AS Revenue
FROM sales_data
GROUP BY Region
HAVING SUM(Unit_Price)>20000; 

-- Product with total quanntity greaater tha 100. 
SELECT Product, SUM(Quantity) AS Total_quantity
FROM sales_data
GROUP BY Product
HAVING SUM(Quantity)>100; 

-- END --



 
 