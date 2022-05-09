/*==============================================================*/
/*      TRIGGER: TONG TIEN >= 0 (SumOfMoney)	                */
/*==============================================================*/


CREATE OR REPLACE TRIGGER trigger_sumofmoney_diff0_bill
AFTER INSERT OR UPDATE
ON Bill
FOR EACH ROW
BEGIN
    IF (:NEW.SumOfMoney <= 0) THEN
        Raise_Application_Error(-20011, 'TONG TIEN HOA DON KHONG THE BE HON BANG 0');
    END IF;
END;
-- test
INSERT INTO Bill VALUES ('B011','C010','S010','R109',0,'POL10');