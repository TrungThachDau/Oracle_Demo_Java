/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

/**
 *
 * @author trilo
 */
public class NhanVienModel {
    int maNV;
    String tenNV;
    int luongNV;
    int maChucVu;

    public NhanVienModel(int maNV, String tenNV, int luongNV, int maChucVu) {
        this.maNV = maNV;
        this.tenNV = tenNV;
        this.luongNV = luongNV;
        this.maChucVu = maChucVu;
    }

    public NhanVienModel() {
    }

    public int getMaNV() {
        return maNV;
    }

    public void setMaNV(int maNV) {
        this.maNV = maNV;
    }

    public String getTenNV() {
        return tenNV;
    }

    public void setTenNV(String tenNV) {
        this.tenNV = tenNV;
    }

    public int getLuongNV() {
        return luongNV;
    }

    public void setLuongNV(int luongNV) {
        this.luongNV = luongNV;
    }

    public int getMaChucVu() {
        return maChucVu;
    }

    public void setMaChucVu(int maChucVu) {
        this.maChucVu = maChucVu;
    }
    
}
