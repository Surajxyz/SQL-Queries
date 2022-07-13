/* Task To Be Performed */

/*1 Display the “FIRST_NAME” from Employee table using the alias nameas Employee_name.*/
Select First_name as Employee_name from EMPLOYEE_TABLE

/*2 Display “LAST_NAME” from Employee table in upper case.*/
select upper(Last_name) as Last_name from EMPLOYEE_TABLE

/*3 Display unique values of DEPARTMENT from EMPLOYEE table.*/
select Distinct Department from EMPLOYEE_TABLE

/*4 Display the first three characters of LAST_NAME from EMPLOYEE table.*/
select substring(Last_name,1,3) from EMPLOYEE_TABLE

/*5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.*/
select Distinct Department, LEN(Department) from EMPLOYEE_TABLE 

/*6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.*/
select First_name +' ' + Last_name as full_name from EMPLOYEE_TABLE

/* 7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.*/
select * from EMPLOYEE_TABLE order by First_name  

/*8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending*/
select * from EMPLOYEE_TABLE order by First_name, Department Desc

/*9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.*/
select * from EMPLOYEE_TABLE where First_name in ('Veena','Karan')

/* 10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.*/
select * from EMPLOYEE_TABLE where Department='Admin'

/* 11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’*/
select * from EMPLOYEE_TABLE where First_name like 'V%'

/*12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.*/
select * from EMPLOYEE_TABLE where Salary between 100000 and 500000

/* 13 Display details of the employees who have joined in Feb-2020.*/
select * from EMPLOYEE_TABLE where month(Joining_date)=02 and year(Joining_date)=2020

/* 14 Display employee names with salaries >= 50000 and <= 100000*/
select First_name +' ' + Last_name as full_name from EMPLOYEE_TABLE where Salary <=100000 and Salary >=50000

/* 16 DISPLAY details of the EMPLOYEES who are also Managers.*/
select * from EMPLOYEE_TABLE as E inner join TITLE_TABLE as T on E.Employee_id= T.Employee_ref_id where T.Employee_title='Manager'

/*17 DISPLAY duplicate records having matching data in some fields of a table.*/
select * from EMPLOYEE_TABLE as E1, EMPLOYEE_TABLE as E2 where E1.Department=E2.Department and E1.Employee_id <>E2.Employee_id

select * from TITLE_TABLE as E1, TITLE_TABLE as E2 where E1.Employee_title=E2.Employee_title and E1.Employee_ref_id <>E2.Employee_ref_id

/*18 Display only odd rows from a table.*/
select * from EMPLOYEE_TABLE where (Employee_id)%2=1 

Alter table BONUS_TABLE ADD id int IDENTITY(1,1)
select * from BONUS_TABLE where (id)%2=1 


Alter table TITLE_TABLE ADD id int IDENTITY(1,1)
select * from TITLE_TABLE where (id)%2=1 

/*19 Clone a new table from EMPLOYEE table*/
create table clone(Employee_id int primary key,First_name Varchar(30),Last_name varchar(30),Salary int,Joining_date datetime, Department varchar(10) )
insert into clone select * from EMPLOYEE_TABLE
select * from clone

/*20 DISPLAY the TOP 2 highest salary from a table*/
select Distinct Top 2 Salary from EMPLOYEE_TABLE  order by Salary Desc

/*21. DISPLAY the list of employees with the same salary.*/
select * from EMPLOYEE_TABLE as E1, EMPLOYEE_TABLE as E2 where E1.Salary=E2.Salary and E1.Employee_id >E2.Employee_id

/* 22 Display the second highest salary from a table.*/
select * from EMPLOYEE_TABLE as E1 where 1= (Select count(Distinct Salary) from EMPLOYEE_TABLE as E2 where E2.Salary> E1.Salary)

/*23 Display the first 50% records from a table.*/
select * from EMPLOYEE_TABLE where Employee_id<=(Select count(Employee_id)/2 from EMPLOYEE_TABLE)

/*24. Display the departments that have less than 4 people in it.*/
select Department from EMPLOYEE_TABLE group by Department having Count(Department)<4 

/* 25. Display all departments along with the number of people in there.*/
select Department, count(Department) from EMPLOYEE_TABLE group by Department

/*26 Display the name of employees having the highest salary in each department*/
select Department, max(Salary) from EMPLOYEE_TABLE group by Department

/* 27 Display the names of employees who earn the highest salary.*/
select First_name+' '+ Last_name from EMPLOYEE_TABLE where Salary=(select max(Salary) from EMPLOYEE_TABLE)

/* 28 Diplay the average salaries for each department*/select Department, avg(Salary) from EMPLOYEE_TABLE group by Department/*29 display the name of the employee who has got maximum bonus*/select E1.First_name+' '+ E1.Last_name from EMPLOYEE_TABLE as E1 inner join BONUS_TABLE as B1 on E1.Employee_id=B1.Employee_ref_id where B1.Bonus_Amount= (select max(Bonus_Amount) from BONUS_TABLE)/*30 Display the first name and title of all the employees*/select E1.First_name, B1.Employee_title from EMPLOYEE_TABLE as E1 inner join TITLE_TABLE as B1 on E1.Employee_id=B1.Employee_ref_id 


