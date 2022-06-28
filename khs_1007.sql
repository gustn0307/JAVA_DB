select * from class;
select * from student;

select s.sno, s.name, c.cname,c.teacher
from student s, class c; -- cross join

select s.sno, s.name, c.cname,c.teacher
from student s, class c
where s.cno=c.cno; -- equal join(oracle 문법)

select seq_sno.nextval from dual;

insert into student(sno,name,phone,addr)
values(SEQ_SNO.nextval, '이광수','010-100-1000','남양주');
commit;

select s.sno, s.name, c.cname,c.teacher
from student s join class c
on s.cno=c.cno; -- equal join(ANSI 문법)

insert into student(sno,name,phone,addr)
values(SEQ_SNO.nextval, '차승원','010-200-2000','강남');
commit;

-- ANSI 외부조인(outer join)
-- 수강신청한 18명 명단과 수강신청하지 않은 2명도 출력
-- 출력대상이 왼쪽에 있는 student row 정보 모두 출력
-- 조인 조건에 해당하지 않은 row(cno가 null)는 class 정보가 null로 출력
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s left outer join class c 
on s.cno=c.cno 
order by s.sno;

-- ORACLE left 외부조인(outer join)
-- 수강신청한 18명 명단과 수강신청하지 않은 2명도 출력
-- 조인 조건에 해당하지 않은 row(cno가 null)에 (+) 기호 사용해서  class 정보 null로 출력
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s , class c 
where s.cno=c.cno(+) -- equal join(oracle 문법)
order by s.sno;

-- ANSI right outer join
--등가조건에 해당하는 명단은 다 출력, 18명은 출력
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s right outer join class c -- ANSI join : left or right 기준으로 조건에 맞지않는 것도 null로 출력
on s.cno=c.cno -- equal join(ANSI 문법)
order by s.sno;

-- ANSI full outer join
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s full outer join class c -- ANSI join : left or right 기준으로 조건에 맞지않는 것도 null로 출력
on s.cno=c.cno -- equal join(ANSI 문법)
order by s.sno;

-- ORACLE full 외부조인(outer join)
-- 조인 조건에 해당하지 않은 row(cno가 null)에 (+) 기호 사용해서  class 정보 null로 출력
-- union은 중복제거, union all은 중복 제거 안함
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s , class c 
where s.cno=c.cno(+) 
union -- 집합연산 수행
select s.sno, s.name, s.phone, c.cname, c.teacher
from student s , class c 
where s.cno(+)=c.cno; 

-- join 연습
--1. 웹개발자 수강중인 학생명단 출력
--(학번,이름,수강과목,강사)
select  s.sno,s.name,c.cname,c.teacher
from student s, class c
where s.cno=c.cno and c.cname='웹개발자';

--2. 노원지역 거주중인 수강중인 학생명단 출력
--(학번,이름,주소,수강과목,강사)
select  s.sno,s.name,s.addr,c.cname,c.teacher
from student s, class c
where s.cno=c.cno and s.addr='노원';

--3. cno 1 : 웹개발자 수강인원은?
select count(*) 수강인원
from student
where cno=1;

select cno
from student
where cno=1;

--select cno, count(*) 수강인원 -- 행의 개수가 달라 오류 발생
--from student
--where cno=1;

select s.cno, c.cname, count(*) 수강인원 
from student s, class c
where s.cno=c.cno and cname='웹개발자'
group by cno; -- group으로 만들어서 함께 출력

select cno, count(cno) 수강인원
from student
group by cno
having cno is not null
order by cno;

select cno, count(cno) 수강인원
from student
group by cno
having count(cno)!=0
order by cno;

-- union
--select문으로 나타내는 컬럼수가 같아야하고 각 컬럼의 데이터 타입이 같아야함
select sno, name,cname from student ,class  where student.cno=class.cno and cname='웹개발자'
union
select sno, name,cname from student , class  where student.cno=class.cno and cname='디자인'
order by cname;

select sno, name, addr from student where addr='노원'
union
select sno, name, addr from student where addr='강남'
order by addr;




