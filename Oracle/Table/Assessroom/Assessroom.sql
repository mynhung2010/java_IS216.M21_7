
/*==============================================================*/
/* Table: Assessroom                                            */
/*==============================================================*/

CREATE TABLE Assessroom(
	Point			float not null, 
     "Comment"			varchar2(2000) not null,
	RoomNo			varchar2(5) not null,
	CusNo		varchar2(5) not null,
   
	CONSTRAINT CHK_Point CHECK (Point BETWEEN 0 AND 10)
);

--T?o khóa chính
ALTER TABLE Assessroom ADD CONSTRAINT PK_Assessroom PRIMARY KEY (RoomNo,CusNo);

ALTER TABLE Assessroom
   ADD CONSTRAINT FK_ASSESSRO_ASSESSROO_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);

ALTER TABLE Assessroom
   ADD CONSTRAINT FK_ASSESSRO_ASSESSROO_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO);

/*==============================================================*/
/*      INSERT D? LI?U B?NG Assessroom                          */
/*==============================================================*/

INSERT INTO Assessroom VALUES (8,'Dịch vụ phục vụ tốt','R100','C001');
INSERT INTO Assessroom VALUES (7.5,'Chất lượng phòng tiện nghi','R101','C002');
INSERT INTO Assessroom VALUES (9,'Việc cung cấp dịch vụ ở mức giá phù hợp với khả năng người tiêu dùng','R102','C003');
INSERT INTO Assessroom VALUES (7,'Phòng cũng bình thường','R103','C004');
INSERT INTO Assessroom VALUES (8,'Chất lượng phòng phù hợp với mức tiền','R104','C005');
INSERT INTO Assessroom VALUES (8.5,'Giá đặt phòng rẻ','R105','C006');
INSERT INTO Assessroom VALUES (8,'Khách sạn có an ninh an toàn','R105','C007');
INSERT INTO Assessroom VALUES (9.5,'Khuôn viên luôn vệ sinh sạch sẻ','R107','C008');
INSERT INTO Assessroom VALUES (10,'Dịch vụ phục vụ tốt, nhân viên nhi?t tình','R107','C009');
INSERT INTO Assessroom VALUES (8,'Khách sạn phục vụ thiết bị tiện nghi','R109','C010');
INSERT INTO Assessroom VALUES (7,'Khách sạn phục vụ bình thường','R114','C011');
INSERT INTO Assessroom VALUES (6,'Chưa đầy đủ tiện nghe','R110','C012');
INSERT INTO Assessroom VALUES (9,'VIew đẹp, vệ sinh sạch sẻ','R111','C013');
INSERT INTO Assessroom VALUES (7.5,'Gía cả ổn','R112','C014');
INSERT INTO Assessroom VALUES (8,'Phục vụ tốt','R113','C015');