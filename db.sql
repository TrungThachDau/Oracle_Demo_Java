--------------------------------------------------------
--  File created - Th? Tý-tháng 5-10-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BAN
--------------------------------------------------------

  CREATE TABLE "ADMIN"."BAN" ("MABAN" NUMBER, "SOLUONGKHACH" NUMBER, "TRANGTHAIBAN" NUMBER)
--------------------------------------------------------
--  DDL for Table CHITIETDONHANG
--------------------------------------------------------

  CREATE TABLE "ADMIN"."CHITIETDONHANG" ("MACTDH" NUMBER, "MASP" NUMBER, "MADH" NUMBER, "SOLUONG" NUMBER)
--------------------------------------------------------
--  DDL for Table CHUCVU
--------------------------------------------------------

  CREATE TABLE "ADMIN"."CHUCVU" ("MACV" NUMBER, "TENCV" VARCHAR2(50 BYTE), "MOTACV" VARCHAR2(50 BYTE))
--------------------------------------------------------
--  DDL for Table DONHANG
--------------------------------------------------------

  CREATE TABLE "ADMIN"."DONHANG" ("MADH" NUMBER, "THOIGIANDATDH" DATE, "TRANGTHAIDH" NUMBER, "TONGGIATRIDH" NUMBER, "MANV" NUMBER, "MOTADH" VARCHAR2(50 BYTE), "MABAN" NUMBER)
--------------------------------------------------------
--  DDL for Table NHANVIEN
--------------------------------------------------------

  CREATE TABLE "ADMIN"."NHANVIEN" ("MANV" NUMBER, "TENNV" VARCHAR2(50 BYTE), "LUONGNV" NUMBER, "MACHUCVU" NUMBER)
--------------------------------------------------------
--  DDL for Table SANPHAM
--------------------------------------------------------

  CREATE TABLE "ADMIN"."SANPHAM" ("MASP" NUMBER, "TENSP" VARCHAR2(50 BYTE), "MOTASP" VARCHAR2(100 BYTE), "GIASP" NUMBER, "HINHANH" BLOB, "SLTON" NUMBER)
REM INSERTING into ADMIN.BAN
SET DEFINE OFF;
Insert into ADMIN.BAN (MABAN,SOLUONGKHACH,TRANGTHAIBAN) values ('1','0','0');
Insert into ADMIN.BAN (MABAN,SOLUONGKHACH,TRANGTHAIBAN) values ('2','5','0');
Insert into ADMIN.BAN (MABAN,SOLUONGKHACH,TRANGTHAIBAN) values ('3','0','0');
Insert into ADMIN.BAN (MABAN,SOLUONGKHACH,TRANGTHAIBAN) values ('4','4','0');
Insert into ADMIN.BAN (MABAN,SOLUONGKHACH,TRANGTHAIBAN) values ('5','0','0');
Insert into ADMIN.BAN (MABAN,SOLUONGKHACH,TRANGTHAIBAN) values ('6','0','0');
REM INSERTING into ADMIN.CHITIETDONHANG
SET DEFINE OFF;
Insert into ADMIN.CHITIETDONHANG (MACTDH,MASP,MADH,SOLUONG) values ('1','1','1','1');
Insert into ADMIN.CHITIETDONHANG (MACTDH,MASP,MADH,SOLUONG) values ('2','2','1','1');
REM INSERTING into ADMIN.CHUCVU
SET DEFINE OFF;
Insert into ADMIN.CHUCVU (MACV,TENCV,MOTACV) values ('1','Nhân viên','Nhân viên');
Insert into ADMIN.CHUCVU (MACV,TENCV,MOTACV) values ('0','Qu?n l?','Qu?n l?');
REM INSERTING into ADMIN.DONHANG
SET DEFINE OFF;
Insert into ADMIN.DONHANG (MADH,THOIGIANDATDH,TRANGTHAIDH,TONGGIATRIDH,MANV,MOTADH,MABAN) values ('1',to_date('10-05-2023','DD-MM-RRRR'),'1','50000','1',null,'1');
REM INSERTING into ADMIN.NHANVIEN
SET DEFINE OFF;
Insert into ADMIN.NHANVIEN (MANV,TENNV,LUONGNV,MACHUCVU) values ('1','Trung','15000','0');
REM INSERTING into ADMIN.SANPHAM
SET DEFINE OFF;
Insert into ADMIN.SANPHAM (MASP,TENSP,MOTASP,GIASP,SLTON) values ('1','Cà phê s?a','Cà phê s?a','20000','10');
Insert into ADMIN.SANPHAM (MASP,TENSP,MOTASP,GIASP,SLTON) values ('2','7UP','Cà phê s?a','11000','20');
Insert into ADMIN.SANPHAM (MASP,TENSP,MOTASP,GIASP,SLTON) values ('3','Coca Cola','Coca','15000','10');
Insert into ADMIN.SANPHAM (MASP,TENSP,MOTASP,GIASP,SLTON) values ('4','Cà phê kem','Cà phê kem','25000','15');
Insert into ADMIN.SANPHAM (MASP,TENSP,MOTASP,GIASP,SLTON) values ('5','Trà xanh','Trà xanh','15000','10');
Insert into ADMIN.SANPHAM (MASP,TENSP,MOTASP,GIASP,SLTON) values ('6','Ný?c cam','Ný?c cam','20000','10');
Insert into ADMIN.SANPHAM (MASP,TENSP,MOTASP,GIASP,SLTON) values ('7','Soda Blue','Soda','25000','10');
Insert into ADMIN.SANPHAM (MASP,TENSP,MOTASP,GIASP,SLTON) values ('8','Mojito Chanh Dây','Mojito','20000','10');
Insert into ADMIN.SANPHAM (MASP,TENSP,MOTASP,GIASP,SLTON) values ('9','S?a l?c','S?a l?c','30000','10');
--------------------------------------------------------
--  DDL for Index BAN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."BAN_PK" ON "ADMIN"."BAN" ("MABAN")
--------------------------------------------------------
--  DDL for Index CHITIETDONHANG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."CHITIETDONHANG_PK" ON "ADMIN"."CHITIETDONHANG" ("MACTDH")
--------------------------------------------------------
--  DDL for Index CHUCVU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."CHUCVU_PK" ON "ADMIN"."CHUCVU" ("MACV")
--------------------------------------------------------
--  DDL for Index DONHANG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."DONHANG_PK" ON "ADMIN"."DONHANG" ("MADH")
--------------------------------------------------------
--  DDL for Index NHANVIEN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."NHANVIEN_PK" ON "ADMIN"."NHANVIEN" ("MANV")
--------------------------------------------------------
--  DDL for Index SANPHAM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."SANPHAM_PK" ON "ADMIN"."SANPHAM" ("MASP")
--------------------------------------------------------
--  Constraints for Table SANPHAM
--------------------------------------------------------

  ALTER TABLE "ADMIN"."SANPHAM" MODIFY ("MASP" NOT NULL ENABLE)
  ALTER TABLE "ADMIN"."SANPHAM" ADD CONSTRAINT "SANPHAM_PK" PRIMARY KEY ("MASP") USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table BAN
--------------------------------------------------------

  ALTER TABLE "ADMIN"."BAN" MODIFY ("MABAN" NOT NULL ENABLE)
  ALTER TABLE "ADMIN"."BAN" ADD CONSTRAINT "BAN_PK" PRIMARY KEY ("MABAN") USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table CHUCVU
--------------------------------------------------------

  ALTER TABLE "ADMIN"."CHUCVU" MODIFY ("MACV" NOT NULL ENABLE)
  ALTER TABLE "ADMIN"."CHUCVU" ADD CONSTRAINT "CHUCVU_PK" PRIMARY KEY ("MACV") USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table CHITIETDONHANG
--------------------------------------------------------

  ALTER TABLE "ADMIN"."CHITIETDONHANG" MODIFY ("MACTDH" NOT NULL ENABLE)
  ALTER TABLE "ADMIN"."CHITIETDONHANG" ADD CONSTRAINT "CHITIETDONHANG_PK" PRIMARY KEY ("MACTDH") USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table NHANVIEN
--------------------------------------------------------

  ALTER TABLE "ADMIN"."NHANVIEN" MODIFY ("MANV" NOT NULL ENABLE)
  ALTER TABLE "ADMIN"."NHANVIEN" ADD CONSTRAINT "NHANVIEN_PK" PRIMARY KEY ("MANV") USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table DONHANG
--------------------------------------------------------

  ALTER TABLE "ADMIN"."DONHANG" MODIFY ("MADH" NOT NULL ENABLE)
  ALTER TABLE "ADMIN"."DONHANG" ADD CONSTRAINT "DONHANG_PK" PRIMARY KEY ("MADH") USING INDEX  ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CHITIETDONHANG
--------------------------------------------------------

  ALTER TABLE "ADMIN"."CHITIETDONHANG" ADD CONSTRAINT "CHITIETDONHANG_FK1" FOREIGN KEY ("MASP") REFERENCES "ADMIN"."SANPHAM" ("MASP") ENABLE
  ALTER TABLE "ADMIN"."CHITIETDONHANG" ADD CONSTRAINT "CHITIETDONHANG_FK2" FOREIGN KEY ("MADH") REFERENCES "ADMIN"."DONHANG" ("MADH") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table DONHANG
--------------------------------------------------------

  ALTER TABLE "ADMIN"."DONHANG" ADD CONSTRAINT "DONHANG_FK1" FOREIGN KEY ("MANV") REFERENCES "ADMIN"."NHANVIEN" ("MANV") ENABLE
  ALTER TABLE "ADMIN"."DONHANG" ADD CONSTRAINT "DONHANG_FK2" FOREIGN KEY ("MABAN") REFERENCES "ADMIN"."BAN" ("MABAN") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table NHANVIEN
--------------------------------------------------------

  ALTER TABLE "ADMIN"."NHANVIEN" ADD CONSTRAINT "NHANVIEN_FK1" FOREIGN KEY ("MACHUCVU") REFERENCES "ADMIN"."CHUCVU" ("MACV") ENABLE
