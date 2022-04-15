/*==============================================================*/
/*      PROCEDURE: XUAT RA THONG TIN EMPLOYEE	                */
/*==============================================================*/

CREATE OR REPLACE PROCEDURE Emp_Info (EmpNo_IN IN employee.empno%TYPE)
AS
    EmpName_Out employee.empname%TYPE;
    Phone employee.phone%TYPE;
    PosNo_Out employee.posno%TYPE;
    Gender employee.gender%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Ma nhan vien: ' || EmpNo_IN);
    SELECT EMPNAME, PHONE, POSNO, GENDER INTO EmpName_Out, Phone, PosNo_Out, Gender
    FROM employee
    WHERE EmpNo = EmpNo_IN;
    DBMS_OUTPUT.PUT_LINE('Ten nhan vien: ' || EmpName_Out);
    DBMS_OUTPUT.PUT_LINE('So dien thoai: ' || Phone);
    DBMS_OUTPUT.PUT_LINE('Ma vi tri: ' || PosNo_Out);
    IF (Gender = 0) THEN 
        DBMS_OUTPUT.PUT_LINE('Gioi tinh: Nam');
    ELSIF (Gender = 1) THEN
        DBMS_OUTPUT.PUT_LINE('Gioi tinh: Nu');
    END IF;
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('MA NHAN VIEN KHONG HOP LE HOAC KHONG CO');
END;

/*==============================================================*/
/*      CHAY THU PROCEDURE	                                    */
/*==============================================================*/

EXEC Emp_Info('E001');