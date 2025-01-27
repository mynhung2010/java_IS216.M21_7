/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package View;

import ConnectDB.ConnectionUtils;
import DatabaseProcess.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Thanh Phat
 */
public class ThongTinHoaDonPanel extends javax.swing.JPanel {
    private  ThanhToanHoaDon thanhToanFrame;
    /**
     * Creates new form ThongTinHoaDonPanel
     * @throws java.sql.SQLException
     */
    public ThongTinHoaDonPanel() throws SQLException {
        initComponents();
        loadData();
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
        tbThongTinHoaDon = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        btnThanhToan = new javax.swing.JButton();
        txtTimKiemHoaDon = new javax.swing.JTextField();
        btnTimKiem = new javax.swing.JButton();
        btnRefresh = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();

        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        tbThongTinHoaDon.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Mã hóa đơn", "Mã khách hàng", "Mã phòng", "Tổng tiền", "Phương thức", "Ngày thanh toán", "Trạng thái"
            }
        ));
        tbThongTinHoaDon.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tbThongTinHoaDonMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tbThongTinHoaDon);

        add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 80, 780, 287));

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel1.setText("Tra cứu hóa đơn:");
        add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 40, -1, -1));

        btnThanhToan.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnThanhToan.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/Thanh toán.png"))); // NOI18N
        btnThanhToan.setText("Thanh toán");
        btnThanhToan.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThanhToanActionPerformed(evt);
            }
        });
        add(btnThanhToan, new org.netbeans.lib.awtextra.AbsoluteConstraints(700, 380, -1, -1));
        add(txtTimKiemHoaDon, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 40, 130, -1));

        btnTimKiem.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnTimKiem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_find_and_replace_16px.png"))); // NOI18N
        btnTimKiem.setText("Tìm kiếm");
        btnTimKiem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTimKiemActionPerformed(evt);
            }
        });
        add(btnTimKiem, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 40, -1, -1));

        btnRefresh.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_restart_16px.png"))); // NOI18N
        btnRefresh.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshActionPerformed(evt);
            }
        });
        add(btnRefresh, new org.netbeans.lib.awtextra.AbsoluteConstraints(700, 40, -1, -1));

        jButton1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/Cập nhật tiền.png"))); // NOI18N
        jButton1.setText("Cập nhật tiền hóa đơn");
        add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 40, -1, -1));

        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/Màn hình đăng nhập.png"))); // NOI18N
        add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(-130, 0, 1410, 590));
    }// </editor-fold>//GEN-END:initComponents

    private void btnTimKiemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTimKiemActionPerformed
        try {
            // TODO add your handling code here:

            TimKiemHoaDon();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ThongTinHoaDonPanel.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }//GEN-LAST:event_btnTimKiemActionPerformed

    private void btnRefreshActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshActionPerformed
        try {
            // TODO add your handling code here:
            btnThanhToan.setEnabled(true);
            ShareData.maHoaDon = "";
            loadData();
        } catch (SQLException ex) {
            Logger.getLogger(ThongTinHoaDonPanel.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        txtTimKiemHoaDon.setText("");
    }//GEN-LAST:event_btnRefreshActionPerformed

    private String trangThai;
    /**
     * Hàm in thông tin lên các TextField
     * @param row 
     */
    private void displayToTextField(int row){
        
        ShareData.maHoaDon = (String) tbThongTinHoaDon.getModel().getValueAt(row, 0);
        
        ShareData.tongTien = (Integer) tbThongTinHoaDon.getModel().getValueAt(row, 3);
        
        trangThai = ((String) tbThongTinHoaDon.getModel().getValueAt(row, 6));
    }

    private void tbThongTinHoaDonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tbThongTinHoaDonMouseClicked
        // TODO add your handling code here:
        
        int row = tbThongTinHoaDon.getSelectedRow();
        
        displayToTextField(row);
    }//GEN-LAST:event_tbThongTinHoaDonMouseClicked

    private void btnThanhToanActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThanhToanActionPerformed
        // TODO add your handling code here:
        if(trangThai.equals("Đã thanh toán"))
        {
            JOptionPane.showMessageDialog(this, "Hóa đơn đã thanh toán");
        }
        else{
            String maHoaDon = ShareData.maHoaDon;
            if(maHoaDon.equals(""))
                JOptionPane.showMessageDialog(this, "Không thể tìm hóa đơn vì mã hóa đơn trống"
                    , "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE); 
            else{
                try {
                    thanhToanFrame = new ThanhToanHoaDon();
                } catch (SQLException | ClassNotFoundException ex) {
                    Logger.getLogger(ThongTinHoaDonPanel.class.getName()).log(Level.SEVERE, null, ex);
                }

                thanhToanFrame.setVisible(true);
            }                
        }
            
    }//GEN-LAST:event_btnThanhToanActionPerformed


    
    /**
     * Láy thông tin các hóa đơn
     * @throws SQLException 
     */
    private void loadData() throws SQLException{
        try {
            HoaDon hdData = new HoaDon();
            String arr[] = {"Mã hóa đơn", "Mã khách hàng","Mã phòng",
                    "Tổng tiền","Phương thức thanh toán"
                    ,"Ngày thanh toán", "Trạng thái thanh toán"};
            List <HoaDon> listHoaDon = hdData.getFullData();
            DefaultTableModel dtm = new DefaultTableModel(arr,0);
            tbThongTinHoaDon.removeAll();
            tbThongTinHoaDon.setModel(dtm);
            
            for (HoaDon hd : listHoaDon) {
                dtm.addRow(new Object[]{
                   hd.getMaHoaDon(), hd.getMaKhachHang()
                  ,hd.getMaPhong()
                  ,hd.getTongTien(), hd.getPhuongThuc()
                  ,hd.getNgayTraTien(), hd.getTrangThai()
                });
            }
            
            dtm.fireTableDataChanged();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ThongTinCacPhong.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    /**
     * Hàm tìm kiếm thông tin hóa đơn
     * @throws SQLException 
     */
    public void TimKiemHoaDon() throws SQLException{
        String BillNo_In = txtTimKiemHoaDon.getText();
        try {
            HoaDon hdData = new HoaDon();
            String arr[] = {"Mã hóa đơn", "Mã khách hàng","Mã phòng",
                    "Tổng tiền","Phương thức thanh toán"
                    ,"Ngày thanh toán", "Trạng thái thanh toán"};
            List <HoaDon> listHoaDon = hdData.timKiemHoaDon(BillNo_In);
            DefaultTableModel dtm = new DefaultTableModel(arr,0);
            tbThongTinHoaDon.removeAll();
            tbThongTinHoaDon.setModel(dtm);
            
            for (HoaDon hd : listHoaDon) {
                dtm.addRow(new Object[]{
                   hd.getMaHoaDon(), hd.getMaKhachHang()
                  ,hd.getMaPhong()
                  ,hd.getTongTien(), hd.getPhuongThuc()
                  ,hd.getNgayTraTien(), hd.getTrangThai()
                });
            }
            
            dtm.fireTableDataChanged();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ThongTinCacPhong.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnRefresh;
    private javax.swing.JButton btnThanhToan;
    private javax.swing.JButton btnTimKiem;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tbThongTinHoaDon;
    private javax.swing.JTextField txtTimKiemHoaDon;
    // End of variables declaration//GEN-END:variables
}
