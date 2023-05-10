/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import oracle.OracleConnection;
import javax.sql.rowset.serial.SerialBlob;
import oracle.jdbc.OracleBlob;
/**
 *
 * @author trilo
 */
public class SanPhamDB {
    OracleConnection orclConn; 
    public SanPhamDB(OracleConnection connection) {
        this.orclConn = connection;
    }
    
    public ArrayList<SanPhamModel> loadDSSanPhams()
    { 
        ArrayList<SanPhamModel> sanPhamModels = new ArrayList<>();
        try
        {
            orclConn.openConnection();
            Statement stmt = orclConn.conn.createStatement();
            String sql = "select * from admin.SANPHAM";
            ResultSet rset = stmt.executeQuery(sql);
            while(rset.next())
            {
                int maSP = rset.getInt(1);
                String tenSP = rset.getString(2);
                String moTaSP = rset.getString(3);
                float giaSP = rset.getFloat(4);
                Blob hinhAnh = rset.getBlob(5);
                int slTon = rset.getInt(6);
                sanPhamModels.add(new SanPhamModel(maSP, tenSP, moTaSP, giaSP, slTon, hinhAnh));
            }
            stmt.close();
            orclConn.closeConnection();
            
        } catch(SQLException ex)
        {
            
        }
        return sanPhamModels;
    }
    
    public SanPhamModel getSanPham(int maSP)
    { 
        try
        {
            orclConn.openConnection();
            Statement stmt = orclConn.conn.createStatement();
            String sql = "select * from admin.SANPHAM WHERE MASP = " + String.valueOf(maSP);
            ResultSet rset = stmt.executeQuery(sql);
            rset.next();
            String tenSP = rset.getString(2);
            String moTaSP = rset.getString(3);
            float giaSP = rset.getFloat(4);
            Blob hinhAnh = rset.getBlob(5);
            int slTon = rset.getInt(6);
            stmt.close();
            orclConn.closeConnection();
            return new SanPhamModel(maSP, tenSP, moTaSP, giaSP, slTon, hinhAnh);
            
            
        } catch(SQLException ex)
        {
            
        }
        return null;
    }
    
    public void addSanPham(int maSP, String tenSP, String moTaSP, int giaSP,int soLuongTon, String hinhAnh) throws FileNotFoundException, IOException{
        try {
            orclConn.openConnection();

            String sql = "insert into admin.sanpham (MASP, TENSP, MOTASP, GIASP, HINHANH, SLTON) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = orclConn.conn.prepareStatement(sql); 
            ps.setInt(1, maSP);
            ps.setString(2, tenSP);
            ps.setString(3, moTaSP);
            ps.setFloat(4, giaSP);
            
            File file = new File(hinhAnh);
            FileInputStream fis = new FileInputStream(file);
            SerialBlob sBlob = new SerialBlob(fis.readAllBytes());
            OracleBlob oBlob = (OracleBlob) ((oracle.jdbc.OracleConnection)orclConn.conn).createBlob();
            ps.setBytes(5, sBlob.getBytes(1, (int)sBlob.length()));            
            ps.setInt(6,soLuongTon);
            ps.executeUpdate();
            
            orclConn.closeConnection();
            JOptionPane.showMessageDialog(null, "Thêm thành công");

        } catch ( SQLException exception) {
           JOptionPane.showMessageDialog(null, "Lỗi truy vấn " + exception.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
        catch(FileNotFoundException exception){
            JOptionPane.showMessageDialog(null, "File not found", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
        catch(IOException exception){
            JOptionPane.showMessageDialog(null, "IOException", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public SanPhamModel getSanPhamInArray(int maSP, ArrayList<SanPhamModel> arrayList){
        for (SanPhamModel spModel : arrayList) {
            if (spModel.getMaSP()== maSP) {
                return spModel;
            }
        }
        return null;
    }
    
    public boolean updateSanPham(SanPhamModel sanPham){
        try {
            orclConn.openConnection();
            String sql = "UPDATE admin.SANPHAM SET TENSP = ?, MOTASP = ?, GIASP = ?, HINHANH = ?, SLTON = ? WHERE MASP = ?";
            PreparedStatement ps = orclConn.conn.prepareStatement(sql); 
            ps.setString(1, sanPham.getTenSP());
            ps.setString(2, sanPham.getMoTaSP());
            ps.setFloat(3, sanPham.getGiaSP());
            ps.setBlob(4, sanPham.getHinhAnh());
            ps.setInt(5, sanPham.getSoLuongTon());
            ps.setInt(6, sanPham.getMaSP());
            ps.executeUpdate();
            orclConn.closeConnection();
            return true;

        } catch ( SQLException exception) {
           JOptionPane.showMessageDialog(null, "Lỗi truy vấn " + exception.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }
}
