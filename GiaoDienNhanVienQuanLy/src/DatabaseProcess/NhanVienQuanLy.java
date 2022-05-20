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

/**
 *
 * @author Thanh Phat
 */
public class NhanVienQuanLy {
    public void ThongTinNhanVien() throws SQLException, ClassNotFoundException{
        Connection conn = ConnectionUtils.getMyConnection();
        ResultSet kq = null;
        String query = "SELECT EmpName, Gender, DateOfBirth, startDate, phone, email"
                + " FROM EMPLOYEE E JOIN Account A ON E.AccountID = A.AccountID"
                + "WHERE Role = 'Nhan vien quan ly'";
        Statement stat = conn.createStatement();
        kq = stat.executeQuery(query);
    }
}
