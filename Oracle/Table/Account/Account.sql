/*==============================================================*/
/* Table: Account                                              */
/*==============================================================*/

CREATE TABLE Account (
	LoginID		varchar(20) not null,
	Password	varchar(20) not null,
	Status		int not null,
	-- Status:
		-- 1: tài khoản đang hoạt động trong hệ thống
		-- 2: tài khoản đã đăng xuất khỏi hệ thống
	CONSTRAINT CHK_Status01 CHECK (Status BETWEEN 1 AND 2)	
);
--- Khóa chính Account
ALTER TABLE Account ADD CONSTRAINT PK_Acount PRIMARY KEY(LoginID);



/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Account                             */
/*==============================================================*/

INSERT INTO Account VALUES('My Nhung','0343927832N',1);
INSERT INTO Account VALUES('Thanh Phat','0335482738P',1);
INSERT INTO Account VALUES('Thao Hong','0334586738H',1);
INSERT INTO Account VALUES('Tien Linh','0365827407L',1);
INSERT INTO Account VALUES('Hoai Linh','0224584727L',2);
INSERT INTO Account VALUES('Anh Kiet','0326843438K',1);
INSERT INTO Account VALUES('Phuong Linh','0234573859L',1);
INSERT INTO Account VALUES('My Quyen','0343927832Q',2);
INSERT INTO Account VALUES('Duy Thien','0857437233T',2);
INSERT INTO Account VALUES('Anh Duy','0489274823D',2);
