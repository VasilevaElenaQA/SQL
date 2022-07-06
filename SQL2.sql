
--Таблица employees

--Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
--Наполнить таблицу employee 70 строками.
_________________________________________________

create table employees(
 id serial primary key,
 employee_name varchar(50) not null 
 )
 
select * from employees;

insert into employees (employee_name)
values ('Казьмин'),
       ('Мамонов Андрей'),
       ('Михальченкова Тамара'),
       ('Кулика Евдокия'),
       ('Попов Михаил'),
       ('Яговкина Анна'),
       ('Токмаков Евгений'),
       ('Лившица Наталья'),
       ('Щавельский Семён'),
       ('Бояров Максим'),
       ('Попырина Анастасия'),
       ('Абалихин Евгений'),
       ('Маринин Валентин'),
       ('Кризько Иван'),
       ('Аспидова Аглая'),
       ('Окладникова София'),
       ('Гавриленко Варвара'),
       ('Габулова Екатерина'),
       ('Нырцева Юлия'),
       ('Гоминова Ирина'),
       ('Шукшин Дмитрий'),
       ('Якунин Леонид'),
       ('Ковалевский Валерий'),
       ('Крупина_Алевтина'),
       ('Беляев Владислав'),
       ('Свечин Владимир'),
       ('Жутова Татьяна'),
       ('Марьин Кирилл'),
       ('Ярощук Надежда'),
       ('Черенчикова_Валентина'),
       ('Апалков_Юрий'),
       ('Крымов_Тимофей'),
       ('Якушков_Алексей'),
       ('Есаулова Мария'),
       ('Гусев Роман'),
       ('Тимашев_Вячеслав'),
       ('Мерзлов_Алексей'),
       ('Нугаева_Милена'),
       ('Талалихина_Ольга'),
       ('Драгомиров_Виктор'),
       ('Шихирин_Валерий'),
       ('Шатохина_Мария'),
       ('Караева_Полина'),
       ('Садыкова_Азия'),
       ('Звягина_Наталья'),
       ('Шушалева_Ольга'),
       ('Бебчук_Кристина'),
       ('Огарков_Валерий'),
       ('Кондюрина_Надежда'),
       ('Перехваткин_Игнат'),
       ('Ягунова_Олеся'),
       ('Завражный_Иван'),
       ('Чекин_Севолод'),
       ('Ерхова_Оксана'),
       ('Минкин_Егор'),
       ('Машарина_Гульнара'),
       ('Куклачёва_Елена'),
       ('Саянова_Алина'),
       ('Абабков Сергей'),
       ('Тукай_Алым'),
       ('Алифанов_Глеб'),
       ('Кудайбергенова_Арина'),
       ('Васильева Елена');
 ____________________________________________________________
 
--Таблица salary

--Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
--Наполнить таблицу salary 15 строками:
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
     
--Таблица employee_salary

--Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
--Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id
 
 
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

--Таблица roles

--Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
--Поменять тип столба role_name с int на varchar(30)
--Наполнить таблицу roles 20 строками

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
     
--Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
--Наполнить таблицу roles_employee 40 строками

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




     
       