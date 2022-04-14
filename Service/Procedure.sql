/*==============================================================*/
/*      PROCEDURE: THONG TIN SERVICE	                        */
/*==============================================================*/
    
CREATE OR REPLACE PROCEDURE Service_Info(SerNo_IN IN service.serno%TYPE,
                                         SerName_out OUT service.sername%TYPE,
                                         TOService_out OUT service.typeofservice%TYPE,
                                         cost_out       OUT service.cost%TYPE)
IS BEGIN
    DBMS_OUTPUT.PUT_LINE('MA DICH VU BAN TRUYEN VAO: ' || SerNo_IN);
    SELECT SerName, typeofservice, cost INTO SerName_out, TOService_out, cost_out
    FROM SERVICE 
    WHERE SerNo = SerNo_IN; 
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('THAM SO TRUYEN VAO KHONG HOP LE HOAC KHONG CO');
END;

/*==============================================================*/
/*      CHAY PROCEDURE	                                        */
/*==============================================================*/
DECLARE
    SerNo service.serno%TYPE := 'S001';
    SerName  service.sername%TYPE;
    TOService  service.typeofservice%TYPE;
    cost        service.cost%TYPE;
BEGIN
    Service_Info(SerNo, SerName, TOService, cost);
    DBMS_OUTPUT.PUT_LINE('Ten dich vu: ' || sername);
    IF (TOService = 1) THEN
        DBMS_OUTPUT.PUT_LINE('Loai dich vu: Trong nha');
    ELSIF(TOService = 0) THEN
        DBMS_OUTPUT.PUT_LINE('Loai dich vu: Ngoai troi');
    END IF;
    DBMS_OUTPUT.PUT_LINE('Gia dich vu: ' || cost);
END;