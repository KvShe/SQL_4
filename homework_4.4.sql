create database if not exists homework_4_4;
use homework_4_4;

drop table if exists test_a;
drop table if exists test_b;

create table test_a
(
    id   INT,
    data varchar(45)
);

create table test_b
(
    id INT
);

insert into test_a(id, data)
values (10, 'A'),
       (20, 'A'),
       (30, 'F'),
       (40, 'D'),
       (50, 'C');

insert into test_b(id)
values (10),
       (30),
       (50);

-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
-- v1
select *
from (select a.id as a_id,
             b.id as b_id
      from test_a as a
               left join test_b as b on b.id = a.id
      union
      select a.id as a_id,
             b.id as b_id
      from test_a as a
               right join test_b as b on b.id = a.id) as t
where t.b_id is null;

-- v2
select test_a.id,
       data
from test_a
left join test_b on test_a.id = test_b.id
where test_b.id is null;
