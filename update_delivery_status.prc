CREATE OR REPLACE PROCEDURE update_delivery_status(p_deliveryNum IN NUMBER) IS
    v_status VARCHAR2(20);
BEGIN
    SELECT status
    INTO v_status
    FROM Delivery
    WHERE deliveryNum = p_deliveryNum;


    IF v_status = 'created' THEN
        v_status := 'sent';
    ELSIF v_status = 'sent' THEN
        v_status := 'delivered';
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Invalid status encountered: ' || v_status);
    END IF;


    UPDATE Delivery
    SET status = v_status
    WHERE deliveryNum = p_deliveryNum;

    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No delivery found with the specified delivery number.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END update_delivery_status;
/
