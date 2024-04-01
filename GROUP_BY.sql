/*============================= GROUP BY =====================================
    The GROUP BY command is used to summarize rows in a SELECT statement 
    based on the values of columns.
   
    The GROUP BY command returns one row for each group.
    
    GROUP BY is commonly used with aggregate functions such as AVG(), COUNT(), 
    MAX(), MIN(), and SUM().
==============================================================================*/ 
use sample ; 
CREATE TABLE fruitSales 
(
    person_name varchar(50), 
    product_name varchar(50), 
    product_quantity int 
);

INSERT INTO fruitSales VALUES( 'John', 'Apple', 5);
INSERT INTO fruitSales VALUES( 'Jane', 'Pear', 3);
INSERT INTO fruitSales VALUES( 'Alice', 'Apple', 2);
INSERT INTO fruitSales VALUES( 'Alice', 'Apple', 7);
INSERT INTO fruitSales VALUES( 'Alice', 'Apple', 13);
INSERT INTO fruitSales VALUES( 'Bob', 'Grape', 4);
INSERT INTO fruitSales VALUES( 'Bob', 'Grape', 5);
INSERT INTO fruitSales VALUES( 'Bob', 'Grape', 23);
INSERT INTO fruitSales VALUES( 'John', 'Pear', 2);
INSERT INTO fruitSales VALUES( 'Emily', 'Apple', 3);
INSERT INTO fruitSales VALUES( 'John', 'Grape', 4);
INSERT INTO fruitSales VALUES( 'Bob', 'Pear', 2);
INSERT INTO fruitSales VALUES( 'Bob', 'Apple', 3);
INSERT INTO fruitSales VALUES( 'Alice', 'Grape', 4);
INSERT INTO fruitSales VALUES( 'Mike', null, 2);

SELECT * FROM fruitSales;

/* -----------------------------------------------------------------------------
  task01-> Query to list the total quantity of fruits sold per person...
-----------------------------------------------------------------------------*/  

select person_name , sum(product_quantity) as total_number
from fruitSales
group by person_name ;

  

/* ----------------------------------------------------------------------------
  task02-> Query to list the number of people who bought each type of fruit (product_name)...
-----------------------------------------------------------------------------*/ 

select product_name ,count(distinct person_name) as number_names 
from fruitSales
group by product_name ; 


/* ----------------------------------------------------------------------------
  task03-> Query to list the minimum and maximum quantity of each fruit type (product_name), 
  ordered by the maximum quantity of the fruit...
-----------------------------------------------------------------------------*/ 

select product_name , min(product_quantity ) as min_quantity , max(product_quantity) as max_quantity
from fruitSales
where product_name is not null
group by product_name
order by max_quantity desc;

/* ----------------------------------------------------------------------------
  task04-> Query to group the total quantities of products sold by person and product name, 
  ordered by the name in descending order...
-----------------------------------------------------------------------------*/ 


SELECT person_name, product_name, SUM(quantity) AS total_quantity
FROM fruitSales
GROUP BY person_name, product_name
ORDER BY product_name DESC;


/* ----------------------------------------------------------------------------
 task05-> Query to find the total quantities of products sold per person and product name, 
 and list only the records where the total quantity is 3 or more, 
 ordered by the total product quantities in descending order...
-----------------------------------------------------------------------------*/  

SELECT person_name, product_name, SUM(product_quantity) AS total_quantity
FROM fruitSales
GROUP BY person_name, product_name
HAVING total_quantity >= 3
ORDER BY total_quantity DESC;


/* ----------------------------------------------------------------------------
  task06-> Query to list the maximum product quantities sold by product_name, 
  excluding the records where the maximum quantity is equal to the minimum quantity...
-----------------------------------------------------------------------------*/    

SELECT product_name, MAX(product_quantity) AS max_quantity
FROM fruitSales
GROUP BY product_name
HAVING MAX(product_quantity) = MIN(product_quantity);

