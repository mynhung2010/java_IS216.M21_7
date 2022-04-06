CREATE TABLE Account (
	LoginID		varchar(20) not null,
	Password	varchar(20) not null,
	Status		int not null,
	-- Status:
		-- 1: tài khoản đang hoạt động trong hệ thống
		-- 2: tài khoản đã đăng xuất khỏi hệ thống
	CONSTRAINT CHK_Status01 CHECK (Status BETWEEN 1 AND 2)	
);
--- Khóa chính Account
ALTER TABLE Account ADD CONSTRAINT PK_Acount PRIMARY KEY(LoginID);
