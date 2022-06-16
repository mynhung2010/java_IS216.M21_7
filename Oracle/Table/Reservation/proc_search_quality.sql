/*==============================================================*/
/*      PROCEDURE: TRA CUU PHONG( THEO CHAT LUONG PHONG)	    */
/*==============================================================*/

CREATE OR REPLACE PROCEDURE proc_search_quality(Quality_IN Room.Quality%TYPE,
                                                resDate_In   RESERVATION.ResDate%TYPE)
AS 
    CURSOR C_Quality IS SELECT DISTINCT Quality
                     FROM ROOM  R JOIN RESERVATION RE ON R.RoomNo = RE.RoomNo 
                     WHERE Quality = Quality_IN;
    QualityRoom Room.Quality%TYPE;
BEGIN
    OPEN C_Quality;
    LOOP
        FETCH C_Quality INTO QualityRoom;
        EXIT WHEN C_Quality%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Chat luong phong: ' || QualityRoom);
        
        DECLARE
            CURSOR C_ROOM IS SELECT DISTINCT R.RoomNo
                                   FROM ROOM R JOIN RESERVATION RE ON R.RoomNo = RE.RoomNo
                                   WHERE Quality = QualityRoom  AND R.RoomNo  NOT IN (SELECT RoomNo
                                                                                      FROM RESERVATION
                                                                                      WHERE ResDate = resDate_In) 
                                   UNION
                                   SELECT R.RoomNo
                                   FROM Room R 
                                   WHERE Quality = QualityRoom AND  R.RoomNo NOT IN (SELECT RoomNo
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
    CLOSE C_Quality;
    
END;