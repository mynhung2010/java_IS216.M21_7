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
public class KhachHang {
    String CusNo,CusName;
    int Gender;
    String Address,Phone,Email,ID;
    int AccountID;

    public KhachHang() {
    }

    public KhachHang(String CusNo, String CusName, int Gender, String Address, String Phone, String Email, String ID,int AccountID) {
        this.CusNo = CusNo;
        this.CusName = CusName;
        this.Gender = Gender;
        this.Address = Address;
        this.Phone = Phone;
        this.Email = Email;
        this.ID = ID;
        this.AccountID = AccountID;
    }

    public int getGender() {
        return Gender;
    }

    public String getCusNo() {
        return CusNo;
    }

    public String getCusName() {
        return CusName;
    }

    public String getAddress() {
        return Address;
    }

    public String getPhone() {
        return Phone;
    }

    public String getEmail() {
        return Email;
    }

    public String getID() {
        return ID;
    }

    public int getAccountID() {
        return AccountID;
    }

// them setter
    public void setGender(int Gender) {
        this.Gender = Gender;
    }

    public void setCusNo(String CusNo) {
        this.CusNo = CusNo;
    }

    public void setCusName(String CusName) {
        this.CusName = CusName;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

}
