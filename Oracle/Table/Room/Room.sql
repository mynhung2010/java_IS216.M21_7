
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