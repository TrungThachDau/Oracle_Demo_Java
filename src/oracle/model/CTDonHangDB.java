/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import oracle.OracleConnection;
import java.sql.Statement;

/**
 *
 * @author trilo
 */
public class CTDonHangDB {
    
    private OracleConnection orclConn;
    private Statement stmt;
    public CTDonHangDB(OracleConnection orclConn){
        this.orclConn = orclConn;
    }
    public CTDonHangModel getCTDonHangs(int maCTDH)
    { 
        CTDonHangModel cTDonHangModel = null;
        try
        {
            orclConn.openConnection();
            stmt = orclConn.conn.createStatement();
            String sql = "SELECT * FROM admin.CHITIETDONHANG WHERE MACTDH = " + maCTDH;
            ResultSet rset = stmt.executeQuery(sql);
            rset.next();
            int maSP = rset.getInt(2);
            int maDH = rset.getInt(3);
            int soLuong = rset.getInt(4);
            cTDonHangModel = new CTDonHangModel(maCTDH, maSP, maDH, soLuong);
            
        } catch(SQLException ex)
        {
            
        }
        return cTDonHangModel;
    }
    
    public ArrayList<CTDonHangModel> getCTDonHangFromDonHangs(int maDH)
    { 
        ArrayList<CTDonHangModel> arrayList = new ArrayList<>();
        try
        {
            orclConn.openConnection();
            stmt = orclConn.conn.createStatement();
            String sql = "SELECT * FROM admin.CHITIETDONHANG WHERE MADH = " + maDH;
            ResultSet rset = stmt.executeQuery(sql);
            while (rset.next()) {
                int maCTDH = rset.getInt(1);
                int maSP = rset.getInt(2);
                int soLuong = rset.getInt(4);
                
                arrayList.add(new CTDonHangModel(maCTDH, maSP, maDH, soLuong));
                
            }
 
            
            
        } catch(SQLException ex)
        {
            return null;
        }
        return arrayList;
    }
    
    
    public boolean addCTDonHang(CTDonHangModel ctDonHang){
        try {
            orclConn.openConnection();
            String sql = "INSERT INTO admin.CHITIETDONHANG(MACTDH, MASP, MADH, SOLUONG) values (?, ?, ?, ?)";
            PreparedStatement ps = orclConn.conn.prepareStatement(sql);
            ps.setInt(1, ctDonHang.getMaCTDH());
            ps.setInt(2, ctDonHang.getMaSP());
            ps.setInt(3, ctDonHang.getMaDH());
            ps.setInt(4, ctDonHang.getSoLuong());
            ps.executeUpdate();
            orclConn.closeConnection();
            return true;
            

        } catch ( SQLException exception) {
           JOptionPane.showMessageDialog(null, "Lỗi truy vấn " + exception.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }
    
    public boolean updateCTDonHang(CTDonHangModel cTDonHang){
        try
        {
            orclConn.openConnection();
            stmt = orclConn.conn.createStatement();
            String sql = "UPDATE admin.CHITIETDONHANG SET MASP = ?, MADH = ?, SOLUONG = ? WHERE MACTDH = ?";
            PreparedStatement ps = orclConn.conn.prepareStatement(sql); 
            ps.setInt(1, cTDonHang.getMaSP());
            ps.setInt(2, cTDonHang.getMaDH());
            ps.setInt(3, cTDonHang.getSoLuong());
            ps.setInt(4, cTDonHang.getMaCTDH());
            ps.executeUpdate();
            
            stmt.close();
            orclConn.closeConnection();
                        
        } catch(SQLException ex)
        {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        
        return true;
    }
    
    public boolean deleteCTDonHang(int maCTDH){
        try
        {
            orclConn.openConnection();
            stmt = orclConn.conn.createStatement();
            String sql = "DELETE admin.CHITIETDONHANG WHERE MACTDH = ?";
            PreparedStatement ps = orclConn.conn.prepareStatement(sql);
            ps.setInt(1, maCTDH);
            ps.executeUpdate();
            
            stmt.close();
            orclConn.closeConnection();
                        
        } catch(SQLException ex)
        {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        
        return true;
    }
    
    public CTDonHangModel getCTDHInArray(int maCTDH, ArrayList<CTDonHangModel> arrayList){
        for (CTDonHangModel ctdhModel : arrayList) {
            if (ctdhModel.getMaCTDH()== maCTDH) {
                return ctdhModel;
            }
        }
        return null;
    }
}
