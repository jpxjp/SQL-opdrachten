
/*Vraag 3*/
Insert into my_employees 
values (1, 'Patel','Ralph','rpatel',895);
/*Vraag 4*/
Insert into my_employees (id,last_name,first_name,userid,salary)
values (2, 'Dancs','Betty','bdancs',860);
/*Vraag 5*/
select * from my_employees
where id IN (1,2);
/*Vraag 6*/
Insert into my_employees 
values (3, 'Biri','Ben','bbiri',1100),(4, 'Newman','Chad','cnewman',750),(5, 'Ropeburn','Audrey','aropeburn',1550);
/*Vraag 7*/
select * from my_employees;
/*Vraag 8*/
update my_employees
set last_name = 'Van der Veen'
where id = 4;
/*Vraag 9*/
update my_employees
set salary = 1000
where salary < 900;
/*Vraag 10*/
delete from my_employees
where last_name = 'Biri';
/*Vraag 11*/
update my_employees
set userid = 'cdrexler'
where id IN (4,5) AND salary < 1200;
/*Vraag 12*/
select * from my_employees;
/*DDL*/
/*Vraag 1*/
create table dept (
id int(7) primary key, name varchar(25)
);
/*Vraag 2*/
Desc dept;
/*Vraag 3*/
insert into dept
select department_id,department_name from departments;
/*Vraag 4*/
select * from dept;
/*Vraag 5*/
create table emp (
id int(7) primary key, last_name varchar(25),first_name varchar(25),dept_id int(7), foreign key (dept_id) references dept(id) 
);
/*Vraag 6*/
desc emp;
/*Vraag 7*/
drop table dept,emp;

