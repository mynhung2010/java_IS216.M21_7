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
--- Khóa chính bảng Bill
ALTER TABLE Bill ADD CONSTRAINT PK_Bill PRIMARY KEY(BillNo);



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
