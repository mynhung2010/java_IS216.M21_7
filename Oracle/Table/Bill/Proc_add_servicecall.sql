CREATE OR REPLACE PROCEDURE proc_add_sercall(Bill_No servicecalled.billno%TYPE,
                                            Ser_No servicecalled.serno%TYPE,
                                             Room_No servicecalled.roomno%TYPE)
                                                                                                  
IS
    NumberOfExists NUMBER := 0;
    cost_add service.cost%TYPE;
BEGIN
    --lay ra tien cua dich vu
    SELECT cost INTO cost_add
    FROM SERVICE SER
    WHERE ser.serno = Ser_No;
  
        INSERT INTO SERVICECALLED(billno,SerNo,RoomNo,Note)
        VALUES(bill_no,Ser_No,Room_No,'Không c?n g? thêm');
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
        
        UPDATE BILL
        SET SumOfMoney = SumOfMoney + cost_add
        WHERE bill.billno = Bill_No;
        DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');     

END;