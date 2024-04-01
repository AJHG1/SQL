/*=====================================================================================
   ON DELETE CASCADE
=======================================================================================
   The ON DELETE CASCADE command is used to directly delete the parent record instead
   of deleting the child table records first.
   
   To achieve this, simply add ON DELETE CASCADE at the end of the foreign key 
   declaration.

=====================================================================================*/
use sample;
CREATE TABLE studentss
(
id CHAR(3) PRIMARY KEY,  
name VARCHAR(50),
parent_name VARCHAR(50),
exam_score INT
);

   
INSERT INTO studentss VALUES('101', 'John Doe', 'Parent1', 75);
INSERT INTO studentss VALUES('102', 'Jane Smith', 'Parent2', 85);
INSERT INTO studentss VALUES('103', 'Michael Johnson', 'Parent3', 85);
INSERT INTO studentss VALUES('104', 'Emma Wilson', 'Parent4', 95);
INSERT INTO studentss VALUES('105', 'David Brown', 'Parent5', 99);

SELECT * FROM studentss;

CREATE TABLE grades
( 
student_id CHAR(3),
course_name VARCHAR(30),
exam_score INT,
CONSTRAINT grades_fk FOREIGN KEY (student_id) REFERENCES studentss (id)
 ON DELETE CASCADE
);



INSERT INTO grades VALUES ('101', 'Chemistry', 75);
INSERT INTO grades VALUES ('102', 'Physics', 65);
INSERT INTO grades VALUES ('103', 'History', 90);
INSERT INTO grades VALUES ('104', 'Mathematics', 90); 
   
-- To retrieve all data from tables joined by foreign keys, 
-- you need to perform a JOIN operation. This will be covered later.

SELECT * FROM studentss JOIN grades ON studentss.id = grades.student_id;
select * from grades;
   
DELETE FROM grades WHERE student_id = '103'; -- Deletes child record
-- When deleting data from the child table, only the child data is deleted, not the parent.

DELETE FROM studentss WHERE id = '102'; -- Does not delete parent record
-- When deleting data from the parent table, both child and parent data are deleted.
drop table studentss; -- frist we need to drob child table
drop table grades; 
SELECT * FROM studentss;
SELECT * FROM grades;



CREATE TABLE studentss
(
id CHAR(3) PRIMARY KEY,  
name VARCHAR(50),
parent_name VARCHAR(50),
exam_score INT
);

-- With ON DELETE CASCADE, 
-- all child records related to a deleted parent record will be deleted automatically.  
-- Without cascade, child records are deleted first, then the parent record.


CREATE TABLE grades
( 
student_id CHAR(3),
course_name VARCHAR(30),
exam_score INT,
CONSTRAINT grades_fk FOREIGN KEY (student_id) REFERENCES studentss (id)
 ON DELETE CASCADE
);

DELETE FROM grades WHERE student_id = '103'; -- Deletes child record


DELETE FROM studentss WHERE id = '102'; -- Does not delete parent record

select * from grades;
select * from studentss;
