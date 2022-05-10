/*==============================================================*/
/*      PROCEDURE: TRA CUU PHONG( THEO CHAT LUONG, LOAI PHONG)	*/
/*==============================================================*/

CREATE OR REPLACE PROCEDURE proc_search_qualityandtype(typeOfRoom_In Room.typeOfRoom%TYPE,
                                                       Quality_IN Room.Quality%TYPE)
AS 
    CURSOR C_TypeQuality IS SELECT DISTINCT typeOfRoom,Quality FROM ROOM WHERE Quality = Quality_IN
                                                                     AND   typeOfRoom = typeOfRoom_In;
    QualityRoom Room.Quality%TYPE;
    TypeRoom Room.typeOfRoom%TYPE;
BEGIN
    OPEN C_TypeQuality;
    LOOP
        FETCH C_TypeQuality INTO TypeRoom,QualityRoom;
        EXIT WHEN C_TypeQuality%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Loai phong: ' || TypeRoom || ' giuong');
        DBMS_OUTPUT.PUT_LINE('Chat luong phong: ' || QualityRoom);
        
        DECLARE
            CURSOR C_ROOM IS SELECT DISTINCT RoomNo
                                   FROM ROOM
                                   WHERE Quality = QualityRoom AND  typeOfRoom = TypeRoom
                                                               AND RoomNo NOT IN (SELECT RoomNo
                                                                                  FROM RESERVATION );
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
    CLOSE C_TypeQuality;
    
END;

EXEC PROC_SEARCH_QUALITYANDTYPE(1,'Standard');