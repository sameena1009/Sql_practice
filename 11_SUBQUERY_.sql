
-- TOPIC: SUBQUERIES

--  Employee with Highest Salary
-- Find the employee(s) who have the highest salary.
SELECT Emp_ID,Name,Salary
FROM Employee_Data
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee_Data
);

-- Employee with Lowest Salary
SELECT Emp_ID,Name,Salary
FROM Employee_Data
WHERE Salary = (
    SELECT MIN(Salary)
    FROM Employee_Data
);

--  Salary Above Average
SELECT Emp_ID,Name,Salary
FROM Employee_Data
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee_Data
);

-- Salary Below Average
SELECT Emp_ID,Name,Salary
FROM Employee_Data
WHERE Salary < (
    SELECT AVG(Salary)
    FROM Employee_Data
);

--  Customer Spending Above Average
-- Find customers whose total spending is above the average
SELECT c.Customer_ID,c.Customer_Name,
    (
	SELECT SUM(s.Quantity * s.Unit_Price)
        FROM Sales_Data s
        WHERE s.Customer_ID = c.Customer_ID
    ) AS Total_Spending
FROM Customer_Data c
WHERE (
    SELECT SUM(s.Quantity * s.Unit_Price)
    FROM Sales_Data s
    WHERE s.Customer_ID = c.Customer_ID
) > (
    SELECT AVG(Customer_Spending)
    FROM (
        SELECT
            Customer_ID,
            SUM(Quantity * Unit_Price) AS Customer_Spending
        FROM Sales_Data
        GROUP BY Customer_ID
    ) AS Customer_Totals
);


-- QUESTION 6: Highest Sale
-- Find the sale with the highest revenue.
-- Revenue = Quantity × Unit_Price.

SELECT
    Order_ID,
    Customer_ID,
    Product,
    Quantity,
    Unit_Price,
    Quantity * Unit_Price AS Revenue
FROM Sales_Data
WHERE Quantity * Unit_Price = (
    SELECT MAX(Quantity * Unit_Price)
    FROM Sales_Data
);

--  Lowest Sale
-- Find the sale with the lowest revenue.
SELECT Order_ID,Customer_ID,Product,Quantity,Unit_Price,
    Quantity * Unit_Price AS Revenue
FROM Sales_Data
WHERE Quantity * Unit_Price = (
    SELECT MIN(Quantity * Unit_Price)
    FROM Sales_Data
);

--  Products Sold Above Average
-- Find products whose total quantity sold is above the
SELECT Product,SUM(Quantity) AS Total_Quantity_Sold
FROM Sales_Data
GROUP BY Product
HAVING SUM(Quantity) > (
    SELECT AVG(Product_Quantity)
    FROM (
        SELECT
            Product,
            SUM(Quantity) AS Product_Quantity
        FROM Sales_Data
        GROUP BY Product
    ) AS Product_Totals
);

--  Department Highest Salary
SELECT Department,MAX(Salary) AS Highest_Salary
FROM Employee_Data
GROUP BY Department
HAVING MAX(Salary) = (
    SELECT MAX(Salary)
    FROM Employee_Data
);

--  Department Lowest Salary
SELECT Department,MIN(Salary) AS Lowest_Salary
FROM Employee_Data
GROUP BY Department
HAVING MIN(Salary) = (
    SELECT MIN(Salary)
    FROM Employee_Data
);

--  Employees in Highest-Paying Department
SELECT Emp_ID,Name,Department,Salary
FROM Employee_Data
WHERE Department = (
    SELECT Department
    FROM Employee_Data
    GROUP BY Department
    ORDER BY AVG(Salary) DESC
    LIMIT 1
);

--  Customers with No Purchases
SELECT Customer_ID,Customer_Name
FROM Customer_Data
WHERE Customer_ID NOT IN (
    SELECT DISTINCT Customer_ID
    FROM Sales_Data
);

--  Second Highest Salary
SELECT Emp_ID,Name,Salary
FROM Employee_Data
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee_Data
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Employee_Data
    )
);

--  Third Highest Salary
SELECT Emp_ID,Name,Salary
FROM Employee_Data
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee_Data
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Employee_Data
        WHERE Salary < (
            SELECT MAX(Salary)
            FROM Employee_Data
        )
    )
);

--  Top Customer
-- Find the customer who has spent the most money.
SELECT Customer_ID,SUM(Quantity * Unit_Price) AS Total_Spending
FROM Sales_Data
GROUP BY Customer_ID
HAVING SUM(Quantity * Unit_Price) = (
    SELECT MAX(Customer_Spending)
    FROM (
        SELECT
            Customer_ID,
            SUM(Quantity * Unit_Price) AS Customer_Spending
        FROM Sales_Data
        GROUP BY Customer_ID
    ) AS Customer_Totals
);

--  Product Most Sold
SELECT Product,SUM(Quantity) AS Total_Quantity_Sold
FROM Sales_Data
GROUP BY Product
HAVING SUM(Quantity) = (
    SELECT MAX(Product_Quantity)
    FROM (
        SELECT
            Product,
            SUM(Quantity) AS Product_Quantity
        FROM Sales_Data
        GROUP BY Product
    ) AS Product_Totals
);

--  Most Profitable Month
-- Find the month with the highest revenue.
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
    SUM(Quantity * Unit_Price) AS Monthly_Revenue
FROM Sales_Data
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
HAVING SUM(Quantity * Unit_Price) = (
    SELECT MAX(Monthly_Revenue)
    FROM (
        SELECT
            DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
            SUM(Quantity * Unit_Price) AS Monthly_Revenue
        FROM Sales_Data
        GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
    ) AS Monthly_Totals
);

-- Find customers whose total purchased quantity is above
-- the average quantity purchased per customer.
SELECT Customer_ID,SUM(Quantity) AS Total_Quantity
FROM Sales_Data
GROUP BY Customer_ID
HAVING SUM(Quantity) > (
    SELECT AVG(Customer_Quantity)
    FROM (
        SELECT
            Customer_ID,
            SUM(Quantity) AS Customer_Quantity
        FROM Sales_Data
        GROUP BY Customer_ID
    ) AS Customer_Totals
);


-- Find employees whose salary is higher than the average
-- salary of their own department.
SELECT Emp_ID,Name,Department,Salary
FROM Employee_Data e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee_Data
    WHERE Department = e.Department
);


-- Find the order placed on the latest order date.
SELECT Order_ID,Customer_ID,Product,Quantity,Unit_Price,Order_Date
FROM Sales_Data
WHERE Order_Date = (
    SELECT MAX(Order_Date)
    FROM Sales_Data
);

-- END --