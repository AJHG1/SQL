/*==================== SET OPERATORS: UNION, UNION ALL======================
    
    SET operators like UNION, UNION ALL, (INTERSECT, and MINUS for Oracle SQL) can 
    be used to combine multiple queries.
    UNION: A SET operator that combines result sets of 2 or more query expressions 
    into a single result set.
   
    NOTE: The data type of the combined query expression must be compatible 
    with the data type of expressions in other queries.
    
    Syntax:
    ----------
    SELECT column_name, column_name2, .. FROM table_name1
    UNION
    SELECT column_name1, column_name2, .. FROM table_name2;
    
    NOTE: The UNION operator retrieves only unique values. To include duplicate 
    values, use UNION ALL.
==============================================================================*/ 
USE SAMPLE;
CREATE TABLE personnel 
    (
        id int  PRIMARY KEY, 
        name VARCHAR(50), 
        city VARCHAR(50), 
        salary int, 
        company VARCHAR(20)
        
    );
   
INSERT INTO personnel VALUES(123456789, 'John Doe', 'New York', 50000, 'IBM');
INSERT INTO personnel VALUES(234567890, 'Alice Brown', 'New York', 25000, 'Google');
INSERT INTO personnel VALUES(345678901, 'Harry Smith', 'Paris', 13000, 'IBM');
INSERT INTO personnel VALUES(456789012, 'Harry Smith', 'Tokyo', 34000, 'Microsoft');
INSERT INTO personnel VALUES(567890123, 'Harry Smith', 'Paris', 17000, 'Amazon');
INSERT INTO personnel VALUES(456789015, 'Alice Brown', 'Paris', 15000, 'Microsoft');
INSERT INTO personnel VALUES(123456710, 'Helen White', 'Sydney', 25000, 'IBM');
INSERT INTO personnel VALUES(123456733, 'John Doe', 'Tokyo', 35000, 'Google');

    
SELECT * FROM personnel;
    
/* -----------------------------------------------------------------------------
  task01-> Create a query to list employee names with salaries over 20000 
  and cities where salaries over 10000 are earned, sorted in descending order.
------------------------------------------------------------------------------*/

SELECT name as name_city , salary
from personnel
where salary > 20000

union

select city , salary
from personnel
where salary > 10000
order by salary desc;

/* -----------------------------------------------------------------------------
  task02-> Create a query to list salaries of people named Harry Smith and 
  salaries of personnel in Paris, sorted from high to low.
------------------------------------------------------------------------------*/  

SELECT name , salary
from personnel
where name =  'Harry Smith '

union 

select name, salary
from personnel
where city = 'Paris'
order by salary desc;

/* -----------------------------------------------------------------------------
  task03-> Create a query to list the names of personnel working at Google, IBM, 
  and Microsoft.
------------------------------------------------------------------------------*/  
select name 
from personnel
where company='Google'

union 

select name 
from personnel
where company='IBM'

union

select name 
from personnel
where company='Microsoft';


/* -----------------------------------------------------------------------------
  task04-> Create a query to list information of personnel earning less than 25000 
  and personnel not working at IBM.
------------------------------------------------------------------------------*/ 



/* -----------------------------------------------------------------------------
  task05-> Create a query to list names and cities of people named John Doe 
  and those not working in New York.
------------------------------------------------------------------------------*/



/*======================== MERGING FROM DIFFERENT TABLES (UNION) ====================*/   
    
CREATE TABLE personnel_info 
    (
        id int, 
        tel char(10) UNIQUE , 
        number_of_children int
      
    ); 
   
INSERT INTO personnel_info VALUES(123, '5302345678', 5);
INSERT INTO personnel_info VALUES(234, '5422345678', 4);
INSERT INTO personnel_info VALUES(345, '5354561245', 3); 
INSERT INTO personnel_info VALUES(478, '5411452659', 3);
INSERT INTO personnel_info VALUES(789, '5551253698', 2);
INSERT INTO personnel_info VALUES(344, '5524578574', 2);
INSERT INTO personnel_info VALUES(125, '5537488585', 1);
SELECT * from personnel_info;

/* -----------------------------------------------------------------------------
  task06-> Create a query to list the city and salary of the personnel with an id of 123456733 from the personnel table, 
  and the phone number and number of children from the personnel_info table for the personnel whose id starts with '123'.
------------------------------------------------------------------------------*/

select city as city_tel , salary as number_child 
from personnel 
where id = '123456733'

union 

select tel , number_of_childern
from personnel_info
where id like '123%';

/* -----------------------------------------------------------------------------
  task07-> Create a query to list the IDs of personnel working in New York or Paris from the personnel table, 
  and IDs of personnel from the personnel_info table who have 2 or 3 children.
------------------------------------------------------------------------------*/











