
/*==============================================================*/
/* Table: Assessroom                                                */
/*==============================================================*/
CREATE TABLE Assessroom(
	Point			Float not null, 
	Comment			nvarchar(100) not null,
	RoomNo			varchar(5) not null,
	CusNo		varchar(5) not null,
	CONSTRAINT CHK_Point CHECK (Point BETWEEN 0 AND 10)
);
--Tạo khóa chính
ALTER TABLE Assessroom ADD CONSTRAINT PK_Assessroom PRIMARY KEY (RoomNo,CusNo)
GO

/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Assessroom                          */
/*==============================================================*/

INSERT INTO Assessroom VALUES ('8',N'Dịch vụ phục vụ tốt','R100','C001')
INSERT INTO Assessroom VALUES ('7.5',N'Chất lượng phòng tiện nghi','R101','C002')
INSERT INTO Assessroom VALUES ('9',N'Việc cung cấp dịch vụ ở mức giá phù hợp với khả năng người tiêu dùng','R102','C003')
INSERT INTO Assessroom VALUES ('7',N'Phòng cũng bình thường','R103','C004')
INSERT INTO Assessroom VALUES ('8',N'Chất lượng phòng phù hợp với mức tiền','R104','C005')
INSERT INTO Assessroom VALUES ('8.5',N'Giá đặt phòng rẻ','R105','C006')
INSERT INTO Assessroom VALUES ('8',N'Khách sạn có an ninh an toàn','R106','C007')
INSERT INTO Assessroom VALUES ('9.5',N'Khung viên luôn vệ sinh sạch sẽ','R107','C008')
INSERT INTO Assessroom VALUES ('10',N'Dịch vụ phục vụ tốt, nhân viên nhiệt tình','R108','C009')
INSERT INTO Assessroom VALUES ('8',N'Khách sạn phục vụ thiết bị tiện nghi','R109','C010')
