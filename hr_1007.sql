--view의 특징 : https://reeme.tistory.com/54
CREATE  VIEW EMP -- employees view 생성
AS select 
employee_id as emp_id,  -- pk
first_name ||' '|| last_name as name, -- 이름
email, -- 이메일
phone_number as phone, -- 전화번호
hire_date, -- 입사일
job_id, -- 직급
salary, -- 급여
commission_pct as com_pct, -- 추가수당비율 
manager_id as ma_id, -- 담당자(직속상관)
department_id as dept_id -- 부서번호
from employees
WITH READ ONLY; --읽기전용

CREATE  VIEW DEPT  -- departments view 생성
AS select 
department_id as dept_id, -- 부서번호
department_name dept_name, -- 부서이름
manager_id ma_id, -- 직속상관
location_id loc_id -- 위치 번호
from departments
WITH READ ONLY; --읽기전용

select * from emp;
select * from dept;

select * from emp
where dept_id=50;

select dept_id,count(*)
from emp
group by dept_id; -- dept_id에 따른 개수들 출력

--1. 30번 부서의 사원정보를 출력
select *  from emp
where dept_id=30;

--2. 100번 부서의 사원번호, 이름, 부서번호, 부서명을 출력 
--> 출력해야 하는 정보들이 두 개의 테이블에 나눠져있으므로 join을 이용
select e.emp_id, e.name, d.dept_id, d.dept_name
from emp e, dept d
where e.dept_id=d.dept_id and d.dept_id=100; -- oracle 문법

select e.emp_id, e.name, d.dept_id, d.dept_name
from emp e join dept d
on e.dept_id=d.dept_id and d.dept_id=100; -- ANSI 문법

select job_id,count(*)
from emp
group by job_id;

--job_id가 'IT_PROG'인 사람의 emp_id, emp_name, job_title을 출력
select e.emp_id 사원번호, e.name 이름, j.job_title 직책, e.salary 급여
from emp e,jobs j
where e.job_id=j.job_id and j.job_id='IT_PROG';

select e.emp_id, e.name, j.job_id, j.job_title
from emp e join jobs j
on e.job_id=j.job_id and j.job_id='IT_PROG';

--연봉(salary)이 9000$ 이상인 사람의 emp(사원번호, 이름, 직책id , 급여) dept(부서명) 출력
select e.emp_id, e.name, e.salary, e.job_id, d.dept_name
from emp e, dept d
where e.dept_id=d.dept_id  and e.salary>=9000;

--3개의 테이블 조인
select e.emp_id, e.name, e.salary, e.job_id, d.dept_name, j.job_title
from emp e, dept d, jobs j
where e.dept_id=d.dept_id and e.job_id=j.job_id
order by e.emp_id;

--com_pct null이 아닌사람
--emp_id name salary com_pct salaty*com_pct, salary+salary*com_pct 출력
select emp_id 사원번호, name 이름, salary 기본급여, com_pct 수당비율, salary*com_pct 수당, salary+salary*com_pct 총급여
from emp
where com_pct is not null
order by salary+salary*com_pct DESC;

--com_pct null이면 0으로 바꿔주고 출력
--> nvl 함수 사용 : https://meyouus.tistory.com/231
--emp_id name salary com_pct salaty*com_pct, salary+salary*com_pct 출력
select emp_id 사원번호, name 이름, salary 기본급여, nvl(com_pct,0) 수당비율, salary*nvl(com_pct,0) 수당, salary+salary*nvl(com_pct,0) 총급여 
from emp
order by salary+salary*nvl(com_pct,0) DESC;

--기본 SQL: DDL, DML, DCL, 데이터 사전검색(tablespace 확인)
--고급 SQL: 인덱스 활용, VIEW 활용, 다중테이블 검색(join, sub query, 집합연산-union)

-- view의 특징 : https://reeme.tistory.com/54, https://gent.tistory.com/361
-- nvl 함수 사용 : https://meyouus.tistory.com/231
-- 프로시저 : https://gdtbgl93.tistory.com/149
-- 인덱스 : https://coding-factory.tistory.com/419

select table_name, tablespace_name
from user_tables --tablespace 확인(dba_tables, user_tables, all_tables)
where table_name='EMPLOYEES';

-- employees 테이블의 first_name에 index를 생성, 인덱스 이름은 first_name_ix로 적용하고
-- employees 테이블의 인덱스를 확인할 수 있는 쿼리 작성
CREATE INDEX FIRST_NAME_IX ON EMPLOYEES (FIRST_NAME); -- 인덱스 생성

select * from user_indexes
where table_name='EMPLOYEES'; -- 인덱스 확인 쿼리

-- emp 테이블에서 이름에 smith가 포함된 사람 출력
--like절: https://lcs1245.tistory.com/16
select emp_id, name from emp
where name like '%Taylor'; -- 앞에 무슨 문자가 있던 Taylor가 들어가는 문자열 찾기


