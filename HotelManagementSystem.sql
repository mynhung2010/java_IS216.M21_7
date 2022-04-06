--CREATE DATABASE HotelManagementSystem
--GO

--USE HotelManagementSystem
--GO

--drop database HotelManagementSystem

------------------------------------------------------------ CÁC BẢNG VÀ THUỘC TÍNH ------------------------------------------------------------ 


/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
CREATE TABLE Customer(
	CusNo	varchar(5)	not null,
	CusName	nvarchar(50)	not null,
	Gender			int not null,     -- 0:Nam; 1:Nữ
	Address		nvarchar(100)not null,
	Phone		varchar(10) not null,
	Email		varchar(50)	not null,
	ID			varchar(12)	not null    --CMND/CCCD
);
--Tạo khóa chính
ALTER TABLE Customer ADD CONSTRAINT PK_Customer PRIMARY KEY (CusNo)
GO

/*==============================================================*/
/* Table: Reservation                                                */
/*==============================================================*/
CREATE TABLE Reservation(
	ResNo			varchar(5)	not null,
	CusNo		varchar(5)	not null,
	RoomNo 			varchar(5)		not null,
	ResDate		Smalldatetime	not null
);
--Tạo khóa chính
ALTER TABLE Reservation ADD CONSTRAINT PK_Reservation PRIMARY KEY (ResNo)
GO

/*==============================================================*/
/* Table: Service                                                */
/*==============================================================*/
CREATE TABLE Service(
	SerNo				varchar(5)		not null,
	SerName				nvarchar(50)	not null,
	TypeOfService		Int		not null, --0:Ngoài trời ; 1:Trong nhà
	Cost				Money		not null,
	CONSTRAINT CHK_TypeOfService CHECK (TypeOfService BETWEEN 0 AND 1 )
);
--Tạo khóa chính
ALTER TABLE Service ADD CONSTRAINT PK_Service PRIMARY KEY (SerNo)
GO

/*==============================================================*/
/* Table: Assessroom                                                */
/*==============================================================*/
CREATE TABLE Assessroom(
	Point			Float not null, 
	Comment			nvarchar(100) not null,
	RoomNo			varchar(5) not null,
	CusNo		varchar(5) not null,
	CONSTRAINT CHK_Point CHECK (Point BETWEEN 0 AND 10)
);
--Tạo khóa chính
ALTER TABLE Assessroom ADD CONSTRAINT PK_Assessroom PRIMARY KEY (RoomNo,CusNo)
GO

/*==============================================================*/
/* Table: Belong                                                */
/*==============================================================*/
CREATE TABLE Belong(
	ItemNo		varchar(5) not null,
	RoomNo		varchar(5) not null
);
--Tạo khóa chính
ALTER TABLE Belong ADD CONSTRAINT PK_Belong PRIMARY KEY (ItemNo)
GO

/*==============================================================*/
/* Table: Position                                              */
/*==============================================================*/
CREATE TABLE Position(
	PosNo		varchar(5)	not null,
	PosName		nvarchar(50)	not null,
	EmpNo		varchar(5) not null
);
--Tạo khóa chính
ALTER TABLE Position ADD CONSTRAINT PK_Position PRIMARY KEY (PosNo)
GO

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
	CONSTRAINT CHK_Gender CHECK (GENDER BETWEEN 0 AND 1)
);
--- Khóa chỉnh bảng Employee
ALTER TABLE Employee ADD CONSTRAINT PK_Employee PRIMARY KEY(EmpNo);

/*==============================================================*/
/* Table: Room													*/
/*==============================================================*/
Create table Room(
	RoomNo	varchar(5) not null,
	TypeOfRoom	int 	not null, --1: 1 giường, 2: 2 giường
	Quality		varchar(10)	not null,
	--- Quality
		-- Standard: Phòng tiêu chuẩn trong khách sạn
		-- Superior: Phòng có chất lượng cao hơn standard(gọi tắt là SUP)
		-- Deluxe: Phòng có chất lượng khá cao, thường nằm ở tầng cao khách sạn (gọi tắt là DLX)
	Cost		money		not null,
	tCheckIn	smalldatetime	not null,
	tCheckOut	smalldatetime	not null,
	CONSTRAINT CHK_TYPE CHECK (TypeOfRoom BETWEEN 1 AND 2),
	CONSTRAINT CHK_QUALITY CHECK (Quality IN ('Standard','Superior','Deluxe'))
);
--- khóa chính bảng Room
ALTER TABLE Room ADD CONSTRAINT PK_ROOM PRIMARY KEY (RoomNo);


/*==============================================================*/
/* Table: Bill													*/
/*==============================================================*/
Create table Bill(
	BillNo		varchar(5)		not null,
	CusNo	varchar(5)	not null,
	SerNo	varchar(5)		not null,
	RoomNo		varchar(5)	not null,
	SumOfMoney	money		not null,
	PolNo	varchar(5)	not null
);
--- Khóa chính bảng Bill
ALTER TABLE Bill ADD CONSTRAINT PK_Bill PRIMARY KEY(BillNo);

/*==============================================================*/
/* Table: ServiceCalled                                         */
/*==============================================================*/
Create table ServiceCalled(
	SerNo	varchar(5) not null,
	RoomNo		varchar(5)	not null,
	Note		nvarchar(2000)
);
--- Khóa chính ServiceCalled
ALTER TABLE ServiceCalled ADD CONSTRAINT PK_ServiceCalled PRIMARY KEY(SerNo, RoomNo);

/*==============================================================*/
/* Table: Item							*/
/*==============================================================*/
Create table Item(
	ItemNo		varchar(5) not null,
	ItemName	nvarchar(30)	not null,
	NoOfItem	int	not null,
	Status		nvarchar(20)	not null,-- Tốt, hư hỏng, chưa trang bị
	CONSTRAINT CHK_STATUS CHECK(Status IN (N'Tốt', N'Hư hỏng', N'Chưa trang bị'))
);
--- Khóa chính bảng Item
ALTER TABLE Item ADD CONSTRAINT PK_ITEM PRIMARY KEY(ItemNo);

/*==============================================================*/
/* Table: Policy						*/
/*==============================================================*/
Create table Policy(
	PolNo	varchar(5)	not null,
	PolName	nvarchar(50)	not null,
	Requirement	int	not null,
	-- Requirement:
		-- 1: Thời gian ở
		-- 2: Ngày lễ
		-- 3: Sử dụng dịch vụ 
	tApplication	smalldatetime	not null,
	StartDate	smalldatetime	not null,
	CONSTRAINT CHK_Requirement CHECK (Requirement BETWEEN 1 AND 3)
);
--- Khóa chính Policy
ALTER TABLE Policy ADD CONSTRAINT PK_Policy PRIMARY KEY(PolNo);

/*==============================================================*/
/* Table: Account												*/
/*==============================================================*/
CREATE TABLE Account (
	LoginID		varchar(20) not null,
	Password	varchar(20) not null,
	Status		int not null,
	-- Status:
		-- 1: tài khoản đang hoạt động trong hệ thống
		-- 2: tài khoản đã đăng xuất khỏi hệ thống
	CONSTRAINT CHK_Status01 CHECK (Status BETWEEN 1 AND 2)	
);
--- Khóa chính Account
ALTER TABLE Account ADD CONSTRAINT PK_Acount PRIMARY KEY(LoginID);

/*==============================================================*/
/* Table: Pay													*/
/*==============================================================*/
CREATE TABLE Pay (
	BillNo			varchar(5) not null,
	CusNo			varchar(5) not null,
	Method			int not null,
	-- Status:
		-- 1: dùng COD
		-- 2: Bằng cách chuyển khoản
	PaymentDate		smalldatetime not null,
	CONSTRAINT CHK_Method CHECK (Method BETWEEN 1 AND 2)	
);
--- Khóa chính Pay
ALTER TABLE Pay ADD CONSTRAINT PK_Pay PRIMARY KEY(BillNo,CusNo);

-------------------------------------------------------- Khóa ngoại -------------------------------------------------------- 

ALTER TABLE Assessroom
   ADD CONSTRAINT FK_ASSESSRO_ASSESSROO_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO)


ALTER TABLE Assessroom
   ADD CONSTRAINT FK_ASSESSRO_ASSESSROO_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO)


ALTER TABLE Pay
   ADD CONSTRAINT FK_Pay_Pay_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO)


ALTER TABLE Pay
   ADD CONSTRAINT FK_Pay_Pay2_BILL FOREIGN KEY (BILLNO)
      REFERENCES BILL (BILLNO)

ALTER TABLE Position
   ADD CONSTRAINT FK_Position_IS_EMPLOYEE FOREIGN KEY (EMPNO)
      REFERENCES EMPLOYEE (EMPNO)


ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO)


ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO)


ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_Service FOREIGN KEY (SERNO)
      REFERENCES Service (SERNO)


ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO)



-------------------------------------------------------- NHẬP DỮ LIỆU --------------------------------------------------------

/*==============================================================*/
/*      SET DỮ LIỆU DMY ĐỂ NHẬP DỮ LIỆU				*/
/*==============================================================*/
SET DATEFORMAT DMY;


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG EMPLOYEE                            */
/*==============================================================*/
INSERT INTO Employee VALUES ('E001',N'Nguyễn Văn Đẩu','0123456789','P001','26/08/1990',1,'26/10/2012','dau@gmail.com');
INSERT INTO Employee VALUES ('E002',N'Lê Thị Anh','0345678912','P002','26/07/1998',0,'26/11/2012','anh@gmail.com');
INSERT INTO Employee VALUES ('E003',N'Nguyễn Anh Thiên','0135792468','P003','26/06/1990',1,'26/12/2012','thien@gmail.com');
INSERT INTO Employee VALUES ('E004',N'Lê Thị Huyền Trang','0246813579','P004','13/05/1992',0,'10/10/2017','trang@gmail.com');
INSERT INTO Employee VALUES ('E005',N'Trần Văn Thanh','0778899210','P005','14/06/1995',1,'10/11/2017','thanh@gmail.com');
INSERT INTO Employee VALUES ('E006',N'Phạm Trang Nhung','0889972871','P006','26/08/1996',0,'10/12/2017','phong@gmail.com');
INSERT INTO Employee VALUES ('E007',N'Bùi Hoàng Phong','0779898771','P007','27/08/1997',1,'12/10/2018','dau@gmail.com');
INSERT INTO Employee VALUES ('E008',N'Lê Thị Cẩm Tú','0112233445','P008','28/08/1998',0,'09/08/2019','tu@gmail.com');
INSERT INTO Employee VALUES ('E009',N'Nguyễn Thành Long','0123456789','P009','20/08/1999',1,'11/11/2016','long@gmail.com');
INSERT INTO Employee VALUES ('E010',N'Hoàng Thị Tuyết Hà','0123456789','P010','30/08/1999',0,'12/12/2018','ha@gmail.com');


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG ROOM				*/
/*==============================================================*/
INSERT INTO Room VALUES ('R100',1,'Standard',200000,'24/06/2021','27/06/2021');
INSERT INTO Room VALUES ('R101',2,'Standard',450000,'14/03/2021','16/3/2021');
INSERT INTO Room VALUES ('R102',1,'Superior',250000,'30/06/2021','02/07/2021');
INSERT INTO Room VALUES ('R103',2,'Superior',500000,'05/05/2021','06/05/2021');
INSERT INTO Room VALUES ('R104',1,'Deluxe',300000,'05/05/2021','08/05/2021');
INSERT INTO Room VALUES ('R105',2,'Deluxe',550000,'24/04/2021','25/04/2021');
INSERT INTO Room VALUES ('R106',1,'Standard',200000,'26/06/2021','28/06/2021');
INSERT INTO Room VALUES ('R107',1,'Superior',250000,'21/01/2021','23/01/2021');
INSERT INTO Room VALUES ('R108',2,'Deluxe',550000,'22/07/2021','23/07/2021');
INSERT INTO Room VALUES ('R109',2,'Deluxe',550000,'08/06/2021','11/06/2021');


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG BILL				*/
/*==============================================================*/
INSERT INTO Bill VALUES ('B001','C001','S001','R100',1600000,'POL01');
INSERT INTO Bill VALUES ('B002','C002','S002','R101',2000000,'POL02');
INSERT INTO Bill VALUES ('B003','C003','S003','R102',1000000,'POL03');
INSERT INTO Bill VALUES ('B004','C004','S004','R103',520000,'POL04');
INSERT INTO Bill VALUES ('B005','C005','S005','R104',5900000,'POL05');
INSERT INTO Bill VALUES ('B006','C006','S006','R105',5550000,'POL06');
INSERT INTO Bill VALUES ('B007','C007','S007','R106',1400000,'POL07');
INSERT INTO Bill VALUES ('B008','C008','S008','R107',1500000,'POL08');
INSERT INTO Bill VALUES ('B009','C009','S009','R108',600000,'POL09');
INSERT INTO Bill VALUES ('B010','C010','S010','R109',3550000,'POL10');


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Service                             */
/*==============================================================*/

INSERT INTO Service VALUES ('S001',N'Dịch vụ Spa',1,1000000)
INSERT INTO Service VALUES ('S002',N'Dịch vụ cà phê',1,100000)
INSERT INTO Service VALUES ('S003',N'Dịch vụ thuê xe',0,500000)
INSERT INTO Service VALUES ('S004',N'Dịch vụ giặc đồ',1,20000)
INSERT INTO Service VALUES ('S005',N'Dịch vụ thuê phòng họp',1,5000000)
INSERT INTO Service VALUES ('S006',N'Dịch vụ thuê phòng karaoke',0,5000000)
INSERT INTO Service VALUES ('S007',N'Dịch vụ tiệc ngoài trời',0,1000000)
INSERT INTO Service VALUES ('S008',N'Dịch vụ sân tennis',0,800000)
INSERT INTO Service VALUES ('S009',N'Dịch vụ phòng gym',1,50000)
INSERT INTO Service VALUES ('S010',N'Dịch vụ bar trên lầu khách sạn',0,1900000)


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG ServiceCalled			*/
/*==============================================================*/
INSERT INTO ServiceCalled VALUES('S001','R100',N'Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('S002','R101',N'Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('S003','R102',N'Chỉ lấy 2 chiếc xe đạp');
INSERT INTO ServiceCalled VALUES('S004','R103',N'Giặc xong giao trả tận phòng');
INSERT INTO ServiceCalled VALUES('S005','R104',N'Cần phòng rộng, có máy lạnh');
INSERT INTO ServiceCalled VALUES('S006','R105',N'Trang bị sẵn 2 mic, trái cây');
INSERT INTO ServiceCalled VALUES('S007','R106',N'Kế bên tiệc có hồ bơi');
INSERT INTO ServiceCalled VALUES('S008','R107',N'Cần 2 cây vợt đánh tennis');
INSERT INTO ServiceCalled VALUES('S009','R108',N'Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('S010','R109',N'Không cần gì thêm');


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Item				*/
/*==============================================================*/
INSERT INTO Item VALUES('I001',N'Bàn là', 1,N'Tốt');
INSERT INTO Item VALUES('I002',N'Khăn tắm', 2,N'Chưa trang bị');
INSERT INTO Item VALUES('I003',N'Mền', 2,N'Tốt');
INSERT INTO Item VALUES('I004',N'Móc quần áo', 5,N'Hư hỏng');
INSERT INTO Item VALUES('I005',N'Bình đun siêu tốc', 1,N'Tốt');
INSERT INTO Item VALUES('I006',N'Quạt đứng', 1,N'Chưa trang bị');
INSERT INTO Item VALUES('I007',N'Ti vi', 1,N'Tốt');
INSERT INTO Item VALUES('I008',N'Tủ lạnh', 1,N'Hư hỏng');
INSERT INTO Item VALUES('I009',N'Móc quần áo', 5,N'Tốt');
INSERT INTO Item VALUES('I010',N'Mền', 2,N'Chưa trang bị');


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Policy								*/
/*==============================================================*/
INSERT INTO Policy VALUES('POL01',N'Ở càng nhiều khuyến mãi càng cao',1,3,'23/6/2021');
INSERT INTO Policy VALUES('POL02',N'Vui chơi ngày lễ nghỉ tại khách sạn',2,1,'14/3/2021');
INSERT INTO Policy VALUES('POL03',N'Xài dịch vụ xài khuyến mãi',3,2,'01/07/2021');
INSERT INTO Policy VALUES('POL04',N'Xài dịch vụ xài khuyến mãi',3,2,'06/05/2021');
INSERT INTO Policy VALUES('POL05',N'Vui chơi lễ nghỉ ngơi tại khách sạn',3,2,'08/05/2021');
INSERT INTO Policy VALUES('POL06',N'Ngày lễ lao động',2,1,'30/04/2021');
INSERT INTO Policy VALUES('POL07',N'Vui chơi lễ nghỉ ngơi tại khách sạn',2,1,'28/06/2021');
INSERT INTO Policy VALUES('POL08',N'Ở càng lâu khuyến mãi càng nhiều',1,3,'23/01/2021');
INSERT INTO Policy VALUES('POL09',N'Ở càng lâu khuyến mãi càng nhiều',1,3,'25/07/2021');
INSERT INTO Policy VALUES('POL10',N'Ngày lễ vui chơi',2,1,'01/06/2021');


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Customer                            */
/*==============================================================*/

INSERT INTO Customer VALUES ('C001',N'Trần Thị Mỹ Nhung',1,N'Gia Lai','0343927832','nhung@gmail.com','049573028324')
INSERT INTO Customer VALUES ('C002',N'Nguyễn Thành Phát',0,N'Thành phố Hồ Chí Minh','0335482738','phat@gmail.com','054928475893')
INSERT INTO Customer VALUES ('C003',N'Nguyễn Thị Thảo Hồng',1,N'Quảng Nam','0334586738','hong@gmail.com','035559375847')
INSERT INTO Customer VALUES ('C004',N'Vũ Tiến Linh',0,N'Nam Định','0365827407','linh@gmail.com','048529475843')
INSERT INTO Customer VALUES ('C005',N'Nguyễn Hoài Linh',0,N'Thành phố Hồ Chí Minh','0224584727','linh@gmail.com','025847393024')
INSERT INTO Customer VALUES ('C006',N'Nguyễn Anh Kiệt',0,N'Đồng Tháp','0326843438','kiet@gmail.com','034465584292')
INSERT INTO Customer VALUES ('C007',N'Vũ Thị Phương Linh',1,N'Gia Lai','0234573859','linhvu@gmail.com','042386549373')
INSERT INTO Customer VALUES ('C008',N'Trần Ngọc Mỹ Quyên',1,N'Bình Định','0343927832','quyen@gmail.com','026837542965')
INSERT INTO Customer VALUES ('C009',N'Bùi Duy Thiện',0,N'Đăk Lăk','0857437233','thien@gmail.com','024937584372')
INSERT INTO Customer VALUES ('C010',N'Trần Anh Huy',0,N'Bình Dương','0489274823','huy@gmail.com','044389754618')

/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Reservation                         */
/*==============================================================*/

INSERT INTO Reservation VALUES ('RE001','C001','R100','23/6/2021')
INSERT INTO Reservation VALUES ('RE002','C003','R101','12/3/2021')
INSERT INTO Reservation VALUES ('RE003','C002','R102','29/6/2021')
INSERT INTO Reservation VALUES ('RE004','C006','R103','4/5/2021')
INSERT INTO Reservation VALUES ('RE005','C009','R104','3/5/2021')
INSERT INTO Reservation VALUES ('RE006','C010','R105','23/4/2021')
INSERT INTO Reservation VALUES ('RE007','C004','R106','25/6/2021')
INSERT INTO Reservation VALUES ('RE008','C005','R107','21/1/2021')
INSERT INTO Reservation VALUES ('RE009','C007','R108','22/7/2021')
INSERT INTO Reservation VALUES ('RE010','C008','R109','8/6/2021')



/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Assessroom                          */
/*==============================================================*/

INSERT INTO Assessroom VALUES ('8',N'Dịch vụ phục vụ tốt','R100','C001')
INSERT INTO Assessroom VALUES ('7.5',N'Chất lượng phòng tiện nghi','R101','C002')
INSERT INTO Assessroom VALUES ('9',N'Việc cung cấp dịch vụ ở mức giá phù hợp với khả năng người tiêu dùng','R102','C003')
INSERT INTO Assessroom VALUES ('7',N'Phòng cũng bình thường','R103','C004')
INSERT INTO Assessroom VALUES ('8',N'Chất lượng phòng phù hợp với mức tiền','R104','C005')
INSERT INTO Assessroom VALUES ('8.5',N'Giá đặt phòng rẻ','R105','C006')
INSERT INTO Assessroom VALUES ('8',N'Khách sạn có an ninh an toàn','R106','C007')
INSERT INTO Assessroom VALUES ('9.5',N'Khung viên luôn vệ sinh sạch sẽ','R107','C008')
INSERT INTO Assessroom VALUES ('10',N'Dịch vụ phục vụ tốt, nhân viên nhiệt tình','R108','C009')
INSERT INTO Assessroom VALUES ('8',N'Khách sạn phục vụ thiết bị tiện nghi','R109','C010')

/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Belong                              */
/*==============================================================*/

INSERT INTO Belong VALUES ('I001','R100')
INSERT INTO Belong VALUES ('I002','R101')
INSERT INTO Belong VALUES ('I003','R102')
INSERT INTO Belong VALUES ('I004','R103')
INSERT INTO Belong VALUES ('I005','R104')
INSERT INTO Belong VALUES ('I006','R105')
INSERT INTO Belong VALUES ('I007','R106')
INSERT INTO Belong VALUES ('I008','R107')
INSERT INTO Belong VALUES ('I009','R108')
INSERT INTO Belong VALUES ('I010','R109')

/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Position				*/
/*==============================================================*/

INSERT INTO Position VALUES('P001',N'Lễ Tân','E001')
INSERT INTO Position VALUES('P002',N'Phục vụ','E002')
INSERT INTO Position VALUES('P003',N'Phục vụ','E003') 
INSERT INTO Position VALUES('P004',N'Phụ phòng','E004')
INSERT INTO Position VALUES('P005',N'Vệ sinh','E005')
INSERT INTO Position VALUES('P006',N'Quản lý','E006')
INSERT INTO Position VALUES('P007',N'Bảo vệ','E007')   
INSERT INTO Position VALUES('P008',N'Lễ Tân','E008')
INSERT INTO Position VALUES('P009',N'Lễ Tân','E009')
INSERT INTO Position VALUES('P010',N'Lễ Tân','E010')


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Account                             */
/*==============================================================*/

INSERT INTO Account VALUES('My Nhung','0343927832N',1)
INSERT INTO Account VALUES('Thanh Phat','0335482738P',1)
INSERT INTO Account VALUES('Thao Hong','0334586738H',1)
INSERT INTO Account VALUES('Tien Linh','0365827407L',1)
INSERT INTO Account VALUES('Hoai Linh','0224584727L',2)
INSERT INTO Account VALUES('Anh Kiet','0326843438K',1)
INSERT INTO Account VALUES('Phuong Linh','0234573859L',1)
INSERT INTO Account VALUES('My Quyen','0343927832Q',2)
INSERT INTO Account VALUES('Duy Thien','0857437233T',2)
INSERT INTO Account VALUES('Anh Duy','0489274823D',2)

/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Pay		                            */
/*==============================================================*/

INSERT INTO Pay VALUES ('B001','C001',1,'22/2/2022')
INSERT INTO Pay VALUES ('B002','C002',2,'03/3/2022')
INSERT INTO Pay VALUES ('B003','C003',1,'23/12/2021')
INSERT INTO Pay VALUES ('B004','C004',1,'06/3/2022')
INSERT INTO Pay VALUES ('B005','C005',2,'28/2/2022')
INSERT INTO Pay VALUES ('B006','C006',2,'13/12/2021')
INSERT INTO Pay VALUES ('B007','C007',1,'20/11/2021')
INSERT INTO Pay VALUES ('B008','C008',2,'09/10/2021')
INSERT INTO Pay VALUES ('B009','C009',2,'26/3/2022')
INSERT INTO Pay VALUES ('B010','C010',1,'17/1/2022')