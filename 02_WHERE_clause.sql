--  Topic: WHERE clause 

-- Employee in IT. 
SELECT* FROM employee_data
WHERE Department='IT'; 

-- Employee in HR. 
SELECT* FROM employee_data
WHERE Department='HR'; 

-- Employee in finace. 
SELECT* FROM employee_data
WHERE Department='Finance'; 

-- Employee in sales department. 
SELECT* FROM employee_data
WHERE Department='Sales'; 

-- Salary greater than 50000. 
 SELECT* FROM employee_data
 WHERE Salary>'50000'; 
 
 -- Salary less than 40000. 
 SELECT* FROM employee_data
 WHERE Salary<'40000'; 
 
 -- salary greater than equal to 60000. 
 SELECT* FROM employee_data
 WHERE Salary>='60000'; 
 
 -- Salary less than equall to 35000 . 
 SELECT* FROM employee_data
 WHERE Salary<='35000'; 
 
 -- Salary between 40000 and 60000. 
 SELECT* FROM employee_data
 WHERE Salary BETWEEN 40000 AND 60000; 
 
 -- Age greater tham 30. 
 SELECT* FROM employee_data
 WHERE Age>'30'; 
 
 -- Age less than 25. 
 SELECT* FROM employee_data
 WHERE Age<'25'; 
 
 -- Age greater than equal to 35. 
 SELECT* FROM employee_data
 WHERE Age>='35'; 
 
 -- Age less than equal to  28.  
 SELECT* FROM employee_data
 WHERE Age<='28';
 
 -- City equal to mumbai. 
 SELECT* FROM employee_data
 WHERE City='mumbai'; 
 
 -- city equals to delhi. 
 SELECT* FROM employee_data
 WHERE City='delhi'; 
 
 -- City equal to banglore. 
 SELECT* FROM employee_data
 WHERE City='banglore'; 
 
 -- Department is it and salary is 50000. 
 SELECT* FROM employee_data
 WHERE Department='IT'AND Salary>'50000'; 
 
 -- Department is hr or finance. 
 SELECT* FROM employee_data
 WHERE Department='HR' OR 'Finance'; 
 
 -- Department not it. 
 SELECT* FROM employee_data
 WHERE Department  <> 'IT' ; 
 
 -- Employee name starts with 'A'. 
 SELECT* FROM employee_data
 WHERE name LIKE 'A%'; 
 
 -- Employee not in mumbai. 
 SELECT* FROM employee_data
 WHERE City <> 'mumbai';  
 
 -- Salary not in 30000,40000. 
 SELECT* FROM employee_data
 WHERE Salary BETWEEN 30000 AND 400000; 
 
 -- Departmenti in hr and it. 
 SELECT* FROM employee_data
 WHERE Department IN(IT,HR); 
 
 -- Employee name ends with  'N'. 
 SELECT* FROM employee_data
 WHERE name  LIKE'%N' 
 
 -- Employee name cotain 'ar'. 
 SELECT* FROM  employee_data
 WHERE name LIKE '%ar%;  
 
 -- 
