CREATE OR REPLACE FUNCTION func_pay_total( FromDate date, ToDate date)
RETURN NUMBER
AS
    total NUMBER;
    PaymentDate PAY.paymentdate%TYPE;
    
BEGIN
    -- lay sumofmoney
    SELECT sum(B.SumOfMoney) INTO total
    FROM Bill B JOIN Pay P 
    ON B.billno=P.billno
    WHERE (TO_CHAR(FromDate,'DD-MM-YY') < TO_CHAR(paymentdate)) and ( TO_CHAR(PaymentDate) < TO_CHAR(ToDate,'DD-MM-YY') );
    RETURN total;
    -- THONG BAO
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Khong tim thay du lieu');
    COMMIT;
END;