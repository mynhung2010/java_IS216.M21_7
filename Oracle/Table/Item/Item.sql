/*==============================================================*/
/* Table: Item							*/
/*==============================================================*/
Create table Item(
	ItemNo		varchar2(5) not null,
	ItemName	varchar2(30)	not null,
	NoOfItem	number	not null,
	Status		varchar2(20)	not null,-- Tốt, hư hỏng, chưa trang bị
	CONSTRAINT CHK_STATUS CHECK(Status IN ('Tot', 'Hu hong', 'Chua trang bi'))
);
--- Khóa chính bảng Item
ALTER TABLE Item ADD CONSTRAINT PK_ITEM PRIMARY KEY(ItemNo);



/*==============================================================*/
/*      INSERT DỮ LIỆU BẢNG Item				*/
/*==============================================================*/
INSERT INTO Item VALUES('I001','Ban la', 1,'Tot');
INSERT INTO Item VALUES('I002','Khan tam', 2,'Chua trang bi');
INSERT INTO Item VALUES('I003','Men', 2,'Tot');
INSERT INTO Item VALUES('I004','Moc quan ao', 5,'Hu hong');
INSERT INTO Item VALUES('I005','Binh dun sieu toc', 1,'Tot');
INSERT INTO Item VALUES('I006','Quat dung', 1,'Chua trang bi');
INSERT INTO Item VALUES('I007','Tivi', 1,'Tot');
INSERT INTO Item VALUES('I008','Tu lanh', 1,'Hu hong');
INSERT INTO Item VALUES('I009','Moc quan ao', 5,'Tot');
INSERT INTO Item VALUES('I010','Men', 2,'Chua trang bi');
