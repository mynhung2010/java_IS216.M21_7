CREATE OR REPLACE PROCEDURE proc_update_moneyDATE(billno_update bill.billno%TYPE)
AS
    SumOfMoney bill.sumofmoney%type;
    PaymentDate PAY.paymentdate%TYPE;   
    tCheckOut Reservation.tCheckOut%TYPE;    
    cost room.cost%type;
    songaytre number;
    
BEGIN   
    SELECT (ROUND(PaymentDate - tCheckOut)/365) into songaytre
    from reservation R JOIN customer C ON r.cusno= c.cusno JOIN PAY ON pay.cusno = C.CUSNO
    WHERE TO_CHAR(PaymentDate,'DD-MM-YY') > TO_CHAR(tCheckOut,'DD-MM-YY');
    IF ( TO_CHAR(PaymentDate,'DD-MM-YY') > TO_CHAR(tCheckOut,'DD-MM-YY')) THEN
         
        UPDATE BILL
        SET SumOfMoney = SumOfMoney +  (cost * 0.05*songaytre)
        WHERE billno=billno_update;
        DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    end if;
END;