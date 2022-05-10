/*==============================================================*/
/*      PROCEDURE: TRA CUU PHONG( THEO LOAI PHONG)	        */
/*==============================================================*/

CREATE OR REPLACE PROCEDURE proc_search_type(typeOfRoom_In Room.typeOfRoom%TYPE,
                                             resDate_In   RESERVATION.ResDate%TYPE)
AS 
    CURSOR C_TYPE IS SELECT DISTINCT typeOfRoom, ResDate 
                     FROM ROOM  R JOIN RESERVATION RE ON R.RoomNo = RE.RoomNo 
                     WHERE typeOfRoom = typeOfRoom_In AND RE.ResDate = resDate_In;
    res_Date   RESERVATION.ResDate%TYPE;
    TypeRoom Room.typeOfRoom%TYPE;
BEGIN
    OPEN C_TYPE;
    LOOP
        FETCH C_TYPE INTO TypeRoom, res_Date;
        EXIT WHEN C_TYPE%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Loai phong: ' || TypeRoom || ' giuong');
        
        DECLARE
            CURSOR C_ROOM IS SELECT DISTINCT R.RoomNo
                                   FROM ROOM R JOIN RESERVATION RE ON R.RoomNo = RE.RoomNO
                                   WHERE typeOfRoom = TypeRoom  AND R.RoomNo  NOT IN (SELECT RoomNo
                                                                                      FROM RESERVATION
                                                                                      WHERE ResDate = res_Date)
                             UNION
                             SELECT DISTINCT RoomNo
                             FROM ROOM 
                             WHERE typeOfRoom = TypeRoom  AND RoomNo  NOT IN (SELECT RoomNo
                                                                                      FROM RESERVATION);                                  
            Room_No Room.RoomNo%TYPE;
        BEGIN
            OPEN C_ROOM;
            LOOP 
                FETCH C_ROOM INTO Room_No;
                EXIT WHEN C_ROOM%NOTFOUND;
                
                IF C_ROOM%FOUND THEN
                    
                    DBMS_OUTPUT.PUT_LINE('Ma phong trong: ' || Room_No);
                
                END IF;
            END LOOP;
            CLOSE C_ROOM;
        END;
        
    END LOOP;
    CLOSE C_TYPE;
    
END;

DECLARE
    ngayDangTim DATE := TO_DATE('23/06/2021','dd/mm/yyyy');
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Ngay dang tra cuu: ' || ngayDangTim);
    PROC_SEARCH_TYPE(2, ngayDangTim);
END;