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
public class HoaDon {
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    
    private String maHoaDon, maKhachHang, maDichVu,maPhong;
    private int tongTien;
    private String phuongThuc;
    private String ngayTraTien;
    private String tenKhachHang;
    private String trangThai;

    /**
     * Các hàm constructor + get/set
     */
    public HoaDon() {
    }

    public HoaDon(String trangThai,String tenKhachHang, String maHoaDon, String maKhachHang, String maDichVu, String maPhong, int tongTien, String phuongThuc, String ngayTraTien) {
        this.maHoaDon = maHoaDon;
        this.maKhachHang = maKhachHang;
        this.maDichVu = maDichVu;
        this.maPhong = maPhong;
        this.tongTien = tongTien;
        this.phuongThuc = phuongThuc;
        this.ngayTraTien = ngayTraTien;
        this.tenKhachHang = tenKhachHang;
        this.trangThai = trangThai;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
    
    

    public String getTenKhachHang() {
        return tenKhachHang;
    }

    public void setTenKhachHang(String tenKhachHang) {
        this.tenKhachHang = tenKhachHang;
    }

    
    
    public String getPhuongThuc() {
        return phuongThuc;
    }

    public void setPhuongThuc(String phuongThuc) {
        this.phuongThuc = phuongThuc;
    }

    public String getNgayTraTien() {
        return ngayTraTien;
    }

    public void setNgayTraTien(String ngayTraTien) {
        this.ngayTraTien = ngayTraTien;
    }



    public String getMaHoaDon() {
        return maHoaDon;
    }

    public void setMaHoaDon(String maHoaDon) {
        this.maHoaDon = maHoaDon;
    }

    public String getMaKhachHang() {
        return maKhachHang;
    }

    public void setMaKhachHang(String maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public String getMaPhong() {
        return maPhong;
    }

    public void setMaPhong(String maPhong) {
        this.maPhong = maPhong;
    }

    public int getTongTien() {
        return tongTien;
    }

    public void setTongTien(int tongTien) {
        this.tongTien = tongTien;
    }
    
    
    
    /**
     * Lấy thông tin các hóa đơn
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<HoaDon> getFullData() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = " select p.BillNo, b.CusNo, RoomNo, SumOfMoney, Method, PaymentDate, status "
                     + " from bill b join pay p on b.BillNo = p.BillNo "
                     + " order by b.BillNo";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<HoaDon> hoaDonData = new ArrayList<>();
            
            while(kq.next()){
                HoaDon hd = new HoaDon();
                
                hd.setMaHoaDon(kq.getString("BillNo"));
                
                hd.setMaKhachHang(kq.getString("CusNo"));
                
                hd.setMaPhong(kq.getString("RoomNo"));
                
                hd.setTongTien(kq.getInt("sumOfMoney"));
                
                int phuongThuc = 0;
                phuongThuc = kq.getInt("Method");
                
                if(phuongThuc == 1)
                    hd.setPhuongThuc("COD");
                else
                    hd.setPhuongThuc("Chuyển khoản");
                
                String payDate = "";
                payDate = sdf.format(kq.getDate("PaymentDate"));
                hd.setNgayTraTien(payDate);
                
                int trangThai = 0;
                trangThai = kq.getInt("Status");
                if(trangThai == 0)
                    hd.setTrangThai("Chưa thanh toán");
                else
                    hd.setTrangThai("Đã thanh toán");
                
                hoaDonData.add(hd);
            }
            return hoaDonData;
        }
    }
    
    
    /**
     * Tìm kiếm thông tin các hóa đơn
     * @param Bill_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<HoaDon> timKiemHoaDon(String Bill_No) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = " select p.BillNo, b.CusNo, RoomNo, SumOfMoney, Method, PaymentDate, status "
                     + " from bill b join pay p on b.BillNo = p.BillNo "
                     + " where b.BillNo = '" + Bill_No + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<HoaDon> hoaDonData = new ArrayList<>();
            
            while(kq.next()){
                HoaDon hd = new HoaDon();
                
                
                hd.setMaHoaDon(kq.getString("BillNo"));
                
                hd.setMaKhachHang(kq.getString("CusNo"));
                
                hd.setMaPhong(kq.getString("RoomNo"));
                
                hd.setTongTien(kq.getInt("sumOfMoney"));
                
                int phuongThuc = 0;
                phuongThuc = kq.getInt("Method");
                
                if(phuongThuc == 1)
                    hd.setPhuongThuc("COD");
                else
                    hd.setPhuongThuc("Chuyen khoan");
                
                String payDate = "";
                payDate = sdf.format(kq.getDate("PaymentDate"));
                hd.setNgayTraTien(payDate);
                
                int trangThai = 0;
                trangThai = kq.getInt("Status");
                if(trangThai == 0)
                    hd.setTrangThai("Chưa thanh toán");
                else
                    hd.setTrangThai("Đã thanh toán");
                
                
                hoaDonData.add(hd);
            }
            return hoaDonData;
        }
    }
    
    /**
     * Tìm thông tin hóa đơn
     * @param BillNo
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public HoaDon ThongTinHoaDon(String BillNo) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = " SELECT B.BillNo , R.RoomNo, C.CusNo, C.CusName, b.sumofmoney, p.method "
                     + " FROM RESERVATION RE JOIN CUSTOMER C ON RE.CusNo = C.CusNo " 
                     + "                    JOIN BILL B ON B.CusNo = C.CusNo " 
                     + "                    JOIN PAY P ON B.BillNo = P.BillNo " 
                     + "                    JOIN Room R on R.RoomNo = B.RoomNo " 
                     + " WHERE B.BillNo = '" + BillNo + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            
            while(kq.next()){
                HoaDon hd = new HoaDon();
                
                hd.setMaHoaDon(kq.getString("BillNo"));
                
                hd.setMaPhong(kq.getString("RoomNo"));
                
                hd.setMaKhachHang(kq.getString("CusNo"));
                
                hd.setTenKhachHang(kq.getString("CusName"));
                
                hd.setTongTien(kq.getInt("sumOfMoney"));
                
                int phuongThuc = 0;
                phuongThuc = kq.getInt("Method");
                
                if(phuongThuc == 1)
                    hd.setPhuongThuc("COD");
                else
                    hd.setPhuongThuc("Chuyển khoản");
                
                return hd;
            }
            return null;
        }
    }
    
    /**
     * Khi ấn xác nhận thanh toán sẽ cập nhật lại trạng thái bill
     * @param billNo_In
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int thanhToanHoaDon(String billNo_In) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "BEGIN "
                + "proc_update_payBill('" + billNo_In + "');"
                + " END;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        
        return i;
    }
    
    /**
     * Cập nhật lại tiền cho hóa đơn
     * @param billNo_In
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int capNhatTienHoaDon(String billNo_In) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "BEGIN "
                + "proc_update_money('" + billNo_In + "');"
                + " END;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        
        return i;
    }
    
     /**
     * Tìm trạng thái bill của mã khách hàng
     * @param maKhachHang
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public String getTrangThai(String maKhachHang) throws SQLException, ClassNotFoundException{
        
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Select AccountID FROM ACCOUNT WHERE AccountID = '" + maKhachHang + "'";
        Statement stat = conn.createStatement();
        
        String trangThai = "";
        
        try(ResultSet kq = stat.executeQuery(query)){
            while(kq.next()){
                
                
                
                String tt = "";
                
                trangThai = tt;
                
            }
            return trangThai;
        }
    }
    
}
