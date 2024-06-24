CREATE OR REPLACE PROCEDURE insert_food_delivery(
    deliveryNum IN NUMBER,
    mealDescription IN VARCHAR2,
    kashrus IN VARCHAR2,
    T IN CHAR
) 
IS
BEGIN
    INSERT INTO FoodDelivery (mealdescription, kashrus, typedm, deliverynum)
    VALUES (mealDescription, kashrus, T, deliveryNum);
   
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Inserted food delivery record ' || i);
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END insert_food_delivery;
/
