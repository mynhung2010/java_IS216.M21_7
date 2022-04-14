/*==============================================================*/
/*      PROCEDURE: THONG TIN ServiceCalled                */
/*==============================================================*/
    
CREATE OR REPLACE PROCEDURE ServiceCalled_Info(SerNo_IN IN servicecalled.serno%TYPE,
                                         RoomNo_out OUT servicecalled.roomno%TYPE,
                                         Note_out OUT servicecalled.note%TYPE)
                                     
IS BEGIN
    DBMS_OUTPUT.PUT_LINE('Nhap ma dịch vụ  : ' || SerNo_IN);
    SELECT RoomNo, Note INTO RoomNo_out, Note_out
    FROM servicecalled
    WHERE SerNo = SerNo_IN; 
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('THAM SO TRUYEN VAO KHONG HOP LE HOAC KHONG CO');
END;

/*==============================================================*/
/*      CHAY PROCEDURE	                                        */
/*==============================================================*/
DECLARE
    SerNo servicecalled.serno%TYPE :='S001';
    RoomNo servicecalled.roomno%TYPE;
    Note servicecalled.note%TYPE;
    
BEGIN
    ServiceCalled_Info(SerNo, RoomNo, Note);
    DBMS_OUTPUT.PUT_LINE('Ma dịch vụ : ' || SerNo);
    DBMS_OUTPUT.PUT_LINE('Ma phòng: ' || RoomNo);
    DBMS_OUTPUT.PUT_LINE('Chu thích: ' || Note);
END;