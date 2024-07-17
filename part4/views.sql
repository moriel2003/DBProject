CREATE VIEW department_deliveries AS
SELECT 
    p.name AS person_name, 
    p.city, 
    p.street, 
    d.vehicle, 
    del.deliverynum, 
    del.status, 
    del.deliverydate

FROM 
    PERSON p
JOIN 
    DRIVER d ON p.phonenum = d.phonenum
JOIN 
    DELIVERY del ON d.phonenum = del.phonenum
JOIN 
    FOODDELIVERY f ON del.deliverynum = f.deliverynum;


select * from department_deliveries


SELECT person_name, COUNT(*) AS total_deliveries
FROM department_deliveries
GROUP BY person_name;



SELECT city, COUNT(*) AS delivery_count
FROM department_deliveries
GROUP BY city;








CREATE OR REPLACE VIEW MealCommunityView AS
SELECT 
    M.mealid,
    M.kashrus,
    M.mealdescription,
    M.typedm,
    P.phonenum AS community_member_phone,
    P.name AS community_member_name,
    P.city AS community_member_city,
    P.street AS community_member_street,
    P.zipcode AS community_member_zipcode,
    FD.deliverynum,
    D.status AS delivery_status,
    D.deliverydate
FROM 
    MEAL M
JOIN 
    FOODDELIVERY FD ON M.mealid = FD.mealid
JOIN 
    DELIVERY D ON FD.deliverynum = D.deliverynum
JOIN 
    DRIVER DR ON D.phonenum = DR.phonenum
JOIN 
    PERSON P ON DR.phonenum = P.phonenum;




select * from MealCommunityView




SELECT 
    community_member_name,
    community_member_phone,
    COUNT(mealid) AS meals_delivered
FROM 
    MealCommunityView
GROUP BY 
    community_member_name, community_member_phone
ORDER BY 
    meals_delivered DESC;



SELECT 
    mealdescription,
    COUNT(mealid) AS delivery_count
FROM 
    MealCommunityView
GROUP BY 
    mealdescription
ORDER BY 
    delivery_count DESC
FETCH FIRST 5 ROWS ONLY;


