/*==============================================================*/
/*      FUNCTION: TÌM NHÂN VIÊN	                                */
/*==============================================================*/
CREATE OR REPLACE FUNCTION Find_Emp (PosNo_IN IN position.posno%TYPE)
RETURN VARCHAR2
AS
    EmpNo_Para employee.empno%TYPE;
BEGIN
    SELECT EmpNo INTO EmpNo_Para
    FROM POSITION 
    WHERE PosNo = PosNo_IN;
    RETURN EmpNo_Para;
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('MA VI TRI KHONG HOP LE');
END;

/*==============================================================*/
/*      CHAY THU FUNCTION                                       */
/*==============================================================*/
DECLARE
    PosNo_IN position.posno%TYPE := 'P006';
    PosName_Find position.posname%TYPE;
    EmpNo_Find employee.empno%TYPE;
    EmpName_Find employee.empname%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Ma vi tri: ' || PosNo_IN);
    SELECT posname INTO PosName_Find
    FROM position
    WHERE posno = PosNo_IN;
    DBMS_OUTPUT.PUT_LINE('Ten vi tri: ' || PosName_Find);
    EmpNo_Find := Find_Emp(PosNo_IN);
    SELECT EmpName INTO EmpName_Find
    FROM employee e join position p on e.empno  = p.empno
    WHERE e.empno = EmpNo_Find;
    DBMS_OUTPUT.PUT_LINE('Ma nhan vien dam nhan vi tri nay: ' || EmpNo_Find);
    DBMS_OUTPUT.PUT_LINE('Ten nhan vien: ' || EmpName_Find);
END;