/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

/**
 *
 * @author trilo
 */
public class CTDonHangModel {
    private int maCTDH;
    private int maSP;
    private int maDH;
    private int soLuong;

    public CTDonHangModel(int maCTDH, int maSP, int maDH, int soLuong) {
        this.maCTDH = maCTDH;
        this.maSP = maSP;
        this.maDH = maDH;
        this.soLuong = soLuong;
    }

    public CTDonHangModel() {
    }

    public int getMaCTDH() {
        return maCTDH;
    }

    public void setMaCTDH(int maCTDH) {
        this.maCTDH = maCTDH;
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public int getMaDH() {
        return maDH;
    }

    public void setMaDH(int maDH) {
        this.maDH = maDH;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    
}
