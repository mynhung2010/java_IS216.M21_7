
/*==============================================================*/
/* Table: ServiceCalled                                         */
/*==============================================================*/
Create table ServiceCalled(
    billNo  varchar2(5) not null,
	SerNo	varchar2(5) not null,
	RoomNo		varchar2(5)	not null,
	Note		varchar2(2000)
);
--- Khóa chính ServiceCalled
ALTER TABLE ServiceCalled ADD CONSTRAINT PK_ServiceCalled PRIMARY KEY(billNo, SerNo, RoomNo);

ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_Bill FOREIGN KEY (billNo)
      REFERENCES Bill (BillNO);

ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_Service FOREIGN KEY (SERNO)
      REFERENCES Service (SERNO);


ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);
      
  
/*==============================================================*/
/*      INSERT D? LI?U B?NG ServiceCalled			            */
/*==============================================================*/
INSERT INTO ServiceCalled VALUES('B001','S001','R100','Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('B002','S002','R101','Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('B003','S003','R102','Chỉ lấy 2 chiếc xe đạp');
INSERT INTO ServiceCalled VALUES('B003','S004','R102','Giặt và trả tại phòng');
INSERT INTO ServiceCalled VALUES('B003','S005','R102','Cần phòng rộng, có máy lạnh');
INSERT INTO ServiceCalled VALUES('B004','S004','R103','Kèm là ủi và giao tới phòng trước 14h');
INSERT INTO ServiceCalled VALUES('B005','S005','R104','Cần phòng rộng, có máy lạnh');
INSERT INTO ServiceCalled VALUES('B006','S006','R105','Trang bị sẵn 2 mic, trái cây');
INSERT INTO ServiceCalled VALUES('B006','S007','R105','Kế bên tiệc có hồ bơi');
INSERT INTO ServiceCalled VALUES('B007','S006','R105','Trang bị sẵn 2 mic, trái cây');
INSERT INTO ServiceCalled VALUES('B007','S007','R105','Kế bên tiệc có hồ bơi');
INSERT INTO ServiceCalled VALUES('B008','S008','R107','Cần 2 cây vợt đánh tennis');
INSERT INTO ServiceCalled VALUES('B008','S009','R107','Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('B009','S008','R107','Cần 2 cây vợt đánh tennis');
INSERT INTO ServiceCalled VALUES('B009','S009','R107','Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('B010','S010','R109','Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('B011','S002','R101','Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('B012','S003','R102','Chỉ lấy 2 chiếc xe đạp');
INSERT INTO ServiceCalled VALUES('B012','S004','R102','Giặt và trả tại phòng');
INSERT INTO ServiceCalled VALUES('B012','S005','R102','Cần phòng rộng, có máy lạnh');
INSERT INTO ServiceCalled VALUES('B013','S004','R103','Kèm là ủi và giao tại phòng trước 14h');
INSERT INTO ServiceCalled VALUES('B014','S015','R114','Trông 2 đứa trẻ 3 tuổi');
INSERT INTO ServiceCalled VALUES('B015','S011','R110','Không cần gì thêm');
INSERT INTO ServiceCalled VALUES('B016','S013','R111','Dọn dẹp phòng ');
INSERT INTO ServiceCalled VALUES('B017','S012','R112','2 chiếc xe máy');
INSERT INTO ServiceCalled VALUES('B018','S014','R113','Đặt vé máy bay từ Thành phố Hồ Chí Minh ra Hà Nội');
