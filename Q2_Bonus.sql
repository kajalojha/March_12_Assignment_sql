use avisoft;
create table Employe(
emp_id int primary key,
name varchar(255),
supervisor int ,
salary int);
insert into Employe(emp_id,name,supervisor,salary)
values(1,'john',3,1000),
(2,'Dan',3,2000),
(3,'Brad',null,4000),
(4,'Thomas',3,4000);
create table bonus(
emp_id int primary key ,
bonus int);
insert into bonus(emp_id , bonus)
values(2,500),
(4,2000);
select name ,bonus
from Employe e left join bonus b
on e.emp_id = b.emp_id
where bonus<1000 or bonus is null;
