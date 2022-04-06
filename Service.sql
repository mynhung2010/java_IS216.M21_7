/*==============================================================*/
/* Table: Service                                                */
/*==============================================================*/
CREATE TABLE Service(
	SerNo				varchar(5)		not null,
	SerName				nvarchar(50)	not null,
	TypeOfService		Int		not null, --0:Ngoài trời ; 1:Trong nhà
	Cost				Money		not null,
	CONSTRAINT CHK_TypeOfService CHECK (TypeOfService BETWEEN 0 AND 1 )
);
--Tạo khóa chính
ALTER TABLE Service ADD CONSTRAINT PK_Service PRIMARY KEY (SerNo)
GO
/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Service                             */
/*==============================================================*/

INSERT INTO Service VALUES ('S001',N'Dịch vụ Spa',1,1000000)
INSERT INTO Service VALUES ('S002',N'Dịch vụ cà phê',1,100000)
INSERT INTO Service VALUES ('S003',N'Dịch vụ thuê xe',0,500000)
INSERT INTO Service VALUES ('S004',N'Dịch vụ giặc đồ',1,20000)
INSERT INTO Service VALUES ('S005',N'Dịch vụ thuê phòng họp',1,5000000)
INSERT INTO Service VALUES ('S006',N'Dịch vụ thuê phòng karaoke',0,5000000)
INSERT INTO Service VALUES ('S007',N'Dịch vụ tiệc ngoài trời',0,1000000)
INSERT INTO Service VALUES ('S008',N'Dịch vụ sân tennis',0,800000)
INSERT INTO Service VALUES ('S009',N'Dịch vụ phòng gym',1,50000)
INSERT INTO Service VALUES ('S010',N'Dịch vụ bar trên lầu khách sạn',0,1900000)
