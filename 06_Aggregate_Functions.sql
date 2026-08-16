-- TOPIC: Aggregate functions

-- Count employees. 
SELECT COUNT(*)
FROM employee_data; 

-- Count customers. 
SELECT COUNT(*)
FROM customer_data; 

-- Count sales. 
SELECT COUNT(*)
FROM sales_data; 

-- sum salary 
SELECT SUM(Salary)
FROM employee_data; 

-- average salary. 
SELECT AVG(Salary)
FROM employee_data;

-- Maximum salary. 
SELECT MAX(Salary)
FROM employee_data;

-- Minimum salary. 
SELECT MIN(Salary)
FROM employee_data;

-- Maximumm amount. 
SELECT MAX(Unit_Price)
FROM sales_data; 

--- Minimum amount. 
SELECT MIN(Unit_Price)
FROM sales_data;

-- Average amount. 
SELECT AVG(Unit_Price)
FROM sales_data; 

-- Sum of amount. 
SELECT SUM(Unit_Price)
from sales_data; 

-- count IT employees. 
SELECT COUNT(Department)
FROM employee_data
WHERE Department= 'IT'; 

-- Average finace salary. 
SELECT AVG(Salary),Department
FROM employee_data
WHERE Department='Finance';

-- sum of sales quantity. 
SELECT SUM(Quantity)
from sales_data; 

-- maximum age. 
SELECT MAX(Age) 
from employee_data;

-- minimum age. 
SELECT MIN(Age) 
 FROM employee_data;
 
 -- Count mumbai customers. 
 SELECT  COUNT(Customer_ID),Customer_Name,City
 FROM customer_data
 WHERE City='mumbai'; 
 
 -- average quanntiy. 
 SELECT AVG(Quantity)
 FROM sales_data; 
 
 -- Sum hr salary. 
 SELECT SUM(Salary),Department
 FROM employee_data
 WHERE Department='HR';
 
 -- Total sales value. 
 SELECT SUM(Unit_Price)
 FROM sales_data ;
 
 -- END --
 

