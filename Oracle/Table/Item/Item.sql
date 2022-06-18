/*==============================================================*/
/* Table: Item							*/
/*==============================================================*/
Create table Item(
	ItemNo		varchar2(5) not null,
	ItemName	varchar2(30)	not null,
	NoOfItem	number	not null,
	Status		varchar2(20)	not null,
        -- T?t, h? h?ng, ch?a trang b?
	CONSTRAINT CHK_STATUSItem CHECK(Status IN ('Tốt', 'Hư hỏng', 'Chưa trang bị'))
);
--- Khóa chính b?ng Item
ALTER TABLE Item ADD CONSTRAINT PK_ITEM PRIMARY KEY(ItemNo);

/*==============================================================*/
/*      INSERT D? LI?U B?NG Item				*/
/*==============================================================*/
INSERT INTO Item VALUES('I001','Bàn là', 1,'Tốt');
INSERT INTO Item VALUES('I002','Khăn tắm', 2,'Chưa trang bị');
INSERT INTO Item VALUES('I003','Mền', 2,'Tốt');
INSERT INTO Item VALUES('I004','Móc quần áo', 5,'Hư hỏng');
INSERT INTO Item VALUES('I005','Bình đun siêu tốc', 1,'Tốt');
INSERT INTO Item VALUES('I006','Quạt đứng', 1,'Chưa trang bị');
INSERT INTO Item VALUES('I007','Tivi', 1,'Tốt');
INSERT INTO Item VALUES('I008','Tủ lạnh', 1,'Hư hỏng');
INSERT INTO Item VALUES('I009','Móc quần áo', 5,'Tốt');
INSERT INTO Item VALUES('I010','Mền', 2,'Chưa trang bị');
INSERT INTO Item VALUES('I011','Đèn', 5,'Tốt');
INSERT INTO Item VALUES('I012','Máy lạnh điều hòa', 2,'Hư hỏng');
INSERT INTO Item VALUES('I013','Gối', 3,'Tốt');
INSERT INTO Item VALUES('I014','Dù che mưa', 6,'Tốt');
INSERT INTO Item VALUES('I015','Vật dùng y tế', 4,'Chưa trang bị');
