/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DatabaseProcess;

import ConnectDB.ConnectionUtils;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.CallableStatement;
import java.util.concurrent.Callable;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thanh Phat
 */
public class Room {
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    private String MaPhong, LoaiPhong, ChatLuongPhong, Gia;
    private String maHoaDon;
    private String maKhachHang, maDatPhong, ngayDatPhong, ngayNhanPhong, ngayTraPhong;
    private float Diem;
    private String binhLuan;

    public Room(String MaPhong, String LoaiPhong, String ChatLuongPhong, String Gia, String maKhachHang, String maDatPhong, String ngayDatPhong, String ngayNhanPhong, String ngayTraPhong) {
        this.MaPhong = MaPhong;
        this.LoaiPhong = LoaiPhong;
        this.ChatLuongPhong = ChatLuongPhong;
        this.Gia = Gia;
        this.maKhachHang = maKhachHang;
        this.maDatPhong = maDatPhong;
        this.ngayDatPhong = ngayDatPhong;
        this.ngayNhanPhong = ngayNhanPhong;
        this.ngayTraPhong = ngayTraPhong;
    }

    
    public Room(){
        
    }

    public float getDiem() {
        return Diem;
    }

    public void setDiem(float Diem) {
        this.Diem = Diem;
    }

    public String getBinhLuan() {
        return binhLuan;
    }

    public void setBinhLuan(String binhLuan) {
        this.binhLuan = binhLuan;
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

    public String getMaDatPhong() {
        return maDatPhong;
    }

    public void setMaDatPhong(String maDatPhong) {
        this.maDatPhong = maDatPhong;
    }

    public String getNgayDatPhong() {
        return ngayDatPhong;
    }

    public void setNgayDatPhong(String ngayDatPhong) {
        this.ngayDatPhong = ngayDatPhong;
    }

    public String getNgayNhanPhong() {
        return ngayNhanPhong;
    }

    public void setNgayNhanPhong(String ngayNhanPhong) {
        this.ngayNhanPhong = ngayNhanPhong;
    }

    public String getNgayTraPhong() {
        return ngayTraPhong;
    }

    public void setNgayTraPhong(String ngayTraPhong) {
        this.ngayTraPhong = ngayTraPhong;
    }


    public String getMaPhong() {
        return MaPhong;
    }

    public void setMaPhong(String MaPhong) {
        this.MaPhong = MaPhong;
    }

    public String getLoaiPhong() {
        return LoaiPhong;
    }

    public void setLoaiPhong(String LoaiPhong) {
        this.LoaiPhong = LoaiPhong;
    }

    public String getChatLuongPhong() {
        return ChatLuongPhong;
    }

    public void setChatLuongPhong(String ChatLuongPhong) {
        this.ChatLuongPhong = ChatLuongPhong;
    }

    public String getGia() {
        return Gia;
    }

    public void setGia(String Gia) {
        this.Gia = Gia;
    }
    
    
    /**
     * Tìm mã phòng hiện tại
     * @param maPhong
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public String getMaPhongHienTai(String maPhong) throws SQLException, ClassNotFoundException{
        
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Select RoomNo FROM Room WHERE RoomNo = '" + maPhong + "'";
        Statement stat = conn.createStatement();
        
        String maHienTai = "";
        
        try(ResultSet kq = stat.executeQuery(query)){
            while(kq.next()){
                Room r = new Room();
                
                r.setMaPhong(kq.getString("RoomNo"));
                
                maHienTai = r.getMaPhong();
                
            }
            return maHienTai;
        }
    }
    
    
    /**
     * Hàm thêm phòng
     * @param Room_No
     * @param Type_Room
     * @param Quality_Room
     * @param Cost_Room
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int ThemPhongMoi(String Room_No, String Type_Room, String Quality_Room, String Cost_Room)
            throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin "
                + "proc_insert_room('" + Room_No + "','" + Type_Room + "','" + Quality_Room 
                + "','" + Cost_Room + "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    
    /**
     * Hàm lấy data
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<Room> getFullData() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * FROM Room ORDER BY RoomNo";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<Room> RoomData = new ArrayList<>();
            
            while(kq.next()){
                Room room = new Room();
                room.setMaPhong(kq.getString("RoomNo"));
                room.setLoaiPhong(kq.getString("TYPEOFROOM"));
                room.setChatLuongPhong(kq.getString("QUALITY"));
                room.setGia(kq.getString("COST"));
                RoomData.add(room);
            }
            return RoomData;
        }
    }
    
    /**
     * Hàm xóa phòng
     * @param Room_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int XoaPhong(String Room_No) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin"
                + " proc_delete_room('" + Room_No +  "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);

        return i;
    }
    
    
    
    /**
     * Hàm sửa thông tin phòng
     * @param Room_No
     * @param Type_Room
     * @param Cost_Room
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int SuaPhong(String Room_No, String Type_Room, String Cost_Room) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin"
                + " proc_update_room('" + Room_No 
                + "','" + Type_Room + "','" + Cost_Room + "');"
                + "End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);

        return i;
    }
    
    /**
     * Hàm tra cứu phòng
     * @param Room_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<Room> traCuuPhong(String Room_No) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * FROM Room WHERE RoomNo = '" + Room_No + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<Room> RoomData = new ArrayList<>();
            
            while(kq.next()){
                Room room = new Room();
                room.setMaPhong(kq.getString("RoomNo"));
                room.setLoaiPhong(kq.getString("TYPEOFROOM"));
                room.setChatLuongPhong(kq.getString("QUALITY"));
                room.setGia(kq.getString("COST"));
                RoomData.add(room);
            }
            return RoomData;
        }
    }
    
    /**
     * Thông tin các phòng đã đặt
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<Room> thongTinDatPhong() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * FROM reservation ORDER BY ResNo";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<Room> RoomData = new ArrayList<>();
            
            while(kq.next()){
                Room room = new Room();
                
                room.setMaDatPhong(kq.getString("ResNo"));
                
                room.setMaHoaDon(kq.getString("BillNo"));
                
                room.setMaKhachHang(kq.getString("CusNo"));
                
                room.setMaPhong(kq.getString("RoomNo"));
                
                String ngayDat = "";
                ngayDat = sdf.format(kq.getDate("ResDate"));
                room.setNgayDatPhong(ngayDat);

                String ngayNhan = "";
                ngayNhan = sdf.format(kq.getDate("TCHECKIN"));
                room.setNgayNhanPhong(ngayNhan);                
    
                String ngayTra = "";
                ngayTra = sdf.format(kq.getDate("TCHECKOUT"));
                room.setNgayTraPhong(ngayTra);                
                
                RoomData.add(room);
            }
            return RoomData;
        }
    }
    
    /**
     * Tra cứu thông tin bằng mã đặt phòng
     * @param maDatPhong
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<Room> traCuuThongTinDatPhong(String maDatPhong) 
            throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT * FROM reservation WHERE ResNo = '" + maDatPhong + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<Room> RoomData = new ArrayList<>();
            
            while(kq.next()){
                Room room = new Room();
                
                room.setMaDatPhong(kq.getString("ResNo"));
                
                room.setMaHoaDon(kq.getString("BillNo"));
                
                room.setMaKhachHang(kq.getString("CusNo"));
                
                room.setMaPhong(kq.getString("RoomNo"));
                
                String ngayDat = "";
                ngayDat = sdf.format(kq.getDate("ResDate"));
                room.setNgayDatPhong(ngayDat);

                String ngayNhan = "";
                ngayNhan = sdf.format(kq.getDate("TCHECKIN"));
                room.setNgayNhanPhong(ngayNhan);                
    
                String ngayTra = "";
                ngayTra = sdf.format(kq.getDate("TCHECKOUT"));
                room.setNgayTraPhong(ngayTra);                
                
                RoomData.add(room);
            }
            return RoomData;
        }
    }
    
    
    /**
     * Tìm đánh giá phòng
     * @param maPhong
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<Room> getDanhGiaList(String maPhong) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "select a.CusNo,r.RoomNo,Point, \"Comment\" " +
                       " from assessroom a join room r on a.roomNo = r.RoomNo " +
                       " where r.RoomNo = '" + maPhong + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<Room> RoomData = new ArrayList<>();
            
            while(kq.next()){
                Room room = new Room();
                
                room.setMaKhachHang(kq.getString("CusNo"));
             
                room.setMaPhong(kq.getString("RoomNo"));
                
                room.setDiem(kq.getFloat("Point"));
                
                room.setBinhLuan(kq.getString("\"Comment\""));
                
                RoomData.add(room);
            }
            return RoomData;
        }
    }
    
    /**
     * Tra cứu phòng
     * @param loaiPhong
     * @param chatLuong
     * @param ngayMuonDat
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<Room> traCuuPhong(int loaiPhong, String chatLuong, String ngayMuonDat) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query = "SELECT DISTINCT R.RoomNo, TypeOfRoom, Quality, Cost " 
                        + " FROM ROOM R JOIN RESERVATION RE ON R.RoomNo = RE.RoomNo " 
                        + " WHERE typeOfRoom = " + loaiPhong + " AND Quality = '" + chatLuong + "'"
                        + " AND R.RoomNo  NOT IN (SELECT RoomNo "
                                              + " FROM RESERVATION "
                                              + " WHERE ResDate = "
                                                    + "TO_DATE('" + ngayMuonDat + "'," + "'dd/mm/yyyy'))"
                  + " UNION "
                        + " SELECT RoomNo, TypeOfRoom, Quality, Cost "
                        + " FROM Room R  "
                        + " WHERE typeOfRoom = " + loaiPhong + " AND Quality = '" + chatLuong + "'"
                                                 + " AND R.RoomNo NOT IN (SELECT RoomNo "
                                                                      + " FROM RESERVATION)";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<Room> RoomData = new ArrayList<>();
            
            while(kq.next()){
                Room room = new Room();
             
                room.setMaPhong(kq.getString("RoomNo"));
                
                room.setLoaiPhong(kq.getString("TypeOfRoom"));
                
                room.setChatLuongPhong(kq.getString("Quality"));
                
                room.setGia(kq.getString("Cost"));
                
                RoomData.add(room);
            }
            return RoomData;
        }
    }
    
    /**
     * Sửa bài đánh giá
     * @param Point_Room
     * @param Comment_Room
     * @param Room_No
     * @param Cus_No
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int SuaDanhGia(Float Point_Room, String Comment_Room, String Room_No,
            String Cus_No) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "BEGIN "
                     + "proc_update_Assessroom(" + Point_Room + ",'" + Comment_Room 
                     + "','" + Room_No + "','" + Cus_No + "');"
                     + " END;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);

        return i;
    }
    
}
    
    
