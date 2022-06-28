--같은 지역에 사는 학생들
select * from student
where addr=(select addr from student where name='강현수');

--단일행 sub query
-- 연산자 : =, !=, <>, >, >=, <, <=

-- 같이 수강하는 학생 찾기
select * from student
where cno=(select cno from student where name='노희진');

-- 웹개발자 수업을 듣는 학생들
select * from student
where cno=(select cno from class where cname='웹개발자');

select s.*, c.cname, c.teacher 
from student s, class c
where s.cno=c.cno and s.cno=(select cno from class where cname='웹개발자')
order by s.sno;

-- cnmae이 디자인, 회계 학생들 명단 방법 3가지
select cno from class where cname in('디자인','회계'); -- in

select cno from class where cname = '디자인' or cname='회계'; -- or

select cno from class where cname ='디자인'
union
select cno from class where cname ='회계'; -- union

select s.*, c.cname -- cname도 출력
from student s, class c
where s.cno=c.cno and s.cno in(select cno from class where cname in('디자인','회계'))
order by s.sno;

select * from student
where cno in(select cno from class where cname in('디자인', '회계'));



