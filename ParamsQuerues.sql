select fd.*
FROM foodDelivery fd
JOIN DELIVERY d ON fd.deliveryNum = d.deliveryNum 
WHERE fd.kashrus = &<name = chosen_kashrus type=string list="SELECT DISTINCT kashrus FROM foodDelivery" hint="Choose kashrus value" required=true>
AND d.deliveryFinishedDate IS NOT NULL;


SELECT * FROM SupplysDelivery
WHERE needsCooling = &<name = cooling_choice type=string list="Yes, No" hint="Choose: whether needs cooling" required=true>;
//example  03/04/2000

SELECT * FROM delivery
WHERE deliveryDate >= &<name = delivery_date type=date>
AND status = &<name = delivery_status type=String list="Sent, deliverd, created" hint="Enter delivery status" required=true>;

SELECT *
FROM birth
WHERE numberOfBabies > &<name = min_babies type=integer hint="Enter minimum number of babies" required=true>;

