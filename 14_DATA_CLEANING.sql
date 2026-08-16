
-- DATA CLEANING PRACTICE
-- Table: customers

-- 1. Find NULL values.
-- Find rows containing NULL values in any important column.
SELECT *
FROM customers
WHERE customer_name IS NULL
   OR email IS NULL
   OR phone IS NULL
   OR city IS NULL
   OR sales IS NULL;

-- Find NULL values column by column
SELECT *
FROM customers
WHERE customer_name IS NULL;
SELECT *
FROM customers
WHERE email IS NULL;

SELECT *
FROM customers
WHERE phone IS NULL;

SELECT *
FROM customers
WHERE city IS NULL;

SELECT *
FROM customers
WHERE sales IS NULL;

-- 2. Replace NULL values.
-- Replace NULL customer names, emails, phones and cities
-- with appropriate default values.

SELECT
    customer_id,
    COALESCE(customer_name, 'Unknown') AS customer_name,
    COALESCE(email, 'No Email') AS email,
    COALESCE(phone, 'No Phone') AS phone,
    COALESCE(city, 'Unknown') AS city,
    COALESCE(sales, 0) AS sales
FROM customers;


-- Permanently replace NULL values

UPDATE customers
SET customer_name = 'Unknown'
WHERE customer_name IS NULL;

UPDATE customers
SET email = 'No Email'
WHERE email IS NULL;

UPDATE customers
SET phone = 'No Phone'
WHERE phone IS NULL;

UPDATE customers
SET city = 'Unknown'
WHERE city IS NULL;

UPDATE customers
SET sales = 0
WHERE sales IS NULL;


-- 3. Remove duplicate customers.
-- Find duplicate customers based on customer name and email.

SELECT
    customer_name,
    email,
    COUNT(*) AS Duplicate_Count
FROM customers
GROUP BY customer_name, email
HAVING COUNT(*) > 1;

-- Remove duplicate rows while keeping the lowest customer_id.
-- First create a backup table.

CREATE TABLE customers_backup AS
SELECT *
FROM customers;

-- Delete duplicate records.

DELETE c1
FROM customers c1
JOIN customers c2
    ON LOWER(TRIM(c1.customer_name)) =
       LOWER(TRIM(c2.customer_name))
   AND LOWER(TRIM(c1.email)) =
       LOWER(TRIM(c2.email))
   AND c1.customer_id > c2.customer_id;


-- 4. Trim spaces.
-- Remove unnecessary spaces from names, emails and cities.

SELECT
    customer_id,
    TRIM(customer_name) AS Clean_Name,
    TRIM(email) AS Clean_Email,
    TRIM(phone) AS Clean_Phone,
    TRIM(city) AS Clean_City,
    sales
FROM customers;


-- Permanently remove spaces.

UPDATE customers
SET customer_name = TRIM(customer_name),
    email = TRIM(email),
    phone = TRIM(phone),
    city = TRIM(city);


-- 5. Standardize city names.
-- Convert cities into a consistent format.

SELECT
    customer_id,
    customer_name,
    city,
    CASE
        WHEN LOWER(TRIM(city)) = 'delhi' THEN 'Delhi'
        WHEN LOWER(TRIM(city)) = 'mumbai' THEN 'Mumbai'
        WHEN LOWER(TRIM(city)) = 'chennai' THEN 'Chennai'
        WHEN LOWER(TRIM(city)) = 'bangalore' THEN 'Bangalore'
        WHEN LOWER(TRIM(city)) = 'hyderabad' THEN 'Hyderabad'
        WHEN LOWER(TRIM(city)) = 'pune' THEN 'Pune'
        WHEN LOWER(TRIM(city)) = 'kolkata' THEN 'Kolkata'
        WHEN LOWER(TRIM(city)) = 'jaipur' THEN 'Jaipur'
        ELSE 'Unknown'
    END AS Standardized_City
FROM customers;


-- Permanently standardize cities.

UPDATE customers
SET city =
    CASE
        WHEN LOWER(TRIM(city)) = 'delhi' THEN 'Delhi'
        WHEN LOWER(TRIM(city)) = 'mumbai' THEN 'Mumbai'
        WHEN LOWER(TRIM(city)) = 'chennai' THEN 'Chennai'
        WHEN LOWER(TRIM(city)) = 'bangalore' THEN 'Bangalore'
        WHEN LOWER(TRIM(city)) = 'hyderabad' THEN 'Hyderabad'
        WHEN LOWER(TRIM(city)) = 'pune' THEN 'Pune'
        WHEN LOWER(TRIM(city)) = 'kolkata' THEN 'Kolkata'
        WHEN LOWER(TRIM(city)) = 'jaipur' THEN 'Jaipur'
        ELSE 'Unknown'
    END;

-- 6. Convert names to proper case.
-- use CONCAT + UPPER + LOWER.

SELECT
    customer_id,
    customer_name,
    CONCAT(
        UPPER(LEFT(LOWER(TRIM(customer_name)), 1)),
        LOWER(SUBSTRING(TRIM(customer_name), 2))
    ) AS Proper_Name
FROM customers;


-- For two-word names such as "SNEHA VERMA",
-- convert both words to proper case.

SELECT
    customer_id,
    customer_name,
    CONCAT(
        UPPER(LEFT(SUBSTRING_INDEX(LOWER(TRIM(customer_name)), ' ', 1), 1)),
        LOWER(SUBSTRING(
            SUBSTRING_INDEX(LOWER(TRIM(customer_name)), ' ', 1),
            2
        )),
        ' ',
        UPPER(LEFT(SUBSTRING_INDEX(LOWER(TRIM(customer_name)), ' ', -1), 1)),
        LOWER(SUBSTRING(
            SUBSTRING_INDEX(LOWER(TRIM(customer_name)), ' ', -1),
            2
        ))
    ) AS Proper_Name
FROM customers
WHERE customer_name IS NOT NULL;


-- 7. Remove blank rows.
-- Find rows where important text columns contain only spaces
-- or are blank.

SELECT *
FROM customers
WHERE customer_name IS NULL
   OR TRIM(customer_name) = ''
   OR email IS NULL
   OR TRIM(email) = ''
   OR phone IS NULL
   OR TRIM(phone) = ''
   OR city IS NULL
   OR TRIM(city) = '';

-- Delete completely blank customer records.
-- Keep rows that contain at least some useful information.

DELETE FROM customers
WHERE (customer_name IS NULL OR TRIM(customer_name) = '')
  AND (email IS NULL OR TRIM(email) = '')
  AND (phone IS NULL OR TRIM(phone) = '')
  AND (city IS NULL OR TRIM(city) = '')
  AND sales IS NULL;

-- 8. Find invalid emails.
-- Find emails that do not follow a basic email pattern.

SELECT
    customer_id,
    customer_name,
    email
FROM customers
WHERE email IS NOT NULL
  AND TRIM(email) <> ''
  AND email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';


-- Another useful check:
-- Find emails that don't contain @ or a dot.

SELECT
    customer_id,
    customer_name,
    email
FROM customers
WHERE email IS NOT NULL
  AND (
      email NOT LIKE '%@%'
      OR email NOT LIKE '%.%'
  );

-- 9. Find negative sales.
-- Find records where sales are negative.

SELECT
    customer_id,
    customer_name,
    sales
FROM customers
WHERE sales < 0;

-- Count negative sales records.

SELECT
    COUNT(*) AS Negative_Sales_Count
FROM customers
WHERE sales < 0;

-- Replace negative sales with 0 if the business rule
-- says negative sales are invalid.

UPDATE customers
SET sales = 0
WHERE sales < 0;


-- 10. Find duplicate phone numbers.
-- Find phone numbers used by more than one customer.

SELECT
    phone,
    COUNT(*) AS Duplicate_Count
FROM customers
WHERE phone IS NOT NULL
  AND TRIM(phone) <> ''
GROUP BY phone
HAVING COUNT(*) > 1;

-- Display all customers having duplicate phone numbers.

SELECT *
FROM customers
WHERE phone IN (
    SELECT phone
    FROM customers
    WHERE phone IS NOT NULL
      AND TRIM(phone) <> ''
    GROUP BY phone
    HAVING COUNT(*) > 1
)
ORDER BY phone;