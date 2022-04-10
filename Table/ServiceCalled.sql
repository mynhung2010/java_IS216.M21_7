/*==============================================================*/
/* Table: ServiceCalled                                         */
/*==============================================================*/
Create table ServiceCalled(
	SerNo	varchar(5) not null,
	RoomNo		varchar(5)	not null,
	Note		nvarchar(2000)
);
--- Khóa chính ServiceCalled
ALTER TABLE ServiceCalled ADD CONSTRAINT PK_ServiceCalled PRIMARY KEY(SerNo, RoomNo);

/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG ServiceCalled			                  */
/*==============================================================*/
INSERT INTO ServiceCalled VALUES('S001','R100',N'Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('S002','R101',N'Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('S003','R102',N'Chỉ lấy 2 chiếc xe đạp');
INSERT INTO ServiceCalled VALUES('S004','R103',N'Giặc xong giao trả tận phòng');
INSERT INTO ServiceCalled VALUES('S005','R104',N'Cần phòng rộng, có máy lạnh');
INSERT INTO ServiceCalled VALUES('S006','R105',N'Trang bị sẵn 2 mic, trái cây');
INSERT INTO ServiceCalled VALUES('S007','R106',N'Kế bên tiệc có hồ bơi');
INSERT INTO ServiceCalled VALUES('S008','R107',N'Cần 2 cây vợt đánh tennis');
INSERT INTO ServiceCalled VALUES('S009','R108',N'Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('S010','R109',N'Không cần gì thêm');
