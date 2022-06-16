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
import java.util.Date;

/**
 *
 * @author Thanh Phat
 */
public class NhanVienQuanLy {
    private String name;
    private int gioiTinh;
    private String ngaySinhDate;
    private String ngayVaoLamDate;
    private String soDienThoaiString;
    private String Email;
    private int maTaiKhoan;
    private String diaChi;

    public NhanVienQuanLy(int maTaiKhoan, String diaChi,String name, int gioiTinh, String ngaySinhDate, String ngayVaoLamDate, String soDienThoaiString, String Email) {
        this.name = name;
        this.gioiTinh = gioiTinh;
        this.ngaySinhDate = ngaySinhDate;
        this.ngayVaoLamDate = ngayVaoLamDate;
        this.soDienThoaiString = soDienThoaiString;
        this.Email = Email;
        this.diaChi = diaChi;
        this.maTaiKhoan = maTaiKhoan;
    }

    
    public NhanVienQuanLy() {
        
    }

    public int getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(int maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    
    
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(int gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getNgaySinhDate() {
        return ngaySinhDate;
    }

    public void setNgaySinhDate(String ngaySinhDate) {
        this.ngaySinhDate = ngaySinhDate;
    }

    public String getNgayVaoLamDate() {
        return ngayVaoLamDate;
    }

    public void setNgayVaoLamDate(String ngayVaoLamDate) {
        this.ngayVaoLamDate = ngayVaoLamDate;
    }

    public String getSoDienThoaiString() {
        return soDienThoaiString;
    }

    public void setSoDienThoaiString(String soDienThoaiString) {
        this.soDienThoaiString = soDienThoaiString;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
  
    /**
     * Tìm email xem có tồn tại chưa
     * @param Email
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public String getEmailHienTai(String Email) throws SQLException, ClassNotFoundException{
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Select Email FROM Employee WHERE Email = '" + Email + "'";
        Statement stat = conn.createStatement();
        
        String emailHienTai = "";
        
        try(ResultSet kq = stat.executeQuery(query)){
            while(kq.next()){
                NhanVienQuanLy nvql = new NhanVienQuanLy();
                
                nvql.setEmail(kq.getString("Email"));
                
                emailHienTai = nvql.getEmail();
                
            }
            return emailHienTai;
        }
    }
    
    
    /**
     * Sửa thông tin (của chính nhân viên quản lý)
     * @param maTaiKhoan
     * @param Emp_Name
     * @param SĐT
     * @param birthDate
     * @param startDate
     * @param Email
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int SuaNhanVien(int maTaiKhoan,String Emp_Name,String SĐT
            , String birthDate, String startDate,String Email) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "BEGIN "
                     + "proc_update_managementEmployee(" + maTaiKhoan 
                     + ",'" + Emp_Name + "','"  + SĐT + "',"
                     + "TO_DATE('" + birthDate  + "','" + "dd/mm/yyyy')" + ","
                     + "TO_DATE('" + startDate  + "','" + "dd/mm/yyyy')" 
                     + ",'" + Email + "');"
                     + " END;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
}
