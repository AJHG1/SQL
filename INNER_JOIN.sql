/*============================== JOIN OPERATIONS ===============================
    
    Set operators (Union, Union All, {Oracle->Intersect, Minus}) are used to merge columns from different tables.
    
    Join operations, on the other hand, are used to merge different tables. In other 
    words, selected columns from different tables can be used to create a new table.
    
    JOIN operations are crucial for Relational Databases. Because 
    JOIN operations can be used to fetch columns from tables related with Foreign Keys.
    
    In MySQL, there are 3 types of Join operations that can be used.
    
    1) INNER JOIN:  Displays the intersection of records in both tables
    2) LEFT JOIN:  Displays all records from the left table
    3) RIGHT JOIN:  Displays all records from the right table
       full JOIN=(left join + union  + right join) Displays all records from the table
==============================================================================*/   
/*"Left" and "right" terms are used in SQL join operations to indicate which table is going to be 
the main table and which one will be the related table. Left and right joins refer to which table is 
the primary table (left table) and which one is the secondary table (right table) during the join operation.

Left Join:
Left join considers the left table (first table) as the primary table and the right table (second table) as the related table.
In a left join, you get all the records from the left table, and for each of those records, you get the corresponding
 records from the right table if they match. If there's no match, null values are displayed for the columns from the right table.
 
Right Join:
Right join considers the right table (first table) as the primary table and the left table (second table) as the related table.
In a right join, you get all the records from the right table, and for each of those records, you get the corresponding records 
from the left table if they match. If there's no match, null values are displayed for the columns from the left table.
The choice between left and right joins depends on your data model and business requirements. Typically, left joins are more 
commonly used because most of the time there is a primary table considered as the primary data source, and related tables are 
considered as secondary tables. However, in some cases, right joins may be needed, especially when you have a secondary table 
considered as the primary one and other primary tables associated with it. The choice of join depends on your data relationships 
and result requirements.
*/

use sample;

  CREATE TABLE company 
    (
        company_id int, 
        company_name VARCHAR(20)
    );
    
    INSERT INTO company VALUES(100, 'Toyota');
    INSERT INTO company VALUES(101, 'Honda');
    INSERT INTO company VALUES(102, 'Ford');
    INSERT INTO company VALUES(103, 'Hyundai');
  select * from company;
  
    CREATE TABLE orders
    (
        order_id int,
        company_id int, 
        order_date DATE
    );
    drop table orders;
    
    INSERT INTO orders VALUES(11, 101, '2020-04-17');
    INSERT INTO orders VALUES(22, 102, '2020-04-18');
    INSERT INTO orders VALUES(33, 103, '2020-04-19');
    INSERT INTO orders VALUES(44, 104, '2020-04-20');
    INSERT INTO orders VALUES(55, 105, '2020-04-21');
    select * from orders;

    /*=============================== INNER JOIN  ==================================
    
    Used to create a new table with the intersection of two tables.
    
    Syntax
    -----------
    SELECT column1,column2....columnN
    FROM table1 
    INNER JOIN table2
    ON table1.column = table2.column;
================================================================================  
    
  
/* -----------------------------------------------------------------------------
  task01-> Create a query to list the company_name, order_id, and 
  order_dates for those with the same company_id in both tables...
------------------------------------------------------------------------------*/

select company_name , order_id , order_date
from compnay
inner join orders 
on orders.compnay_id = campany.compnay_id ;

    -- INNER JOIN selects only the rows that are common to both tables.
    -- In other words, it lists the relevant columns for the common company_id values in both tables.
    
    -- The INNER keyword is optional.
    
        
/*=============================== LEFT JOIN  ==================================
    
    LEFT JOIN retrieves all rows from the first table (left table) for the selected columns.
    However, it only retrieves the rows from the other table (right table) that satisfy the ON condition. 
        
    Syntax
    -----------
    SELECT column1,column2....columnN
    FROM table1 
    LEFT JOIN table2
    ON table1.column = table2.column;
==============================================================================*/  
            
/* -----------------------------------------------------------------------------
  task02-> List all companies from the company table along with their 
  order_id and order_dates...
------------------------------------------------------------------------------*/   

SELECT company_name, order_id, order_date
from company 
left join orders  
on company.company_id= orders.company_id;





-- In Left Join, all rows from the first table (after FROM) are displayed.
    -- Only the common rows from the second table that meet the condition from the ON clause are shown, with non-matching parts left blank
          
/*=============================== RIGHT JOIN  ==================================
    
    RIGHT JOIN retrieves all rows from the second table (right table) for the selected columns.
    However, it only retrieves the rows from the other table (left table) that satisfy the ON condition. 
        
    Syntax
    -----------
    SELECT column1,column2....columnN
    FROM table1 
    RIGHT JOIN table2
    ON table1.column = table2.column;
==============================================================================*/   
      
/* -----------------------------------------------------------------------------
  task03-> List all order_ids and order_dates from the order table along with 
  their corresponding company_names...
------------------------------------------------------------------------------*/   


-- In Right Join, all rows from the second table are displayed.
    -- Only the common rows from both tables are shown, with non-matching parts left blank.
    
    
    /*=============================== full JOIN  ==================================
    full JOIN: (left join + union  + right join)
   full  JOIN, Used to retrieve all rows for the selected columns from both tables.
    
    Syntax
    -----------
    SELECT column1,column2....columnN
    FROM table1 
    left JOIN table2
    ON table1.column = table2.column
    union all
    SELECT column1,column2....columnN
    FROM table1 
    right JOIN table2
    ON table1.column = table2.column
==============================================================================*/   
   

--   task04-> List the company_names, order_ids, and order_dates from the company 
--   and order tables...




	CREATE TABLE department (
      department_id   int PRIMARY KEY,
      department_name VARCHAR(14),
      location      VARCHAR(13)
    );
    
    INSERT INTO department VALUES (10,'ACCOUNTING','IST');
    INSERT INTO department VALUES (20,'MANAGEMENT','ANKARA');
    INSERT INTO department VALUES (30,'SALES','IZMIR');
    INSERT INTO department VALUES (40,'OPERATIONS','BURSA');
    INSERT INTO department VALUES (50,'WAREHOUSE', 'YOZGAT');
    select *  from department;
 
    CREATE TABLE personnel (
      personnel_id   int PRIMARY KEY,
      personnel_name VARCHAR(10),
      profession        VARCHAR(9),
      manager_id      int,
      salary          int,
      department_id      int
    );
    
   SELECT * FROM personnel;
  
    INSERT INTO personnel VALUES (7369,'AHMET','CLERK',1111,800,20);
    INSERT INTO personnel VALUES (7499,'BAHATTIN','SALESMAN',1222,1600,30);
    INSERT INTO personnel VALUES (7521,'NESE','SALESMAN',1222,1250,30);
    INSERT INTO personnel VALUES (1111,'MUZAFFER','MANAGER',7839,2975,20);
    INSERT INTO personnel VALUES (7654,'MUHAMMET','SALESMAN',1222,1250,30);
    INSERT INTO personnel VALUES (1222,'EMINE','MANAGER',7839,2850,30);
    INSERT INTO personnel VALUES (1333,'HARUN','MANAGER',7839, 2450,10);
    INSERT INTO personnel VALUES (7788,'MESUT','ANALYST',1111,3000,20);
    INSERT INTO personnel VALUES (7839,'SEHER','PRESIDENT',NULL,5000,10);
    INSERT INTO personnel VALUES (7844,'DUYGU','SALESMAN',1222,1500,30);
    INSERT INTO personnel VALUES (7876,'ALI','CLERK',1111,1100,20);
    INSERT INTO personnel VALUES (7900,'MERVE','CLERK',1222,950,30);
    INSERT INTO personnel VALUES (7902,'NAZLI','ANALYST',1111,3000,20);
    INSERT INTO personnel VALUES (7934,'EBRU','CLERK',1333,1300,10);
    INSERT INTO personnel VALUES (7956,'SIBEL','ARCHITECT',1333,3300,60);
    INSERT INTO personnel VALUES (7933,'ZEKI','ENGINEER',1333,4300,60);

/* -----------------------------------------------------------------------------
  task05-> List the names of personnel and their departments from the 
  SALES and ACCOUNTING departments, ordered by department then name...
------------------------------------------------------------------------------*/ 



-- Binding is done with the on keyword in joins


/* -----------------------------------------------------------------------------
  task06-> List the names of personnel and their departments from the SALES, 
  OPERATIONS, and WAREHOUSE departments, ordered by name...
  NOTE: Display the department name even if there are no employees.
------------------------------------------------------------------------------*/  


/* -----------------------------------------------------------------------------
  task07-> List the names of personnel, their departments, and salaries for all 
  employees, ordered by department in descending order and salary...
  NOTE: Display the department name even if there are no employees.
------------------------------------------------------------------------------*/  
-- left join


-- right join



/* -----------------------------------------------------------------------------
  task08-> List the names, departments, and salaries of personnel working in 
  the SALES and MANAGEMENT departments with salaries greater than 2000, 
  ordered by department and name...
------------------------------------------------------------------------------*/   




/* -----------------------------------------------------------------------------
  Task9-> List the departments, names, salaries, and additionally the names 
  of managers for personnel whose manager is either Harun or Emine...
  (display the name of the manager on whose row Emine is a manager)
------------------------------------------------------------------------------*/   