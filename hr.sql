create VIEW emp as 
select employee_id emp_id, first_name ||' '|| last_name name, email
from employees 
with read only; -- 읽기전용
-- view는 정의 변경(alter)에 제약이 있다
-- 데이터관리가 용이

--https://gent.tistory.com/361
--단순 뷰인 경우 INSERT, UPDATE, DELETE가 자유로우며 (NOT NULL 컬럼 주의)
--함수, UNION, GROUP BY 등을 사용한 복한 뷰인 경우 INSERT, UPDATE, DELETE가 불가능하다. 
--(조인만 사용한 복합 뷰인 경우 제한적으로 가능)

select * from emp;

drop view emp;

update emp
set email='aaa'
where emp_id=198; -- 수정, readonly 에서는 수정 불가

rollback;

select * from employees
where employee_id=198;

select * from user_role_privs;

select count(*) from employees; -- 107
select count(*) from departments; -- 27

select e.employee_id, e.first_name,e.department_id, d.department_id, d.department_name
from employees e, departments d; -- 107*27 column 출력 --> 카티션 조인(cartesian join) or 크로스 조인(cross join)이라고 함

select e.employee_id, e.first_name,e.department_id, d.department_id, d.department_name
from employees e, departments d 
where e.department_id=d.department_id; -- oracle join 문법 (equal join)

select e.employee_id, e.first_name,e.department_id, d.department_id, d.department_name
from employees e join departments d 
on (e.department_id=d.department_id); -- ANSI join 문법

-- 테이블 3개 조인, 조건 하나 추가
select e.employee_id, e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id=d.department_id and d.location_id=l.location_id and e.department_id=80; -- oracle join 문법 (equal join)

-- 테이블 3개 조인, 조건 하나 추가
select e.employee_id, e.first_name,d.department_name,l.city
from employees e join departments d 
on (e.department_id=d.department_id) -- ANSI join 문법
join locations l
on d.location_id = l.location_id and e.department_id=80;

--평가
--뷰생성
--인덱스 생성
--DML, DCL
--join
