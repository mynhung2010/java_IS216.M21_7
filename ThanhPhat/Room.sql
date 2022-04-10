/*==============================================================*/
/* Table: Room							*/
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
