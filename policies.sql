---An du lieu nhay cam---
BEGIN
DBMS_RLS.ADD_POLICY (
    object_schema   => 'ADMIN',
    object_name     => 'NHANVIEN',
    policy_name     => 'an_du_lieu_nhay_cam',
    function_schema => 'policy_function_schema',
    policy_function => 'policy_function',
    statement_types => 'SELECT, UPDATE',
    enable          => TRUE,
    static_policy   => FALSE);
END;
------
begin
DBMS_RLS.DROP_POLICY (
    object_schema   => 'ADMIN',
    object_name     => 'NHANVIEN',
    policy_name     => 'sensitive_data_policy'
);
end;
-------Gioi han truy cap
begin
DBMS_RLS.ADD_POLICY (
    object_schema   => 'ADMIN',
    object_name     => 'CHUCVU',
    policy_name     => 'gioi_han_truy_cap',
    function_schema => 'policy_function_schema',
    policy_function => 'policy_function',
    statement_types => 'SELECT',
    enable          => TRUE,
    static_policy   => FALSE);
end;
-------
begin
DBMS_RLS.ADD_POLICY (
    object_schema   => 'ADMIN',
    object_name     => 'CHUCVU',
    policy_name     => 'gioi_han_truy_cap'
    );
end;
----------
begin
DBMS_RLS.ADD_POLICY (
    object_schema   => 'ADMIN',
    object_name     => 'SANPHAM',
    policy_name     => 'ran_buoc_du_lieu',
    function_schema => 'policy_function_schema',
    policy_function => 'policy_function',
    statement_types => 'INSERT,UPDATE,',
    enable          => TRUE,
    static_policy   => FALSE);
end;
------Ran buoc du lieu
begin
DBMS_RLS.DROP_POLICY (
    object_schema   => 'ADMIN',
    object_name     => 'SANPHAM',
    policy_name     => 'ran_buoc_du_lieu'
    );
end;
-------Gioi han dong truy van
begin
DBMS_RLS.ADD_POLICY (
    object_schema   => 'ADMIN',
    object_name     => 'DONHANG',
    policy_name     => 'gioi_han_dong_truy_van',
    function_schema => 'policy_function_schema',
    policy_function => 'policy_function',
    statement_types => 'SELECT',
    enable          => TRUE,
    static_policy   => FALSE);
end;
---------
begin
DBMS_RLS.DROP_POLICY (
    object_schema   => 'ADMIN',
    object_name     => 'DONHANG',
    policy_name     => 'gioi_han_dong_truy_van'
    );
end;
-----------
select * from DBA_POLICIES;