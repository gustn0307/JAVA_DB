-- employees ���̺���  ���ʽ��� �޴� ����� ���� ����ϴ� ����
select count(commission_pct) from employees;
-- count(�÷���) : null ��� ����
-- count(*) : row�� se

-- employees ���̺��� �� �μ���(department_id) salary ����?
select department_id, sum(salary) from employees group by department_id; -- sum() null���� ���ԵǸ� null��ȯ

-- employees ���̺��� �� �μ���(department_id) salary + ���ʽ� ���� ���� �޴� ���?
select department_id, salary+salary*commission_pct from employees group by department_id;

-- employees ���̺��� �� �μ���(department_id) salary + ���ʽ� ���� ���� �޴� ���?

-- employees ���̺��� �� �μ���(department_id) salary + ���ʽ� �� ���?