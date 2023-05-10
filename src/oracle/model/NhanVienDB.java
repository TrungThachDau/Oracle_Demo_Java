/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import oracle.OracleConnection;

/**
 *
 * @author trilo
 */
public class NhanVienDB {
    private OracleConnection orclConn;
    private Statement stmt;
    public NhanVienDB(OracleConnection orcl) {
        this.orclConn = orcl;
    }
    
    public NhanVienModel getNhanVien(int maNV){
        NhanVienModel nhanVienModel = null;
        try
        {
            orclConn.openConnection();
            stmt = orclConn.conn.createStatement();
            String sql = "SELECT * FROM admin.NHANVIEN WHERE MANV=" + maNV;
            ResultSet rset = stmt.executeQuery(sql);
            rset.next();
            String tenNV = rset.getString(2);
            int luongNV = rset.getInt(3);
            int maChucVu = rset.getInt(4);
            nhanVienModel = new NhanVienModel(maNV, tenNV, luongNV, maChucVu);
            
        } catch(SQLException ex)
        {
            return null;
        }
        return nhanVienModel;
    }
}
