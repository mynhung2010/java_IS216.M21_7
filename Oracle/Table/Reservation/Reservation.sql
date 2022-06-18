/*==============================================================*/
/* Table: Reservation                                           */
/*==============================================================*/
CREATE TABLE Reservation(
	ResNo			varchar2(5)	not null,
    billNo          varchar2(5) not null,
	CusNo		varchar2(5)	not null,
	RoomNo 			varchar2(5)		not null,
	ResDate		date	not null,
    tCheckIn	date	not null,
	tCheckOut	date	not null
);
--T?o khóa chính
ALTER TABLE Reservation ADD CONSTRAINT PK_Reservation PRIMARY KEY (ResNo);

ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_Bill FOREIGN KEY (BillNo)
      REFERENCES Bill (BillNo);

ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO);


ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO);


/*==============================================================*/
/*      INSERT D? LI?U B?NG Reservation                         */
/*==============================================================*/

INSERT INTO Reservation VALUES ('RE001', 'B001','C001','R100',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE002', 'B002','C002','R101',TO_DATE('12/03/2021','dd/mm/yyyy'),TO_DATE('14/03/2021','dd/mm/yyyy'),TO_DATE('16/03/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE003', 'B003','C003','R102',TO_DATE('29/06/2021','dd/mm/yyyy'),TO_DATE('30/06/2021','dd/mm/yyyy'),TO_DATE('02/07/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE004', 'B004','C004','R103',TO_DATE('04/05/2021','dd/mm/yyyy'),TO_DATE('05/05/2021','dd/mm/yyyy'),TO_DATE('06/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE005', 'B005','C005','R104',TO_DATE('03/05/2021','dd/mm/yyyy'),TO_DATE('05/05/2021','dd/mm/yyyy'),TO_DATE('08/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE006', 'B006','C006','R105',TO_DATE('23/04/2021','dd/mm/yyyy'),TO_DATE('24/04/2021','dd/mm/yyyy'),TO_DATE('25/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE007', 'B007','C007','R105',TO_DATE('25/06/2021','dd/mm/yyyy'),TO_DATE('26/06/2021','dd/mm/yyyy'),TO_DATE('28/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE008', 'B008','C008','R107',TO_DATE('21/01/2021','dd/mm/yyyy'),TO_DATE('21/01/2021','dd/mm/yyyy'),TO_DATE('23/01/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE009', 'B009','C009','R107',TO_DATE('22/07/2021','dd/mm/yyyy'),TO_DATE('22/07/2021','dd/mm/yyyy'),TO_DATE('23/07/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE010', 'B010','C010','R109',TO_DATE('08/06/2021','dd/mm/yyyy'),TO_DATE('08/06/2021','dd/mm/yyyy'),TO_DATE('11/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE011', 'B011','C002','R101',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE012', 'B012','C003','R102',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE013', 'B013','C004','R103',TO_DATE('23/06/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('27/06/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE014', 'B014','C011','R114',TO_DATE('13/05/2021','dd/mm/yyyy'),TO_DATE('16/05/2021','dd/mm/yyyy'),TO_DATE('22/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE015', 'B015','C012','R110',TO_DATE('12/04/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('30/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE016', 'B016','C013','R111',TO_DATE('15/03/2021','dd/mm/yyyy'),TO_DATE('15/04/2021','dd/mm/yyyy'),TO_DATE('17/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE017', 'B017','C014','R112',TO_DATE('15/05/2021','dd/mm/yyyy'),TO_DATE('22/05/2021','dd/mm/yyyy'),TO_DATE('27/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE018', 'B018','C015','R113',TO_DATE('28/06/2021','dd/mm/yyyy'),TO_DATE('12/07/2021','dd/mm/yyyy'),TO_DATE('16/07/2021','dd/mm/yyyy'));
