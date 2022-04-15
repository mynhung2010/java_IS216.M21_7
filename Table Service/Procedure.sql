/*==============================================================*/
/*      PROCEDURE: THONG TIN SERVICE	                        */
/*==============================================================*/
    
CREATE OR REPLACE PROCEDURE Service_Info(SerNo_IN IN service.serno%TYPE)
AS 
    SerName_out  service.sername%TYPE;
    TOService_out  service.typeofservice%TYPE;
    cost_out        service.cost%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('MA DICH VU BAN TRUYEN VAO: ' || SerNo_IN);
    SELECT SerName, typeofservice, cost INTO SerName_out, TOService_out, cost_out
    FROM SERVICE 
    WHERE SerNo = SerNo_IN; 
    DBMS_OUTPUT.PUT_LINE('Ten dich vu: ' || SerName_out);
    IF (TOService_out = 1) THEN
        DBMS_OUTPUT.PUT_LINE('Loai dich vu: Trong nha');
    ELSIF(TOService_out = 0) THEN
        DBMS_OUTPUT.PUT_LINE('Loai dich vu: Ngoai troi');
    END IF;
    DBMS_OUTPUT.PUT_LINE('Gia dich vu: ' || cost_out);
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('THAM SO TRUYEN VAO KHONG HOP LE HOAC KHONG CO');
END;

/*==============================================================*/
/*      CHAY PROCEDURE	                                        */
/*==============================================================*/

EXEC Service_Info('S001');