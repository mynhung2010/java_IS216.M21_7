ALTER TABLE Assessroom
   ADD CONSTRAINT FK_ASSESSRO_ASSESSROO_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO)


ALTER TABLE Assessroom
   ADD CONSTRAINT FK_ASSESSRO_ASSESSROO_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO)


ALTER TABLE Pay
   ADD CONSTRAINT FK_Pay_Pay_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO)


ALTER TABLE Pay
   ADD CONSTRAINT FK_Pay_Pay2_BILL FOREIGN KEY (BILLNO)
      REFERENCES BILL (BILLNO)

ALTER TABLE Position
   ADD CONSTRAINT FK_Position_IS_EMPLOYEE FOREIGN KEY (EMPNO)
      REFERENCES EMPLOYEE (EMPNO)


ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO)


ALTER TABLE Reservation
   ADD CONSTRAINT FK_RESERVAT_RESERVATI_Customer FOREIGN KEY (CUSNO)
      REFERENCES Customer (CUSNO)


ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_Service FOREIGN KEY (SERNO)
      REFERENCES Service (SERNO)


ALTER TABLE ServiceCALLED
   ADD CONSTRAINT FK_ServiceC_ServiceCA_ROOM FOREIGN KEY (ROOMNO)
      REFERENCES ROOM (ROOMNO)
