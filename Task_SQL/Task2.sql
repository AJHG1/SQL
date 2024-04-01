create database work;
use work;

-- UPDATE

CREATE TABLE workers
(
id int, 
firstname VARCHAR(50), 
city VARCHAR(50), 
salary int, 
workplace VARCHAR(20)
);

INSERT INTO workers VALUES(123456789, 'Harry Belafonte', 'Italy', 50000, 'IBM');
INSERT INTO workers VALUES(234567890, 'Elizabeth Bennet', 'Italy', 25000, 'Google');
INSERT INTO workers VALUES(345678901, 'Harry Bosch', 'Amsterdam', 13000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Hardwick Benay', 'Istanbul', 10000, 'Microsoft');
INSERT INTO workers VALUES(567890123, 'Hardwick Benay', 'Longbourn', 17000, 'Amazon');
INSERT INTO workers VALUES(456789012, 'Elizabeth Bennet', 'Longbourn', 15000, 'Microsoft');
INSERT INTO workers VALUES(123456710, 'Haamad Medjedovic', 'Saudi Arabia', 25000, 'IBM');

CREATE TABLE brands
(
brand_id int, 
brand_name VARCHAR(20), 
worker_count int
);
    
INSERT INTO brands VALUES(100, 'IBM', 12000);
INSERT INTO brands VALUES(101, 'Microsoft', 18000);
INSERT INTO brands VALUES(102, 'Amazon', 10000);
INSERT INTO brands VALUES(103, 'Google', 21000);


-- Task 1-> update all brand_name in the brands table to 'Amazon'.

update brands 
set brand_name  = 'Amazon';

select * from brands;
select * from workers;
-- Task 2-> update the city names of those whose workplace is 'Microsoft' in the workers table to 'Albania'.

update workers
set  City = 'Albania'
where workplace = 'Microsoft';

-- Task 3-> increase the id of id values in the workers table by 1.

update workers 
set id = id + 1;

select * from workers;
-- Task 4-> update all firstname in the workers table to Hillary

update workers 
set firstname = 'Hillary';

-- Task 5-> Update the salary of the worker with id 234567891 to 60000

update workers
set salary = 60000
where id = '234567891';

-- Task 6-> Change the workplace of the worker with id 567890124 to 'Google'

update workers
set workplace = 'Google'
where id = 567890124;


-- Task 7-> Correct the duplicated id in the records by updating the id of the second record with id 456789013


update workers
set  id = 456789055
where salary = 10000; 

select * from workers; 


