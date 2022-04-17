/*==============================================================*/
/*      PROCEDURE: THONG TIN HOA DON(BILL)	                    */
/*==============================================================*/

CREATE OR REPLACE PROCEDURE proc_bill_info_bill(BillNo_IN IN bill.billno%TYPE)
AS
    CustomerNo customer.cusno%TYPE;
    ServiceNo  service.serno%TYPE;
    RoomNo     room.roomno%TYPE;
    SumOfMoney bill.sumofmoney%TYPE;
    PolNo      policy.polno%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Ma hoa don: ' || BillNo_IN);
    SELECT B.CusNo, B.SerNo, B.RoomNo, SumOfMoney, B. PolNo INTO CustomerNo, ServiceNo, RoomNo, SumOfMoney, PolNo
    FROM   Bill B Join Customer C on B.CusNo = C.CusNo
                  Join Service  S on B.SerNo = S.SerNo
                  Join Room     R on B.RoomNo = R.RoomNo
                  Join Policy   P on B.PolNo = P.PolNo
    WHERE B.BillNo = BillNo_IN;
    DBMS_OUTPUT.PUT_LINE('Ma khach hang: ' || CustomerNo);
    DBMS_OUTPUT.PUT_LINE('Ma dich vu da su dung: ' || ServiceNo);
    DBMS_OUTPUT.PUT_LINE('Ma phong: ' || RoomNo);
    DBMS_OUTPUT.PUT_LINE('Tong tien: ' || SumOfMoney);
    DBMS_OUTPUT.PUT_LINE('Chinh sach giam gia: ' || PolNo);
END;


/*==============================================================*/
/*      CHAY PROCEDURE	                                        */
/*==============================================================*/

EXEC proc_bill_info_bill('B001');