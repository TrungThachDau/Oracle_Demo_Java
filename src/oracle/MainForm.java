/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package oracle;
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.Timer;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumnModel;
import oracle.model.SanPhamModel;
import oracle.components.SanPhamLayout;
import oracle.form.CreateOrderForm;
import oracle.model.BanDB;
import oracle.model.BanModel;
import oracle.model.ChucVuModel;
import oracle.model.DonHangDB;
import oracle.model.DonHangModel;
import oracle.model.GioHangModel;
import oracle.model.NhanVienDB;
import oracle.model.NhanVienModel;
import oracle.panel.OrderControlPanel;
import oracle.panel.TableControlPanel;
 
/**
 *
 * @author QTrun
 */
public class MainForm extends javax.swing.JFrame {

    /**
     * Creates new form MainForm
     */
    Statement stmt;
    OracleConnection Oracle;
    ArrayList<SanPhamModel> productModels;
    ArrayList<GioHangModel> cartModels;
    ArrayList<GioHangModel> cartDonHangs;
    
    
    
    
    public MainForm() {
        setTitle("Trang chính");
        initComponents();
        init();
        Oracle = new OracleConnection();
        String username = null;
        String last_login = null;
        try {
            Oracle.openConnection();
            stmt = Oracle.conn.createStatement();
            String sql = "select username from user_users";
            ResultSet rset = stmt.executeQuery(sql);
            rset.next();
            username = rset.getString(1);         
            rset = stmt.executeQuery("SELECT CURRENT_TIMESTAMP FROM DUAL");
            rset.next();
            last_login = rset.getString(1);
            rset.close();
            Oracle.closeConnection();
                     
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        setTitle("Trang chính - "+username+" - "+last_login);
        Timer timer = new Timer(5000, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    //Oracle.openConnection();
                    
                    stmt = Oracle.conn.createStatement();                    
                    ResultSet rset2 = stmt.executeQuery("SELECT * FROM USER_USERS");                               
                    //Oracle.LogOut();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Phiên đã bị hủy, Nhấn OK để trở về trang đăng nhập", "Phiên hết hạn", JOptionPane.OK_OPTION);
            dispose();
            //new Main().setVisible(true);
            
        }
            System.out.println("OK");
            }
            
        });
         timer.start();
         //timer.stop();
              
    }
    private void init(){
       //Oracle = new OracleConnection("admin","123");
        cartModels = new ArrayList<>();
        cartDonHangs = new ArrayList<>();
        productModels = new ArrayList<>();
        //loadInfoUser();
        
        JPanel tabJPanel = new TableControlPanel();
//        Them panel vao tablePanel
        panel_main.insertTab("Bàn", null, tabJPanel, null, 0);
        pack();
        
    }
    
    
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btn_table = new javax.swing.JButton();
        btn_order = new javax.swing.JButton();
        btn_create_order = new javax.swing.JButton();
        panel_main = new javax.swing.JTabbedPane();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        jMenuItem6 = new javax.swing.JMenuItem();
        jMenuItem7 = new javax.swing.JMenuItem();
        jMenu3 = new javax.swing.JMenu();
        showSGA = new javax.swing.JMenuItem();
        showPGA = new javax.swing.JMenuItem();
        ProcessView = new javax.swing.JMenuItem();
        InstanceView = new javax.swing.JMenuItem();
        SessionManager = new javax.swing.JMenuItem();
        Tablespace = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenuItem5 = new javax.swing.JMenuItem();
        jMenu4 = new javax.swing.JMenu();
        menuItemRole = new javax.swing.JMenuItem();
        menuItemUser = new javax.swing.JMenuItem();
        menuItemProfiles = new javax.swing.JMenuItem();
        menuItemChangePw = new javax.swing.JMenuItem();
        jMenuItem8 = new javax.swing.JMenuItem();
        jMenu5 = new javax.swing.JMenu();
        jMenuItem3 = new javax.swing.JMenuItem();
        jMenuItem4 = new javax.swing.JMenuItem();
        jMenuItem9 = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setSize(new java.awt.Dimension(1005, 828));
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowOpened(java.awt.event.WindowEvent evt) {
                formWindowOpened(evt);
            }
        });

        btn_table.setText("Bàn");
        btn_table.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_tableActionPerformed(evt);
            }
        });

        btn_order.setText("Đơn hàng");
        btn_order.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_orderActionPerformed(evt);
            }
        });

        btn_create_order.setText("Tạo Đơn");
        btn_create_order.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_create_orderActionPerformed(evt);
            }
        });

        jMenu1.setText("Tệp");

        jMenuItem1.setText("Đăng xuất");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem1);

        jMenuBar1.add(jMenu1);

        jMenu2.setText("Quản lý");

        jMenuItem6.setText("Nhân viên");
        jMenuItem6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem6ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem6);

        jMenuItem7.setText("Sản phẩm");
        jMenuItem7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem7ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem7);

        jMenuBar1.add(jMenu2);

        jMenu3.setText("Thống kê");

        showSGA.setText("SGA");
        showSGA.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                showSGAActionPerformed(evt);
            }
        });
        jMenu3.add(showSGA);

        showPGA.setText("PGA");
        showPGA.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                showPGAActionPerformed(evt);
            }
        });
        jMenu3.add(showPGA);

        ProcessView.setText("Tiến trình");
        ProcessView.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ProcessViewActionPerformed(evt);
            }
        });
        jMenu3.add(ProcessView);

        InstanceView.setText("Thuộc tính CSDL");
        InstanceView.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                InstanceViewActionPerformed(evt);
            }
        });
        jMenu3.add(InstanceView);

        SessionManager.setText("Quản lý phiên");
        SessionManager.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SessionManagerActionPerformed(evt);
            }
        });
        jMenu3.add(SessionManager);

        Tablespace.setText("Tablespace");
        Tablespace.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                TablespaceActionPerformed(evt);
            }
        });
        jMenu3.add(Tablespace);

        jMenuItem2.setText("Bảng ghi kiểm toán");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenu3.add(jMenuItem2);

        jMenuItem5.setText("Chính sách");
        jMenuItem5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem5ActionPerformed(evt);
            }
        });
        jMenu3.add(jMenuItem5);

        jMenuBar1.add(jMenu3);

        jMenu4.setText("Tài khoản");

        menuItemRole.setText("Quyền");
        menuItemRole.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemRoleActionPerformed(evt);
            }
        });
        jMenu4.add(menuItemRole);

        menuItemUser.setText("Người dùng");
        menuItemUser.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemUserActionPerformed(evt);
            }
        });
        jMenu4.add(menuItemUser);

        menuItemProfiles.setText("Hồ sơ");
        menuItemProfiles.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemProfilesActionPerformed(evt);
            }
        });
        jMenu4.add(menuItemProfiles);

        menuItemChangePw.setText("Đổi mật khẩu");
        menuItemChangePw.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemChangePwActionPerformed(evt);
            }
        });
        jMenu4.add(menuItemChangePw);

        jMenuItem8.setText("Phân quyền");
        jMenuItem8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem8ActionPerformed(evt);
            }
        });
        jMenu4.add(jMenuItem8);

        jMenuBar1.add(jMenu4);

        jMenu5.setText("Bảo trì");

        jMenuItem3.setText("Xuất");
        jMenuItem3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem3ActionPerformed(evt);
            }
        });
        jMenu5.add(jMenuItem3);

        jMenuItem4.setText("Nhập");
        jMenuItem4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem4ActionPerformed(evt);
            }
        });
        jMenu5.add(jMenuItem4);

        jMenuItem9.setText("RMAN");
        jMenuItem9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem9ActionPerformed(evt);
            }
        });
        jMenu5.add(jMenuItem9);

        jMenuBar1.add(jMenu5);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(panel_main)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btn_table)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btn_create_order)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btn_order)
                        .addGap(0, 751, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btn_table)
                    .addComponent(btn_order)
                    .addComponent(btn_create_order))
                .addGap(29, 29, 29)
                .addComponent(panel_main, javax.swing.GroupLayout.PREFERRED_SIZE, 743, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
   
    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened
        
    }//GEN-LAST:event_formWindowOpened

    private void showSGAActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_showSGAActionPerformed
        // TODO add your handling code here:
        SGA sga = new SGA();
         sga.setVisible(true);
         
    }//GEN-LAST:event_showSGAActionPerformed

    private void showPGAActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_showPGAActionPerformed
        // TODO add your handling code here:
        PGA pga = new PGA();
         pga.setVisible(true);
    }//GEN-LAST:event_showPGAActionPerformed

    private void ProcessViewActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ProcessViewActionPerformed
        // TODO add your handling code here:
         ProcessView fm = new ProcessView();
         fm.setVisible(true);
    }//GEN-LAST:event_ProcessViewActionPerformed

    private void InstanceViewActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_InstanceViewActionPerformed
        // TODO add your handling code here:
        Instance fm = new Instance();
         fm.setVisible(true);
    }//GEN-LAST:event_InstanceViewActionPerformed

    private void SessionManagerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SessionManagerActionPerformed
        // TODO add your handling code here:
        Session fm  = new Session();
        fm.setVisible(true);
    }//GEN-LAST:event_SessionManagerActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        // TODO add your handling code here:
        dispose();
        new Main().setVisible(true);
        
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void TablespaceActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_TablespaceActionPerformed
        // TODO add your handling code here:
        
        
            Tablespaceview fm = new Tablespaceview();
        fm.setVisible(true);
        
        
    }//GEN-LAST:event_TablespaceActionPerformed

    private void menuItemProfilesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemProfilesActionPerformed
        // TODO add your handling code here:
        ProfileManager fm = new ProfileManager();
        fm.setVisible(true);
    }//GEN-LAST:event_menuItemProfilesActionPerformed

    private void menuItemUserActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemUserActionPerformed
        // TODO add your handling code here:
        UserManager fm  = new UserManager();
        fm.setVisible(true);
    }//GEN-LAST:event_menuItemUserActionPerformed

    private void menuItemChangePwActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemChangePwActionPerformed
        // TODO add your handling code here: datafile fm = new datafile();
                    ChangePassword fm = new ChangePassword();

        fm.setVisible(true);
        
    }//GEN-LAST:event_menuItemChangePwActionPerformed

    private void menuItemRoleActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemRoleActionPerformed
        // TODO add your handling code here:
        RoleManager fm = new RoleManager();
        fm.setVisible(true);
    }//GEN-LAST:event_menuItemRoleActionPerformed

    private void btn_tableActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_tableActionPerformed
        // TODO add your handling code here:
        TableControlPanel tableControlPanel = new TableControlPanel();
        panel_main.removeAll();
       panel_main.insertTab("Bàn", null, tableControlPanel, null, 0);
        pack();
    }//GEN-LAST:event_btn_tableActionPerformed

    private void btn_create_orderActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_create_orderActionPerformed
        // TODO add your handling code here:
        CreateOrderForm createOrderForm = new CreateOrderForm();
        createOrderForm.setVisible(true);
        
    }//GEN-LAST:event_btn_create_orderActionPerformed

    private void btn_orderActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_orderActionPerformed
        // TODO add your handling code here:
        OrderControlPanel orderControlPanel = new OrderControlPanel();
        panel_main.removeAll();
        panel_main.insertTab("Quản lí đơn", null, orderControlPanel, null, 0);
        pack();
    }//GEN-LAST:event_btn_orderActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        // TODO add your handling code here:
        AuditView fm = new AuditView();
        fm.setVisible(true);
    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void jMenuItem5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem5ActionPerformed
        // TODO add your handling code here:
        new Policy().setVisible(true);
    }//GEN-LAST:event_jMenuItem5ActionPerformed

    private void jMenuItem3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem3ActionPerformed
        // TODO add your handling code here:
         BackupDB fm = new BackupDB();
        fm.setVisible(true);
    }//GEN-LAST:event_jMenuItem3ActionPerformed

    private void jMenuItem4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem4ActionPerformed
        // TODO add your handling code here:
         RestoreDB fm = new RestoreDB();
        fm.setVisible(true);
    }//GEN-LAST:event_jMenuItem4ActionPerformed

    private void jMenuItem6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem6ActionPerformed
        // TODO add your handling code here:
        new EmployeeManager().setVisible(true);
    }//GEN-LAST:event_jMenuItem6ActionPerformed

    private void jMenuItem7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem7ActionPerformed
        // TODO add your handling code here:
        new ProductManager().setVisible(true);
    }//GEN-LAST:event_jMenuItem7ActionPerformed

    private void jMenuItem8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem8ActionPerformed
        // TODO add your handling code here:
        new PermissionGroup().setVisible(true);
    }//GEN-LAST:event_jMenuItem8ActionPerformed

    private void jMenuItem9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem9ActionPerformed
        // TODO add your handling code here:
        new RMAN().setVisible(true);
    }//GEN-LAST:event_jMenuItem9ActionPerformed

   
    
    private void loadInfoUser(){
    }
    
    
    
    private void removeCartItem(int idProduct){
        GioHangModel cartModel = new GioHangModel();
        for (GioHangModel item : cartModels) {
            if (item.getProductModel().getMaSP() == idProduct) {
                cartModels.remove(item);
                break;
            }
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
                if ("FlatLaf Cupertino".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        
        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            private String username;
            private String password;
            private String url;
            public void run() {
                new MainForm().setVisible(true);
            }
        });
        
        
    
    }

    
    // Tạo một TableCellRenderer tùy chỉnh cho việc hiển thị hình ảnh
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenuItem InstanceView;
    private javax.swing.JMenuItem ProcessView;
    private javax.swing.JMenuItem SessionManager;
    private javax.swing.JMenuItem Tablespace;
    private javax.swing.JButton btn_create_order;
    private javax.swing.JButton btn_order;
    private javax.swing.JButton btn_table;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenu jMenu5;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JMenuItem jMenuItem5;
    private javax.swing.JMenuItem jMenuItem6;
    private javax.swing.JMenuItem jMenuItem7;
    private javax.swing.JMenuItem jMenuItem8;
    private javax.swing.JMenuItem jMenuItem9;
    private javax.swing.JMenuItem menuItemChangePw;
    private javax.swing.JMenuItem menuItemProfiles;
    private javax.swing.JMenuItem menuItemRole;
    private javax.swing.JMenuItem menuItemUser;
    private javax.swing.JTabbedPane panel_main;
    private javax.swing.JMenuItem showPGA;
    private javax.swing.JMenuItem showSGA;
    // End of variables declaration//GEN-END:variables
}
