create or replace function RECENTDELIVERY(memberPhoneNum in varchar2) return varchar2 is
  deliveryDetails varchar2(1000);
begin
    SELECT 'DeliveryNum: ' || deliveryNum || ', Status: ' || status || ', DeliveryDate: ' || deliveryDate
    INTO deliveryDetails
    FROM Delivery
    WHERE phoneNum = memberPhoneNum
    ORDER BY deliveryDate DESC
    FETCH FIRST 1 ROW ONLY;
    RETURN deliveryDetails;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No deliveries found for this member.';
    WHEN OTHERS THEN
        RETURN 'An error occurred.';    
  
  return(deliveryDetails);
end RECENTDELIVERY;
/
