--���� ������ ��� �л���
select * from student
where addr=(select addr from student where name='������');

--������ sub query
-- ������ : =, !=, <>, >, >=, <, <=

-- ���� �����ϴ� �л� ã��
select * from student
where cno=(select cno from student where name='������');

-- �������� ������ ��� �л���
select * from student
where cno=(select cno from class where cname='��������');

select s.*, c.cname, c.teacher 
from student s, class c
where s.cno=c.cno and s.cno=(select cno from class where cname='��������')
order by s.sno;

-- cnmae�� ������, ȸ�� �л��� ��� ��� 3����
select cno from class where cname in('������','ȸ��'); -- in

select cno from class where cname = '������' or cname='ȸ��'; -- or

select cno from class where cname ='������'
union
select cno from class where cname ='ȸ��'; -- union

select s.*, c.cname -- cname�� ���
from student s, class c
where s.cno=c.cno and s.cno in(select cno from class where cname in('������','ȸ��'))
order by s.sno;

select * from student
where cno in(select cno from class where cname in('������', 'ȸ��'));



