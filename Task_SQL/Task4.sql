use work;

-- alter table
drop table students;
CREATE TABLE students (
   studentID INT ,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
   birthdate DATE
);

select * from students;
-- Task 1: Add a new gender column

alter table students 
add column gender varchar(6);

-- Task 2: Change last name column to 100 characters

alter table students
modify column lastname VARCHAR(100);

-- Task 3: Delete birthDate column

alter table students
drop column birthDate;

-- Task 4: Add a PRIMARY KEY (StudentID)

alter table students
modify column StudentID int primary key;

-- Task 5: Add a UNIQUE CONSTRAINT.(firstname , lastname)

alter table students 
add constraint unique (firstname , lastname);


CREATE TABLE departments (
   departmentID INT PRIMARY KEY,
   department_name VARCHAR(50)
);

-- Task 6:  Add a FOREIGN KEY named "departmentID" to the "Students" table

alter table departments
add foreign key (departmentID) references students(StudentID); 

-- Task 7: Assign DEFAULT value ('B' for Gender)

alter table students
modify Gender varchar(12) default 'b';

-- Task 8: Add CHECK constraint (Date of Birth < '2005-01-01')

alter table students 
add column birthdate varchar(20);
-- --------------------------------------
alter table students
add constraint check (birthdate < '2005-01-01');

-- Let's examine the table again