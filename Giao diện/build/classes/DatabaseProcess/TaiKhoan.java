/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DatabaseProcess;

import ConnectDB.ConnectionUtils;
import View.DangNhapFrame;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thanh Phat
 */
public class TaiKhoan {
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    
    /**
     * Tìm mã tài khoản hiện tại
     * @param maTaiKhoan
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int getMaTKHienTai(int maTaiKhoan) throws SQLException, ClassNotFoundException{
        
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Select AccountID FROM ACCOUNT WHERE AccountID = '" + maTaiKhoan + "'";
        Statement stat = conn.createStatement();
        
        int maHienTai = 0;
        
        try(ResultSet kq = stat.executeQuery(query)){
            //List<User> UserData = new ArrayList<>();
            while(kq.next()){
                User us = new User();
                
                us.setMaTaiKhoan(kq.getString("AccountID"));
                
                String maTK = us.getMaTaiKhoan();
                
                maHienTai = Integer.parseInt(maTK);
                
            }
            return maHienTai;
        }
    }    
    
    /**
     * Tìm mật khẩu hiện tại
     * @param taiKhoan
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public String getMatKhauHienTai(String taiKhoan) throws SQLException, ClassNotFoundException{
        
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Select Password FROM ACCOUNT WHERE username = '" + taiKhoan + "'";
        Statement stat = conn.createStatement();
        
        String matKhauHienTai = "";
        
        try(ResultSet kq = stat.executeQuery(query)){
            //List<User> UserData = new ArrayList<>();
            while(kq.next()){
                User us = new User();
                
                us.setMatKhau(kq.getString("Password"));
                
                matKhauHienTai = us.getMatKhau();
                
            }
            return matKhauHienTai;
        }
    }
    
    
    /**
     * Kiểm tra tài khoản đăng nhập
     * @param tenDangNhap
     * @param matkhau
     * @return
     * @throws Exception 
     */
    public User CheckLoginUser(String tenDangNhap, String matkhau) throws Exception{
        String query = "select username, Password, Role from ACCOUNT "
                + "where username = ? AND Password = ?";
        try (
            Connection conn = ConnectionUtils.getMyConnection();
            PreparedStatement stm = conn.prepareStatement(query);

        ){
            stm.setString(1, tenDangNhap);
            stm.setString(2, matkhau);
            try(ResultSet rs = stm.executeQuery()){
                if(rs.next()){
                    User us = new User();
                    us.setTenDangNhapString(tenDangNhap);
                    us.setVaiTro(rs.getString("Role"));
                    return us;
                }
            }
        }
        return null;
    }
    

    
    /**
     * Thông tin cá nhân của nhân viên quản lý đăng nhập vào hệ thống
     * @param tenDangNhap
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public NhanVienQuanLy ThongTinNhanVien(String tenDangNhap) throws SQLException, ClassNotFoundException{
       
        String query = "SELECT EmpName, Gender, DateOfBirth, startDate, phone, E.AccountID,email"
                + " FROM EMPLOYEE E JOIN Account A ON E.AccountID = A.AccountID"
                + " WHERE A.username = ?";
        try (
            Connection conn = ConnectionUtils.getMyConnection();
            PreparedStatement stm = conn.prepareStatement(query);

        ){
            stm.setString(1, tenDangNhap);
            try(ResultSet rs = stm.executeQuery()){
                if(rs.next()){
                    NhanVienQuanLy nvqlData = new NhanVienQuanLy();
                    nvqlData.setName(rs.getString("EmpName"));
                    
                    String birthDate = "";
                    birthDate = sdf.format(rs.getDate("DateOfBirth"));
                    nvqlData.setNgaySinhDate(birthDate);
                    
                    String startDate = "";
                    startDate = sdf.format(rs.getDate("startDate"));
                    nvqlData.setNgayVaoLamDate(startDate);
                    
                    nvqlData.setGioiTinh(rs.getInt("Gender"));
                    
                    nvqlData.setSoDienThoaiString(rs.getString("phone"));
                    
                    nvqlData.setMaTaiKhoan(rs.getInt("AccountID"));
                    
                    nvqlData.setEmail(rs.getString("email"));
                    return nvqlData;
                }
            }
        }
        return null;
    }
    
    
    /**
     * Hàm lấy thông tin nhân viên thường
     * @param tenDangNhap
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public NhanVien nhanVienInfo(String tenDangNhap) throws SQLException, ClassNotFoundException{
       
        String query = "SELECT EmpName, Gender, DateOfBirth, startDate, phone, email"
                + " FROM EMPLOYEE E JOIN Account A ON E.AccountID = A.AccountID"
                + " WHERE A.username = ?";
        try (
            Connection conn = ConnectionUtils.getMyConnection();
            PreparedStatement stm = conn.prepareStatement(query);

        ){
            stm.setString(1, tenDangNhap);
            try(ResultSet rs = stm.executeQuery()){
                if(rs.next()){
                    NhanVien nvData = new NhanVien();
                    nvData.setTenNhanVien(rs.getString("EmpName"));
                    
                    String birthDate = "";
                    birthDate = sdf.format(rs.getDate("DateOfBirth"));
                    nvData.setNgaySinh(birthDate);
                    
                    String startDate = "";
                    startDate = sdf.format(rs.getDate("startDate"));
                    nvData.setNgayVaoLam(startDate);
                    
                    String gioiTinh = rs.getString("Gender");
                    if(gioiTinh.equals("0"))
                        nvData.setGioiTinh("Nam");
                    else
                        nvData.setGioiTinh("Nữ");
                    
                    nvData.setSĐT(rs.getString("phone"));
                    nvData.setEmail(rs.getString("email"));
                    return nvData;
                }
            }
        }
        return null;
    }
    
    /**
     * Thông tin khách hàng
     * @param tenDangNhap
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public KhachHang khachHangInfo(String tenDangNhap) throws SQLException, ClassNotFoundException{
       
        String query = "SELECT CusNo, CUSNAME, Gender, ADDRESS, phone, email, ID"
                + " FROM Customer C JOIN Account A ON C.AccountID = A.AccountID"
                + " WHERE A.username = ?";
        try (
            Connection conn = ConnectionUtils.getMyConnection();
            PreparedStatement stm = conn.prepareStatement(query);

        ){
            stm.setString(1, tenDangNhap);
            try(ResultSet rs = stm.executeQuery()){
                if(rs.next()){
                    KhachHang khData = new KhachHang();
                    
                    khData.setMaKhachHangString(rs.getString("CusNo"));
                    
                    khData.setTenKhachHang(rs.getString("CUSNAME"));
                    
                    String gioiTinh = rs.getString("Gender");
                    if(gioiTinh.equals("0"))
                        khData.setGioiTinh("Nam");
                    else
                        khData.setGioiTinh("Nữ");
                    
                    khData.setDiaChi(rs.getString("ADDRESS"));
                    
                    khData.setSĐT(rs.getString("phone"));
                    
                    khData.setEmail(rs.getString("email"));
                    
                    khData.setCCCD(rs.getString("ID"));
                    return khData;
                }
            }
        }
        return null;
    }
    
    /**
     * Hàm đổi mật khẩu
     * @param tenDangNhap
     * @param matKhauCu
     * @param matKhauMoi
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int DoiMatKhau(String tenDangNhap, String matKhauCu, String matKhauMoi) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                        + "proc_change_password('" + tenDangNhap 
                        + "','" + matKhauCu + "','" + matKhauMoi + "');"
                        + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    
    /**
     * Hàm thêm tài khoản
     * @param maTaiKhoan
     * @param tenTaiKhoan
     * @param matKhau
     * @param VaiTro
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int ThemTaiKhoan(int maTaiKhoan, String tenTaiKhoan, String matKhau, String VaiTro) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                        + "proc_insert_account(" + maTaiKhoan 
                        + ",'" + tenTaiKhoan + "','" + matKhau 
                        + "','" + VaiTro + "');"
                        + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    
    
    /**
     * Hàm load thông tin tài khoản
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
    */
    public List<User> getFullData() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * "
                     + " FROM Account "
                     + " ORDER BY AccountID ";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<User> NguoiDungData = new ArrayList<>();
            
            while(kq.next()){
                User us = new User();
                
                
                us.setMaTaiKhoan(kq.getString("AccountID"));
                
                us.setTenDangNhapString(kq.getString("username"));
                
                us.setVaiTro(kq.getString("Role"));
                
                NguoiDungData.add(us);
            }
            return NguoiDungData;
        }
    }
    
    /**
     * Tìm các mã tài khoản
     * @param role
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<Integer> listTKNhanVien(String role) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT ACCOUNTID "
                     + " FROM ACCOUNT "
                     + " WHERE Role = '" + role + "'"
                     + " ORDER BY ACCOUNTID ";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<Integer> tkData = new ArrayList<>();
            
            while(kq.next()){
                User us = new User();
                
                
                us.setMaTaiKhoan(kq.getString("AccountID"));
                
                String maTk = us.getMaTaiKhoan();
                
                tkData.add(Integer.parseInt(maTk));
            }
            return tkData;
        }
    }
    
    
    /**
     * Hàm tìm tài khoản
     * @param username
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<User> TimTaiKhoan(String username) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = " SELECT * "
                     + " FROM Account "
                     + " WHERE username = '" + username + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<User> NguoiDungData = new ArrayList<>();
            
            while(kq.next()){
                User us = new User();
                
                
                us.setMaTaiKhoan(kq.getString("AccountID"));
                
                us.setTenDangNhapString(kq.getString("username"));
                
                us.setVaiTro(kq.getString("Role"));
                
                NguoiDungData.add(us);
            }
            return NguoiDungData;
        }
    }
    
    /**
     * Hàm xóa tài khoản
     * @param Account_ID
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int XoaTaiKhoan(int Account_ID)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + " proc_delete_account(" + Account_ID + ");"
                + " End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    
    /**
     * Hàm sửa thông tin tài khoản
     * @param Account_ID
     * @param role_acc
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int SuaTaiKhoan(int Account_ID, String role_acc)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_update_account(" + Account_ID + ",'" + role_acc + "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
}
