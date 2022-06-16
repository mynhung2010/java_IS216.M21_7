--drop table customer;
--drop table account;
--drop table assessroom;
--drop table belong;
--drop table bill;
--drop table employee;
--drop table item;
--drop table pay;
--drop table position;
--drop table reservation;
--drop table room;
--drop table service;
--drop table servicecalled;


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

--T?o kh�a ch�nh
ALTER TABLE Customer ADD CONSTRAINT PK_Customer PRIMARY KEY (CusNo);


/*==============================================================*/
/* Table: Reservation                                           */
/*==============================================================*/
CREATE TABLE Reservation(
	ResNo			varchar2(5)	not null,
	CusNo		varchar2(5)	not null,
	RoomNo 			varchar2(5)		not null,
	ResDate		date	not null,
    tCheckIn	date	not null,
	tCheckOut	date	not null
);
--T?o kh�a ch�nh
ALTER TABLE Reservation ADD CONSTRAINT PK_Reservation PRIMARY KEY (ResNo);



/*==============================================================*/
/* Table: Service                                               */
/*==============================================================*/
CREATE TABLE Service(
	SerNo				varchar2(5)		not null,
	SerName				varchar2(50)	not null,
	TypeOfService		number		not null, --0:Ngo�i tr?i ; 1:Trong nh�
	Cost				number		not null,
	CONSTRAINT CHK_TypeOfService CHECK (TypeOfService BETWEEN 0 AND 1 )
);
--T?o kh�a ch�nh
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

--T?o kh�a ch�nh
ALTER TABLE Assessroom ADD CONSTRAINT PK_Assessroom PRIMARY KEY (RoomNo,CusNo);



/*==============================================================*/
/* Table: Belong                                                */
/*==============================================================*/
CREATE TABLE Belong(
	ItemNo		varchar2(5) not null,
	RoomNo		varchar2(5) not null
);
--T?o kh�a ch�nh
ALTER TABLE Belong ADD CONSTRAINT PK_Belong PRIMARY KEY (ItemNo);



/*==============================================================*/
/* Table: Position                                              */
/*==============================================================*/
CREATE TABLE Position(
	PosNo		varchar2(5)	not null,
	PosName		varchar2(50)	not null,
	EmpNo		varchar2(5) not null
);
--T?o kh�a ch�nh
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
--- Kh�a ch?nh b?ng Employee
ALTER TABLE Employee ADD CONSTRAINT PK_Employee PRIMARY KEY(EmpNo);



/*==============================================================*/
/* Table: Room							                        */
/*==============================================================*/
Create table Room(
	RoomNo	varchar2(5) not null,
	TypeOfRoom	number 	not null, --1: 1 gi??ng, 2: 2 gi??ng
	Quality		varchar2(10)	not null,
	--- Quality
		-- Standard: Ph�ng ti�u chu?n trong kh�ch s?n
		-- Superior: Ph�ng c� ch?t l??ng cao h?n standard(g?i t?t l� SUP)
		-- Deluxe: Ph�ng c� ch?t l??ng kh� cao, th??ng n?m ? t?ng cao kh�ch s?n (g?i t?t l� DLX)
	Cost		number		not null,
	CONSTRAINT CHK_TYPE CHECK (TypeOfRoom BETWEEN 1 AND 2),
	CONSTRAINT CHK_QUALITY CHECK (Quality IN ('Standard','Superior','Deluxe'))
);
--- kh�a ch�nh b?ng Room
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
--- Kh�a ch�nh b?ng Bill
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
--- Kh�a ch�nh ServiceCalled
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
	CONSTRAINT CHK_STATUSItem CHECK(Status IN ('T?t', 'H? h?ng', 'Ch?a trang b?'))
);
--- Kh�a ch�nh b?ng Item
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
--- Kh�a ch�nh Account
ALTER TABLE Account ADD CONSTRAINT PK_Acount PRIMARY KEY(AccountID);


/*==============================================================*/
/* Table: Pay                                              */
/*==============================================================*/

CREATE TABLE Pay (
	BillNo			varchar(5) not null,
	CusNo			varchar(5) not null,
	Method			int not null,
	-- Status:
		-- 1: d�ng COD
		-- 2: B?ng c�ch chuy?n kho?n
	PaymentDate		date not null,
	CONSTRAINT CHK_Method CHECK (Method BETWEEN 1 AND 2)	
);
--- Kh�a ch�nh Pay
ALTER TABLE Pay ADD CONSTRAINT PK_Pay PRIMARY KEY(BillNo,CusNo);



-------------------------------------------------------- Kh�a ngo?i -------------------------------------------------------- 

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
INSERT INTO Account VALUES (101,'trangnhung','trangnhung123','Nh�n vi�n qu?n l�');

INSERT INTO Account VALUES (1,'vandau','vandau123','Nh�n vi�n');
INSERT INTO Account VALUES (2,'thianh','thianh123','Nh�n vi�n');
INSERT INTO Account VALUES (3,'anhthien','anhthien123','Nh�n vi�n');
INSERT INTO Account VALUES (4,'huyentrang','huyentrang123','Nh�n vi�n');
INSERT INTO Account VALUES (5,'vanthanh','vanthanh123','Nh�n vi�n');
INSERT INTO Account VALUES (6,'hoangphong','hoangphong123','Nh�n vi�n');
INSERT INTO Account VALUES (7,'camtu','camtu123','Nh�n vi�n');
INSERT INTO Account VALUES (8,'thanhlong','thanhlong123','Nh�n vi�n');
INSERT INTO Account VALUES (9,'tuyetha','tuyetha123','Nh�n vi�n');
INSERT INTO Account VALUES (10,'ducduy','ducduy123','Nh�n vi�n');
INSERT INTO Account VALUES (11,'ngocngu','ngocnhu123','Nh�n vi�n');
INSERT INTO Account VALUES (12,'duyanh','duyanh123','Nh�n vi�n');
INSERT INTO Account VALUES (13,'thaoha','thaoha123','Nh�n vi�n');
INSERT INTO Account VALUES (14,'anhthu','anhthu123','Nh�n vi�n');

INSERT INTO Account VALUES(201,'mynhung','mynhung123','Kh�ch h�ng');
INSERT INTO Account VALUES(202,'thanhphat','thanhphat123','Kh�ch h�ng');
INSERT INTO Account VALUES(203,'thaohong','thaohong123','Kh�ch h�ng');
INSERT INTO Account VALUES(204,'tienlinh','tienlinh123','Kh�ch h�ng');
INSERT INTO Account VALUES(205,'hoailinh','hoailinh123','Kh�ch h�ng');
INSERT INTO Account VALUES(206,'anhkiet','anhkiet123','Kh�ch h�ng');
INSERT INTO Account VALUES(207,'phuonglinh','phuonglinh123','Kh�ch h�ng');
INSERT INTO Account VALUES(208,'myquyen','myquyen123','Kh�ch h�ng');
INSERT INTO Account VALUES(209,'duythien','duythien123','Kh�ch h�ng');
INSERT INTO Account VALUES(210,'anhhuy','anhhuy123','Kh�ch h�ng');
INSERT INTO Account VALUES(211,'nguyenduy','nguyenduy123','Kh�ch h�ng');
INSERT INTO Account VALUES(212,'hobaoan','hobaoan123','Kh�ch h�ng');
INSERT INTO Account VALUES(213,'thuyduong','thuyduong123','Kh�ch h�ng');
INSERT INTO Account VALUES(214,'tangduc','tangduc123','Kh�ch h�ng');
INSERT INTO Account VALUES(215,'ngochien','ngochien123','Kh�ch h�ng');


/*==============================================================*/
/*      INSERT D? LI?U B?NG EMPLOYEE                            */
/*==============================================================*/
INSERT INTO Employee VALUES ('E016','Ph?m Trang Nhung','0889972871','P006',TO_DATE('26/08/1996','dd/mm/yyyy'),1,TO_DATE('10/12/2017','dd/mm/yyyy'),'nhung@gmail.com',101);

INSERT INTO Employee VALUES ('E001','Nguy?n V?n ??u','0123456789','P001',TO_DATE('26/08/1990','dd/mm/yyyy'),0,TO_DATE('26/10/2012','dd/mm/yyyy'),'dau@gmail.com',1);
INSERT INTO Employee VALUES ('E002','L� Th? Anh','0345678912','P002',TO_DATE('26/07/1998','dd/mm/yyyy'),1,TO_DATE('26/11/2012','dd/mm/yyyy'),'anh@gmail.com',2);
INSERT INTO Employee VALUES ('E003','Nguy?n Anh Thi�n','0135792468','P003',TO_DATE('26/06/1990','dd/mm/yyyy'),0,TO_DATE('26/12/2012','dd/mm/yyyy'),'thien@gmail.com',3);
INSERT INTO Employee VALUES ('E004','L� Th? Huy?n Trang','0246813579','P004',TO_DATE('13/05/1992','dd/mm/yyyy'),1,TO_DATE('10/10/2017','dd/mm/yyyy'),'trang@gmail.com',4);
INSERT INTO Employee VALUES ('E005','Tr?n V?n Thanh','0778899210','P005',TO_DATE('14/06/1995','dd/mm/yyyy'),0,TO_DATE('10/11/2017','dd/mm/yyyy'),'thanh@gmail.com',5);
INSERT INTO Employee VALUES ('E006','B�i Ho�ng Phong','0779898771','P007',TO_DATE('27/08/1997','dd/mm/yyyy'),0,TO_DATE('12/10/2018','dd/mm/yyyy'),'phong@gmail.com',6);
INSERT INTO Employee VALUES ('E007','L� Th? C?m T�','0112233445','P008',TO_DATE('28/08/1998','dd/mm/yyyy'),1,TO_DATE('09/08/2019','dd/mm/yyyy'),'tu@gmail.com',7);
INSERT INTO Employee VALUES ('E008','Nguy?n Th�nh Long','0123456789','P009',TO_DATE('20/08/1999','dd/mm/yyyy'),0,TO_DATE('11/11/2016','dd/mm/yyyy'),'long@gmail.com',8);
INSERT INTO Employee VALUES ('E009','Ho�ng Th? Tuy?t H�','0123456789','P010',TO_DATE('30/08/1999','dd/mm/yyyy'),1,TO_DATE('12/12/2018','dd/mm/yyyy'),'ha@gmail.com',9);
INSERT INTO Employee VALUES ('E010','B�i ??c Duy','0354354353','P011',TO_DATE('21/02/1998','dd/mm/yyyy'),0,TO_DATE('14/04/2019','dd/mm/yyyy'),'duy@gmail.com',10);
INSERT INTO Employee VALUES ('E011','Tr?n Ng?c Nh?','0254837235','P012',TO_DATE('30/08/1997','dd/mm/yyyy'),1,TO_DATE('12/3/2018','dd/mm/yyyy'),'nhu@gmail.com',11);
INSERT INTO Employee VALUES ('E012','Nguy?n Duy Anh','0123456789','P013',TO_DATE('23/07/1989','dd/mm/yyyy'),0,TO_DATE('12/5/2018','dd/mm/yyyy'),'danh@gmail.com',12);
INSERT INTO Employee VALUES ('E013','Nguy?n Th? Th?o H�','0326483923','P014',TO_DATE('12/04/2000','dd/mm/yyyy'),1,TO_DATE('06/03/2018','dd/mm/yyyy'),'tha@gmail.com',13);
INSERT INTO Employee VALUES ('E014','L� Anh Th?','0384249312','P015',TO_DATE('04/08/1999','dd/mm/yyyy'),1,TO_DATE('23/01/2018','dd/mm/yyyy'),'thu@gmail.com',14);

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

INSERT INTO Customer VALUES ('C001','Tr?n Th? M? Nhung',1,'Gia Lai','0343927832','nhung@gmail.com','049573028324',201);
INSERT INTO Customer VALUES ('C002','Nguy?n Th�nh Ph�t',0,'Th�nh ph? H? Ch� Minh','0335482738','phat@gmail.com','054928475893',202);
INSERT INTO Customer VALUES ('C003','Nguy?n Th? Th?o H?ng',1,'Qu?ng Nam','0334586738','hong@gmail.com','035559375847',203);
INSERT INTO Customer VALUES ('C004','Nguy?n Th? Th?o H?ng',0,'Nam ??nh','0365827407','linh@gmail.com','048529475843',204);
INSERT INTO Customer VALUES ('C005','Nguy?n Ho�i Linh',0,'Th�nh ph? H? Ch� Minh','0224584727','linhnguyen@gmail.com','025847393024',205);
INSERT INTO Customer VALUES ('C006','Nguy?n Anh Ki?t',0,'??ng Th�p','0326843438','kiet@gmail.com','034465584292',206);
INSERT INTO Customer VALUES ('C007','V? Th? Ph??ng Linh',1,'Gia Lai','0234573859','linhvu@gmail.com','042386549373',207);
INSERT INTO Customer VALUES ('C008','Tr?n Ng?c M? Quy�n',1,'B�nh ??nh','0343927832','quyen@gmail.com','026837542965',208);
INSERT INTO Customer VALUES ('C009','B�i Duy Thi?n',0,'??k L?k','0857437233','thien@gmail.com','024937584372',209);
INSERT INTO Customer VALUES ('C010','Tr?n Anh Huy',0,'B�nh D??ng','0489274823','huy@gmail.com','044389754618',210);
INSERT INTO Customer VALUES ('C011','Nguy?n Duy',0,'V?ng T�u','0432985342','duy@gmail.com','042984732647',211);
INSERT INTO Customer VALUES ('C012','H? B?o An',0,'Nha Trang','0396418423','an@gmail.com','038427412345',212);
INSERT INTO Customer VALUES ('C013','D??ng Thanh Th?y',1,'Th�nh ph? H? Ch� Minh','0329642732','thuyduong@gmail.com','0593741842',213);
INSERT INTO Customer VALUES ('C014','Th�i T?ng ??c',0,'Qu?ng Tr?','0732406954','duc@gmail.com','049173829432',214);
INSERT INTO Customer VALUES ('C015','Nguy?n Ng?c Hi?n',1,'B?n Tre','0493762453','hien@gmail.com','069382741345',215);

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
INSERT INTO Service VALUES ('S011','D?ch v? xe ??a ?�n s�n bay',0,1500000);
INSERT INTO Service VALUES ('S012','D?ch v? cho thu� xe m�y t? l�i',0,500000);
INSERT INTO Service VALUES ('S013','D?ch v? ph�ng 24/24',0,1000000);
INSERT INTO Service VALUES ('S014','D?ch v? ??t v� m�y bay, tour du l?ch',0,800000);
INSERT INTO Service VALUES ('S015','D?ch v? tr�ng tr?',0,1200000);

/*==============================================================*/
/*      INSERT D? LI?U B?NG ServiceCalled			            */
/*==============================================================*/
INSERT INTO ServiceCalled VALUES('B001','S001','R100','Kh�ng c?n g� th�m');

INSERT INTO ServiceCalled VALUES('B002','S002','R101','Kh�ng c?n g� th�m');

INSERT INTO ServiceCalled VALUES('B003','S003','R102','Ch? l?y 2 chi?c xe ??p');
INSERT INTO ServiceCalled VALUES('B003','S004','R102','Gi?t v� tr? t?i ph�ng');
INSERT INTO ServiceCalled VALUES('B003','S005','R102','C?n ph�ng r?ng, c� m�y l?nh');

INSERT INTO ServiceCalled VALUES('B004','S004','R103','K�m l� ?? v� giao t?i ph�ng tr??c 14h');

INSERT INTO ServiceCalled VALUES('B005','S005','R104','C?n ph�ng r?ng, c� m�y l?nh');

INSERT INTO ServiceCalled VALUES('B006','S006','R105','Trang b? s?n 2 mic, tr�i c�y');
INSERT INTO ServiceCalled VALUES('B006','S007','R105','K? b�n ti?c c� h? b?i');

INSERT INTO ServiceCalled VALUES('B007','S006','R105','Trang b? s?n 2 mic, tr�i c�y');
INSERT INTO ServiceCalled VALUES('B007','S007','R105','K? b�n ti?c c� h? b?i');

INSERT INTO ServiceCalled VALUES('B008','S008','R107','C?n 2 c�y v?t ?�nh tennis');
INSERT INTO ServiceCalled VALUES('B008','S009','R107','Kh�ng c?n g� th�m');

INSERT INTO ServiceCalled VALUES('B009','S008','R107','C?n 2 c�y v?t ?�nh tennis');
INSERT INTO ServiceCalled VALUES('B009','S009','R107','Kh�ng c?n g� th�m');

INSERT INTO ServiceCalled VALUES('B010','S010','R109','Kh�ng c?n g� th�m');

INSERT INTO ServiceCalled VALUES('B011','S002','R101','Kh�ng c?n g� th�m');

INSERT INTO ServiceCalled VALUES('B012','S003','R102','Ch? l?y 2 chi?c xe ??p');
INSERT INTO ServiceCalled VALUES('B012','S004','R102','Gi?t v� tr? t?i ph�ng');
INSERT INTO ServiceCalled VALUES('B012','S005','R102','C?n ph�ng r?ng, c� m�y l?nh');

INSERT INTO ServiceCalled VALUES('B013','S004','R103','K�m l� ?? v� giao t?i ph�ng tr??c 14h');

INSERT INTO ServiceCalled VALUES('B014','S015','R114','Tr�ng 2 ??a tr? 3 tu?i');

INSERT INTO ServiceCalled VALUES('B015','S011','R110','Kh�ng c?n g� th�m');

INSERT INTO ServiceCalled VALUES('B016','S013','R111','D?n d?p ph�ng ');

INSERT INTO ServiceCalled VALUES('B017','S012','R112','2 chi?c xe m�y');

INSERT INTO ServiceCalled VALUES('B018','S014','R113','??t v� m�y bay t? Th�nh ph? H? Ch� Minh ra H� N?i');



/*==============================================================*/
/*      INSERT D? LI?U B?NG Item				*/
/*==============================================================*/
INSERT INTO Item VALUES('I001','B�n l�', 1,'T?t');
INSERT INTO Item VALUES('I002','Kh?n t?m', 2,'Ch?a trang b?');
INSERT INTO Item VALUES('I003','M?n', 2,'T?t');
INSERT INTO Item VALUES('I004','M�c qu?n �o', 5,'H? h?ng');
INSERT INTO Item VALUES('I005','B�nh ?un si�u t?c', 1,'T?t');
INSERT INTO Item VALUES('I006','Qu?t ??ng', 1,'Ch?a trang b?');
INSERT INTO Item VALUES('I007','Tivi', 1,'T?t');
INSERT INTO Item VALUES('I008','T? l?nh', 1,'H? h?ng');
INSERT INTO Item VALUES('I009','M�c qu?n �o', 5,'T?t');
INSERT INTO Item VALUES('I010','M?n', 2,'Ch?a trang b?');
INSERT INTO Item VALUES('I011','?�n', 5,'T?t');
INSERT INTO Item VALUES('I012','M�y l?nh ?i?u h�a', 2,'H? h?ng');
INSERT INTO Item VALUES('I013','G?i', 3,'T?t');
INSERT INTO Item VALUES('I014','D� che m?a', 6,'T?t');
INSERT INTO Item VALUES('I015','V?t d?ng y t?', 4,'Ch?a trang b?');


/*==============================================================*/
/*      INSERT D? LI?U B?NG Reservation                         */
/*==============================================================*/

INSERT INTO Reservation VALUES ('RE001','C001','R100',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE002','C002','R101',TO_DATE('12/03/2021','dd/mm/yyyy'),TO_DATE('14/03/2021','dd/mm/yyyy'),TO_DATE('16/03/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE003','C003','R102',TO_DATE('29/06/2021','dd/mm/yyyy'),TO_DATE('30/06/2021','dd/mm/yyyy'),TO_DATE('02/07/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE004','C004','R103',TO_DATE('04/05/2021','dd/mm/yyyy'),TO_DATE('05/05/2021','dd/mm/yyyy'),TO_DATE('06/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE005','C005','R104',TO_DATE('03/05/2021','dd/mm/yyyy'),TO_DATE('05/05/2021','dd/mm/yyyy'),TO_DATE('08/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE006','C006','R105',TO_DATE('23/04/2021','dd/mm/yyyy'),TO_DATE('24/04/2021','dd/mm/yyyy'),TO_DATE('25/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE007','C007','R105',TO_DATE('25/06/2021','dd/mm/yyyy'),TO_DATE('26/06/2021','dd/mm/yyyy'),TO_DATE('28/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE008','C008','R107',TO_DATE('21/01/2021','dd/mm/yyyy'),TO_DATE('21/01/2021','dd/mm/yyyy'),TO_DATE('23/01/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE009','C009','R107',TO_DATE('22/07/2021','dd/mm/yyyy'),TO_DATE('22/07/2021','dd/mm/yyyy'),TO_DATE('23/07/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE010','C010','R109',TO_DATE('08/06/2021','dd/mm/yyyy'),TO_DATE('08/06/2021','dd/mm/yyyy'),TO_DATE('11/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE011','C002','R101',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE012','C003','R102',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE013','C004','R103',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE014','C011','R114',TO_DATE('13/05/2021','dd/mm/yyyy'),TO_DATE('16/05/2021','dd/mm/yyyy'),TO_DATE('22/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE015','C012','R110',TO_DATE('12/04/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('30/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE016','C013','R111',TO_DATE('15/03/2021','dd/mm/yyyy'),TO_DATE('15/04/2021','dd/mm/yyyy'),TO_DATE('17/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE017','C014','R112',TO_DATE('15/05/2021','dd/mm/yyyy'),TO_DATE('22/05/2021','dd/mm/yyyy'),TO_DATE('27/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE018','C015','R113',TO_DATE('28/06/2021','dd/mm/yyyy'),TO_DATE('12/07/2021','dd/mm/yyyy'),TO_DATE('16/07/2021','dd/mm/yyyy'));

/*==============================================================*/
/*      INSERT D? LI?U B?NG Assessroom                          */
/*==============================================================*/

INSERT INTO Assessroom VALUES (8,'D?ch v? ph?c v? t?t','R100','C001');
INSERT INTO Assessroom VALUES (7.5,'Ch?t l??ng ph�ng ti?n nghi','R101','C002');
INSERT INTO Assessroom VALUES (9,'Vi?c cung c?p d?ch v? ? m?c gi� ph� h?p v?i kh? n?ng ng??i ti�u d�ng','R102','C003');
INSERT INTO Assessroom VALUES (7,'Ph�ng c?ng b�nh th??ng','R103','C004');
INSERT INTO Assessroom VALUES (8,'Ch?t l??ng ph�ng ph� h?p v?i m?c ti?n','R104','C005');
INSERT INTO Assessroom VALUES (8.5,'Gi� ??t ph�ng r?','R105','C006');
INSERT INTO Assessroom VALUES (8,'Kh�ch s?n c� an ninh an to�n','R105','C007');
INSERT INTO Assessroom VALUES (9.5,'Khu�n vi�n lu�n v? sinh s?ch s?','R107','C008');
INSERT INTO Assessroom VALUES (10,'D?ch v? ph?c v? t?t, nh�n vi�n nhi?t t�nh','R107','C009');
INSERT INTO Assessroom VALUES (8,'Kh�ch s?n ph?c v? thi?t b? ti?n nghi','R109','C010');
INSERT INTO Assessroom VALUES (7,'Kh�ch s?n ph?c v? b�nh th??ng','R114','C011');
INSERT INTO Assessroom VALUES (6,'Ch?a ??y ?? ti?n nghe','R110','C012');
INSERT INTO Assessroom VALUES (9,'VIew ??p, v? sinh s?ch s?','R111','C013');
INSERT INTO Assessroom VALUES (7.5,'G�a c? ?n','R112','C014');
INSERT INTO Assessroom VALUES (8,'Ph?c v? t?t','R113','C015');
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

INSERT INTO Position VALUES('P001','L? T�n','E001');
INSERT INTO Position VALUES('P002','Ph?c v?','E002');
INSERT INTO Position VALUES('P003','Ph?c v?','E003'); 
INSERT INTO Position VALUES('P004','Ph? ph�ng','E004');
INSERT INTO Position VALUES('P005','V? sinh','E005');
INSERT INTO Position VALUES('P006','Qu?n l�','E016');
INSERT INTO Position VALUES('P007','B?o v?','E007');  
INSERT INTO Position VALUES('P008','L? T�n','E008');
INSERT INTO Position VALUES('P009','L? T�n','E009');
INSERT INTO Position VALUES('P010','L? T�n','E010');
INSERT INTO Position VALUES('P011','L? t�n','E011');
INSERT INTO Position VALUES('P012','B?o v?','E012');
INSERT INTO Position VALUES('P013','Ph?c v?','E013');
INSERT INTO Position VALUES('P014','V? sinh','E014');
INSERT INTO Position VALUES('P015','Ph? ph�ng','E006');

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
