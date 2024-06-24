DECLARE
    totalDeliveries NUMBER;
BEGIN
    totalDeliveries := totald ('1000000011');
    DBMS_OUTPUT.PUT_LINE('Total Deliveries: ' || totalDeliveries);

    update_delivery_status('122');
END;
