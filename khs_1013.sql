insert into list
values(seq_list.nextval, '��ǰ'||seq_list.currval, 4000, '21/10/13');
commit;

-- trunc : �ڸ��� ������ �Լ�(�ݳ���)
--https://gent.tistory.com/192
select no, goods, sales, sales_date from list; 
select no, goods, sales, trunc(sales_date) from list; 
select no, goods, sales, to_char(trunc(sales_date), 'yy-mm-dd hh24:mi:ss') from list; 

select * from list where sales_date>=trunc(sysdate);

select * from list where trunc(sales_date) = trunc(sysdate);

-- ���ν��� : ��ȯ���� ���� �޼ҵ�
-- �Լ� : ��ȯ���� �ִ� �޼ҵ�
-- Ʈ���� : �̺�Ʈ ó�� �Լ�(�Ű����� �������� ����), auto commit
-- ���ν����� �Լ��� Ʈ���� ���ο��� ��� ���������� commit�� �����ϸ� �ȵ�



