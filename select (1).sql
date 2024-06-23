SELECT p.name, d.phoneNum, COUNT(dl.deliveryNum) AS num_deliveries_completed
FROM person p
JOIN driver d ON p.phoneNum = d.phoneNum
JOIN delivery dl ON d.phoneNum = dl.phoneNum
GROUP BY p.name, d.phoneNum;


SELECT phoneNum, AVG(numberOfBabies) AS avg_babies_per_person
FROM birth
GROUP BY phoneNum;





SELECT fd.kashrus AS kashrus_type, COUNT(*) AS num_finished_food_deliveries
FROM fooddelivery fd
JOIN delivery d ON fd.deliveryNum = d.deliveryNum
WHERE d.deliveryFinishedDate IS NOT NULL
GROUP BY fd.kashrus;





SELECT 
    months.month AS month,
    COUNT(delivery.deliveryDate) AS num_deliveries
FROM 
    (
        SELECT 1 AS month FROM DUAL UNION ALL
        SELECT 2 FROM DUAL UNION ALL
        SELECT 3 FROM DUAL UNION ALL
        SELECT 4 FROM DUAL UNION ALL
        SELECT 5 FROM DUAL UNION ALL
        SELECT 6 FROM DUAL UNION ALL
        SELECT 7 FROM DUAL UNION ALL
        SELECT 8 FROM DUAL UNION ALL
        SELECT 9 FROM DUAL UNION ALL
        SELECT 10 FROM DUAL UNION ALL
        SELECT 11 FROM DUAL UNION ALL
        SELECT 12 FROM DUAL
    ) months
LEFT JOIN 
    delivery ON EXTRACT(MONTH FROM delivery.deliveryDate) = months.month
           AND EXTRACT(YEAR FROM delivery.deliveryDate) = 2000
GROUP BY 
    months.month
ORDER BY 
    months.month;



DELETE FROM birth
WHERE phoneNum IN (
    SELECT phoneNum
    FROM birth
    GROUP BY phoneNum
    HAVING AVG(numberOfBabies) >= 5
);

UPDATE driver 
SET vehicle = 'elrctric bicycle'
WHERE vehicle = 'bicycle';
SELECT * FROM DRIVER


