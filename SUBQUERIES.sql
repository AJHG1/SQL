--============================= SUBQUERIES ====================================
-- A subquery is a query nested within another query, also known as an inner query or nested query.
use sample;
drop table employees;
CREATE TABLE employees
(
id int,
name VARCHAR(50),
city VARCHAR(50),
salary int,
company VARCHAR(20)
);
INSERT INTO employees VALUES(123456789, 'John Smith', 'New York', 50000, 'TechCorp');
INSERT INTO employees VALUES(234567890, 'Emily Johnson', 'New York', 25000, 'SearchCo');
INSERT INTO employees VALUES(345678901, 'David Williams', 'San Francisco', 13000, 'TechCorp');
INSERT INTO employees VALUES(456789012, 'Michael Brown', 'Los Angeles', 10000, 'SoftInc');
INSERT INTO employees VALUES(567890123, 'Jessica Davis', 'San Francisco', 17000, 'EcommerceCo');
INSERT INTO employees VALUES(456789012, 'Emily Johnson', 'San Francisco', 15000, 'SoftInc');
INSERT INTO employees VALUES(123456710, 'Rachel Miller', 'Chicago', 25000, 'TechCorp');
CREATE TABLE brands
(
brand_id int,
brand_name VARCHAR(20),
employee_count int
);
INSERT INTO brands VALUES(100, 'TechCorp', 12000);
INSERT INTO brands VALUES(101, 'SoftInc', 18000);
INSERT INTO brands VALUES(102, 'EcommerceCo', 10000);
INSERT INTO brands VALUES(103, 'SearchCo', 21000);
SELECT * from employees;
SELECT * from brands;
-- task01-> Create a query to list the names, salaries, and workplaces of employees working at brands with more than 15,000 employees.
select name, salary, city from employees
where company in (select brand_name from brands where employee_count > 15000);
-- The above query is essentially a combination of the following 2 queries.
-- SELECT brand_name FROM brands WHERE employee_count > 15000;
-- SELECT name, salary, company FROM employees WHERE company IN ('SearchCo', 'SoftInc');

-- task02-> Create a query to list the names, salaries, and cities of employees working at brands with a brand_id greater than 101.
select name,salary, city from employees
where company in (select brand_name from brands where brand_id > 101);
-- The above query is essentially a combination of the following 2 queries.
-- 'EcommerceCo', 'SearchCo' --->  SELECT brand_name FROM brands WHERE brand_id > 101;
-- SELECT name, salary, city FROM employees WHERE company IN ('EcommerceCo', 'SearchCo');

-- task03-> Create a query to list the brand ids and employee counts of brands that have employees working in San Francisco.
select brand_id , employee_count from brands
where brand_name in (select company from employees where city = 'San Francisco');
-- The above query is essentially a combination of the following 2 queries.
-- 'TechCorp', 'EcommerceCo', 'SoftInc'. ----> SELECT company FROM employees WHERE city = 'San Francisco';
-- SELECT brand_id, employee_count FROM brands WHERE brand_name IN ('TechCorp', 'EcommerceCo', 'SoftInc');


/* ===================== AGGREGATE METHOD USAGE ===========================
    Aggregate methods (SUM, COUNT, MIN, MAX, AVG) can be used within subqueries.
    However, the query should return a single value.
    SYNTAX: It should be like sum(), there should be no space between sum and ().
==============================================================================*/

SELECT * from employees;
SELECT * from brands;
-- task04-> Create a query to list the name, employee count, and total salary of employees for each brand.
SELECT brand_name, employee_count, (SELECT sum(salary) FROM employees WHERE brand_name = company) as total_salary FROM brands;
-- To name the result returned from the subquery, we can append the desired name directly at the end of the query
-- or use 'as' keyword.
-- task05-> Create a query to list the brand_name, employee count, and average salary of employees for each brand.
SELECT brand_name, employee_count , (SELECT round(avg(salary)) FROM employees WHERE brand_name = company ) as average_salary FROM brands;
-- round() rounds the result to the nearest whole number.
-- round(avg(salary))
-- If we write round(avg(salary),2), it will round to 2 decimal places.
SELECT brand_name, employee_count, (SELECT round(avg(salary), 2) FROM employees WHERE brand_name = company ) as average_salary FROM brands;
-- task06-> Create a query to list the brand_name, employee count, and maximum and minimum salary of employees for each brand.
SELECT brand_name, employee_count, (SELECT max(salary) FROM employees WHERE brand_name = company) as max_salary  FROM brands;
SELECT brand_name, employee_count, (SELECT min(salary) FROM employees WHERE brand_name = company) as min_salary  FROM brands;
-- To list max and min salaries together.
SELECT brand_name, employee_count, (select max(salary) FROM employees WHERE brand_name = company) as max_salary,
(select min(salary) FROM employees WHERE brand_name = company) as min_salary
  FROM brands;
-- task07-> Create a query to list the id, name, and the total number of cities each brand is located in.
SELECT brand_id, brand_name, (SELECT count(city) FROM employees WHERE brand_name=company) as city_count FROM brands;
-- count(city) counts the cities.

-- task01-> Create a query to list the names, salaries, and workplaces of employees working at brands with more than 15,000 employees.















