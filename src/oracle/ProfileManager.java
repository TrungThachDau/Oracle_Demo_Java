/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package oracle;

import java.awt.event.ItemEvent;
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
public class ProfileManager extends javax.swing.JFrame {

    /**
     * Creates new form Session
     */
    Vector vdata=new Vector();
    Vector vheader = new Vector();
    OracleConnection oracle;
    public ProfileManager() {
        initComponents();
    setTitle("Quản lý hồ sơ (Profile Manager)");
        oracle = new OracleConnection();
        vheader.add("Tên hồ sơ");
        vheader.add("Thuộc tính");
        vheader.add("Giới hạn");
        
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
        jPanel2 = new javax.swing.JPanel();
        txtProfileName = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        btnAdd = new javax.swing.JButton();
        checkBoxLimitTime = new javax.swing.JCheckBox();
        checkBoxPasswordLife = new javax.swing.JCheckBox();
        checkBoxBlockUser = new javax.swing.JCheckBox();
        checkBoxLimitCPU = new javax.swing.JCheckBox();
        txtTimeValue = new javax.swing.JTextField();
        txtPasswordValue = new javax.swing.JTextField();
        txtBlockValue = new javax.swing.JTextField();
        txtCPUValue = new javax.swing.JTextField();
        jPanel3 = new javax.swing.JPanel();
        txtProfileName1 = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        btnDelete1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
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

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Thêm hồ sơ"));

        jLabel2.setText("Tên hồ sơ");

        btnAdd.setText("Thêm");
        btnAdd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAddActionPerformed(evt);
            }
        });

        checkBoxLimitTime.setText("Giới hạn thời gian");
        checkBoxLimitTime.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                checkBoxLimitTimeItemStateChanged(evt);
            }
        });

        checkBoxPasswordLife.setText("Thay đổi mật khẩu định kỳ");
        checkBoxPasswordLife.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                checkBoxPasswordLifeItemStateChanged(evt);
            }
        });

        checkBoxBlockUser.setText("Khóa tài khoản nếu nhập sai");
        checkBoxBlockUser.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                checkBoxBlockUserItemStateChanged(evt);
            }
        });

        checkBoxLimitCPU.setText("Giới hạn CPU");
        checkBoxLimitCPU.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                checkBoxLimitCPUItemStateChanged(evt);
            }
        });

        txtTimeValue.setEnabled(false);

        txtPasswordValue.setEnabled(false);

        txtBlockValue.setEnabled(false);

        txtCPUValue.setEnabled(false);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnAdd)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(checkBoxLimitTime, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(checkBoxBlockUser, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(checkBoxLimitCPU, javax.swing.GroupLayout.PREFERRED_SIZE, 175, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel2Layout.createSequentialGroup()
                                        .addGap(99, 99, 99)
                                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(txtCPUValue, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                                            .addComponent(txtBlockValue, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE))
                                        .addGap(0, 0, Short.MAX_VALUE))
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addComponent(txtTimeValue, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE))))
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(checkBoxPasswordLife, javax.swing.GroupLayout.PREFERRED_SIZE, 308, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtPasswordValue, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(0, 6, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 74, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtProfileName))))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtProfileName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(22, 22, 22)
                        .addComponent(checkBoxLimitTime)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 11, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                        .addComponent(txtTimeValue, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)))
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(checkBoxPasswordLife)
                    .addComponent(txtPasswordValue, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(checkBoxBlockUser)
                    .addComponent(txtBlockValue, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(checkBoxLimitCPU)
                    .addComponent(txtCPUValue, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(11, 11, 11)
                .addComponent(btnAdd)
                .addContainerGap())
        );

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder("Xóa hồ sơ"));

        jLabel3.setText("Tên hồ sơ");

        btnDelete1.setText("Xóa");
        btnDelete1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDelete1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 74, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtProfileName1, javax.swing.GroupLayout.DEFAULT_SIZE, 272, Short.MAX_VALUE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(btnDelete1)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtProfileName1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 41, Short.MAX_VALUE)
                .addComponent(btnDelete1)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 428, Short.MAX_VALUE)
                .addGap(17, 17, 17)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                    .addContainerGap(479, Short.MAX_VALUE)
                    .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(15, 15, 15)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(38, 38, 38)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 356, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(112, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(19, 19, 19))
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(48, 48, 48)
                    .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(329, Short.MAX_VALUE)))
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
    private void btnAddActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAddActionPerformed
        // TODO add your handling code here:
        String profilename = txtProfileName.getText();
        String limitTime="";
        String valueTime="";
        if(checkBoxLimitTime.isSelected())
        {
            limitTime = "Connect_time";
            valueTime = txtTimeValue.getText();
        }
        String limitBlock="";
        String valueBlock="";
        if(checkBoxBlockUser.isSelected())
        {
            limitBlock = "FAILED_LOGIN_ATTEMPTS";
            valueBlock = txtBlockValue.getText();
        }
        String limitLife="";
        String valueLife="";
        if(checkBoxPasswordLife.isSelected())
        {
            limitLife = "PASSWORD_LIFE_TIME";
            valueLife = txtPasswordValue.getText();
        }
        String limitCPU="";
        String valueCPU="";
        if(checkBoxLimitCPU.isSelected())
        {
            limitCPU = "CPU_PER_SESSION";
            valueCPU = txtCPUValue.getText();
        }       
            // Thực thi hành động cần thiết ở đây
            try {
            oracle.openConnection();
            Statement stmt;
            stmt = oracle.conn.createStatement();            
                
             String sql = "CREATE PROFILE "+profilename+" LIMIT \n" +
                            ""+limitBlock+" "+valueBlock+"\n" +
                            ""+limitCPU+" "+valueCPU+"\n" +
                            ""+limitLife+" "+valueLife+"\n" +
                            ""+limitTime+" "+valueTime+"";
            ResultSet rset = stmt.executeQuery(sql);
            
            RemoveTableItem(jTable1);
            loadData();
            JOptionPane.showMessageDialog(null,"Hồ sơ đã được thêm!","Xong!",1);
            oracle.closeConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
            
        }
        
        
           
    }//GEN-LAST:event_btnAddActionPerformed

    private void btnDelete1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDelete1ActionPerformed
        // TODO add your handling code here:
        String profilename = txtProfileName1.getText();       
        int result = JOptionPane.showConfirmDialog(null, "Hành động không thể hoàn tác?", "Cảnh báo", JOptionPane.YES_NO_OPTION);
        if (result == JOptionPane.YES_OPTION) {
            // Thực thi hành động cần thiết ở đây
            try {
            oracle.openConnection();
            Statement stmt;
            stmt = oracle.conn.createStatement();
             String sql = "DROP PROFILE "+profilename+"";
            ResultSet rset = stmt.executeQuery(sql);
            
            RemoveTableItem(jTable1);
            loadData();
            JOptionPane.showMessageDialog(null,"Hồ sơ đã bị xóa!");
            oracle.closeConnection();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Lỗi truy vấn: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);            
        }
        }
    }//GEN-LAST:event_btnDelete1ActionPerformed

    private void checkBoxLimitTimeItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_checkBoxLimitTimeItemStateChanged
        // TODO add your handling code here:
        if (evt.getStateChange() == ItemEvent.SELECTED) {
            txtTimeValue.setEnabled(true);
        } else {
           txtTimeValue.setEnabled(false);
            txtTimeValue.setText("");
        }
    }//GEN-LAST:event_checkBoxLimitTimeItemStateChanged

    private void checkBoxPasswordLifeItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_checkBoxPasswordLifeItemStateChanged
        // TODO add your handling code here:
        if (evt.getStateChange() == ItemEvent.SELECTED) {
            txtPasswordValue.setEnabled(true);
        } else {
           txtPasswordValue.setEnabled(false);
            txtPasswordValue.setText("");
        }
    }//GEN-LAST:event_checkBoxPasswordLifeItemStateChanged

    private void checkBoxBlockUserItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_checkBoxBlockUserItemStateChanged
        // TODO add your handling code here:
        if (evt.getStateChange() == ItemEvent.SELECTED) {
            txtBlockValue.setEnabled(true);
        } else {
           txtBlockValue.setEnabled(false);
            txtBlockValue.setText("");
        }
    }//GEN-LAST:event_checkBoxBlockUserItemStateChanged

    private void checkBoxLimitCPUItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_checkBoxLimitCPUItemStateChanged
        // TODO add your handling code here:
        if (evt.getStateChange() == ItemEvent.SELECTED) {
            txtCPUValue.setEnabled(true);
        } else {
           txtCPUValue.setEnabled(false);
            txtCPUValue.setText("");
        }
    }//GEN-LAST:event_checkBoxLimitCPUItemStateChanged
    
    public void RemoveTableItem(JTable table)
    {
        DefaultTableModel model = (DefaultTableModel) table.getModel();
            model.setRowCount(0);
            table.removeAll();
    }
    /**
     * @param args the command line arguments
     */
       
    
    
    public void DisplayDetails(int selectedrow)
    {
        Vector vRow=(Vector)vdata.get(selectedrow);
        String Code=(String)vRow.get(0);
        
      
        txtProfileName1.setText(Code);
        
        
    }
    public void loadData() throws SQLException
    {
        try
        {
            oracle.openConnection();
            String sql = "SELECT PROFILE, RESOURCE_NAME, LIMIT FROM DBA_PROFILES";
            Statement stmt = oracle.conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                String one = rs.getString("PROFILE");
                String two = rs.getString("RESOURCE_NAME");
                String three = rs.getString("LIMIT");
                
                
                Vector<String> v = new Vector<String>();
                v.add(one);
                v.add(two);
                v.add(three);                              
                vdata.add(v);
                
            }
            jTable1.updateUI();
            oracle.closeConnection();
        } catch(SQLException ex)
        {
            Logger.getLogger(SGA.class.getName()).log(Level.SEVERE, null, ex);
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
            java.util.logging.Logger.getLogger(ProfileManager.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ProfileManager.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ProfileManager.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ProfileManager.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ProfileManager().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAdd;
    private javax.swing.JButton btnDelete1;
    private javax.swing.JCheckBox checkBoxBlockUser;
    private javax.swing.JCheckBox checkBoxLimitCPU;
    private javax.swing.JCheckBox checkBoxLimitTime;
    private javax.swing.JCheckBox checkBoxPasswordLife;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField txtBlockValue;
    private javax.swing.JTextField txtCPUValue;
    private javax.swing.JTextField txtPasswordValue;
    private javax.swing.JTextField txtProfileName;
    private javax.swing.JTextField txtProfileName1;
    private javax.swing.JTextField txtTimeValue;
    // End of variables declaration//GEN-END:variables

    
}
