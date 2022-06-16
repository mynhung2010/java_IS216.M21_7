/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package View;

import javax.swing.JOptionPane;

/**
 *
 * @author Thanh Phat
 */
public class TrangNhanVien extends javax.swing.JFrame {
    private DangNhapFrame loginInfo;
    /**
     * Creates new form TrangNhanVien
     */
    public TrangNhanVien() {
        initComponents();
        this.setLocationRelativeTo(null);
        this.setResizable(false);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        tplMainBoard = new javax.swing.JTabbedPane();
        pTaiKhoan = new javax.swing.JPanel();
        thongTinTaiKhoan1 = new View.ThongTinTaiKhoan();
        jButton1 = new javax.swing.JButton();
        pThongTinCaNhan = new javax.swing.JPanel();
        thongTinNVPanel1 = new View.ThongTinNVPanel();
        pDatPhong = new javax.swing.JPanel();
        try {
            thongTinDatPhong1 = new View.ThongTinDatPhong();
        } catch (java.sql.SQLException e1) {
            e1.printStackTrace();
        }
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        pThongTinHoaDon = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        try {
            thongTinHoaDonPanel1 = new View.ThongTinHoaDonPanel();
        } catch (java.sql.SQLException e1) {
            e1.printStackTrace();
        }
        pBangDichVu = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        pDichVuDat = new javax.swing.JPanel();
        jPanel5 = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        try {
            thongTinDichVuDaDat1 = new View.ThongTinDichVuDaDat();
        } catch (java.sql.SQLException e1) {
            e1.printStackTrace();
        }
        pQuanLyKhachHang = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        try {
            thongTinKhachHangPanel1 = new View.ThongTinKhachHangPanel();
        } catch (java.sql.SQLException e1) {
            e1.printStackTrace();
        }

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Trang nhân viên");

        tplMainBoard.setTabPlacement(javax.swing.JTabbedPane.LEFT);

        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_Logout_16px.png"))); // NOI18N
        jButton1.setText("Đăng xuất");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout pTaiKhoanLayout = new javax.swing.GroupLayout(pTaiKhoan);
        pTaiKhoan.setLayout(pTaiKhoanLayout);
        pTaiKhoanLayout.setHorizontalGroup(
            pTaiKhoanLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pTaiKhoanLayout.createSequentialGroup()
                .addComponent(thongTinTaiKhoan1, javax.swing.GroupLayout.PREFERRED_SIZE, 431, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 1479, Short.MAX_VALUE))
            .addGroup(pTaiKhoanLayout.createSequentialGroup()
                .addGap(101, 101, 101)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 151, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        pTaiKhoanLayout.setVerticalGroup(
            pTaiKhoanLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pTaiKhoanLayout.createSequentialGroup()
                .addComponent(thongTinTaiKhoan1, javax.swing.GroupLayout.PREFERRED_SIZE, 191, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButton1)
                .addGap(0, 573, Short.MAX_VALUE))
        );

        tplMainBoard.addTab("Thông tin tài khoản", new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_info_16px.png")), pTaiKhoan, ""); // NOI18N

        pThongTinCaNhan.setBackground(new java.awt.Color(204, 255, 255));

        javax.swing.GroupLayout pThongTinCaNhanLayout = new javax.swing.GroupLayout(pThongTinCaNhan);
        pThongTinCaNhan.setLayout(pThongTinCaNhanLayout);
        pThongTinCaNhanLayout.setHorizontalGroup(
            pThongTinCaNhanLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pThongTinCaNhanLayout.createSequentialGroup()
                .addComponent(thongTinNVPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 810, Short.MAX_VALUE))
        );
        pThongTinCaNhanLayout.setVerticalGroup(
            pThongTinCaNhanLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pThongTinCaNhanLayout.createSequentialGroup()
                .addComponent(thongTinNVPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 330, Short.MAX_VALUE))
        );

        tplMainBoard.addTab("Thông tin cá nhân", new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_more_info_16px_1.png")), pThongTinCaNhan); // NOI18N

        pDatPhong.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());
        pDatPhong.add(thongTinDatPhong1, new org.netbeans.lib.awtextra.AbsoluteConstraints(-20, 100, 1290, 500));

        jPanel2.setBackground(new java.awt.Color(217, 163, 137));
        jPanel2.setForeground(new java.awt.Color(0, 51, 153));

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel2.setText("QUẢN LÝ THÔNG TIN ĐẶT PHÒNG");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(360, 360, 360)
                .addComponent(jLabel2)
                .addContainerGap(517, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(31, 31, 31)
                .addComponent(jLabel2)
                .addContainerGap(47, Short.MAX_VALUE))
        );

        pDatPhong.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1270, 110));

        tplMainBoard.addTab("Thông tin đặt phòng", new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_check_16px_1.png")), pDatPhong); // NOI18N

        pThongTinHoaDon.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel3.setBackground(new java.awt.Color(217, 163, 137));

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel3.setText("QUẢN LÝ HÓA ĐƠN");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(481, 481, 481)
                .addComponent(jLabel3)
                .addContainerGap(563, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(36, 36, 36)
                .addComponent(jLabel3)
                .addContainerGap(42, Short.MAX_VALUE))
        );

        pThongTinHoaDon.add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1270, 110));
        pThongTinHoaDon.add(thongTinHoaDonPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(-10, 100, 1280, 470));

        tplMainBoard.addTab("Thông tin hóa đơn", new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_bill_16px.png")), pThongTinHoaDon); // NOI18N

        pBangDichVu.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel4.setBackground(new java.awt.Color(217, 163, 137));

        jLabel4.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel4.setText("BẢNG DỊCH VỤ");

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap(497, Short.MAX_VALUE)
                .addComponent(jLabel4)
                .addGap(480, 480, 480))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addComponent(jLabel4)
                .addContainerGap(49, Short.MAX_VALUE))
        );

        pBangDichVu.add(jPanel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1150, 110));

        tplMainBoard.addTab("Bảng dịch vụ", new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_service_16px_1.png")), pBangDichVu); // NOI18N

        pDichVuDat.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel5.setBackground(new java.awt.Color(217, 163, 137));

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel5.setText("DỊCH VỤ ĐÃ ĐẶT");

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel5Layout.createSequentialGroup()
                .addContainerGap(475, Short.MAX_VALUE)
                .addComponent(jLabel5)
                .addGap(480, 480, 480))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addComponent(jLabel5)
                .addContainerGap(49, Short.MAX_VALUE))
        );

        pDichVuDat.add(jPanel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1150, 110));
        pDichVuDat.add(thongTinDichVuDaDat1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 110, -1, -1));

        tplMainBoard.addTab("Các dịch vụ đã đặt", new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_list_16px.png")), pDichVuDat); // NOI18N

        pQuanLyKhachHang.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel1.setText("QUẢN LÝ DANH SÁCH KHÁCH HÀNG");
        pQuanLyKhachHang.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(366, 34, -1, -1));

        jPanel1.setBackground(new java.awt.Color(217, 163, 137));

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1250, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 110, Short.MAX_VALUE)
        );

        pQuanLyKhachHang.add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1250, 110));
        pQuanLyKhachHang.add(thongTinKhachHangPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, -240, -1, 780));

        tplMainBoard.addTab("Quản lý khách hàng", new javax.swing.ImageIcon(getClass().getResource("/Source/icons8_customer_16px.png")), pQuanLyKhachHang); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(tplMainBoard, javax.swing.GroupLayout.PREFERRED_SIZE, 1453, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(tplMainBoard, javax.swing.GroupLayout.PREFERRED_SIZE, 607, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
                int ret = JOptionPane.showConfirmDialog(null, "Bạn có muốn đăng xuất","Đăng xuất",JOptionPane.YES_NO_OPTION);
        if (ret == JOptionPane.YES_OPTION){
            this.dispose();
            
            loginInfo = new DangNhapFrame();
            loginInfo.setVisible(true);
        }
    }//GEN-LAST:event_jButton1ActionPerformed


    
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
            java.util.logging.Logger.getLogger(TrangNhanVien.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(TrangNhanVien.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(TrangNhanVien.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(TrangNhanVien.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new TrangNhanVien().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel pBangDichVu;
    private javax.swing.JPanel pDatPhong;
    private javax.swing.JPanel pDichVuDat;
    private javax.swing.JPanel pQuanLyKhachHang;
    private javax.swing.JPanel pTaiKhoan;
    private javax.swing.JPanel pThongTinCaNhan;
    private javax.swing.JPanel pThongTinHoaDon;
    private View.ThongTinDatPhong thongTinDatPhong1;
    private View.ThongTinDichVuDaDat thongTinDichVuDaDat1;
    private View.ThongTinHoaDonPanel thongTinHoaDonPanel1;
    private View.ThongTinKhachHangPanel thongTinKhachHangPanel1;
    private View.ThongTinNVPanel thongTinNVPanel1;
    private View.ThongTinTaiKhoan thongTinTaiKhoan1;
    private javax.swing.JTabbedPane tplMainBoard;
    // End of variables declaration//GEN-END:variables
}
