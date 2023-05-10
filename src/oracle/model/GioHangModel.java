/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

/**
 *
 * @author trilo
 */
public class GioHangModel {
    SanPhamModel sanPhamModel;
    int soLuong;

    public GioHangModel() {
    }

    public GioHangModel(SanPhamModel sanPhamModel, int soLuong) {
        this.sanPhamModel = sanPhamModel;
        this.soLuong = soLuong;
    }

    public SanPhamModel getProductModel() {
        return sanPhamModel;
    }

    public void setProductModel(SanPhamModel sanPhamModel) {
        this.sanPhamModel = sanPhamModel;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    
}
