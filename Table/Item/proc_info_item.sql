/*==============================================================*/
/*      PROCEDURE: THONG TIN ITEM                        */
/*==============================================================*/
    
CREATE OR REPLACE PROCEDURE Item_Info(ItemNo_IN IN Item.itemno%TYPE,
                                         ItemName_out OUT Item.itemname%TYPE,
                                         NoOfItem_out OUT Item.noofitem%TYPE,
                                         status_out       OUT Item.status%TYPE)
IS BEGIN
    DBMS_OUTPUT.PUT_LINE('Nhap ma item : ' || ItemNo_IN);
    SELECT ItemName, NoOfItem, status INTO ItemName_out, NoOfItem_out, status_out
    FROM ITEM
    WHERE ItemNo = ItemNo_IN; 
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('THAM SO TRUYEN VAO KHONG HOP LE HOAC KHONG CO');
END;

/*==============================================================*/
/*      CHAY PROCEDURE	                                        */
/*==============================================================*/
DECLARE
    ItemNo Item.itemno%TYPE :='I001';
    ItemName Item.itemname%TYPE;
    NoOfItem Item.noofitem%TYPE;
    status   Item.status%TYPE;
    
BEGIN
    Item_Info(ItemNo, ItemName, NoOfItem, status);
    DBMS_OUTPUT.PUT_LINE('Ten san pham: ' || itemname);
    DBMS_OUTPUT.PUT_LINE('So luong san pham: ' || NoOfItem);
    DBMS_OUTPUT.PUT_LINE('Trang thai của san pham : ' || status);
END;
