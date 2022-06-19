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
public class DichVu {
    private String maPhong;
    private String maDichVuString, tenDichVu, loaiHinh, gia;
    private String ghiChu;
    private String maHoaDon;

    /**
     * Constructor + các hàm get/set
     */
    public DichVu() {
    }

    public DichVu(String maHoaDon,String maDichVuString, String tenDichVu, String loaiHinh, String gia, String ghiChu,String maPhong) {
        this.maDichVuString = maDichVuString;
        this.tenDichVu = tenDichVu;
        this.loaiHinh = loaiHinh;
        this.gia = gia;
        this.ghiChu = ghiChu;
        this.maPhong = maPhong;
        this.maHoaDon = maHoaDon;
    }

    public String getMaHoaDon() {
        return maHoaDon;
    }

    public void setMaHoaDon(String maHoaDon) {
        this.maHoaDon = maHoaDon;
    }
    
    

    public String getMaPhong() {
        return maPhong;
    }

    public void setMaPhong(String maPhong) {
        this.maPhong = maPhong;
    }

    
    
    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public String getMaDichVuString() {
        return maDichVuString;
    }

    public void setMaDichVuString(String maDichVuString) {
        this.maDichVuString = maDichVuString;
    }

    public String getTenDichVu() {
        return tenDichVu;
    }

    public void setTenDichVu(String tenDichVu) {
        this.tenDichVu = tenDichVu;
    }

    public String getLoaiHinh() {
        return loaiHinh;
    }

    public void setLoaiHinh(String loaiHinh) {
        this.loaiHinh = loaiHinh;
    }

    public String getGia() {
        return gia;
    }

    public void setGia(String gia) {
        this.gia = gia;
    }
    
    /**
     * Tìm mã dịch vụ có tồn tại
     * @param maDichVu
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public String getMaDVTonTai(String maDichVu) throws SQLException, ClassNotFoundException{
        
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Select SerNo FROM Service WHERE SerNo = '" + maDichVu + "'";
        Statement stat = conn.createStatement();
        
        String maHienTai = "";
        
        try(ResultSet kq = stat.executeQuery(query)){
            //List<User> UserData = new ArrayList<>();
            while(kq.next()){
                DichVu dv = new DichVu();
                
                dv.setMaDichVuString(kq.getString("SerNo"));
                
                String maDv = dv.getMaDichVuString();
                
                maHienTai = maDv;
                
            }
            return maHienTai;
        }
    }   
    
    
    /**
     * Thông tin dịch vụ
     * @param maDatPhong
     * @param maHoaDon
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<DichVu> thongTinDichVu(String maDatPhong, String maHoaDon) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query =   "SELECT distinct S.SerNo, S.SerName "
                       + "FROM SERVICE S JOIN SERVICECALLED SER ON S.SerNo = SER.SerNo "
                       + "               JOIN RESERVATION RE ON SER.RoomNo = RE.RoomNo "
                       + " WHERE ResNo = '" + maDatPhong + "' and SER.billNo = '" + maHoaDon + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<DichVu> dichVuData = new ArrayList<>();
            
            while(kq.next()){
                DichVu dv = new DichVu();
                
                dv.setMaDichVuString(kq.getString("SerNo"));
                
                dv.setTenDichVu(kq.getString("SerName"));
                
                dichVuData.add(dv);
            }
            return dichVuData;
        }
    }
    
    
    /**
     * Hàm tìm tất cả dịch vụ đã đặt
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<DichVu> DichVuDaDat() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query =   "select  BillNo, RoomNo, SerNo, note "
                       + "from servicecalled "
                       + "group by billNo,roomNo, SerNo, note "  
                       + "order by BillNo";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<DichVu> dichVuData = new ArrayList<>();
            
            while(kq.next()){
                DichVu dv = new DichVu();
                
                dv.setMaHoaDon(kq.getString("billNo"));
                
                dv.setMaPhong(kq.getString("RoomNo"));
                
                dv.setMaDichVuString(kq.getString("SerNo"));
                
                dv.setGhiChu(kq.getString("Note"));
                
                dichVuData.add(dv);
            }
            return dichVuData;
        }
    }
    
    /**
     * Tìm các dịch vụ đã đặt của 1 phòng
     * @param roomNo
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<DichVu> TimDichVuDaDat(String roomNo) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query =    "select  BillNo, RoomNo, SerNo, note "
                       + "from servicecalled "
                       + "where roomNo = '" + roomNo + "'"
                       + "group by billNo,roomNo, SerNo, note "  
                       + "order by BillNo";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<DichVu> dichVuData = new ArrayList<>();
            
            while(kq.next()){
                DichVu dv = new DichVu();
                
                dv.setMaHoaDon(kq.getString("billNo"));
                
                dv.setMaPhong(kq.getString("RoomNo"));
                
                dv.setMaDichVuString(kq.getString("SerNo"));
                
                dv.setGhiChu(kq.getString("Note"));
                
                dichVuData.add(dv);
            }
            return dichVuData;
        }
    }
    
    /**
     * Sửa dịch vụ đặt (Do nhân viên)
     * @param Room_No
     * @param Bill_No
     * @param Ser_OLD
     * @param note_update
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int suaDichVuDaDat(String Room_No, String Bill_No, String Ser_OLD, String note_update)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_update_Sercall('" + Room_No + "','" + Bill_No + "','" + Ser_OLD 
                + "','" + note_update + "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    /**
     * Thêm dịch vụ mới cho khách hàng
     * @param Bill_No
     * @param Ser_No
     * @param Room_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int themDichVuDat(String Bill_No, String Ser_No, String Room_No)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_insert_sercall('" + Bill_No + "','" + Ser_No + "','" 
                +  Room_No  +  "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    
    /**
     * Xóa dịch vụ đã đặt
     * @param Bill_No
     * @param Ser_No
     * @param Room_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int xoaDichVuDat(String Bill_No, String Ser_No, String Room_No)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_delete_sercall('" + Bill_No + "','" + Ser_No + "','" 
                +  Room_No  +  "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    /**
     * Hàm lấy thông tin các dịch vụ
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<DichVu> getFullData() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * "
                     + " FROM Service "
                     + " ORDER BY SerNo";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<DichVu> dichVuData = new ArrayList<>();
            
            while(kq.next()){
                DichVu dv = new DichVu();
                
                dv.setMaDichVuString(kq.getString("SerNo"));
                
                dv.setTenDichVu(kq.getString("SerName"));
                
                String loaiDichVu = kq.getString("TypeOfService");
                if(loaiDichVu.equals("0"))
                    dv.setLoaiHinh("Ngoài trời");
                else
                    dv.setLoaiHinh("Trong nhà");
                
                dv.setGia(kq.getString("Cost"));
                
                dichVuData.add(dv);
            }
            return dichVuData;
        }
    }
    
    /**
     * Hàm tra cứu dịch vụ
     * @param Ser_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<DichVu> FinđichVu(String Ser_No) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * "
                     + " FROM Service "
                     + " WHERE SerNo = '" + Ser_No + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<DichVu> dichVuData = new ArrayList<>();
            
            while(kq.next()){
                DichVu dv = new DichVu();
                
                dv.setMaDichVuString(kq.getString("SerNo"));
                
                dv.setTenDichVu(kq.getString("SerName"));
                
                String loaiDichVu = kq.getString("TypeOfService");
                if(loaiDichVu.equals("0"))
                    dv.setLoaiHinh("Ngoài trời");
                else
                    dv.setLoaiHinh("Trong nhà");
                
                dv.setGia(kq.getString("Cost"));
                
                dichVuData.add(dv);
            }
            return dichVuData;
        }
    }
    
    /**
     * Thêm mới một dịch vụ vào khách sạn
     * @param Ser_No
     * @param Ser_Name
     * @param TypeOfService
     * @param Cost_ser
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int ThemDichVuMoi(String Ser_No, String Ser_Name, int TypeOfService, int Cost_ser)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_insert_service('" + Ser_No + "','" + Ser_Name + "'," + TypeOfService 
                + "," + Cost_ser + ");"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    
    /**
     * Sửa thông tin 1 dịch vụ Do nhân viên quản lý thực hiện
     * @param Ser_No
     * @param Ser_Name
     * @param TypeOfService
     * @param Cost_ser
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int SuaDichVu(String Ser_No, String Ser_Name, int TypeOfService, int Cost_ser)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_update_service('" + Ser_No + "','" + Ser_Name + "'," + TypeOfService 
                + "," + Cost_ser + ");"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    /**
     * Xóa thông tin 1 dịch vụ
     * @param Ser_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int XoaDichVu(String Ser_No)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_delete_service('" + Ser_No + "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
}
