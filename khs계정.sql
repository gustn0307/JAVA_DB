create table Person(
id VARCHAR2(20) not null PRIMARY KEY,
pw VARCHAR2(20) not null,
name VARCHAR2(20) not null
);

drop table person;

insert into person
values('test01','1111','������');

insert into person
values('test02','2222','���¿�');
commit;

select count(*)
from person
where id='test01' and pw='2222';

insert into category
values(10101010,10000000,'����/���׸���',100000,'DIY����/��ǰ',1000,'�����μ�ǰ',10,'�����ٸ�');

commit;

select * from category;

delete from category;

commit;


