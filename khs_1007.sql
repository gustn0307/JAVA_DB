select * from class;
select * from student;

select s.sno, s.name, c.cname,c.teacher
from student s, class c; -- cross join

select s.sno, s.name, c.cname,c.teacher
from student s, class c
where s.cno=c.cno; -- equal join(oracle ����)

select seq_sno.nextval from dual;

insert into student(sno,name,phone,addr)
values(SEQ_SNO.nextval, '�̱���','010-100-1000','������');
commit;

select s.sno, s.name, c.cname,c.teacher
from student s join class c
on s.cno=c.cno; -- equal join(ANSI ����)

insert into student(sno,name,phone,addr)
values(SEQ_SNO.nextval, '���¿�','010-200-2000','����');
commit;

-- ANSI �ܺ�����(outer join)
-- ������û�� 18�� ��ܰ� ������û���� ���� 2�� ���
-- ��´���� ���ʿ� �ִ� student row ���� ��� ���
-- ���� ���ǿ� �ش����� ���� row(cno�� null)�� class ������ null�� ���
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s left outer join class c 
on s.cno=c.cno 
order by s.sno;

-- ORACLE left �ܺ�����(outer join)
-- ������û�� 18�� ��ܰ� ������û���� ���� 2�� ���
-- ���� ���ǿ� �ش����� ���� row(cno�� null)�� (+) ��ȣ ����ؼ�  class ���� null�� ���
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s , class c 
where s.cno=c.cno(+) -- equal join(oracle ����)
order by s.sno;

-- ANSI right outer join
--����ǿ� �ش��ϴ� ����� �� ���, 18���� ���
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s right outer join class c -- ANSI join : left or right �������� ���ǿ� �����ʴ� �͵� null�� ���
on s.cno=c.cno -- equal join(ANSI ����)
order by s.sno;

-- ANSI full outer join
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s full outer join class c -- ANSI join : left or right �������� ���ǿ� �����ʴ� �͵� null�� ���
on s.cno=c.cno -- equal join(ANSI ����)
order by s.sno;

-- ORACLE full �ܺ�����(outer join)
-- ���� ���ǿ� �ش����� ���� row(cno�� null)�� (+) ��ȣ ����ؼ�  class ���� null�� ���
-- union�� �ߺ�����, union all�� �ߺ� ���� ����
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s , class c 
where s.cno=c.cno(+) 
union -- ���տ��� ����
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s , class c 
where s.cno(+)=c.cno; 

-- join ����
--1. �������� �������� �л���� ���
--(�й�,�̸�,��������,����)
select  s.sno,s.name,c.cname,c.teacher
from student s, class c
where s.cno=c.cno and c.cname='��������';

--2. ������� �������� �������� �л���� ���
--(�й�,�̸�,�ּ�,��������,����)
select  s.sno,s.name,s.addr,c.cname,c.teacher
from student s, class c
where s.cno=c.cno and s.addr='���';

--3. cno 1 : �������� �����ο���?
select count(*) �����ο�
from student
where cno=1;

select cno
from student
where cno=1;

--select cno, count(*) �����ο� -- ���� ������ �޶� ���� �߻�
--from student
--where cno=1;

select s.cno, c.cname, count(*) �����ο� 
from student s, class c
where s.cno=c.cno and cname='��������'
group by cno; -- group���� ���� �Բ� ���

select cno, count(cno) �����ο�
from student
group by cno
having cno is not null
order by cno;

select cno, count(cno) �����ο�
from student
group by cno
having count(cno)!=0
order by cno;

-- union
--select������ ��Ÿ���� �÷����� ���ƾ��ϰ� �� �÷��� ������ Ÿ���� ���ƾ���
select sno, name,cname from student ,class  where student.cno=class.cno and cname='��������'
union
select sno, name,cname from student , class  where student.cno=class.cno and cname='������'
order by cname;

select sno, name, addr from student where addr='���'
union
select sno, name, addr from student where addr='����'
order by addr;




