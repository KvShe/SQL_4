create database if not exists homework_4_2;
use homework_4_2;

drop table if exists Analysis;
create table Analysis
(
    an_id    int primary key not null auto_increment,
    an_name  varchar(50),
    an_cost  int,
    an_price int,
    an_group int
);

insert analysis (an_name, an_cost, an_price, an_group)
values ('Общий анализ крови', 30, 50, 1),
       ('Биохимия крови', 150, 210, 1),
       ('Анализ крови на глюкозу', 110, 130, 1),
       ('Общий анализ мочи', 25, 40, 2),
       ('Общий анализ кала', 35, 50, 2),
       ('Общий анализ мочи', 25, 40, 2),
       ('Тест на COVID-19', 160, 210, 3);

drop table if exists GroupsAn;
create table GroupsAn
(
    gr_id   int primary key not null auto_increment,
    gr_name varchar(50),
    gr_temp float(5, 1),
    foreign key (gr_id) references Analysis (an_id)
        on delete cascade on update cascade
);

insert groupsan (gr_name, gr_temp)
values ('Анализы крови', -12.2),
       ('Общие анализы', -20.0),
       ('ПЦР-диагностика', -20.5);

select *
FROM groupsan;

drop table if exists Orders;
create table Orders
(
    ord_id       int primary key not null auto_increment,
    ord_datetime datetime, -- 'YYYY-MM-DD hh:mm:ss'
    ord_an       int,
    foreign key (ord_an) references Analysis (an_id)
        on delete cascade on update cascade
);

insert Orders (ord_datetime, ord_an)
values ('2020-02-04 07:15:25', 1),
       ('2020-02-04 07:20:50', 2),
       ('2020-02-04 07:30:04', 1),
       ('2020-02-04 07:40:57', 1),
       ('2020-02-05 07:05:14', 1),
       ('2020-02-05 07:15:15', 3),
       ('2020-02-05 07:30:49', 3),
       ('2020-02-06 07:10:10', 2),
       ('2020-02-06 07:20:38', 2),
       ('2020-02-07 07:05:09', 1),
       ('2020-02-07 07:10:54', 1),
       ('2020-02-07 07:15:25', 1),
       ('2020-02-08 07:05:44', 1),
       ('2020-02-08 07:10:39', 2),
       ('2020-02-08 07:20:36', 1),
       ('2020-02-08 07:25:26', 3),
       ('2020-02-09 07:05:06', 1),
       ('2020-02-09 07:10:34', 1),
       ('2020-02-09 07:20:19', 2),
       ('2020-02-10 07:05:55', 3),
       ('2020-02-10 07:15:08', 3),
       ('2020-02-10 07:25:07', 1),
       ('2020-02-11 07:05:33', 1),
       ('2020-02-11 07:10:32', 2),
       ('2020-02-11 07:20:17', 3),
       ('2020-02-12 07:05:36', 1),
       ('2020-02-12 07:10:54', 2),
       ('2020-02-12 07:20:19', 3),
       ('2020-02-12 07:35:38', 1);

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю
select an_name,
       an_price
from analysis as an
         join orders as ord on an.an_id = ord.ord_an
where ord.ord_datetime between '2020-02-05' and date_add('2020-02-05', interval 7 day);
