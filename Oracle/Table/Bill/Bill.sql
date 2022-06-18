
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


ALTER TABLE Bill
   ADD CONSTRAINT FK_Bill_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO);
      
ALTER TABLE Bill
   ADD CONSTRAINT FK_Bill_Room FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);
 
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