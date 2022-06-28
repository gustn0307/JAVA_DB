insert into list
values(seq_list.nextval, '상품'||seq_list.currval, 4000, '21/10/13');
commit;

-- trunc : 자리수 버리는 함수(반내림)
--https://gent.tistory.com/192
select no, goods, sales, sales_date from list; 
select no, goods, sales, trunc(sales_date) from list; 
select no, goods, sales, to_char(trunc(sales_date), 'yy-mm-dd hh24:mi:ss') from list; 

select * from list where sales_date>=trunc(sysdate);

select * from list where trunc(sales_date) = trunc(sysdate);

-- 프로시저 : 반환값이 없는 메소드
-- 함수 : 반환값이 있는 메소드
-- 트리거 : 이벤트 처리 함수(매개변수 존재하지 않음), auto commit
-- 프로시저나 함수를 트리거 내부에서 사용 가능하지만 commit이 존재하면 안됨



