/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
CREATE TABLE Customer(
	CusNo	varchar2(5)	not null,
	CusName	varchar2(50)	not null,
	Gender			int not null,     -- 0:Nam; 1:Nữ
	Address		varchar2(100)not null,
	Phone		varchar2(10) not null,
	Email		varchar2(50)	not null,
	ID			varchar2(12)	not null    --CMND/CCCD
);
--Tạo khóa chính
ALTER TABLE Customer ADD CONSTRAINT PK_Customer PRIMARY KEY (CusNo)
GO
/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Customer                            */
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
