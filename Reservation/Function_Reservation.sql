/*==============================================================*/
/*      FUNCTION: Xuat ra thông tin ngay đã dặt phòng	*/
/*==============================================================*/

CREATE OR REPLACE FUNCTION DateSer(RoomNo_In IN room.roomno%type)
RETURN VARCHAR2
AS
    ResDate_para reservation.resdate%TYPE;
BEGIN
    SELECT rs.resdate INTO ResDate_para
    FROM Reservation RS join Room R on RS.RoomNo = R.RoomNo
                         
    WHERE R.RoomNo = RoomNo_In;
    RETURN ResDate_para;
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('MA PHONG TRUYEN VAO KHONG HOP LE HOAC KHONG CO');
END;

/*==============================================================*/
/*      CHAY FUNCTION	                                        */
/*==============================================================*/
    
DECLARE
    RoomNo_IN room.roomno%type := 'R101';
    ResNo_out reservation.resno%TYPE;
    CusNo_out reservation.cusno%TYPE;
    ResDate_out reservation.resdate%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nhap Ma phong tim : ' || RoomNo_IN);
    ResDate_out := DateSer(RoomNo_IN);
    SELECT CusNo, ResNo INTO CusNo_out, ResNo_out
    FROM Reservation
    WHERE ResDate = ResDate_out;
    DBMS_OUTPUT.PUT_LINE('Ma đặt phòng: ' || ResNo_out);
    DBMS_OUTPUT.PUT_LINE('Mã khách hàng đặt phòng : ' || CusNo_out);
    DBMS_OUTPUT.PUT_LINE('Ngay đặt phòng: ' || ResDate_out);
END;