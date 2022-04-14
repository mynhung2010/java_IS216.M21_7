/*==============================================================*/
/* Table: Employee                                              */
/*==============================================================*/
Create table Employee(
	EmpNo	varchar2(5) not null,
	EmpName	varchar2(50)	not null,
	Phone	varchar2(10)	not null,
	PosNo	varchar2(5)	not null,
	DateOfBirth	date	not null,
	Gender		number	not null, --0: nam, 1: nữ
	StartDate	date	not null,
	Email		varchar2(30)	not null,
	CONSTRAINT CHK_Gender CHECK (GENDER BETWEEN 0 AND 1)
);
--- Khóa chỉnh bảng Employee
ALTER TABLE Employee ADD CONSTRAINT PK_Employee PRIMARY KEY(EmpNo);


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG EMPLOYEE                            */
/*==============================================================*/
INSERT INTO Employee VALUES ('E001','Nguyen Van Dau','0123456789','P001',TO_DATE('26/08/1990','dd/mm/yyyy'),1,TO_DATE('26/10/2012','dd/mm/yyyy'),'dau@gmail.com');
INSERT INTO Employee VALUES ('E002','Le Thi Anh','0345678912','P002',TO_DATE('26/07/1998','dd/mm/yyyy'),0,TO_DATE('26/11/2012','dd/mm/yyyy'),'anh@gmail.com');
INSERT INTO Employee VALUES ('E003','Nguyen Anh Thien','0135792468','P003',TO_DATE('26/06/1990','dd/mm/yyyy'),1,TO_DATE('26/12/2012','dd/mm/yyyy'),'thien@gmail.com');
INSERT INTO Employee VALUES ('E004','Le Thi Huyen Trang','0246813579','P004',TO_DATE('13/05/1992','dd/mm/yyyy'),0,TO_DATE('10/10/2017','dd/mm/yyyy'),'trang@gmail.com');
INSERT INTO Employee VALUES ('E005','Tran Van Thanh','0778899210','P005',TO_DATE('14/06/1995','dd/mm/yyyy'),1,TO_DATE('10/11/2017','dd/mm/yyyy'),'thanh@gmail.com');
INSERT INTO Employee VALUES ('E006','Pham Trang Nhung','0889972871','P006',TO_DATE('26/08/1996','dd/mm/yyyy'),0,TO_DATE('10/12/2017','dd/mm/yyyy'),'nhung@gmail.com');
INSERT INTO Employee VALUES ('E007','Bui Hoang Phong','0779898771','P007',TO_DATE('27/08/1997','dd/mm/yyyy'),1,TO_DATE('12/10/2018','dd/mm/yyyy'),'phong@gmail.com');
INSERT INTO Employee VALUES ('E008','Le Thi Cam Tu','0112233445','P008',TO_DATE('28/08/1998','dd/mm/yyyy'),0,TO_DATE('09/08/2019','dd/mm/yyyy'),'tu@gmail.com');
INSERT INTO Employee VALUES ('E009','Nguyen Thanh Long','0123456789','P009',TO_DATE('20/08/1999','dd/mm/yyyy'),1,TO_DATE('11/11/2016','dd/mm/yyyy'),'long@gmail.com');
INSERT INTO Employee VALUES ('E010','Hoang Thi Tuyet Ha','0123456789','P010',TO_DATE('30/08/1999','dd/mm/yyyy'),0,TO_DATE('12/12/2018','dd/mm/yyyy'),'ha@gmail.com');
