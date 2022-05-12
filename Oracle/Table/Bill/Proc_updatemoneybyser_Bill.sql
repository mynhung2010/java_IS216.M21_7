CREATE OR REPLACE PROCEDURE proc_update_moneyser(billno_update bill.billno%TYPE)
AS
    SumOfMoney bill.sumofmoney%type;
    SerNo bill.serno%type;
    total_ser NUMBER:=0;
BEGIN
    SELECT COUNT(B.SerNo) into total_ser
    FROM BILL B JOIN ServiceCalled Ser
    on B.SerNo = Ser.SerNo;
    
    IF ( total_ser > 3) THEN
    
        UPDATE BILL
        SET SumOfMoney = (SumOfMoney*0.9)--//gi?m 10%
        WHERE billno=billno_update;
        DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    
    end if;
END;