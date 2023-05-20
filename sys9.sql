
create or replace NONEDITIONABLE PROCEDURE SYS."add_role" (
p_rolename IN VARCHAR2
)
IS
BEGIN
EXECUTE IMMEDIATE 'CREATE ROLE ' || p_rolename;
    COMMIT;
END;
    
    
------------
create or replace NONEDITIONABLE PROCEDURE SYS."drop_role" (
    p_rolename IN VARCHAR2
    )
    IS
    BEGIN
    EXECUTE IMMEDIATE 'CREATE ROLE ' || p_rolename;
        COMMIT;
    END;
-----------
create or replace NONEDITIONABLE PROCEDURE sys.grant_select_table_user (
p_table IN VARCHAR2,
p_user IN VARCHAR2
)

IS
BEGIN
EXECUTE IMMEDIATE 'GRANT SELECT ON ADMIN.' || p_table || ' TO ' || p_user;
    COMMIT;
END;
---------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_select_table_user (
p_table IN VARCHAR2,
p_user IN VARCHAR2
)

IS
BEGIN
EXECUTE IMMEDIATE 'REVOKE SELECT ON ADMIN.' || p_table || ' FROM ' || p_user;
    COMMIT;
END;

---------------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_insert_table_user (
p_table IN VARCHAR2,
p_user IN VARCHAR2
)

IS
BEGIN
EXECUTE IMMEDIATE 'GRANT INSERT ON ADMIN.' || p_table || ' TO ' || p_user;
    COMMIT;
END;
-------------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_insert_table_user (
p_table IN VARCHAR2,
p_user IN VARCHAR2
)

IS
BEGIN
EXECUTE IMMEDIATE 'REVOKE INSERT ON ADMIN.' || p_table || ' FROM ' || p_user;
    COMMIT;
END;
-----------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_update_table_user (
p_table IN VARCHAR2,
p_user IN VARCHAR2
)

IS
BEGIN
EXECUTE IMMEDIATE 'GRANT UPDATE ON ADMIN.' || p_table || ' TO ' || p_user;
    COMMIT;
END;
----------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_update_table_user (
p_table IN VARCHAR2,
p_user IN VARCHAR2
)

IS
BEGIN
EXECUTE IMMEDIATE 'REVOKE UPDATE ON ADMIN.' || p_table || ' FROM ' || p_user;
    COMMIT;
END;
--------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_delete_table_user (
p_table IN VARCHAR2,
p_user IN VARCHAR2
)

IS
BEGIN
EXECUTE IMMEDIATE 'GRANT DELETE ON ADMIN.' || p_table || ' TO ' || p_user;
    COMMIT;
END;
-------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_delete_table_user (
p_table IN VARCHAR2,
p_user IN VARCHAR2
)

IS
BEGIN
EXECUTE IMMEDIATE 'REVOKE DELETE ON ADMIN.' || p_table || ' FROM ' || p_user;
    COMMIT;
END;
---------------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_select_table_role (
p_table IN VARCHAR2,
p_role IN VARCHAR2
)

IS
BEGIN
EXECUTE IMMEDIATE 'GRANT SELECT ON ADMIN.' || p_table || ' TO ' || p_role;
    COMMIT;
END;
-------------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_select_table_role (
p_table IN VARCHAR2,
p_role IN VARCHAR2
)
IS
BEGIN
EXECUTE IMMEDIATE 'REVOKE SELECT ON ADMIN.' || p_table || ' FROM ' || p_role;
    COMMIT;
END;
-----------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_insert_table_role (
p_table IN VARCHAR2,
p_role IN VARCHAR2
)
IS
BEGIN
EXECUTE IMMEDIATE 'GRANT INSERT ON ADMIN.' || p_table || ' TO ' || p_role;
    COMMIT;
END;
-----------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_insert_table_role (
p_table IN VARCHAR2,
p_role IN VARCHAR2
)
IS
BEGIN
EXECUTE IMMEDIATE 'REVOKE INSERT ON ADMIN.' || p_table || ' FROM ' || p_role;
    COMMIT;
END;
-----------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_update_table_role (
p_table IN VARCHAR2,
p_role IN VARCHAR2
)
IS
BEGIN
EXECUTE IMMEDIATE 'GRANT UPDATE ON ADMIN.' || p_table || ' TO ' || p_role;
    COMMIT;
END;
-----------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_update_table_role (
p_table IN VARCHAR2,
p_role IN VARCHAR2
)
IS
BEGIN
EXECUTE IMMEDIATE 'REVOKE UPDATE ON ADMIN.' || p_table || ' FROM ' || p_role;
    COMMIT;
END;
-----------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_delete_table_role (
p_table IN VARCHAR2,
p_role IN VARCHAR2
)
IS
BEGIN
EXECUTE IMMEDIATE 'GRANT DELETE ON ADMIN.' || p_table || ' TO ' || p_role;
    COMMIT;
END;
-----------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_delete_table_role (
p_table IN VARCHAR2,
p_role IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'REVOKE DELETE ON ADMIN.' || p_table || ' FROM ' || p_role;
    COMMIT;
END;
-----------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_role_user (
p_role IN VARCHAR2,
p_user IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'GRANT ' || p_role || ' TO ' || p_user;
    COMMIT;
END;
--------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_role_user (
p_role IN VARCHAR2,
p_user IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'REVOKE ' || p_role || ' FROM ' || p_user;
    COMMIT;
END;
----------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_all_per_of_role (
p_role IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'REVOKE CREATE SESSION, CREATE TABLE, CREATE PROCEDURE, CREATE TRIGGER, CREATE USER, GRANT ANY PRIVILEGE FROM ' || p_role;
    COMMIT;
END;
-------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_per_to_role (
p_per IN VARCHAR2,
p_role IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'GRANT ' || p_per || ' TO ' || p_role ;
    COMMIT;
END;

-----
create or replace NONEDITIONABLE PROCEDURE SYS.create_user (
p_username IN VARCHAR2,
p_password IN VARCHAR2,
p_dtablespace IN VARCHAR2,
p_ttablespace IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'CREATE USER '|| p_username || ' IDENTIFIED BY ' || p_password || ' DEFAULT TABLESPACE ' || p_dtablespace || ' TEMPORARY TABLESPACE ' || p_ttablespace ;

    COMMIT;
END;
-----
create or replace NONEDITIONABLE PROCEDURE SYS.grant_sysdba_user (
p_user IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'GRANT SYSDBA TO '||p_user||' container=all';
    COMMIT;
END;
-----
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_sysdba_user (
p_user IN VARCHAR2
)
IS
BEGIN
EXECUTE IMMEDIATE 'REVOKE SYSDBA FROM '||p_user||' container=all';
    COMMIT;
END;
------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_session_user (
p_user IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'GRANT CREATE SESSION TO '||p_user;
    COMMIT;
END;
------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_session_user (
p_user IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'REVOKE CREATE SESSION FROM '||p_user;
    COMMIT;
END;
-------
create or replace NONEDITIONABLE PROCEDURE SYS.grant_profile_user (
p_user IN VARCHAR2,
p_profile IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'ALTER USER '||p_user||' PROFILE '||p_profile;
    COMMIT;
END;
-------------
create or replace NONEDITIONABLE PROCEDURE SYS.revoke_profile_user (
p_user IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'ALTER USER '||p_user||' PROFILE DEFAULT';
    COMMIT;
END;
-----------
create or replace NONEDITIONABLE PROCEDURE SYS.drop_user (
p_user IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'DROP USER '||p_user;
    COMMIT;
END;
---------
create or replace NONEDITIONABLE PROCEDURE SYS.lock_user (
p_user IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'ALTER USER '||p_user||' ACCOUNT LOCK';
    COMMIT;
END;
-------
create or replace NONEDITIONABLE PROCEDURE SYS.unlock_user (
p_user IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'ALTER USER '||p_user||' ACCOUNT UNLOCK';
    COMMIT;
END;
-----
create or replace NONEDITIONABLE PROCEDURE SYS.change_password_user (
p_user IN VARCHAR2,
p_pass IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'ALTER USER '||p_user||' IDENTIFIED BY '||p_pass;
    COMMIT;
END;
--------------
create or replace NONEDITIONABLE PROCEDURE SYS.drop_profile (
p_profile IN VARCHAR2
)
IS
BEGIN

EXECUTE IMMEDIATE 'DROP PROFILE '||p_profile||' CASCADE';
    COMMIT;
END;
--------------
create or replace NONEDITIONABLE PROCEDURE SYS.create_tablespace_1_datafile (
p_tbname IN 
p_dfname IN VARCHAR2,
p_dfsize IN NUMBER,
p_autoextend IN NUMBER,
p_max IN NUMBER
)
IS
BEGIN

EXECUTE IMMEDIATE 'CREATE TABLESPACE '||p_tbname||' DATAFILE '||p_dfname||' SIZE '||p_dfsize||'M AUTOEXTEND ON NEXT '||p_autoextend||'M MAXSIZE '||p_max||'M';
    COMMIT;
END;

---------------------------------------------
CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."THEM_NHANVIEN" (
p_MaNV IN NHANVIEN.MANV%TYPE,
p_TenNV IN NHANVIEN.TENNV%TYPE,
p_Luong IN NHANVIEN.LUONGNV%TYPE,
P_ChucVu IN NHANVIEN.MACHUCVU%TYPE

)
IS
BEGIN
INSERT INTO admin.nhanvien VALUES(p_MaNV,p_TenNV,p_Luong,p_ChucVu);
COMMIT;
END;
-------------------------------
create or replace PROCEDURE         "CAPNHAT_NHANVIEN" (
p_MaNV IN NHANVIEN.MANV%TYPE,
p_TenNV IN NHANVIEN.TENNV%TYPE,
p_LuongNV IN NHANVIEN.LUONGNV%TYPE,
p_MaChucVu IN NHANVIEN.MACHUCVU%TYPE
)
IS
BEGIN
UPDATE NHANVIEN SET TENNV = p_TenNV, LUONGNV = p_LuongNV, MACHUCVU = p_MaChucVu WHERE MANV = p_MaNV;
end;
----------------------------
create or replace PROCEDURE         "XOA_NHANVIEN" (
p_MaNV IN NHANVIEN.MANV%TYPE
)
IS
BEGIN
DELETE FROM NHANVIEN WHERE MANV = p_MaNV;
COMMIT;
END;

----------------------------------------------
CREATE OR REPLACE TRIGGER sys.delete_user_trigger
AFTER DELETE ON admin.NhanVien
FOR EACH ROW
DECLARE
  deleted_username VARCHAR2(50);
  pragma autonomous_transaction;
BEGIN
  deleted_username := SUBSTR(:Old.TENNV, INSTR(:Old.TENNV, ' ', -1) + 1, LENGTH(:Old.TENNV) - INSTR(:Old.TENNV, ' ', -1)) || '_' || :Old.MANV;
  EXECUTE IMMEDIATE 'DROP USER ' || deleted_username;
  COMMIT;
END;
----------------------------------------------
create or replace NONEDITIONABLE TRIGGER SYS.create_user_trigger
AFTER INSERT on admin.NhanVien
FOR EACH ROW
DECLARE
  new_username VARCHAR2(50);
  pragma autonomous_transaction;
BEGIN
  new_username := SUBSTR(:New.TENNV,INSTR(:New.TENNV, ' ', -1) + 1,LENGTH(:New.TENNV) - INSTR(:New.TENNV, ' ', -1)) || '_' || :new.MANV;
  EXECUTE IMMEDIATE 'CREATE USER ' || new_username || ' IDENTIFIED BY password DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP';
  COMMIT;
END;

