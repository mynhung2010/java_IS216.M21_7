/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DeskTop_Linh04
 */
public class TaiKhoan {
    public Account CheckLogin(String username,String Password) throws SQLException, ClassNotFoundException{

            String query = "select username, Password, Role from Account "
                + "where username = ? AND Password = ?";

try(Connection conn = ConnectionUtils.getMyConnection();
    PreparedStatement ps = conn.prepareCall(query);
    ){
        ps.setString(1,username);
        ps.setString(2,Password);
        try(ResultSet rs = ps.executeQuery()){
            if(rs.next()){
            Account us = new Account();
            us.setUsername(username);
            us.getRole();
            return us; 
            }
        }

    }   
return null;
    }
}
