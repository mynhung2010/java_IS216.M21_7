/*==============================================================*/
/* Table: Reservation                                                */
/*==============================================================*/
CREATE TABLE Reservation(
	ResNo			varchar(5)	not null,
	CusNo		varchar(5)	not null,
	RoomNo 			varchar(5)		not null,
	ResDate		Smalldatetime	not null
);
--Tạo khóa chính
ALTER TABLE Reservation ADD CONSTRAINT PK_Reservation PRIMARY KEY (ResNo)
GO
/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Reservation                         */
/*==============================================================*/

INSERT INTO Reservation VALUES ('RE001','C001','R100','23/6/2021')
INSERT INTO Reservation VALUES ('RE002','C003','R101','12/3/2021')
INSERT INTO Reservation VALUES ('RE003','C002','R102','29/6/2021')
INSERT INTO Reservation VALUES ('RE004','C006','R103','4/5/2021')
INSERT INTO Reservation VALUES ('RE005','C009','R104','3/5/2021')
INSERT INTO Reservation VALUES ('RE006','C010','R105','23/4/2021')
INSERT INTO Reservation VALUES ('RE007','C004','R106','25/6/2021')
INSERT INTO Reservation VALUES ('RE008','C005','R107','21/1/2021')
INSERT INTO Reservation VALUES ('RE009','C007','R108','22/7/2021')
INSERT INTO Reservation VALUES ('RE010','C008','R109','8/6/2021')

