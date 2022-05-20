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

/**
 *
 * @author Thanh Phat
 */
public class Room {

    
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
        int i = 1;

        Connection conn = ConnectionUtils.getMyConnection();
        String query = "{call proc_insert_room(?, ?, ?, ?)}";
        CallableStatement caSt = conn.prepareCall(query);
        caSt.setString(1, Room_No);
        caSt.setString(2, Type_Room);
        caSt.setString(3, Quality_Room);
        caSt.setString(4, Cost_Room);
        ResultSet rs = caSt.executeQuery();

        return i;
    }
    
    
    /**
     * Hàm lấy data
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static ResultSet getFullData() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        ResultSet kq = null;
        String query = "SELECT * FROM Room ORDER BY RoomNo";
        Statement stat = conn.createStatement();
        kq = stat.executeQuery(query);
        
        return kq;
    }
}
