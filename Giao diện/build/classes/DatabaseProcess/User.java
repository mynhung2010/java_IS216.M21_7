/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DatabaseProcess;
import ConnectDB.ConnectionUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Thanh Phat
 */
public class User {
    private String tenDangNhapString, matKhau, vaiTro;
    private String maTaiKhoan;
    
    /**
     * Các constructor và get/set
     */
    public User(){
    
    }

    public User(String tenDangNhapString, String matKhau, String vaiTro,String maTaiKhoan) {
        this.tenDangNhapString = tenDangNhapString;
        this.matKhau = matKhau;
        this.vaiTro = vaiTro;
        this.maTaiKhoan = maTaiKhoan;
    }

    public String getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(String maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
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
