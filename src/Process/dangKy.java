/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;
import ConnectDB.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author DeskTop_Linh04
 */
public class dangKy {
    public int Themuser(int accountID, String username, String password,String vaitro){
    int user = 0;

    try(Connection conn = ConnectionUtils.getMyConnection()){
            String query  = "INSERT INTO Account VALUES (?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4,vaitro);
            user = ps.executeUpdate();

    }catch(Exception e){
        System.out.println("e");
        }
    return user;
    }

    public int Themkhachhang(String makh,String tenkhachhang, String gioitinh, String diachi,String sodt,String email,String ID,String acountiD){
    int cus = 0;

    try(Connection conn = ConnectionUtils.getMyConnection()){
            String query  = "INSERT INTO Customer VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1,makh );
            ps.setString(2, tenkhachhang);
            ps.setString(3, gioitinh);
            ps.setString(4, diachi);
            ps.setString(5, sodt);
            ps.setString(6, email);
            ps.setString(7, ID);
            ps.setString(8,acountiD );

            cus = ps.executeUpdate();
    }catch(Exception e){
        System.out.println("e");
        }
    return cus;
    }

}
