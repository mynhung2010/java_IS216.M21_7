/*==============================================================*/
/* Table: ServiceCalled                                         */
/*==============================================================*/
Create table ServiceCalled(
	SerNo	varchar2(5) not null,
	RoomNo		varchar2(5)	not null,
	Note		varchar2(2000)
);
--- Khóa chính ServiceCalled
ALTER TABLE ServiceCalled ADD CONSTRAINT PK_ServiceCalled PRIMARY KEY(SerNo, RoomNo);

/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG ServiceCalled			*/
/*==============================================================*/
INSERT INTO ServiceCalled VALUES('S001','R100','Khong can gi them');
INSERT INTO ServiceCalled VALUES('S002','R101','Khong can gi them');
INSERT INTO ServiceCalled VALUES('S003','R102','Chi lay 2 chiec xe dap');
INSERT INTO ServiceCalled VALUES('S004','R103','Giac xong giao tra tan phong');
INSERT INTO ServiceCalled VALUES('S005','R104','Can phong rong, co may lanh');
INSERT INTO ServiceCalled VALUES('S006','R105','Trang bi san 2 mic, dia trai cay');
INSERT INTO ServiceCalled VALUES('S007','R106','Ke ben tiec co ho boi');
INSERT INTO ServiceCalled VALUES('S008','R107','Can 2 cay vot danh tennis');
INSERT INTO ServiceCalled VALUES('S009','R108','Khong can gi them');
INSERT INTO ServiceCalled VALUES('S010','R109','Khong can gi them');
