/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package View;

import ConnectDB.ConnectionUtils;
import DatabaseProcess.*;
import java.awt.BorderLayout;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;
import net.sourceforge.barbecue.BarcodeException;

/**
 *
 * @author Thanh Phat
 */
public class ThanhToanHoaDon extends javax.swing.JFrame {

    /**
     * Creates new form ThanhToanHoaDon
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public ThanhToanHoaDon() throws SQLException, ClassNotFoundException {
        initComponents();
        this.setLocationRelativeTo(null);
        String maHoaDon = ShareData.maHoaDon;
        HoaDon hd = new HoaDon();
        
        ShareData.thongTinHoaDon = hd.ThongTinHoaDon(maHoaDon);
        
        
        lbMaHoaDon.setText(ShareData.thongTinHoaDon.getMaHoaDon());
        lbMaPhong.setText(ShareData.thongTinHoaDon.getMaPhong());
        lbMaKhachHang.setText(ShareData.thongTinHoaDon.getMaKhachHang());
        lbTenKhachHang.setText(ShareData.thongTinHoaDon.getTenKhachHang());
        
        lbTongTien.setText(String.valueOf(ShareData.tongTien));
        
        lbPhuongThuc.setText(ShareData.thongTinHoaDon.getPhuongThuc());
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        btnXacNhan = new javax.swing.JButton();
        btnThoat = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        lbMaHoaDon = new javax.swing.JLabel();
        lbMaKhachHang = new javax.swing.JLabel();
        lbTenKhachHang = new javax.swing.JLabel();
        lbMaPhong = new javax.swing.JLabel();
        lbTongTien = new javax.swing.JLabel();
        lbPhuongThuc = new javax.swing.JLabel();
        btnXuatHoaDon = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Trang thanh toán");
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel1.setText("Mã hóa đơn:");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(25, 69, -1, -1));

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel2.setText("Mã khách hàng");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(25, 103, -1, -1));

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel3.setText("Tên khách hàng:");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(25, 137, -1, -1));

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel4.setText("Tổng tiền:");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(25, 205, -1, -1));

        btnXacNhan.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnXacNhan.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_tick_box_16px.png"))); // NOI18N
        btnXacNhan.setText("Xác nhận thanh toán");
        btnXacNhan.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXacNhanActionPerformed(evt);
            }
        });
        getContentPane().add(btnXacNhan, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 280, -1, -1));

        btnThoat.setBackground(new java.awt.Color(204, 204, 204));
        btnThoat.setForeground(new java.awt.Color(204, 204, 204));
        btnThoat.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_cancel_16px.png"))); // NOI18N
        btnThoat.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThoatActionPerformed(evt);
            }
        });
        getContentPane().add(btnThoat, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 320, -1, -1));

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel5.setText("Phương thức thanh toán:");
        getContentPane().add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(25, 241, -1, -1));

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel6.setText("Mã phòng:");
        getContentPane().add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(25, 171, -1, -1));
        getContentPane().add(lbMaHoaDon, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 69, 151, 16));
        getContentPane().add(lbMaKhachHang, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 103, 151, 16));
        getContentPane().add(lbTenKhachHang, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 137, 151, 16));
        getContentPane().add(lbMaPhong, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 171, 151, 20));

        lbTongTien.setDisplayedMnemonic('l');
        getContentPane().add(lbTongTien, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 205, 151, 16));
        getContentPane().add(lbPhuongThuc, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 241, 151, 18));

        btnXuatHoaDon.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnXuatHoaDon.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_paid_bill_16px.png"))); // NOI18N
        btnXuatHoaDon.setText("Xuất hóa đơn");
        btnXuatHoaDon.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXuatHoaDonActionPerformed(evt);
            }
        });
        getContentPane().add(btnXuatHoaDon, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 280, -1, -1));

        jLabel7.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel7.setText("THANH TOÁN HÓA ĐƠN");
        getContentPane().add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 10, -1, -1));

        jLabel8.setBackground(new java.awt.Color(204, 204, 204));
        jLabel8.setForeground(new java.awt.Color(204, 204, 204));
        jLabel8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/Màn hình đăng nhập.png"))); // NOI18N
        getContentPane().add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(-100, -70, 520, 450));

        getAccessibleContext().setAccessibleName("Thanh toán hóa đơn");

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnThoatActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThoatActionPerformed
        // TODO add your handling code here:
        this.dispose();
    }//GEN-LAST:event_btnThoatActionPerformed
    

    private void btnXacNhanActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXacNhanActionPerformed
        String maHoaDon  = lbMaHoaDon.getText();
        
        int index = 0;
        HoaDon hd = new HoaDon();
        
        try {
            index = hd.thanhToanHoaDon(maHoaDon);
            
            if(index > 0)
                JOptionPane.showMessageDialog(this, "Thanh toán thành công");
            else
                JOptionPane.showMessageDialog(this, "Thanh toán thất bại");
        } catch (Exception e) {
        }
    }//GEN-LAST:event_btnXacNhanActionPerformed

    private void btnXuatHoaDonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXuatHoaDonActionPerformed
        // TODO add your handling code here:
        try {
            String maHoaDon = lbMaHoaDon.getText();
            
            HashMap hs = new HashMap();
            hs.put("MaHoaDon", maHoaDon);
            
            Connection con = ConnectionUtils.getMyConnection();

            String file = "src/Source/Report_HoaDon.jrxml";

            JasperReport jReport = JasperCompileManager.compileReport(file);
            
            JasperPrint jPrint = JasperFillManager.fillReport(jReport, hs, con);
             
            JasperViewer.viewReport(jPrint, false);
            
            JasperExportManager.exportReportToPdfFile(jPrint, file);
            
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex.toString());
        }
    }//GEN-LAST:event_btnXuatHoaDonActionPerformed

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
            java.util.logging.Logger.getLogger(ThanhToanHoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ThanhToanHoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ThanhToanHoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ThanhToanHoaDon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new ThanhToanHoaDon().setVisible(true);
                } catch (SQLException ex) {
                    Logger.getLogger(ThanhToanHoaDon.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(ThanhToanHoaDon.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnThoat;
    private javax.swing.JButton btnXacNhan;
    private javax.swing.JButton btnXuatHoaDon;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel lbMaHoaDon;
    private javax.swing.JLabel lbMaKhachHang;
    private javax.swing.JLabel lbMaPhong;
    private javax.swing.JLabel lbPhuongThuc;
    private javax.swing.JLabel lbTenKhachHang;
    private javax.swing.JLabel lbTongTien;
    // End of variables declaration//GEN-END:variables
}
