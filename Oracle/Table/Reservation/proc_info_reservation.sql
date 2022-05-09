/*==============================================================*/
/*      PROCEDURE: THONG TIN RESERVATION                      */
/*==============================================================*/
    
CREATE OR REPLACE PROCEDURE Res_Info(ResNo_IN IN Reservation.resno%TYPE,
                                         CusNo_out OUT reservation.cusno%TYPE,
                                         RoomNo_out OUT reservation.roomno%TYPE,
                                         ResDate_out       OUT reservation.resdate%TYPE)
IS BEGIN
    DBMS_OUTPUT.PUT_LINE('Nhap ma resno : ' || ResNo_IN);
    SELECT CusNo, RoomNo, ResDate INTO CusNo_out, RoomNo_out, ResDate_out
    FROM RESERVATION
    WHERE ResNo = ResNo_IN; 
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('THAM SO TRUYEN VAO KHONG HOP LE HOAC KHONG CO');
END;

/*==============================================================*/
/*      CHAY PROCEDURE	                                        */
/*==============================================================*/
DECLARE
    ResNo reservation.resno%TYPE :='RE002';
    CusNo reservation.cusno%TYPE;
    RoomNo reservation.roomno%TYPE;
    ResDate   reservation.resdate%TYPE;
    
BEGIN
    Res_Info(ResNo, CusNo,RoomNo, ResDate);
    DBMS_OUTPUT.PUT_LINE('Mã khách hàng đặt chỗ: ' || CusNo);
    DBMS_OUTPUT.PUT_LINE('Mã phòng đặt: ' || RoomNo);
    DBMS_OUTPUT.PUT_LINE('Ngay đặt: ' || ResDate);
END;
