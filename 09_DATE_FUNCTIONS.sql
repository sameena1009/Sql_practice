-- TOPIC: DATE FUNNCTIONS 

-- Current date. 
SELECT curdate() AS Current_date; 

-- current time. 
SELECT CURTIME() AS Current_time;

-- current timestamp. 
SELECT NOW() AS Current_timestamp; 

-- employee joied this year. 
SELECT YEAR(Joining_Date)
FROM employee_data; 

-- Employee joined after 2022.  
SELECT YEAR(Joining_Date)
FROM employee_data
WHERE YEAR(Joining_Date)>2022; 

-- employee joined before 2022. 
SELECT YEAR(Joining_Date)
FROM employee_data
WHERE YEAR(Joining_Date)<2022; 

-- month of joinig. 
SELECT MONTH(Joining_Date) AS Month,Name 
FROM employee_data; 

-- Year of joining. 
SELECT YEAR(Joining_Date) AS Month,Name 
FROM employee_data; 

-- Day of joining. 
SELECT DAY(Joining_Date) AS Month,Name 
FROM employee_data; 

-- Order this month. 
SELECT* FROM sales_data
WHERE MONTH(Order_Date)=MONTH(curdate()); 

-- Orders this year 
SELECT* FROM sales_data
WHERE YEAR(Order_Date)=YEAR(CURDATE()); 

-- Sales in jauary. 
SELECT* FROM sales_data
WHERE MONTH(Order_Date)=1; 

-- difference between today and joining date. 
SELECT Emp_ID,Name,Joining_Date,DATEDIFF(CURDATE(),Joining_Date) as days_worked 
FROM employee_data 

-- employee experience. 
SELECT Emp_ID,Name,Joining_Date,TIMESTAMPDIFF(YEAR,CURDATE(),Joining_Date) as experience 
FROM employee_data; 

-- orders in last 30 days. 
SELECT* FROM sales_data
WHERE Order_Date>= curdate()-INTERAL 30 DAY; 

-- ORDERS last year. 
SELECT* FROM sales_data
WHERE YEAR(Order_Date)=YEAR(curdate())-1; 

-- Month wise sales. 
SELECT MONTHNAME(Order_Date) as month,SUM(Quantity* Unit_Price) as total_sales
FROM sales_data
GROUP BY MONTHNAME(Order_Date),MONTH(Order_Date)
ORDER BY MONTH(Order_Date); 

-- Quater wise sales. 
SELECT QUARTER(Order_Date) as Quarter,SUM(Quantity* Unit_Price) as total_sales
FROM sales_data
GROUP BY QUARTER(Order_Date)
ORDER BY QUARTER(Order_Date); 

-- END -- 
