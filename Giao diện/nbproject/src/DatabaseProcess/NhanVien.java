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
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Thanh Phat
 */
public class NhanVien {
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    
    /**
     * Thuộc tính nhân viên
     */
    
    private String maNhanVien;
    private String GioiTinh;
    private String tenNhanVien;
    private String ngaySinh;
    private String SĐT; 
    private String ngayVaoLam;
    private String email;
    private String maTaiKhoan;
    private String maChucVu;
    
    
    /**
     * Các hàm khởi tạo + get/set
     */
    public NhanVien() {
        
    }

    public NhanVien(String maNhanVien, String GioiTinh, String tenNhanVien, String ngaySinh, String SĐT, String ngayVaoLam, String email, String maTaiKhoan, String maChucVu) {
        this.maNhanVien = maNhanVien;
        this.GioiTinh = GioiTinh;
        this.tenNhanVien = tenNhanVien;
        this.ngaySinh = ngaySinh;
        this.SĐT = SĐT;
        this.ngayVaoLam = ngayVaoLam;
        this.email = email;
        this.maTaiKhoan = maTaiKhoan;
        this.maChucVu = maChucVu;
    }

    public String getMaChucVu() {
        return maChucVu;
    }

    public void setMaChucVu(String maChucVu) {
        this.maChucVu = maChucVu;
    }

    
    
    public String getMaNhanVien() {
        return maNhanVien;
    }

    public void setMaNhanVien(String maNhanVien) {
        this.maNhanVien = maNhanVien;
    }

    public String getGioiTinh() {
        return GioiTinh;
    }

    public void setGioiTinh(String GioiTinh) {
        this.GioiTinh = GioiTinh;
    }

    public String getTenNhanVien() {
        return tenNhanVien;
    }

    public void setTenNhanVien(String tenNhanVien) {
        this.tenNhanVien = tenNhanVien;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getSĐT() {
        return SĐT;
    }

    public void setSĐT(String SĐT) {
        this.SĐT = SĐT;
    }

    public String getNgayVaoLam() {
        return ngayVaoLam;
    }

    public void setNgayVaoLam(String ngayVaoLam) {
        this.ngayVaoLam = ngayVaoLam;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(String maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    
    /**
     * Tìm mã nhân viên hiện tại
     * @param maNhanVien
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public String getMaNVHienTai(String maNhanVien) throws SQLException, ClassNotFoundException{
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Select EmpNo FROM Employee WHERE EmpNo = '" + maNhanVien + "'";
        Statement stat = conn.createStatement();
        
        String maHienTai = "";
        
        try(ResultSet kq = stat.executeQuery(query)){
            while(kq.next()){
                NhanVien nv = new NhanVien();
                
                nv.setMaNhanVien(kq.getString("EmpNo"));
                
                maHienTai = nv.getMaNhanVien();
                
            }
            return maHienTai;
        }
    }
    
    /**
     * Tìm xem mã email đã có chưa
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
                NhanVien nv = new NhanVien();
                
                nv.setEmail(kq.getString("Email"));
                
                emailHienTai = nv.getEmail();
                
            }
            return emailHienTai;
        }
    }
    
    
    /**
     * Thêm nhân viên mới
     * Chỉ có quản lý được làm
     * @param Emp_No
     * @param Emp_Name
     * @param SĐT
     * @param PosNo
     * @param dob
     * @param Gender
     * @param startDate
     * @param Email
     * @param AccountID
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int ThemNhanVienMoi(String Emp_No, String Emp_Name,String SĐT
            , String PosNo, String dob, int Gender
            ,String startDate,String Email, int AccountID) throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                     + "proc_insert_employee('" + Emp_No + "','" + Emp_Name 
                     + "','" + SĐT + "','"  + PosNo + "',"
                     + "TO_DATE('" + dob  + "','" + "dd/mm/yyyy')" + "," 
                     + Gender + ","
                     + "TO_DATE('" + startDate  + "','" + "dd/mm/yyyy')" 
                     + ",'" + Email + "'," + AccountID + ");"
                     + " End; ";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    
    /**
     * Hàm xóa nhân viên
     * @param Emp_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int XoaNhanVien(String Emp_No)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_delete_employee('" + Emp_No + "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    
    /**
     * Hàm sửa nhân viên cho chính nhân viên
     * @param Emp_name
     * @param SĐT
     * @param Email
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int SuaNhanVien(String Emp_name, String SĐT, String Email) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "UPDATE Employee "
                + " SET phone = '" + SĐT + "',Email = '" + Email + "'"
                + " WHERE EmpName = '" + Emp_name + "'";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    /**
     * Hàm sửa nhân viên được thực hiện bởi nhân viên quản lý
     * @param Emp_No
     * @param Emp_Name
     * @param SĐT
     * @param PosNo
     * @param startDate
     * @param Email
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int suaNhanVienDoQL(String Emp_No, String Emp_Name,String SĐT
            , String PosNo, String startDate,String Email) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                     + "proc_update_employee('" + Emp_No + "','" + Emp_Name 
                     + "','" + SĐT + "','"  + PosNo + "',"
                     + "TO_DATE('" + startDate  + "','" + "dd/mm/yyyy')" 
                     + ",'" + Email + "');"
                     + " End; ";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    /**
     * Hàm lấy thông tin
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<NhanVien> getFullData() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * "
                     + " FROM Employee E join Position P on E.PosNo = P.PosNo "
                     + " ORDER BY E.EmpNo";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<NhanVien> NhanVienData = new ArrayList<>();
            
            while(kq.next()){
                NhanVien nv = new NhanVien();
                
                nv.setMaNhanVien(kq.getString("EmpNo"));
                nv.setTenNhanVien(kq.getString("EmpName"));
                
                nv.setSĐT(kq.getString("phone"));
                
                nv.setMaChucVu(kq.getString("PosNo"));
                
                String birthDate = "";
                birthDate = sdf.format(kq.getDate("DateOfBirth"));
                nv.setNgaySinh(birthDate);
                
                
                String gioiTinh = kq.getString("Gender");
                if(gioiTinh.equals("0"))
                    nv.setGioiTinh("Nam");
                else
                    nv.setGioiTinh("Nữ");
                
                
                
                String startDate = "";
                startDate = sdf.format(kq.getDate("startDate"));
                nv.setNgayVaoLam(startDate);
                
                nv.setEmail(kq.getString("email"));
                
                nv.setMaTaiKhoan(kq.getString("accountID"));
                
                NhanVienData.add(nv);
            }
            return NhanVienData;
        }
    }
    
    /**
     * Tìm kiếm thông tin nhân viên
     * @param Emp_Name
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<NhanVien> timKiemNhanVien(String Emp_Name) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query =  "SELECT * "
                     + " FROM Employee E join Position P on E.PosNo = P.PosNo "
                     + " WHERE EmpName = '" + Emp_Name + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<NhanVien> NhanVienData = new ArrayList<>();
            
            while(kq.next()){
                NhanVien nv = new NhanVien();
                
                nv.setMaNhanVien(kq.getString("EmpNo"));
                nv.setTenNhanVien(kq.getString("EmpName"));
                
                nv.setSĐT(kq.getString("phone"));
                
                nv.setMaChucVu(kq.getString("PosNo"));
                
                String birthDate = "";
                birthDate = sdf.format(kq.getDate("DateOfBirth"));
                nv.setNgaySinh(birthDate);
                
                
                String gioiTinh = kq.getString("Gender");
                if(gioiTinh.equals("0"))
                    nv.setGioiTinh("Nam");
                else
                    nv.setGioiTinh("Nữ");
                
                
                
                String startDate = "";
                startDate = sdf.format(kq.getDate("startDate"));
                nv.setNgayVaoLam(startDate);
                
                nv.setEmail(kq.getString("email"));
                
                nv.setMaTaiKhoan(kq.getString("accountID"));
                NhanVienData.add(nv);
            }
            return NhanVienData;
        }
    }
}
