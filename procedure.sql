---Procedure Them Nhan Vien---
CREATE OR REPLACE PROCEDURE them_NhanVien (
p_MaNV IN NHANVIEN.MANV%TYPE,
p_TenNV IN NHANVIEN.TENNV%TYPE,
p_LuongNV IN NHANVIEN.LUONGNV%TYPE,
p_MaChucVu IN NHANVIEN.MACHUCVU%TYPE
)
IS
BEGIN
INSERT INTO NHANVIEN (MANV, TENNV, LUONGNV, MACHUCVU)
VALUES (p_MaNV, p_TenNV, p_LuongNV, p_MaChucVu);
COMMIT;
END;

BEGIN
    THEM_NHANVIEN(3, 'Nguyen Van A', 10000, 1);
end;

---Procedure Xoa Nhan Vien---
CREATE OR REPLACE PROCEDURE xoa_NhanVien (
p_MaNV IN NHANVIEN.MANV%TYPE
)
IS
BEGIN
DELETE FROM NHANVIEN WHERE MANV = p_MaNV;
COMMIT;
END;

BEGIN
    XOA_NHANVIEN(2);
end;

---Procedure Sua Nhan Vien---
CREATE OR REPLACE PROCEDURE capnhat_NhanVien (
p_MaNV IN NHANVIEN.MANV%TYPE,
p_TenNV IN NHANVIEN.TENNV%TYPE,
p_LuongNV IN NHANVIEN.LUONGNV%TYPE,
p_MaChucVu IN NHANVIEN.MACHUCVU%TYPE
)
IS
BEGIN
UPDATE NHANVIEN SET TENNV = p_TenNV, LUONGNV = p_LuongNV, MACHUCVU = p_MaChucVu WHERE MANV = p_MaNV;
end;

    BEGIN
        CAPNHAT_NHANVIEN(1, 'Trunggg', 20000, 1);
        commit;
    end;

------Procedure Them San Pham---
CREATE OR REPLACE PROCEDURE them_SanPham(
        p_MaSP IN SANPHAM.MASP%TYPE,
        p_TenSP IN SANPHAM.TENSP%TYPE,
        p_MoTaSP IN SANPHAM.MOTASP%TYPE,
        p_GiaSP IN SANPHAM.GIASP%TYPE,
        p_HinhAnh IN SANPHAM.HINHANH%TYPE,
        p_SLTon IN SANPHAM.SLTON%TYPE
        )
        IS
        BEGIN
        INSERT INTO SANPHAM values (MASP, TENSP, MOTASP, GIASP, HINHANH, SLTON);
        commit ;
        end;

---Procedure Xoa San Pham---
CREATE OR REPLACE PROCEDURE xoa_SanPham (
p_MaSP IN SANPHAM.MASP%TYPE
)
IS
BEGIN
DELETE FROM SANPHAM WHERE MASP = p_MaSP;
COMMIT;
end;
---Procedure Sua San Pham---
CREATE OR REPLACE PROCEDURE capnhat_SanPham (
p_MaSP IN SANPHAM.MASP%TYPE,
p_TenSP IN SANPHAM.TENSP%TYPE,
p_MoTaSP IN SANPHAM.MOTASP%TYPE,
p_GiaSP IN SANPHAM.GIASP%TYPE,
p_HinhAnh IN SANPHAM.HINHANH%TYPE,
p_SLTon IN SANPHAM.SLTON%TYPE
)
IS
BEGIN
UPDATE SANPHAM SET TENSP = p_TenSP, MOTASP = p_MoTaSP, GIASP = p_GiaSP, HINHANH = p_HinhAnh, SLTON = p_SLTon WHERE MASP = p_MaSP;
COMMIT;
end;
--- --Procedure thanh toán---

CREATE OR REPLACE PROCEDURE THANHTOAN
(
  p_madh IN DONHANG.MADH%TYPE,
  p_payment_amount IN NUMBER
) AS
  v_total_amount DONHANG.TONGGIATRIDH%TYPE;
  v_payment_remainder NUMBER;
  BEGIN
  -- Kiểm tra đơn hàng tồn tại ko
  SELECT TONGGIATRIDH INTO v_total_amount FROM DONHANG WHERE MADH = p_madh;

  IF v_total_amount IS NULL THEN
    -- Không tìm thấy đơn hàng đưa ra thông báo
    RAISE_APPLICATION_ERROR(-20001, 'Order with MADH ' || p_madh || ' not found.');
  ELSE
  -- Tính số tiền thanh toán
    v_payment_remainder := v_total_amount - p_payment_amount;
    
    IF v_payment_remainder >= 0 THEN
      -- Thanh toán thành công ,cập nhật đơn hàng và số tiền
      UPDATE DONHANG SET TRANGTHAIDH = 1, TONGGIATRIDH = v_payment_remainder WHERE MADH = p_madh;
      COMMIT;
      -- Xuất thông báo thanh công
      DBMS_OUTPUT.PUT_LINE('Payment for order with MADH ' || p_madh || ' has been successfully processed.');
    ELSE
      -- Thanh toán không thành công đua ra thong báo
      RAISE_APPLICATION_ERROR(-20002, 'Insufficient payment amount. Payment for order with MADH ' || p_madh || ' failed.');
    END IF;
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    -- Không tìm thấy đơn hàng
    RAISE_APPLICATION_ERROR(-20001, 'Order with MADH ' || p_madh || ' not found.');
  WHEN OTHERS THEN
    RAISE;
END;

------Trigger lương của Nhân Viên chứ ko được giảm
CREATE OR REPLACE TRIGGER trg_cap_nhat_luong
BEFORE UPDATE OF LUONGNV ON admin.NHANVIEN
FOR EACH ROW
BEGIN
  IF :NEW.LUONGNV < :OLD.LUONGNV THEN
    RAISE_APPLICATION_ERROR(-20001, 'Không được giảm lương.');
  END IF;
END;
----- Trigger Them nguoi dung khi them nhan vien

create or replace NONEDITIONABLE TRIGGER create_user_trigger
AFTER INSERT ON admin.NhanVien
FOR EACH ROW
DECLARE
  new_username VARCHAR2(50);
  pragma autonomous_transaction;
BEGIN
  -- Tạo tên đăng nhập cho user mới bằng cách kết hợp họ và tên đệm của nhân viên
  new_username := :new.TENNV || '_' || :new.MANV;

  -- Tạo user mới với tên đăng nhập và mật khẩu mặc định là "password"
  EXECUTE IMMEDIATE 'CREATE USER ' || new_username || ' IDENTIFIED BY password';

  -- Cấp quyền truy cập cho user mới vào các bảng và đối tượng trong cơ sở dữ liệu
  EXECUTE IMMEDIATE 'GRANT CREATE SESSION TO ' || new_username;
  EXECUTE IMMEDIATE 'GRANT SELECT,INSERT,UPDATE,DELETE ON ADMIN.NHANVIEN TO ' || new_username;
  EXECUTE IMMEDIATE 'GRANT SELECT,INSERT,UPDATE,DELETE ON ADMIN.BAN TO ' || new_username;
  EXECUTE IMMEDIATE 'GRANT SELECT,INSERT,UPDATE,DELETE ON ADMIN.DONHANG TO ' || new_username;
  EXECUTE IMMEDIATE 'GRANT SELECT,INSERT,UPDATE,DELETE ON ADMIN.SANPHAM TO ' || new_username;
  EXECUTE IMMEDIATE 'GRANT SELECT,INSERT,UPDATE,DELETE ON ADMIN.CHITIETDONHANG TO ' || new_username;
  COMMIT;
END;