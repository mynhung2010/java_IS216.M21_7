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
public class VatDung {
    public String maVatDung, tenVatDung, soLuong, tinhTrang, maPhong;

    /**
     * Constructor và các hàm get/set
     */
    public VatDung() {
    }

    public VatDung(String maVatDung, String tenVatDung, String soLuong, String tinhTrang, String maPhong) {
        this.maVatDung = maVatDung;
        this.tenVatDung = tenVatDung;
        this.soLuong = soLuong;
        this.tinhTrang = tinhTrang;
        this.maPhong = maPhong;
    }

    public String getMaVatDung() {
        return maVatDung;
    }

    public void setMaVatDung(String maVatDung) {
        this.maVatDung = maVatDung;
    }

    public String getTenVatDung() {
        return tenVatDung;
    }

    public void setTenVatDung(String tenVatDung) {
        this.tenVatDung = tenVatDung;
    }

    public String getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(String soLuong) {
        this.soLuong = soLuong;
    }

    public String getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(String tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public String getMaPhong() {
        return maPhong;
    }

    public void setMaPhong(String maPhong) {
        this.maPhong = maPhong;
    }
    
    /**
     * Hàm lấy tất cả thông tin vật dụng
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<VatDung> getFullData() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query =  " select i.itemNo, ITEMNAME, NOOFITEM, STATUS, RoomNo "
                     +  " from item i join belong b on i.itemNo = b.itemNo "
                     +  " ORDER BY RoomNo";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<VatDung> vatDungData = new ArrayList<>();
            
            while(kq.next()){
                VatDung vd = new VatDung();
                
                vd.setMaVatDung(kq.getString("itemNo"));
                
                vd.setTenVatDung(kq.getString("itemName"));
                
                vd.setSoLuong(kq.getString("NOOFITEM"));
                
                vd.setTinhTrang(kq.getString("status"));
                
                vd.setMaPhong(kq.getString("RoomNo"));
                
                vatDungData.add(vd);
                
            }
            return vatDungData;
        }
    }
    
     /**
     * Hàm tra cứu
     * @param tenVatDung
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public List<VatDung> timVatDung(String tenVatDung) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        String query =  " select i.itemNo, ITEMNAME, NOOFITEM, STATUS, RoomNo "
                     +  " from item i join belong b on i.itemNo = b.itemNo "
                     +  " WHERE itemName = '" + tenVatDung + "'";
        Statement stat = conn.createStatement();
        try(ResultSet kq = stat.executeQuery(query)){
            List<VatDung> vatDungData = new ArrayList<>();
            
            while(kq.next()){
                VatDung vd = new VatDung();
                
                vd.setMaVatDung(kq.getString("itemNo"));
                
                vd.setTenVatDung(kq.getString("itemName"));
                
                vd.setSoLuong(kq.getString("NOOFITEM"));
                
                vd.setTinhTrang(kq.getString("status"));
                
                vd.setMaPhong(kq.getString("RoomNo"));
                
                vatDungData.add(vd);
                
            }
            return vatDungData;
        }
    }

    /**
     * Hàm sửa thông tin vật dụng
     * @param maVatDung
     * @param tenVatDung
     * @param soLuong
     * @param tinhTrang
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int SuaThongTinVatDung(String maVatDung, String tenVatDung, int soLuong, String tinhTrang) throws SQLException, ClassNotFoundException{
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "BEGIN "
                     + " proc_update_Item('" + maVatDung  
                     + "','" + tenVatDung + "'," + soLuong 
                     + ",'" + tinhTrang + "');"
                     + " END;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);

        return i;
    }
    
    
    /**
     * Thêm vật dụng trong phòng
     * @param maVatDung
     * @param tenVatDung
     * @param soLuong
     * @param trangThai
     * @param maPhong
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int ThemVatDung(String maVatDung, String tenVatDung,int soLuong
            ,String trangThai, String maPhong) throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = " Begin "
                     + " proc_insert_item('" + maVatDung + "','" + tenVatDung
                     + "'," + soLuong + ",'" + trangThai 
                     + "','" + maPhong + "');"
                     + " End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }
    
    /**
     * Xóa vật dụng trong phòng
     * @param maVatDung
     * @param maPhong
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public int XoaVatDung(String maVatDung, String maPhong) throws SQLException, ClassNotFoundException {
        int i = 0;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "Begin"
                     + " proc_delete_item('" + maVatDung + "','" + maPhong + "');"
                     + " End;";
        Statement stat = conn.createStatement();
        
        i = stat.executeUpdate(query);
        return i;
    }    
}
