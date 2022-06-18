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

--T?o khóa chính
ALTER TABLE Customer ADD CONSTRAINT PK_Customer PRIMARY KEY (CusNo);

ALTER TABLE Customer
    ADD CONSTRAINT FK_AccountID_Cus_Acc FOREIGN KEY(AccountID)
        REFERENCES ACCOUNT(AccountID);
/*==============================================================*/
/*      INSERT D? LI?U B?NG Customer                            */
/*==============================================================*/

INSERT INTO Customer VALUES ('C001','Trần Thị Mỹ Nhung',1,'Gia Lai','0343927832','nhung@gmail.com','049573028324',201);
INSERT INTO Customer VALUES ('C002','Nguyễn Thành Phát',0,'Thành phỗ Hồ Chí Minh','0335482738','phat@gmail.com','054928475893',202);
INSERT INTO Customer VALUES ('C003','Nguyễn Thị Thảo Hồng',1,'Quảng Nam','0334586738','hong@gmail.com','035559375847',203);
INSERT INTO Customer VALUES ('C004','Vũ Tiến Linh',0,'Nam Định','0365827407','linh@gmail.com','048529475843',204);
INSERT INTO Customer VALUES ('C005','Nguyễn Hoài Linh',0,'Thành phố Hồ Chí Minh','0224584727','linhnguyen@gmail.com','025847393024',205);
INSERT INTO Customer VALUES ('C006','Nguyễn Anh Kiệt',0,'Đồng Tháp','0326843438','kiet@gmail.com','034465584292',206);
INSERT INTO Customer VALUES ('C007','Vũ Thị Phương Linh',1,'Gia Lai','0234573859','linhvu@gmail.com','042386549373',207);
INSERT INTO Customer VALUES ('C008','Trần Ngọc Mỹ Quyên',1,'Bình Định','0343927832','quyen@gmail.com','026837542965',208);
INSERT INTO Customer VALUES ('C009','Bùi Duy Thiện',0,'Đăk Lăk','0857437233','thien@gmail.com','024937584372',209);
INSERT INTO Customer VALUES ('C010','Trần Anh Huy',0,'Bình Dương','0489274823','huy@gmail.com','044389754618',210);
INSERT INTO Customer VALUES ('C011','Nguyễn Duy',0,'Vũng Tàu','0432985342','duy@gmail.com','042984732647',211);
INSERT INTO Customer VALUES ('C012','Hồ Bảo An',0,'Nha Trang','0396418423','an@gmail.com','038427412345',212);
INSERT INTO Customer VALUES ('C013','Dương Thanh Thủy',1,'Thành phố Hồ Chí Minh','0329642732','thuyduong@gmail.com','0593741842',213);
INSERT INTO Customer VALUES ('C014','Thái Tăng Đức',0,'Quảng Trị','0732406954','duc@gmail.com','049173829432',214);
INSERT INTO Customer VALUES ('C015','Nguyễn Ngọc Hiền',1,'Bến Tre','0493762453','hien@gmail.com','069382741345',215);