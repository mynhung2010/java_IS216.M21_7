
/*==============================================================*/
/* Table: Account                                              */
/*==============================================================*/

CREATE TABLE Account (
    AccountID       NUMBER      not null,
	username		varchar2(20) not null unique,
	Password	varchar2(30) not null,
	Role        varchar2(30) not null	
);
--- Khóa chính Account
ALTER TABLE Account ADD CONSTRAINT PK_Acount PRIMARY KEY(AccountID);


/*==============================================================*/
/*      INSERT D? LI?U B?NG Account                             */
/*==============================================================*/
INSERT INTO Account VALUES (101,'trangnhung','trangnhung123','Nhân viên quản lý');

INSERT INTO Account VALUES (1,'vandau','vandau123','Nhân viên');
INSERT INTO Account VALUES (2,'thianh','thianh123','Nhân viên');
INSERT INTO Account VALUES (3,'anhthien','anhthien123','Nhân viên');
INSERT INTO Account VALUES (4,'huyentrang','huyentrang123','Nhân viên');
INSERT INTO Account VALUES (5,'vanthanh','vanthanh123','Nhân viên');
INSERT INTO Account VALUES (6,'hoangphong','hoangphong123','Nhân viên');
INSERT INTO Account VALUES (7,'camtu','camtu123','Nhân viên');
INSERT INTO Account VALUES (8,'thanhlong','thanhlong123','Nhân viên');
INSERT INTO Account VALUES (9,'tuyetha','tuyetha123','Nhân viên');
INSERT INTO Account VALUES (10,'ducduy','ducduy123','Nhân viên');
INSERT INTO Account VALUES (11,'ngocngu','ngocnhu123','Nhân viên');
INSERT INTO Account VALUES (12,'duyanh','duyanh123','Nhân viên');
INSERT INTO Account VALUES (13,'thaoha','thaoha123','Nhân viên');
INSERT INTO Account VALUES (14,'anhthu','anhthu123','Nhân viên');

INSERT INTO Account VALUES(201,'mynhung','mynhung123','Khách hàng');
INSERT INTO Account VALUES(202,'thanhphat','thanhphat123','Khách hàng');
INSERT INTO Account VALUES(203,'thaohong','thaohong123','Khách hàng');
INSERT INTO Account VALUES(204,'tienlinh','tienlinh123','Khách hàng');
INSERT INTO Account VALUES(205,'hoailinh','hoailinh123','Khách hàng');
INSERT INTO Account VALUES(206,'anhkiet','anhkiet123','Khách hàng');
INSERT INTO Account VALUES(207,'phuonglinh','phuonglinh123','Khách hàng');
INSERT INTO Account VALUES(208,'myquyen','myquyen123','Khách hàng');
INSERT INTO Account VALUES(209,'duythien','duythien123','Khách hàng');
INSERT INTO Account VALUES(210,'anhhuy','anhhuy123','Khách hàng');
INSERT INTO Account VALUES(211,'nguyenduy','nguyenduy123','Khách hàng');
INSERT INTO Account VALUES(212,'hobaoan','hobaoan123','Khách hàng');
INSERT INTO Account VALUES(213,'thuyduong','thuyduong123','Khách hàng');
INSERT INTO Account VALUES(214,'tangduc','tangduc123','Khách hàng');
INSERT INTO Account VALUES(215,'ngochien','ngochien123','Khách hàng');

