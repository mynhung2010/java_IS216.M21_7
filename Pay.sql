CREATE TABLE Pay (
	BillNo			varchar(5) not null,
	CusNo			varchar(5) not null,
	Method			int not null,
	-- Status:
		-- 1: dùng COD
		-- 2: Bằng cách chuyển khoản
	PaymentDate		smalldatetime not null,
	CONSTRAINT CHK_Method CHECK (Method BETWEEN 1 AND 2)	
);
--- Khóa chính Pay
ALTER TABLE Pay ADD CONSTRAINT PK_Pay PRIMARY KEY(BillNo,CusNo);
