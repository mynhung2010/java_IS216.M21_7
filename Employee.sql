/*==============================================================*/
/* Table: Employee                                              */
/*==============================================================*/
Create table Employee(
	EmpNo	varchar(5) not null,
	EmpName	nvarchar(50)	not null,
	Phone	varchar(10)	not null,
	PosNo	varchar(5)	not null,
	DateOfBirth	smalldatetime	not null,
	Gender		int	not null, --0: nam, 1: nữ
	StartDate	smalldatetime	not null,
	Email		varchar(30)	not null,
	CONSTRAINT CHK_Gender CHECK (Gender BETWEEN 0 AND 1)
);
--- Khóa chỉnh bảng Employee
ALTER TABLE Employee ADD CONSTRAINT PK_Employee PRIMARY KEY(EmpNo);


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG EMPLOYEE                            */
/*==============================================================*/
INSERT INTO Employee VALUES ('E001',N'Nguyễn Văn Đẩu','0123456789','P001','26/08/1990',1,'26/10/2012','dau@gmail.com');
INSERT INTO Employee VALUES ('E002',N'Lê Thị Anh','0345678912','P002','26/07/1998',0,'26/11/2012','anh@gmail.com');
INSERT INTO Employee VALUES ('E003',N'Nguyễn Anh Thiên','0135792468','P003','26/06/1990',1,'26/12/2012','thien@gmail.com');
INSERT INTO Employee VALUES ('E004',N'Lê Thị Huyền Trang','0246813579','P004','13/05/1992',0,'10/10/2017','trang@gmail.com');
INSERT INTO Employee VALUES ('E005',N'Trần Văn Thanh','0778899210','P005','14/06/195',1,'10/11/2017','thanh@gmail.com');
INSERT INTO Employee VALUES ('E006',N'Phạm Trang Nhung','0889972871','P006','26/08/1996',0,'10/12/2017','phong@gmail.com');
INSERT INTO Employee VALUES ('E007',N'Bùi Hoàng Phong','0779898771','P007','27/08/1997',1,'12/10/2018','dau@gmail.com');
INSERT INTO Employee VALUES ('E008',N'Lê Thị Cẩm Tú','0112233445','P008','28/08/1998',0,'09/08/2019','tu@gmail.com');
INSERT INTO Employee VALUES ('E009',N'Nguyễn Thành Long','0123456789','P009','20/08/1999',1,'11/11/2016','long@gmail.com');
INSERT INTO Employee VALUES ('E010',N'Hoàng Thị Tuyết Hà','0123456789','P010','30/08/1999',0,'12/12/2018','ha@gmail.com');
