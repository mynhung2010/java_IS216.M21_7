/*==============================================================*/
/* Table: Employee                                              */
/*==============================================================*/
Create table Employee(
	EmpNo	varchar2(5) not null,
	EmpName	varchar2(50)	not null,
	Phone	varchar2(10)	not null,
	PosNo	varchar2(5)	not null,
	DateOfBirth	date	not null,
	Gender		number	not null, --0: nam, 1: n?
	StartDate	date	not null,
	Email		varchar2(30)	not null unique,
    AccountID   NUMBER          not null,
	CONSTRAINT CHK_Gender CHECK (GENDER BETWEEN 0 AND 1)
);
--- Khóa ch?nh b?ng Employee
ALTER TABLE Employee ADD CONSTRAINT PK_Employee PRIMARY KEY(EmpNo);

ALTER TABLE Employee
    ADD CONSTRAINT FK_AccountID_Emp_Acc FOREIGN KEY(AccountID)
        REFERENCES ACCOUNT(AccountID);

		
/*==============================================================*/
/*      INSERT D? LI?U B?NG EMPLOYEE                            */
/*==============================================================*/
INSERT INTO Employee VALUES ('E016','Phạm Trang Nhung','0889972871','P006',TO_DATE('26/08/1996','dd/mm/yyyy'),1,TO_DATE('10/12/2017','dd/mm/yyyy'),'nhung@gmail.com',101);

INSERT INTO Employee VALUES ('E001','Nguyễn Văn Dậu','0123456789','P001',TO_DATE('26/08/1990','dd/mm/yyyy'),0,TO_DATE('26/10/2012','dd/mm/yyyy'),'dau@gmail.com',1);
INSERT INTO Employee VALUES ('E002','Lê Thị Anh','0345678912','P002',TO_DATE('26/07/1998','dd/mm/yyyy'),1,TO_DATE('26/11/2012','dd/mm/yyyy'),'anh@gmail.com',2);
INSERT INTO Employee VALUES ('E003','Nguyễn Anh Thiên','0135792468','P003',TO_DATE('26/06/1990','dd/mm/yyyy'),0,TO_DATE('26/12/2012','dd/mm/yyyy'),'thien@gmail.com',3);
INSERT INTO Employee VALUES ('E004','Lê Thị Huyền Trang','0246813579','P004',TO_DATE('13/05/1992','dd/mm/yyyy'),1,TO_DATE('10/10/2017','dd/mm/yyyy'),'trang@gmail.com',4);
INSERT INTO Employee VALUES ('E005','Trần Văn Thanh','0778899210','P005',TO_DATE('14/06/1995','dd/mm/yyyy'),0,TO_DATE('10/11/2017','dd/mm/yyyy'),'thanh@gmail.com',5);
INSERT INTO Employee VALUES ('E006','Bùi Hoàng Phong','0779898771','P007',TO_DATE('27/08/1997','dd/mm/yyyy'),0,TO_DATE('12/10/2018','dd/mm/yyyy'),'phong@gmail.com',6);
INSERT INTO Employee VALUES ('E007','Lê Thị Cẩm Tú','0112233445','P008',TO_DATE('28/08/1998','dd/mm/yyyy'),1,TO_DATE('09/08/2019','dd/mm/yyyy'),'tu@gmail.com',7);
INSERT INTO Employee VALUES ('E008','Nguyễn Thành Long','0123456789','P009',TO_DATE('20/08/1999','dd/mm/yyyy'),0,TO_DATE('11/11/2016','dd/mm/yyyy'),'long@gmail.com',8);
INSERT INTO Employee VALUES ('E009','Hoàng Thị Tuyết Hà','0123456789','P010',TO_DATE('30/08/1999','dd/mm/yyyy'),1,TO_DATE('12/12/2018','dd/mm/yyyy'),'ha@gmail.com',9);
INSERT INTO Employee VALUES ('E010','Bùi Đức Duy','0354354353','P011',TO_DATE('21/02/1998','dd/mm/yyyy'),0,TO_DATE('14/04/2019','dd/mm/yyyy'),'duy@gmail.com',10);
INSERT INTO Employee VALUES ('E011','Trần Ngọc Như','0254837235','P012',TO_DATE('30/08/1997','dd/mm/yyyy'),1,TO_DATE('12/3/2018','dd/mm/yyyy'),'nhu@gmail.com',11);
INSERT INTO Employee VALUES ('E012','Nguyễn Duy Anh','0123456789','P013',TO_DATE('23/07/1989','dd/mm/yyyy'),0,TO_DATE('12/5/2018','dd/mm/yyyy'),'danh@gmail.com',12);
INSERT INTO Employee VALUES ('E013','Nguyễn Thị Thảo Hà','0326483923','P014',TO_DATE('12/04/2000','dd/mm/yyyy'),1,TO_DATE('06/03/2018','dd/mm/yyyy'),'tha@gmail.com',13);
INSERT INTO Employee VALUES ('E014','Lê Anh Thư','0384249312','P015',TO_DATE('04/08/1999','dd/mm/yyyy'),1,TO_DATE('23/01/2018','dd/mm/yyyy'),'thu@gmail.com',14);