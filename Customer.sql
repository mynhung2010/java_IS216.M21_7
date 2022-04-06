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
