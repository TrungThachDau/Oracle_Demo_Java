/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;
import java.sql.Blob;
/**
 *
 * @author trilo
 */
public class SanPhamModel {
    int maSP;
    String tenSP;
    String moTaSP;

    public String getMoTaSP() {
        return moTaSP;
    }

    public void setMoTaSP(String moTaSP) {
        this.moTaSP = moTaSP;
    }
    float giaSP;
    int soLuongTon;
    Blob hinhAnh;
    

    public SanPhamModel(int maSP, String tenSP, String moTaSP, float giaSP,int soLuongTon,  Blob hinhAnh) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.giaSP = giaSP;
        this.soLuongTon = soLuongTon;
        this.hinhAnh = hinhAnh;
        this.moTaSP = moTaSP;
    }

    public int getSoLuongTon() {
        return soLuongTon;
    }

    public void setSoLuongTon(int soLuongTon) {
        this.soLuongTon = soLuongTon;
    }

    public SanPhamModel() {
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public float getGiaSP() {
        return giaSP;
    }

    public void setGiaSP(float priceProduct) {
        this.giaSP = giaSP;
    }

    public Blob getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(Blob hinhAnh) {
        this.hinhAnh = hinhAnh;
    }
    
    
}

