/*============================= DISTINCT =====================================
    The DISTINCT command is used in a QUERY statement to filter out similar records.
    Therefore, it enables querying records containing unique data for the selected columns.
    SYNTAX
    -------
    SELECT DISTINCT column_name1, column_name2, column_name3
    FROM  table_name;
==============================================================================*/
      use sample;
      
      drop table fruitSales ;
      
    CREATE TABLE fruitSales 
    (
        person_name varchar(50), 
        product_name varchar(50), 
        product_quantity int 
    );
    
    INSERT INTO fruitSales VALUES( 'John', 'Apple', 5);
    INSERT INTO fruitSales VALUES( 'Jane', 'Pear', 3);
    INSERT INTO fruitSales VALUES( 'David', 'Apple', 2);
    INSERT INTO fruitSales VALUES( 'Robert', 'Grape', 4);
    INSERT INTO fruitSales VALUES( 'John', 'Pear', 2);
    INSERT INTO fruitSales VALUES( 'Mary', 'Apple', 3);
    INSERT INTO fruitSales VALUES( 'John', 'Grape', 4);
    INSERT INTO fruitSales VALUES( 'David', 'Pear', 2);
    INSERT INTO fruitSales VALUES( 'David', 'Apple', 3);
    INSERT INTO fruitSales VALUES( 'Robert', 'Grape', 4);
    INSERT INTO fruitSales VALUES( 'Mike', null, 2);
    select * from fruitSales;


/* ----------------------------------------------------------------------------
task01-> Query to create how many different types of fruits are sold...
-----------------------------------------------------------------------------*/     

SELECT COUNT(DISTINCT product_name) AS number_of_fruits
FROM fruitSales;

    
    
/* -----------------------------------------------------------------------------
    -- task02-> Query to list different products sold by different persons...
------------------------------------------------------------------------------*/


-- -- SELECT DISTINCT person_name, product_name
--  -- FROM fruitSales;

SELECT DISTINCT person_name, product_name
FROM fruitSales
WHERE person_name IN (
    SELECT DISTINCT person_name
    FROM fruitSales
);


    -- task02.5 ->   Query to list different persons selling different products...

SELECT person_name, product_name
FROM fruitSales
GROUP BY person_name, product_name
HAVING COUNT(DISTINCT product_name);


/* ----------------------------------------------------------------------------
  task03->  Query to create the sum of unique quantities of sold fruits...
-----------------------------------------------------------------------------*/ 


SELECT SUM(product_quantity) AS total_unique_quantity
FROM (SELECT DISTINCT product_name, product_quantity 
FROM fruitSales) AS unique_sales;




 