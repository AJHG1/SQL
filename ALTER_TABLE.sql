/*=============================== ALTER TABLE =========================================
    
    ALTER TABLE is used for operations like ADD, CHANGE, MODIFY, or DROP/DELETE COLUMNS.
    The ALTER TABLE statement is also used for renaming tables (RENAME).
    The constraint check is used to limit the range of values that can be placed in a column.

===================================================================================*/

drop table employees;
CREATE TABLE employees
(
	id int PRIMARY KEY, 
	name VARCHAR(50), 
	city VARCHAR(50), 
	salary int, 
	company VARCHAR(20)
);


INSERT INTO employees VALUES(123456789, 'John Smith', 'New York', 50000, 'TechCorp');
INSERT INTO employees VALUES(234567890, 'Emily Johnson', 'New York', 25000, 'SearchCo');
INSERT INTO employees VALUES(345678901, 'David Williams', 'Ankara', 13000, 'TechCorp');
INSERT INTO employees VALUES(456789012, 'David Williams', 'Izmir', 10000, 'Microsoft');
INSERT INTO employees VALUES(567890123, 'David Williams', 'Ankara', 17000, 'Amazon');
INSERT INTO employees VALUES(456789013, 'Emily Johnson', 'Ankara', 15000, 'Microsoft');
INSERT INTO employees VALUES(123456710, 'Rachel Miller', 'Bursa', 25000, 'TechCorp');


    
select * from employees;
   
-- task01-> Add a new column called country_name to the employees table with a default value of 'KSA'.
Alter table employees
add column country_name varchar(25)default 'KSA';


-- task02-> Add new columns called gender Varchar(20) and age int to the employees table.
Alter table employees
add column (gender Varchar(20),age int);


-- task02.5-> Add a new column of data type int called age after the name column in the employees table.
Alter table employees
drop column age;
Alter table employees
add age int after name;
   
    /*
 alter table employee
modify column age after name
*/
-- task03-> Delete the company column from the employees table.
alter table employees
drop column company;
 
-- task04-> Rename the country_name column in the employees table to address.
alter table employees
rename column country_name to address;

-- task05-> Change the name of the employees table to workers.
alter table employees
rename to workers;

select * from workers;

-- task06-> Add a NOT NULL constraint to the address column in the workers table and change its data type to VARCHAR(30).
alter table workers
modify column address varchar(30) not null;

-- task07-> Add a constraint to the workers table that ensures the salary is greater than or equal to 10000.
alter table workers
add constraint check (salary>=10000);

INSERT INTO workers VALUES(123456719, 'Jane Doe', 'Paris', 2500);
INSERT INTO workers VALUES(123456519, null,23,'Paris', 25000,'SDA','Male');



