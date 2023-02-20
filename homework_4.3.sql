create database if not exists homework_4_3;
use homework_4_3;

drop table if exists users;
drop table if exists clients;
drop table if exists employee;
drop table if exists projects;
drop table if exists auto;
drop table if exists city;
drop table if exists man;

create table users
(
    id    int auto_increment primary key,
    login varchar(255) null,
    pass  varchar(255) null,
    male  tinyint      null
);

create table clients
(
    id    int auto_increment primary key,
    login varchar(255) null,
    pass  varchar(255) null,
    male  tinyint      null
);

insert users (login, pass, male) values ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
insert users (login, pass, male) values ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
insert users (login, pass, male) values ('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
insert users (login, pass, male) values ('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
insert users (login, pass, male) values ('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
insert users (login, pass, male) values ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);

insert clients (login, pass, male) values ('alexander', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
insert clients (login, pass, male) values ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
insert clients (login, pass, male) values ('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
insert clients (login, pass, male) values ('Dmitry', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
insert clients (login, pass, male) values ('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
insert clients (login, pass, male) values ('Leonid', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
insert clients (login, pass, male) values ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
insert clients (login, pass, male) values ('Olga', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
insert clients (login, pass, male) values ('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
insert clients (login, pass, male) values ('Masha', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
insert clients (login, pass, male) values ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);


-- Задание на EXISTS
create table Employee
(
    Id         int primary key,
    Name       varchar(45) not null,
    Department varchar(45) not null,
    Salary     float       not null,
    Gender     varchar(45) not null,
    Age        int         not null,
    City       varchar(45) not null
);

insert Employee (Id, `Name`, Department, Salary, Gender, Age, City) values (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
insert Employee (Id, `Name`, Department, Salary, Gender, Age, City) values (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
insert Employee (Id, `Name`, Department, Salary, Gender, Age, City) values (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
insert Employee (Id, `Name`, Department, Salary, Gender, Age, City) values (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
insert Employee (Id, `Name`, Department, Salary, Gender, Age, City) values (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
insert Employee (Id, `Name`, Department, Salary, Gender, Age, City) values (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
insert Employee (Id, `Name`, Department, Salary, Gender, Age, City) values (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
insert Employee (Id, `Name`, Department, Salary, Gender, Age, City) values (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
insert Employee (Id, `Name`, Department, Salary, Gender, Age, City) values (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
insert Employee (Id, `Name`, Department, Salary, Gender, Age, City) values (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');

create table Projects
(
    ProjectId  int primary key auto_increment,
    Title      varchar(200) not null,
    ClientId   int,
    EmployeeId int,
    StartDate  datetime,
    EndDate    datetime
);

insert Projects (Title, ClientId, EmployeeId, StartDate, EndDate)
values ('Develop ecommerse website from scratch', 1, 1003, now(), date_add(now(), interval 30 day)),
       ('WordPress website for our company', 1, 1002, now(), date_add(now(), interval 45 day)),
       ('Manage our company servers', 2, 1007, now(), date_add(now(), interval 45 day)),
       ('Hosting account is not working', 3, 1009, now(), date_add(now(), interval 7 day)),
       ('MySQL database from my desktop application', 4, 1010, now(), date_add(now(), interval 15 day)),
       ('Develop new WordPress plugin for my business website', 2, NULL, now(), date_add(now(), interval 10 day)),
       ('Migrate web application and database to new server', 2, NULL, now(), date_add(now(), interval 5 day)),
       ('Android Application development', 4, 1004, now(), date_add(now(), interval 30 day));

-- Собеседования
create table AUTO
(
    REGNUM    varchar(10) primary key,
    MARK      varchar(10),
    COLOR     varchar(15),
    RELEASEDT DATE,
    PHONENUM  varchar(15)
);


create table CITY
(
    CITYCODE int primary key,
    CITYNAME varchar(50),
    PEOPLES  int
);


create table MAN
(
    PHONENUM  varchar(15) primary key,
    FIRSTNAME varchar(50),
    LASTNAME  varchar(50),
    CITYCODE  int,
    YEAROLD   int
);


-- AUTO
insert AUTO (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM) values (111114, 'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');
insert AUTO (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM) values (111115, 'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');
insert AUTO (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM) values (111116, 'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');
insert AUTO (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM) values (111121, 'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');
insert AUTO (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM) values (111122, 'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');
insert AUTO (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM) values (111113, 'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');
insert AUTO (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM) values (111126, 'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);
insert AUTO (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM) values (111117, 'BMW', 'СИНИЙ', date'2005-01-01', null);
insert AUTO (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM) values (111119, 'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

-- CITY
insert CITY (CITYCODE, CITYNAME, PEOPLES) values (1, 'Москва', 10000000);
insert CITY (CITYCODE, CITYNAME, PEOPLES) values (2, 'Владимир', 500000);
insert CITY (CITYCODE, CITYNAME, PEOPLES) values (3, 'Орел', 300000);
insert CITY (CITYCODE, CITYNAME, PEOPLES) values (4, 'Курск', 200000);
insert CITY (CITYCODE, CITYNAME, PEOPLES) values (5, 'Казань', 2000000);
insert CITY (CITYCODE, CITYNAME, PEOPLES) values (7, 'Котлас', 110000);
insert CITY (CITYCODE, CITYNAME, PEOPLES) values (8, 'Мурманск', 400000);
insert CITY (CITYCODE, CITYNAME, PEOPLES) values (9, 'Ярославль', 500000);

-- MAN
insert MAN (PHONENUM, FIRSTNAME, LASTNAME, CITYCODE, YEAROLD) values ('9152222221', 'Андрей', 'Николаев', 1, 22);
insert MAN (PHONENUM, FIRSTNAME, LASTNAME, CITYCODE, YEAROLD) values ('9152222222', 'Максим', 'Москитов', 1, 31);
insert MAN (PHONENUM, FIRSTNAME, LASTNAME, CITYCODE, YEAROLD) values ('9153333333', 'Олег', 'Денисов', 3, 34);
insert MAN (PHONENUM, FIRSTNAME, LASTNAME, CITYCODE, YEAROLD) values ('9173333334', 'Алиса', 'Никина', 4, 31);
insert MAN (PHONENUM, FIRSTNAME, LASTNAME, CITYCODE, YEAROLD) values ('9173333335', 'Таня', 'Иванова', 4, 31);
insert MAN (PHONENUM, FIRSTNAME, LASTNAME, CITYCODE, YEAROLD) values ('9213333336', 'Алексей', 'Иванов', 7, 25);
insert MAN (PHONENUM, FIRSTNAME, LASTNAME, CITYCODE, YEAROLD) values ('9213333331', 'Андрей', 'Некрасов', 2, 27);
insert MAN (PHONENUM, FIRSTNAME, LASTNAME, CITYCODE, YEAROLD) values ('9213333332', 'Миша', 'Рогозин', 2, 21);
insert MAN (PHONENUM, FIRSTNAME, LASTNAME, CITYCODE, YEAROLD) values ('9214444444', 'Алексей', 'Галкин', 1, 38);

-- Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
-- Задание можно понять двояко, вот и держи 2 версии =)
-- v1
select COLOR,
       count(COLOR) as AMOUNT
from auto
where MARK in ('BMW', 'LADA')
group by COLOR;

-- v2
select MARK,
       COLOR,
       count(COLOR) as AMOUNT
from auto
where MARK in ('BMW', 'LADA')
group by MARK, COLOR
order by MARK, COLOR;

-- Вывести на экран марку авто и количество AUTO не этой марки
select MARK,
       count(MARK)                               as TOTAL_BMW,
       (select count(*) from auto) - count(MARK) as TOTAL_OTHER_AUTO
from auto
where MARK = 'BMW';

-- Тупо интересно было вывести для каждой марки =)
select MARK,
       count(MARK)                               as TOTAL_THIS_AUTO,
       (select count(*) from auto) - count(MARK) as TOTAL_OTHER_AUTO
from auto
group by MARK;
