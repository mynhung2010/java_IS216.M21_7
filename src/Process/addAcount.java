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
import javax.swing.JOptionPane;

//import Process.Account;
/**
 *
 * @author DeskTop_Linh04
 */
public class addAcount {
public static List<Account> FindAll(){
List<Account> AccountList = new ArrayList<>();

 try(Connection conn = ConnectionUtils.getMyConnection()){
            String query  = "select * from Account";
            Statement statement = conn.createStatement();
            ResultSet resultSet  = statement.executeQuery(query);

        while(resultSet.next()){

        Account acc = new Account(resultSet.getInt("AccountID"),resultSet.getString("username"),resultSet.getString("Password"),
            resultSet.getString("role"));

        AccountList.add(acc);
        }
            
    }catch(Exception e){
        System.out.println("e");
        }

    return AccountList;
    }


    public static void insert(Account acc){

        try(Connection conn = ConnectionUtils.getMyConnection()){
            String query  = "INSERT INTO Account VALUES (?,?,?,?)";
            PreparedStatement statement = conn.prepareCall(query);
            
            statement.setInt(1, acc.getAccountID());
            statement.setString(2, acc.getUsername());
            statement.setString(3, acc.getPassword());
            statement.setString(4, acc.getRole());

            statement.execute();
int n = statement.executeUpdate();

            
    }catch(Exception e){
        System.out.println("loi insert tai khoan");
        }

    }
}
