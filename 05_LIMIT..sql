-- TOPIC: LIMIT

-- First five employees. 
SELECT* FROM employee_data
LIMIT 5;

-- First ten customers. 
SELECT Customer_Name FROM customer_data
LIMIT  10; 

-- firt 20 sales. 
SELECT * FROM sales_data
ORDER BY Order_ID
LIMIT 20;

-- Top five salaries
SELECT Emp_ID,Name,Salary 
FROM employee_data
ORDER BY Salary DESC
LIMIT 5; 

-- Top 10 saless amount. 
SELECT Order_ID,Customer_ID,Product,Unit_Price
FROM sales_data
ORDER BY Unit_Price DESC
LIMIT 10; 
-- Lowest five salaries
SELECT Emp_ID,Name,Salary 
FROM employee_data
ORDER BY Salary ASC
LIMIT 5; 

-- Latest five sales. 
SELECT* FROM sales_data
ORDER BY Order_Date ASC
LIMIT 5; 

-- Oldest five employees.  
SELECT Emp_ID,Name,Age
FROM employee_data
ORDER BY Age DESC
LIMIT 5; 

-- Highiest quantity sales. 
SELECT Order_ID,Customer_ID,Product,Quantity
from sales_data
ORDER BY Quantity DESC;

-- Lowest quatity sales. 
SELECT Order_ID,Customer_ID,Product,Quantity
from sales_data
ORDER BY Quantity ASC;

-- END --