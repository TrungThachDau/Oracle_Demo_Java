/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package oracle;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author QTrun
 */
public class AuditView extends javax.swing.JFrame {

    /**
     * Creates new form Session
     */
    Vector vdata=new Vector();
    Vector vheader = new Vector();
    OracleConnection oracle;
    public AuditView() {
        initComponents();
    setTitle("Bảng ghi Kiểm toán");
        oracle = new OracleConnection();
//        vheader.add("Dấu thời gian");
//        vheader.add("Đối tượng");
//        vheader.add("Hành động");
//        vheader.add("Đoạn SQL");        
//        jTable1.setModel(new DefaultTableModel(vdata, vheader));
        try {
            loadData();
        } catch (SQLException ex) {
            Logger.getLogger(SGA.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
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
        BtnReload = new javax.swing.JButton();
        btnDeleteAudit = new javax.swing.JButton();
        btnOnAudit = new javax.swing.JButton();
        btnOffAudit = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowOpened(java.awt.event.WindowEvent evt) {
                formWindowOpened(evt);
            }
        });

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Dấu thời gian", "Đối tượng", "Hành động", "Đoạn SQL"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);
        if (jTable1.getColumnModel().getColumnCount() > 0) {
            jTable1.getColumnModel().getColumn(0).setResizable(false);
            jTable1.getColumnModel().getColumn(0).setPreferredWidth(150);
            jTable1.getColumnModel().getColumn(1).setResizable(false);
            jTable1.getColumnModel().getColumn(1).setPreferredWidth(20);
            jTable1.getColumnModel().getColumn(2).setResizable(false);
            jTable1.getColumnModel().getColumn(2).setPreferredWidth(20);
            jTable1.getColumnModel().getColumn(3).setResizable(false);
            jTable1.getColumnModel().getColumn(3).setPreferredWidth(300);
        }

        BtnReload.setText("Tải lại");
        BtnReload.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnReloadActionPerformed(evt);
            }
        });

        btnDeleteAudit.setText("Xóa bảng ghi");
        btnDeleteAudit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeleteAuditActionPerformed(evt);
            }
        });

        btnOnAudit.setText("Bật bảng ghi");
        btnOnAudit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnOnAuditActionPerformed(evt);
            }
        });

        btnOffAudit.setText("Tắt bản ghi");
        btnOffAudit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnOffAuditActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 808, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 54, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnDeleteAudit, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(BtnReload, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnOffAudit, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnOnAudit, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(38, 38, 38))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(40, 40, 40)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 356, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(BtnReload)
                        .addGap(18, 18, 18)
                        .addComponent(btnDeleteAudit)
                        .addGap(22, 22, 22)
                        .addComponent(btnOnAudit)
                        .addGap(18, 18, 18)
                        .addComponent(btnOffAudit)))
                .addContainerGap(18, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened
        // TODO add your handling code here:
        
            
        
            
    }//GEN-LAST:event_formWindowOpened
    
    private void BtnReloadActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnReloadActionPerformed
        // TODO add your handling code here:
        try
        {
            RemoveTableItem(jTable1);
            loadData();
        }
        catch (SQLException ex) {
            
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_BtnReloadActionPerformed

    private void btnDeleteAuditActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeleteAuditActionPerformed
        // TODO add your handling code here:
        if (JOptionPane.showConfirmDialog(null, "Hành động này không thể hoàn tác!", "Xóa bảng ghi", JOptionPane.OK_CANCEL_OPTION) == JOptionPane.OK_OPTION) {
            try {
                oracle.openConnection();
                String sql1 = "TRUNCATE TABLE aud$";
                String sql2 = "TRUNCATE TABLE fga_log$";
                Statement stmt = oracle.conn.createStatement();
                stmt.executeUpdate(sql1);
                stmt.executeUpdate(sql2);
                JOptionPane.showMessageDialog(null, "Xóa bảng ghi thành công", "Xóa bảng ghi", JOptionPane.INFORMATION_MESSAGE);
                RemoveTableItem(jTable1);
                loadData();
                oracle.closeConnection();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        }
    }//GEN-LAST:event_btnDeleteAuditActionPerformed

    private void btnOffAuditActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnOffAuditActionPerformed
        // TODO add your handling code here:
        if (JOptionPane.showConfirmDialog(null, "Tắt Kiểm toán sẽ dừng ghi lại mọi thay đổi. Tiếp tục?", "Tắt kiểm toán", JOptionPane.OK_CANCEL_OPTION) == JOptionPane.OK_OPTION) {
            try {
                oracle.openConnection();
                String sql = "noaudit all";               
                Statement stmt = oracle.conn.createStatement();
                stmt.executeUpdate(sql);                
                JOptionPane.showMessageDialog(null, "Tắt Kiểm toán thành công!", "", JOptionPane.INFORMATION_MESSAGE);               
                oracle.closeConnection();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        }
    }//GEN-LAST:event_btnOffAuditActionPerformed

    private void btnOnAuditActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnOnAuditActionPerformed
        // TODO add your handling code here:
        if (JOptionPane.showConfirmDialog(null, "Bật Kiểm toán sẽ ghi lại hành động thêm, xóa, sửa ở bảng nhân viên, sản phẩm. Tiếp tục?", "Bật kiểm toán", JOptionPane.OK_CANCEL_OPTION) == JOptionPane.OK_OPTION) {
            try {
                oracle.openConnection();
                String sql1 = "audit insert,update,delete on admin.nhanvien by access";
                String sql2 = "audit insert,update,delete on admin.sanpham by access";               

                Statement stmt = oracle.conn.createStatement();
                stmt.executeUpdate(sql1); 
                stmt.executeUpdate(sql2);                
                JOptionPane.showMessageDialog(null, "Bật Kiểm toán thành công!", "", JOptionPane.INFORMATION_MESSAGE);               
                oracle.closeConnection();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        }
    }//GEN-LAST:event_btnOnAuditActionPerformed
private void RemoveTableItem(JTable table) {
        DefaultTableModel model = (DefaultTableModel) table.getModel();
            model.setRowCount(0);
            table.removeAll();
    }

    /**
     * @param args the command line arguments
     */
       
    
    
   
    public void loadData() throws SQLException
    {
        try
        {
            oracle.openConnection();
            String sql = "select extended_timestamp, OBJECT_NAME,statement_type,sql_text\n" +
                        "from dba_common_audit_trail";
            Statement stmt = oracle.conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                String one = rs.getString("EXTENDED_TIMESTAMP");
                String two = rs.getString("OBJECT_NAME");
                String three = rs.getString("STATEMENT_TYPE");
                String four = rs.getString("SQL_TEXT");               
                String tbData[] = {one,two,three,four};
                DefaultTableModel tblModel = (DefaultTableModel)jTable1.getModel();
                
                tblModel.addRow(tbData);  
            }
            jTable1.updateUI();
            oracle.closeConnection();
        } catch(SQLException ex)
        {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }
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
            java.util.logging.Logger.getLogger(AuditView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(AuditView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(AuditView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(AuditView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new AuditView().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton BtnReload;
    private javax.swing.JButton btnDeleteAudit;
    private javax.swing.JButton btnOffAudit;
    private javax.swing.JButton btnOnAudit;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}