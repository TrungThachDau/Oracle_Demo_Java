--xem thông tin sga
SELECT * FROM V$SGA;
--xem thông tin về buffer cache
SELECT * FROM V$BUFFER_POOL_STATISTICS;
--xem thông tin về pga
SELECT * FROM V$PROCESS_MEMORY;
--xem thong tin instance
SELECT INSTANCE_NUMBER,INSTANCE_NAME,HOST_NAME,VERSION_FULL,STARTUP_TIME,STATUS,DATABASE_STATUS  FROM V$INSTANCE;
--xem thong tin ve process
SELECT PID,PROGRAM,USERNAME,TERMINAL,CPU_USED,EXECUTION_TYPE FROM V$PROCESS;
--xem thong tin ve database
SELECT * FROM V$DATABASE;
--xem thong tin ve datafile
SELECT * FROM V$DATAFILE;
--xem thong tin ve control file
SELECT * FROM V$CONTROLFILE;
--xem thong tin ve spfile
SHOW PARAMETER SPFILE;
--dem so luong session
    SELECT COUNT(*) FROM V$SESSION;
SELECT SID, SERIAL#, PROGRAM, USERNAME, STATUS FROM V$SESSION;
SELECT USERNAME, COUNT(*) FROM V$SESSION GROUP BY USERNAME;
SELECT SID, SERIAL#, PROGRAM, USERNAME, STATUS,MACHINE FROM V$SESSION;
SELECT DISTINCT PROGRAM FROM V$SESSION;
SELECT DISTINCT MACHINE, PROGRAM FROM V$SESSION WHERE USERNAME='<tên đăng nhập của bạn>';

---huy session
ALTER SYSTEM KILL SESSION '[sid],[serial#]' IMMEDIATE;
---xem các process ứng với các session đang đăng nhập
SELECT s.sid, s.serial#, p.spid, s.program
FROM v$session s JOIN v$process p ON s.paddr = p.addr;
---hiển thị chi tiết thông tin liên quan đến từng datafiles trong cơ sở dữ liệu: tên, id, tablespace chứa datafile đó
SELECT file_name, file_id, tablespace_name
FROM dba_data_files;
--tao dataspace
CREATE TABLESPACE USER_DATA
DATAFILE '/u01/oradata/user_data_01.dbf' SIZE 500M,
DATAFILE '/u02/oradata/user_data_02.dbf' SIZE 500M;
--bo sung datafile vao tablespace
ALTER TABLESPACE USER_DATA
ADD DATAFILE '/u03/oradata/user_data_03.dbf' SIZE 500M;
--xoa datafile
ALTER TABLESPACE USER_DATA
DROP DATAFILE '/u03/oradata/user_data_03.dbf';
--xoa tablespace
DROP TABLESPACE USER_DATA;
--xoa tablespace
DROP TABLESPACE USER_DATA INCLUDING CONTENTS AND DATAFILES;


----Buoi4-----
---xem thong tin user---
SELECT
    username,
    created,
    expiry_date,
    account_status,
    last_login,
    profile
FROM
    dba_users
WHERE
    username = 'SYS';
---kiem tra policy hien co
SELECT policy_name, object_owner, object_name, policy_type, enable
FROM dba_policies;
---Báo cáo tất cả các audit trail entries cho các policy đã thiết lập:
SELECT * FROM dba_audit_trail;
AUDIT ALL BY user;
AUDIT ALL BY user;
AUDIT ALL ON schema.object BY user;
-----Buoi 5-----

---tao profile
CREATE PROFILE low_resource_limit
    LIMIT
        SESSIONS_PER_USER 5
        CPU_PER_SESSION 1000
        CPU_PER_CALL 100
        CONNECT_TIME 60;
--------
CREATE PROFILE user_profile
    LIMIT
        PASSWORD_LIFE_TIME 90
        PASSWORD_REUSE_TIME 365
        PASSWORD_REUSE_MAX 5
        FAILED_LOGIN_ATTEMPTS 3
        PASSWORD_LOCK_TIME 15
        PASSWORD_GRACE_TIME 3
        SESSIONS_PER_USER 5
        CPU_PER_SESSION 1000
        CPU_PER_CALL 100
        CONNECT_TIME 60;
/*
Trong đó:

PASSWORD_LIFE_TIME là số ngày tối đa mà mật khẩu có hiệu lực trước khi phải thay đổi.
PASSWORD_REUSE_TIME là số ngày tối thiểu giữa hai lần sử dụng lại mật khẩu cũ.
PASSWORD_REUSE_MAX là số lần tối đa sử dụng lại mật khẩu cũ.
FAILED_LOGIN_ATTEMPTS là số lần nhập sai mật khẩu trước khi tài khoản bị khóa.
PASSWORD_LOCK_TIME là thời gian tài khoản bị khóa (đơn vị là phút) nếu nhập sai mật khẩu quá n lần.
PASSWORD_GRACE_TIME là thời gian sau khi mật khẩu hết hạn mà người dùng vẫn được phép sử dụng mật khẩu cũ (đơn vị là ngày).
Các giới hạn về SESSIONS_PER_USER, CPU_PER_SESSION, CPU_PER_CALL và CONNECT_TIME giống như ví dụ trước đó.
*/

----kiem tra profile hien co---
SELECT profile FROM dba_profiles;
---tao user voi profile
CREATE USER username IDENTIFIED BY password PROFILE profile_name;
ALTER USER username PROFILE user_profile;
---Xoa user
DROP USER username;
---Xoa profile
DROP PROFILE user_profile;
---tao role
CREATE ROLE role_name;
--cap quyen cho role
GRANT SYSDBA TO role_name;
--cap rola cho user
GRANT role_name TO username;
--Huy gan role cho user
REVOKE role_name FROM username;
--xoa role
DROP ROLE role_name;


---Buoi 6---
---sao luu


















