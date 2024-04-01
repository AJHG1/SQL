-- Create a table named 'cities'. 
-- The table should have 'area_code', 'name', and 'population' fields. 
-- The 'name' field should not allow empty values. Using the first method,
--  make the 'area_code' field a 'Primary Key.'

create table cities (
area_code int primary key,
name varchar(19) not null,
population int
);



-- Create a table named 'teachers'.
--  The table should have 'id', 'name', 'branch', and 'gender' fields.
--  The 'id' field should not accept duplicate values.
--  Using the second method,
--  make the combination of 'id' and 'name' fields a 'primary key.

 -- create table teachers(
 id int ,
 name varchar(17) ,
 branch varchar(11),
 gender varchar (5),
 primary key (name, id)
 );
--  
--  
--  
--  
--  
--  
--  -- Q3 Practice:
-- Create a table named 'suppliers.'
--  The table should have 'supplier_id,' 'supplier_name,' and 'contact_name' fields,
--  and make 'supplier_id' the Primary Key.
-- Create another table named 'products.' It should have 'supplier_id' and 'product_id' fields,
--  and make 'supplier_id' a Foreign Key.
--  
--  parent
 create table suppliers(
	supplier_id int primary key,
	supplier_name varchar(14),
	contact_name varchar(14),
 );
 
--  -- child
 create table products(
 supplier_id int  primary key,
 product_id int ,
 foreign key (supplier_id) references suppliers(suppliers_id) 
 );
 



-- Q4 Practice:
-- Create a table named 'suppliers' 
-- with columns 'supplier_id', 'supplier_name', and 'contact_name'. 
-- The primary key consists of the combination of 'supplier_id' and 'supplier_name

-- Create a table named 'products' 
-- with columns 'supplier_id' and 'product_id'. 
-- The foreign key is established by combining 'supplier_id' and 'product_id', referencing the primary key in the 'suppliers' table
use sys;
-- primary key 
create table suppliers(
suppliers_id int,
suppliers_name varchar(8),
contact_name varchar(19),
primary key (suppliers_id , suppliers_name)
);

-- foreign key
create table prodeucts(
supplier_id int,
product_id int,
foreign key (supplier_id, product_id) references suppliers(suppliers_id , suppliers_name)
);
drop table prodeucts;