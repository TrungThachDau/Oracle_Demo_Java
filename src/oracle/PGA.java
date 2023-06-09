/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package oracle;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.lang.System;
import java.sql.*;
import java.util.Vector;

import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author qtrung1702
 */
public class PGA extends javax.swing.JFrame {

    /**
     * Creates new form SGA
     */
    Vector vdata=new Vector();
    Vector vheader = new Vector();
    OracleConnection oracle;
    public PGA(){
        setTitle("Program Global Area");
        initComponents();
        oracle = new OracleConnection();
        vheader.add("PID");
        vheader.add("Xê ri");
        vheader.add("Loại");
        vheader.add("Đã cấp phát");
        vheader.add("Đã sử dụng");
        vheader.add("Cấp phát tối đa");
        vheader.add("CON_ID");
        
        
        jTable1.setModel(new DefaultTableModel(vdata, vheader));
        try {
            loadData();
        } catch (SQLException ex) {
            Logger.getLogger(SGA.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        txtSearch = new javax.swing.JTextField();
        btnSeach = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setName("PGA"); // NOI18N

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        txtSearch.setFocusCycleRoot(true);

        btnSeach.setText("Tìm");
        btnSeach.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSeachActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1)
            .addGroup(layout.createSequentialGroup()
                .addGap(233, 233, 233)
                .addComponent(txtSearch, javax.swing.GroupLayout.PREFERRED_SIZE, 307, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnSeach, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(386, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnSeach, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtSearch, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 523, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnSeachActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSeachActionPerformed
        // TODO add your handling code here:
        try {
            Search();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnSeachActionPerformed
    public void loadData() throws SQLException
    {
        try
        {
            oracle.openConnection();
            String sql = "SELECT * FROM V$PROCESS_MEMORY";
            Statement stmt = oracle.conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                String pid = rs.getString("PID");
                String serial = rs.getString("SERIAL#");
                String category = rs.getString("CATEGORY");
                String allocated = rs.getString("ALLOCATED");
                String used = rs.getString("USED");
                String max = rs.getString("MAX_ALLOCATED");
                String conid = rs.getString("CON_ID");
                Vector<String> v = new Vector<String>();
                v.add(pid);
                v.add(serial);
                v.add(category);
                v.add(allocated);
                v.add(used);
                v.add(max);
                v.add(conid);
                vdata.add(v);                
            }
            jTable1.updateUI();
            oracle.closeConnection();
        } catch(SQLException ex)
        {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
           
        }
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(SGA.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(SGA.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(SGA.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(SGA.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new PGA().setVisible(true);
            }
        });
    }
public void Search() throws SQLException
    {
        RemoveTableItem(jTable1);
        
        try
        {
            oracle.openConnection();
            String sql = "Select * from V$PROCESS_MEMORY where PID like '%"+txtSearch.getText()+"%'";
            Statement stmt = oracle.conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {String pid = rs.getString("PID");
                String serial = rs.getString("SERIAL#");
                String category = rs.getString("CATEGORY");
                String allocated = rs.getString("ALLOCATED");
                String used = rs.getString("USED");
                String max = rs.getString("MAX_ALLOCATED");
                String conid = rs.getString("CON_ID");
                Vector<String> v = new Vector<String>();
                v.add(pid);
                v.add(serial);
                v.add(category);
                v.add(allocated);
                v.add(used);
                v.add(max);
                v.add(conid);
                vdata.add(v);         
            }
            
            jTable1.updateUI();
            oracle.closeConnection();
        } catch(SQLException ex)
        {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
        
    }
private void RemoveTableItem(JTable table) {
        DefaultTableModel model = (DefaultTableModel) table.getModel();
            model.setRowCount(0);
            table.removeAll();
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnSeach;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField txtSearch;
    // End of variables declaration//GEN-END:variables
}
