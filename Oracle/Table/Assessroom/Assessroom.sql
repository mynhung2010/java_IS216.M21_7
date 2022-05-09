/*==============================================================*/
/* Table: Assessroom                                            */
/*==============================================================*/

CREATE TABLE Assessroom(
	Point			number not null, 	
	RoomNo			varchar2(5) not null,
	CusNo		varchar2(5) not null,
    "Comment"			varchar2(2000) not null,
	CONSTRAINT CHK_Point CHECK (Point BETWEEN 0 AND 10)
);
--Tạo khóa chính
ALTER TABLE Assessroom ADD CONSTRAINT PK_Assessroom PRIMARY KEY (RoomNo,CusNo);
GO

/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Assessroom                          */
/*==============================================================*/

INSERT INTO Assessroom VALUES ('8','Dich vu phuc vu tot','R100','C001');
INSERT INTO Assessroom VALUES ('7.5','Chat luong phong tien nghi','R101','C002');
INSERT INTO Assessroom VALUES ('9','Viec cung cap dich vu o muc gia phu hop voi kha nang nguoi tieu dung','R102','C003');
INSERT INTO Assessroom VALUES ('7','Phong cung binh thuong','R103','C004');
INSERT INTO Assessroom VALUES ('8','Chat luong phong phu hop voi muc tien','R104','C005');
INSERT INTO Assessroom VALUES ('8.5','Gia dat phong re','R105','C006');
INSERT INTO Assessroom VALUES ('8','Khach san co an ninh an toan','R106','C007');
INSERT INTO Assessroom VALUES ('9.5','Khung vien luon ve sinh sach se','R107','C008');
INSERT INTO Assessroom VALUES ('10','Dich vu phuc vu tot, nhan vien nhiet tinh','R108','C009');
INSERT INTO Assessroom VALUES ('8','Khach san phuc vu thiet bi tien nghi','R109','C010');
