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
public class NhanVien {
    
    
    
    
    /**
     * Hàn lấy data
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static ResultSet getFullData() throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionUtils.getMyConnection();
        ResultSet kq = null;
        String query = """
                       SELECT E.EmpNo, E.EmpName, DATEOFBIRTH, PHONE, startDate
                       FROM EMPLOYEE E JOIN POSITION P ON E.PosNo = P.PosNo
                       WHERE P.PosName <> 'Nhan vien quan ly'
                       ORDER BY E.EmpNo""";
        Statement stat = conn.createStatement();
        kq = stat.executeQuery(query);
        
        return kq;
    }
}
