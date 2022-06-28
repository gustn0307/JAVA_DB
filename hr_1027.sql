--관계형 데이터베이스: 중복을 최소화하고 데이터읜 일관성유지를 위해 정규화 테이블을 분할시켜 놓은 것이 일반적 
--분할되어 있는 테이블을 병합해서 결과를 얻어와야 원하는 결과를 얻을 수 있다
--여러 테이블에서 검색을 하기위한 방법: join, 서브쿼리, 집합연산

--join
--내부조인, 외부조인

--교차조인(cross join: 카티션 곱) - 두 테이블의 행 개수의 곱 결과가 나온다
--테이블 이름을 대신한는 alias(별명)을 사용가능
--테이블명 뒤에 공백을 두고 만들면되고 30자까지 가능
--해당하는 sql 문장에서만 유효
select employee_id, email, department_name
from employees e, departments d;

--일반적인 조인, 가장 많이 사용
--동등조인(equal join)
--두 테이블에서 공통 컬럼을 '=' 비교를 통해서 같은 값을 가지는 행끼리 조인하는 방법
select employee_id, email, department_name
from employees e, departments d
where e.department_id=d.department_id;

-- 별칭을 사용하면 해당 테이블의 컬럼에 접근 시에는 무조건 별칭으로 접근
select employee_id, email, department_name
from employees e, departments d
where e.department_id=departments.department_id;

--자연 조인(natural join)
--두 테이블에서 동일한 컬럼명이 '모두' 동등조인(equal join)을 적용한 결과로 조인하는 방법
--테이블 사이에 natural join 키워드 명시, 별칭 사용불가
--department_id, manager_id  두 컬럼이 동일하게 존재하므로 두 컬럼을 동등조인 처리
select employee_id, email, department_name, department_id
from employees natural join departments;

select employee_id, email, department_name
from employees e, departments d
where e.department_id=d.department_id
and e.manager_id=d.manager_id;


--outer join 연산자(+)는 null이 존재한느 컬럼쪽에 표시
--in 연산자와 함께 사용불가
--or 연산자로 다른 조건과 결합불가
--left outer join, rifgt outer join, full outer join
--oracle 문법은 + 연산자로, ansi문법은 left outer join, rifgt outer join, full outer join 연산자로 
--컬럼조건은 on절에서 적용

--left outer join
--왼쪽 기준 요소는 모두 출력이 되고 오른쪽 테이블의 컬럼에는 null 출력
select e.employee_id, e.email, d.department_name, d.department_id
from employees e left outer join departments d
on e.department_id=d.department_id
order by 1;

select e.employee_id, e.email, d.department_name, d.department_id
from employees e , departments d
where e.department_id=d.department_id(+)
order by 1;

--right outer join
--오른쪽 기준 요소는 모두 출력이 되고 왼쪽 테이블의 컬럼에는 null 출력
select e.employee_id, e.email, d.department_name, d.department_id
from employees e right outer join departments d
on e.department_id=d.department_id
order by 1;

select e.employee_id, e.email, d.department_name, d.department_id
from employees e , departments d
where e.department_id(+)=d.department_id
order by 1;

--full outer join
--양쪽 기준요소 모두 출력(cross join과 같다)
select e.employee_id, e.email, d.department_name, d.department_id
from employees e full outer join departments d
on e.department_id=d.department_id
order by 1;

select e.employee_id, e.email, d.department_name, d.department_id
from employees e , departments d
where e.department_id(+)=d.department_id 
union
select e.employee_id, e.email, d.department_name, d.department_id
from employees e , departments d
where e.department_id=d.department_id(+)
order by 1;

--self join
--하나의 테이블 내에 있는 칼럼끼리 연결하는 조인만 필요한 경우에 사용
--조인 대상이 자기 자신 하나라는 것만 빼면 equal 조인과 동일
--where 절  FK컬럼 = PK컬럼
select e1.employee_id, e1.first_name, e1.manager_id, e2.first_name 
from employees e1, employees e2
where e1.manager_id=e2.employee_id(+)
order by 1;

select e1.employee_id, e1.first_name, e1.manager_id, e2.first_name 
from employees e1 left outer join employees e2
on e1.manager_id=e2.employee_id(+)
order by 1;

--sub query
--SQL문 안에 포함된 또 다른 SQL문을 말한다
--서브쿼리의 용도는 알려지지 않은 기준을 위한 검색을 위해 사용
--중첩 반복문으로 생각하면 됨

--서브쿼리 작성시 주의사항
--특별한 경우(Top-n 분석 등)를 제외하고는 서브쿼리절에 order by 절이 올 수 없다
--서브쿼리 부분은 where절에서는 연산자 오른쪽에 위치해야 하며 반드시 괄호로 묶어줘야함
--단일 행 서브쿼리와 다중 행 서브 쿼리에 따라 연산자를 잘 선택해야함
--유형
--1. 동작하는 방식이나 반환되는 데이터의 형태에 따라 분류
--*비연관 서브쿼리: 서브쿼리가 메인쿼리의 컬럼을 가지고 있지 않은 형태
--                메인쿼리에 서브쿼리에서 실행된 결과값을 제공하는 용도

--*연관 서브쿼리: 서브쿼리가 메인쿼리의 컬럼을 가지고 있는 형태
--              메인쿼리가 먼저 수행되어 얻은 결과와 서브쿼리의 조건에 맞는지 확인하고자 할 경우 사용

2. 반환하는 데이터의 형태
--단일 행 쿼리: 서브쿼리의 결과가 항상 1개 이하의 서브쿼리
--            단일 행 비교 연산자(=, >, <, >=, <=, !=(<>))
select salary from employees where employee_id=159 --서브쿼리
select * from employees
where salary>(select salary from employees where employee_id=159);

--다중 행 쿼리: 서브쿼리의 결과가 2개 이상인 서브쿼리
--             다중 행 비교 연산자(all, in, any)
select salary from employees where department_id=100; --서브쿼리
--12008 9000 8200 7700 7800 6900

select * from employees
where salary > all(select salary from employees where department_id=100); -- all은 모든 조건 만족

--100번 부서의 직원들의 최저급여(6900)보다 더 많이 받는 사람들
select * from employees
where salary > any(select salary from employees where department_id=100); -- any은 가장 작은 조건 만족

--100번 부서의 직원들의 최고급여보다(12008) 더 적게 받는 사람들
select * from employees
where salary < any(select salary from employees where department_id=100); -- all은 모든 조건 만족

--다중 컬럼 서브쿼리: 서브쿼리의 결과가 여러 컬럼으로 반환되는 서브쿼리
--                  메인쿼리의 조건절에 여러 컬럼을 동시에 비교할 때, 
--                  서브쿼리와 메인쿼리에서 비교하는 컬럼 개수의 위치가 동일
select department_id, max(salary) from employees group by department_id;

select * from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);

select department_id, avg(salary) from employees group by department_id;

select * from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);

select * from employees
where (department_id, hire_date) in
(select department_id, min(hire_date) from employees group by department_id);

--부서별 평균연봉 구하고 그 중에서 평균연봉이 가장 적은 부서의 평균 연봉보다 적게 받는 직원들
select department_id, avg(salary) from employees group by department_id;

select * from employees e1
where salary>=
(select avg(salary) from employees e2 where e1.department_id=e2.department_id);

--스칼라 서브쿼리(scalar sub query): select list에서 서브쿼리가 사용될 떄, 이를 스칼라 서브쿼리라고 한다
--단일 행 결과만 리턴해야함
--일치하는 데이터가 없더라도 null 값을 리턴합니다(메인쿼리 기준과 서브쿼리의 left outer join과 동일결과)
--그룹합수의 특징 중 하나인데 스칼라 서브쿼리 또한 이 특징을 가지고 있다.

--실행순서
--1. 메인쿼리를 수행한 후 스칼라 서브쿼리에 필요한 값을 제공
--2. 스칼라 서브쿼리를 수행하기 위해 팔요한 데이터가 들어있는 블록을 메모리로 로딩
--3. 메인쿼리에서 주어진 조건을 가지고 필요한 값을 검색 후 결과를 메모리 입력값과 출력값으로
--    메모리 내의 query execution cache라는 곳에 저장. 입력값은 메인쿼리에서 주어진 값이고
--    출력값은 스칼라 서브쿼리를 수행 후 나온 결과 값, 이 값을 저장하는 캐쉬 값을 지정하는 파라미터는 
--    _query_execution_cache_max_size 이다.
--4. 다음 조건이 메인쿼리에서 스칼라 서브쿼리로 들어오면 해쉬함수를 이용해서 해당값이 캐쉬에 존재하는지 찾고,
--    있으면 즉시 결과 값을 출력하고, 없으면 다시 블록을 엑세스해서 해당 값을 찾은 후 다시 메모리에 캐싱함
--5. 메인쿼리가 끝날때까지 반복


--조인쿼리
select e.employee_id, email, department_name
from employees e, departments d
where e.department_id=d.department_id(+)
order by 1;

--스칼라 서브쿼리
select e.employee_id, email, (select department_name from departments d where d.department_id=e.department_id)
from employees e
order by 1;





