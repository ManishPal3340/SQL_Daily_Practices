 create  database test;
 use test;
 create table employee (
    employee_id int not null primary key auto_increment,
    first_name varchar(25),
    last_name varchar(25),
    salary int,
    joining_date datetime,
    department varchar(25)
);

-- step 4: insert sample data
insert into employee (employee_id, first_name, last_name, salary, joining_date, department) values
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

select * from employee;

create table bonus ( 
    employee_ref_id int, 
    bonus_amount int(10), 
    bonus_date datetime, 
    foreign key (employee_ref_id) 
    references employee(employee_id) 
    on delete cascade 
); 

insert into bonus (employee_ref_id, bonus_amount, bonus_date)
values
(1, 5000, '2016-02-20'),
(2, 3000, '2016-06-11'),
(3, 4000, '2016-02-20'),
(1, 4500, '2016-02-20'),
(2, 3500, '2016-06-11');

create table title ( 
    employee_ref_id int, 
    employee_title char(25),
    affected_from datetime, 
    foreign key (employee_ref_id) 
    references employee(employee_id) 
    on delete cascade 
); 

insert into title (employee_ref_id, employee_title, affected_from) values
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

-- q.1
select first_name as employee_name
from employee;

-- q.2
select upper(first_name)
from employee;

-- q.3
select distinct department
from employee;

-- q.4
select substring(first_name, 1, 3)
from employee;

-- q.5
select instr(first_name, 'a')
from employee
where first_name = 'Amitabh';

-- q.6
select rtrim(first_name)
from employee;

-- q.7
select ltrim(department)
from employee;

-- q.8
select distinct department, length(department) as length
from employee;

-- q.9
select replace(first_name, 'a', 'A')
from employee;

-- q.10  
select concat(first_name, ' ', last_name) as complete_name
from employee;

-- q.11
select * from employee
order by first_name asc;

-- q.12
select * from employee
order by first_name asc, department desc;

-- q.13
select * from employee
where first_name in ('Vipul', 'Satish');

-- q.14
select * from employee
where first_name not in ('Vipul', 'Satish');

-- q.15
select * from employee
where department = 'Admin';

-- q.16
select * from employee
where first_name like '%a%';

-- q.17
select * from employee
where first_name like '%a';

-- q.18
select * from employee
where first_name like '%h'
and length(first_name) = 6;

-- q.19
select * from employee
where salary between 100000 and 500000;

-- q.20
select * from employee
where year(joining_date) = 2014
and month(joining_date) = 2;

-- q.21
select count(*) as total_employees
from employee
where department = 'Admin';

-- q.22
select first_name, last_name
from employee
where salary between 50000 and 100000;

-- q.23
select department, count(*) as emp_count
from employee
group by department
order by emp_count desc;

-- q.24
select e.* 
from employee e
join title t
on e.employee_id = t.employee_ref_id
where t.employee_title = 'Manager';

-- q.25
select first_name, count(*)
from employee
group by first_name
having count(*) > 1;

-- q.26
select * from employee
where mod(employee_id, 2) = 1;

-- q.27
select * from employee
where mod(employee_id, 2) = 0;

-- q.28
select now();

-- q.29
select * from employee
limit 10;

-- q.30
select distinct salary
from employee
order by salary desc
limit 3;
