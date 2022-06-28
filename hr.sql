create VIEW emp as 
select employee_id emp_id, first_name ||' '|| last_name name, email
from employees 
with read only; -- �б�����
-- view�� ���� ����(alter)�� ������ �ִ�
-- �����Ͱ����� ����

--https://gent.tistory.com/361
--�ܼ� ���� ��� INSERT, UPDATE, DELETE�� �����ο�� (NOT NULL �÷� ����)
--�Լ�, UNION, GROUP BY ���� ����� ���� ���� ��� INSERT, UPDATE, DELETE�� �Ұ����ϴ�. 
--(���θ� ����� ���� ���� ��� ���������� ����)

select * from emp;

drop view emp;

update emp
set email='aaa'
where emp_id=198; -- ����, readonly ������ ���� �Ұ�

rollback;

select * from employees
where employee_id=198;

select * from user_role_privs;

select count(*) from employees; -- 107
select count(*) from departments; -- 27

select e.employee_id, e.first_name,e.department_id, d.department_id, d.department_name
from employees e, departments d; -- 107*27 column ��� --> īƼ�� ����(cartesian join) or ũ�ν� ����(cross join)�̶�� ��

select e.employee_id, e.first_name,e.department_id, d.department_id, d.department_name
from employees e, departments d 
where e.department_id=d.department_id; -- oracle join ���� (equal join)

select e.employee_id, e.first_name,e.department_id, d.department_id, d.department_name
from employees e join departments d 
on (e.department_id=d.department_id); -- ANSI join ����

-- ���̺� 3�� ����, ���� �ϳ� �߰�
select e.employee_id, e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id=d.department_id and d.location_id=l.location_id and e.department_id=80; -- oracle join ���� (equal join)

-- ���̺� 3�� ����, ���� �ϳ� �߰�
select e.employee_id, e.first_name,d.department_name,l.city
from employees e join departments d 
on (e.department_id=d.department_id) -- ANSI join ����
join locations l
on d.location_id = l.location_id and e.department_id=80;

--��
--�����
--�ε��� ����
--DML, DCL
--join
