/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

import java.util.Date;
import java.util.logging.Logger;

/**
 *
 * @author trilo
 */
public class DonHangModel {
    int MaDH;
    Date thoiGianDatHang;
    int trangThaiDH;
    float tongGiaTriDH;
    int maNV;
    String MoTaDH;
    int maBan;

    public DonHangModel() {
    }

    public DonHangModel(int MaDH, Date thoiGianDatHang, int trangThaiDH, float tongGiaTriDH, int maNV, String MoTaDH, int maBan) {
        this.MaDH = MaDH;
        this.thoiGianDatHang = thoiGianDatHang;
        this.trangThaiDH = trangThaiDH;
        this.tongGiaTriDH = tongGiaTriDH;
        this.maNV = maNV;
        this.MoTaDH = MoTaDH;
        this.maBan = maBan;
    }

    public int getMaDH() {
        return MaDH;
    }

    public void setMaDH(int MaDH) {
        this.MaDH = MaDH;
    }

    public Date getThoiGianDatHang() {
        return thoiGianDatHang;
    }

    public void setThoiGianDatHang(Date thoiGianDatHang) {
        this.thoiGianDatHang = thoiGianDatHang;
    }

    public int getTrangThaiDH() {
        return trangThaiDH;
    }

    public void setTrangThaiDH(int trangThaiDH) {
        this.trangThaiDH = trangThaiDH;
    }

    public float getTongGiaTriDH() {
        return tongGiaTriDH;
    }

    public void setTongGiaTriDH(float tongGiaTriDH) {
        this.tongGiaTriDH = tongGiaTriDH;
    }

    public int getMaNhanVien() {
        return maNV;
    }

    public void setMaNhanVien(int maNV) {
        this.maNV = maNV;
    }

    public String getMoTaDH() {
        return MoTaDH;
    }

    public void setMoTaDH(String MoTaDH) {
        this.MoTaDH = MoTaDH;
    }

    public int getMaBan() {
        return maBan;
    }

    public void setBan(int maBan) {
        this.maBan = maBan;
    }
    
}
