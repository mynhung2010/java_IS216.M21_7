/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DatabaseProcess;

import ConnectDB.ConnectionUtils;
import DatabaseProcess.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Thanh Phat
 */
public class TaiKhoan {
    public User CheckLoginUser(String tenDangNhap, String matkhau) throws Exception{
        String query = "select username, Password, Role from ACCOUNT "
                + "where username = ? AND Password = ?";
        try (
            Connection conn = ConnectionUtils.getMyConnection();
            PreparedStatement stm = conn.prepareStatement(query);

        ){
            stm.setString(1, tenDangNhap);
            stm.setString(2, matkhau);
            try(ResultSet rs = stm.executeQuery()){
                if(rs.next()){
                    User us = new User();
                    us.setTenDangNhapString(tenDangNhap);
                    us.setVaiTro(rs.getString("Role"));
                    return us;
                }
            }
        }
        return null;
    }
     
}
