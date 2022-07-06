
--������� employees

--������� ������� employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
--��������� ������� employee 70 ��������.
_________________________________________________

create table employees(
 id serial primary key,
 employee_name varchar(50) not null 
 )
 
select * from employees;

insert into employees (employee_name)
values ('�������'),
       ('������� ������'),
       ('������������� ������'),
       ('������ �������'),
       ('����� ������'),
       ('�������� ����'),
       ('�������� �������'),
       ('������� �������'),
       ('���������� ����'),
       ('������ ������'),
       ('�������� ���������'),
       ('�������� �������'),
       ('������� ��������'),
       ('������� ����'),
       ('�������� �����'),
       ('����������� �����'),
       ('���������� �������'),
       ('�������� ���������'),
       ('������� ����'),
       ('�������� �����'),
       ('������ �������'),
       ('������ ������'),
       ('����������� �������'),
       ('�������_��������'),
       ('������ ���������'),
       ('������ ��������'),
       ('������ �������'),
       ('������ ������'),
       ('������ �������'),
       ('�����������_���������'),
       ('�������_����'),
       ('������_�������'),
       ('�������_�������'),
       ('�������� �����'),
       ('����� �����'),
       ('�������_��������'),
       ('�������_�������'),
       ('�������_������'),
       ('����������_�����'),
       ('����������_������'),
       ('�������_�������'),
       ('��������_�����'),
       ('�������_������'),
       ('��������_����'),
       ('�������_�������'),
       ('��������_�����'),
       ('������_��������'),
       ('�������_�������'),
       ('���������_�������'),
       ('�����������_�����'),
       ('�������_�����'),
       ('���������_����'),
       ('�����_�������'),
       ('������_������'),
       ('������_����'),
       ('��������_��������'),
       ('���������_�����'),
       ('�������_�����'),
       ('������� ������'),
       ('�����_����'),
       ('��������_����'),
       ('��������������_�����'),
       ('��������� �����');
 ____________________________________________________________
 
--������� salary

--������� ������� salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
--��������� ������� salary 15 ��������:
-- 1000
-- 1100
-- 1200
-- 1300
-- 1400
-- 1500
-- 1600
-- 1700
-- 1800
-- 1900
-- 2000
-- 2100
-- 2200
-- 2300
-- 2400
-- 2500


      create table salary (
 id serial primary key,
 monthly_salary int not null 
)

select * from salary;

insert into salary (monthly_salary)
values (1000),
      (1100),
      (1200),
      (1300),
      (1400),
      (1500),
      (1600),
      (1700),
      (1800),
      (1900),
      (2000),
      (2100),
      (2200),
      (2300),
      (2400),
      (2500);
     
 ____________________________________________________________-   
     
--������� employee_salary

--������� ������� employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
--��������� ������� employee_salary 40 ��������:
-- � 10 ����� �� 40 �������� �������������� employee_id
 
 
 create table employee_salary (
 id serial primary key,
 employee_id int not null unique,
 salary_id int not null 
) 
     
     
select * from employee_salary;

insert into employee_salary (employee_id, salary_id )
values (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4),
	   (5, 5),
	   (6, 6),
	   (7, 7),
	   (8, 8),
	   (9, 9),
	   (10, 10),
	   (11, 11),
	   (12, 12),
	   (13, 13),
	   (14, 14),
	   (15, 15),
	   (16, 16),
	   (17, 17),
	   (18, 18),
	   (19, 19),
	   (20, 20),
	   (21, 21),
	   (22, 22),
	   (23, 23),
	   (24, 24),
	   (25, 25),
	   (26, 26),
	   (27, 27),
	   (28, 28),
	   (29, 29),
	   (71, 30),
	   (72, 31),
	   (73, 32),
	   (74, 33),
	   (75, 34),
	   (76, 35),
	   (77, 36),
	   (78, 37),
	   (79, 38),
	   (80, 39),
	   (81, 40);
     
____________________________________________________________

--������� roles

--������� ������� roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
--�������� ��� ������ role_name � int �� varchar(30)
--��������� ������� roles 20 ��������

create table roles (
 id serial primary key,
 role_name int not null unique 
) 

select * from roles; 

ALTER TABLE roles
ALTER COLUMN role_name
type varchar(30);

insert into roles (role_name)
values ('Junior Python developer'),
	   ('Middle Python developer'),
	   ('Senior Python developer'),
	   ('Junior Java developer'),
	   ('Middle Java developer'),   
	   ('Senior Java developer'),
	   ('Junior JavaScript developer'),
	   ('Middle JavaScript developer'),
	   ('Senior JavaScript developer'),
	   ('Junior Manual QA engineer'),
	   ('Middle Manual QA engineer'),
	   ('Senior Manual QA engineer'),
	   ('Project Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales manager'),
	   ('Junior Automation QA engineer'),
	   ('Middle Automation QA engineer'),
	   ('Senior Automation QA engineer');
	  
	  ____________________________________________________________
     
--������� ������� roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (������� ���� ��� ������� employees, ���� id)
-- role_id. Int, not null (������� ���� ��� ������� roles, ���� id)
--��������� ������� roles_employee 40 ��������

create table roles_employee (
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees (id),
	foreign key (role_id)
		references roles (id)
	);

insert into roles_employee (employee_id,role_id)
values (40, 20),
(39, 19),
(38, 18),
(37, 17),
(36, 16),
(35, 15),
(34, 14),
(33, 13),
(32, 12),
(31, 11),
(30, 10),
(29, 9),
(28, 8),
(27, 7),
(26, 6),
(25, 5),
(24, 4),
(23, 3),
(22, 2),
(21, 1),
(20, 1),
(19, 2),
(18, 3),
(17, 4),
(16, 5),
(15, 6),
(14, 7),
(13, 8),
(12, 9),
(11, 10),
(10, 11),
(9, 12),
(8, 13),
(7, 14),
(6, 15),
(5, 16),
(4, 17),
(3, 18),
(2, 19),
(1, 20);

select * from roles_employee;




     
       