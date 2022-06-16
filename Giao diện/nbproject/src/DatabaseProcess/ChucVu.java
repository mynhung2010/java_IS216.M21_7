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

/**
 *
 * @author Thanh Phat
 */
public class ChucVu {
    private String maChucVu, tenChucVu, maNhanVien;

    
    /**
     * Constructor + các hàm get/set
     */
    public ChucVu() {
    }

    public ChucVu(String maChucVu, String tenChucVu, String maNhanVien) {
        this.maChucVu = maChucVu;
        this.tenChucVu = tenChucVu;
        this.maNhanVien = maNhanVien;
    }

    public String getMaChucVu() {
        return maChucVu;
    }

    public void setMaChucVu(String maChucVu) {
        this.maChucVu = maChucVu;
    }

    public String getTenChucVu() {
        return tenChucVu;
    }

    public void setTenChucVu(String tenChucVu) {
        this.tenChucVu = tenChucVu;
    }

    public String getMaNhanVien() {
        return maNhanVien;
    }

    public void setMaNhanVien(String maNhanVien) {
        this.maNhanVien = maNhanVien;
    }
    
    /**
     * Tìm mã chức vụ hiện tại
     * @param maChucVu
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public String getMaCVHienTai(String maChucVu) throws SQLException, ClassNotFoundException{
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Select PosNo FROM Position WHERE PosNo = '" + maChucVu + "'";
        Statement stat = conn.createStatement();
        
        String maHienTai = "";
        
        try(ResultSet kq = stat.executeQuery(query)){
            while(kq.next()){
                ChucVu cv = new ChucVu();
                
                cv.setMaChucVu(kq.getString("PosNo"));
                
                maHienTai = cv.getMaChucVu();
                
            }
            return maHienTai;
        }
    }
    
    
    /**
     * Hàm lấy thông tin chức vụ
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<ChucVu> getFullData() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * "
                + " FROM Position "
                + " ORDER BY PosNo ";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<ChucVu> chucVuData = new ArrayList<>();
            
            while(kq.next()){
                ChucVu cv = new ChucVu();
                
                cv.setMaChucVu(kq.getString("POSNO"));
                
                cv.setTenChucVu(kq.getString("POSNAME"));
                
                cv.setMaNhanVien(kq.getString("EMPNO"));
                
                chucVuData.add(cv);
            }
            return chucVuData;
        }
    }
    
    /**
     * Tìm chức vụ
     * @param Pos_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<ChucVu> TimChucVu(String Pos_No) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * "
                + " FROM Position "
                + " WHERE PosNo = '" + Pos_No + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<ChucVu> chucVuData = new ArrayList<>();
            
            while(kq.next()){
                ChucVu cv = new ChucVu();
                
                cv.setMaChucVu(kq.getString("POSNO"));
                
                cv.setTenChucVu(kq.getString("POSNAME"));
                
                cv.setMaNhanVien(kq.getString("EMPNO"));
                
                chucVuData.add(cv);
            }
            return chucVuData;
        }
    }

    /**
     * Hàm thêm chức vụ mới
     * @param Pos_No
     * @param Pos_name
     * @param Emp_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int ThemChucVu(String Pos_No, String Pos_name, String Emp_No) throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + " proc_insert_position('" + Pos_No + "','" 
                + Pos_name + "','" + Emp_No  + "');"
                + " End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    
    /**
     * Xóa chức vụ
     * @param maChucVu
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int XoaChucVu(String maChucVu)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + " proc_delete_position('" + maChucVu + "');"
                + " End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    /**
     * Hàm sửa chức vụ
     * @param maChucVu
     * @param tenChucVu
     * @param maNhanVien
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int SuaChucVu(String maChucVu, String tenChucVu, String maNhanVien)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + " proc_update_position('" + maChucVu 
                + "','" + tenChucVu  
                + "','" + maNhanVien + "');"
                + " End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
}
