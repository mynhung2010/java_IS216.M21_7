
--drop table assessroom;
--drop table belong;
--drop table item;
--drop table pay;
--drop table position;
--drop table reservation;
--drop table servicecalled;
--drop table service;
--drop table bill;
--drop table employee;
--drop table room;
--drop table customer;
--drop table account;
------------------------------------------------------------ CAC BANG VA THUOC TINH ------------------------------------------------------------ 
/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
CREATE TABLE Customer(
	CusNo	varchar2(5)	not null,
	CusName	varchar2(50)	not null,
	Gender			int not null,     -- 0:Nam; 1:Nu
	Address		varchar2(100)not null,
	Phone		varchar2(10) not null,
	Email		varchar2(50)	not null unique,
	ID			varchar2(12)	not null,   --CMND/CCCD
    AccountID   NUMBER          not null
);

--T?o khóa chính
ALTER TABLE Customer ADD CONSTRAINT PK_Customer PRIMARY KEY (CusNo);


/*==============================================================*/
/* Table: Reservation                                           */
/*==============================================================*/
CREATE TABLE Reservation(
	ResNo			varchar2(5)	not null,
    billNo          varchar2(5) not null,
	CusNo		varchar2(5)	not null,
	RoomNo 			varchar2(5)		not null,
	ResDate		date	not null,
    tCheckIn	date	not null,
	tCheckOut	date	not null
);
--T?o khóa chính
ALTER TABLE Reservation ADD CONSTRAINT PK_Reservation PRIMARY KEY (ResNo);



/*==============================================================*/
/* Table: Service                                               */
/*==============================================================*/
CREATE TABLE Service(
	SerNo				varchar2(5)		not null,
	SerName				varchar2(50)	not null,
	TypeOfService		number		not null, --0:Ngoài tr?i ; 1:Trong nhà
	Cost				number		not null,
	CONSTRAINT CHK_TypeOfService CHECK (TypeOfService BETWEEN 0 AND 1 )
);
--T?o khóa chính
ALTER TABLE Service ADD CONSTRAINT PK_Service PRIMARY KEY (SerNo);

/*==============================================================*/
/* Table: Assessroom                                            */
/*==============================================================*/

CREATE TABLE Assessroom(
	Point			float not null, 
     "Comment"			varchar2(2000) not null,
	RoomNo			varchar2(5) not null,
	CusNo		varchar2(5) not null,
   
	CONSTRAINT CHK_Point CHECK (Point BETWEEN 0 AND 10)
);

--T?o khóa chính
ALTER TABLE Assessroom ADD CONSTRAINT PK_Assessroom PRIMARY KEY (RoomNo,CusNo);



/*==============================================================*/
/* Table: Belong                                                */
/*==============================================================*/
CREATE TABLE Belong(
	ItemNo		varchar2(5) not null,
	RoomNo		varchar2(5) not null
);
--T?o khóa chính
ALTER TABLE Belong ADD CONSTRAINT PK_Belong PRIMARY KEY (ItemNo);



/*==============================================================*/
/* Table: Position                                              */
/*==============================================================*/
CREATE TABLE Position(
	PosNo		varchar2(5)	not null,
	PosName		varchar2(50)	not null,
	EmpNo		varchar2(5) not null
);
--T?o khóa chính
ALTER TABLE Position ADD CONSTRAINT PK_Position PRIMARY KEY (PosNo);



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



/*==============================================================*/
/* Table: Room							                        */
/*==============================================================*/
Create table Room(
	RoomNo	varchar2(5) not null,
	TypeOfRoom	number 	not null, --1: 1 gi??ng, 2: 2 gi??ng
	Quality		varchar2(10)	not null,
	--- Quality
		-- Standard: Phòng tiêu chu?n trong khách s?n
		-- Superior: Phòng có ch?t l??ng cao h?n standard(g?i t?t là SUP)
		-- Deluxe: Phòng có ch?t l??ng khá cao, th??ng n?m ? t?ng cao khách s?n (g?i t?t là DLX)
	Cost		number		not null,
	CONSTRAINT CHK_TYPE CHECK (TypeOfRoom BETWEEN 1 AND 2),
	CONSTRAINT CHK_QUALITY CHECK (Quality IN ('Standard','Superior','Deluxe'))
);
--- khóa chính b?ng Room
ALTER TABLE Room ADD CONSTRAINT PK_ROOM PRIMARY KEY (RoomNo);


/*==============================================================*/
/* Table: Bill							                        */
/*==============================================================*/
Create table Bill(
	BillNo		varchar2(5)		not null,
	CusNo	varchar2(5)	not null,
	RoomNo		varchar2(5)	not null,
	SumOfMoney	number		not null, 
    status      int         not null,
    -- Trang thai hoa don: 
        -- 0: Chua thanh toan
        -- 1: Da thanh toan
    CONSTRAINT CHK_STATUS CHECK (status BETWEEN 0 AND 1)
);
--- Khóa chính b?ng Bill
ALTER TABLE Bill ADD CONSTRAINT PK_Bill PRIMARY KEY(BillNo);


/*==============================================================*/
/* Table: ServiceCalled                                         */
/*==============================================================*/
Create table ServiceCalled(
    billNo  varchar2(5) not null,
	SerNo	varchar2(5) not null,
	RoomNo		varchar2(5)	not null,
	Note		varchar2(2000)
);
--- Khóa chính ServiceCalled
ALTER TABLE ServiceCalled ADD CONSTRAINT PK_ServiceCalled PRIMARY KEY(billNo, SerNo, RoomNo);


/*==============================================================*/
/* Table: Item							*/
/*==============================================================*/
Create table Item(
	ItemNo		varchar2(5) not null,
	ItemName	varchar2(30)	not null,
	NoOfItem	number	not null,
	Status		varchar2(20)	not null,
        -- T?t, h? h?ng, ch?a trang b?
	CONSTRAINT CHK_STATUSItem CHECK(Status IN ('Tốt', 'Hư hỏng', 'Chưa trang bị'))
);
--- Khóa chính b?ng Item
ALTER TABLE Item ADD CONSTRAINT PK_ITEM PRIMARY KEY(ItemNo);


/*==============================================================*/
/* Table: Account                                              */
/*==============================================================*/

CREATE TABLE Account (
    AccountID       NUMBER      not null,
	username		varchar2(20) not null unique,
	Password	varchar2(30) not null,
	Role        varchar2(30) not null	
);
--- Khóa chính Account
ALTER TABLE Account ADD CONSTRAINT PK_Acount PRIMARY KEY(AccountID);


/*==============================================================*/
/* Table: Pay                                              */
/*==============================================================*/

CREATE TABLE Pay (
	BillNo			varchar(5) not null,
	CusNo			varchar(5) not null,
	Method			int not null,
	-- Status:
		-- 1: dùng COD
		-- 2: B?ng cách chuy?n kho?n
	PaymentDate		date not null,
	CONSTRAINT CHK_Method CHECK (Method BETWEEN 1 AND 2)	
);
--- Khóa chính Pay
ALTER TABLE Pay ADD CONSTRAINT PK_Pay PRIMARY KEY(BillNo,CusNo);



-------------------------------------------------------- Khóa ngo?i -------------------------------------------------------- 

ALTER TABLE Assessroom
   ADD CONSTRAINT FK_ASSESSRO_ASSESSROO_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);

ALTER TABLE Assessroom
   ADD CONSTRAINT FK_ASSESSRO_ASSESSROO_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO);


ALTER TABLE Bill
   ADD CONSTRAINT FK_Bill_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO);
      
ALTER TABLE Bill
   ADD CONSTRAINT FK_Bill_Room FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);
      
ALTER TABLE BELONG
   ADD CONSTRAINT FK_Belong_Item FOREIGN KEY (ITEMNO)
      REFERENCES ITEM (ITEMNO);

ALTER TABLE BELONG
   ADD CONSTRAINT FK_Belong_Room FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);

ALTER TABLE Pay
   ADD CONSTRAINT FK_Pay_Pay_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO);


ALTER TABLE Pay
   ADD CONSTRAINT FK_Pay_Pay2_BILL FOREIGN KEY (BILLNO)
      REFERENCES BILL (BILLNO);

ALTER TABLE Position
   ADD CONSTRAINT FK_Position_IS_EMPLOYEE FOREIGN KEY (EMPNO)
      REFERENCES EMPLOYEE (EMPNO);

ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_Bill FOREIGN KEY (BillNo)
      REFERENCES Bill (BillNo);

ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);


ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO);

ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_Bill FOREIGN KEY (billNo)
      REFERENCES Bill (BillNO);

ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_Service FOREIGN KEY (SERNO)
      REFERENCES Service (SERNO);


ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);
      
ALTER TABLE Customer
    ADD CONSTRAINT FK_AccountID_Cus_Acc FOREIGN KEY(AccountID)
        REFERENCES ACCOUNT(AccountID);
        
ALTER TABLE Employee
    ADD CONSTRAINT FK_AccountID_Emp_Acc FOREIGN KEY(AccountID)
        REFERENCES ACCOUNT(AccountID);

/*==============================================================*/
/*      INSERT D? LI?U B?NG Account                             */
/*==============================================================*/
INSERT INTO Account VALUES (101,'trangnhung','trangnhung123','Nhân viên quản lý');

INSERT INTO Account VALUES (1,'vandau','vandau123','Nhân viên');
INSERT INTO Account VALUES (2,'thianh','thianh123','Nhân viên');
INSERT INTO Account VALUES (3,'anhthien','anhthien123','Nhân viên');
INSERT INTO Account VALUES (4,'huyentrang','huyentrang123','Nhân viên');
INSERT INTO Account VALUES (5,'vanthanh','vanthanh123','Nhân viên');
INSERT INTO Account VALUES (6,'hoangphong','hoangphong123','Nhân viên');
INSERT INTO Account VALUES (7,'camtu','camtu123','Nhân viên');
INSERT INTO Account VALUES (8,'thanhlong','thanhlong123','Nhân viên');
INSERT INTO Account VALUES (9,'tuyetha','tuyetha123','Nhân viên');
INSERT INTO Account VALUES (10,'ducduy','ducduy123','Nhân viên');
INSERT INTO Account VALUES (11,'ngocngu','ngocnhu123','Nhân viên');
INSERT INTO Account VALUES (12,'duyanh','duyanh123','Nhân viên');
INSERT INTO Account VALUES (13,'thaoha','thaoha123','Nhân viên');
INSERT INTO Account VALUES (14,'anhthu','anhthu123','Nhân viên');

INSERT INTO Account VALUES(201,'mynhung','mynhung123','Khách hàng');
INSERT INTO Account VALUES(202,'thanhphat','thanhphat123','Khách hàng');
INSERT INTO Account VALUES(203,'thaohong','thaohong123','Khách hàng');
INSERT INTO Account VALUES(204,'tienlinh','tienlinh123','Khách hàng');
INSERT INTO Account VALUES(205,'hoailinh','hoailinh123','Khách hàng');
INSERT INTO Account VALUES(206,'anhkiet','anhkiet123','Khách hàng');
INSERT INTO Account VALUES(207,'phuonglinh','phuonglinh123','Khách hàng');
INSERT INTO Account VALUES(208,'myquyen','myquyen123','Khách hàng');
INSERT INTO Account VALUES(209,'duythien','duythien123','Khách hàng');
INSERT INTO Account VALUES(210,'anhhuy','anhhuy123','Khách hàng');
INSERT INTO Account VALUES(211,'nguyenduy','nguyenduy123','Khách hàng');
INSERT INTO Account VALUES(212,'hobaoan','hobaoan123','Khách hàng');
INSERT INTO Account VALUES(213,'thuyduong','thuyduong123','Khách hàng');
INSERT INTO Account VALUES(214,'tangduc','tangduc123','Khách hàng');
INSERT INTO Account VALUES(215,'ngochien','ngochien123','Khách hàng');


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

/*==============================================================*/
/*      INSERT D? LI?U B?NG ROOM				*/
/*==============================================================*/
INSERT INTO Room VALUES ('R100',1,'Standard',200000);
INSERT INTO Room VALUES ('R101',2,'Standard',450000);
INSERT INTO Room VALUES ('R102',1,'Superior',250000);
INSERT INTO Room VALUES ('R103',2,'Superior',500000);
INSERT INTO Room VALUES ('R104',1,'Deluxe',300000);
INSERT INTO Room VALUES ('R105',2,'Deluxe',550000);
INSERT INTO Room VALUES ('R106',1,'Standard',200000);
INSERT INTO Room VALUES ('R107',1,'Superior',250000);
INSERT INTO Room VALUES ('R108',2,'Deluxe',550000);
INSERT INTO Room VALUES ('R109',2,'Deluxe',550000);
INSERT INTO Room VALUES ('R110',2,'Deluxe',700000);
INSERT INTO Room VALUES ('R111',1,'Superior',550000);
INSERT INTO Room VALUES ('R112',2,'Standard',250000);
INSERT INTO Room VALUES ('R113',1,'Deluxe',600000);
INSERT INTO Room VALUES ('R114',2,'Superior',500000);

/*==============================================================*/
/*      INSERT D? LI?U B?NG Customer                            */
/*==============================================================*/

INSERT INTO Customer VALUES ('C001','Trần Thị Mỹ Nhung',1,'Gia Lai','0343927832','nhung@gmail.com','049573028324',201);
INSERT INTO Customer VALUES ('C002','Nguyễn Thành Phát',0,'Thành phỗ Hồ Chí Minh','0335482738','phat@gmail.com','054928475893',202);
INSERT INTO Customer VALUES ('C003','Nguyễn Thị Thảo Hồng',1,'Quảng Nam','0334586738','hong@gmail.com','035559375847',203);
INSERT INTO Customer VALUES ('C004','Vũ Tiến Linh',0,'Nam Định','0365827407','linh@gmail.com','048529475843',204);
INSERT INTO Customer VALUES ('C005','Nguyễn Hoài Linh',0,'Thành phố Hồ Chí Minh','0224584727','linhnguyen@gmail.com','025847393024',205);
INSERT INTO Customer VALUES ('C006','Nguyễn Anh Kiệt',0,'Đồng Tháp','0326843438','kiet@gmail.com','034465584292',206);
INSERT INTO Customer VALUES ('C007','Vũ Thị Phương Linh',1,'Gia Lai','0234573859','linhvu@gmail.com','042386549373',207);
INSERT INTO Customer VALUES ('C008','Trần Ngọc Mỹ Quyên',1,'Bình Định','0343927832','quyen@gmail.com','026837542965',208);
INSERT INTO Customer VALUES ('C009','Bùi Duy Thiện',0,'Đăk Lăk','0857437233','thien@gmail.com','024937584372',209);
INSERT INTO Customer VALUES ('C010','Trần Anh Huy',0,'Bình Dương','0489274823','huy@gmail.com','044389754618',210);
INSERT INTO Customer VALUES ('C011','Nguyễn Duy',0,'Vũng Tàu','0432985342','duy@gmail.com','042984732647',211);
INSERT INTO Customer VALUES ('C012','Hồ Bảo An',0,'Nha Trang','0396418423','an@gmail.com','038427412345',212);
INSERT INTO Customer VALUES ('C013','Dương Thanh Thủy',1,'Thành phố Hồ Chí Minh','0329642732','thuyduong@gmail.com','0593741842',213);
INSERT INTO Customer VALUES ('C014','Thái Tăng Đức',0,'Quảng Trị','0732406954','duc@gmail.com','049173829432',214);
INSERT INTO Customer VALUES ('C015','Nguyễn Ngọc Hiền',1,'Bến Tre','0493762453','hien@gmail.com','069382741345',215);

/*==============================================================*/
/*      INSERT D? LI?U B?NG BILL				*/
/*==============================================================*/
INSERT INTO Bill VALUES ('B001','C001','R100',1400000,0);
INSERT INTO Bill VALUES ('B002','C002','R101',2000000,0);
INSERT INTO Bill VALUES ('B003','C003','R102',6020000,0);
INSERT INTO Bill VALUES ('B004','C004','R103',520000,0);
INSERT INTO Bill VALUES ('B005','C005','R104',5900000,0);
INSERT INTO Bill VALUES ('B006','C006','R105',5550000,0);
INSERT INTO Bill VALUES ('B007','C007','R105',2100000,0);
INSERT INTO Bill VALUES ('B008','C008','R107',1500000,0);
INSERT INTO Bill VALUES ('B009','C009','R107',300000,0);
INSERT INTO Bill VALUES ('B010','C010','R109',3550000,0);
INSERT INTO Bill VALUES ('B011','C002','R101',450000,0);
INSERT INTO Bill VALUES ('B012','C003','R102',250000,0);
INSERT INTO Bill VALUES ('B013','C004','R103',500000,0);
INSERT INTO Bill VALUES ('B014','C011','R114',1700000,0);
INSERT INTO Bill VALUES ('B015','C012','R110',1200000,0);
INSERT INTO Bill VALUES ('B016','C013','R111',1550000,0);
INSERT INTO Bill VALUES ('B017','C014','R112',750000,0);
INSERT INTO Bill VALUES ('B018','C015','R113',1400000,0);
/*==============================================================*/
/*      INSERT D? LI?U B?NG Service                             */
/*==============================================================*/

INSERT INTO Service VALUES ('S001','Dịch vụ Spa',1,1000000);
INSERT INTO Service VALUES ('S002','Dịch vụ cà phê',1,100000);
INSERT INTO Service VALUES ('S003','Dịch vụ thuê xe',0,500000);
INSERT INTO Service VALUES ('S004','Dịch vụ giặt đồ',1,20000);
INSERT INTO Service VALUES ('S005','Dịch vụ thuê phòng họp',1,5000000);
INSERT INTO Service VALUES ('S006','Dịch vụ thuê phòng karaoke',0,5000000);
INSERT INTO Service VALUES ('S007','Dịch vụ tiệc ngoài trời',0,1000000);
INSERT INTO Service VALUES ('S008','Dịch vụ sân tennis',0,800000);
INSERT INTO Service VALUES ('S009','Dịch vụ phòng gym',1,50000);
INSERT INTO Service VALUES ('S010','Dịch vụ bar trên lầu khách sạn',0,1900000);
INSERT INTO Service VALUES ('S011','Dịch vụ xe đưa đón sân bay',0,1500000);
INSERT INTO Service VALUES ('S012','Dịch vụ cho thuê xe máy tự lái',0,500000);
INSERT INTO Service VALUES ('S013','Dịch vụ phòng 24/24',0,1000000);
INSERT INTO Service VALUES ('S014','Dịch vụ đặt vé máy bay, tour du lịch',0,800000);
INSERT INTO Service VALUES ('S015','Dịch vụ trông trẻ',0,1200000);

/*==============================================================*/
/*      INSERT D? LI?U B?NG ServiceCalled			            */
/*==============================================================*/
INSERT INTO ServiceCalled VALUES('B001','S001','R100','Không cần gì thêm');

INSERT INTO ServiceCalled VALUES('B002','S002','R101','Không cần gì thêm');

INSERT INTO ServiceCalled VALUES('B003','S003','R102','Chỉ lấy 2 chiếc xe đạp');
INSERT INTO ServiceCalled VALUES('B003','S004','R102','Giặt và trả tại phòng');
INSERT INTO ServiceCalled VALUES('B003','S005','R102','Cần phòng rộng, có máy lạnh');

INSERT INTO ServiceCalled VALUES('B004','S004','R103','Kèm là ủi và giao tới phòng trước 14h');

INSERT INTO ServiceCalled VALUES('B005','S005','R104','Cần phòng rộng, có máy lạnh');

INSERT INTO ServiceCalled VALUES('B006','S006','R105','Trang bị sẵn 2 mic, trái cây');
INSERT INTO ServiceCalled VALUES('B006','S007','R105','Kế bên tiệc có hồ bơi');

INSERT INTO ServiceCalled VALUES('B007','S006','R105','Trang bị sẵn 2 mic, trái cây');
INSERT INTO ServiceCalled VALUES('B007','S007','R105','Kế bên tiệc có hồ bơi');

INSERT INTO ServiceCalled VALUES('B008','S008','R107','Cần 2 cây vợt đánh tennis');
INSERT INTO ServiceCalled VALUES('B008','S009','R107','Không cần gì thêm');

INSERT INTO ServiceCalled VALUES('B009','S008','R107','Cần 2 cây vợt đánh tennis');
INSERT INTO ServiceCalled VALUES('B009','S009','R107','Không cần gì thêm');

INSERT INTO ServiceCalled VALUES('B010','S010','R109','Không cần gì thêm');

INSERT INTO ServiceCalled VALUES('B011','S002','R101','Không cần gì thêm');

INSERT INTO ServiceCalled VALUES('B012','S003','R102','Chỉ lấy 2 chiếc xe đạp');
INSERT INTO ServiceCalled VALUES('B012','S004','R102','Giặt và trả tại phòng');
INSERT INTO ServiceCalled VALUES('B012','S005','R102','Cần phòng rộng, có máy lạnh');

INSERT INTO ServiceCalled VALUES('B013','S004','R103','Kèm là ủi và giao tại phòng trước 14h');

INSERT INTO ServiceCalled VALUES('B014','S015','R114','Trông 2 đứa trẻ 3 tuổi');

INSERT INTO ServiceCalled VALUES('B015','S011','R110','Không cần gì thêm');

INSERT INTO ServiceCalled VALUES('B016','S013','R111','Dọn dẹp phòng ');

INSERT INTO ServiceCalled VALUES('B017','S012','R112','2 chiếc xe máy');

INSERT INTO ServiceCalled VALUES('B018','S014','R113','Đặt vé máy bay từ Thành phố Hồ Chí Minh ra Hà Nội');



/*==============================================================*/
/*      INSERT D? LI?U B?NG Item				*/
/*==============================================================*/
INSERT INTO Item VALUES('I001','Bàn là', 1,'Tốt');
INSERT INTO Item VALUES('I002','Khăn tắm', 2,'Chưa trang bị');
INSERT INTO Item VALUES('I003','Mền', 2,'Tốt');
INSERT INTO Item VALUES('I004','Móc quần áo', 5,'Hư hỏng');
INSERT INTO Item VALUES('I005','Bình đun siêu tốc', 1,'Tốt');
INSERT INTO Item VALUES('I006','Quạt đứng', 1,'Chưa trang bị');
INSERT INTO Item VALUES('I007','Tivi', 1,'Tốt');
INSERT INTO Item VALUES('I008','Tủ lạnh', 1,'Hư hỏng');
INSERT INTO Item VALUES('I009','Móc quần áo', 5,'Tốt');
INSERT INTO Item VALUES('I010','Mền', 2,'Chưa trang bị');
INSERT INTO Item VALUES('I011','Đèn', 5,'Tốt');
INSERT INTO Item VALUES('I012','Máy lạnh điều hòa', 2,'Hư hỏng');
INSERT INTO Item VALUES('I013','Gối', 3,'Tốt');
INSERT INTO Item VALUES('I014','Dù che mưa', 6,'Tốt');
INSERT INTO Item VALUES('I015','Vật dùng y tế', 4,'Chưa trang bị');


/*==============================================================*/
/*      INSERT D? LI?U B?NG Reservation                         */
/*==============================================================*/

INSERT INTO Reservation VALUES ('RE001', 'B001','C001','R100',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE002', 'B001','C002','R101',TO_DATE('12/03/2021','dd/mm/yyyy'),TO_DATE('14/03/2021','dd/mm/yyyy'),TO_DATE('16/03/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE003', 'B001','C003','R102',TO_DATE('29/06/2021','dd/mm/yyyy'),TO_DATE('30/06/2021','dd/mm/yyyy'),TO_DATE('02/07/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE004', 'B001','C004','R103',TO_DATE('04/05/2021','dd/mm/yyyy'),TO_DATE('05/05/2021','dd/mm/yyyy'),TO_DATE('06/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE005', 'B001','C005','R104',TO_DATE('03/05/2021','dd/mm/yyyy'),TO_DATE('05/05/2021','dd/mm/yyyy'),TO_DATE('08/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE006', 'B001','C006','R105',TO_DATE('23/04/2021','dd/mm/yyyy'),TO_DATE('24/04/2021','dd/mm/yyyy'),TO_DATE('25/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE007', 'B001','C007','R105',TO_DATE('25/06/2021','dd/mm/yyyy'),TO_DATE('26/06/2021','dd/mm/yyyy'),TO_DATE('28/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE008', 'B001','C008','R107',TO_DATE('21/01/2021','dd/mm/yyyy'),TO_DATE('21/01/2021','dd/mm/yyyy'),TO_DATE('23/01/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE009', 'B001','C009','R107',TO_DATE('22/07/2021','dd/mm/yyyy'),TO_DATE('22/07/2021','dd/mm/yyyy'),TO_DATE('23/07/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE010', 'B001','C010','R109',TO_DATE('08/06/2021','dd/mm/yyyy'),TO_DATE('08/06/2021','dd/mm/yyyy'),TO_DATE('11/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE011', 'B001','C002','R101',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE012', 'B001','C003','R102',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE013', 'B001','C004','R103',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE014', 'B001','C011','R114',TO_DATE('13/05/2021','dd/mm/yyyy'),TO_DATE('16/05/2021','dd/mm/yyyy'),TO_DATE('22/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE015', 'B001','C012','R110',TO_DATE('12/04/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('30/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE016', 'B001','C013','R111',TO_DATE('15/03/2021','dd/mm/yyyy'),TO_DATE('15/04/2021','dd/mm/yyyy'),TO_DATE('17/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE017', 'B001','C014','R112',TO_DATE('15/05/2021','dd/mm/yyyy'),TO_DATE('22/05/2021','dd/mm/yyyy'),TO_DATE('27/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE018', 'B001','C015','R113',TO_DATE('28/06/2021','dd/mm/yyyy'),TO_DATE('12/07/2021','dd/mm/yyyy'),TO_DATE('16/07/2021','dd/mm/yyyy'));

/*==============================================================*/
/*      INSERT D? LI?U B?NG Assessroom                          */
/*==============================================================*/

INSERT INTO Assessroom VALUES (8,'Dịch vụ phục vụ tốt','R100','C001');
INSERT INTO Assessroom VALUES (7.5,'Chất lượng phòng tiện nghi','R101','C002');
INSERT INTO Assessroom VALUES (9,'Việc cung cấp dịch vụ ở mức giá phù hợp với khả năng người tiêu dùng','R102','C003');
INSERT INTO Assessroom VALUES (7,'Phòng cũng bình thường','R103','C004');
INSERT INTO Assessroom VALUES (8,'Chất lượng phòng phù hợp với mức tiền','R104','C005');
INSERT INTO Assessroom VALUES (8.5,'Giá đặt phòng rẻ','R105','C006');
INSERT INTO Assessroom VALUES (8,'Khách sạn có an ninh an toàn','R105','C007');
INSERT INTO Assessroom VALUES (9.5,'Khuôn viên luôn vệ sinh sạch sẻ','R107','C008');
INSERT INTO Assessroom VALUES (10,'Dịch vụ phục vụ tốt, nhân viên nhi?t tình','R107','C009');
INSERT INTO Assessroom VALUES (8,'Khách sạn phục vụ thiết bị tiện nghi','R109','C010');
INSERT INTO Assessroom VALUES (7,'Khách sạn phục vụ bình thường','R114','C011');
INSERT INTO Assessroom VALUES (6,'Chưa đầy đủ tiện nghe','R110','C012');
INSERT INTO Assessroom VALUES (9,'VIew đẹp, vệ sinh sạch sẻ','R111','C013');
INSERT INTO Assessroom VALUES (7.5,'Gía cả ổn','R112','C014');
INSERT INTO Assessroom VALUES (8,'Phục vụ tốt','R113','C015');
/*==============================================================*/
/*      INSERT D? LI?U B?NG Belong                              */
/*==============================================================*/

INSERT INTO Belong VALUES ('I001','R100');
INSERT INTO Belong VALUES ('I002','R101');
INSERT INTO Belong VALUES ('I004','R103');
INSERT INTO Belong VALUES ('I005','R104');
INSERT INTO Belong VALUES ('I006','R105');
INSERT INTO Belong VALUES ('I007','R105');
INSERT INTO Belong VALUES ('I008','R107');
INSERT INTO Belong VALUES ('I009','R107');
INSERT INTO Belong VALUES ('I010','R109');
INSERT INTO Belong VALUES ('I011','R109');
INSERT INTO Belong VALUES ('I012','R111');
INSERT INTO Belong VALUES ('I013','R108');
INSERT INTO Belong VALUES ('I014','R106');
INSERT INTO Belong VALUES ('I015','R114');

/*==============================================================*/
/*      INSERT D? LI?U B?NG Position				            */
/*==============================================================*/

INSERT INTO Position VALUES('P001','Lễ Tân','E001');
INSERT INTO Position VALUES('P002','Phục vụ','E002');
INSERT INTO Position VALUES('P003','Phục vụ','E003'); 
INSERT INTO Position VALUES('P004','Phụ phòng','E004');
INSERT INTO Position VALUES('P005','Vệ sinh','E005');
INSERT INTO Position VALUES('P006','Quản lý','E016');
INSERT INTO Position VALUES('P007','Bảo vệ','E007');  
INSERT INTO Position VALUES('P008','Lễ Tân','E008');
INSERT INTO Position VALUES('P009','Lễ Tân','E009');
INSERT INTO Position VALUES('P010','Lễ Tân','E010');
INSERT INTO Position VALUES('P011','Lễ tân','E011');
INSERT INTO Position VALUES('P012','Bảo vệ','E012');
INSERT INTO Position VALUES('P013','Phục vụ','E013');
INSERT INTO Position VALUES('P014','Vệ sinh','E014');
INSERT INTO Position VALUES('P015','Phụ phòng','E006');

/*==============================================================*/
/*      INSERT D? LI?U B?NG Pay		                            */
/*==============================================================*/

INSERT INTO Pay VALUES ('B001','C001',1,TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B002','C002',2,TO_DATE('15/03/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B003','C003',1,TO_DATE('02/07/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B004','C004',1,TO_DATE('06/05/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B005','C005',2,TO_DATE('08/05/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B006','C006',2,TO_DATE('25/04/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B007','C007',1,TO_DATE('28/06/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B008','C008',2,TO_DATE('23/01/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B009','C009',2,TO_DATE('23/07/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B010','C010',1,TO_DATE('12/06/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B011','C002',2,TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B012','C003',2,TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B013','C004',1,TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B014','C011',1,TO_DATE('22/05/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B015','C012',2,TO_DATE('30/04/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B016','C013',2,TO_DATE('17/04/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B017','C014',1,TO_DATE('27/05/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B018','C015',2,TO_DATE('16/07/2021','dd/mm/yyyy'));
