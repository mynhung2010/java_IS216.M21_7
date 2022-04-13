/*==============================================================*/
/* Table: Policy						*/
/*==============================================================*/
Create table Policy(
	PolNo	varchar2(5)	not null,
	PolName	varchar2(50)	not null,
	Requirement	number	not null,
	-- Requirement:
		-- 1: Thời gian ở
		-- 2: Ngày lễ
		-- 3: Sử dụng dịch vụ 
	tApplication	int	not null,
	StartDate	date	not null,
	CONSTRAINT CHK_Requirement CHECK (Requirement BETWEEN 1 AND 3)
);
--- Khóa chính Policy
ALTER TABLE Policy ADD CONSTRAINT PK_Policy PRIMARY KEY(PolNo);

/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Policy				*/
/*==============================================================*/
INSERT INTO Policy VALUES('POL01','O cang nhieu khuyen mai cang cao',1,3,TO_DATE('23/06/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL02','Vui choi le tai khach san',2,1,TO_DATE('14/03/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL03','Xai dich vu xai khuyen mai',3,2,TO_DATE('01/07/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL04','Xai dich vu xai khuyen mai',3,2,TO_DATE('06/05/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL05','Vui choi le tai khach san',3,2,TO_DATE('08/05/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL06','Ngay le lao dong',2,1,TO_DATE('30/04/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL07','Vui choi le tai khach san',2,1,TO_DATE('28/06/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL08','O cang lau khuyen mai cang nhieu',1,3,TO_DATE('23/01/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL09','O cang lau khuyen mai cang nhieu',1,3,TO_DATE('25/07/2021','dd/mm/yyyy'));
INSERT INTO Policy VALUES('POL10','Vui choi le',2,1,TO_DATE('01/06/2021','dd/mm/yyyy'));
