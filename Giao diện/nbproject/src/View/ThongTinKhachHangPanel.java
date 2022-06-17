/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package View;

import ConnectDB.ConnectionUtils;
import DatabaseProcess.*;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Thanh Phat
 */
public class ThongTinKhachHangPanel extends javax.swing.JPanel {
    /**
     * Creates new form KhachHangPanel
     * @throws java.sql.SQLException
     */
    public ThongTinKhachHangPanel() throws SQLException {
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

        jLabel1 = new javax.swing.JLabel();
        btnTimKiem = new javax.swing.JButton();
        txtTimKiemTheoMa = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tbThongTinKhachHang = new javax.swing.JTable();
        btnSuaThongTin = new javax.swing.JButton();
        btnLamMoi = new javax.swing.JButton();
        btnXoaThongTin = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        txtMaKhachHang = new javax.swing.JTextField();
        txtTen = new javax.swing.JTextField();
        txtSĐT = new javax.swing.JTextField();
        txtEmail = new javax.swing.JTextField();
        txtCCCD = new javax.swing.JTextField();
        txtMaTaiKhoan = new javax.swing.JTextField();
        cbbGioiTinh = new javax.swing.JComboBox<>();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtADiaChi = new javax.swing.JTextArea();
        jLabel11 = new javax.swing.JLabel();

        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel1.setText("Tra cứu:");
        add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 37, -1, 20));

        btnTimKiem.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnTimKiem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_find_and_replace_16px.png"))); // NOI18N
        btnTimKiem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTimKiemActionPerformed(evt);
            }
        });
        add(btnTimKiem, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 30, -1, -1));
        add(txtTimKiemTheoMa, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 30, 120, 25));

        tbThongTinKhachHang.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Mã khách hàng", "Tên khách hàng", "Giới tính", "Địa chỉ", "SĐT", "Email", "CCCD", "Mã tài khoản"
            }
        ));
        tbThongTinKhachHang.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tbThongTinKhachHangMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tbThongTinKhachHang);
        if (tbThongTinKhachHang.getColumnModel().getColumnCount() > 0) {
            tbThongTinKhachHang.getColumnModel().getColumn(1).setResizable(false);
            tbThongTinKhachHang.getColumnModel().getColumn(3).setResizable(false);
            tbThongTinKhachHang.getColumnModel().getColumn(5).setResizable(false);
            tbThongTinKhachHang.getColumnModel().getColumn(6).setResizable(false);
        }

        add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 70, 660, 267));

        btnSuaThongTin.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnSuaThongTin.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_renew_16px.png"))); // NOI18N
        btnSuaThongTin.setText("Sửa thông tin ");
        btnSuaThongTin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSuaThongTinActionPerformed(evt);
            }
        });
        add(btnSuaThongTin, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 30, -1, -1));

        btnLamMoi.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_restart_16px.png"))); // NOI18N
        btnLamMoi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLamMoiActionPerformed(evt);
            }
        });
        add(btnLamMoi, new org.netbeans.lib.awtextra.AbsoluteConstraints(610, 30, -1, -1));

        btnXoaThongTin.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnXoaThongTin.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_delete_database_16px.png"))); // NOI18N
        btnXoaThongTin.setText("Xóa thông tin");
        btnXoaThongTin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXoaThongTinActionPerformed(evt);
            }
        });
        add(btnXoaThongTin, new org.netbeans.lib.awtextra.AbsoluteConstraints(460, 30, -1, -1));

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel2.setText("Mã khách hàng: ");
        add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(740, 90, -1, -1));

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel3.setText("Tên khách hàng:");
        add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(740, 140, -1, -1));

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel4.setText("Giới tính:");
        add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(1040, 130, -1, 20));

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel5.setText("Địa chỉ:");
        add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(740, 300, -1, -1));

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel6.setText("SĐT:");
        add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(740, 220, -1, -1));

        jLabel7.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel7.setText("Email:");
        add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(740, 260, -1, -1));

        jLabel8.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel8.setText("CCCD:");
        add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(740, 180, -1, 20));

        jLabel9.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel9.setText("Mã tài khoản:");
        add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(1040, 90, -1, -1));
        add(txtMaKhachHang, new org.netbeans.lib.awtextra.AbsoluteConstraints(840, 80, 100, -1));
        add(txtTen, new org.netbeans.lib.awtextra.AbsoluteConstraints(840, 130, 180, -1));
        add(txtSĐT, new org.netbeans.lib.awtextra.AbsoluteConstraints(840, 210, 110, -1));
        add(txtEmail, new org.netbeans.lib.awtextra.AbsoluteConstraints(840, 250, 110, -1));
        add(txtCCCD, new org.netbeans.lib.awtextra.AbsoluteConstraints(840, 170, 110, -1));
        add(txtMaTaiKhoan, new org.netbeans.lib.awtextra.AbsoluteConstraints(1130, 80, 60, -1));

        cbbGioiTinh.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Nam", "Nữ" }));
        add(cbbGioiTinh, new org.netbeans.lib.awtextra.AbsoluteConstraints(1130, 130, 60, 20));

        txtADiaChi.setColumns(20);
        txtADiaChi.setRows(5);
        jScrollPane2.setViewportView(txtADiaChi);

        add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(840, 290, 260, 30));

        jLabel11.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel11.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/Màn hình đăng nhập.png"))); // NOI18N
        add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(-50, -10, -1, -1));
    }// </editor-fold>//GEN-END:initComponents

    
    /**
     * Tìm kiếm thông tin khách hàng
     * @throws SQLException 
     */
    public void TimKiemKhachHang() throws SQLException{
        String CusNo_In = txtTimKiemTheoMa.getText();
        try {
            KhachHang khData = new KhachHang();
            String arr[] = {"Mã khách hàng", "Tên khách hàng", "Giới tính", "Địa chỉ","SĐT"
                    , "Email","CCCD", "Mã tài khoản"};
            List <KhachHang> listKhachHang = khData.findKhachHang(CusNo_In);
            DefaultTableModel dtm = new DefaultTableModel(arr,0);
            tbThongTinKhachHang.removeAll();
            tbThongTinKhachHang.setModel(dtm);
            
            for (KhachHang kh : listKhachHang) {
                dtm.addRow(new Object[]{
                   kh.getMaKhachHangString(), kh.getTenKhachHang()
                  ,kh.getGioiTinh(), kh.getDiaChi()
                  ,kh.getSĐT(), kh.getEmail()
                  ,kh.getCCCD(), kh.getMaTaiKhoan()
                });
            }
            
            dtm.fireTableDataChanged();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ThongTinCacPhong.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private void btnTimKiemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTimKiemActionPerformed
        try {
            // TODO add your handling code here:

            TimKiemKhachHang();
        } catch (SQLException ex) {
            Logger.getLogger(ThongTinKhachHangPanel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnTimKiemActionPerformed

    private void btnLamMoiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLamMoiActionPerformed
        try {
            // TODO add your handling code here:
            txtTimKiemTheoMa.setText("");
            loadData();
        } catch (SQLException ex) {
            Logger.getLogger(ThongTinKhachHangPanel.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        cbbGioiTinh.setEnabled(true);
        txtMaKhachHang.setText("");
        txtTen.setText("");
        txtCCCD.setText("");
        txtADiaChi.setText("");
        txtEmail.setText("");
        txtMaTaiKhoan.setEnabled(true);
        txtMaTaiKhoan.setText("");
        txtSĐT.setText("");
    }//GEN-LAST:event_btnLamMoiActionPerformed

    private void btnSuaThongTinActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSuaThongTinActionPerformed
        // TODO add your handling code here:
        
        String maKhachHang = txtMaKhachHang.getText();
        String tenKhachHang = txtTen.getText();
        String diaChi = txtADiaChi.getText();
        
        String SĐT = txtSĐT.getText();
        String tempSĐT = "^[0-9]{10}$";
        Pattern patternSĐT = Pattern.compile(tempSĐT);
        Matcher matcherSĐT = patternSĐT.matcher(SĐT);
        
        String email = txtEmail.getText();
        String tempEmail = "^\\w+[a-z0-9]*@{1}\\w+mail.com";
        Pattern pattern = Pattern.compile(tempEmail);
        Matcher matcher = pattern.matcher(email);
        
        
        String CCCD = txtCCCD.getText();
        String tempCCCD = "^[0-9]{12}$";
        Pattern patternCCCD = Pattern.compile(tempCCCD);
        Matcher matcherCCCD = patternCCCD.matcher(CCCD);
        int index = 0;
        
        KhachHang kh = new KhachHang();
        
        try {
            
            if(tenKhachHang.equals("") || diaChi.equals("") || SĐT.equals("") 
                    || email.equals("") || CCCD.equals(""))
                JOptionPane.showMessageDialog(this, "Thông tin chưa đầy đủ"
                    , "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE);                
            else if(SĐT.length() > 10 || matcherSĐT.find() == false)
                JOptionPane.showMessageDialog(this, "SĐT chỉ có số và có 10 số"
                    , "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE); 
            else if(matcher.find() == false)
                JOptionPane.showMessageDialog(this, "Email phải có dạng ***@gmail.com"
                    , "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE); 
            else if(CCCD.length() > 12 || matcherCCCD.find() == false)
                JOptionPane.showMessageDialog(this, "CCCD chỉ có số và có 12 số"
                    , "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE); 
            else        
                index = kh.SuaThongTinKhachHang(maKhachHang, tenKhachHang, diaChi, SĐT, email, CCCD);
            
            if(index > 0){
                JOptionPane.showMessageDialog(this, "Sửa thông tin thành công");
                loadData();
            }
            else
                JOptionPane.showMessageDialog(this, "Sửa thông tin thất bại");
                
        } catch (HeadlessException | ClassNotFoundException | SQLException e) {
        }
    }//GEN-LAST:event_btnSuaThongTinActionPerformed

    private void btnXoaThongTinActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXoaThongTinActionPerformed
        // TODO add your handling code here:
        int ret = JOptionPane.showConfirmDialog(null, "Bạn có chắc muốn xóa","Xóa khách hàng",JOptionPane.YES_NO_OPTION);
        if (ret == JOptionPane.YES_OPTION){
            String maKhachHang = txtMaKhachHang.getText();
        
            int index = 0;
            KhachHang kh = new KhachHang();

            try {
                if(maKhachHang.equals(""))
                    JOptionPane.showMessageDialog(this, "Không thể để trống mã khách hàng"
                        , "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE); 
                try {
                    index = kh.xoaKhachHang(maKhachHang);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(ThongTinKhachHangPanel.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (index > 0) {
                    JOptionPane.showMessageDialog(this, "Xóa thành công");
                    loadData();
                } else {
                    JOptionPane.showMessageDialog(this, "Xóa thất bại");
                }
            } catch (HeadlessException | SQLException e) {
            }
        }  
    }//GEN-LAST:event_btnXoaThongTinActionPerformed

    /**
     * Hàm in thông tin lên các TextField
     * @param row 
     */
    private void displayToTextField(int row){
        txtMaKhachHang.setEnabled(false);
        txtMaKhachHang.setText((String) tbThongTinKhachHang.getModel().getValueAt(row, 0));
        
        
        txtTen.setText((String) tbThongTinKhachHang.getModel().getValueAt(row, 1));
        
        cbbGioiTinh.setEnabled(false);
        String GioiTinh = (String) tbThongTinKhachHang.getModel().getValueAt(row, 2);
        if(GioiTinh.equals("Nữ"))
            cbbGioiTinh.setSelectedIndex(1);
        else
            cbbGioiTinh.setSelectedIndex(0);
        
        txtADiaChi.setText((String) tbThongTinKhachHang.getModel().getValueAt(row, 3));
        
        txtSĐT.setText((String) tbThongTinKhachHang.getModel().getValueAt(row, 4));
        
        txtEmail.setText((String) tbThongTinKhachHang.getModel().getValueAt(row, 5));
        

        txtCCCD.setText((String) tbThongTinKhachHang.getModel().getValueAt(row, 6));
        
        txtMaTaiKhoan.setEnabled(false);
        txtMaTaiKhoan.setText((String) tbThongTinKhachHang.getModel().getValueAt(row, 7));
    }
    
    
    private void tbThongTinKhachHangMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tbThongTinKhachHangMouseClicked
        // TODO add your handling code here:
        
        int row = tbThongTinKhachHang.getSelectedRow();
        
        displayToTextField(row);
    }//GEN-LAST:event_tbThongTinKhachHangMouseClicked

    
    /**
     * Load dữ liệu khách hàng lên table
     * @throws SQLException 
     */
    private void loadData() throws SQLException{
        try {
            KhachHang khData = new KhachHang();
            String arr[] = {"Mã khách hàng", "Tên khách hàng", "Giới tính", "Địa chỉ","SĐT"
                    , "Email","CCCD", "Mã tài khoản"};
            List <KhachHang> listKhachHang = khData.getFullData();
            DefaultTableModel dtm = new DefaultTableModel(arr,0);
            tbThongTinKhachHang.removeAll();
            tbThongTinKhachHang.setModel(dtm);
            
            for (KhachHang kh : listKhachHang) {
                dtm.addRow(new Object[]{
                   kh.getMaKhachHangString(), kh.getTenKhachHang()
                  ,kh.getGioiTinh(), kh.getDiaChi()
                  ,kh.getSĐT(), kh.getEmail()
                  ,kh.getCCCD(), kh.getMaTaiKhoan()
                });
            }
            
            dtm.fireTableDataChanged();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ThongTinCacPhong.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnLamMoi;
    private javax.swing.JButton btnSuaThongTin;
    private javax.swing.JButton btnTimKiem;
    private javax.swing.JButton btnXoaThongTin;
    private javax.swing.JComboBox<String> cbbGioiTinh;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable tbThongTinKhachHang;
    private javax.swing.JTextArea txtADiaChi;
    private javax.swing.JTextField txtCCCD;
    private javax.swing.JTextField txtEmail;
    private javax.swing.JTextField txtMaKhachHang;
    private javax.swing.JTextField txtMaTaiKhoan;
    private javax.swing.JTextField txtSĐT;
    private javax.swing.JTextField txtTen;
    private javax.swing.JTextField txtTimKiemTheoMa;
    // End of variables declaration//GEN-END:variables
}
