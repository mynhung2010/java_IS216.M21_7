CREATE TABLE Account (
	LoginID		varchar(20) not null,
	Password	varchar(20) not null,
	Status		int not null,
	-- Status:
		-- 1: tÃ i khoáº£n Ä‘ang hoáº¡t Ä‘á»™ng trong há»‡ thá»‘ng
		-- 2: tÃ i khoáº£n Ä‘Ã£ Ä‘Äƒng xuáº¥t khá»�i há»‡ thá»‘ng
	CONSTRAINT CHK_Status01 CHECK (Status BETWEEN 1 AND 2)	
);
--- KhÃ³a chÃ­nh Account
ALTER TABLE Account ADD CONSTRAINT PK_Acount PRIMARY KEY(LoginID);
