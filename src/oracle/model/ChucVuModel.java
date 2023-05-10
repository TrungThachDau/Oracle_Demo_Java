/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

/**
 *
 * @author trilo
 */
public class ChucVuModel {
    int maCV;
    String tenCV;
    String moTaCV;

    public ChucVuModel() {
    }

    public ChucVuModel(int maCV, String tenCV, String moTaCV) {
        this.maCV = maCV;
        this.tenCV = tenCV;
        this.moTaCV = moTaCV;
    }

    public int getMaCV() {
        return maCV;
    }

    public void setMaCV(int maCV) {
        this.maCV = maCV;
    }

    public String getTenCV() {
        return tenCV;
    }

    public void setTenCV(String tenCV) {
        this.tenCV = tenCV;
    }

    public String getMoTaCV() {
        return moTaCV;
    }

    public void setMoTaCV(String moTaCV) {
        this.moTaCV = moTaCV;
    }
    
}
