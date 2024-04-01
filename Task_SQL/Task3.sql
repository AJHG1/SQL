use work;

-- like 

create table if not exists employees
(
id int,
firstname varchar(20),
lastname varchar(20),
address varchar(50),
age int,
salary int
);

 insert into employees values(101,'Melad','Alamri','Makkah',30, 30000);
 insert into employees values(102,'Leen','Alsultan','Riyadh',32, 25000);
 insert into employees values(103,'Areej','Alzaidi','Khafji',31, 21000);
 insert into employees values(104,'Muneera','AlAli','Madinah',33, 17000);
 insert into employees values(105,'Nouf','Alsubhi','Unayzah',32, 17000);
 insert into employees values(106,'Sulaiman','Alzahrani','Jazan',33, 18000);
 insert into employees values(107,'Shatha','Alharbi','Abha',31, 19000);
 insert into employees values(108,'Emtnan','Bloush','Najran',32, 21000);
 insert into employees values(109,'Rand','AlMuhanna','Tabuk',33, 17000);
 insert into employees values(110,'Manar','Alabdail','Sakakah',34, 80000);
 insert into employees 
values(111,'Taef','Mersal','Makkah',34, 40000);
 insert into employees 
values(110,'Najd','Aleid','Riyadh',33, 80000);
 insert into employees values(110,'Halima','AlAqili','Jizan',31, 80000);
 insert into employees values(110,'Bishri','Alharbi','Buraydah',32, 80000);
 insert into employees 
values(110,'Raheil','Alotaibi','Al Bahah',33, 80000);
 insert into employees values(110,'Lujain','Alqahtani','Madinah',32, 80000);


 select * from employees ;
 

-- Task01 -> Create a query that lists the personnel information whose lastname ends with i.

select * 
from employees 
where lastname like '%i';
-- Task02 -> Create a query that lists the personnel whose firstname starts with the letter m.

select * 
from employees 
where firstname like 'm%';

-- Task03 -> Create a query that lists the personnel whose firstname has the 2nd letter e and whose salary is more than 18000.

select *
from employees 
where firstname like '_e%' and salary  > 18000;

-- Task04 -> Create a query that lists the personnel whose firstname has the 3rd letter t and the other letters have a.

select * 
from employees
where firstname like '__t%' and firstname like '%a%';

-- Task05 -> Create a query that lists the personnel whose firstname does not contain the letter a.

select *
from employees
where firstname not like '%a%' ;

-- Task06 -> Create a query that lists the personnel whose firstname has first letter a and 4th letter e.
select * 
from employees 
where firstname like 'a__e%';

-- Task07 -> Create a query that lists the personnel whose firstname is Najd and address is Riyadh.

select *
from employees
where firstname like 'Najd' and address like 'Riyadh' ;