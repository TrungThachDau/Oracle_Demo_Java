SET SERVEROUTPUT ON 

CREATE OR REPLACE FUNCTION admin.get_last_login(username IN VARCHAR2)
RETURN DATE 
IS
    time_login DATE;
BEGIN
    SELECT LAST_LOGIN INTO time_login 
    FROM DBA_USERS 
    WHERE USERNAME = username;
    RETURN time_login;
END;
--
CREATE SEQUENCE admin.order_sequence
      INCREMENT BY 1
      START WITH 1
      CACHE 20
      NOCYCLE;
      
CREATE SEQUENCE admin.order_details_sequence
      INCREMENT BY 1
      START WITH 1
      CACHE 20
      NOCYCLE;      
--
CREATE OR REPLACE Procedure admin.create_order(
maDH OUT admin.DONHANG.MADH%TYPE, 
tongGiaTri IN admin.DONHANG.TONGGIATRIDH%TYPE,
so_luong_khach IN admin.BAN.SOLUONGKHACH%TYPE,
maNV IN admin.DONHANG.MANV%TYPE, 
moTaDH IN admin.DONHANG.MOTADH%TYPE, 
ma_Ban IN admin.DONHANG.MABAN%TYPE)
IS

thoiGianDat DATE;

BEGIN
--    Lay thoi gian hien tai
    SELECT SYSDATE INTO thoiGianDat FROM DUAL;
    SELECT admin.order_sequence.nextval INTO maDH FROM DUAL;
--    Tao don hang
    INSERT INTO admin.DONHANG Values(maDH, thoiGianDat, 0, tongGiaTri, maNV, moTaDH, ma_Ban);
    commit;
    -- cap nhat so luong khach
    UPDATE ADMIN.BAN SET SOLUONGKHACH = so_luong_khach WHERE MABAN = ma_Ban;
    commit;
END;

CREATE OR REPLACE Procedure admin.delete_order(
ma_dh IN admin.DONHANG.MADH%TYPE)
IS
    CURSOR c_ctdh
    IS
        SELECT MACTDH
        FROM admin.CHITIETDONHANG
        WHERE MADH = ma_dh;
    
    ma_ct_dh admin.CHITIETDONHANG.MACTDH%TYPE;
BEGIN
--  tim chi tiet don hang cua don hang dang xoa
    OPEN c_ctdh;
        LOOP
            FETCH c_ctdh INTO ma_ct_dh;
            EXIT WHEN c_ctdh%NOTFOUND;
            
            -- xoa chi tiet don hang
            BEGIN admin.delete_order_detail(ma_ct_dh); END;
            
        END LOOP;
    
    CLOSE c_ctdh;
    
    -- Xoa don hang
    DELETE FROM admin.DONHANG WHERE MADH = ma_dh;
    commit;
END;

CREATE OR REPLACE Procedure admin.update_table(
ma_ban IN admin.BAN.MABAN%TYPE,
sl_khach IN admin.BAN.SOLUONGKHACH%TYPE,
tt_ban IN admin.BAN.TRANGTHAIBAN%TYPE)
AS
BEGIN
--  CAp nhat trang thai ban
    UPDATE admin.BAN SET TRANGTHAIBAN = tt_ban, SOLUONGKHACH = sl_khach  WHERE MABAN = ma_ban;
    commit;
END;

CREATE OR REPLACE Procedure admin.create_order_detail(
ma_ct_dh OUT admin.CHITIETDONHANG.MACTDH%TYPE,
ma_sp IN admin.CHITIETDONHANG.MASP%TYPE,
ma_dh IN admin.CHITIETDONHANG.MADH%TYPE,
so_luong IN admin.CHITIETDONHANG.SOLUONG%TYPE)
AS
BEGIN

    SELECT admin.order_details_sequence.nextval INTO ma_ct_dh FROM DUAL;
    INSERT INTO admin.CHITIETDONHANG VALUES(ma_ct_dh, ma_sp, ma_dh, so_luong);
    commit;
END;

CREATE OR REPLACE Procedure admin.update_order_detail(
ma_ct_dh IN admin.CHITIETDONHANG.MACTDH%TYPE,
so_luong IN admin.CHITIETDONHANG.SOLUONG%TYPE)
AS
BEGIN
--  CAp nhat trang thai ban
    UPDATE admin.CHITIETDONHANG SET SOLUONG = so_luong  WHERE MACTDH = ma_ct_dh;
    commit;
END;

CREATE OR REPLACE Procedure admin.delete_order_detail(
ma_ct_dh IN admin.CHITIETDONHANG.MACTDH%TYPE)
AS
BEGIN
--  xoa ct don hang
    DELETE FROM admin.CHITIETDONHANG WHERE MACTDH = ma_ct_dh;
    commit;
END;

-- Trigger cap nhat so luong ton cua san pham khi them ct don hang
CREATE OR REPLACE TRIGGER admin.orders_details_after_insert
AFTER INSERT
   ON admin.CHITIETDONHANG
   FOR EACH ROW
 
DECLARE
    sl_ton admin.SANPHAM.SLTON%TYPE;
BEGIN

   -- Ktra sl ton
    SELECT SLTON INTO sl_ton FROM admin.SANPHAM WHERE MASP = :new.MASP;
    IF sl_ton > :new.SOLUONG THEN
    -- Giam sl ton cua sp
        UPDATE admin.SANPHAM SET SLTON = sl_ton  - :new.SOLUONG WHERE MASP = :new.MASP;
    END IF;
END;

-- Trigger cap nhat so luong ton cua sp khi thay doi ct don hang
CREATE OR REPLACE TRIGGER admin.orders_details_after_update
AFTER UPDATE
   ON admin.CHITIETDONHANG
   FOR EACH ROW
 
DECLARE
    sl_ton admin.SANPHAM.SLTON%TYPE;
    ma_sp admin.CHITIETDONHANG.MASP%TYPE;
    new_so_luong admin.CHITIETDONHANG.SOLUONG%TYPE;
    
BEGIN
   --
    ma_sp := :new.MASP;
    
    -- Neu khach dat them -> new_so_luong = +
    -- Neu khach giam -> new_so_luong = -
    new_so_luong := :new.SOLUONG - :old.SOLUONG;
    
    SELECT SLTON INTO sl_ton FROM admin.SANPHAM WHERE MASP = :new.MASP;
    -- Cap nhat slton
    UPDATE admin.SANPHAM SET SLTON = sl_ton  - new_so_luong WHERE MASP = :new.MASP;
    
END;

-- Trigger cap nhat so luong ton cua sp, cap nhat tong tien don hang khi xoa ct don hang
CREATE OR REPLACE TRIGGER admin.orders_details_after_delete
AFTER DELETE
   ON admin.CHITIETDONHANG
   FOR EACH ROW
 
DECLARE
    sl_ton admin.SANPHAM.SLTON%TYPE;
    gia_sp admin.SANPHAM.GIASP%TYPE;
    tong_gia_tri_dh admin.DONHANG.TONGGIATRIDH%TYPE;
    tong_gia_tri_ctdh admin.DONHANG.TONGGIATRIDH%TYPE;
BEGIN
   --
        
    SELECT SLTON, GIASP INTO sl_ton,gia_sp FROM admin.SANPHAM WHERE MASP = :old.MASP;
    -- Cap nhat slton
    UPDATE admin.SANPHAM SET SLTON = sl_ton  + :old.SOLUONG WHERE MASP = :old.MASP;
    
    -- Cap nhat tong tien don hang
    SELECT TONGGIATRIDH INTO tong_gia_tri_dh FROM admin.DONHANG WHERE MADH = :old.MADH;
    tong_gia_tri_ctdh := gia_sp * :old.SOLUONG;
    UPDATE admin.DONHANG SET TONGGIATRIDH = tong_gia_tri_dh - tong_gia_tri_ctdh WHERE MADH = :old.MADH;
    
END;

-- Trigger cap nhat trang thai ban khi tao don hang
CREATE OR REPLACE TRIGGER admin.orders_after_insert
AFTER INSERT
   ON admin.DONHANG
   FOR EACH ROW
 
DECLARE
    
BEGIN
   --
   UPDATE admin.BAN SET TRANGTHAIBAN = 1 WHERE MABAN = :new.MABAN;
    
END;

-- Trigger cap nhat trang thai ban khi xoa don hang
CREATE OR REPLACE TRIGGER admin.orders_after_delete
AFTER INSERT
   ON admin.DONHANG
   FOR EACH ROW
 
DECLARE
    
BEGIN
   --
   UPDATE admin.BAN SET TRANGTHAIBAN = 0 WHERE MABAN = :old.MABAN;
    
END;