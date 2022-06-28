--������ �����ͺ��̽�: �ߺ��� �ּ�ȭ�ϰ� �������� �ϰ��������� ���� ����ȭ ���̺��� ���ҽ��� ���� ���� �Ϲ��� 
--���ҵǾ� �ִ� ���̺��� �����ؼ� ����� ���;� ���ϴ� ����� ���� �� �ִ�
--���� ���̺��� �˻��� �ϱ����� ���: join, ��������, ���տ���

--join
--��������, �ܺ�����

--��������(cross join: īƼ�� ��) - �� ���̺��� �� ������ �� ����� ���´�
--���̺� �̸��� ����Ѵ� alias(����)�� ��밡��
--���̺�� �ڿ� ������ �ΰ� �����ǰ� 30�ڱ��� ����
--�ش��ϴ� sql ���忡���� ��ȿ
select employee_id, email, department_name
from employees e, departments d;

--�Ϲ����� ����, ���� ���� ���
--��������(equal join)
--�� ���̺��� ���� �÷��� '=' �񱳸� ���ؼ� ���� ���� ������ �ೢ�� �����ϴ� ���
select employee_id, email, department_name
from employees e, departments d
where e.department_id=d.department_id;

-- ��Ī�� ����ϸ� �ش� ���̺��� �÷��� ���� �ÿ��� ������ ��Ī���� ����
select employee_id, email, department_name
from employees e, departments d
where e.department_id=departments.department_id;

--�ڿ� ����(natural join)
--�� ���̺��� ������ �÷����� '���' ��������(equal join)�� ������ ����� �����ϴ� ���
--���̺� ���̿� natural join Ű���� ���, ��Ī ���Ұ�
--department_id, manager_id  �� �÷��� �����ϰ� �����ϹǷ� �� �÷��� �������� ó��
select employee_id, email, department_name, department_id
from employees natural join departments;

select employee_id, email, department_name
from employees e, departments d
where e.department_id=d.department_id
and e.manager_id=d.manager_id;


--outer join ������(+)�� null�� �����Ѵ� �÷��ʿ� ǥ��
--in �����ڿ� �Բ� ���Ұ�
--or �����ڷ� �ٸ� ���ǰ� ���պҰ�
--left outer join, rifgt outer join, full outer join
--oracle ������ + �����ڷ�, ansi������ left outer join, rifgt outer join, full outer join �����ڷ� 
--�÷������� on������ ����

--left outer join
--���� ���� ��Ҵ� ��� ����� �ǰ� ������ ���̺��� �÷����� null ���
select e.employee_id, e.email, d.department_name, d.department_id
from employees e left outer join departments d
on e.department_id=d.department_id
order by 1;

select e.employee_id, e.email, d.department_name, d.department_id
from employees e , departments d
where e.department_id=d.department_id(+)
order by 1;

--right outer join
--������ ���� ��Ҵ� ��� ����� �ǰ� ���� ���̺��� �÷����� null ���
select e.employee_id, e.email, d.department_name, d.department_id
from employees e right outer join departments d
on e.department_id=d.department_id
order by 1;

select e.employee_id, e.email, d.department_name, d.department_id
from employees e , departments d
where e.department_id(+)=d.department_id
order by 1;

--full outer join
--���� ���ؿ�� ��� ���(cross join�� ����)
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
--�ϳ��� ���̺� ���� �ִ� Į������ �����ϴ� ���θ� �ʿ��� ��쿡 ���
--���� ����� �ڱ� �ڽ� �ϳ���� �͸� ���� equal ���ΰ� ����
--where ��  FK�÷� = PK�÷�
select e1.employee_id, e1.first_name, e1.manager_id, e2.first_name 
from employees e1, employees e2
where e1.manager_id=e2.employee_id(+)
order by 1;

select e1.employee_id, e1.first_name, e1.manager_id, e2.first_name 
from employees e1 left outer join employees e2
on e1.manager_id=e2.employee_id(+)
order by 1;

--sub query
--SQL�� �ȿ� ���Ե� �� �ٸ� SQL���� ���Ѵ�
--���������� �뵵�� �˷����� ���� ������ ���� �˻��� ���� ���
--��ø �ݺ������� �����ϸ� ��

--�������� �ۼ��� ���ǻ���
--Ư���� ���(Top-n �м� ��)�� �����ϰ�� ������������ order by ���� �� �� ����
--�������� �κ��� where�������� ������ �����ʿ� ��ġ�ؾ� �ϸ� �ݵ�� ��ȣ�� ���������
--���� �� ���������� ���� �� ���� ������ ���� �����ڸ� �� �����ؾ���
--����
--1. �����ϴ� ����̳� ��ȯ�Ǵ� �������� ���¿� ���� �з�
--*�񿬰� ��������: ���������� ���������� �÷��� ������ ���� ���� ����
--                ���������� ������������ ����� ������� �����ϴ� �뵵

--*���� ��������: ���������� ���������� �÷��� ������ �ִ� ����
--              ���������� ���� ����Ǿ� ���� ����� ���������� ���ǿ� �´��� Ȯ���ϰ��� �� ��� ���

2. ��ȯ�ϴ� �������� ����
--���� �� ����: ���������� ����� �׻� 1�� ������ ��������
--            ���� �� �� ������(=, >, <, >=, <=, !=(<>))
select salary from employees where employee_id=159 --��������
select * from employees
where salary>(select salary from employees where employee_id=159);

--���� �� ����: ���������� ����� 2�� �̻��� ��������
--             ���� �� �� ������(all, in, any)
select salary from employees where department_id=100; --��������
--12008 9000 8200 7700 7800 6900

select * from employees
where salary > all(select salary from employees where department_id=100); -- all�� ��� ���� ����

--100�� �μ��� �������� �����޿�(6900)���� �� ���� �޴� �����
select * from employees
where salary > any(select salary from employees where department_id=100); -- any�� ���� ���� ���� ����

--100�� �μ��� �������� �ְ�޿�����(12008) �� ���� �޴� �����
select * from employees
where salary < any(select salary from employees where department_id=100); -- all�� ��� ���� ����

--���� �÷� ��������: ���������� ����� ���� �÷����� ��ȯ�Ǵ� ��������
--                  ���������� �������� ���� �÷��� ���ÿ� ���� ��, 
--                  ���������� ������������ ���ϴ� �÷� ������ ��ġ�� ����
select department_id, max(salary) from employees group by department_id;

select * from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);

select department_id, avg(salary) from employees group by department_id;

select * from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);

select * from employees
where (department_id, hire_date) in
(select department_id, min(hire_date) from employees group by department_id);

--�μ��� ��տ��� ���ϰ� �� �߿��� ��տ����� ���� ���� �μ��� ��� �������� ���� �޴� ������
select department_id, avg(salary) from employees group by department_id;

select * from employees e1
where salary>=
(select avg(salary) from employees e2 where e1.department_id=e2.department_id);

--��Į�� ��������(scalar sub query): select list���� ���������� ���� ��, �̸� ��Į�� ����������� �Ѵ�
--���� �� ����� �����ؾ���
--��ġ�ϴ� �����Ͱ� ������ null ���� �����մϴ�(�������� ���ذ� ���������� left outer join�� ���ϰ��)
--�׷��ռ��� Ư¡ �� �ϳ��ε� ��Į�� �������� ���� �� Ư¡�� ������ �ִ�.

--�������
--1. ���������� ������ �� ��Į�� ���������� �ʿ��� ���� ����
--2. ��Į�� ���������� �����ϱ� ���� �ȿ��� �����Ͱ� ����ִ� ����� �޸𸮷� �ε�
--3. ������������ �־��� ������ ������ �ʿ��� ���� �˻� �� ����� �޸� �Է°��� ��°�����
--    �޸� ���� query execution cache��� ���� ����. �Է°��� ������������ �־��� ���̰�
--    ��°��� ��Į�� ���������� ���� �� ���� ��� ��, �� ���� �����ϴ� ĳ�� ���� �����ϴ� �Ķ���ʹ� 
--    _query_execution_cache_max_size �̴�.
--4. ���� ������ ������������ ��Į�� ���������� ������ �ؽ��Լ��� �̿��ؼ� �ش簪�� ĳ���� �����ϴ��� ã��,
--    ������ ��� ��� ���� ����ϰ�, ������ �ٽ� ����� �������ؼ� �ش� ���� ã�� �� �ٽ� �޸𸮿� ĳ����
--5. ���������� ���������� �ݺ�


--��������
select e.employee_id, email, department_name
from employees e, departments d
where e.department_id=d.department_id(+)
order by 1;

--��Į�� ��������
select e.employee_id, email, (select department_name from departments d where d.department_id=e.department_id)
from employees e
order by 1;





