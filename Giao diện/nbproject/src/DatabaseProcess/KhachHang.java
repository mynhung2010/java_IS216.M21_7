/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DatabaseProcess;

import ConnectDB.ConnectionUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thanh Phat
 */
public class KhachHang {
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    private String maKhachHangString, tenKhachHang;
    private String GioiTinh;
    private String diaChi;
    private String Email;
    private String SĐT, CCCD;
    private String maTaiKhoan;

    public KhachHang() {
        
    }

    public KhachHang(String maKhachHangString, String tenKhachHang, String GioiTinh, String SĐT, String CCCD, String maTaiKhoan, String diaChi, String Email) {
        this.maKhachHangString = maKhachHangString;
        this.tenKhachHang = tenKhachHang;
        this.GioiTinh = GioiTinh;
        this.SĐT = SĐT;
        this.CCCD = CCCD;
        this.maTaiKhoan = maTaiKhoan;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    
    
    public String getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(String maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    
    
    public String getMaKhachHangString() {
        return maKhachHangString;
    }

    public void setMaKhachHangString(String maKhachHangString) {
        this.maKhachHangString = maKhachHangString;
    }

    public String getTenKhachHang() {
        return tenKhachHang;
    }

    public void setTenKhachHang(String tenKhachHang) {
        this.tenKhachHang = tenKhachHang;
    }

    public String getGioiTinh() {
        return GioiTinh;
    }

    public void setGioiTinh(String GioiTinh) {
        this.GioiTinh = GioiTinh;
    }

    public String getSĐT() {
        return SĐT;
    }

    public void setSĐT(String SĐT) {
        this.SĐT = SĐT;
    }

    public String getCCCD() {
        return CCCD;
    }

    public void setCCCD(String CCCD) {
        this.CCCD = CCCD;
    }
    
    /**
     * Tìm xem email đã tồn tại hay chưa
     * @param Email
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public String getEmailHienTai(String Email) throws SQLException, ClassNotFoundException{
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Select Email FROM Customer WHERE Email = '" + Email + "'";
        Statement stat = conn.createStatement();
        
        String emailHienTai = "";
        
        try(ResultSet kq = stat.executeQuery(query)){
            while(kq.next()){
                KhachHang kh = new KhachHang();
                
                kh.setEmail(kq.getString("Email"));
                
                emailHienTai = kh.getEmail();
                
            }
            return emailHienTai;
        }
    }
    
    /**
     * Hàm lấy thông tin khách hàng
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<KhachHang> getFullData() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * "
                + " FROM Customer "
                + " ORDER BY CusNo ";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<KhachHang> khachHangData = new ArrayList<>();
            
            while(kq.next()){
                KhachHang kh = new KhachHang();
                kh.setMaKhachHangString(kq.getString("CusNo"));
                
                kh.setTenKhachHang(kq.getString("CusName"));
                
                String gioiTinh = kq.getString("Gender");
                if(gioiTinh.equals("0"))
                    kh.setGioiTinh("Nam");
                else
                    kh.setGioiTinh("Nữ");
                
                
                kh.setDiaChi(kq.getString("Address"));
                
                kh.setSĐT(kq.getString("phone"));
                
                kh.setEmail(kq.getString("Email"));
                
                kh.setCCCD(kq.getString("ID"));
                
                kh.setMaTaiKhoan(kq.getString("AccountID"));
                khachHangData.add(kh);
            }
            return khachHangData;
        }
    }
    
    /**
     * Hàm tìm thông tin khách hàng
     * @param Cus_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<KhachHang> findKhachHang(String Cus_No) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT *"
                + " FROM Customer "
                + " WHERE CusNo = '" + Cus_No + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<KhachHang> khachHangData = new ArrayList<>();
            
            while(kq.next()){
                KhachHang kh = new KhachHang();
                kh.setMaKhachHangString(kq.getString("CusNo"));
                
                kh.setTenKhachHang(kq.getString("CusName"));
                
                String gioiTinh = kq.getString("Gender");
                if(gioiTinh.equals("0"))
                    kh.setGioiTinh("Nam");
                else
                    kh.setGioiTinh("Nu");
                
                
                kh.setDiaChi(kq.getString("Address"));
                
                kh.setSĐT(kq.getString("phone"));
                
                kh.setEmail(kq.getString("Email"));
                
                kh.setCCCD(kq.getString("ID"));
                
                kh.setMaTaiKhoan(kq.getString("AccountID"));
                khachHangData.add(kh);
            }
            return khachHangData;
        }
    }
    
    /**
     * Tìm thông tin của 1 khách hàng
     * @param Cus_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public KhachHang ThongTinKhachHang(String Cus_No) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT CUSNAME, ID,ADDRESS,PHONE"
                + " FROM Customer "
                + " WHERE CusNo = '" + Cus_No + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            
            while(kq.next()){
                KhachHang kh = new KhachHang();
                
                kh.setTenKhachHang(kq.getString("CusName"));
                
                kh.setCCCD(kq.getString("ID"));
                
                kh.setDiaChi(kq.getString("Address"));
                
                kh.setSĐT(kq.getString("phone"));
                
                return kh;
            }
        }
        return null;
    }
    
    
    /**
     * Sửa thông tin khách hàng
     * @param Cus_No
     * @param Cus_Name
     * @param Gender
     * @param Address
     * @param phoneNo
     * @param email
     * @param CID
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int SuaThongTinKhachHang(String Cus_No, String Cus_Name
            , String Address, String phoneNo, String email, String CID)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_update_cus('" + Cus_No + "','" + Cus_Name 
                + "','" + Address + "','" + phoneNo + "','"
                + email + "','" + CID + "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    /**
     * Hàm xóa thông tin khách hàng
     * @param Cus_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int xoaKhachHang(String Cus_No)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_delete_cus('" + Cus_No + "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
}
