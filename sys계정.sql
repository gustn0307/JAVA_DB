alter session set "_ORACLE_SCRIPT"=true;

create user HR_EMP IDENTIFIED by HR1234;

alter user HR_EMP IDENTIFIED by HR9999;
grant select any table, delete any table, update any table, insert any table to HR_EMP;
GRANT SELECT, DELETE, UPDATE, INSERT  TO "HR_EMP" ;
GRANT delete any TABLE  TO "HR_EMP" ;
GRANT UPDATE ANY TABLE TO "HR_EMP" ;
GRANT INSERT ANY TABLE TO "HR_EMP" ;

grant RESOURCE, connect, dba to khs;