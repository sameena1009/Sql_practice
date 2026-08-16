-- TOPIC: STRING FUNCTIONS

-- Uppercase names. 
SELECT UPPER(Name) FROM employee_data; 

-- Lowercase nnames. 
SELECT LOWER(Name) FROM employee_data; 

-- Name length. 
SELECT LENGTH(Name) FROM employee_data; 

-- First three letters. 
SELECT RIGHT(Name,3) FROM employee_data; 

-- Last two letters. 
SELECT LEFT(Name,2) FROM employee_data; 

-- Concatenate first and last namme. 
SELECT CONCAT(First_name,Last_name) FROM employee_data; 

-- Replace gmail with outlookk. 
SELECT REPLACE(Email,gmail,outlook) FROM customer_data; 

-- trim spaces. 
SELECT TRIM(Name) FROM employee_data; 

-- Reverse employee names. 
SELECT REVERSE(Name) FROM employee_data; 

-- Find position of letter A . 
SELECT LOCATE(Name,'A') FROM employee_data; 

-- Extract email user name. 
   SELECT SUBSTRING_INDEX(Email,'@',1) AS username FROM customer_data; 
   
   -- capetalize names. 
   SELECT UPPER(Name) AS Capetalized_name FROM employee_data; 
   
   -- Count characters. 
   SELECT LENGTH(Name) FROM employee_data; 
   
   -- Product first letter. 
   SELECT RIGHT(Product,1) FROM sales_data; 
   
   -- Remove spaces, 
   SELECT TRIM(Customer_Name) FROM customer_data; 
   
   -- Replace city names 
   SELECT REPLACE(City,'Banglore','Bangaluru') FROM customer_data; 
   
   -- Last four digits of phone number.
   SELECT LEFT(Phone,4) FROM customer_data; 
   
   -- END --