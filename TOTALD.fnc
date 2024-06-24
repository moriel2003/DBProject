create or replace function TOTALD(Dphonenum in varchar2) return NUMBER is
  t NUMBER :=0;
  cursor deleviery_c IS
         select deliverynum From Delivery WHERE phonenum = Dphonenum;
begin
  FOR delivery_record IN deleviery_c LOOP
    t := t+1;
  END LOOP;  
  
  return t;
end TOTALD;



  
/
