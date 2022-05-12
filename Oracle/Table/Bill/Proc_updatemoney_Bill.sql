CREATE OR REPLACE PROCEDURE proc_update_money(billno_update bill.billno%TYPE)
AS
    SumOfMoney bill.sumofmoney%type;
BEGIN
    IF (SumOfMoney >1000000 ) then
    BEGIN
        UPDATE BILL
        SET SumOfMoney = (SumOfMoney*0.9) --//gi?m 10%
        WHERE billno=billno_update;
        DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    end;
    end if;
END;