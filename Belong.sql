/*==============================================================*/
/* Table: Belong                                                */
/*==============================================================*/
CREATE TABLE Belong(
	ItemNo		varchar(5) not null,
	RoomNo		varchar(5) not null
);
--Tạo khóa chính
ALTER TABLE Belong ADD CONSTRAINT PK_Belong PRIMARY KEY (ItemNo)
GO
/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Belong                              */
/*==============================================================*/

INSERT INTO Belong VALUES ('I001','R100')
INSERT INTO Belong VALUES ('I002','R101')
INSERT INTO Belong VALUES ('I003','R102')
INSERT INTO Belong VALUES ('I004','R103')
INSERT INTO Belong VALUES ('I005','R104')
INSERT INTO Belong VALUES ('I006','R105')
INSERT INTO Belong VALUES ('I007','R106')
INSERT INTO Belong VALUES ('I008','R107')
INSERT INTO Belong VALUES ('I009','R108')
INSERT INTO Belong VALUES ('I010','R109')
