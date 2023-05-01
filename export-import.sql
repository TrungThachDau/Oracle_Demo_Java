CREATE USER nt IDENTIFIED BY Oracle123;
GRANT dba, connect to nt;
--------
CREATE TABLE nt.Demo (
  MaKH NUMBER(10) PRIMARY KEY
);
--------
Insert into nt.Demo values(1);
Insert into nt.Demo values(2);
Insert into nt.Demo values(3);
--------
drop table nt.Demo; 
drop table nt1.Demo;

--------
DROP USER nt CASCADE;
--------
select * from nt.Demo;
select * from nt1.Demo;
