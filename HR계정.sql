select employee_id, first_name, last_name, department_id
from employees
where department_id=50;

select employee_id, first_name, last_name, department_id
from employees
where last_name='King';

select employee_id, first_name, last_name, department_id
from employees
where department_id BETWEEN 10 and 50 -- 범위
order by department_id; -- 정렬, 오름차순

select employee_id, first_name, last_name, department_id
from employees
where department_id in(10,30,50) -- or
order by department_id;

select employee_id, first_name, last_name, department_id
from employees
where last_name like 'Ki%'; -- 시작글자는 Ki 이고 뒤글자는 글자 수 상관없이 모든글자에 대해

select employee_id, first_name, last_name, department_id
from employees
where last_name like 'Ki__'; -- 시작글자는 Ki 이고 뒤글자는 두글자인 모든글자에 대해

select employee_id, first_name, last_name, department_id
from employees
where last_name like '%ng'; -- 뒷글자는 ng 이고 앞글자는 글자 수 상관없이 모든글자에 대해

select employee_id, first_name, last_name, department_id
from employees
where last_name like '%ng%'; -- 중간에 ng가 포함되어 있는 글자 수 상관없이 모든글자에 대해

select employee_id, first_name, last_name, department_id
from employees
where manager_id is null;

select employee_id, first_name, last_name, department_id
from employees
where manager_id is not null;

select employee_id, first_name, last_name, department_id
from employees
where salary >=10000
order by salary desc; --정렬 내림차순, 문장 맨 마지막에만 사용가능

select employee_id, first_name, e.department_id
from employees e, departments d
where e.department_id=d.department_id -- 두 테이블 중복제거
;



select r.* from(select city, lower(city) city2, upper(city)
from locations) r
where city2='roma';

select r.* from(select city, lower(city) city2, upper(city) city3
from locations) r
where city3='ROMA';

select concat(first_name, (' '||last_name)) name
from employees
where department_id=100;

select hire_date, substr(hire_date,4,5)
from employees
where department_id=100;

select substr('010-3039-0089',5,10) 전화
from dual;

select substr('19970109',1,4) 생년
from dual;

select NVL(null,0) from dual;

select salary 기본급,NVL(commission_pct,0) 추가비율, salary*NVL(commission_pct,0)+salary 총지급
from employees; -- 추가비율에 디폴트로 0을 넣어주어서 총지급 계산

