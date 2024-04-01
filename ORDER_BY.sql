/*================================ ORDER BY  ===================================
   The ORDER BY clause is used in a SELECT statement to sort the result set by a specified column.
   
   Syntax
   -------
      ORDER BY column_name ASC   -- ASCENDING.  Natural Ordering Default
      ORDER BY column_name DESC  -- DESCENDING
==============================================================================*/  
use sample;     
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
INSERT INTO people VALUES(5,344678901, 'Emily','Jones', 15000,'Chicago');
INSERT INTO people VALUES(6,345458901, 'Chris','Lee',7000,'Los Angeles');
INSERT INTO people VALUES(7,123456711, 'Mary','Clark', 23000,'Houston');
INSERT INTO people VALUES(8,234567812, 'Michael','Taylor',42000,'Boston');
INSERT INTO people VALUES(9,345678913, 'Emma','Turner',38000,'San Francisco');
INSERT INTO people VALUES(10,256789231, 'David','Smith',20000,'Seattle');
INSERT INTO people VALUES (11,344678134, 'Laura','Martinez', 17000,'Dallas');
INSERT INTO people VALUES (12,345458752, 'Daniel','Lopez',18000,'Miami');    
select * from people;
/* ----------------------------------------------------------------------------
  task01-> Query to list the records in the 'people' table sorted by address...
 -----------------------------------------------------------------------------*/ 
 SELECT * 
 FROM people 
 ORDER BY address; -- default ASC small->big
    
/* ----------------------------------------------------------------------------
  task02-> Query to list the records in the 'people' table sorted by salary in descending order...
-----------------------------------------------------------------------------*/ 
select * 
from people
order by salary desc;
    
/* ----------------------------------------------------------------------------
  task03-> Query to list people with first name 'John' ordered by ssn in descending order...
-----------------------------------------------------------------------------*/

select * 
from people 
where first_name = 'john'
order by ssn desc;


/* ----------------------------------------------------------------------------
  task04-> Query to list people with address 'Chicago' ordered by salary...
-----------------------------------------------------------------------------*/   

select *
from people
where address = 'Chicago'
order by salary ;

