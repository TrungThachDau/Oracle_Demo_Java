/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.rowset.serial.SerialBlob;
import javax.swing.JOptionPane;
import oracle.OracleConnection;
import oracle.jdbc.OracleBlob;

/**
 *
 * @author trilo
 */
public class DonHangDB {

    private OracleConnection orclConn;
    private Statement stmt;
    public DonHangDB(OracleConnection orcl) {
        this.orclConn = orcl;
    }
    
    public ArrayList<DonHangModel> loadDSDonHangs()
    { 
        ArrayList<DonHangModel> donHangModels = new ArrayList<>();
        try
        {
            orclConn.openConnection();
            stmt = orclConn.conn.createStatement();
            String sql = "SELECT * FROM admin.DONHANG ORDER BY MADH DESC";
            ResultSet rset = stmt.executeQuery(sql);
            while(rset.next())
            {
                int maDH = rset.getInt(1);
                Date thoiGianDat = rset.getDate(2);
                int trangThaiDH = rset.getInt(3);
                int tongGiaTri = rset.getInt(4);
                int maNV = rset.getInt(5);
                String moTaDH = rset.getString(6);
                int maBan = rset.getInt(7);
                donHangModels.add(new DonHangModel(maDH, thoiGianDat, trangThaiDH, tongGiaTri, maNV, moTaDH, maBan));
            }
            
        } catch(SQLException ex)
        {
            
        }
        return donHangModels;
    }
    
    public DonHangModel getDonHang(int maDH)
    { 
        try
        {
            orclConn.openConnection();
            stmt = orclConn.conn.createStatement();
            String sql = "SELECT * FROM admin.DONHANG WHERE MADH = " + String.valueOf(maDH);
            ResultSet rset = stmt.executeQuery(sql);
            rset.next();
            Date thoiGianDat = rset.getDate(2);
            int trangThaiDH = rset.getInt(3);
            int tongGiaTri = rset.getInt(4);
            int maNV = rset.getInt(5);
            String moTaDH = rset.getString(6);
            int maBan = rset.getInt(7);
            return new DonHangModel(maDH, thoiGianDat, trangThaiDH, tongGiaTri, maNV, moTaDH, maBan);
            
        } catch(SQLException ex)
        {
            
        }
        return null;
    }
    
    public boolean addDonHang(DonHangModel donHang){
        try {
            orclConn.openConnection();
            String sql = "INSERT INTO admin.DONHANG(MADH, THOIGIANDATDH, TRANGTHAIDH, TONGGIATRIDH, MANV, MOTADH, MABAN) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = orclConn.conn.prepareStatement(sql); 
            ps.setInt(1, donHang.getMaDH());
            ps.setDate(2, new Date(donHang.thoiGianDatHang.getTime()));
            ps.setInt(3, donHang.trangThaiDH);
            ps.setFloat(4, donHang.tongGiaTriDH);
            ps.setInt(5, donHang.maNV);
            ps.setString(6, donHang.MoTaDH);
            ps.setInt(7, donHang.maBan);
            ps.executeUpdate();
            orclConn.closeConnection();
            return true;

        } catch ( SQLException exception) {
           JOptionPane.showMessageDialog(null, "Lỗi truy vấn " + exception.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }
    
    public boolean updateDonHang(DonHangModel donHang){
        try {
            orclConn.openConnection();
            String sql = "UPDATE admin.DONHANG Set THOIGIANDATDH = ?, TRANGTHAIDH = ?, TONGGIATRIDH = ?, MANV = ?, MOTADH = ?, MABAN = ? WHERE MADH = ?";
            PreparedStatement ps = orclConn.conn.prepareStatement(sql); 
            ps.setDate(1, new Date(donHang.thoiGianDatHang.getTime()));
            ps.setInt(2, donHang.trangThaiDH);
            ps.setFloat(3, donHang.tongGiaTriDH);
            ps.setInt(4, donHang.maNV);
            ps.setString(5, donHang.MoTaDH);
            ps.setInt(6, donHang.maBan);
            ps.setInt(7, donHang.MaDH);
            ps.executeUpdate();
            orclConn.closeConnection();
            return true;

        } catch ( SQLException exception) {
           JOptionPane.showMessageDialog(null, "Lỗi truy vấn " + exception.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }
    
    public boolean deleteDonHang(int maDH){
        try {
            orclConn.openConnection();
            String sql = "DELETE admin.DONHANG WHERE MADH = ?";
            PreparedStatement ps = orclConn.conn.prepareStatement(sql);
            ps.setInt(1, maDH);
            ps.executeUpdate();
            orclConn.closeConnection();
            return true;

        } catch ( SQLException exception) {
           JOptionPane.showMessageDialog(null, "Lỗi truy vấn " + exception.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }
    
    public DonHangModel getDonHangInArray(int maDH, ArrayList<DonHangModel> arrayList){
        for (DonHangModel donHangModel : arrayList) {
            if (donHangModel.getMaDH() == maDH) {
                return donHangModel;
            }
        }
        return null;
    }
    
}
