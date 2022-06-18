CREATE OR REPLACE PROCEDURE proc_delete_sercall(Bill_No servicecalled.billno%TYPE,
                                            Ser_No servicecalled.serno%TYPE,
                                             Room_No servicecalled.roomno%TYPE)                                                                                           
IS
    cost_add service.cost%TYPE;
BEGIN
    --lay ra tien cua dich vu
    SELECT cost INTO cost_add
    FROM SERVICE SER
    WHERE ser.serno = Ser_No;
    --t?m ph?ng
    
        DELETE FROM SERVICECALLED
        WHERE SerNo = Ser_No and billno = bill_no and roomno=Room_No;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
        
        UPDATE BILL
        SET SumOfMoney = SumOfMoney - cost_add
        WHERE bill.billno = Bill_No;
        DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');       
END;
begin
    proc_delete_sercall('B001','S003','R100');
end;