--------------------------------------------------------
--  File created - Th? Hai-tháng 4-17-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BAN
--------------------------------------------------------

  CREATE TABLE "BAN" 
   (	"MABAN" NUMBER, 
	"SOLUONGKHACH" NUMBER, 
	"TRANGTHAIBAN" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CHITIETDONHANG
--------------------------------------------------------

  CREATE TABLE "CHITIETDONHANG" 
   (	"MASP" NUMBER, 
	"MACTDH" NUMBER, 
	"MADH" NUMBER, 
	"SOLUONG" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CHUCVU
--------------------------------------------------------

  CREATE TABLE "CHUCVU" 
   (	"MACV" NUMBER, 
	"TENCV" VARCHAR2(50 BYTE), 
	"MOTACV" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DONHANG
--------------------------------------------------------

  CREATE TABLE "DONHANG" 
   (	"MADH" NUMBER, 
	"THOIGIANDATDH" DATE, 
	"TRANGTHAIDH" NUMBER, 
	"TONGGIATRIDH" NUMBER, 
	"MANV" NUMBER, 
	"MOTADH" VARCHAR2(50 BYTE), 
	"MABAN" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table NHANVIEN
--------------------------------------------------------

  CREATE TABLE "NHANVIEN" 
   (	"MANV" NUMBER, 
	"TENNV" VARCHAR2(50 BYTE), 
	"LUONGNV" NUMBER, 
	"MACHUCVU" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SANPHAM
--------------------------------------------------------

  CREATE TABLE "SANPHAM" 
   (	"MASP" NUMBER, 
	"TENSP" VARCHAR2(50 BYTE), 
	"MOTASP" VARCHAR2(100 BYTE), 
	"GIASP" NUMBER, 
	"HINHANH" BLOB, 
	"SLTON" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("HINHANH") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
REM INSERTING into BAN
SET DEFINE OFF;
REM INSERTING into CHITIETDONHANG
SET DEFINE OFF;
REM INSERTING into CHUCVU
SET DEFINE OFF;
REM INSERTING into DONHANG
SET DEFINE OFF;
REM INSERTING into NHANVIEN
SET DEFINE OFF;
REM INSERTING into SANPHAM
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CHUCVU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHUCVU_PK" ON "CHUCVU" ("MACV") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DONHANG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DONHANG_PK" ON "DONHANG" ("MADH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index NHANVIEN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NHANVIEN_PK" ON "NHANVIEN" ("MANV") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CHITIETDONHANG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHITIETDONHANG_PK" ON "CHITIETDONHANG" ("MACTDH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BAN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BAN_PK" ON "BAN" ("MABAN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SANPHAM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SANPHAM_PK" ON "SANPHAM" ("MASP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table SANPHAM
--------------------------------------------------------

  ALTER TABLE "SANPHAM" MODIFY ("MASP" NOT NULL ENABLE);
  ALTER TABLE "SANPHAM" ADD CONSTRAINT "SANPHAM_PK" PRIMARY KEY ("MASP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BAN
--------------------------------------------------------

  ALTER TABLE "BAN" MODIFY ("MABAN" NOT NULL ENABLE);
  ALTER TABLE "BAN" ADD CONSTRAINT "BAN_PK" PRIMARY KEY ("MABAN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CHUCVU
--------------------------------------------------------

  ALTER TABLE "CHUCVU" MODIFY ("MACV" NOT NULL ENABLE);
  ALTER TABLE "CHUCVU" ADD CONSTRAINT "CHUCVU_PK" PRIMARY KEY ("MACV")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CHITIETDONHANG
--------------------------------------------------------

  ALTER TABLE "CHITIETDONHANG" MODIFY ("MASP" NOT NULL ENABLE);
  ALTER TABLE "CHITIETDONHANG" MODIFY ("MACTDH" NOT NULL ENABLE);
  ALTER TABLE "CHITIETDONHANG" ADD CONSTRAINT "CHITIETDONHANG_PK" PRIMARY KEY ("MACTDH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NHANVIEN
--------------------------------------------------------

  ALTER TABLE "NHANVIEN" MODIFY ("MANV" NOT NULL ENABLE);
  ALTER TABLE "NHANVIEN" MODIFY ("TENNV" NOT NULL ENABLE);
  ALTER TABLE "NHANVIEN" ADD CONSTRAINT "NHANVIEN_PK" PRIMARY KEY ("MANV")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DONHANG
--------------------------------------------------------

  ALTER TABLE "DONHANG" MODIFY ("MADH" NOT NULL ENABLE);
  ALTER TABLE "DONHANG" ADD CONSTRAINT "DONHANG_PK" PRIMARY KEY ("MADH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHITIETDONHANG
--------------------------------------------------------

  ALTER TABLE "CHITIETDONHANG" ADD CONSTRAINT "CHITIETDONHANG_FK1" FOREIGN KEY ("MASP")
	  REFERENCES "SANPHAM" ("MASP") ENABLE;
  ALTER TABLE "CHITIETDONHANG" ADD CONSTRAINT "CHITIETDONHANG_FK2" FOREIGN KEY ("MADH")
	  REFERENCES "DONHANG" ("MADH") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DONHANG
--------------------------------------------------------

  ALTER TABLE "DONHANG" ADD CONSTRAINT "DONHANG_FK1" FOREIGN KEY ("MANV")
	  REFERENCES "NHANVIEN" ("MANV") ENABLE;
  ALTER TABLE "DONHANG" ADD CONSTRAINT "DONHANG_FK2" FOREIGN KEY ("MABAN")
	  REFERENCES "BAN" ("MABAN") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NHANVIEN
--------------------------------------------------------

  ALTER TABLE "NHANVIEN" ADD CONSTRAINT "NHANVIEN_FK1" FOREIGN KEY ("MANV")
	  REFERENCES "CHUCVU" ("MACV") ENABLE;
