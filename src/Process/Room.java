/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

/**
 *
 * @author DeskTop_Linh04
 */
public class Room {
    String RoomNo;
    int TypeOfRoom;
    String Quality;
    int Cost;

    public Room() {
    }

    public Room(String RoomNo, int TypeOfRoom, String Quality, int Cost) {
        this.RoomNo = RoomNo;
        this.TypeOfRoom = TypeOfRoom;
        this.Quality = Quality;
        this.Cost = Cost;
    }
    public Room(int TypeOfRoom, String Quality) {
        this.TypeOfRoom = TypeOfRoom;
        this.Quality = Quality;
    }

    public String getRoomNo() {
        return RoomNo;
    }

    public int getTypeOfRoom() {
        return TypeOfRoom;
    }

    public String getQuality() {
        return Quality;
    }

    public int getCost() {
        return Cost;
    }

    public void setRoomNo(String RoomNo) {
        this.RoomNo = RoomNo;
    }

    public void setTypeOfRoom(int TypeOfRoom) {
        this.TypeOfRoom = TypeOfRoom;
    }

    public void setQuality(String Quality) {
        this.Quality = Quality;
    }

    public void setCost(int Cost) {
        this.Cost = Cost;
    }


}
