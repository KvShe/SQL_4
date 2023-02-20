create database if not exists homework_4_1;
use homework_4_1;

drop table if exists cats;
drop table if exists shops;

create table shops
(
    id        int,
    shop_name varchar(100),
    primary key (id)
);

create table cats
(
    name     varchar(100),
    id       int,
    primary key (id),
    shops_id int,
    constraint fk_cats_shops_id foreign key (shops_id)
        references shops (id)
);

insert into shops
values (1, 'Четыре лапы'),
       (2, 'Мистер Зоо'),
       (3, 'МурзиЛЛа'),
       (4, 'Кошки и собаки');

insert into cats
values ('Murzik', 1, 1),
       ('Nemo', 2, 2),
       ('Vicont', 3, 1),
       ('Zuza', 4, 3);

-- Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
select c.name, sh.shop_name
from cats as c
         left join shops sh on sh.id = c.shops_id;

-- Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
-- v1
select shop_name
from shops as sh
         join cats on sh.id = cats.shops_id
where cats.name = 'Murzik';

-- v2
select sh.shop_name
from shops as sh
where id = (select cats.shops_id from cats where name = 'Murzik');

-- v3 очень странный и необоснованно затратный способ, но вроде как работает =)
select shop_name
from shops,
     cats
where name = 'Murzik'
  and shops.id = cats.shops_id;

-- Вывести магазины, в котором НЕ продаются коты “Мурзик” и “Zuza”
select shop_name,
       name
from shops
         left join cats on cats.shops_id = shops.id
where name != 'Murzik'
  and name != 'Zuza';
