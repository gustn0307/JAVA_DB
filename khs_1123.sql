drop table test09;

CREATE TABLE TEST09 
(
  NO NUMBER NOT NULL 
, ID VARCHAR2(255) NOT NULL 
, PW VARCHAR2(255) NOT NULL 
, NAME VARCHAR2(255) NOT NULL 
, EMAIL VARCHAR2(255) NOT NULL 
, ADDR VARCHAR2(255) NOT NULL 
, PHONE VARCHAR2(255) NOT NULL 
, GENDER VARCHAR2(2) DEFAULT 'X' 
, BIRTH VARCHAR2(8) 
, ADD_ITEM VARCHAR(255) 
, AGREE VARCHAR2(4) NOT NULL 
, PRIVATE1 VARCHAR2(4) NOT NULL 
, PRIVATE2 VARCHAR2(4) DEFAULT 'f' 
, MARKETING VARCHAR2(4) DEFAULT 'f' 
, SMS VARCHAR2(4) DEFAULT 'f' 
, MAILING VARCHAR2(4) DEFAULT 'f' 
, FOURTEEN_CHK VARCHAR2(4) NOT NULL 
, CREATED_DATE TIMESTAMP 
, CONSTRAINT TEST09_PK PRIMARY KEY 
  (
    NO 
  )
  ENABLE 
);

CREATE SEQUENCE SEQ_T9 INCREMENT BY 1 START WITH 1;


COMMENT ON COLUMN TEST09.BIRTH IS 'YYYYMMDD';

COMMENT ON COLUMN TEST09.AGREE IS 't/f';

COMMENT ON COLUMN TEST09.PRIVATE1 IS 't/f';

COMMENT ON COLUMN TEST09.MARKETING IS 't/f';

COMMENT ON COLUMN TEST09.SMS IS 't/f';

COMMENT ON COLUMN TEST09.MAILING IS 't/f';
