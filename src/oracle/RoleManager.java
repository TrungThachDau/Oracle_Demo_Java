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
public class RoleManager extends javax.swing.JFrame {

    /**
     * Creates new form Session
     */
    Vector vdata=new Vector();
    Vector vheader = new Vector();
    OracleConnection oracle;
    public RoleManager() {
        initComponents();
    setTitle("Quản lý vai trò");
        oracle = new OracleConnection();
        vheader.add("Tên vai trò");
        
        jTable1.setModel(new DefaultTableModel(vdata, vheader));
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
        jPanel2 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        btnGrant = new javax.swing.JButton();
        ckbSYSDBA = new javax.swing.JCheckBox();
        ckbSession = new javax.swing.JCheckBox();
        ckbTable = new javax.swing.JCheckBox();
        ckbProcedure = new javax.swing.JCheckBox();
        ckbTrigger = new javax.swing.JCheckBox();
        ckbUser = new javax.swing.JCheckBox();
        ckbGrant = new javax.swing.JCheckBox();
        jButton1 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        txtRoleName = new javax.swing.JTextField();
        btnAddRole = new javax.swing.JButton();
        btnDeleteRole = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowOpened(java.awt.event.WindowEvent evt) {
                formWindowOpened(evt);
            }
        });

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
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Gán quyền"));

        jLabel3.setText("Gán quyền");

        btnGrant.setText("Gán");
        btnGrant.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGrantActionPerformed(evt);
            }
        });

        ckbSYSDBA.setText("SYSDBA");

        ckbSession.setText("Create Session");

        ckbTable.setText("Create table");

        ckbProcedure.setText("create procedure");

        ckbTrigger.setText("create trigger");

        ckbUser.setText("create user");

        ckbGrant.setText("Grant");

        jButton1.setText("Thu hồi tất cả");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(btnGrant)
                        .addGap(18, 18, 18)
                        .addComponent(jButton1))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel2Layout.createSequentialGroup()
                                        .addComponent(ckbSYSDBA, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addComponent(ckbSession))
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(ckbProcedure, javax.swing.GroupLayout.PREFERRED_SIZE, 139, javax.swing.GroupLayout.PREFERRED_SIZE)
                                            .addComponent(ckbGrant, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE))
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 12, Short.MAX_VALUE)
                                        .addComponent(ckbTrigger, javax.swing.GroupLayout.PREFERRED_SIZE, 112, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(ckbUser, javax.swing.GroupLayout.PREFERRED_SIZE, 111, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(ckbTable, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE))))))
                .addContainerGap(13, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(43, 43, 43)
                .addComponent(jLabel3)
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ckbSYSDBA)
                    .addComponent(ckbSession)
                    .addComponent(ckbTable))
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ckbProcedure)
                    .addComponent(ckbTrigger)
                    .addComponent(ckbUser))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(ckbGrant)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 95, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnGrant)
                    .addComponent(jButton1))
                .addGap(14, 14, 14))
        );

        jLabel2.setText("Tên vai trò");

        btnAddRole.setText("Thêm");
        btnAddRole.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAddRoleActionPerformed(evt);
            }
        });

        btnDeleteRole.setText("Xóa");
        btnDeleteRole.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeleteRoleActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 807, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 28, Short.MAX_VALUE)
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap())
                    .addGroup(layout.createSequentialGroup()
                        .addGap(24, 24, 24)
                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtRoleName, javax.swing.GroupLayout.PREFERRED_SIZE, 151, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnAddRole)
                        .addGap(18, 18, 18)
                        .addComponent(btnDeleteRole)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(92, 92, 92)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtRoleName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnAddRole)
                    .addComponent(btnDeleteRole))
                .addGap(19, 19, 19)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(264, Short.MAX_VALUE))
            .addComponent(jScrollPane1)
        );

        jPanel2.getAccessibleContext().setAccessibleName("");
        jPanel2.getAccessibleContext().setAccessibleDescription("");

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened
        // TODO add your handling code here:
       
            
    }//GEN-LAST:event_formWindowOpened

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        int pos=this.jTable1.getSelectedRow();
        if(pos>=0){
            DisplayDetails(pos);
    }//GEN-LAST:event_jTable1MouseClicked
    }
    private void btnGrantActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGrantActionPerformed
        // TODO add your handling code here:
        String rolename = txtRoleName.getText();
        String permission = "";
        if(ckbSYSDBA.isSelected())
        {
            permission = permission + ", "+"SYSDBA";                      
        }
        if(ckbSession.isSelected())
        {
            permission = permission +", "+"CREATE SESSION";
        }
        if(ckbTable.isSelected())
        {
            permission = permission +", "+"CREATE TABLE";
        }
        if(ckbProcedure.isSelected())
        {
            permission = permission +", "+"CREATE PROCEDURE";
        }
        if(ckbTrigger.isSelected())
        {
            permission = permission +", "+"CREATE TRIGGER";
        }
        if(ckbUser.isSelected())
        {
            permission = permission +", "+"CREATE USER";
        }
        if(ckbGrant.isSelected())
        {
            permission = permission +", "+"GRANT ANY PRIVILEGE";
        }
        if(permission.startsWith(","))
            {
                permission = permission.substring(1);
            }  
        
        System.out.println(permission);
        try {
            oracle.openConnection();
            Statement stmt;
            stmt = oracle.conn.createStatement();
            ResultSet rset2 = stmt.executeQuery("GRANT "+permission+" TO "+rolename+"");           
            JOptionPane.showMessageDialog(null,"Đã gán quyền cho vai trò");
            oracle.closeConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
           
        }
           
    }//GEN-LAST:event_btnGrantActionPerformed

    private void btnAddRoleActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAddRoleActionPerformed
        // TODO add your handling code here:
        String rolename = txtRoleName.getText();
        try {
            oracle.openConnection();
            Statement stmt;
            stmt = oracle.conn.createStatement();
             String sql = "CREATE ROLE "+rolename+"";
            ResultSet rset = stmt.executeQuery(sql);
            RemoveTableItem(jTable1);
            loadData();
            JOptionPane.showMessageDialog(null,"Đã thêm vai trò");
            txtRoleName.setText("");
            oracle.closeConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
           
        }
    }//GEN-LAST:event_btnAddRoleActionPerformed

    private void btnDeleteRoleActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeleteRoleActionPerformed
        // TODO add your handling code here:
        String rolename = txtRoleName.getText();
        try {
            oracle.openConnection();
            Statement stmt;
            stmt = oracle.conn.createStatement();
             String sql = "DROP ROLE "+rolename+"";
            ResultSet rset = stmt.executeQuery(sql);    
            RemoveTableItem(jTable1);
            loadData();
            JOptionPane.showMessageDialog(null,"Đã xóa vai trò");
            txtRoleName.setText("");
            oracle.closeConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
           
        }
    }//GEN-LAST:event_btnDeleteRoleActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        String rolename = txtRoleName.getText();
        try {
            oracle.openConnection();
            Statement stmt;
            stmt = oracle.conn.createStatement();
             String sql = "REVOKE ALL PRIVILEGES FROM "+rolename+"";
            ResultSet rset = stmt.executeQuery(sql);    
            RemoveTableItem(jTable1);
            loadData();
            JOptionPane.showMessageDialog(null,"Đã thu hồi tất cả quyền");
            txtRoleName.setText("");
            oracle.closeConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
           
        }
    }//GEN-LAST:event_jButton1ActionPerformed
    

    /**
     * @param args the command line arguments
     */
       
    
    
    public void DisplayDetails(int selectedrow)
    {
        Vector vRow=(Vector)vdata.get(selectedrow);
        String Code=(String)vRow.get(0);
        
      
        txtRoleName.setText(Code);
        
        
    }
    public void loadData() throws SQLException
    {
        try
        {
            oracle.openConnection();
            String sql = "SELECT role FROM dba_roles";
            Statement stmt = oracle.conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                String one = rs.getString("ROLE");    
                Vector<String> v = new Vector<String>();
                v.add(one);                              
                vdata.add(v);               
            }
            //jTable1.updateUI();
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
            java.util.logging.Logger.getLogger(RoleManager.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(RoleManager.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(RoleManager.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(RoleManager.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new RoleManager().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAddRole;
    private javax.swing.JButton btnDeleteRole;
    private javax.swing.JButton btnGrant;
    private javax.swing.JCheckBox ckbGrant;
    private javax.swing.JCheckBox ckbProcedure;
    private javax.swing.JCheckBox ckbSYSDBA;
    private javax.swing.JCheckBox ckbSession;
    private javax.swing.JCheckBox ckbTable;
    private javax.swing.JCheckBox ckbTrigger;
    private javax.swing.JCheckBox ckbUser;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField txtRoleName;
    // End of variables declaration//GEN-END:variables
}
