-- *****************************LIMIT**********************************
use sample;
drop table people;
CREATE TABLE people 
(   
    id int PRIMARY KEY,
    ssn CHAR(9) ,
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    salary int,
    address VARCHAR(50) 
);

INSERT INTO people VALUES(1,123456789, 'John','Doe', 50000,'New York');
INSERT INTO people VALUES(2,234567890, 'Jane','Smith', 40000,'Los Angeles');
INSERT INTO people VALUES(3,345678901, 'James','Brown',33000,'Chicago');
INSERT INTO people VALUES(4,256789012, 'Robert','Johnson',21000,'Houston');
INSERT INTO people VALUES (5,344678901, 'Emily','Jones', 15000,'Chicago');
INSERT INTO people VALUES (6,345458901, 'Chris','Lee',7000,'Los Angeles');
INSERT INTO people VALUES(7,123456711, 'Mary','Clark', 23000,'Houston');
INSERT INTO people VALUES(8,234567812, 'Michael','Taylor',42000,'Boston');
INSERT INTO people VALUES(9,345678913, 'Emma','Turner',38000,'San Francisco');
INSERT INTO people VALUES(10,256789231, 'David','Smith',20000,'Seattle');
INSERT INTO people VALUES (11,344678134, 'Laura','Martinez', 17000,'Dallas');
INSERT INTO people VALUES (12,345458752, 'Daniel','Lopez',18000,'Miami');

/* ----------------------------------------------------------------------------
  task01-> Query to list the first 10 records from 'people' table...
-----------------------------------------------------------------------------*/

select * 
from people
limit 10;

/* ----------------------------------------------------------------------------
  task02-> Query to list the records starting from the 10th record (excluding) onward (11th and 12th)...
-----------------------------------------------------------------------------*/
-- Method 1
SELECT * 
FROM people 
LIMIT 10,2; -- Start from the 11th record (index 10), fetch 2 records

-- Method 2

select *
from people
where id > 10
limit 2;

/* ----------------------------------------------------------------------------
  task03-> Query to list the information of the top 3 earners...
-----------------------------------------------------------------------------*/

select  *
from people
order by salary desc
limit 3 ;

/* ----------------------------------------------------------------------------
  task04-> Query to list the information of the lowest 5 earners...
-----------------------------------------------------------------------------*/

select * 
from people
order by salary asc
limit 5 ;

/* ----------------------------------------------------------------------------
  task05-> Query to list the information of people ranked 4th, 5th, and 6th based on salary...
-----------------------------------------------------------------------------*/  

select * 
from people
-- order by salary 
limit 3 , 3;