/*********************************
        SELECT - WHERE -> Filtering
**********************************/
USE sys;
drop table if exists students; -- It deletes if table exists
CREATE TABLE students(
id INT, name VARCHAR(45),
address VARCHAR(100),
exam_score INT
);

INSERT INTO students VALUES(101,'Charles','New York',99);
INSERT INTO students VALUES(102,'Marcus','Los Angeles',88);
INSERT INTO students VALUES(103,'Nora','Chicago',77);
INSERT INTO students VALUES(104,'Adam','Houston',43);
INSERT INTO students VALUES(105,'Matthew','Miami',38);
INSERT INTO students VALUES(107,'Harper','Denver',10);
INSERT INTO students VALUES(107,'Aiden','Seattle',61);
SELECT * FROM students;

-- Task01 -> Create a query to list the information of students with exam score greater than 80.
Select * from students where exam_score > 80;

-- Task02 -> Create a query to list the names and addresses of students whose address is New York.
Select name,address from students where address =  'New York';

-- Task03 -> Create a query to list all information of students with id 104.
Select * from students where id =  104;


/*********************************
              SELECT - BETWEEN
**********************************/
Drop table if exists employees;
CREATE TABLE employees
(
id CHAR(4),
name VARCHAR(50),
salary INT
);


INSERT INTO employees VALUES('1001', 'Henry Ford', 70000);
INSERT INTO employees VALUES('1002', 'Thomas Edison', 85000);
INSERT INTO employees VALUES('1003', 'Nikola Tesla', 65000);
INSERT INTO employees VALUES('1004', 'Steve Jobs', 95000);
INSERT INTO employees VALUES('1005', 'Elon Musk', 80000);
INSERT INTO employees VALUES('1006', 'Marie Curie', 100000);
INSERT INTO employees VALUES('1006', 'Jane Goodall', 333000);
INSERT INTO employees VALUES('1006', 'Ada Lovelace', 222000);
SELECT * FROM employees;

-- Task04 -> Create a query to list the information of employees with ids between 1002 and 1005.
select * from employees where id>'1001' and id < '1006'; 
select * from employees where id between '1002' and '1005';
-- Task05 -> Create a query to list the information of employees between Thomas Edison and Elon Musk.
select * from employees where name between 'Elon Musk' and 'Thomas Edison';
-- Task06 -> Create a query to list employees whose salary is 70000 or whose name is Ada Lovelace.
SELECT * FROM employees WHERE salary = 70000 OR name='Ada Lovelace'; 
/*********************************
                       IN
**********************************/
-- Task07 -> Create a query to list the information of employees with ids 1001, 1002, and 1004.
SELECT * FROM employees WHERE id IN (1001,1002,1004);
-- Task08 -> Create a query to list employees whose salary is only 70000 or 100000.
SELECT * FROM employees WHERE salary IN(70000,100000);

/*********************************
              SELECT - LIKE
**********************************/
-- Task09 -> Create a query to list employees whose names start with the letter J.
SELECT * FROM employees WHERE name like 'J%';

-- Task09.5 -> Create a query to list employees with names that are 12 characters long and start with the letter N.
SELECT * FROM employees WHERE name like 'N___________';

-- Task10 -> Create a query to list employees whose names end with the letter E.
SELECT * FROM employees WHERE name like '%E';

-- Task11 -> Create a query to list employees whose names have the letter A as the second character.
SELECT * FROM employees WHERE name like '_A%';

-- Task12 -> Create a query to list employees whose names have the letter A as the second character and C as other characters.
SELECT * FROM employees WHERE name like '_A%C%';

-- Task13 -> Create a query to list employees whose names do not contain the letter A.
SELECT * FROM employees WHERE name not like '%A%';

-- Task14 -> Create a query to list employees whose salary has 6 digits.
SELECT * FROM employees WHERE salary like '______';

-- Task15 -> Create a query to list employees whose names have the letter J as the first character and O as the seventh character.
SELECT * FROM employees WHERE name like 'J_____O%';
