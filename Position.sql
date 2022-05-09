
/*==============================================================*/
/* Table: Position                                              */
/*==============================================================*/
CREATE TABLE Position(
	PosNo		varchar(5)	not null,
	PosName		nvarchar(50)	not null,
	EmpNo		varchar(5) not null
);
--Tạo khóa chính
ALTER TABLE Position ADD CONSTRAINT PK_Position PRIMARY KEY (PosNo)
GO
/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Position				*/
/*==============================================================*/

INSERT INTO Position VALUES('P001',N'Lễ Tân','E001')
INSERT INTO Position VALUES('P002',N'Phục vụ','E002')
INSERT INTO Position VALUES('P003',N'Phục vụ','E003') 
INSERT INTO Position VALUES('P004',N'Phụ phòng','E004')
INSERT INTO Position VALUES('P005',N'Vệ sinh','E005')
INSERT INTO Position VALUES('P006',N'Quản lý','E006')
INSERT INTO Position VALUES('P007',N'Bảo vệ','E007')   
INSERT INTO Position VALUES('P008',N'Lễ Tân','E008')
INSERT INTO Position VALUES('P009',N'Lễ Tân','E009')
INSERT INTO Position VALUES('P010',N'Lễ Tân','E010')

