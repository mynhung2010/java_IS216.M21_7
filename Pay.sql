/*==============================================================*/
/* Table: Pay                                              */
/*==============================================================*/

CREATE TABLE Pay (
	BillNo			varchar(5) not null,
	CusNo			varchar(5) not null,
	Method			int not null,
	-- Status:
		-- 1: dùng COD
		-- 2: Bằng cách chuyển khoản
	PaymentDate		date not null,
	CONSTRAINT CHK_Method CHECK (Method BETWEEN 1 AND 2)	
);
--- Khóa chính Pay
ALTER TABLE Pay ADD CONSTRAINT PK_Pay PRIMARY KEY(BillNo,CusNo);


/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Pay		                            */
/*==============================================================*/



INSERT INTO Pay VALUES ('B001','C001',1,TO_DATE('22/2/2022','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B002','C002',2,TO_DATE('03/3/2022','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B003','C003',1,TO_DATE('23/12/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B004','C004',1,TO_DATE('06/3/2022','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B005','C005',2,TO_DATE('28/2/2022','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B006','C006',2,TO_DATE('13/12/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B007','C007',1,TO_DATE('20/11/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B008','C008',2,TO_DATE('09/10/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B009','C009',2,TO_DATE('26/3/2022','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B010','C010',1,TO_DATE('17/1/2022','dd/mm/yyyy'));
