
-- TOPIC: INNER JOIN

--  Display Each Order Along with the Customer Name
SELECT
    s.Order_ID,
    s.Customer_ID,
    c.Customer_Name,
    s.Product,
    s.Quantity,
    s.Order_Date
FROM Sales_Data AS s
INNER JOIN Customer_Data AS c
    ON s.Customer_ID = c.Customer_ID;

-- Display Customer Name, Product and Quantity Purchased
-- Display the customer name from Customer_Data and the
-- product and quantity from Sales_Data.
SELECT
    c.Customer_Name,
    s.Product,
    s.Quantity
FROM Customer_Data AS c
INNER JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

--  Display Customer City Along with Products Purchased
-- Display the customer's city and the products they purchased.
SELECT
    c.Customer_Name,
    c.City,
    s.Product
FROM Customer_Data AS c
INNER JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

--  Display Customer Email and Payment Mode for Every Order
-- Display customer email from Customer_Data and payment mode
-- from Sales_Data.
SELECT
    s.Order_ID,
    c.Customer_Name,
    c.Email,
    s.Payment_Mode
FROM Customer_Data AS c
INNER JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

--  Display Customer Registration Date and Order Date
-- Display the customer's registration date together with
-- the date of their order.
SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.Registration_Date,
    s.Order_ID,
    s.Order_Date
FROM Customer_Data AS c
INNER JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;
    
    -- TOPIC: LEFT JOIN

--  Display All Customers Whether They Placed an Order or Not
-- Show every customer, including customers who have never placed
-- an order.
SELECT
    c.Customer_ID,
    c.Customer_Name,
    s.Order_ID,
    s.Product,
    s.Order_Date
FROM Customer_Data AS c
LEFT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

--  Display Customers Without Any Orders
-- Find customers who have no matching orders.
SELECT
    c.Customer_ID,
    c.Customer_Name
FROM Customer_Data AS c
LEFT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID
WHERE s.Order_ID IS NULL;

--  Display Customer Names and Products
-- Show all customers and their purchased products.
-- NULL will appear for customers without purchases.
SELECT
    c.Customer_Name,
    s.Product
FROM Customer_Data AS c
LEFT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

--  Display All Customer Emails with Purchased Products
-- Show every customer's email along with purchased products.
-- Customers without purchases will have NULL as the product.
SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.Email,
    s.Product
FROM Customer_Data AS c
LEFT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

--  Display Registration Date and Order Date
-- Show every customer's registration date and their order date.
-- NULL will appear when a customer has no order.
SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.Registration_Date,
    s.Order_ID,
    s.Order_Date
FROM Customer_Data AS c
LEFT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

--  Display All Cities and Products Purchased by Customers
-- Show every customer's city and any products they purchased.
-- Customers without purchases will have NULL as the product.
SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.City,
    s.Product
FROM Customer_Data AS c
LEFT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

--  Display Customers and Payment Modes
-- Show all customers and their payment modes, including
-- customers who have not made any purchases.
SELECT
    c.Customer_ID,
    c.Customer_Name,
    s.Order_ID,
    s.Payment_Mode
FROM Customer_Data AS c
LEFT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;
    
   
-- TOPIC: RIGHT JOIN

--  Display All Orders with Customer Names
-- Show every order and the corresponding customer name.
-- Sales_Data is kept as the right-side table.
SELECT
    s.Order_ID,
    s.Customer_ID,
    c.Customer_Name,
    s.Product,
    s.Quantity,
    s.Order_Date
FROM Customer_Data AS c
RIGHT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

-- Display All Products with Corresponding Customer Details
-- Show every product/order along with the available customer details.
SELECT
    s.Product,
    s.Order_ID,
    c.Customer_ID,
    c.Customer_Name,
    c.Email,
    c.City
FROM Customer_Data AS c
RIGHT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

-- Display All Payment Modes with Customer Names
-- Show every payment mode along with the corresponding customer name.
SELECT
    s.Payment_Mode,
    s.Order_ID,
    c.Customer_Name
FROM Customer_Data AS c
RIGHT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

-- Display All Orders Even If Customer Information Is Missing
-- Keep every order even when no matching customer record exists.
SELECT
    s.Order_ID,
    s.Customer_ID,
    s.Product,
    s.Quantity,
    s.Order_Date,
    c.Customer_Name,
    c.Email
FROM Customer_Data AS c
RIGHT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

--  Display Every Order with Customer City
-- Show every order along with the customer's city.
-- If customer information is missing, City will be NULL.
SELECT
    s.Order_ID,
    s.Product,
    s.Quantity,
    s.Order_Date,
    c.Customer_Name,
    c.City
FROM Customer_Data AS c
RIGHT JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;
    
    
-- TOPIC: SELF JOIN

-- Find Employees Working in the Same Department
-- Find pairs of employees who work in the same department.
-- The Emp_ID condition prevents matching an employee with
-- themselves and avoids duplicate pairs.
SELECT
    e1.Emp_ID AS Employee_1_ID,
    e1.Name AS Employee_1,
    e2.Emp_ID AS Employee_2_ID,
    e2.Name AS Employee_2,
    e1.Department
FROM Employee_Data AS e1
INNER JOIN Employee_Data AS e2
    ON e1.Department = e2.Department
    AND e1.Emp_ID < e2.Emp_ID;

-- Find Employees Living in the Same City
-- Find pairs of employees who live in the same city.
SELECT
    e1.Emp_ID AS Employee_1_ID,
    e1.Name AS Employee_1,
    e2.Emp_ID AS Employee_2_ID,
    e2.Name AS Employee_2,
    e1.City
FROM Employee_Data AS e1
INNER JOIN Employee_Data AS e2
    ON e1.City = e2.City
    AND e1.Emp_ID < e2.Emp_ID;

--  Find Employees Having the Same Salary
-- Find pairs of employees who have the same salary.
SELECT
    e1.Emp_ID AS Employee_1_ID,
    e1.Name AS Employee_1,
    e2.Emp_ID AS Employee_2_ID,
    e2.Name AS Employee_2,
    e1.Salary
FROM Employee_Data AS e1
INNER JOIN Employee_Data AS e2
    ON e1.Salary = e2.Salary
    
-- Find Customers from the Same City
SELECT c1.Customer_ID AS Customer_1_ID,
    c1.Customer_Name AS Customer_1,
    c2.Customer_ID AS Customer_2_ID,
    c2.Customer_Name AS Customer_2,
    c1.City
FROM Customer_Data AS c1
INNER JOIN Customer_Data AS c2
    ON c1.City = c2.City
    AND c1.Customer_ID < c2.Customer_ID;

-- TOPIC: MULTI-JOIN

-- Display Customer Name, City and Product Purchased
SELECT
    c.Customer_Name,
    c.City,
    s.Product
FROM Customer_Data AS c
INNER JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID
INNER JOIN Employee_Data AS e
    ON c.City = e.City;

--  Display Employee Name, Customer Name and
-- Purchased Product from the Same City
SELECT
    e.Name AS Employee_Name,
    c.Customer_Name,
    s.Product,
    c.City
FROM Employee_Data AS e
INNER JOIN Customer_Data AS c
    ON e.City = c.City
INNER JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

--  Display Employee Department, Customer City
-- and Total Sales Amount
-- Calculate total sales amount as Quantity × Unit_Price.
-- Employee and customer are connected through City.
SELECT
    e.Department,
    c.City AS Customer_City,
    SUM(s.Quantity * s.Unit_Price) AS Total_Sales_Amount
FROM Employee_Data AS e
INNER JOIN Customer_Data AS c
    ON e.City = c.City
INNER JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID
GROUP BY
    e.Department,
    c.City;

-- Display Employee Name, Customer Name, Product,
-- Quantity and Payment Mode
SELECT
    e.Name AS Employee_Name,
    c.Customer_Name,
    s.Product,
    s.Quantity,
    s.Payment_Mode
FROM Employee_Data AS e
INNER JOIN Customer_Data AS c
    ON e.City = c.City
INNER JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID;

-- Display Employee City, Customer City, Product
-- and Total Order Value
-- Total Order Value = Quantity × Unit_Price.
SELECT
    e.City AS Employee_City,
    c.City AS Customer_City,
    s.Product,
    s.Quantity * s.Unit_Price AS Total_Order_Value
FROM Employee_Data AS e
INNER JOIN Customer_Data AS c
    ON e.City = c.City
INNER JOIN Sales_Data AS s
    ON c.Customer_ID = s.Customer_ID; 
    
    -- END --