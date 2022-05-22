INSERT INTO Employee VALUES ('E011','Bùi Ð?c Duy','0354354353','P011',TO_DATE('21/02/1998','dd/mm/yyyy'),0,TO_DATE('14/04/2019','dd/mm/yyyy'),'duy@gmail.com',21);
INSERT INTO Employee VALUES ('E012','Tr?n Ng?c Nhý','0254837235','P012',TO_DATE('30/08/1997','dd/mm/yyyy'),1,TO_DATE('12/3/2018','dd/mm/yyyy'),'nhu@gmail.com',22);
INSERT INTO Employee VALUES ('E013','Nguy?n Duy Anh','0123456789','P013',TO_DATE('23/07/1989','dd/mm/yyyy'),0,TO_DATE('12/5/2018','dd/mm/yyyy'),'danh@gmail.com',23);
INSERT INTO Employee VALUES ('E014','Nguy?n Th? Th?o Hà','0326483923','P014',TO_DATE('12/04/2000','dd/mm/yyyy'),1,TO_DATE('06/03/2018','dd/mm/yyyy'),'tha@gmail.com',24);
INSERT INTO Employee VALUES ('E015','Lê Anh Thý','0384249312','P015',TO_DATE('04/08/1999','dd/mm/yyyy'),1,TO_DATE('23/01/2018','dd/mm/yyyy'),'thu@gmail.com',25);

INSERT INTO Account VALUES (21,'ducduy','ducduy123','Nhân viên');
INSERT INTO Account VALUES (22,'ngocngu','ngocnhu123','Nhân viên');
INSERT INTO Account VALUES (23,'duyanh','duyanh123','Nhân viên');
INSERT INTO Account VALUES (24,'thaoha','thaoha123','Nhân viên');
INSERT INTO Account VALUES (25,'anhthu','anhthu123','Nhân viên');
INSERT INTO Account VALUES(26,'nguyenduy','nguyenduy123','Khách hàng');
INSERT INTO Account VALUES(27,'hobaoan','hobaoan123','Khách hàng');
INSERT INTO Account VALUES(28,'thuyduong','thuyduong123','Khách hàng');
INSERT INTO Account VALUES(29,'tangduc','tangduc123','Khách hàng');
INSERT INTO Account VALUES(30,'ngochien','ngochien123','Khách hàng');

INSERT INTO Room VALUES ('R110',2,'Deluxe',700000);
INSERT INTO Room VALUES ('R111',1,'Superior',550000);
INSERT INTO Room VALUES ('R112',2,'Standard',250000);
INSERT INTO Room VALUES ('R113',1,'Deluxe',600000);
INSERT INTO Room VALUES ('R114',2,'Superior',500000);

INSERT INTO Service VALUES ('S011','D?ch v? xe ðýa ðón sân bay',0,1500000);
INSERT INTO Service VALUES ('S012','D?ch v? cho thuê xe máy t? lái',0,500000);
INSERT INTO Service VALUES ('S013','D?ch v? ph?ng 24/24',0,1000000);
INSERT INTO Service VALUES ('S014','D?ch v? ð?t vé máy bay, tour du l?ch',0,800000);
INSERT INTO Service VALUES ('S015','D?ch v? trông tr?',0,1200000);



INSERT INTO ServiceCalled VALUES('S011','R110','Không c?n g? thêm');
INSERT INTO ServiceCalled VALUES('S012','R112','2 chi?c xe máy');
INSERT INTO ServiceCalled VALUES('S013','R111','D?n d?p ph?ng ');
INSERT INTO ServiceCalled VALUES('S014','R113','Ð?t vé máy bay t? Thành ph? H? Chí Minh ra Hà N?i');
INSERT INTO ServiceCalled VALUES('S015','R114','Trông 2 ð?a tr? 3 tu?i');


INSERT INTO Item VALUES('I011','Ðèn', 5,'T?t');
INSERT INTO Item VALUES('I012','Máy l?nh ði?u h?a', 2,'Hý h?ng');
INSERT INTO Item VALUES('I013','G?i', 3,'T?t');
INSERT INTO Item VALUES('I014','Dù che mýa', 6,'T?t');
INSERT INTO Item VALUES('I015','V?t d?ng y t?', 4,'Chýa trang b?');

INSERT INTO Customer VALUES ('C011','Nguy?n Duy',0,'V?ng Tàu','0432985342','duy@gmail.com','042984732647',26);
INSERT INTO Customer VALUES ('C012','H? B?o An',0,'Nha Trang','0396418423','an@gmail.com','038427412345',27);
INSERT INTO Customer VALUES ('C013','Dýõng Thanh Th?y',1,'Thành ph? H? Chí Minh','0329642732','thuyduong@gmail.com','0593741842',28);
INSERT INTO Customer VALUES ('C014','Thái Tãng Ð?c',0,'Qu?ng Tr?','0732406954','duc@gmail.com','049173829432',29);
INSERT INTO Customer VALUES ('C015','Nguy?n Ng?c Hi?n',1,'B?n Tre','0493762453','hien@gmail.com','069382741345',30);


INSERT INTO Position VALUES('P011','L? tân','E011');
INSERT INTO Position VALUES('P012','B?o v?','E012');
INSERT INTO Position VALUES('P013','Ph?c v?','E013');
INSERT INTO Position VALUES('P014','V? sinh','E014');
INSERT INTO Position VALUES('P015','Ph? ph?ng','E015');


INSERT INTO Belong VALUES ('I011','R109');
INSERT INTO Belong VALUES ('I012','R111');
INSERT INTO Belong VALUES ('I013','R108');
INSERT INTO Belong VALUES ('I014','R106');
INSERT INTO Belong VALUES ('I015','R114');

INSERT INTO Assessroom VALUES ('7','Khách s?n ph?c v? b?nh thý?ng','R114','C011');
INSERT INTO Assessroom VALUES ('6','Chýa ð?y ð? ti?n nghe','R110','C012');
INSERT INTO Assessroom VALUES ('9','VIew ð?p, v? sinh s?ch s?','R111','C013');
INSERT INTO Assessroom VALUES (7.5,'Gía c? ?n','R112','C014');
INSERT INTO Assessroom VALUES ('8','Ph?c v? t?t','R113','C015');



INSERT INTO Reservation VALUES ('RE014','C011','R114',TO_DATE('13/05/2021','dd/mm/yyyy'),TO_DATE('16/05/2021','dd/mm/yyyy'),TO_DATE('22/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE015','C012','R110',TO_DATE('12/04/2021','dd/mm/yyyy'),TO_DATE('24/06/2021','dd/mm/yyyy'),TO_DATE('30/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE016','C013','R111',TO_DATE('15/03/2021','dd/mm/yyyy'),TO_DATE('15/04/2021','dd/mm/yyyy'),TO_DATE('17/04/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE017','C014','R112',TO_DATE('15/05/2021','dd/mm/yyyy'),TO_DATE('22/05/2021','dd/mm/yyyy'),TO_DATE('27/05/2021','dd/mm/yyyy'));
INSERT INTO Reservation VALUES ('RE018','C015','R113',TO_DATE('28/06/2021','dd/mm/yyyy'),TO_DATE('12/07/2021','dd/mm/yyyy'),TO_DATE('16/07/2021','dd/mm/yyyy'));

INSERT INTO Bill VALUES ('B014','C011','S015','R114',1700000);
INSERT INTO Bill VALUES ('B015','C012','S012','R110',1200000);
INSERT INTO Bill VALUES ('B016','C013','S013','R111',1550000);
INSERT INTO Bill VALUES ('B017','C014','S012','R112',750000);
INSERT INTO Bill VALUES ('B018','C015','S014','R113',1400000);


INSERT INTO Pay VALUES ('B014','C011',1,TO_DATE('22/05/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B015','C012',2,TO_DATE('30/04/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B016','C013',2,TO_DATE('17/04/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B017','C014',1,TO_DATE('27/05/2021','dd/mm/yyyy'));
INSERT INTO Pay VALUES ('B018','C015',2,TO_DATE('16/07/2021','dd/mm/yyyy'));
