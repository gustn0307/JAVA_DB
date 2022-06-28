-- primary key(�⺻Ű), foreign key(�ܷ�Ű)
-- unique: �ߺ����Ұ�, null���
-- check: ���Ǽ���
drop table board_test;

CREATE TABLE BOARD_TEST -- 3-a~e
(
  BNO NUMBER PRIMARY KEY 
, SUBJECT VARCHAR2(20) NOT NULL 
, CONTENT VARCHAR2(20char) NOT NULL 
, WRITER VARCHAR2(20) default 'guest' 
, READ_COUNT NUMBER check (read_count>=0)
);

select * from board_test;

alter table board_test rename column subject to title; -- subject -> title
select * from board_test;

alter table board_test add read_count number default 0; -- column(�Ӽ�) �߰�

truncate table board_test;
select * from board_test;

drop table board_test;

select * from dba_sys_privs where grantee='DBTEST';

select * from user_role_privs; -- ���� ������ �� ����

select * from user_indexes;
select * from user_ind_columns;

create index writer_i on board_test(writer);
drop index writer_i;

exec proc_insert('����2', '����2','�ۼ���2');
--https://gdtbgl93.tistory.com/149
--�Լ�: �Ű�����, ��ȯ�� ����
--���ν���: �Ű����� ����, ��ȯ�� ������
select * from board_test;

--�������̺� �˻�
--����, ��������, ���տ���

alter table "DBTEST"."REPLY" add constraint board_fk foreign key("BNO") references "BOARD"("BNO");

insert into board
values(SEQ_BNO.nextval,'����'||seq_bno.currval,'����'||seq_bno.currval,sysdate); -- �ڵ� �ѹ���
commit;
select * from board;

insert into reply
values(seq_rno.nextval, '���� ��翡��',sysdate,1);
commit;
select * from reply;

insert into reply
values(seq_rno.nextval, '���� ��������',sysdate,1);
commit;
select * from reply;

insert into reply
values(seq_rno.nextval, '��2���� ���5',sysdate,2);
commit;
select * from reply;

-- 1�� �Խñ��� ��۸�
select * from reply where bno=1;

select b.content, r.content
from board b join reply r
on b.bno=r.bno
;

