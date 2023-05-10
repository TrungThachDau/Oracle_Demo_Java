/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

/**
 *
 * @author trilo
 */
public class BanModel {
    int maBan;
    int soLuongKhach;
    int trangThaiBan;

    public BanModel() {
    }

    public BanModel(int maBan, int soLuongKhach, int trangThaiBan) {
        this.maBan = maBan;
        this.soLuongKhach = soLuongKhach;
        this.trangThaiBan = trangThaiBan;
    }

    public int getMaBan() {
        return maBan;
    }

    public void setMaBan(int maBan) {
        this.maBan = maBan;
    }

    public int getSoLuongKhach() {
        return soLuongKhach;
    }

    public void setSoLuongKhach(int soLuongKhach) {
        this.soLuongKhach = soLuongKhach;
    }

    public int getTrangThaiBan() {
        return trangThaiBan;
    }

    public void setTrangThaiBan(int trangThaiBan) {
        this.trangThaiBan = trangThaiBan;
    }
    
}
