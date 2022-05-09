/*==============================================================*/
/* Table: Room							*/
/*==============================================================*/
Create table Room(
	RoomNo	varchar2(5) not null,
	TypeOfRoom	number 	not null, --1: 1 giường, 2: 2 giường
	Quality		varchar2(10)	not null,
	--- Quality
		-- Standard: Phòng tiêu chuẩn trong khách sạn
		-- Superior: Phòng có chất lượng cao hơn standard(gọi tắt là SUP)
		-- Deluxe: Phòng có chất lượng khá cao, thường nằm ở tầng cao khách sạn (gọi tắt là DLX)
	Cost		number		not null,
	tCheckIn	date	not null,
	tCheckOut	date	not null,
	CONSTRAINT CHK_TYPE CHECK (TypeOfRoom BETWEEN 1 AND 2),
	CONSTRAINT CHK_QUALITY CHECK (Quality IN ('Standard','Superior','Deluxe'))
);
--- khóa chính bảng Room
ALTER TABLE Room ADD CONSTRAINT PK_ROOM PRIMARY KEY (RoomNo);

/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG ROOM				*/
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
