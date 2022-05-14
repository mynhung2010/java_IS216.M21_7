/*==============================================================*/
/*      PROCEDURE: THONG TIN ROOM   	                        */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE Room_Info (RoomNo_In IN  Room.RoomNo%TYPE)
AS 
    TypeOfRoom_Out  Room.TypeOfRoom%TYPE;
    Quality_Out     Room.Quality%TYPE;
    Cost_Out        Room.Cost%TYPE;
    tCheckIn_Out    Room.tCheckIn%TYPE;
    tCheckOut_Out   Room.tCheckOut%TYPE;
BEGIN
        DBMS_OUTPUT.PUT_LINE('Nhap ma phong : ' || RoomNo_In);
        SELECT TypeOfRoom, Quality,cost,tCheckIn,tCheckOut 
        INTO TypeOfRoom_Out, Quality_Out, Cost_Out, tCheckIn_Out, tCheckOut_Out
        FROM Room
        WHERE RoomNo_In = RoomNo;
   
        IF(TypeOfRoom_Out = 1) THEN
            DBMS_OUTPUT.PUT_LINE('Loai phong : phong 1 giuong');
        ELSIF (TypeOfRoom_Out = 2) THEN 
            DBMS_OUTPUT.PUT_LINE('Loai phong : phong 2 giuong');     
        END IF;

       IF ( Quality_Out = 'Standard') THEN
            DBMS_OUTPUT.PUT_LINE('Standard : phong tieu chuan trong khach san');
        ELSIF(Quality_Out = 'Superior') THEN
            DBMS_OUTPUT.PUT_LINE('Superior : phong chat luong cao hon Standard');
        ELSIF(Quality_Out  = 'Deluxe' ) THEN
            DBMS_OUTPUT.PUT_LINE('Deluxe :phong co chat luong cao nhat');
        END IF;
        
            DBMS_OUTPUT.PUT_LINE ('Gia dich vu : ' || Cost_Out);
            DBMS_OUTPUT.PUT_LINE ('Ngay Check_In : ' || tCheckIn_Out);
            DBMS_OUTPUT.PUT_LINE ('Ngay Check_Out : ' || tCheckOut_Out);
           
        EXCEPTION
            WHEN no_data_found THEN 
                DBMS_OUTPUT.PUT_LINE('MA PHONG NHAP VAO KHONG HOP LE');

END;
/*==============================================================*/
/*      CHAY PROCEDURE ROOM_INFO                                */
/*==============================================================*/
EXEC Room_Info('R102');
