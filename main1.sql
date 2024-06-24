DECLARE
    recentDelivery VARCHAR2(1000);
BEGIN
    recentDelivery := RECENTDELIVERY('0987654321');
    DBMS_OUTPUT.PUT_LINE('Recent Delivery Details: ' || recentDelivery);

    insert_food_delivery('Vegetarian Meal', 'Kosher', 'M', '1234567890');
END;

