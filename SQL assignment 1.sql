/*----------------------------------------------------SQL Assignment----------------------------------------------------*/
/*1. Find out the selling cost AVG for packages developed in Pascal. */
Select * from STUDIES
Select * from PROGRAMMER
select * from SOFTWARE
Select Avg(SCOST) as Average from SOFTWARE where DEVELOPIN ='PASCAL'
select Datediff(mm,DOB,getdate()) from PROGRAMMER 
/* 2. Display Names, Ages of all Programmers. */
select PNAME, DATEDIFF(yy,DOB,GETDATE()) as AGE from PROGRAMMER

/* 3. Display the Names of those who have done the DAP Course. */
Select PNAME from STUDIES where COURSE='DAP'

/* 4. Display the Names and Date of Births of all Programmers Born in January. */
select PNAME, DOB from PROGRAMMER where month(cast(DOB as datetime))=1

/* 5. What is the Highest Number of copies sold by a Package? */
select max(SOLD) as maximum from SOFTWARE 

/* 6. Display lowest course Fee. */
select min(COURSE_FEE) as minimum_fee from STUDIES 

/* 7. How many programmers done the PGDCA Course? */
select count(*) from STUDIES where COURSE='PGDCA'

/* 8. How much revenue has been earned thru sales of Packages Developed in C*/
select sum((SCOST*SOLD)) as total_earning from SOFTWARE where DEVELOPIN='C'

/*9. Display the Details of the Software Developed by Ramesh. */
Select * from SOFTWARE where PNAME='RAMESH'

/*10. How many Programmers Studied at Sabhari?  */
Select count(*) from STUDIES where INSTITUTE='SABHARI'

/*11. Display details of Packages whose sales crossed the 2000 Mark.  */
select * from SOFTWARE where SCOST>2000

/*12. Display the Details of Packages for which Development Cost have been recovered. */
select * from SOFTWARE where DCOST<= (SCOST*SOLD)

/* 13. What is the cost of the costliest software development in Basic? */
select max(DCOST) as minmum_dev_cost from SOFTWARE where DEVELOPIN='BASIC'

/*14. How many Packages Developed in DBASE?  */
select count(*) from SOFTWARE where DEVELOPIN='DBASE'

/*15. How many programmers studied in Pragathi?  */
Select count(*) from STUDIES where INSTITUTE='PRAGATHI'

/*16. How many Programmers Paid 5000 to 10000 for their course?  */
select count(*) from STUDIES where COURSE_FEE between 5000 and 10000

/*17. What is AVG Course Fee  */
select avg(COURSE_FEE) from STUDIES

/* 18. Display the details of the Programmers Knowing C. */
Select * from STUDIES
Select * from PROGRAMMER
select * from SOFTWARE
select * from PROGRAMMER where PROF1='C' or PROF2='C'

/*19. How many Programmers know either COBOL or PASCAL.  */
select * from PROGRAMMER where PROF1='COBOL' or PROF2='PASCAL'

/*20. How many Programmers Don’t know PASCAL and C  */
select * from PROGRAMMER where PROF1 not in ('PASCAL','C') and PROF2 not in ('PASCAL','C')

/* 21. How old is the Oldest Male Programmer.  */
select TOP 1 * from (select  DATEDIFF(yy,DOB,GETDATE()) as AGE from PROGRAMMER) as D order by D.AGE Desc


/* 22. What is the AVG age of Female Programmers? */
select  Avg(DATEDIFF(yy,cast(DOB as Datetime),GETDATE())) as Average_AGE from PROGRAMMER where GENDER='F'

/* 23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. */
select PNAME, Datediff(yy, cast(DOJ as datetime),GETDATE()) as experience from PROGRAMMER order by experience desc

/* 24. Who are the Programmers who celebrate their Birthday’s During the Current Month?  */
select * from PROGRAMMER where month(cast(DOB as datetime))=2

/* 25. How many Female Programmers are there? */
select count(*) from PROGRAMMER where GENDER ='F'

/* 26. What are the Languages studied by Male Programmers.  */
select PROF1,PROF2 from PROGRAMMER where GENDER='M'

/* 27. What is the AVG Salary?  */
select avg(SALARY) from PROGRAMMER

/* 28. How many people draw salary 2000 to 4000? */
select count(*) from PROGRAMMER where SALARY between 2000 and 4000

/* 29. Display the details of those who don’t know Clipper, COBOL or PASCAL.  */
select * from PROGRAMMER where PROF1 not in ('PASCAL','COBOL','CLIPPER') and PROF2 not in ('PASCAL','CLIPPER','COBOL')

/* 30. Display the Cost of Package Developed By each Programmer.  */
select * from SOFTWARE
select PNAME,DCOST  from SOFTWARE group by PNAME

/*31. Display the sales values of the Packages Developed by the each Programmer. */
select PNAME, sum(SCOST*SOLD) as SALES from SOFTWARE group by PNAME

/* 32. Display the Number of Packages sold by Each Programmer.  */
select PNAME, sum(SOLD) from SOFTWARE group by PNAME

/*33. Display the sales cost of the packages Developed by each Programmer Language wise.  */
select DEVELOPIN, sum(SCOST*SOLD) from SOFTWARE group by DEVELOPIN

/*34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.  */
select DEVELOPIN, avg(DCOST) as development_cost ,avg(SCOST) as selling_cost ,avg(SCOST*SOLD) as Price_per_copy from SOFTWARE group by DEVELOPIN

/* 35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. */
select PNAME, max(DCOST) as costliest, min(DCOST) as cheapest from SOFTWARE group by PNAME

/*36. Display each institute name with number of Courses, Average Cost per Course. */
select INSTITUTE, Count(COURSE) as number_of_courses, avg(COURSE_FEE) as avg_cost_per_course from STUDIES group by INSTITUTE

/*37. Display each institute Name with Number of Students.  */
select INSTITUTE, Count(PNAME) as number_of_student from STUDIES group by INSTITUTE

/* 38. Display Names of Male and Female Programmers. Gender also*/
select PNAME, GENDER from PROGRAMMER order by GENDER desc

/* 39. Display the Name of Programmers and Their Packages. */
select PNAME , TITLE as salary from SOFTWARE 

/*40. Display the Number of Packages in Each Language Except C and C++.  */
select * from SOFTWARE
select * from PROGRAMMER
select * from (select count(TITLE) as number_package, DEVELOPIN from SOFTWARE group by DEVELOPIN) as D where D.DEVELOPIN!='C'

/* 41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.*/
select * from (select count(TITLE) as number_packages , DEVELOPIN, AVG(DCOST) as dev_cost from SOFTWARE group by DEVELOPIN) as D where D.dev_cost<1000 

/* 42. Display AVG Difference between SCOST, DCOST for Each Package. */
select TITLE,(avg(SCOST)-Avg(DCOST)) as avg_diff from SOFTWARE group by TITLE

/* 43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered. */
select * from (select sum(SCOST) as selling_cost , sum(DCOST) as dev_cost , sum(SCOST*SOLD-DCOST) as recovered from SOFTWARE group by PNAME) as D where D.recovered<0

/*44. Display Highest, Lowest and Average Salaries for those earning more than 2000.  */
select max(D.SALARY) as min_salary, min(D.SALARY) as max_salary, avg(D.SALARY) as avg_salary from (select  SALARY from PROGRAMMER where SALARY>2000) as D 

/*45. Who is the Highest Paid C Programmers?  */
select  Top 1 D.PNAME as name ,max(D.Salary) as max_salary from (select PNAME, SALARY from PROGRAMMER where PROF1='C' or PROF2='C') as D group by D.PNAME order by max(D.SALARY) desc

/* 46. Who is the Highest Paid Female COBOL Programmer?  */
select  Top 1 D.PNAME as name ,max(D.Salary) as max_salary from (select PNAME, SALARY from PROGRAMMER where GENDER='F' and PROF2='COBOL') as D group by D.PNAME order by max(D.SALARY) desc

/*47. Display the names of the highest paid programmers for each Language.  */


/*48. Who is the least experienced Programmer.  */
select Top 1  PNAME, Datediff(yy, cast(DOJ as datetime),GETDATE()) as experience from PROGRAMMER order by experience 

/*49. Who is the most experienced male programmer knowing PASCAL. */
select TOP 1 Datediff(yy,DOJ,GETDATE()) as experience,PNAME from PROGRAMMER where PROF1='PASCAL' or PROF2='PASCAL' order by experience desc

/*50. Which Language is known by only one Programmer? */ 

/*51. Who is the Above Programmer Referred in 50?  */

/* 52. Who is the Youngest Programmer knowing DBASE? */
select Top 1  PNAME, Datediff(yy, cast(DOJ as datetime),GETDATE()) as experience from PROGRAMMER where PROF1='DBASE' or PROF2='DBASE' order by experience 

/*53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? */
select * from PROGRAMMER where GENDER='F' and SALARY>3000 and PROF1 not in ('C','C++','ORACLE','DBASE') and PROF2 not in ('C','C++','ORACLE','DBASE')

/*54. Which Institute has most number of Students? */
select top 1 * from (select count(PNAME) as number_student, INSTITUTE from STUDIES group by INSTITUTE ) as D order by D.number_student desc

/* 55. What is the Costliest course?*/
select Top 1 COURSE, max(COURSE_FEE) from STUDIES group by COURSE

/*56. Which course has been done by the most of the Students? */
select top 1 * from (select count(PNAME) as number_student, COURSE from STUDIES group by COURSE) as D order by D.number_student desc

/* 57. Which Institute conducts costliest course.*/
select Top 1 INSTITUTE, max(COURSE_FEE) from STUDIES group by INSTITUTE

/* 58. Display the name of the Institute and Course, which has below AVG course fee. */
select INSTITUTE, COURSE, COURSE_FEE from STUDIES where COURSE_FEE<(select avg(COURSE_FEE) from STUDIES) 

/*59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, */
select  COURSE  from STUDIES where COURSE_FEE<(select avg(COURSE_FEE)+1000 from STUDIES) and COURSE_FEE > (select avg(COURSE_FEE)- 1000 from STUDIES)


/* 60. Which package has the Highest Development cost?*/
select Top 1 * from (select TITLE, max(DCOST) as Dev_cost from SOFTWARE group by TITLE ) as D order by D.Dev_cost desc

/*61. Which course has below AVG number of Students?  */
select * from STUDIES
select D.stud, D.COURSE from (select count(PNAME) as stud,COURSE from STUDIES group by COURSE) as D where D.stud< (select avg(D.stud) from (select count(PNAME) as stud,COURSE from STUDIES group by COURSE) as D)

/*62. Which Package has the lowest selling cost? */
Select Top 1 * from (select TITLE, min(SCOST) as selling_cost from SOFTWARE group by TITLE) as D order by D.selling_cost 

/* 63. Who Developed the Package that has sold the least number of copies?  */
select Top 1 * from (select  TITLE, min(SOLD) as copies from SOFTWARE group by TITLE) as D order by D.copies 

/* 64. Which language has used to develop the package, which has the highest sales amount? */
select Top 1 * from (select  DEVELOPIN, min(SOLD) as copies from SOFTWARE group by DEVELOPIN) as D order by D.copies desc

/* 65. How many copies of package that has the least difference between development and selling cost where sold.*/
select count(TITLE) from SOFTWARE where (DCOST-SCOST)=(select min(DCOST-SCOST) from SOFTWARE)

/*66. Which is the costliest package developed in PASCAL.  */
select Top 1 * from SOFTWARE where DEVELOPIN='PASCAL' order by DCOST desc

/*67. Which language was used to develop the most number of Packages.  */
select Top 1 * from (select Count(*)as number, DEVELOPIN from SOFTWARE group by DEVELOPIN ) as D order by D.number desc

/*68. Which programmer has developed the highest number of Packages? */
select Top 1 * from (select Count(*)as number, PNAME from SOFTWARE group by PNAME ) as D order by D.number desc

/* 69. Who is the Author of the Costliest Package? */
select top 1 PNAME, SCOST from SOFTWARE order by SCOST desc

/* 70. Display the names of the packages, which have sold less than the AVG number of copies. */
select TITLE from SOFTWARE where SOLD < (Select avg(SOLD) from SOFTWARE)

/* 71. Who are the authors of the Packages, which have recovered more than double the Development cost? */
select * from SOFTWARE
select * from SOFTWARE where (SOLD*SCOST)>2*DCOST

/*72. Display the programmer Name and the cheapest packages developed by them in each language.*/
select PNAME,DEVELOPIN,min(SCOST) from SOFTWARE group by PNAME,DEVELOPIN

/*73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.  */
select DEVELOPIN,max(SCOST) as maximum ,MIN(SCOST) as minimum  from SOFTWARE group by DEVELOPIN

/*74. Who is the youngest male Programmer born in 1965?  */
select PNAME, Datediff(yy, cast(DOB as datetime),GETDATE()) as age from PROGRAMMER where GENDER='M' and year(cast(DOB as datetime))=1965 order by age

/*75. Who is the oldest Female Programmer who joined in 1992?  */
select top 1  PNAME, Datediff(yy, cast(DOB as datetime),GETDATE()) as age from PROGRAMMER where GENDER='F' and year(cast(DOJ as datetime))=1992 order by age desc

/*76. In which year was the most number of Programmers born. */
select top 1 count(*) as num,* from (select  year(cast(DOB as datetime)) as D from PROGRAMMER ) as E group by E.D order by num desc

/*77. In which month did most number of programmers join? */
select  count(*) as num,* from (select  month(cast(DOB as datetime)) as D from PROGRAMMER ) as E group by E.D order by num desc

/*78. In which language are most of the programmer’s proficient.  */
select Top 4 D1.cont1, D1.PROF1 from (select sum(D.cont) as cont1, PROF1 from 
(select count(*) as cont, PROF1 from PROGRAMMER group by PROF1 union all select count(*) as cont, PROF2 as PROF1 from PROGRAMMER group by PROF2) as D 
group by D.PROF1 ) as D1
order by D1.cont1 desc

/* 79. Who are the male programmers earning below the AVG salary of Female Programmers?*/
select * from PROGRAMMER where GENDER='M' and SALARY<(select avg(salary) from PROGRAMMER where gender='F')

/*80. Who are the Female Programmers earning more than the Highest Paid?  */
select * from PROGRAMMER where GENDER='F' and SALARY>(select max(salary) from PROGRAMMER where gender='M')

/* 81. Which language has been stated as the proficiency by most of the Programmers?*/
select Top 4 D1.cont1 as cont2, D1.PROF1 as PROF2 from (select sum(D.cont) as cont1, PROF1 from 
(select count(*) as cont, PROF1 from PROGRAMMER group by PROF1 union all select count(*) as cont, PROF2 as PROF1 from PROGRAMMER group by PROF2) as D 
group by D.PROF1 ) as D1
order by D1.cont1 desc

/*82. Display the details of those who are drawing the same salary. */
select D.PNAME, D1.PNAME, D.SALARY from PROGRAMMER as D inner join PROGRAMMER as D1 on D.SALARY=D1.SALARY and D.PNAME<>D1.PNAME order by D.SALARY

/* 83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. */
select * from PROGRAMMER where GENDER='M' and Salary>3000

/*84. Display the details of the packages developed in Pascal by the Female Programmers.  */
select * from PROGRAMMER as D  inner join SOFTWARE as D1 on D.PNAME=D1.PNAME where D.GENDER='F' and D1.DEVELOPIN='PASCAL'

/* 85. Display the details of the Programmers who joined before 1990.  */
select * from PROGRAMMER where year(cast(DOJ as datetime))<1990

/* 86. Display the details of the Software Developed in C By female programmers of Pragathi. */
select * from ((PROGRAMMER as D  inner join SOFTWARE as D1 on D.PNAME=D1.PNAME) 
inner join STUDIES as D2 on D2.PNAME=D1.PNAME)
where D.GENDER='F' and D1.DEVELOPIN='C' and D2.INSTITUTE='PRAGATHI'

/* 87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. */
select count(D1.TITLE), sum(D1.SOLD), sum(D1.SOLD*D1.SCOST),D2.INSTITUTE from ((PROGRAMMER as D  inner join SOFTWARE as D1 on D.PNAME=D1.PNAME) 
inner join STUDIES as D2 on D2.PNAME=D1.PNAME) group by D2.INSTITUTE

/*88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.  */
select count(D2.PNAME),D2.INSTITUTE from ((PROGRAMMER as D  inner join SOFTWARE as D1 on D.PNAME=D1.PNAME) 
inner join STUDIES as D2 on D2.PNAME=D1.PNAME) where D.GENDER='M' and D1.DEVELOPIN='DBASE' group by D2.INSTITUTE

/*89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.  */

/*90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers.  */
select * from (select D.PNAME, D.DEVELOPIN,D.TITLE,D1.PROF1,D1.PROF2 from SOFTWARE as D inner join PROGRAMMER as D1 on D.PNAME=D1.PNAME) as E 
where E.DEVELOPIN != E.PROF1 and E.DEVELOPIN !=E.PROF2

/*91. Display the details of the software developed by the male students of Sabhari.  */
select * from (select D.PNAME,D.INSTITUTE,D.COURSE,D.COURSE_FEE, D1.TITLE,D1.DEVELOPIN, D2.GENDER from ((STUDIES as D inner join SOFTWARE as D1 on D.PNAME=D1.PNAME)
inner join PROGRAMMER as D2 on D1.PNAME=D2.PNAME))as E 
where E.GENDER='M' and E.INSTITUTE='SABHARI'

/*92. Display the names of the programmers who have not developed any packages.  */
Select E.PNAME from (select D1.PNAME,D.TITLE from SOFTWARE as D right join PROGRAMMER as D1 on D.PNAME=D1.PNAME)as E where E.TITLE is null

/*93. What is the total cost of the Software developed by the programmers of Apple?  */
select * from SOFTWARE
select * from STUDIES
select D.INSTITUTE,sum(D1.SCOST) from STUDIES as D inner join SOFTWARE as D1 on D.PNAME= D1.PNAME where D.INSTITUTE='APPLE' group by D.INSTITUTE

/*94. Who are the programmers who joined on the same day? */
select D.PNAME,D1.PNAME,day(D.DOJ) as d  from PROGRAMMER as D inner join PROGRAMMER as D1 on day(D.DOJ)=day(D1.DOJ) and D.PNAME<>D1.PNAME order by d

/*95. Who are the programmers who have the same Prof2? */
select D.PNAME,D1.PNAME,D.PROF2 from PROGRAMMER as D inner join PROGRAMMER as D1 on D.PROF2=D1.PROF2 and D.PNAME<>D1.PNAME 

/*96. Display the total sales value of the software, institute wise.  */
select D.INSTITUTE,sum(D1.SOLD) as Sold from STUDIES as D inner join SOFTWARE as D1 on D.PNAME= D1.PNAME  group by D.INSTITUTE

/*97. In which institute does the person who developed the costliest package studied.  */
select Top 1 D.INSTITUTE, D1.SCOST from STUDIES as D inner join SOFTWARE as D1 on D.PNAME = D1.PNAME order by D1.SCOST desc

/* 98. Which language listed in prof1, prof2 has not been used to develop any package.*/

/* 99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. */
select E.SCOST*E.SOLD as EARN, E.COURSE from (select Top 1 D.SCOST,D.SOLD,D1.COURSE from SOFTWARE as D inner join STUDIES as D1 on D.PNAME = D1.PNAME order by D.SOLD desc) as E

/* 100. What is the AVG salary for those whose software sales is more than 50,000/-.*/
select avg(E.SALARY), E.PNAME from (select D1.SALARY,D.SCOST,D.SOLD, D.PNAME from PROGRAMMER as D1 inner join SOFTWARE as D on D.PNAME=D1.PNAME where (D.SCOST*D.SOLD)>50000)as E  group by E.PNAME

/*101. How many packages were developed by students, who studied in institute that charge the lowest course fee? */
select count(*) from SOFTWARE as D inner join STUDIES as D1 on D.PNAME=D1.PNAME where COURSE_FEE=(Select Min(COURSE_FEE) from STUDIES)

/*102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?  */
select D1.INSTITUTE from SOFTWARE as D inner join STUDIES as D1 on D.PNAME=D1.PNAME where DCOST=(Select Min(DCOST) from SOFTWARE)

/*103. How many packages were developed by the female programmers earning more than the highest paid male programmer? */
select count(D.TITLE) from SOFTWARE as D inner join PROGRAMMER as D1 on D.PNAME=D1.PNAME where GENDER='F' and Salary>(Select max(Salary) from PROGRAMMER where GENDER ='M')

/*104. How many packages are developed by the most experienced programmer form BDPS. */
select count(*) from (select D2.TITLE, Datediff(yy,DOJ,GETDATE()) as expe from 
((PROGRAMMER as D inner join STUDIES as D1 on D.PNAME=D1.PNAME) inner join SOFTWARE as D2 on D1.PNAME=D2.PNAME) 
where D1.INSTITUTE='BDPS') as E where E.expe=32
 
/*105. List the programmers (form the software table) and the institutes they studied.  */
select D.PNAME, D1.INSTITUTE from PROGRAMMER as D inner join STUDIES as D1 on D.PNAME= D1.PNAME

/* 106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. */


/*107. List the programmer names (from the programmer table) and No. Of Packages each has developed.  */
select D.PNAME, count(D1.TITLE) from PROGRAMMER as D inner join SOFTWARE as D1 on D.PNAME=D1.PNAME group by D.PNAME

