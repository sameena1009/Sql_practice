-- Topic covered :ORDER BY 

-- Salary descending
SELECT Emp_ID,Name,Salary 
FROM employee_data
ORDER BY Salary DESC; 

-- Salary ascendig 
SELECT Emp_ID,Name,Salary
FROM employee_data
ORDER BY Salary ASC; 

-- Employee name A TO Z.  
SELECT* FROM employee_data
ORDER BY Name ASC;

-- Employee name  Z to A.  
SELECT* FROM employee_data
ORDER BY Name desc; 

-- Joining date oldest first. 
SELECT* FROM employee_data
ORDER BY Joining_Date DESC; 

-- Joining date NEWEST first. 
SELECT* FROM employee_data
ORDER BY Joining_Date ASC; 

--  Age ascendig. 
SELECT* FROM employee_data
ORDER BY Age ASC;

--  Age descendig. 
SELECT* FROM employee_data
ORDER BY Age DESC; 

-- Amount LOWEST first. 
SELECT* FROM employee_data
ORDER BY Salary ASC;

-- Amount LOWEST first. 
SELECT* FROM employee_data
ORDER BY Salary ASC;

-- Amount HIGHEST first. 
SELECT* FROM employee_data
ORDER BY Salary DESC;

--  Sort by department then salary. 
SELECT Emp_ID,Name,Department,Salary 
FROM employee_data
ORDER BY Department AND Salary; 

-- sort quantity descendinng. 
SELECT Order_ID,Customer_ID,Product,Quantity
FROM sales_data
ORDER  BY Quantity DESC;

-- Sort product alphabetically. 
SELECT Order_ID,Customer_ID,Product,Quantity
FROM sales_data
ORDER BY Product ASC;  

-- Sort departmet and then eeployee  name. 
SELECT* FROM employee_data
ORDER BY Department AND Name;

-- end--

-- 


