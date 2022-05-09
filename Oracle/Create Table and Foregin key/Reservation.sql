/*==============================================================*/
/* Table: Reservation                                           */
/*==============================================================*/
CREATE TABLE Reservation(
	ResNo			varchar2(5)	not null,
	CusNo		varchar2(5)	not null,
	RoomNo 			varchar2(5)		not null,
	ResDate		date	not null
);
--Tạo khóa chính
ALTER TABLE Reservation ADD CONSTRAINT PK_Reservation PRIMARY KEY (ResNo)
GO
/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Reservation                         */
/*==============================================================*/

INSERT INTO Reservation VALUES ('RE001','C001','R100',TO_DATE('23/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE002','C003','R101',TO_DATE('12/03/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE003','C002','R102',TO_DATE('29/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE004','C006','R103',TO_DATE('04/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE005','C009','R104',TO_DATE('03/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE006','C010','R105',TO_DATE('23/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE007','C004','R106',TO_DATE('25/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE008','C005','R107',TO_DATE('21/01/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE009','C007','R108',TO_DATE('22/07/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE010','C008','R109',TO_DATE('08/06/2021','dd/mm/yyyy'));
