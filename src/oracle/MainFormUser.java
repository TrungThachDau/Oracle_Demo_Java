/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package oracle;
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.FlowLayout;
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
public class MainFormUser extends javax.swing.JFrame {

    /**
     * Creates new form MainForm
     */
    Statement stmt;
    OracleConnection Oracle;
    ArrayList<SanPhamModel> productModels;
    ArrayList<GioHangModel> cartModels;
    ArrayList<GioHangModel> cartDonHangs;
    
    
    
    
    public MainFormUser() {
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
            rset.next();           
            rset.close();
            Oracle.closeConnection();
                     
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy h:mm:ss a");
        formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));       
        //System.out.println(last_login);
        String formattedDate = formatter.format(date);
        setTitle("Trang chính - "+username+" - "+formattedDate+" ICT");   
    }
    private void init(){
       //Oracle = new OracleConnection("admin","123");
        cartModels = new ArrayList<>();
        cartDonHangs = new ArrayList<>();
        productModels = new ArrayList<>();
        //loadInfoUser();
        
        JPanel tabJPanel = new TableControlPanel();
//        Them panel vao tablePanel
        panel_main.add(tabJPanel);
        panel_main.setVisible(true);
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
        jMenu4 = new javax.swing.JMenu();
        menuItemChangePw = new javax.swing.JMenuItem();

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

        jMenu4.setText("Tài khoản");

        menuItemChangePw.setText("Đổi mật khẩu");
        menuItemChangePw.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemChangePwActionPerformed(evt);
            }
        });
        jMenu4.add(menuItemChangePw);

        jMenuBar1.add(jMenu4);

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

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        // TODO add your handling code here:
        dispose();
        new Main().setVisible(true);
        
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void menuItemChangePwActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemChangePwActionPerformed
        // TODO add your handling code here: datafile fm = new datafile();
                    ChangePassword fm = new ChangePassword();

        fm.setVisible(true);
        
    }//GEN-LAST:event_menuItemChangePwActionPerformed

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
        panel_main.insertTab("Tạo đơn", null, orderControlPanel, null, 0);
        pack();
    }//GEN-LAST:event_btn_orderActionPerformed

   
    
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
            java.util.logging.Logger.getLogger(MainFormUser.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainFormUser.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainFormUser.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainFormUser.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
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
                new MainFormUser().setVisible(true);
            }
        });
        
        
    
    }

    
    // Tạo một TableCellRenderer tùy chỉnh cho việc hiển thị hình ảnh
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_create_order;
    private javax.swing.JButton btn_order;
    private javax.swing.JButton btn_table;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem menuItemChangePw;
    private javax.swing.JTabbedPane panel_main;
    // End of variables declaration//GEN-END:variables
}
