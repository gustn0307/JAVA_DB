CREATE TABLE BOARD_TEST -- 3-a~e
(
  BNO NUMBER NOT NULL 
, SUBJECT VARCHAR2(200) NOT NULL 
, CONTENT VARCHAR2(255) NOT NULL 
, WRITER VARCHAR2(20) NOT NULL 
, READ_COUNT NUMBER DEFAULT 0 
, CREATED_DATE TIMESTAMP NOT NULL 
, CONSTRAINT TABLE1_PK PRIMARY KEY 
  (
    BNO 
  )
  ENABLE 
);

DESC board_test; -- 3-f

select table_name, tablespace_name from dba_tables where owner=upper('dbtest'); -- 3-g

CREATE SEQUENCE SEQ_BNO INCREMENT BY 1; -- 4

insert into board_test(bno,subject,content,writer,read_count,created_date) 
values(SEQ_BNO.nextval,'sql테스트1','데이터베이스1','본인이름',DEFAULT,systimestamp); -- 5-a

select * from board_test;

update board_test SET read_count=read_count + 1 -- 5-b, 1씩 증가
where bno=1;

insert into board_test
values(SEQ_BNO.nextval,'sql테스트2','데이터베이스2','guest',DEFAULT,systimestamp); -- 5-c

select * from board_test -- 5-d
where writer='본인이름';

commit; -- 5-e

delete FROM board_test -- 5-f
where writer='guest';

select * from board_test;

ROLLBACK; -- 5-g

select * from board_test;

drop table board_test; -- 5-h










