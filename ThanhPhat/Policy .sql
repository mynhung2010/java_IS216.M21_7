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
/*      INSERT DỮ LIỆU BẢNG Policy				*/
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


