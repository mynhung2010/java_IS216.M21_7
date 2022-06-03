/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Process.KhachHang;
import javax.swing.JOptionPane;
/**
 *
 * @author DeskTop_Linh04
 */
public class addKhachHang {
public static List<KhachHang> FindAll(){
List<KhachHang> KhachHangList = new ArrayList<>();

 try(Connection conn = ConnectionUtils.getMyConnection()){
            String query  = "select * from Customer";
            Statement statement = conn.createStatement();
            ResultSet resultSet  = statement.executeQuery(query);

        while(resultSet.next()){

        KhachHang kh = new KhachHang(resultSet.getString("CusNo"),resultSet.getString("CusName"),resultSet.getInt("gender"),resultSet.getString("Address"),resultSet.getString("Phone"),resultSet.getString("Email"),resultSet.getString("ID"),resultSet.getInt("AccountID"));

        KhachHangList.add(kh);
        }
            
    }catch(Exception e){
        System.out.println("e");
        }

    return KhachHangList;
    }


public static void insert(KhachHang kh){

        try(Connection conn = ConnectionUtils.getMyConnection()){
            String query  = "INSERT INTO Customer VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareCall(query);
            
            statement.setString(1, kh.getCusNo());
            statement.setString(2, kh.getCusName());
            statement.setInt(3, kh.getGender());
            statement.setString(4, kh.getAddress());
            statement.setString(5, kh.getPhone());
            statement.setString(6, kh.getEmail());
            statement.setString(7, kh.getID());
            statement.setInt(8, kh.getAccountID());

        statement.execute();
            
    }catch(Exception e){
        
        System.out.println("e");
        }

    }
    
}
