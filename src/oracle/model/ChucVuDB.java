/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oracle.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import oracle.OracleConnection;

/**
 *
 * @author trilo
 */
public class ChucVuDB {
    private OracleConnection orclConn;
    private Statement stmt;
    public ChucVuDB(OracleConnection orcl) {
        this.orclConn = orcl;
    }
    
    
}
