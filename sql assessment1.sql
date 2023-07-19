studentsdatabase ABC_companydb;
use ABC_companydb;
create table worker(Worker_Id int Not null primary key auto_increment, First_Name varchar(100), Last_Name varchar(100), 
                    Salary int, Joining_Date datetime, Department varchar(100));
insert into worker (First_Name, Last_Name, Salary, Joining_Date, Department)
value('monika', 'arora', 100000, '2014-11-04 09-00-00', 'HR'),
('niharika', 'verma', 80000, '2014-11-06 09-00-00', 'admin'),
('vishal', 'singhal', 300000, '2014-02-20 09-00-00', 'HR'),
('amitabh', 'singh', 500000, '2014-02-20 09-00-00', 'admin'),
('vivek', 'bharti', 500000, '2014-11-06 09-00-00', 'admin'),
('vipul', 'diwan', 200000, '2014-11-06 09-00-00', 'account'),
('satish', 'kumar', 75000, '2014-01-20 09-00-00', 'account'),
('geetika', 'chauhan', 90000, '2014-11-04 09-00-00', 'admin');
select * from worker;

/*=====print all Worker details from the Worker table order by FIRST_NAME
Ascending and DEPARTMENT Descending=====*/
select * from worker order by first_name asc, department desc;

/*=======print details for Workers with the first names “Vipul” and “Satish”
from the Worker table=======*/
select * from worker where first_name = 'vipul'or first_name= 'satish';

/*=====Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and
contains six alphabets======*/

select * from worker where first_name ='%%%%%h';

/*=====Write an SQL query to print the name of employees having the highest salary in each
department======*/
select first_name, department, max(salary) as highest_salary from worker group by department;

/*=====Write an SQL query to show all departments along with the number of people in there=======*/
select count(first_name) as total_people, department from worker group by department;

/*=======Write an SQL query to fetch the departments that have less than five people in them=======*/
select department from worker where department<5;


/*======Write an SQL query to show the top 6 records of a table-======*/
select* from worker limit 6;

/*========Write an SQL query to fetch duplicate records having matching data in some fields of a table.=======*/ 
SELECT name, email, COUNT(name)  
FROM student_contacts  
GROUP BY name  
HAVING COUNT(name) > 1;  

 /*------------------------------------schooldb---------------------*/
SELECT * FROM schooldb.students;
-- 1 To display all the records form STUDENT table. eSELECT * FROM studnt ;
select * from students;
-- 2. To display any name and date of birth from the table STUDENT. SELECT StdName, DOB
-- FROM student ;
select stdname, dob from students;
-- 3. To display all students record where percentage is greater of equal to 80 FROM student table.
SELECT * FROM students WHERE percentage >= 80;
-- 4. To display student name, stream and percentage where percentage of student is more than 80
 SELECT StdName, std_Stream, Percentage from students WHERE percentage > 80;
-- 5. To display all records of science students whose percentage is more than 75 form student table.
SELECT * from students WHERE std_stream = 'Science' and percentage > 75;



