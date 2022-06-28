-- primary key(기본키), foreign key(외래키)
-- unique: 중복허용불가, null허용
-- check: 조건설정
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

alter table board_test add read_count number default 0; -- column(속성) 추가

truncate table board_test;
select * from board_test;

drop table board_test;

select * from dba_sys_privs where grantee='DBTEST';

select * from user_role_privs; -- 현재 유저의 롤 권한

select * from user_indexes;
select * from user_ind_columns;

create index writer_i on board_test(writer);
drop index writer_i;

exec proc_insert('제목2', '내용2','작성자2');
--https://gdtbgl93.tistory.com/149
--함수: 매개변수, 반환값 존재
--프로시저: 매개변수 존재, 반환값 미존재
select * from board_test;

--다중테이블 검색
--조인, 서브쿼리, 집합연산

alter table "DBTEST"."REPLY" add constraint board_fk foreign key("BNO") references "BOARD"("BNO");

insert into board
values(SEQ_BNO.nextval,'제목'||seq_bno.currval,'내용'||seq_bno.currval,sysdate); -- 자동 넘버링
commit;
select * from board;

insert into reply
values(seq_rno.nextval, '좋은 기사에요',sysdate,1);
commit;
select * from reply;

insert into reply
values(seq_rno.nextval, '좋은 정보감사',sysdate,1);
commit;
select * from reply;

insert into reply
values(seq_rno.nextval, '글2번의 댓글5',sysdate,2);
commit;
select * from reply;

-- 1번 게시글의 댓글만
select * from reply where bno=1;

select b.content, r.content
from board b join reply r
on b.bno=r.bno
;

