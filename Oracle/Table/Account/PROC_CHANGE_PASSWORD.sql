CREATE OR REPLACE PROCEDURE PROC_CHANGE_PASSWORD (ACC_USERNAME ACCOUNT.USERNAME%TYPE, 
                                             ACC_OLD_PASS ACCOUNT.PASSWORD%TYPE, 
                                             ACC_NEW_PASS ACCOUNT.PASSWORD%TYPE,
                                             ACC_CONFIRM_PASS ACCOUNT.PASSWORD%TYPE)
AS
    V_USERNAME ACCOUNT.USERNAME%TYPE;
    V_PASS ACCOUNT.PASSWORD%TYPE;
BEGIN
    -- Tim trong databse ten tai khoan trung voi ten tai khoan duoc nhap, sau do gan gia tri vao bien V_USERNAME 
        SELECT USERNAME INTO V_USERNAME 
        FROM ACCOUNT 
        WHERE USERNAME = ACC_USERNAME;
    -- Tim trong databse mat khau trung voi mat khau cua tai khoan duoc nhap, sau do gan gia tri vao bien V_PASS
        SELECT PASSWORD INTO V_PASS 
        FROM ACCOUNT 
        WHERE USERNAME = ACC_USERNAME;     
            
    --Kiem tra mat khau nhap vao co dung mat khau hien tai khong
    IF (V_PASS != ACC_OLD_PASS)
        THEN RAISE_APPLICATION_ERROR(-20103, 'Sai mật khẩu hiện tại');
    -- Kiem tra mat khau vua nhap co trung voi mat khau xac nhan khong
    ELSIF (ACC_NEW_PASS!=ACC_CONFIRM_PASS)
        THEN RAISE_APPLICATION_ERROR(-20104, 'Mật khẩu mới không trùng với mật khẩu xác nhận');
    -- Kiem tra mat khau vua nhap trung voi mat khau cu khong
    ELSIF ( V_USERNAME = ACC_USERNAME AND V_PASS = ACC_NEW_PASS)
        THEN RAISE_APPLICATION_ERROR(-20105, 'Mật khẩu mới đã trùng với mật khẩu cũ');
    -- Neu khong trung thi cap nhat mat khau moi cho nguoi dung 
    ELSE    
        UPDATE ACCOUNT 
        SET PASSWORD = ACC_NEW_PASS
        WHERE USERNAME = ACC_USERNAME;
        COMMIT;
    END IF;
    --Truong hop ten tai khoan, mat khau duoc nhap EXEC PROC_CHANGE_PASSWORD(van hau, vanhau123, thaohong, thaohong);chua ton tai trong he thong
    EXCEPTION WHEN NO_DATA_FOUND
        THEN RAISE_APPLICATION_ERROR(-20106,'Không có người dùng vừa nhập hoặc mật khẩu đã bị nhập sai !');
END;