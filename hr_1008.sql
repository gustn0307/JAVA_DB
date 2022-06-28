-- emp_id�� 202�� ����� �Ի���(05/08/17)���� ������ �Ի��� ����� ���
select * from emp
where hire_date < (select hire_date from emp where emp_id=202)
order by hire_date;

-- ������ sub Query
--in (N1, N2, N3, N4), -- ���� ���� �Ѱ��� ���Ƶ� ��
--salary > ANY(10, 20, 30, 40) --���� �� �߿� �� �����̶� ���� �����ص� : >�ּҰ�
--salary < ANY(10, 20, 30, 40) --���� �� �߿� �� �����̶� ���� �����ص� : <�ִ밪
--salary > ALL(10, 20, 30, 40) --���� �� �߿� ��� ���� ���� : >�ִ밪
--salary < ALL(10, 20, 30, 40) --���� �� �߿� ��� ���� ���� : <�ּҰ�

--job_id�� IT_PROG�� �����߿� �ּұ޿�������(4200) ���� ���� ������ ���
select * from emp
where salary>ANY(select salary from emp where job_id='IT_PROG')
order by salary;

-- ��ü ��� �߿��� 60�� �μ��� �Ի����� ���� ���� ���(07/05/21���� �ʰ� �Ի��� ���
select * from emp
where hire_date > all(select hire_date from emp where dept_id=60)
order by hire_date;

select hire_date from emp where dept_id=60
order by hire_date; -- 07/05/21

-- ���� �÷� sub query
-- dept_id ���� �ִ� �޿�������, dept_id, salary
--group by : https://gent.tistory.com/366
select emp_id,name, dept_id, salary from emp
where (dept_id,salary) in (select dept_id, max(salary) from emp group by dept_id)
order by dept_id;

-- �μ� dept_id ���� �Ի���(hire_date)�� ���� ������ ����� 
--emp_id, name, dept_id, hire_date ����ϰ� dept_id ������������ ����
select emp_id,name, dept_id, hire_date from emp
where (dept_id,hire_date) in (select dept_id, max(hire_date) from emp group by dept_id)
order by dept_id;

--job_id���� �ش� ���޿��� �ִ�޿��������� name, job_id, salary ����ϰ� salary �������� ����
select name, job_id, salary from emp
where (job_id,salary) in (select job_id,max(salary) from emp group by job_id)
order by salary desc;

-- dept_id���� ��ձ޿��� ���ϰ� �� �߿��� ��ձ޿��� ���� ���� �μ��� ��� �޿����� ���� ������
--name, dept_id, salary ����ϰ� salary �������� ����
select dept_id, avg(salary) from emp group by dept_id
order by avg(salary); -- �μ��� ��� �޿�, ���� ���� �μ��� ��ձ޿�: 3475.55(50�� �μ�)

select salary from emp
where salary < 3475.5
order by salary; -- 3475.5���� �޿� ���� ����� �޿�

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

-- emp���� ������ �߿��� �ش� �μ��� ��� �޿����� ���ų� ���� �����
select dept_id, avg(salary) from emp group by dept_id; -- �μ��� ��� �޿�

select name, dept_id, salary from emp a
where salary >= all(select avg(salary) from emp b where a.dept_id=b.dept_id)
order by a.dept_id;


select e.name, d.dept_name from emp e, dept d where e.dept_id=d.dept_id; -- ��������

-- ��Į������(scalar query) -> ��øfor�� ó�� �� �� ������ --> �ð� �� �ɸ� 
--���� ������ ������ �� ��Į�� ���� ������ �ʿ��� ���� �����Ѵ�
-- scalar sub query�� �����ϱ� ���� �ʿ��� �����Ͱ� ����ִ� ����� �޸𸮷� �ε�
-- Main Query���� �־��� ������ ������ �ʿ��� ���� �˻� �� �� �����
-- �޸𸮿� �Է°��� ��°����� �޸� ���� query exrcution cache��� ���� ������
-- ���⼭ �Է°��� Main Query���� �־��� ���̰� ��°��� Scalar Sub Query�� ������ �� ���� �������
-- �� ���� �����ϴ� ĳ�� ���� �����ϴ� �Ķ���ʹ� _query_execution_cache_max_size ��
-- ���� ĳ���� �����ϴ��� ã�������� ��� ������� ����ϰ�
-- ������ �ٽ� access�ؼ� �ش� ���� ã�� �� �ٽ� �޸𸮿� ĳ����
-- Main Query�� ���������� �ݺ�
select e.name,(select dept_name from dept d where d.dept_id=e.dept_id) from emp e; 


select * from emp
where rownum<=11 -- ������ �ִ� ���̺� ���������� �� ��ȣ
order by hire_date; 

-- 
select * from emp order by hire_date desc;

select *  from (select * from emp order by hire_date desc);

select * from
(select rownum rnum, v.*  from (select * from emp order by hire_date desc) v)
where rnum <= 10; --hire_date�� ������ ���̺����� �� ��ȣ

create view e1 as 
select * from emp order by hire_date desc; -- view ����(�ݺ��Ǵ� ������ view�� ���� �ڵ� ���̱�)

select * from
(select rownum rnum, v.*  from e1 v)
where rnum <= 10; -- e1���� ����ȭ

create view e2 as
select rownum rnum, v.*  from e1 v; -- view ����(�ݺ��Ǵ� ������ view�� ���� �ڵ� ���̱�)

select * from
e2
where rnum between 10 and 20; -- e2�� ����ȭ








--group by : https://gent.tistory.com/366