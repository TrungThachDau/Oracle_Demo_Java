/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import oracle.Main;
import oracle.OracleConnection;

/**
 *
 * @author trilo
 */
public class BanDB {
    OracleConnection orclConn;
    Statement stmt;
    
    public BanDB(OracleConnection Oracle) {
        this.orclConn = Oracle;
    }
    
    
    public ArrayList<BanModel> loadDSBans()
    { 
        ArrayList<BanModel> banModels = new ArrayList<>();
        try
        {
            orclConn.openConnection();
            stmt = orclConn.conn.createStatement();
            String sql = "SELECT * FROM admin.BAN ORDER BY MABAN DESC";
            ResultSet rset = stmt.executeQuery(sql);
            while(rset.next())
            {
                int maBan = rset.getInt(1);
                int slKhach = rset.getInt(2);
                int trangThaiBan = rset.getInt(3);
                banModels.add(new BanModel(maBan, slKhach, trangThaiBan));
            }
            stmt.close();
            orclConn.closeConnection();
            
            
        } catch(SQLException ex)
        {
            
        }
        return banModels;
    }
    
    public BanModel getBan(int maBan){
        try {
            orclConn.openConnection();
            stmt = orclConn.conn.createStatement();
            String sql = "SELECT * FROM admin.BAN WHERE MABAN = " + String.valueOf(maBan);
            ResultSet rset = stmt.executeQuery(sql);
            rset.next();
            int slKhach = rset.getInt(2);
            int trangThaiBan = rset.getInt(3);
            stmt.close();
            orclConn.closeConnection();
            return new BanModel(maBan, slKhach, trangThaiBan);
        } catch (Exception e) {
        }
        return null;
        
    }
    
    
    public boolean updateBan(BanModel ban){
        try
        {
            orclConn.openConnection();
            stmt = orclConn.conn.createStatement();
            String sql = "UPDATE admin.BAN SET SOLUONGKHACH = ?, TRANGTHAIBAN = ? WHERE MABAN = ?";
            PreparedStatement ps = orclConn.conn.prepareStatement(sql); 
            ps.setInt(1, ban.soLuongKhach);
            ps.setInt(2, ban.trangThaiBan);
            ps.setInt(3, ban.maBan);
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
    
    public BanModel getBanInArray(int maBan, ArrayList<BanModel> arrayList){
        for (BanModel banModel : arrayList) {
            if (banModel.getMaBan()== maBan) {
                return banModel;
            }
        }
        return null;
    }
}
