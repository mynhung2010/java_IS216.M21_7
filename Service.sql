/*==============================================================*/
/* Table: Service                                               */
/*==============================================================*/
CREATE TABLE Service(
	SerNo				varchar2(5)		not null,
	SerName				varchar2(50)	not null,
	TypeOfService		number		not null, --0:Ngoài trời ; 1:Trong nhà
	Cost				number		not null,
	CONSTRAINT CHK_TypeOfService CHECK (TypeOfService BETWEEN 0 AND 1 )
);
--Tạo khóa chính
ALTER TABLE Service ADD CONSTRAINT PK_Service PRIMARY KEY (SerNo)
GO
/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Service                             */
/*==============================================================*/

INSERT INTO Service VALUES ('S001','Dich vu Spa',1,1000000);
INSERT INTO Service VALUES ('S002','Dich vu ca phe',1,100000);
INSERT INTO Service VALUES ('S003','Dich vu thue xe',0,500000);
INSERT INTO Service VALUES ('S004','Dich vu giat do',1,20000);
INSERT INTO Service VALUES ('S005','Dich vu thue phong hop',1,5000000);
INSERT INTO Service VALUES ('S006','Dich vu thue phong karaoke',0,5000000);
INSERT INTO Service VALUES ('S007','Dich vu tiec ngoai troi',0,1000000);
INSERT INTO Service VALUES ('S008','Dich vu san tennis',0,800000);
INSERT INTO Service VALUES ('S009','Dich vu phong gym',1,50000);
INSERT INTO Service VALUES ('S010','Dich vu bar tren lau khach san',0,1900000);
