select employee_id, first_name, last_name, department_id
from employees
where department_id=50;

select employee_id, first_name, last_name, department_id
from employees
where last_name='King';

select employee_id, first_name, last_name, department_id
from employees
where department_id BETWEEN 10 and 50 -- ����
order by department_id; -- ����, ��������

select employee_id, first_name, last_name, department_id
from employees
where department_id in(10,30,50) -- or
order by department_id;

select employee_id, first_name, last_name, department_id
from employees
where last_name like 'Ki%'; -- ���۱��ڴ� Ki �̰� �ڱ��ڴ� ���� �� ������� �����ڿ� ����

select employee_id, first_name, last_name, department_id
from employees
where last_name like 'Ki__'; -- ���۱��ڴ� Ki �̰� �ڱ��ڴ� �α����� �����ڿ� ����

select employee_id, first_name, last_name, department_id
from employees
where last_name like '%ng'; -- �ޱ��ڴ� ng �̰� �ձ��ڴ� ���� �� ������� �����ڿ� ����

select employee_id, first_name, last_name, department_id
from employees
where last_name like '%ng%'; -- �߰��� ng�� ���ԵǾ� �ִ� ���� �� ������� �����ڿ� ����

select employee_id, first_name, last_name, department_id
from employees
where manager_id is null;

select employee_id, first_name, last_name, department_id
from employees
where manager_id is not null;

select employee_id, first_name, last_name, department_id
from employees
where salary >=10000
order by salary desc; --���� ��������, ���� �� ���������� ��밡��

select employee_id, first_name, e.department_id
from employees e, departments d
where e.department_id=d.department_id -- �� ���̺� �ߺ�����
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

select substr('010-3039-0089',5,10) ��ȭ
from dual;

select substr('19970109',1,4) ����
from dual;

select NVL(null,0) from dual;

select salary �⺻��,NVL(commission_pct,0) �߰�����, salary*NVL(commission_pct,0)+salary ������
from employees; -- �߰������� ����Ʈ�� 0�� �־��־ ������ ���

