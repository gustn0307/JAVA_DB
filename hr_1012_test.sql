select * from user_tables;

-- 2.a
CREATE INDEX LAST_NAME_IX ON EMPLOYEES (LAST_NAME);

-- 2.b
select * from user_indexes;

-- 3.a
create view emp
as select
employee_id emp_id,
first_name||' '||last_name name,
hire_date,
salary sal,
department_id dept_id
from employees
with read only;

-- 3.b
create view dept
as select
department_id dept_id,
department_name dept_name,
manager_id mgr_id,
location_id loc_id
from departments
with read only;

-- 3.c
create view loc
as select
location_id loc_id,
street_address addr,
postal_code post,
city,
state_province state
from locations
with read only;

-- 4.a(oracle)
select emp_id, name, dept_name from emp, dept
where emp.dept_id=dept.dept_id;

-- 4.b(ansi)
select emp_id, name, dept_name from emp join dept
on emp.dept_id=dept.dept_id;

-- 5.
select name, dept_name from emp e,dept d
where e.dept_id=d.dept_id and e.name like '%King%';

-- 6
select e.emp_id, e.name, d.dept_name, l.city
from emp e, dept d, loc l
where e.dept_id=d.dept_id and d.loc_id=l.loc_id
order by emp_id;

-- 7.a(ORACLE)
select e.emp_id, e.name, d.dept_name
from emp e, dept d
where e.dept_id=d.dept_id(+);

-- 7.b(ANSI)
select e.emp_id, e.name, d.dept_name
from emp e left outer join dept d
on e.dept_id=d.dept_id;

-- 8.a
select e.emp_id, e.name, d.dept_name
from emp e, dept d
where e.dept_id(+)=d.dept_id;

-- 8.b
select e.emp_id, e.name, d.dept_name
from emp e right outer join dept d
on e.dept_id=d.dept_id;

-- 9.
select emp_id, name, sal from emp
where sal >(select avg(sal) from emp)
order by sal;

-- 10. 6900
select emp_id, name, sal from emp
where sal > all(select min(sal) from emp where dept_id=100)
order by sal;

-- 11
select emp_id, name, sal from emp
where (dept_id, sal) in (select dept_id,max(sal) from emp group by dept_id);

-- 12.
select * from
(select rownum rnum, v.*  from (select * from emp order by hire_date desc) v)
where rnum between 10 and 20; --hire_date로 정렬한 테이블에서의 행 번호

select * from emp order by hire_date desc;

--13. 
select emp_id, name, dept_name from emp e, dept d
where e.dept_id=d.dept_id and dept_name='IT' 
union
select emp_id, name, dept_name from emp e, dept d
where e.dept_id=d.dept_id and dept_name='Sales';
