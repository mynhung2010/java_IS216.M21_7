/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import ConnectDB.ConnectionUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DeskTop_Linh04
 */
public class RoomUntil {
    public static List<Room> FindAll(){
    List <Room> RoomList = new ArrayList<>();

try (Connection conn = ConnectionUtils.getMyConnection()){

        String query = "Select * "
         + "            from Room"
         + "            where TypeOfRoom = ? and Quality = ?";
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while(resultSet.next()){
        Room room = new Room(resultSet.getInt("TypeOfRoom"),resultSet.getString("Quality"));

        RoomList.add(room);
        }

        }catch(Exception e){

        System.out.println("e");
        }
    return RoomList;
        }
    
}
