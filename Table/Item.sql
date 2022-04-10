/*==============================================================*/
/* Table: Item							*/
/*==============================================================*/
Create table Item(
	ItemNo		varchar(5) not null,
	ItemName	nvarchar(30)	not null,
	NoOfItem	int	not null,
	Status		nvarchar(20)	not null,-- Tốt, hư hỏng, chưa trang bị
	CONSTRAINT CHK_STATUS CHECK(Status IN (N'Tốt', N'Hư hỏng', N'Chưa trang bị'))
);
--- Khóa chính bảng Item
ALTER TABLE Item ADD CONSTRAINT PK_ITEM PRIMARY KEY(ItemNo);



/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Item				*/
/*==============================================================*/
INSERT INTO Item VALUES('I001',N'Bàn là', 1,N'Tốt');
INSERT INTO Item VALUES('I002',N'Khăn tắm', 2,N'Chưa trang bị');
INSERT INTO Item VALUES('I003',N'Mền', 2,N'Tốt');
INSERT INTO Item VALUES('I004',N'Móc quần áo', 5,N'Hư hỏng');
INSERT INTO Item VALUES('I005',N'Bình đun siêu tốc', 1,N'Tốt');
INSERT INTO Item VALUES('I006',N'Quạt đứng', 1,N'Chưa trang bị');
INSERT INTO Item VALUES('I007',N'Ti vi', 1,N'Tốt');
INSERT INTO Item VALUES('I008',N'Tủ lạnh', 1,N'Hư hỏng');
INSERT INTO Item VALUES('I009',N'Móc quần áo', 5,N'Tốt');
INSERT INTO Item VALUES('I010',N'Mền', 2,N'Chưa trang bị');
