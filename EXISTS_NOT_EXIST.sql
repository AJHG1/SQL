/*=========================== EXISTS, NOT EXIST ================================
   The EXISTS and NOT EXISTS statements are used with subqueries to test whether a subquery 
   returns any row. EXISTS returns true if the subquery returns one or more rows.
   EXISTS is used to check for the existence of any record in a subquery.
   It is often used with correlated subqueries.
   If the subquery returns at least one row, EXISTS returns true; otherwise, it returns false.
   It's used for quick check operations in subqueries.

   SYNTAX:
   SELECT column_name  
   FROM table_name  
   WHERE [NOT] EXISTS (  
   SELECT column_name   
   FROM table_name   
   WHERE condition  
   ); 
==============================================================================*/
   use sample;
   drop table may;
    CREATE TABLE may
    (
        product_id int,
        customer_name varchar(50), 
        product_name varchar(50)
    );
    
    CREATE TABLE june 
    (
        product_id int ,
        customer_name varchar(50), 
        product_name varchar(50)
    );
    
  
    INSERT INTO may VALUES (10, 'John', 'Product1');
    INSERT INTO may VALUES (20, 'Emily', 'Product2');
    INSERT INTO may VALUES (30, 'Alex', 'Product3');
    INSERT INTO may VALUES (20, 'Emma', 'Product4');
    INSERT INTO may VALUES (10, 'Alice', 'Product5');
    INSERT INTO may VALUES (40, 'David', 'Product6');
    INSERT INTO may VALUES (20, 'Michael', 'Product7');
    
   
   INSERT INTO june VALUES (10, 'Ben', 'Product1');
    INSERT INTO june VALUES (10, 'Olivia', 'Product1');
    INSERT INTO june VALUES (20, 'Hannah', 'Product2');
    INSERT INTO june VALUES (50, 'Sophia', 'Product7');
    INSERT INTO june VALUES (20, 'William', 'Product2');
    
   /* -----------------------------------------------------------------------------
  task01-> Query to list the PRODUCT_ID of the products sold with the same PRODUCT_ID in May and June
  and also the CUSTOMER_NAME who bought these products in May.
 -----------------------------------------------------------------------------*/        
    
    -- 1st approach
    select * from may;
    select * from june;
    
    select product_id , customer_name 
    from may 
    where product_id in (select product_id 
    from june 
    where may.product_id = june.product_id);
    
    -- 2nd approach
    
    select product_id, customer_name 
    from may
    WHERE EXISTS (SELECT product_id 
    from june 
    WHERE may.product_id = june.product_id);
    
   /* -----------------------------------------------------------------------------
  task02-> Query to list the PRODUCT_NAME of the products sold in both months
  and the CUSTOMER_NAME who bought these products in June.
 -----------------------------------------------------------------------------*/ 
    select product_name, customer_name 
    from june 
    where exists (select product_name 
    from may  
    where june.product_name = may.product_name);
    
    
    
  /* -----------------------------------------------------------------------------
  task03-> Query to list the PRODUCT_NAME of the products not sold in both months
  and the CUSTOMER_NAME who bought these products in June.
 -----------------------------------------------------------------------------*/ 
    select product_name, customer_name 
    from may 
    where not exists (select product_name 
    from june   
    where MAY.product_name = june.product_name);
            

/* -----------------------------------------------------------------------------
  task04-> Query to list the PRODUCT_NAME of the products not sold in both months
  and the CUSTOMER_NAME who bought these products in May.
 -----------------------------------------------------------------------------*/ 
  select product_id, customer_name, product_name 
  from may  
where not exists (select product_name 
from june  
where may.product_id = june.product_id);