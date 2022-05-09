/*==============================================================*/
/* Table: Position                                              */
/*==============================================================*/
CREATE TABLE Position(
	PosNo		varchar2(5)	not null,
	PosName		varchar2(50)	not null,
	EmpNo		varchar2(5) not null
);
--Tạo khóa chính
ALTER TABLE Position ADD CONSTRAINT PK_Position PRIMARY KEY (PosNo)
GO
/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Position				*/
/*==============================================================*/

INSERT INTO Position VALUES('P001','Le Tan','E001');
INSERT INTO Position VALUES('P002','Phuc vu','E002');
INSERT INTO Position VALUES('P003','Phuc vu','E003'); 
INSERT INTO Position VALUES('P004','Phu phong','E004');
INSERT INTO Position VALUES('P005','Ve sinh','E005');
INSERT INTO Position VALUES('P006','Quan ly','E006');
INSERT INTO Position VALUES('P007','Bao ve','E007');  
INSERT INTO Position VALUES('P008','Le Tan','E008');
INSERT INTO Position VALUES('P009','Le Tan','E009');
INSERT INTO Position VALUES('P010','Le Tan','E010');
