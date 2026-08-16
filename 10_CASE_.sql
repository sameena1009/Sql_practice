
-- TOPIC: CASE STATEMENTS

--  High / Low Salary
-- Classify employees earning 50,000 or more as High Salary,
-- otherwise Low Salary.

SELECT Emp_ID,Name,Salary,
    CASE
        WHEN Salary >= 50000 THEN 'High Salary'
        ELSE 'Low Salary'
    END AS Salary_Level
FROM Employee_Data;

--  Adult / Young Employee
-- Classify employees aged 25 or above as Adult,
-- otherwise Young.

SELECT Emp_ID,Name,Age,
    CASE
        WHEN Age >= 25 THEN 'Adult'
        ELSE 'Young'
    END AS Age_Category
FROM Employee_Data;

-- Experience Level
-- Classify employees based on their years of experience.
SELECT Emp_ID,Name,Joining_Date,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, Joining_Date, CURDATE()) >= 5
            THEN 'Senior Experience'
        WHEN TIMESTAMPDIFF(YEAR, Joining_Date, CURDATE()) >= 2
            THEN 'Mid Experience'
        ELSE 'Fresher'
    END AS Experience_Level
FROM Employee_Data;

--  Salary Grade
-- Give employees a salary grade based on their salary.
SELECT Emp_ID,Name,Salary,
    CASE
        WHEN Salary >= 70000 THEN 'Grade A'
        WHEN Salary >= 50000 THEN 'Grade B'
        WHEN Salary >= 35000 THEN 'Grade C'
        ELSE 'Grade D'
    END AS Salary_Grade
FROM Employee_Data;

--  Sales Category
-- Categorize sales based on revenue.
SELECT Order_ID,Product,Quantity,Unit_Price,
    Quantity * Unit_Price AS Revenue,
    CASE
        WHEN Quantity * Unit_Price >= 200000 THEN 'High Sale'
        WHEN Quantity * Unit_Price >= 50000 THEN 'Medium Sale'
        ELSE 'Low Sale'
    END AS Sales_Category
FROM Sales_Data;

--  Quantity Category
-- Categorize sales according to quantity sold.
SELECT Order_ID,Product,Quantity,
    CASE
        WHEN Quantity >= 5 THEN 'High Quantity'
        WHEN Quantity >= 3 THEN 'Medium Quantity'
        ELSE 'Low Quantity'
    END AS Quantity_Category
FROM Sales_Data;

--  Product Popularity
-- Classify products based on total quantity sold.
SELECT Product,SUM(Quantity) AS Total_Quantity_Sold,
    CASE
        WHEN SUM(Quantity) >= 50 THEN 'Highly Popular'
        WHEN SUM(Quantity) >= 25 THEN 'Moderately Popular'
        ELSE 'Less Popular'
    END AS Popularity
FROM Sales_Data
GROUP BY Product;


-- Customer Status
-- Classify customers registered in 2025 as New Customer,
-- otherwise Old Customer.
SELECT Customer_ID,Customer_Name,Registration_Date,
    CASE
        WHEN Registration_Date >= '2025-01-01'
             AND Registration_Date < '2026-01-01'
            THEN 'New Customer'
        ELSE 'Old Customer'
    END AS Customer_Status
FROM Customer_Data;

--  Department Code
-- Assign a code to each department.
SELECT Emp_ID,Name,Department,
    CASE
        WHEN Department = 'HR' THEN 'D01'
        WHEN Department = 'Finance' THEN 'D02'
        WHEN Department = 'IT' THEN 'D03'
        WHEN Department = 'Sales' THEN 'D04'
        WHEN Department = 'Marketing' THEN 'D05'
        ELSE 'D99'
    END AS Department_Code
FROM Employee_Data;

--  City Region
-- Classify cities into regions.
SELECT Emp_ID,Name,City,
    CASE
        WHEN City IN ('Delhi', 'Mumbai', 'Pune') THEN 'West/North'
        WHEN City IN ('Chennai', 'Hyderabad', 'Bangalore') THEN 'South'
        ELSE 'Other'
    END AS City_Region
FROM Employee_Data;

-- Employee Bonus Category
-- Assign a hypothetical bonus category based on salary.
SELECT Emp_ID,Name,Salary,
    CASE
        WHEN Salary >= 70000 THEN '20% Bonus'
        WHEN Salary >= 50000 THEN '15% Bonus'
        WHEN Salary >= 35000 THEN '10% Bonus'
        ELSE '5% Bonus'
    END AS Bonus_Category
FROM Employee_Data;

--  Performance Category
-- Classify employee performance using salary as a practice proxy
SELECT Emp_ID,Name,Salary,
    CASE
        WHEN Salary >= 70000 THEN 'Excellent'
        WHEN Salary >= 50000 THEN 'Good'
        WHEN Salary >= 35000 THEN 'Average'
        ELSE 'Needs Improvement'
    END AS Performance_Category
FROM Employee_Data;

--  Product Stock Level
SELECT Order_ID,Product,Quantity,
    CASE
        WHEN Quantity <= 2 THEN 'Low Stock'
        WHEN Quantity <= 5 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS Stock_Level
FROM Sales_Data;

--  Revenue Category
-- Categorize sales according to generated revenue.
SELECT Order_ID,Product,Quantity,Unit_Price,
    Quantity * Unit_Price AS Revenue,
    CASE
        WHEN Quantity * Unit_Price >= 100000 THEN 'High Revenue'
        WHEN Quantity * Unit_Price >= 30000 THEN 'Medium Revenue'
        ELSE 'Low Revenue'
    END AS Revenue_Category
FROM Sales_Data;

--  Customer Loyalty
-- Classify customers based on the number of orders they made.
SELECT c.Customer_ID,c.Customer_Name,
    COUNT(s.Order_ID) AS Total_Orders,
    CASE
        WHEN COUNT(s.Order_ID) >= 5 THEN 'Highly Loyal'
        WHEN COUNT(s.Order_ID) >= 3 THEN 'Loyal'
        WHEN COUNT(s.Order_ID) >= 1 THEN 'Regular'
        ELSE 'New/Inactive'
    END AS Customer_Loyalty
FROM Customer_Data c
LEFT JOIN Sales_Data s
    ON c.Customer_ID = s.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name;

--  Discount Eligibility
-- Customers with at least 3 orders are eligible for a discount.
SELECT c.Customer_ID,c.Customer_Name,
    COUNT(s.Order_ID) AS Total_Orders,
    CASE
        WHEN COUNT(s.Order_ID) >= 3 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS Discount_Eligibility
FROM Customer_Data c
LEFT JOIN Sales_Data s
    ON c.Customer_ID = s.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name;

--  Age Group
-- Classify employees into different age groups.
SELECT Emp_ID,Name,Age,
    CASE
        WHEN Age < 25 THEN '18-24'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        ELSE '45+'
    END AS Age_Group
FROM Employee_Data;

-- Seniority
-- Classify employees based on age as a practice exercise.
SELECT Emp_ID,Name,Age,
    CASE
        WHEN Age >= 35 THEN 'Senior'
        WHEN Age >= 28 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS Seniority
FROM Employee_Data;


--  Profit Level
SELECT Order_ID,Product,Quantity,Unit_Price,
    Quantity * Unit_Price AS Revenue,
    CASE
        WHEN Quantity * Unit_Price >= 100000
            THEN 'High Profit Potential'
        WHEN Quantity * Unit_Price >= 30000
            THEN 'Medium Profit Potential'
        ELSE 'Low Profit Potential'
    END AS Profit_Level
FROM Sales_Data;

-- Sales Performance
-- Classify sales according to generated revenue.
SELECT Order_ID, Customer_ID,Product,Quantity,Unit_Price,
    Quantity * Unit_Price AS Revenue,
    CASE
        WHEN Quantity * Unit_Price >= 100000 THEN 'Excellent'
        WHEN Quantity * Unit_Price >= 50000 THEN 'Good'
        WHEN Quantity * Unit_Price >= 20000 THEN 'Average'
        ELSE 'Low'
    END AS Sales_Performance
FROM Sales_Data;

-- END --