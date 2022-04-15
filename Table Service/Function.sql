/*==============================================================*/
/*      FUNCTION: XUAT RA THONG TIN SERVICE MA PHONG DA CHON	*/
/*==============================================================*/

CREATE OR REPLACE FUNCTION ServiceOfRoom(RoomNo_In IN room.roomno%type)
RETURN VARCHAR2
AS
    SerNo_para service.serno%TYPE;
BEGIN
    SELECT SC.SerNo INTO SerNo_para
    FROM ServiceCalled SC join Room R on SC.RoomNo = R.RoomNo
                          join Service S on SC.SerNo = S.SerNo
    WHERE R.RoomNo = RoomNo_In;
    RETURN SerNo_para;
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('MA PHONG TRUYEN VAO KHONG HOP LE HOAC KHONG CO');
END;

/*==============================================================*/
/*      CHAY FUNCTION	                                        */
/*==============================================================*/
    
DECLARE
    RoomNo_IN room.roomno%type := 'R101';
    SerNo_Out service.serno%TYPE;
    SerName_Out service.sername%TYPE;
    Cost_Out service.cost%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Ma phong tim dich vu: ' || RoomNo_IN);
    SerNo_Out := ServiceOfRoom(RoomNo_IN);
    SELECT SerName, Cost INTO SerName_Out, Cost_Out
    FROM Service
    WHERE SerNo = SerNo_Out;
    DBMS_OUTPUT.PUT_LINE('Ma dich vu phong da dat: ' || SerNo_Out);
    DBMS_OUTPUT.PUT_LINE('Ten dich vu: ' || SerName_Out);
    DBMS_OUTPUT.PUT_LINE('Gia tien: ' || Cost_Out);
END;
