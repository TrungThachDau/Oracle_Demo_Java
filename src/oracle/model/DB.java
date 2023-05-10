/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import oracle.OracleConnection;

/**
 *
 * @author trilo
 */
public class DB {
    
    public static int getLastIndex(String nameCol, String nameTable, OracleConnection connection) throws SQLException{
        int index = 0;
        Statement stmt = null;
        try {
            connection.openConnection();
            stmt = connection.conn.createStatement();
            String sql = "SELECT * FROM "+ nameTable +" ORDER BY "+ nameCol +" DESC FETCH FIRST 1 ROW ONLY";
            ResultSet rset = stmt.executeQuery(sql);
            if(rset.next())
            {
                index = rset.getInt(1);
            }
            stmt.close();
            connection.closeConnection();
            
        } catch (Exception e) {
        }

        return index;
        
    }
    
    public static boolean confirmAction(String message){
        int choice = JOptionPane.showConfirmDialog(null, message, "Xác nhận", JOptionPane.YES_NO_OPTION);
        if (choice == JOptionPane.YES_OPTION) {
            return true;
        } else {
            return false;
        }
    }
    
}
