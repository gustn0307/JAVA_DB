create table Person(
id VARCHAR2(20) not null PRIMARY KEY,
pw VARCHAR2(20) not null,
name VARCHAR2(20) not null
);

drop table person;

insert into person
values('test01','1111','강현수');

insert into person
values('test02','2222','차승원');
commit;

select count(*)
from person
where id='test01' and pw='2222';

insert into category
values(10101010,10000000,'가구/인테리어',100000,'DIY자재/용품',1000,'가구부속품',10,'가구다리');

commit;

select * from category;

delete from category;

commit;


