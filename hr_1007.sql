--view�� Ư¡ : https://reeme.tistory.com/54
CREATE  VIEW EMP -- employees view ����
AS select 
employee_id as emp_id,  -- pk
first_name ||' '|| last_name as name, -- �̸�
email, -- �̸���
phone_number as phone, -- ��ȭ��ȣ
hire_date, -- �Ի���
job_id, -- ����
salary, -- �޿�
commission_pct as com_pct, -- �߰�������� 
manager_id as ma_id, -- �����(���ӻ��)
department_id as dept_id -- �μ���ȣ
from employees
WITH READ ONLY; --�б�����

CREATE  VIEW DEPT  -- departments view ����
AS select 
department_id as dept_id, -- �μ���ȣ
department_name dept_name, -- �μ��̸�
manager_id ma_id, -- ���ӻ��
location_id loc_id -- ��ġ ��ȣ
from departments
WITH READ ONLY; --�б�����

select * from emp;
select * from dept;

select * from emp
where dept_id=50;

select dept_id,count(*)
from emp
group by dept_id; -- dept_id�� ���� ������ ���

--1. 30�� �μ��� ��������� ���
select *  from emp
where dept_id=30;

--2. 100�� �μ��� �����ȣ, �̸�, �μ���ȣ, �μ����� ��� 
--> ����ؾ� �ϴ� �������� �� ���� ���̺� �����������Ƿ� join�� �̿�
select e.emp_id, e.name, d.dept_id, d.dept_name
from emp e, dept d
where e.dept_id=d.dept_id and d.dept_id=100; -- oracle ����

select e.emp_id, e.name, d.dept_id, d.dept_name
from emp e join dept d
on e.dept_id=d.dept_id and d.dept_id=100; -- ANSI ����

select job_id,count(*)
from emp
group by job_id;

--job_id�� 'IT_PROG'�� ����� emp_id, emp_name, job_title�� ���
select e.emp_id �����ȣ, e.name �̸�, j.job_title ��å, e.salary �޿�
from emp e,jobs j
where e.job_id=j.job_id and j.job_id='IT_PROG';

select e.emp_id, e.name, j.job_id, j.job_title
from emp e join jobs j
on e.job_id=j.job_id and j.job_id='IT_PROG';

--����(salary)�� 9000$ �̻��� ����� emp(�����ȣ, �̸�, ��åid , �޿�) dept(�μ���) ���
select e.emp_id, e.name, e.salary, e.job_id, d.dept_name
from emp e, dept d
where e.dept_id=d.dept_id  and e.salary>=9000;

--3���� ���̺� ����
select e.emp_id, e.name, e.salary, e.job_id, d.dept_name, j.job_title
from emp e, dept d, jobs j
where e.dept_id=d.dept_id and e.job_id=j.job_id
order by e.emp_id;

--com_pct null�� �ƴѻ��
--emp_id name salary com_pct salaty*com_pct, salary+salary*com_pct ���
select emp_id �����ȣ, name �̸�, salary �⺻�޿�, com_pct �������, salary*com_pct ����, salary+salary*com_pct �ѱ޿�
from emp
where com_pct is not null
order by salary+salary*com_pct DESC;

--com_pct null�̸� 0���� �ٲ��ְ� ���
--> nvl �Լ� ��� : https://meyouus.tistory.com/231
--emp_id name salary com_pct salaty*com_pct, salary+salary*com_pct ���
select emp_id �����ȣ, name �̸�, salary �⺻�޿�, nvl(com_pct,0) �������, salary*nvl(com_pct,0) ����, salary+salary*nvl(com_pct,0) �ѱ޿� 
from emp
order by salary+salary*nvl(com_pct,0) DESC;

--�⺻ SQL: DDL, DML, DCL, ������ �����˻�(tablespace Ȯ��)
--��� SQL: �ε��� Ȱ��, VIEW Ȱ��, �������̺� �˻�(join, sub query, ���տ���-union)

-- view�� Ư¡ : https://reeme.tistory.com/54, https://gent.tistory.com/361
-- nvl �Լ� ��� : https://meyouus.tistory.com/231
-- ���ν��� : https://gdtbgl93.tistory.com/149
-- �ε��� : https://coding-factory.tistory.com/419

select table_name, tablespace_name
from user_tables --tablespace Ȯ��(dba_tables, user_tables, all_tables)
where table_name='EMPLOYEES';

-- employees ���̺��� first_name�� index�� ����, �ε��� �̸��� first_name_ix�� �����ϰ�
-- employees ���̺��� �ε����� Ȯ���� �� �ִ� ���� �ۼ�
CREATE INDEX FIRST_NAME_IX ON EMPLOYEES (FIRST_NAME); -- �ε��� ����

select * from user_indexes
where table_name='EMPLOYEES'; -- �ε��� Ȯ�� ����

-- emp ���̺��� �̸��� smith�� ���Ե� ��� ���
--like��: https://lcs1245.tistory.com/16
select emp_id, name from emp
where name like '%Taylor'; -- �տ� ���� ���ڰ� �ִ� Taylor�� ���� ���ڿ� ã��


