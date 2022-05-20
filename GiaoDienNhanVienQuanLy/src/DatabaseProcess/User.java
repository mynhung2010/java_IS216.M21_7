/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DatabaseProcess;
import ConnectDB.ConnectionUtils;
import java.sql.*;
/**
 *
 * @author Thanh Phat
 */
public class User {
    private String tenDangNhapString, matKhau, vaiTro;
    
    public User(){
    
    }

    public User(String tenDangNhapString, String matKhau, String vaiTro) {
        this.tenDangNhapString = tenDangNhapString;
        this.matKhau = matKhau;
        this.vaiTro = vaiTro;
    }

    public String getTenDangNhapString() {
        return tenDangNhapString;
    }

    public void setTenDangNhapString(String tenDangNhapString) {
        this.tenDangNhapString = tenDangNhapString;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(String vaiTro) {
        this.vaiTro = vaiTro;
    }
    
}
