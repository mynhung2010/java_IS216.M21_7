/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package View;

import DatabaseProcess.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;

/**
 *
 * @author Thanh Phat
 */
public class ThongTinNVPanel extends javax.swing.JPanel {

    /**
     * Creates new form ThongTinNV
     */
    public ThongTinNVPanel() {
        initComponents();
        this.txtTen.setEnabled(false);
        this.txtGioiTinh.setEnabled(false);
        this.txtNgayVaoLam.setEnabled(false);
        
        
        try {
            
            txtTen.setText(ShareData.nv.getTenNhanVien());
            txtNgaySinh.setText(ShareData.nv.getNgaySinh());
            txtNgayVaoLam.setText(ShareData.nv.getNgayVaoLam());
            txtGioiTinh.setText(ShareData.nv.getGioiTinh());
            txtEmail.setText(ShareData.nv.getEmail());
            txtSoDienThoai.setText(ShareData.nv.getSĐT());
        } catch (Exception e) {
            e.printStackTrace();
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

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txtTen = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txtNgaySinh = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        txtSoDienThoai = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txtGioiTinh = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        txtNgayVaoLam = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        txtEmail = new javax.swing.JTextField();
        btnTaoMoi = new javax.swing.JButton();
        btnSua = new javax.swing.JButton();
        jLabel8 = new javax.swing.JLabel();

        setBackground(new java.awt.Color(204, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("THÔNG TIN CÁ NHÂN");
        add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 20, 235, -1));

        jLabel2.setText("Tên:");
        add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 90, -1, -1));
        add(txtTen, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 90, 176, -1));

        jLabel3.setText("Ngày sinh:");
        add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 130, -1, -1));
        add(txtNgaySinh, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 130, 176, -1));

        jLabel4.setText("SĐT:");
        add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 170, -1, -1));
        add(txtSoDienThoai, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 170, 176, -1));

        jLabel5.setText("Giới tính:");
        add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 90, -1, -1));
        add(txtGioiTinh, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 90, 89, -1));

        jLabel7.setText("Ngày vào làm:");
        add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 130, -1, -1));
        add(txtNgayVaoLam, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 130, 150, -1));

        jLabel6.setText("Email:");
        add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 210, -1, -1));
        add(txtEmail, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 200, 176, -1));

        btnTaoMoi.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_restart_16px.png"))); // NOI18N
        btnTaoMoi.setText("Tạo mới");
        btnTaoMoi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTaoMoiActionPerformed(evt);
            }
        });
        add(btnTaoMoi, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 270, -1, -1));

        btnSua.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_renew_16px.png"))); // NOI18N
        btnSua.setText("Sửa thông tin");
        btnSua.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSuaActionPerformed(evt);
            }
        });
        add(btnSua, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 270, -1, -1));

        jLabel8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/employees.png"))); // NOI18N
        jLabel8.setText("jLabel8");
        add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(610, 0, 490, 470));
    }// </editor-fold>//GEN-END:initComponents

    private void btnTaoMoiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTaoMoiActionPerformed
        // TODO add your handling code here:
        txtSoDienThoai.setText("");
        txtEmail.setText("");
        txtNgaySinh.setText("");
    }//GEN-LAST:event_btnTaoMoiActionPerformed

    private void btnSuaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSuaActionPerformed
        // TODO add your handling code here:
        
        String EmpName_In = txtTen.getText();
        
        String phone_In = txtSoDienThoai.getText();
        String tempSĐT = "^[0-9]{10}$";
        Pattern patternSĐT = Pattern.compile(tempSĐT);
        Matcher matcherSĐT = patternSĐT.matcher(phone_In);
        
        String email_in = txtEmail.getText();
        String tempEmail = "^\\w+[a-z0-9]*@{1}\\w+mail.com";
        Pattern pattern = Pattern.compile(tempEmail);
        Matcher matcher = pattern.matcher(email_in);
        
        int index = 0;
        
        NhanVien nv = new NhanVien();
        
        try {
            if(phone_In.equals("") || email_in.equals(""))
                JOptionPane.showMessageDialog(this, "Thông tin chưa đầy đủ"
                        , "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE);                 
            else if(phone_In.length() > 10 || matcherSĐT.find() == false)
                JOptionPane.showMessageDialog(this, "SĐT chỉ có số và không quá 10 số"
                        , "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE); 
            else if(matcher.find() == false)
                JOptionPane.showMessageDialog(this, "Email phải có dạng ***@gmail.com"
                        , "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE); 
            else
                index = nv.SuaNhanVien(EmpName_In, phone_In, email_in);
            
            
            if(index > 0){
                JOptionPane.showMessageDialog(this, "Sửa thông tin thành công");
            }
            else
                JOptionPane.showMessageDialog(this, "Sửa thông tin thất bại");
                
        } catch (Exception e) {
        }
    }//GEN-LAST:event_btnSuaActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnSua;
    private javax.swing.JButton btnTaoMoi;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JTextField txtEmail;
    private javax.swing.JTextField txtGioiTinh;
    private javax.swing.JTextField txtNgaySinh;
    private javax.swing.JTextField txtNgayVaoLam;
    private javax.swing.JTextField txtSoDienThoai;
    private javax.swing.JTextField txtTen;
    // End of variables declaration//GEN-END:variables
}
