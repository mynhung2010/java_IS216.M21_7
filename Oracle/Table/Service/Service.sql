
/*==============================================================*/
/* Table: Service                                               */
/*==============================================================*/
CREATE TABLE Service(
	SerNo				varchar2(5)		not null,
	SerName				varchar2(50)	not null,
	TypeOfService		number		not null, --0:Ngoài tr?i ; 1:Trong nhà
	Cost				number		not null,
	CONSTRAINT CHK_TypeOfService CHECK (TypeOfService BETWEEN 0 AND 1 )
);
--T?o khóa chính
ALTER TABLE Service ADD CONSTRAINT PK_Service PRIMARY KEY (SerNo);

/*==============================================================*/
/*      INSERT D? LI?U B?NG Service                             */
/*==============================================================*/

INSERT INTO Service VALUES ('S001','Dịch vụ Spa',1,1000000);
INSERT INTO Service VALUES ('S002','Dịch vụ cà phê',1,100000);
INSERT INTO Service VALUES ('S003','Dịch vụ thuê xe',0,500000);
INSERT INTO Service VALUES ('S004','Dịch vụ giặt đồ',1,20000);
INSERT INTO Service VALUES ('S005','Dịch vụ thuê phòng họp',1,5000000);
INSERT INTO Service VALUES ('S006','Dịch vụ thuê phòng karaoke',0,5000000);
INSERT INTO Service VALUES ('S007','Dịch vụ tiệc ngoài trời',0,1000000);
INSERT INTO Service VALUES ('S008','Dịch vụ sân tennis',0,800000);
INSERT INTO Service VALUES ('S009','Dịch vụ phòng gym',1,50000);
INSERT INTO Service VALUES ('S010','Dịch vụ bar trên lầu khách sạn',0,1900000);
INSERT INTO Service VALUES ('S011','Dịch vụ xe đưa đón sân bay',0,1500000);
INSERT INTO Service VALUES ('S012','Dịch vụ cho thuê xe máy tự lái',0,500000);
INSERT INTO Service VALUES ('S013','Dịch vụ phòng 24/24',0,1000000);
INSERT INTO Service VALUES ('S014','Dịch vụ đặt vé máy bay, tour du lịch',0,800000);
INSERT INTO Service VALUES ('S015','Dịch vụ trông trẻ',0,1200000);
