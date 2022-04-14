/*==============================================================*/
/*      TRIGGER: TUOI NHAN VIEN >= 18	                        */
/*==============================================================*/

CREATE OR REPLACE TRIGGER AgeOfNhanVien
AFTER INSERT OR UPDATE
ON Employee
FOR EACH ROW
BEGIN
    IF((:New.StartDate - :New.DateOfBirth)/365  < 18) THEN
        Raise_Application_Error(-20000, 'KHONG THE CHO NHAN VIEN LAM VIEC VI CHUA DU 18 TUOI');
    END IF;
END;