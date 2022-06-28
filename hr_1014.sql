-- employees 테이블에서  보너스를 받는 사원의 수를 계산하는 쿼리
select count(commission_pct) from employees;
-- count(컬럼명) : null 계산 안함
-- count(*) : row수 se

-- employees 테이블에서 각 부서별(department_id) salary 합은?
select department_id, sum(salary) from employees group by department_id; -- sum() null값이 포함되면 null반환

-- employees 테이블에서 각 부서별(department_id) salary + 보너스 제일 많이 받는 사원?
select department_id, salary+salary*commission_pct from employees group by department_id;

-- employees 테이블에서 각 부서별(department_id) salary + 보너스 제일 적게 받는 사원?

-- employees 테이블에서 각 부서별(department_id) salary + 보너스 의 평균?