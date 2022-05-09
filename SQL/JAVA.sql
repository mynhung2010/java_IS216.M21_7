------------------------------------------------------------ CÁC B?NG VÀ THU?C TÍNH ------------------------------------------------------------ 
/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
CREATE TABLE Customer(
	CusNo	varchar2(5)	not null,
	CusName	varchar2(50)	not null,
	Gender			int not null,     -- 0:Nam; 1:N?
	Address		varchar2(100)not null,
	Phone		varchar2(10) not null,
	Email		varchar2(50)	not null,
	ID			varchar2(12)	not null    --CMND/CCCD
);
--T?o khóa chính
ALTER TABLE Customer ADD CONSTRAINT PK_Customer PRIMARY KEY (CusNo);



/*==============================================================*/
/* Table: Reservation                                           */
/*==============================================================*/
CREATE TABLE Reservation(
	ResNo			varchar2(5)	not null,
	CusNo		varchar2(5)	not null,
	RoomNo 			varchar2(5)		not null,
	ResDate		date	not null
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
	Email		varchar2(30)	not null,
	CONSTRAINT CHK_Gender CHECK (GENDER BETWEEN 0 AND 1)
);
--- Khóa ch?nh b?ng Employee
ALTER TABLE Employee ADD CONSTRAINT PK_Employee PRIMARY KEY(EmpNo);



/*==============================================================*/
/* Table: Room							*/
/*==============================================================*/
Create table Room(
	RoomNo	varchar2(5) not null,
	TypeOfRoom	number 	not null, --1: 1 giý?ng, 2: 2 giý?ng
	Quality		varchar2(10)	not null,
	--- Quality
		-- Standard: Ph?ng tiêu chu?n trong khách s?n
		-- Superior: Ph?ng có ch?t lý?ng cao hõn standard(g?i t?t là SUP)
		-- Deluxe: Ph?ng có ch?t lý?ng khá cao, thý?ng n?m ? t?ng cao khách s?n (g?i t?t là DLX)
	Cost		number		not null,
	tCheckIn	date	not null,
	tCheckOut	date	not null,
	CONSTRAINT CHK_TYPE CHECK (TypeOfRoom BETWEEN 1 AND 2),
	CONSTRAINT CHK_QUALITY CHECK (Quality IN ('Standard','Superior','Deluxe'))
);
--- khóa chính b?ng Room
ALTER TABLE Room ADD CONSTRAINT PK_ROOM PRIMARY KEY (RoomNo);


/*==============================================================*/
/* Table: Bill							*/
/*==============================================================*/
Create table Bill(
	BillNo		varchar2(5)		not null,
	CusNo	varchar2(5)	not null,
	SerNo	varchar2(5)		not null,
	RoomNo		varchar2(5)	not null,
	SumOfMoney	number		not null,
	PolNo	varchar2(5)	not null
);
--- Khóa chính b?ng Bill
ALTER TABLE Bill ADD CONSTRAINT PK_Bill PRIMARY KEY(BillNo);


/*==============================================================*/
/* Table: ServiceCalled                                         */
/*==============================================================*/
Create table ServiceCalled(
	SerNo	varchar2(5) not null,
	RoomNo		varchar2(5)	not null,
	Note		varchar2(2000)
);
--- Khóa chính ServiceCalled
ALTER TABLE ServiceCalled ADD CONSTRAINT PK_ServiceCalled PRIMARY KEY(SerNo, RoomNo);


/*==============================================================*/
/* Table: Item							*/
/*==============================================================*/
Create table Item(
	ItemNo		varchar2(5) not null,
	ItemName	varchar2(30)	not null,
	NoOfItem	number	not null,
	Status		varchar2(20)	not null,-- T?t, hý h?ng, chýa trang b?
	CONSTRAINT CHK_STATUS CHECK(Status IN ('Tot', 'Hu hong', 'Chua trang bi'))
);
--- Khóa chính b?ng Item
ALTER TABLE Item ADD CONSTRAINT PK_ITEM PRIMARY KEY(ItemNo);


/*==============================================================*/
/* Table: Policy						*/
/*==============================================================*/
Create table Policy(
	PolNo	varchar2(5)	not null,
	PolName	varchar2(50)	not null,
	Requirement	number	not null,
	-- Requirement:
		-- 1: Th?i gian ?
		-- 2: Ngày l?
		-- 3: S? d?ng d?ch v? 
	tApplication	int	not null,
	StartDate	date	not null,
	CONSTRAINT CHK_Requirement CHECK (Requirement BETWEEN 1 AND 3)
);
ALTER TABLE Policy ADD CONSTRAINT PK_Policy PRIMARY KEY(PolNo);

/*==============================================================*/
/* Table: Account                                              */
/*==============================================================*/

CREATE TABLE Account (
	LoginID		varchar(20) not null,
	Password	varchar(20) not null,
	Status		int not null,
	-- Status:
		-- 1: tài kho?n ðang ho?t ð?ng trong h? th?ng
		-- 2: tài kho?n ð? ðãng xu?t kh?i h? th?ng
	CONSTRAINT CHK_Status01 CHECK (Status BETWEEN 1 AND 2)	
);
--- Khóa chính Account
ALTER TABLE Account ADD CONSTRAINT PK_Acount PRIMARY KEY(LoginID);


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
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);


ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO);


ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_Service FOREIGN KEY (SERNO)
      REFERENCES Service (SERNO);


ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);


/*==============================================================*/
/*      INSERT D? LI?U B?NG EMPLOYEE                            */
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

/*==============================================================*/
/*      INSERT D? LI?U B?NG ROOM				*/
/*==============================================================*/
INSERT INTO Room VALUES ('R100',1,'Standard',200000,TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Room VALUES ('R101',2,'Standard',450000,TO_DATE('14/03/2021','dd/mm/yyyy'),TO_DATE('16/3/2021','dd/mm/yyyy'));
INSERT INTO Room VALUES ('R102',1,'Superior',250000,TO_DATE('30/06/2021','dd/mm/yyyy'),TO_DATE('02/07/2021','dd/mm/yyyy'));
INSERT INTO Room VALUES ('R103',2,'Superior',500000,TO_DATE('05/05/2021','dd/mm/yyyy'),TO_DATE('06/05/2021','dd/mm/yyyy'));
INSERT INTO Room VALUES ('R104',1,'Deluxe',300000,TO_DATE('05/05/2021','dd/mm/yyyy'),TO_DATE('08/05/2021','dd/mm/yyyy'));
INSERT INTO Room VALUES ('R105',2,'Deluxe',550000,TO_DATE('24/04/2021','dd/mm/yyyy'),TO_DATE('25/04/2021','dd/mm/yyyy'));
INSERT INTO Room VALUES ('R106',1,'Standard',200000,TO_DATE('26/06/2021','dd/mm/yyyy'),TO_DATE('28/06/2021','dd/mm/yyyy'));
INSERT INTO Room VALUES ('R107',1,'Superior',250000,TO_DATE('21/01/2021','dd/mm/yyyy'),TO_DATE('23/01/2021','dd/mm/yyyy'));
INSERT INTO Room VALUES ('R108',2,'Deluxe',550000,TO_DATE('22/07/2021','dd/mm/yyyy'),TO_DATE('23/07/2021','dd/mm/yyyy'));
INSERT INTO Room VALUES ('R109',2,'Deluxe',550000,TO_DATE('08/06/2021','dd/mm/yyyy'),TO_DATE('11/06/2021','dd/mm/yyyy'));

/*==============================================================*/
/*      INSERT D? LI?U B?NG BILL				*/
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
/*      INSERT D? LI?U B?NG Service                             */
/*==============================================================*/

INSERT INTO Service VALUES ('S001','Dich vu Spa',1,1000000);
INSERT INTO Service VALUES ('S002','Dich vu ca phe',1,100000);
INSERT INTO Service VALUES ('S003','Dich vu thue xe',0,500000);
INSERT INTO Service VALUES ('S004','Dich vu giat do',1,20000);
INSERT INTO Service VALUES ('S005','Dich vu thue phong hop',1,5000000);
INSERT INTO Service VALUES ('S006','Dich vu thue phong karaoke',0,5000000);
INSERT INTO Service VALUES ('S007','Dich vu tiec ngoai troi',0,1000000);
INSERT INTO Service VALUES ('S008','Dich vu san tennis',0,800000);
INSERT INTO Service VALUES ('S009','Dich vu phong gym',1,50000);
INSERT INTO Service VALUES ('S010','Dich vu bar tren lau khach san',0,1900000);

/*==============================================================*/
/*      INSERT D? LI?U B?NG ServiceCalled			*/
/*==============================================================*/
INSERT INTO ServiceCalled VALUES('S001','R100','Khong can gi them');
INSERT INTO ServiceCalled VALUES('S002','R101','Khong can gi them');
INSERT INTO ServiceCalled VALUES('S003','R102','Chi lay 2 chiec xe dap');
INSERT INTO ServiceCalled VALUES('S004','R103','Giac xong giao tra tan phong');
INSERT INTO ServiceCalled VALUES('S005','R104','Can phong rong, co may lanh');
INSERT INTO ServiceCalled VALUES('S006','R105','Trang bi san 2 mic, dia trai cay');
INSERT INTO ServiceCalled VALUES('S007','R106','Ke ben tiec co ho boi');
INSERT INTO ServiceCalled VALUES('S008','R107','Can 2 cay vot danh tennis');
INSERT INTO ServiceCalled VALUES('S009','R108','Khong can gi them');
INSERT INTO ServiceCalled VALUES('S010','R109','Khong can gi them');

/*==============================================================*/
/*      INSERT D? LI?U B?NG Item				*/
/*==============================================================*/
INSERT INTO Item VALUES('I001','Ban la', 1,'Tot');
INSERT INTO Item VALUES('I002','Khan tam', 2,'Chua trang bi');
INSERT INTO Item VALUES('I003','Men', 2,'Tot');
INSERT INTO Item VALUES('I004','Moc quan ao', 5,'Hu hong');
INSERT INTO Item VALUES('I005','Binh dun sieu toc', 1,'Tot');
INSERT INTO Item VALUES('I006','Quat dung', 1,'Chua trang bi');
INSERT INTO Item VALUES('I007','Tivi', 1,'Tot');
INSERT INTO Item VALUES('I008','Tu lanh', 1,'Hu hong');
INSERT INTO Item VALUES('I009','Moc quan ao', 5,'Tot');
INSERT INTO Item VALUES('I010','Men', 2,'Chua trang bi');

/*==============================================================*/
/*      INSERT D? LI?U B?NG Policy				*/
/*==============================================================*/
INSERT INTO Policy VALUES('POL01','O cang nhieu khuyen mai cang cao',1,3,TO_DATE('23/06/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL02','Vui choi le tai khach san',2,1,TO_DATE('14/03/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL03','Xai dich vu xai khuyen mai',3,2,TO_DATE('01/07/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL04','Xai dich vu xai khuyen mai',3,2,TO_DATE('06/05/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL05','Vui choi le tai khach san',3,2,TO_DATE('08/05/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL06','Ngay le lao dong',2,1,TO_DATE('30/04/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL07','Vui choi le tai khach san',2,1,TO_DATE('28/06/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL08','O cang lau khuyen mai cang nhieu',1,3,TO_DATE('23/01/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL09','O cang lau khuyen mai cang nhieu',1,3,TO_DATE('25/07/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL10','Vui choi le',2,1,TO_DATE('01/06/2021','dd/mm/yyyy'));

/*==============================================================*/
/*      INSERT D? LI?U B?NG Customer                            */
/*==============================================================*/

INSERT INTO Customer VALUES ('C001','Tran Thi My Nhung',1,'Gia Lai','0343927832','nhung@gmail.com','049573028324');
INSERT INTO Customer VALUES ('C002','Nguyen Thanh Phat',0,'Thanh pho Ho Chi Minh','0335482738','phat@gmail.com','054928475893');
INSERT INTO Customer VALUES ('C003','Nguyen Thi Thao Hong',1,'Quang Nam','0334586738','hong@gmail.com','035559375847');
INSERT INTO Customer VALUES ('C004','Vu Tien Linh',0,'Nam Dinh','0365827407','linh@gmail.com','048529475843');
INSERT INTO Customer VALUES ('C005','Nguyen Hoai Linh',0,'Thanh pho Ho Chi Minh','0224584727','linh@gmail.com','025847393024');
INSERT INTO Customer VALUES ('C006','Nguyen Anh Kiet',0,'Dong Thap','0326843438','kiet@gmail.com','034465584292');
INSERT INTO Customer VALUES ('C007','Vu Thi Phuong Linh',1,'Gia Lai','0234573859','linhvu@gmail.com','042386549373');
INSERT INTO Customer VALUES ('C008','Tran Ngoc My Quyen',1,'Binh Dinh','0343927832','quyen@gmail.com','026837542965');
INSERT INTO Customer VALUES ('C009','Bui Duy Thien',0,'Dak Lak','0857437233','thien@gmail.com','024937584372');
INSERT INTO Customer VALUES ('C010','Tran Anh Huy',0,'Binh Duong','0489274823','huy@gmail.com','044389754618');

/*==============================================================*/
/*      INSERT D? LI?U B?NG Reservation                         */
/*==============================================================*/

INSERT INTO Reservation VALUES ('RE001','C001','R100',TO_DATE('23/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE002','C003','R101',TO_DATE('12/03/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE003','C002','R102',TO_DATE('29/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE004','C006','R103',TO_DATE('04/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE005','C009','R104',TO_DATE('03/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE006','C010','R105',TO_DATE('23/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE007','C004','R106',TO_DATE('25/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE008','C005','R107',TO_DATE('21/01/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE009','C007','R108',TO_DATE('22/07/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE010','C008','R109',TO_DATE('08/06/2021','dd/mm/yyyy'));

/*==============================================================*/
/*      INSERT D? LI?U B?NG Assessroom                          */
/*==============================================================*/

INSERT INTO Assessroom VALUES ('8','Dich vu phuc vu tot','R100','C001');
INSERT INTO Assessroom VALUES (7.5,'Chat luong phong tien nghi','R101','C002');
INSERT INTO Assessroom VALUES ('9','Viec cung cap dich vu o muc gia phu hop voi kha nang nguoi tieu dung','R102','C003');
INSERT INTO Assessroom VALUES ('7','Phong cung binh thuong','R103','C004');
INSERT INTO Assessroom VALUES ('8','Chat luong phong phu hop voi muc tien','R104','C005');
INSERT INTO Assessroom VALUES (8.5,'Gia dat phong re','R105','C006');
INSERT INTO Assessroom VALUES ('8','Khach san co an ninh an toan','R106','C007');
INSERT INTO Assessroom VALUES (9.5,'Khung vien luon ve sinh sach se','R107','C008');
INSERT INTO Assessroom VALUES ('10','Dich vu phuc vu tot, nhan vien nhiet tinh','R108','C009');
INSERT INTO Assessroom VALUES ('8','Khach san phuc vu thiet bi tien nghi','R109','C010');

/*==============================================================*/
/*      INSERT D? LI?U B?NG Belong                              */
/*==============================================================*/

INSERT INTO Belong VALUES ('I001','R100');
INSERT INTO Belong VALUES ('I002','R101');
INSERT INTO Belong VALUES ('I003','R102');
INSERT INTO Belong VALUES ('I004','R103');
INSERT INTO Belong VALUES ('I005','R104');
INSERT INTO Belong VALUES ('I006','R105');
INSERT INTO Belong VALUES ('I007','R106');
INSERT INTO Belong VALUES ('I008','R107');
INSERT INTO Belong VALUES ('I009','R108');
INSERT INTO Belong VALUES ('I010','R109');

/*==============================================================*/
/*      INSERT D? LI?U B?NG Position				*/
/*==============================================================*/

INSERT INTO Position VALUES('P001','Le Tan','E001');
INSERT INTO Position VALUES('P002','Phuc vu','E002');
INSERT INTO Position VALUES('P003','Phuc vu','E003'); 
INSERT INTO Position VALUES('P004','Phu phong','E004');
INSERT INTO Position VALUES('P005','Ve sinh','E005');
INSERT INTO Position VALUES('P006','Quan ly','E006');
INSERT INTO Position VALUES('P007','Bao ve','E007');  
INSERT INTO Position VALUES('P008','Le Tan','E008');
INSERT INTO Position VALUES('P009','Le Tan','E009');
INSERT INTO Position VALUES('P010','Le Tan','E010');

/*==============================================================*/
/*      INSERT D? LI?U B?NG Account                             */
/*==============================================================*/

INSERT INTO Account VALUES('My Nhung','0343927832N',1);
INSERT INTO Account VALUES('Thanh Phat','0335482738P',1);
INSERT INTO Account VALUES('Thao Hong','0334586738H',1);
INSERT INTO Account VALUES('Tien Linh','0365827407L',1);
INSERT INTO Account VALUES('Hoai Linh','0224584727L',2);
INSERT INTO Account VALUES('Anh Kiet','0326843438K',1);
INSERT INTO Account VALUES('Phuong Linh','0234573859L',1);
INSERT INTO Account VALUES('My Quyen','0343927832Q',2);
INSERT INTO Account VALUES('Duy Thien','0857437233T',2);
INSERT INTO Account VALUES('Anh Duy','0489274823D',2);

/*==============================================================*/
/*      INSERT D? LI?U B?NG Pay		                            */
/*==============================================================*/



INSERT INTO Pay VALUES ('B001','C001',1,TO_DATE('22/2/2022','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B002','C002',2,TO_DATE('03/3/2022','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B003','C003',1,TO_DATE('23/12/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B004','C004',1,TO_DATE('06/3/2022','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B005','C005',2,TO_DATE('28/2/2022','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B006','C006',2,TO_DATE('13/12/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B007','C007',1,TO_DATE('20/11/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B008','C008',2,TO_DATE('09/10/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B009','C009',2,TO_DATE('26/3/2022','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B010','C010',1,TO_DATE('17/1/2022','dd/mm/yyyy'));
