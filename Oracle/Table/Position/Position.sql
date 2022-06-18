/*==============================================================*/
/* Table: Position                                              */
/*==============================================================*/
CREATE TABLE Position(
	PosNo		varchar2(5)	not null,
	PosName		varchar2(50)	not null,
	EmpNo		varchar2(5) not null
);
--T?o khóa chính
ALTER TABLE Position ADD CONSTRAINT PK_Position PRIMARY KEY (PosNo);

ALTER TABLE Position
   ADD CONSTRAINT FK_Position_IS_EMPLOYEE FOREIGN KEY (EMPNO)
      REFERENCES EMPLOYEE (EMPNO);

/*==============================================================*/
/*      INSERT D? LI?U B?NG Position				            */
/*==============================================================*/

INSERT INTO Position VALUES('P001','Lễ Tân','E001');
INSERT INTO Position VALUES('P002','Phục vụ','E002');
INSERT INTO Position VALUES('P003','Phục vụ','E003'); 
INSERT INTO Position VALUES('P004','Phụ phòng','E004');
INSERT INTO Position VALUES('P005','Vệ sinh','E005');
INSERT INTO Position VALUES('P006','Quản lý','E016');
INSERT INTO Position VALUES('P007','Bảo vệ','E007');  
INSERT INTO Position VALUES('P008','Lễ Tân','E008');
INSERT INTO Position VALUES('P009','Lễ Tân','E009');
INSERT INTO Position VALUES('P010','Lễ Tân','E010');
INSERT INTO Position VALUES('P011','Lễ tân','E011');
INSERT INTO Position VALUES('P012','Bảo vệ','E012');
INSERT INTO Position VALUES('P013','Phục vụ','E013');
INSERT INTO Position VALUES('P014','Vệ sinh','E014');
INSERT INTO Position VALUES('P015','Phụ phòng','E006');
