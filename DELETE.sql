/* ============================== DELETE ===================================  

DELETE FROM table_name;  Deletes all content of the table.
DELETE FROM table_name WHERE column_name = data; Deletes specific record(s) from the table.

=========================================================================*/
use sample;
delete from students; -- delete all records but not the table
select * from students;
drop table students;  -- deletes the table
select * from students;
select * from students;
CREATE TABLE students
(
id CHAR(3),
name VARCHAR(50),
parent_name VARCHAR(50),
test_score int       
);
INSERT INTO students VALUES(101, 'John Smith', 'Parent1',75);
INSERT INTO students VALUES(102, 'Jane Doe', 'Parent2',85);
INSERT INTO students VALUES(103, 'Alice Johnson', 'Parent3',85);
INSERT INTO students VALUES(104, 'Bob Williams', 'Parent4',95);
INSERT INTO students VALUES(105, 'Charlie Brown', 'Parent5',83);
INSERT INTO students VALUES(106, 'Emily Clark', 'Parent6',99);
INSERT INTO students VALUES(107, 'Michael Taylor', 'Parent7',91);

select * from students;

    
/* =============================================================================
         To delete selectively - using filters, WHERE keyword is used
===============================================================================*/     

-- task01-> Delete the record with id 102...

delete 
from students
 where id='102';

-- task02-> Delete the record with the name 'John Smith'...

delete
 from students
 where name='John Smith';

-- task03-> Delete records with the names 'Charlie Brown' and 'Bob Williams'...

delete 
from students 
where name in('Charlie Brown','Bob Williams');

-- task04-> Delete the record with the name 'Alice Johnson' and id 105...  

delete 
from students 
where name ='Alice Johnson' or id='105';

-- task05-> Delete records with an id greater than 103...
   
   delete 
   from students 
   where id >'103';

-- task06-> Delete records with ids 106, 107, or 104...
    
    delete 
    from students 
    where id in('106','107','104');

-- task07-> Delete all records in the table...
delete from students;