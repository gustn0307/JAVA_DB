-- emp_id가 202인 사원의 입사일(05/08/17)보다 이전에 입사한 사원들 출력
select * from emp
where hire_date < (select hire_date from emp where emp_id=202)
order by hire_date;

-- 다중행 sub Query
--in (N1, N2, N3, N4), -- 여러 개중 한개만 같아도 됨
--salary > ANY(10, 20, 30, 40) --여러 개 중에 한 개만이라도 조건 만족해도 : >최소값
--salary < ANY(10, 20, 30, 40) --여러 개 중에 한 개만이라도 조건 만족해도 : <최대값
--salary > ALL(10, 20, 30, 40) --여러 개 중에 모두 조건 만족 : >최대값
--salary < ALL(10, 20, 30, 40) --여러 개 중에 모두 조건 만족 : <최소값

--job_id가 IT_PROG인 직원중에 최소급여수령자(4200) 보다 높은 직원들 출력
select * from emp
where salary>ANY(select salary from emp where job_id='IT_PROG')
order by salary;

-- 전체 사원 중에서 60번 부서의 입사일이 제일 늦은 사원(07/05/21보다 늦게 입사한 명단
select * from emp
where hire_date > all(select hire_date from emp where dept_id=60)
order by hire_date;

select hire_date from emp where dept_id=60
order by hire_date; -- 07/05/21

-- 다중 컬럼 sub query
-- dept_id 별로 최대 급여수령자, dept_id, salary
--group by : https://gent.tistory.com/366
select emp_id,name, dept_id, salary from emp
where (dept_id,salary) in (select dept_id, max(salary) from emp group by dept_id)
order by dept_id;

-- 부서 dept_id 별로 입사일(hire_date)이 가장 오래된 사원의 
--emp_id, name, dept_id, hire_date 출력하고 dept_id 오름차순으로 정렬
select emp_id,name, dept_id, hire_date from emp
where (dept_id,hire_date) in (select dept_id, max(hire_date) from emp group by dept_id)
order by dept_id;

--job_id별로 해당 직급에서 최대급여수령자의 name, job_id, salary 출력하고 salary 내림차순 정렬
select name, job_id, salary from emp
where (job_id,salary) in (select job_id,max(salary) from emp group by job_id)
order by salary desc;

-- dept_id별로 평균급여를 구하고 그 중에서 평균급여가 가장 적은 부서의 평균 급여보다 적은 직원의
--name, dept_id, salary 출력하고 salary 내림차순 정렬
select dept_id, avg(salary) from emp group by dept_id
order by avg(salary); -- 부서별 평균 급여, 가장 적은 부서의 평균급여: 3475.55(50번 부서)

select salary from emp
where salary < 3475.5
order by salary; -- 3475.5보다 급여 낮은 사람들 급여

select name, dept_id, salary from emp
where salary <all (select avg(salary) from emp group by dept_id)
order by salary desc;

select name,dept_id, salary from emp
where salary<
least((select avg(salary) from emp where dept_id=10),
(select avg(salary) from emp where dept_id=20),
(select avg(salary) from emp where dept_id=30),
(select avg(salary) from emp where dept_id=40),
(select avg(salary) from emp where dept_id=50),
(select avg(salary) from emp where dept_id=60),
(select avg(salary) from emp where dept_id=70),
(select avg(salary) from emp where dept_id=80),
(select avg(salary) from emp where dept_id=90),
(select avg(salary) from emp where dept_id=100),
(select avg(salary) from emp where dept_id=110)
)
order by salary desc;

-- emp에서 직원들 중에서 해당 부서의 평균 급여보다 같거나 많은 사람들
select dept_id, avg(salary) from emp group by dept_id; -- 부서별 평균 급여

select name, dept_id, salary from emp a
where salary >= all(select avg(salary) from emp b where a.dept_id=b.dept_id)
order by a.dept_id;


select e.name, d.dept_name from emp e, dept d where e.dept_id=d.dept_id; -- 조인쿼리

-- 스칼라쿼리(scalar query) -> 중첩for문 처럼 두 번 실행함 --> 시간 더 걸림 
--메인 쿼리를 실행한 후 스칼라 서브 쿼리에 필요한 값을 제공한다
-- scalar sub query를 수행하기 위해 필요한 데이터가 들어있는 블록을 메모리로 로딩
-- Main Query에서 주어진 조건을 가지고 필요한 값을 검색 후 이 결과를
-- 메모리에 입력값과 출력값으로 메모리 내의 query exrcution cache라는 곳에 저장함
-- 여기서 입력값은 Main Query에서 주어진 값이고 출력값은 Scalar Sub Query를 수행한 후 나온 결과값임
-- 이 값을 저장하는 캐쉬 값을 지정하는 파라미터는 _query_execution_cache_max_size 임
-- 값이 캐쉬에 존재하는지 찾고있으면 즉시 결과값을 출력하고
-- 없으면 다시 access해서 해당 값을 찾은 후 다시 메모리에 캐싱함
-- Main Query가 끝날때까지 반복
select e.name,(select dept_name from dept d where d.dept_id=e.dept_id) from emp e; 


select * from emp
where rownum<=11 -- 기존에 있는 테이블 정보에서의 행 번호
order by hire_date; 

-- 
select * from emp order by hire_date desc;

select *  from (select * from emp order by hire_date desc);

select * from
(select rownum rnum, v.*  from (select * from emp order by hire_date desc) v)
where rnum <= 10; --hire_date로 정렬한 테이블에서의 행 번호

create view e1 as 
select * from emp order by hire_date desc; -- view 생성(반복되는 구문을 view로 만들어서 코딩 줄이기)

select * from
(select rownum rnum, v.*  from e1 v)
where rnum <= 10; -- e1으로 간소화

create view e2 as
select rownum rnum, v.*  from e1 v; -- view 생성(반복되는 구문을 view로 만들어서 코딩 줄이기)

select * from
e2
where rnum between 10 and 20; -- e2로 간소화








--group by : https://gent.tistory.com/366