--CREATE USER 아이디 IDENTIFIED BY 비밀번호; --아이디, 비번 만드는 법
alter session set "_ORACLE_SCRIPT"=true; --12c버전부터는 아이디 만들때 c##을 붙여줘야 하지만 왼쪽의 명령문을 치면 기존처럼 공통사용자 생성 가능
CREATE USER KHS IDENTIFIED BY oracle;

-- 권한 또는 롤을 적용해야 접속가능
GRANT connect, resource, create table to KHS; -- 접속, 자원제어, 테이블생성 권한 생성
