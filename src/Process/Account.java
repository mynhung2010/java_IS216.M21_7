/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;



/**
 *
 * @author DeskTop_Linh04
 */
public class Account {
    int AccountID;
    String username,Password,role;
    

    public Account() {
    }

    public Account(int AccountID, String username, String Password, String role) {
        this.AccountID = AccountID;
        this.username = username;
        this.Password = Password;
        this.role = role;
    }

    public Account(String username, String Password, String role) {
        this.username = username;
        this.Password = Password;
        this.role = role;
    }

    public Account(String username, String Password) {
        this.username = username;
        this.Password = Password;
    }

    public int getAccountID() {
        return AccountID;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return Password;
    }

    public String getRole() {
        return role;
    }

// Them setter 

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public void setRole(String role) {
        this.role = role;
    }

 
}
