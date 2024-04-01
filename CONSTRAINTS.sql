/*========================================================================================
    CONSTRAINTS
==========================================================================================
NOT NULL       - Ensures that a column does not contain NULL values, i.e., it cannot be empty.
UNIQUE         - Ensures that all values in a column are unique, i.e., they must be distinct.
PRIMARY KEY    - Ensures that a column does not contain NULL values and that the data in the column is unique. (Combines NOT NULL and UNIQUE constraints)
FOREIGN KEY    - Used to reference the Primary Key of another table, thereby establishing a relationship between tables. 
                 With foreign and primary keys, we can perform operations on rows with identical IDs without directly linking tables, allowing the same field values and avoiding a parent-child relationship.

==========================================================================================
*/

USE sample;


CREATE TABLE employees -- parent table
(
id CHAR(5) PRIMARY KEY, -- not null + unique
name VARCHAR(50) UNIQUE,
salary INT NOT NULL,
start_date DATE
);

select * from employees;

INSERT INTO employees VALUES('10002', 'John Smith', 12000, '2018-04-14');
INSERT INTO employees VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO employees VALUES('10010', null, 5000, '2018-04-14'); -- uniqe kay word can accept multiple null values 
INSERT INTO employees VALUES('10004', 'Jane Doe', 5000, '2018-04-14');
INSERT INTO employees VALUES('10005', 'Harry Bell', 5000, '2018-04-14');
INSERT INTO employees VALUES('10006', 'Hannah Bells', NULL, '2019-04-12'); -- not null constraint dose not assept nuul values 
INSERT INTO employees VALUES('10003', 'Mary Johnson', 5000, '2018-04-14');
INSERT INTO employees VALUES('10007', 'Mary Johnson', 5000, '2018-04-14'); -- unique dose not allow dublicates 
INSERT INTO employees VALUES('10009', 'Tom', 0, '2018-04-14');
INSERT INTO employees VALUES('10009', 'Tomey', '', '2018-04-14'); -- not  null int doesnt accept empty String  
INSERT INTO employees VALUES('', 'Oscar', 2000, '2018-04-14'); -- primary key string accept empty string 
INSERT INTO employees VALUES('', 'Oscar Can', 2000, '2018-04-14'); -- primary kay doesnt accept doubliates
INSERT INTO employees VALUES('10002', 'Alice Yilmaz', 12000, '2018-04-14'); 
INSERT INTO employees VALUES(null, 'Felicity', 12000, '2018-04-14'); -- primary kay doesnt accept null value 











