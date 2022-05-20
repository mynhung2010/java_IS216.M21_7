
/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: CUSTOMER                                         */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE proc_insert_cus (Cus_No Customer.CusNo%TYPE,
                                             Cus_name Customer.CusName%TYPE,
                                             Gen_der  Customer.Gender%TYPE,
                                             Add_ress Customer.Address%TYPE,
                                             PhoneNo  Customer.Phone%TYPE,
                                             Email_Cus    Customer.Email%TYPE,
                                             CID      Customer.ID%TYPE,
                                             AID      Customer.AccountID%TYPE)
IS
    NumberOfExists NUMBER := 0;
BEGIN
    SELECT Count(CusNo) INTO NumberOfExists
    FROM Customer
    WHERE CusNo = Cus_No;
    IF(NumberOfExists = 0) THEN
        INSERT INTO Customer(CusNo, CusName, Gender, Address, Phone,Email, ID, AccountID)
        VALUES(Cus_No, Cus_name, Gen_der, Add_ress, PhoneNo, Email_Cus, CID, AID);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma khach nay da co');
    END IF; 
END;


CREATE OR REPLACE PROCEDURE pro_delete_cus(Cus_No Customer.CusNo%TYPE)
IS
BEGIN
    DELETE FROM Customer
    WHERE CusNo = Cus_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;



CREATE OR REPLACE PROCEDURE proc_update_cus (CusNo_OLD Customer.CusNo%TYPE,
                                             Cus_No Customer.CusNo%TYPE,
                                             Cus_name Customer.CusName%TYPE,
                                             Gen_der  Customer.Gender%TYPE,
                                             Add_ress Customer.Address%TYPE,
                                             PhoneNo  Customer.Phone%TYPE,
                                             Email_Cus    Customer.Email%TYPE,
                                             CID      Customer.ID%TYPE,
                                             AID      Customer.AccountID%TYPE)
IS
BEGIN
    UPDATE Customer
    SET CusNo = Cus_No, CusName = Cus_name, Gender = Gen_der, Address = Add_ress, 
                            Phone = PhoneNo, Email = Email_Cus, ID = CID, AccountID = AID
    WHERE CusNo = CusNo_OLD;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
END;


/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: ACCOUNT                                          */
/*==============================================================*/

CREATE OR REPLACE PROCEDURE proc_insert_account(account_ID Account.accountID%TYPE,
                                                user_name  Account.username%TYPE,
                                                pass       Account.Password%TYPE,
                                                role_acc   Account.Role%TYPE)
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA TAI KHOAN CU
    SELECT Count(accountID) INTO NumberOfExists
    FROM Account
    WHERE accountID = account_ID;
    -- INSERT
    IF(NumberOfExists = 0) THEN
        INSERT INTO Account(accountID, username, Password, Role)
        VALUES(account_ID, user_name, pass, role_acc);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma tai khoan nay da co');
    END IF;
END;

CREATE OR REPLACE PROCEDURE proc_delete_account(account_ID Account.accountID%TYPE)
IS
BEGIN
    DELETE FROM Account
    WHERE accountID = account_ID;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;



CREATE OR REPLACE PROCEDURE proc_update_account(account_ID Account.accountID%TYPE,
                                                role_acc   Account.Role%TYPE)
IS
BEGIN
    UPDATE Account
    SET role = role_acc
    WHERE accountID = account_ID;
END;


/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: ROOM                                             */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE proc_insert_room(Room_No ROOM.RoomNo%TYPE,
                                             Type_Room ROOM.TypeOfRoom%TYPE,
                                             Quality_Room ROOM.Quality%TYPE,
                                             Cost_Room   ROOM.cost%TYPE)
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA PHONG CU
    SELECT Count(RoomNo) INTO NumberOfExists
    FROM Room
    WHERE RoomNo = Room_No;
    -- INSERT
    IF(NumberOfExists = 0) THEN
        INSERT INTO Room(RoomNo, TypeOfRoom, Quality, Cost)
        VALUES(Room_No, Type_Room, Quality_Room, Cost_Room);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma phong nay da co');
    END IF;
END;

CREATE OR REPLACE PROCEDURE proc_delete_room(Room_No ROOM.RoomNo%TYPE)
IS
BEGIN
    DELETE FROM Room
    WHERE RoomNo = Room_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;

CREATE OR REPLACE PROCEDURE proc_update_room(RoomNo_Old ROOM.RoomNo%TYPE,
                                             TypeRoom_Update ROOM.TypeOfRoom%TYPE,
                                             QualityRoom_Update ROOM.Quality%TYPE,
                                             Cost_Room_Update   ROOM.cost%TYPE)
IS
BEGIN
    UPDATE Room
    SET TypeOfRoom = TypeRoom_Update, Quality = QualityRoom_Update, Cost = Cost_Room_Update
    WHERE RoomNo = RoomNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: SERVICE                                          */
/*==============================================================*/

CREATE OR REPLACE PROCEDURE proc_insert_service(Ser_No Service.SerNo%TYPE,
                                                Ser_name Service.SerName%TYPE,
                                                TypeService Service.TypeOfService%TYPE,
                                                Cost_Ser Service.Cost%TYPE)
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA TAI KHOAN CU
    SELECT Count(SerNo) INTO NumberOfExists
    FROM Service
    WHERE SerNo = Ser_No;
    -- INSERT
    IF(NumberOfExists = 0) THEN
        INSERT INTO Service(SerNo, SerName, TypeOfService, Cost)
        VALUES(Ser_No, Ser_name, TypeService, Cost_Ser);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma dich vu nay da co');
    END IF;
END;


CREATE OR REPLACE PROCEDURE proc_delete_service(Ser_No Service.SerNo%TYPE)
IS
BEGIN
    DELETE FROM Service
    WHERE SerNo = Ser_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
END;


CREATE OR REPLACE PROCEDURE proc_update_service(SerNo_Old Service.SerNo%TYPE,
                                                SerName_Update Service.SerName%TYPE,
                                                TypeService_Update Service.TypeOfService%TYPE,
                                                Cost_Update Service.Cost%TYPE)
IS
BEGIN
    UPDATE Service
    SET SerName = SerName_Update, TypeOfService = TypeService_Update, Cost = Cost_Update
    WHERE SerNo = SerNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: BELONG                                           */
/*==============================================================*/

CREATE OR REPLACE PROCEDURE proc_insert_belong(Item_No  BELONG.ItemNo%TYPE,
                                               Room_No  BELONG.RoomNo%TYPE)
IS
BEGIN
    INSERT INTO BELONG VALUES(Item_No,Room_No);
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE proc_delete_belong(Item_No  BELONG.ItemNo%TYPE,
                                               Room_No  BELONG.RoomNo%TYPE)
IS
BEGIN
    DELETE FROM BELONG
    WHERE ItemNo = Item_No AND RoomNo = Room_No;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE proc_update_belong(Item_No  BELONG.ItemNo%TYPE,
                                               Room_No  BELONG.RoomNo%TYPE,
                                               Item_new BELONG.ItemNo%TYPE,
                                               Room_New BELONG.RoomNo%TYPE)
IS
BEGIN
    UPDATE BELONG
    SET ItemNo = Item_new, RoomNo = Room_New
    WHERE ItemNo = Item_No AND RoomNo = Room_No;
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: ASSESSROOM                                       */
/*==============================================================*/

CREATE OR REPLACE PROCEDURE proc_insert_assessroom(Point_Room ASSESSROOM.point%TYPE,
                                                   Comment_Room ASSESSROOM."Comment"%TYPE,
                                                   Room_No ASSESSROOM.RoomNo%TYPE,
                                                   Cus_No ASSESSROOM.CusNo%TYPE)
IS
BEGIN
    INSERT INTO ASSESSROOM VALUES(Point_Room, Comment_Room, Room_No, Cus_No);
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE proc_delete_assessroom(Room_No ASSESSROOM.RoomNo%TYPE,
                                                    Cus_No ASSESSROOM.CusNo%TYPE)
IS
BEGIN
    DELETE FROM ASSESSROOM
    WHERE RoomNo = Room_No AND CusNo=Cus_No;
    COMMIT;

END;

CREATE OR REPLACE PROCEDURE proc_update_assessroom(Point_Room ASSESSROOM.point%TYPE,
                                                   Comment_Room ASSESSROOM."Comment"%TYPE,
                                                   Room_No ASSESSROOM.RoomNo%TYPE,
                                                   Cus_No ASSESSROOM.CusNo%TYPE,
                                                   Point_New ASSESSROOM.point%TYPE,
                                                   Comment_New ASSESSROOM."Comment"%TYPE)
IS
BEGIN
    UPDATE ASSESSROOM
    SET Point = Point_New, "Comment" = Comment_New
    WHERE Point = Point_Room AND "Comment" = Comment_Room AND RoomNo = Room_No AND CusNo = Cus_No;
END;


/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: BILL                                           */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE proc_insert_bill(Bill_No BILL.BillNo%TYPE,
                                             Cus_No bill.cusno%TYPE,                                            
                                             Ser_No   bill.serno%TYPE,
                                             Room_No   bill.roomno%TYPE,
                                             Sumofmoney_NEW  bill.sumofmoney%TYPE)
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA bill CU
    SELECT Count(BillNo) INTO NumberOfExists
    FROM BILL
    WHERE BillNo = Bill_No;
    -- INSERT
    IF(NumberOfExists = 0) THEN
        INSERT INTO BILL(BillNo, CusNo,SerNo,RoomNo,SumOfMoney)
        VALUES(Bill_No, Cus_No, Room_No, Room_No,Sumofmoney_NEW);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma phong nay da co');
    END IF;
END;

CREATE OR REPLACE PROCEDURE proc_delete_Bill(Bill_No bill.billno%TYPE)
IS
BEGIN
    DELETE FROM Bill
    WHERE BillNo = Bill_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;

CREATE OR REPLACE PROCEDURE proc_update_Bill(Bill_OLD BILL.BillNo%TYPE,
                                             Cus_upd bill.cusno%TYPE,                                           
                                             Ser_upd   bill.serno%TYPE,
                                             Room_upd   bill.roomno%TYPE,
                                             Sumofmoney_update  bill.sumofmoney%TYPE)
IS
BEGIN
    UPDATE Bill
    SET CusNo=Cus_upd,SerNo=Ser_upd,RoomNo=Room_upd, SumOfMoney = Sumofmoney_update
    WHERE BillNo = Bill_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: EMPLOYEE                                           */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE proc_insert_employee(Emp_No employee.empno%TYPE,
                                             Emp_Name employee.empname%TYPE,                                      
                                             phone_new   employee.phone%TYPE,
                                             Pos_No  employee.posno%TYPE,
                                             dateofBirth_new employee.dateofbirth%TYPE,
                                             genger_new employee.gender%TYPE,
                                             StartDate_new employee.startdate%TYPE,
                                             Email_new employee.email%TYPE,
                                             AccountID_new employee.accountid%TYPE)
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA Employee CU
    SELECT Count(EmpNo) INTO NumberOfExists
    FROM EMPLOYEE
    WHERE EmpNo = Emp_No;
    -- INSERT
    IF(NumberOfExists = 0) THEN
        INSERT INTO Employee(EmpNo, EmpName,phone,PosNo,DateOfBirth,Gender, StartDate,Email,AccountID)
        VALUES(Emp_No, Emp_Name, phone_new, Pos_No,dateofBirth_new,genger_new,StartDate_new,Email_new,AccountID_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma nhan vien nay da co');
    END IF;
END;

CREATE OR REPLACE PROCEDURE proc_delete_Employee(Emp_No employee.empno%TYPE)
IS
BEGIN
    DELETE FROM employee
    WHERE EmpNo = Emp_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;

CREATE OR REPLACE PROCEDURE proc_update_employee(Emp_OLD employee.empno%TYPE,
                                             Emp_Name employee.empname%TYPE,                                      
                                             phone_update   employee.phone%TYPE,
                                             Pos_update  employee.posno%TYPE,
                                             dateofBirth_update employee.dateofbirth%TYPE,
                                             gender_update employee.gender%TYPE,
                                             StartDate_update employee.startdate%TYPE,
                                             Email_update employee.email%TYPE,
                                             AID employee.accountid%TYPE)
IS
BEGIN
    UPDATE Employee
    SET EmpName = Emp_Name, phone = phone_update, PosNo = Pos_update,DateOfBirth = dateofBirth_update,
                            gender=gender_update,StartDate=StartDate_update, Email = Email_update, AccountID = AID
    WHERE EmpNo = Emp_OLD;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: ITEM                                           */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE proc_insert_bill(Item_No item.itemno%TYPE,
                                             ItemName_new item.itemname%TYPE,                                            
                                             NoOfItem_new   item.noofitem%TYPE,
                                             Status_new  item.status%TYPE)
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA ITEM CU
    SELECT Count(ItemNo) INTO NumberOfExists
    FROM ITEM
    WHERE ItemNo = Item_No;
    -- INSERT
    IF(NumberOfExists = 0) THEN
        INSERT INTO ITEM(ItemNo, ItemName,NoOfItem,Status)
        VALUES(Item_No, ItemName_new, NoOfItem_new, Status_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma vat dung nay da co');
    END IF;
END;

CREATE OR REPLACE PROCEDURE proc_delete_item(Item_No item.itemno%TYPE)
IS
BEGIN
    DELETE FROM ITEM
    WHERE ItemNo = Item_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;

CREATE OR REPLACE PROCEDURE proc_update_Item(Item_OLD item.itemno%TYPE,                                           
                                             Item_Name   item.itemname%TYPE,
                                             No_ofItem   item.noofitem%TYPE,
                                             Status_update  item.status%TYPE)
IS
BEGIN
    UPDATE ITEM
    SET ItemName = Item_Name, NoOfItem=No_OfItem, Status=Status_update
    WHERE ItemNo = Item_OLD;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: PAY                                           */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE proc_insert_pay(Bill_No pay.billno%TYPE,
                                             Cus_No pay.cusno%TYPE,                                            
                                             Method_new   pay.method%TYPE,
                                             paymentdate_new  pay.paymentdate%TYPE)
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA PAY CU
    SELECT Count(BillNo) INTO NumberOfExists
    FROM PAY
    WHERE BillNo = Bill_No;
    IF(NumberOfExists = 0) THEN
        INSERT INTO PAY(BillNo, CusNo,Method,PaymentDate)
        VALUES(Bill_No, Cus_No, Method_new, paymentdate_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma bill nay da co');
    END IF;
    
END;

CREATE OR REPLACE PROCEDURE proc_delete_pay(Bill_No pay.billno%TYPE)
IS
BEGIN
    DELETE FROM PAY
    WHERE BillNo = Bill_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;

CREATE OR REPLACE PROCEDURE proc_update_Pay(Bill_OLD pay.billno%TYPE,
                                            Bill_No pay.billno%TYPE,
                                             Cus_No   pay.cusno%TYPE,
                                             Method_upd     pay.method%TYPE,
                                             paymentDate_upd  pay.paymentdate%TYPE)
IS
BEGIN
    UPDATE PAY
    SET BillNo=Bill_No, Method = Method_upd, paymentDate= paymentDate_upd
    WHERE BillNo = Bill_OLD;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: POSITION                                           */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE proc_insert_position(Pos_No position.posno%TYPE,
                                             Pos_Name position.posname%TYPE,                                            
                                             Emp_No position.EmpNo%TYPE)                                             
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA POSITION CU
    SELECT Count(PosNo) INTO NumberOfExists
    FROM POSITION
    WHERE PosNo = Pos_No;
    IF(NumberOfExists = 0) THEN
        INSERT INTO POSITION(PosNo, PosName,EmpNo)
        VALUES(Pos_No,Pos_Name,Emp_No);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma vi tri nay da co');
    END IF;
END;

CREATE OR REPLACE PROCEDURE proc_delete_position(Pos_No position.PosNo%TYPE)
IS
BEGIN
    DELETE FROM POSITION
    WHERE PosNo = Pos_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;

CREATE OR REPLACE PROCEDURE proc_update_Position(Pos_No position.posno%TYPE,                                           
                                             Pos_Name   position.posname%TYPE,
                                             Emp_No      position.empno%TYPE)
IS
BEGIN
    UPDATE POSITION
    SET PosName = Pos_Name, EmpNo= Emp_No
    WHERE PosNo = Pos_No;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: RESERVATION                                           */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE proc_insert_res(Res_No reservation.RESNO%TYPE,
                                             Cus_No reservation.cusno%TYPE, 
                                             Room_No reservation.roomno%TYPE,
                                             ResDate_new reservation.resdate%TYPE,
                                             tCheckIn_new reservation.tcheckin%TYPE,
                                             tCheckOut_new reservation.tcheckout%TYPE)                                             
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA POSITION CU
    SELECT Count(ResNo) INTO NumberOfExists
    FROM RESERVATION
    WHERE ResNo = Res_No;
    IF(NumberOfExists = 0) THEN
        INSERT INTO RESERVATION(ResNo,CusNo,RoomNo,ResDate,tCheckIn,tCheckOut)
        VALUES(Res_No,Cus_No,Room_No,ResDate_new,tCheckIn_new,tCheckOut_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma ðat phong nay da co');
    END IF;
END;

CREATE OR REPLACE PROCEDURE proc_delete_res(Res_No RESERVATION.resno%TYPE)
IS
BEGIN
    DELETE FROM RESERVATION
    WHERE ResNo = Res_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;

CREATE OR REPLACE PROCEDURE proc_update_Res(Res_No reservation.RESNO%TYPE,
                                             Cus_No reservation.cusno%TYPE, 
                                             Room_No reservation.roomno%TYPE,
                                             ResDate_update reservation.resdate%TYPE,
                                             tCheckIn_update reservation.tcheckin%TYPE,
                                             tCheckOut_update reservation.tcheckout%TYPE)
IS
BEGIN
    UPDATE RESERVATION
    SET ResDate = ResDate_update, tCheckIn= tCheckIn_update,tCheckOut=tCheckOut_update
    WHERE ResNo = Res_No;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: SERVICE                                           */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE proc_insert_service(Ser_No service.serno%TYPE,
                                             Ser_Name service.sername%TYPE, 
                                             Typeof_ser service.typeofservice%TYPE,
                                             cost_new service.cost%TYPE)                                                             
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA service CU
    SELECT Count(SerNo) INTO NumberOfExists
    FROM SERVICE
    WHERE SerNo = Ser_No;
    IF(NumberOfExists = 0) THEN
        INSERT INTO SERVICE(SerNo,SerName,Typeofservice,cost)
        VALUES(Ser_No,Ser_Name,Typeof_ser,cost_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma dich vu nay da co');
    END IF;
END;

CREATE OR REPLACE PROCEDURE proc_delete_Ser(Ser_No SERVICE.SERNO%TYPE)
IS
BEGIN
    DELETE FROM SERVICE
    WHERE SerNo = Ser_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;

CREATE OR REPLACE PROCEDURE proc_update_Ser(Ser_No service.serno%TYPE,
                                             Ser_Name service.sername%TYPE, 
                                             Typeofser_upd service.typeofservice%TYPE,
                                             cost_update service.cost%TYPE) 
IS
BEGIN
    UPDATE SERVICE
    SET Typeofservice = Typeofser_upd, cost= cost_update
    WHERE SerNo = Ser_No;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA	                                */
/*      TABLE: ServiceCalled                                           */
/*==============================================================*/
CREATE OR REPLACE PROCEDURE proc_insert_sercall(Ser_No servicecalled.serno%TYPE,
                                             Room_No servicecalled.roomno%TYPE, 
                                             note_new servicecalled.note%TYPE)                                                             
IS
    NumberOfExists NUMBER := 0;
BEGIN
    -- TIM MA SER CU
    SELECT Count(SerNo) INTO NumberOfExists
    FROM SERVICE
    WHERE SerNo = Ser_No;
    IF(NumberOfExists = 0) THEN
        INSERT INTO SERVICECALLED(SerNo,RoomNo,Note)
        VALUES(Ser_No,Room_No,note_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong');
    ELSE
        Raise_Application_Error(-20011, 'Ma dich vu nay da co');
    END IF;
END;

CREATE OR REPLACE PROCEDURE proc_delete_Sercall(Ser_No SERVICE.SERNO%TYPE)
IS
BEGIN
    DELETE FROM SERVICECALLED
    WHERE SerNo = Ser_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
END;

CREATE OR REPLACE PROCEDURE proc_update_Sercall(Ser_OLD servicecalled.serno%TYPE,
                                             Ser_No servicecalled.serno%TYPE,
                                             Room_No servicecalled.roomno%TYPE, 
                                             note_update servicecalled.note%TYPE) 
IS
BEGIN
    UPDATE SERVICECALLED
    SET SerNo=Ser_No, RoomNo=Room_No,Note=note_update
    WHERE SerNo = Ser_OLD;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

