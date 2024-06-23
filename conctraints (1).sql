alter table Fooddelivery drop column typedm 
select typedm from Fooddelivery

alter table driver rename column isavailable to available;
alter table driver rename column available to isavailable;

alter table Birth
      add constraint numer_babies
      check (numberofbabies >= 0 and numberofbabies <= 6);
insert into WILAMOWS.BIRTH (BIRTHID, BIRTDATE, NUMBEROFBABIES, PHONENUM)
values (401, to_date('09-02-2000', 'dd-mm-yyyy'), 8, 1000001600);
