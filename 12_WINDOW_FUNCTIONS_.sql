
-- TOPIC: WINDOW FUNCTIONS

-- Assign a unique row number to employees based on salary
-- from highest to lowest.
SELECT Emp_ID,Name,Salary,
    ROW_NUMBER() OVER (
        ORDER BY Salary DESC
    ) AS Salary_Row_Number
FROM Employee_Data;

-- Rank employees based on salary from highest to lowest.
-- Employees with the same salary receive the same rank.
SELECT Emp_ID,Name,Salary,
    RANK() OVER (
        ORDER BY Salary DESC
    ) AS Salary_Rank
FROM Employee_Data;

-- Rank employees based on salary without gaps between ranks.
SELECT Emp_ID,Name,Salary,
    DENSE_RANK() OVER (
        ORDER BY Salary DESC
    ) AS Salary_Dense_Rank
FROM Employee_Data;

-- Rank Within Department
SELECT Emp_ID,Name,Department,Salary,
    RANK() OVER (
        PARTITION BY Department
        ORDER BY Salary DESC
    ) AS Department_Rank
FROM Employee_Data;

-- Calculate the running total of revenue over time.
SELECT Order_ID,Order_Date,Product,
    Quantity * Unit_Price AS Revenue,
    SUM(Quantity * Unit_Price) OVER (
        ORDER BY Order_Date, Order_ID
    ) AS Running_Total_Revenue
FROM Sales_Data;

-- Calculate the cumulative quantity sold over time.
SELECT Order_ID,Order_Date,Product,Quantity,
    SUM(Quantity) OVER (
        ORDER BY Order_Date, Order_ID
    ) AS Cumulative_Quantity
FROM Sales_Data;

-- Calculate a 3-order moving average of revenue.
SELECT Order_ID,Order_Date,Product,
    Quantity * Unit_Price AS Revenue,
    AVG(Quantity * Unit_Price) OVER (
        ORDER BY Order_Date, Order_ID
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS Moving_Average_Revenue
FROM Sales_Data;

--  Previous Salary (LAG)
SELECT Emp_ID,Name,Salary,
    LAG(Salary) OVER (
        ORDER BY Salary DESC
    ) AS Previous_Salary
FROM Employee_Data;

--  Next Salary (LEAD)
SELECT Emp_ID,Name,Salary,
    LEAD(Salary) OVER (
        ORDER BY Salary DESC
    ) AS Next_Salary
FROM Employee_Data;

-- Show the highest salary in each employee's department.
SELECT Emp_ID,Name,Department,Salary,
    FIRST_VALUE(Salary) OVER (
        PARTITION BY Department
        ORDER BY Salary DESC
    ) AS First_Salary_In_Department
FROM Employee_Data;

-- Show the lowest salary in each employee's department.
SELECT Emp_ID,Name,Department,Salary,
    LAST_VALUE(Salary) OVER (
        PARTITION BY Department
        ORDER BY Salary DESC
        ) AS Last_Salary_In_Department
FROM Employee_Data;

-- Calculate the relative salary position of each employee.
SELECT Emp_ID,Name,Salary,
    PERCENT_RANK() OVER (
        ORDER BY Salary
    ) AS Salary_Percent_Rank
FROM Employee_Data;

-- Divide employees into four salary groups (quartiles) NTILE(4).
SELECT Emp_ID,Name,Salary,
    NTILE(4) OVER (
        ORDER BY Salary DESC
    ) AS Salary_Quartile
FROM Employee_Data;

-- Find the top 3 highest-paid employees in each department.
SELECT Emp_ID,Name,Department,Salary
FROM (
    SELECT Emp_ID,Name,Department,Salary,
        ROW_NUMBER() OVER (
            PARTITION BY Department
            ORDER BY Salary DESC
        ) AS Salary_Rank
    FROM Employee_Data
) AS Ranked_Employees
WHERE Salary_Rank <= 3;

-- Find the highest-revenue sale in each month.
SELECT Order_ID,Order_Date,Product,Revenue,Sales_Month
FROM (
    SELECT Order_ID,Order_Date,Product,
        Quantity * Unit_Price AS Revenue,
        DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
        ROW_NUMBER() OVER (
            PARTITION BY DATE_FORMAT(Order_Date, '%Y-%m')
            ORDER BY Quantity * Unit_Price DESC
        ) AS Sale_Rank
    FROM Sales_Data
) AS Monthly_Sales
WHERE Sale_Rank = 1;

-- Calculate monthly revenue and its running cumulative total.
SELECT Sales_Month,Monthly_Revenue,SUM(Monthly_Revenue) OVER (
        ORDER BY Sales_Month
    ) AS Running_Monthly_Revenue
FROM (
    SELECT
        DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
        SUM(Quantity * Unit_Price) AS Monthly_Revenue
    FROM Sales_Data
    GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
) AS Monthly_Revenue_Data;

-- Employee Numbering
-- Assign a unique sequential number to every employee.
SELECT ROW_NUMBER() OVER (
        ORDER BY Emp_ID
    ) AS Employee_Number,
    Emp_ID,
    Name,
    Department
FROM Employee_Data;

-- Customer Numbering
-- Assign a unique sequential number to every customer.
SELECT ROW_NUMBER() OVER (
        ORDER BY Customer_ID
    ) AS Customer_Number,
    Customer_ID,
    Customer_Name,
    City
FROM Customer_Data;

--  Sales Numbering
-- Assign a unique sequential number to every sale.
SELECT ROW_NUMBER() OVER (
        ORDER BY Order_Date, Order_ID
    ) AS Sales_Number,
    Order_ID,
    Customer_ID,
    Product,
    Order_Date
FROM Sales_Data;

-- Revenue Difference
-- Calculate the difference between the current sale's revenue
-- and the previous sale's revenue.
SELECT Order_ID,Order_Date,Product,Quantity * Unit_Price AS Revenue,
    (Quantity * Unit_Price)
    - LAG(Quantity * Unit_Price) OVER (
        ORDER BY Order_Date, Order_ID
      ) AS Revenue_Difference
FROM Sales_Data;

-- END --