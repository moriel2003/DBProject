prompt PL/SQL Developer Export Tables for user WILAMOWS@LABDBWIN
prompt Created by moderi on יום ראשון 23 יוני 2024
set feedback off
set define off

prompt Creating PERSON...
create table PERSON
(
  phonenum INTEGER not null,
  name     VARCHAR2(20) not null,
  city     VARCHAR2(20) not null,
  street   VARCHAR2(20) not null,
  zipcode  VARCHAR2(20)
)
;
alter table PERSON
  add primary key (PHONENUM);

prompt Creating DRIVER...
create table DRIVER
(
  vehicle     VARCHAR2(20) not null,
  isavailable VARCHAR2(3) not null,
  phonenum    INTEGER not null
)
;
alter table DRIVER
  add primary key (PHONENUM);
alter table DRIVER
  add foreign key (PHONENUM)
  references PERSON (PHONENUM);

prompt Creating DELIVERY...
create table DELIVERY
(
  deliverynum          INTEGER not null,
  status               VARCHAR2(20),
  deliverydate         DATE not null,
  deliveryfinisheddate DATE,
  phonenum             INTEGER not null
)
;
alter table DELIVERY
  add primary key (DELIVERYNUM);
alter table DELIVERY
  add foreign key (PHONENUM)
  references DRIVER (PHONENUM);

prompt Creating FOODDELIVERY...
create table FOODDELIVERY
(
  mealdescription VARCHAR2(20),
  kashrus         VARCHAR2(20),
  typedm          VARCHAR2(1),
  deliverynum     INTEGER not null
)
;
alter table FOODDELIVERY
  add primary key (DELIVERYNUM);
alter table FOODDELIVERY
  add foreign key (DELIVERYNUM)
  references DELIVERY (DELIVERYNUM);

prompt Creating SUPPLYSDELIVERY...
create table SUPPLYSDELIVERY
(
  needscooling     VARCHAR2(3),
  providerphonenum INTEGER not null,
  provideradress   VARCHAR2(20) not null,
  deliverynum      INTEGER not null
)
;
alter table SUPPLYSDELIVERY
  add primary key (DELIVERYNUM);
alter table SUPPLYSDELIVERY
  add foreign key (DELIVERYNUM)
  references DELIVERY (DELIVERYNUM);

prompt Creating COMMUNITYMEMBER...
create table COMMUNITYMEMBER
(
  phonenum                    INTEGER not null,
  deliverynum                 INTEGER not null,
  deliverynumto               INTEGER not null,
  fooddeliveryfromdeliverynum INTEGER not null
)
;
alter table COMMUNITYMEMBER
  add primary key (PHONENUM);
alter table COMMUNITYMEMBER
  add foreign key (PHONENUM)
  references PERSON (PHONENUM);
alter table COMMUNITYMEMBER
  add foreign key (DELIVERYNUM)
  references SUPPLYSDELIVERY (DELIVERYNUM);
alter table COMMUNITYMEMBER
  add foreign key (DELIVERYNUMTO)
  references FOODDELIVERY (DELIVERYNUM);
alter table COMMUNITYMEMBER
  add foreign key (FOODDELIVERYFROMDELIVERYNUM)
  references FOODDELIVERY (DELIVERYNUM);

prompt Creating BIRTH...
create table BIRTH
(
  birthid        INTEGER not null,
  birtdate       DATE not null,
  numberofbabies INTEGER not null,
  phonenum       INTEGER not null
)
;
alter table BIRTH
  add primary key (BIRTHID);
alter table BIRTH
  add foreign key (PHONENUM)
  references COMMUNITYMEMBER (PHONENUM);
alter table BIRTH
  add constraint NUMER_BABIES
  check (numberofbabies >= 0 and numberofbabies <= 6);

prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for DRIVER...
alter table DRIVER disable all triggers;
prompt Disabling triggers for DELIVERY...
alter table DELIVERY disable all triggers;
prompt Disabling triggers for FOODDELIVERY...
alter table FOODDELIVERY disable all triggers;
prompt Disabling triggers for SUPPLYSDELIVERY...
alter table SUPPLYSDELIVERY disable all triggers;
prompt Disabling triggers for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER disable all triggers;
prompt Disabling triggers for BIRTH...
alter table BIRTH disable all triggers;
prompt Disabling foreign key constraints for DRIVER...
alter table DRIVER disable constraint SYS_C00717522;
prompt Disabling foreign key constraints for DELIVERY...
alter table DELIVERY disable constraint SYS_C00717527;
prompt Disabling foreign key constraints for FOODDELIVERY...
alter table FOODDELIVERY disable constraint SYS_C00717530;
prompt Disabling foreign key constraints for SUPPLYSDELIVERY...
alter table SUPPLYSDELIVERY disable constraint SYS_C00717535;
prompt Disabling foreign key constraints for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER disable constraint SYS_C00717541;
alter table COMMUNITYMEMBER disable constraint SYS_C00717542;
alter table COMMUNITYMEMBER disable constraint SYS_C00717543;
alter table COMMUNITYMEMBER disable constraint SYS_C00717544;
prompt Disabling foreign key constraints for BIRTH...
alter table BIRTH disable constraint SYS_C00717550;
prompt Deleting BIRTH...
delete from BIRTH;
commit;
prompt Deleting COMMUNITYMEMBER...
delete from COMMUNITYMEMBER;
commit;
prompt Deleting SUPPLYSDELIVERY...
delete from SUPPLYSDELIVERY;
commit;
prompt Deleting FOODDELIVERY...
delete from FOODDELIVERY;
commit;
prompt Deleting DELIVERY...
delete from DELIVERY;
commit;
prompt Deleting DRIVER...
delete from DRIVER;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Loading PERSON...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000000, 'Julianna', 'Smyrna', '59 Applegate Drive', '40805');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000001, 'Eric', 'Englewood Cliffs', '39 Woodward Drive', '18033');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000002, 'Marc', 'Hiller?d', '9 Maggie Road', '34215');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000003, 'Dwight', 'Edmonton', '21 Maserada sul Piav', '0S8 7D4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000004, 'Henry', 'Qu?bec', '78 Espoo Drive', '2B7 1H4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000005, 'Ike', 'Barbengo', '39 Reston Drive', '6527');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000006, 'Kelly', 'Leeds', '41 DeLuise Road', '5W9 6Q3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000007, 'Grace', 'Horb', '91st Street', '38942');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000008, 'Laura', 'Kaohsiung', '53 G?vle Street', '38705');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000009, 'Paula', 'Tsu', '686 Sutherland Drive', '3486');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000010, 'Angelina', 'H?ssleholm', '31 Fionnula', '8163');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000011, 'Mira', 'Takamatsu', '10 Echirolles Street', '32894');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000012, 'Dean', 'Kreuzau', '250 Wiedlin Ave', '10560');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000013, 'Loren', 'Reading', '50 Diesel Street', '3K2 3X1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000014, 'Gerald', 'Exeter', '34 Deschanel Road', '15610');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000015, 'Orlando', 'Uden', '84 Flanery Street', '9541NC');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000016, 'Thin', 'Itu', '29 Northam Road', '11741');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000017, 'Simon', 'Kaiserslautern', '855 Trace Street', '11044');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000018, 'Richard', 'Lefkosa', '36 Koteas Street', '3369');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000019, 'Balthazar', 'Belo Horizonte', '76 Stoneham Road', '17189');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000020, 'Sandra', 'Ringwood', '58 Reeves Street', '9259');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000021, 'Jack', 'Sursee', '29 Plummer Ave', '36573');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000022, 'Kate', 'Barnegat', '293 Aimee Drive', '2368');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000023, 'Joely', 'Caguas', '28 Bollensen Road', '14167');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000024, 'Donal', 'Telford', '83 Mills Drive', '7V7 6G8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000025, 'Edie', 'Bartlesville', '99 Madsen Drive', '29795');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000026, 'Celia', 'Pa?o de Arcos', '18 Keen Street', '24322');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000027, 'Gilberto', 'Lefkosa', '39 Solon Road', '28356');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000028, 'Gil', 'Oldham', '61 Cate', '8F4 3S9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000029, 'Sara', 'Fort Lee', '55 Spall Street', '22576');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000030, 'Dom', 'Pomona', '84 Popper Ave', '27515');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000031, 'Terry', 'Norderstedt', '67 Farrow Road', '23784');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000032, 'Sal', 'Paris', '257 Maxwell Road', '31458');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000033, 'Tracy', 'Amsterdam', '50 Donelly Road', '1510OH');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000034, 'Quentin', 'Berkeley', '5 Saucedo Road', '35649');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000035, 'Vivica', 'Fair Lawn', '604 Franklin Street', '1343');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000036, 'Gil', 'New Delhi', '61 Fogerty Ave', '8947');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000037, 'Gerald', 'West Launceston', '2 Hagar Road', '5283');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000038, 'Goldie', 'Canal Winchester', '20 McFadden Street', '25489');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000039, 'Allison', 'Oldham', '397 Stephanie', '2V9 0P5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000040, 'Gin', 'Dietikon', '35 Edmunds Road', '13051');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000041, 'Steven', 'Ithaca', '56 Leelee Road', '16496');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000042, 'Kyle', 'Thame', '500 Langella Ave', '1L1 2A7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000043, 'Campbell', 'Columbus', '72nd Street', '28017');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000044, 'Marina', 'Atlanta', '76 Colon Drive', '2436');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000045, 'Xander', 'Naha', '68 Thomas Blvd', '23366');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000046, 'Bo', 'Niigata', '99 Daryl Road', '29922');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000047, 'Neil', 'Saitama', '85 Richmond Hill Str', '34084');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000048, 'Ramsey', 'Hohenfels', '600 Derrick Street', '27749');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000049, 'Russell', 'Sursee', '40 Ossie Street', '28558');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000050, 'Rosanne', 'Hong Kong', '22 Cate Drive', '8329');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000051, 'Patrick', 'Osaka', '27 Arjona Road', '38001');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000052, 'Jay', 'Qu?bec', '29 Perth Road', '1S3 5E7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000053, 'Rich', 'Trumbull', '3 Minogue Ave', '31035');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000054, 'Chuck', 'Biel', '45 Boucherville Blvd', '10112');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000055, 'Harry', 'Dubai', '22 Rankin Road', '18315');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000056, 'Janeane', 'Ismaning', '40 Isaac Ave', '25032');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000057, 'George', 'Dardilly', '750 Lemmon Street', '28179');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000058, 'Luke', 'Oppenheim', '97 Foley Street', '26009');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000059, 'Jonny', 'Westfield', '82 Kasey Ave', '26115');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000060, 'Hope', 'Barueri', '42nd Street', '24618');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000061, 'Lou', 'Los Alamos', '12 Rydell Drive', '22558');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000062, 'Chrissie', 'Durham', '81st Street', '25958');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000063, 'Crystal', 'Seongnam-si', '17 Weston', '13595');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000064, 'Merrill', 'Middletown', '22 Nunn Road', '9337');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000065, 'Demi', 'Neuquen', '92 Vega Road', '40339');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000066, 'Alec', 'Tyne & Wear', '77 Marie', '2S4 1D2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000067, 'Shawn', 'Marietta', '45 Reeves Street', '10674');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000068, 'Andrea', 'Jerusalem', '52 Gore Street', '9752');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000069, 'Tony', 'Santa Fe', '71st Street', '18392');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000070, 'Javon', 'New Hope', '99 Mechelen Drive', '15145');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000071, 'Rod', 'Bay Shore', '23 Conway Street', '1773');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000072, 'Rosario', 'durham', '73 Rudd Ave', '9S5 6Z9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000073, 'Ivan', 'Murray', '64 Stormare Blvd', '1733');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000074, 'Mykelti', 'Kansas City', '60 Beatty Road', '25294');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000075, 'Leon', 'Eindhoven', '88 Maidenhead Drive', '2716PK');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000076, 'Cate', 'T?by', '62nd Street', '23114');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000077, 'Tori', 'South Hadley', '1 Charlton Road', '32005');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000078, 'Emily', 'Mogi Guacu', '90 Visselh?vede Stre', '33943');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000079, 'Lila', 'Treviso', '27 Liquid Road', '40137');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000080, 'CeCe', 'Mt. Laurel', '54 Meniketti Road', '39356');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000081, 'Vince', 'Lublin', '286 McDiarmid Road', '27152');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000082, 'Collin', 'Coquitlam', '688 Vance Street', '8X3 6T0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000083, 'Gwyneth', 'Nagasaki', '57 Rueben Street', '16689');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000084, 'Rosanna', 'Steyr', '67 Furay Blvd', '39898');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000085, 'Kim', 'Norderstedt', '19 Rickie Road', '36262');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000086, 'Curtis', 'Durban', '82 Waalwijk Ave', '12329');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000087, 'Dean', 'Ashdod', '2 Jesus Road', '30809');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000088, 'Kenneth', 'Sapporo', '27 Geldof Ave', '16419');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000089, 'Angie', 'Anchorage', '59 Hall Street', '8868');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000090, 'Julie', 'Arlington', '892 Brisbane Street', '1613');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000091, 'Kyra', 'Magstadt', '62 Shepherd Drive', '30231');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000092, 'Colm', 'Karachi', '97 urban Street', '9750');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000093, 'Keanu', 'Olympia', '11 Pusan-city Drive', '10913');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000094, 'Claude', 'Lecanto', '45 Nicks Road', '16368');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000095, 'Daryl', 'Gliwice', '63 Gaby Drive', '17271');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000096, 'Hugh', 'Horsham', '98 Copeland', '8R9 6D7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000097, 'Ramsey', 'Glen allen', '23rd Street', '2850');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000098, 'Gladys', 'Schaumburg', '88 Flemyng Road', '25725');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000099, 'Crystal', 'Englewood', '59 Cheech Blvd', '29564');
commit;
prompt 100 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000100, 'Pamela', 'Charlotte', '34 Adkins Blvd', '37548');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000101, 'Taye', 'Vallauris', '46 Warwick Road', '16934');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000102, 'Desmond', 'Coimbra', '58 Gordon Drive', '4170');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000103, 'Mitchell', 'Rothenburg', '4 Mechanicsburg Road', '35935');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000104, 'Catherine', 'Springville', '27 Tottori Drive', '19381');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000105, 'King', 'Curitiba', '40 Mathis Blvd', '38636');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000106, 'Mika', 'Nashua', '186 Herzogenrath Dri', '24337');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000107, 'Samantha', 'St. Louis', '913 Simpson Ave', '26307');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000108, 'Richard', 'Trento', '31st Street', '28020');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000109, 'Dom', 'Charlotte', '64 Ali Ave', '9835');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000110, 'Gaby', 'Sulzbach', '49 Claude Road', '4680');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000111, 'Rod', 'Vallauris', '91 Hines', '28199');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000112, 'Kid', 'Thame', '69 Renee Street', '1Q8 5D7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000113, 'Freddie', 'Pearland', '99 Bartlett Road', '12910');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000114, 'Bernie', 'Goslar', '78 Sobieski Road', '24954');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000115, 'Earl', 'Gainesville', '75 Jeff Street', '13878');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000116, 'Shannon', 'Milton', '208 Clayton', '38285');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000117, 'Maureen', 'North Yorkshire', '83 Evans Road', '9H6 8T4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000118, 'Chazz', 'Kungens kurva', '100 Annandale Road', '23917');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000119, 'Johnette', 'Mountain View', '12 Trace Ave', '22708');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000120, 'Jaime', 'North Point', '46 Finney Road', '32008');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000121, 'Kyle', 'Kagoshima', '961 Swarthmore Road', '28661');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000122, 'Phoebe', 'New Fairfield', '13 Sharp Road', '18036');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000123, 'Cyndi', 'Coventry', '74 Matthau Blvd', '1Q4 3L6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000124, 'Sally', 'Vanderbijlpark', '37 Denver Drive', '13794');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000125, 'Ricky', 'Maidstone', '69 Huntington Blvd', '2Y3 2U8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000126, 'Etta', 'Oldwick', '93 Witt Street', '17324');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000127, 'Hilary', 'Tilburg', '31 Morales Blvd', '9426JN');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000128, 'Lydia', 'Paal Beringen', '51st Street', '30972');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000129, 'Annette', 'Augst', '98 Moe Road', '17569');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000130, 'Candice', 'Burlington', '2 Saudarkrokur Road', '8K3 9J5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000131, 'Ellen', 'Sparrows Point', '43rd Street', '16167');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000132, 'Rick', 'Toulouse', '8 League city Street', '28225');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000133, 'Ali', 'Middleburg Heights', '265 Cherepovets Driv', '21922');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000134, 'Humberto', 'West Launceston', '72 Stigers Street', '4860');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000135, 'Rhea', 'Biella', '415 Kier Street', '9421');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000136, 'Billy', 'Issaquah', '84 Saxon Road', '3465');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000137, 'Al', 'San Francisco', '519 Rosario Ave', '5177');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000138, 'Kevn', 'Sugar Land', '554 Santa Rosa Drive', '39639');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000139, 'Lara', 'Oosterhout', '14 Roberts Drive', '3789GL');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000140, 'Gloria', 'Stoneham', '64 Tippe Street', '17518');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000141, 'Tori', 'Lima', '31 Guadalajara Stree', '5690');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000142, 'Connie', 'Di Savigliano', '30 Brooke Street', '20844');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000143, 'Alfie', 'Hong Kong', '66 France Street', '31815');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000144, 'Sonny', 'Bischofshofen', '30 Giovanni Drive', '19509');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000145, 'Hank', 'Brisbane', '65 Scottsdale Road', '36510');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000146, 'Lauren', 'Karachi', '50 Nanaimo Street', '31070');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000147, 'Hazel', 'Stony Point', '70 Chirignago Blvd', '25341');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000148, 'Dionne', 'Ft. Leavenworth', '90 Cetera Street', '2591');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000149, 'Famke', 'Mogliano Veneto', '11 Conners Street', '40046');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000150, 'Breckin', 'Hounslow', '71 Cartlidge Drive', '9F5 8M2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000151, 'Christmas', 'Ipswich', '68 Lewis Street', '2A6 0L5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000152, 'Art', 'Pulheim-brauweiler', '99 Adams Road', '38178');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000153, 'Norm', 'K?ln', '56 Ruffalo', '26140');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000154, 'Robert', 'Bay Shore', '40 Leslie', '11042');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000155, 'Carolyn', 'Drogenbos', '8 Bruneck Ave', '15983');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000156, 'Gavin', 'Chiba', '27 Bergara Street', '26290');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000157, 'Barry', 'Luedenscheid', '44 Logue Road', '39777');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000158, 'Bob', 'Vilafranca Penedes', '95 Dickinson Street', '12124');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000159, 'Merle', 'Tadley', '25 Ponce', '0F5 4S0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000160, 'Beverley', 'Thalwil', '18 Quinlan Road', '1645');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000161, 'Tilda', 'Roanoke', '90 Richie Road', '39910');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000162, 'Nicholas', 'L''union', '39 Kotto Road', '37053');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000163, 'Debby', 'Tilburg', '99 Bebe Street', '6097QX');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000164, 'Howie', 'Macau', '47 Winnipeg Blvd', '3010');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000165, 'Jann', 'Dublin', '34 MacPherson Road', '11275');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000166, 'Junior', 'Enfield', '62 Worrell Drive', '5G9 1O4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000167, 'Frederic', 'Englewood Cliffs', '78 Lynette Street', '15630');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000168, 'Kristin', 'Haverhill', '21 Seth Street', '0K1 7Q0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000169, 'Marlon', 'Butner', '93 Carlene Drive', '29014');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000170, 'Meg', 'Maryville', '59 Abbotsford Street', '36083');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000171, 'April', 'Houston', '33 Hope Street', '38407');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000172, 'Powers', 'Pomona', '26 Cedar Rapids Road', '40765');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000173, 'Brent', 'Campana', '98 Larnelle Street', '28183');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000174, 'Amanda', 'Fort worth', '5 Koufu Road', '36370');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000175, 'Ricardo', 'K?ln', '95 Vance Drive', '40325');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000176, 'Oro', 'Brisbane', '52nd Street', '35285');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000177, 'Daniel', 'Pompeia', '537 Irati Road', '9575');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000178, 'Grace', 'Calcutta', '52 Mantegna Blvd', '26594');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000179, 'Thin', 'Moreno Valley', '10 Hannover Ave', '33910');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000180, 'Randall', 'Helsinki', '810 Judd Ave', '36613');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000181, 'Cyndi', 'Yamaguchi', '97 Garza Street', '38592');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000182, 'Phil', 'Glasgow', '53 Sugar Hill Street', '3D1 3H5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000183, 'Loretta', 'Bedford', '91 Folds Road', '16023');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000184, 'Mekhi', 'Edison', '6 MacLachlan Road', '6779');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000185, 'Winona', 'Houston', '35 CeCe Ave', '22655');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000186, 'Robbie', 'Eschborn', '88 Mahood', '3198');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000187, 'Kenny', 'Braintree', '76 Randal Road', '2J6 2W9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000188, 'Pamela', 'Dearborn', '13 Cole Road', '39486');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000189, 'Gabriel', 'Mobile', '728 Colin Street', '15989');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000190, 'Ricky', 'Shizuoka', '310 Francis Drive', '6730');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000191, 'Gladys', 'Gennevilliers', '393 Dreieich Ave', '10056');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000192, 'Hilary', 'Lexington', '59 Richmond Hill Roa', '19362');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000193, 'Lila', 'Johor Bahru', '92nd Street', '26661');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000194, 'Vanessa', 'Bozeman', '66 Whitehouse Statio', '33592');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000195, 'LeVar', 'Heiligenhaus', '539 Goldie Drive', '38192');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000196, 'Murray', 'Jerusalem', '65 Mason Road', '36596');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000197, 'Gates', 'Szazhalombatta', '15 Stuart Road', '21683');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000198, 'Mira', 'Oak park', '27 Bobby', '27164');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000199, 'Diane', 'Pasadena', '73 O''Keefe Drive', '8250');
commit;
prompt 200 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000200, 'Sinead', 'Zafferana Etnea', '185 Pierce Road', '3884');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000201, 'Lisa', 'Maserada sul Piave', '23 Doncaster Ave', '37256');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000202, 'Lydia', 'Utrecht', '67 Edmunds Blvd', '1928WQ');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000203, 'Ritchie', 'Magstadt', '30 Ossie Road', '39236');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000204, 'Louise', 'Sevilla', '39 Mahoney Road', '16981');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000205, 'Cheryl', 'Chapel hill', '868 Hikaru Road', '2894');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000206, 'Franco', 'Seattle', '83 Rachael Road', '1192');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000207, 'Reese', 'Protvino', '585 Laurel Road', '8529');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000208, 'Howie', 'Milsons Point', '69 de Lancie Street', '2368');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000209, 'Edwin', 'Scottsdale', '17 Underwood Street', '38668');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000210, 'Leonardo', 'Powell River', '8 Stallone Drive', '9A0 9S1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000211, 'Kieran', 'St Kilda', '24 Cloris Road', '36014');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000212, 'Graham', 'El Segundo', '31 Wayans', '32440');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000213, 'Kenneth', 'Oberwangen', '8 Ving', '17824');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000214, 'James', 'Gennevilliers', '65 Williamson Drive', '30274');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000215, 'Nastassja', 'San Ramon', '100 Rankin Street', '10839');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000216, 'Rolando', 'Bad Oeynhausen', '31 Kimberly Drive', '18795');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000217, 'Campbell', 'Mason', '33 Roberta Drive', '17800');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000218, 'Roberta', 'Ringwood', '27 Crouse Street', '23448');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000219, 'Roger', 'Bracknell', '18 Harvey Street', '3G5 8P4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000220, 'Jet', 'Singapore', '84 Conley Street', '22822');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000221, 'Gerald', 'Billund', '77 Sedgwick Road', '31405');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000222, 'Ving', 'Canal Winchester', '54 Knight Blvd', '24124');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000223, 'Austin', 'Springfield', '47 Albany Street', '1144');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000224, 'Lennie', 'Sutton', '80 Shaw Road', '6685');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000225, 'Mos', 'Flushing', '78 Rita Street', '27254');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000226, 'Nils', 'Smyrna', '28 Mandrell Ave', '30868');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000227, 'Nils', 'Tokyo', '6 Klugh Drive', '39899');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000228, 'Leslie', 'Cherepovets', '35 Lindo', '20112');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000229, 'Bernard', 'Forest Park', '88 Schwarzenegger Bl', '13219');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000230, 'Sona', 'Pearland', '83 Harary Ave', '3095');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000231, 'Jennifer', 'Rozenburg', '52 Meniketti Drive', '5339BG');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000232, 'Alfred', 'Copenhagen', '134 Crowe Drive', '3483');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000233, 'Donal', 'Duluth', '48 Oberwangen Blvd', '29928');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000234, 'Collective', 'Glen allen', '401 Firenze Drive', '18543');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000235, 'Wayne', 'Monterey', '87 Charlton Street', '19890');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000236, 'Noah', 'Birmingham', '68 Furay Drive', '2G3 5N5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000237, 'Night', 'Antwerpen', '58 Ice Street', '2832');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000238, 'Todd', 'Calcutta', '30 Red Road', '40394');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000239, 'Clint', 'Crete', '54 Sydney Drive', '20206');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000240, 'Trey', 'Valencia', '603 Fats Street', '12266');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000241, 'Ike', 'Itu', '4 Alexandria Ave', '24509');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000242, 'Holland', 'Pacific Grove', '94 Pablo Drive', '33477');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000243, 'King', 'Fairbanks', '28 Wakeling Road', '14358');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000244, 'Martin', 'San Ramon', '26 Biel Blvd', '30878');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000245, 'Harvey', 'Yavne', '20 Curtis Street', '1008');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000246, 'Alannah', 'Yamaguchi', '11st Street', '19274');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000247, 'Oliver', 'Kagoshima', '20 Raye Road', '31729');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000248, 'Giancarlo', 'Parma', '12nd Street', '32372');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000249, 'Roddy', 'Bielefeld', '96 Michael Blvd', '17757');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000250, 'Jude', 'Mogi Guacu', '28 Winans Road', '32949');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000251, 'Forest', 'Paderborn', '22nd Street', '4539');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000252, 'Cloris', 'Eisenh?ttenstadt', '70 Mewes Street', '11924');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000253, 'Bill', 'Portland', '10 Baranski Street', '28593');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000254, 'Juliana', 'Kerava', '6 Sartain Street', '8461');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000255, 'Andy', 'Helsinki', '20 Sandler Street', '5111');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000256, 'Eliza', 'Research Triangle', '35 Rydell Road', '15259');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000257, 'Vin', 'Eschborn', '449 Vilafranca Pened', '35173');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000258, 'Cameron', 'Lubbock', '908 Peabo Street', '28032');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000259, 'Will', 'Kwun Tong', '36 Saucedo Drive', '33173');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000260, 'France', 'Belp', '46 Dennis Road', '33009');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000261, 'Beverley', 'Monument', '55 Hong Road', '29424');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000262, 'Angie', 'Fort Lee', '27 Oshawa', '16437');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000263, 'Treat', 'Karlstad', '47 Bethesda', '36547');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000264, 'Gordon', 'Middleburg Heights', '239 Madeline Drive', '3945');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000265, 'Bob', 'Lake Bluff', '15 Cherry Blvd', '32997');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000266, 'Mindy', 'Arlington', '43 Kozani Road', '21311');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000267, 'William', 'Vancouver', '33rd Street', '4G6 9Q8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000268, 'Wendy', 'Ponta grossa', '88 Lindo Street', '36564');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000269, 'Franz', 'Pacific Grove', '14 North Point Blvd', '15749');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000270, 'Anne', 'Redwood City', '65 Feliciano', '8210');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000271, 'Loretta', 'Spresiano', '86 Elizondo Drive', '28369');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000272, 'Sheena', 'Brisbane', '202 Deschanel Road', '28759');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000273, 'Delbert', 'Pearland', '861 Mexico City Stre', '34649');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000274, 'Kurt', 'Grand-mere', '100 Ellicott City St', '8F6 3M1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000275, 'Nicole', 'Scottsdale', '43 Goldblum Street', '17431');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000276, 'Susan', 'Oak Park', '31 Warren Road', '7842');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000277, 'Holland', 'Kungki', '85 Shatner Road', '30439');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000278, 'Melanie', 'Tucson', '71 L''union Road', '9949');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000279, 'Sam', 'Carlingford', '53 Etta', '1039');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000280, 'Arturo', 'New boston', '98 Powell River Stre', '2633');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000281, 'Don', 'Shoreline', '33 Diggs Road', '9404');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000282, 'Cornell', 'Chambery', '41 Green bay Street', '21940');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000283, 'Joely', 'Chicago', '88 Zahn Drive', '1190');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000284, 'Miko', 'Fairbanks', '87 Witt Road', '2142');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000285, 'Mindy', 'Heubach', '35 Burton Road', '16448');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000286, 'Rip', 'Bolton', '1 Wen Blvd', '2H2 2J8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000287, 'Vince', 'Tours', '41 Richard Road', '34032');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000288, 'Benjamin', 'Santana do parna?ba', '303 Gambon Road', '27805');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000289, 'Isaiah', 'Cedar Rapids', '70 Gettysburg Blvd', '6898');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000290, 'Mark', 'Mechelen', '458 McGoohan Blvd', '31831');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000291, 'Eliza', 'Lake Oswego', '41 Kimberly', '24404');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000292, 'Taylor', 'Burlington', '92 Ronny Road', '4842');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000293, 'Etta', 'Angers', '14 Terri Blvd', '14860');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000294, 'Ricardo', 'Casselberry', '87 Osmond Street', '11178');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000295, 'Guy', 'West Lafayette', '333 Driver Blvd', '29108');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000296, 'Joaquim', 'Houma', '43 Emmylou Road', '10830');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000297, 'Vienna', 'Oldham', '6 Billund Road', '4Y4 6J5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000298, 'Campbell', 'East Providence', '32 Moss Street', '27233');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000299, 'Corey', 'Fukui', '87 Larenz Road', '24353');
commit;
prompt 300 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000300, 'Pelvic', 'Frederiksberg', '40 Ving Road', '37807');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000301, 'Armin', 'Augsburg', '15 Alexander Street', '13047');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000302, 'Forest', 'Bruneck', '91 Taryn Street', '17484');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000303, 'Dick', 'West Launceston', '244 Lynette Blvd', '17617');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000304, 'Davey', 'New Fairfield', '49 Ferry Blvd', '7923');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000305, 'Vanessa', 'S?o paulo', '512 McGovern Drive', '33375');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000306, 'Lennie', 'Immenstaad', '89 Bacon Road', '10256');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000307, 'Jody', 'Silver Spring', '48 Oak Park Drive', '26512');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000308, 'Heath', 'Fort Saskatchewan', '23 Seattle Ave', '0I2 6E5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000309, 'Vern', 'Suffern', '90 Cleese Ave', '17389');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000310, 'Ricky', 'Raleigh', '33rd Street', '36037');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000311, 'Ice', 'Wakayama', '89 Joshua Street', '8678');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000312, 'Charles', 'Aracruz', '86 Sainte-Marie', '21661');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000313, 'Walter', 'El Dorado Hills', '50 Fiorentino Ave', '4430');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000314, 'Chris', 'Mt. Laurel', '29 Rivers Drive', '12109');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000315, 'Night', 'Radovljica', '15 Lowell Blvd', '29344');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000316, 'Ernest', 'New Fairfield', '49 Percy Road', '40156');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000317, 'Emm', 'Pulheim-brauweiler', '97 Dorry Road', '3490');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000318, 'Stellan', 'Yucca', '42 Coverdale Street', '6970');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000319, 'Dorry', 'Tucson', '336 Nolte Road', '3950');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000320, 'Joshua', 'Takamatsu', '43 Camp', '15730');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000321, 'Davis', 'Hercules', '49 Sandler', '26710');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000322, 'Chris', 'Augsburg', '59 Neill Street', '18256');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000323, 'Louise', 'Zafferana Etnea', '72 El Paso Drive', '36491');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000324, 'Gary', 'Storrington', '72 Wang Road', '8K9 5W9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000325, 'Selma', 'Princeton', '44 Vista Road', '40300');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000326, 'Shirley', 'Kreuzau', '124 Monterrey Drive', '29792');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000327, 'Suzi', 'Fairbanks', '119 Bassett', '9527');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000328, 'Daryl', 'Nanaimo', '3 Houston Road', '1L1 3T9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000329, 'Rachel', 'Torino', '44 Wayne Street', '22369');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000330, 'Milla', 'Th?rishaus', '599 Niven Road', '25422');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000331, 'Donal', 'Germantown', '85 Peniston Road', '1922');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000332, 'Stephen', 'Bellevue', '27 Hall', '10459');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000333, 'Stewart', 'South Hadley', '75 Orlando Drive', '23432');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000334, 'Nigel', 'Waalwijk', '30 Mould Blvd', '9816AM');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000335, 'Austin', 'Oyten', '70 Burke Drive', '21148');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000336, 'Stewart', 'Naha', '72 Bradenton Road', '25682');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000337, 'France', 'Fort worth', '76 Burrows', '19866');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000338, 'Hope', 'Gelsenkirchen', '28 Mortensen Blvd', '11330');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000339, 'Swoosie', 'Suberg', '61 Orlando Road', '9248');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000340, 'Molly', 'Lexington', '7 Morales Drive', '27090');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000341, 'Brent', 'High Wycombe', '65 Fleet Street', '3S9 3E2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000342, 'Brittany', 'Freiburg', '75 Yucca Street', '7842');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000343, 'Christine', 'Lubbock', '55 Bolzano', '20345');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000344, 'Cary', 'Meppel', '10 Caine Blvd', '7935BJ');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000345, 'Anjelica', 'Bracknell', '52nd Street', '0P6 4X1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000346, 'Queen', 'Billerica', '331 Puckett Road', '30311');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000347, 'Domingo', 'Nizhnevartovsk', '75 Benoit', '16340');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000348, 'Hilary', 'Market Harborough', '145 Steagall Road', '0F5 3U5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000349, 'Franco', 'Boulder', '100 Dunst Street', '1043');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000350, 'Lou', 'North Yorkshire', '712 Koyana Road', '8U0 3U1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000351, 'Beverley', 'Milwaukee', '712 Kilmer Road', '37142');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000352, 'Lesley', 'Netanya', '669 Ruffalo Drive', '7023');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000353, 'Stockard', 'North Point', '61 Clint Street', '6845');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000354, 'Winona', 'Bozeman', '246 Emmett Ave', '39656');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000355, 'Mae', 'Herdecke', '92 Depp Street', '35873');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000356, 'Kyra', 'Kuraby', '77 West Sussex Drive', '23618');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000357, 'Rebecca', 'Bloomington', '45 Elizabeth Street', '13814');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000358, 'Coley', 'Suwon', '61st Street', '17490');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000359, 'Vince', 'Nyn?shamn', '79 Pulheim-brauweile', '32034');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000360, 'Karon', 'Montr?al', '83 Beck Drive', '3O6 3S2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000361, 'Amy', 'Irving', '76 O''Neill Road', '9684');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000362, 'Heath', 'Bountiful', '337 Liev', '10888');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000363, 'Hilary', 'Braintree', '25 Palminteri', '8N2 5Q7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000364, 'Maria', 'Bergara', '70 Danny Street', '24141');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000365, 'Doug', 'Nizhnevartovsk', '307 Donelly Street', '26929');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000366, 'Natasha', 'Mount Laurel', '355 Nicks Street', '1374');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000367, 'Ned', 'Fort McMurray', '73 Jolie Road', '6Q4 2A3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000368, 'Winona', 'Indianapolis', '100 Ranger', '5564');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000369, 'Brittany', 'Paraju', '48 Media Ave', '32123');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000370, 'Marty', 'Ben-Gurion', '92 Meppel Ave', '38678');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000371, 'Lionel', 'Northampton', '87 Fiorentino Road', '2X0 9H8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000372, 'Steve', 'Brookfield', '75 Peebles Drive', '6806');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000373, 'Delbert', 'Claymont', '35 Valencia', '37420');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000374, 'Wendy', 'North bethesda', '364 Don', '20837');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000375, 'Avril', 'Hjallerup', '25 Himmelman Road', '8645');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000376, 'Lily', 'Victoria', '41 Fogerty Street', '2F1 0N9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000377, 'Mike', 'Oslo', '79 Butler Drive', '13948');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000378, 'Elisabeth', 'Guelph', '61st Street', '0F1 1R1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000379, 'Amy', 'Buenos Aires', '32 Bret Drive', '18038');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000380, 'Malcolm', 'Dardilly', '87 Paul Road', '35710');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000381, 'Victor', 'Limeira', '99 Research Triangle', '30707');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000382, 'Arturo', 'Biel', '59 Carol Street', '9590');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000383, 'Carla', 'Fort Collins', '9 Gennevilliers Road', '18859');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000384, 'Barry', 'Spring Valley', '80 Condition', '8695');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000385, 'April', 'Velizy Villacoublay', '852 K?ln Road', '1712');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000386, 'Shelby', 'Santa rita sapuca?', '42 Zappacosta Street', '25203');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000387, 'Dianne', 'Bingham Farms', '54 Adler Street', '14787');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000388, 'Loretta', 'Waalwijk', '780 Redwood City Roa', '4332VI');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000389, 'Balthazar', 'Nyn?shamn', '42 Keener Road', '15877');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000390, 'Joaquim', 'Rtp', '57 Arjona Street', '37735');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000391, 'Tom', 'Lodi', '83 Tisdale Drive', '13553');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000392, 'Crispin', 'Friedrichshafe', '16 Keaton Blvd', '39129');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000393, 'Dwight', 'Steyr', '243 McGovern Street', '11060');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000394, 'Alfie', 'Tokyo', '651 Bekescsaba Road', '14134');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000395, 'Sarah', 'Akron', '87 Rhys-Davies', '28256');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000396, 'Rory', 'Schenectady', '29 Angelina Blvd', '1281');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000397, 'LeVar', 'Ohita', '45 Elle Drive', '2943');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000398, 'Timothy', 'Park Ridge', '85 Hounslow Drive', '10922');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000399, 'Claude', 'Oberwangen', '38 Tarantino Ave', '17800');
commit;
prompt 400 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000400, 'Geoffrey', 'Leeds', '58 Cox Blvd', '3Z5 5Z8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000401, 'Woody', 'Lisboa', '22nd Street', '11577');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000402, 'Jose', 'Austin', '70 Lithgow Road', '6927');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000403, 'Shelby', 'Shizuoka', '98 Fair Lawn Road', '16234');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000404, 'Amy', 'Hohenfels', '704 Pelvic Street', '19530');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000405, 'Beverley', 'Omaha', '87 Dave Street', '26508');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000406, 'Christmas', 'Rancho Palos Verdes', '95 Derrick', '23688');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000407, 'Whoopi', 'Parsippany', '82 Reiner Drive', '30338');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000408, 'Kid', 'Eschborn', '415 Prague Drive', '10986');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000409, 'Mos', 'The Woodlands', '24 Jerry Street', '32868');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000410, 'Annie', 'League city', '732 Harrison', '36774');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000411, 'Loretta', 'Fairborn', '39 Short Street', '17570');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000412, 'Terrence', 'Peine', '76 New Delhi Street', '16155');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000413, 'Edwin', 'Zurich', '4 Art Road', '35017');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000414, 'Dan', 'Columbus', '558 Sylvester Drive', '6371');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000415, 'Lila', 'Hackensack', '62nd Street', '5637');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000416, 'Nathan', 'Belp', '100 Roddy Ave', '33952');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000417, 'Kirsten', 'Oslo', '99 Carlyle Street', '21514');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000418, 'Tracy', 'Eden prairie', '34 Helsinki Road', '20004');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000419, 'Catherine', 'Gersthofen', '42nd Street', '40708');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000420, 'Julio', 'Chinnor', '19 Dench Street', '4F0 9O9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000421, 'Ramsey', 'Sugar Land', '76 Wakeling Drive', '39031');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000422, 'France', 'Adelaide', '6 Abraham Road', '6731');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000423, 'Forest', 'Milpitas', '80 Olyphant Road', '14790');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000424, 'Liquid', 'New Castle', '27 Burr Ridge', '9557');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000425, 'Hikaru', 'Anyang-si', '55 Jackie Blvd', '32541');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000426, 'Andre', 'Kansas City', '71 Quinlan Road', '8152');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000427, 'Forest', 'Louisville', '58 Red Street', '24603');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000428, 'Mekhi', 'Olympia', '27 Chappelle Blvd', '26890');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000429, 'Rosie', 'Grand-mere', '83rd Street', '4O6 5I4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000430, 'Kirsten', 'Verdun', '19 Charles Blvd', '3C6 4Y9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000431, 'Al', 'Portland', '45 Biehn Drive', '9823');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000432, 'Roger', 'Walnut Creek', '29 Winger', '25598');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000433, 'Sarah', 'Crete', '5 Eddie', '12590');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000434, 'Oded', 'Mapo-gu', '61st Street', '1733');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000435, 'Larenz', 'Avon', '57 Tillis Road', '33943');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000436, 'Vonda', 'Columbus', '71 Rickles Road', '6335');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000437, 'Fisher', 'Loveland', '98 Firth Ave', '2985');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000438, 'Desmond', 'Arlington', '37 Cle Elum Blvd', '12402');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000439, 'Kiefer', 'Naestved', '85 Hong Drive', '24530');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000440, 'Rebeka', 'Warrington', '40 Price Road', '0O1 5I7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000441, 'Machine', 'Hunt Valley', '76 Tyler', '5696');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000442, 'Alana', 'Bismarck', '42 Coolidge Street', '11759');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000443, 'Ani', 'Halfway house', '163 Kobe Blvd', '15025');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000444, 'Armand', 'Huntington', '156 Happy Valley Str', '37393');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000445, 'Jean', 'Salvador', '99 Maryville Street', '20039');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000446, 'Sal', 'Benbrook', '70 Hersh Drive', '37501');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000447, 'George', 'Tartu', '84 Moriarty Street', '29705');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000448, 'Kasey', 'Oldham', '12nd Street', '2X7 0Y9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000449, 'Remy', 'Hiroshima', '262 Walker Ave', '34691');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000450, 'Garth', 'Campinas', '98 Hawthorne Road', '8678');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000451, 'Hex', 'Syracuse', '71st Street', '9065');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000452, 'Desmond', 'Winnipeg', '100 Pensacola Road', '2C8 0A7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000453, 'Tilda', 'Lubbock', '172 Pelvic', '25539');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000454, 'Grant', 'Charlottesville', '12 Coolidge Drive', '20437');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000455, 'Keanu', 'Karlsruhe', '10 Fred Street', '21947');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000456, 'Sean', 'Den Haag', '45 McCormack Road', '5833UP');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000457, 'Rene', 'Portsmouth', '93 Manaus Road', '24368');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000458, 'Carl', 'Natal', '66 Norm Drive', '8965');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000459, 'Percy', 'Chemnitz', '550 Isaac Drive', '36622');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000460, 'Nile', 'Boulogne', '19 Driver Road', '25241');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000461, 'Armin', 'Cuenca', '100 Burton Road', '23336');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000462, 'Colm', 'Coslada', '52 Unger Road', '39796');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000463, 'Anna', 'Wichita', '75 Weiland Road', '40845');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000464, 'James', 'Chambery', '70 Haverhill Blvd', '25929');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000465, 'Lionel', 'Atlanta', '46 Arthur Drive', '20851');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000466, 'Denzel', 'Charleston', '42nd Street', '39000');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000467, 'Sheryl', 'Pensacola', '362 Jordan Drive', '19184');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000468, 'Ashley', 'Grapevine', '45 Gordon Blvd', '17930');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000469, 'Roy', 'Libertyville', '5 Fort Collins Road', '40304');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000470, 'Alex', 'Heiligenhaus', '43rd Street', '8016');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000471, 'Lou', 'Varzea grande', '1 Rifkin Street', '31421');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000472, 'Josh', 'Heiligenhaus', '98 Woody Street', '23522');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000473, 'Thora', 'Treviso', '492 Elvis Street', '31597');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000474, 'Pierce', 'Gliwice', '42nd Street', '27801');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000475, 'Robby', 'Kuraby', '66 Veenendaal Blvd', '6800');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000476, 'Billy', 'Sutton', '373 Curtis-Hall Ave', '23231');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000477, 'Will', 'Mclean', '40 Deschanel Road', '18103');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000478, 'Ramsey', 'Lima', '736 Yaphet Road', '2806');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000479, 'Kris', 'Towson', '18 Steve Street', '17490');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000480, 'Dylan', 'Milan', '23 Di Savigliano Dri', '31933');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000481, 'Hugo', 'Reisterstown', '10 Haggard Road', '38292');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000482, 'Ned', 'Irving', '364 Sursee Ave', '36154');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000483, 'Marie', 'Vallauris', '16 Grace Street', '40971');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000484, 'Cathy', 'Norderstedt', '96 Harnes Street', '4865');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000485, 'Daryl', 'Bratislava', '52nd Street', '19275');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000486, 'Spencer', 'West Monroe', '19 Sal Blvd', '10824');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000487, 'Moe', 'Yamaguchi', '28 Holland', '29103');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000488, 'Guy', 'Charlotte', '81 Johnson Road', '19669');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000489, 'Kurt', 'Stafford', '73rd Street', '27052');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000490, 'Armand', 'Cerritos', '12 England Street', '35912');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000491, 'Isaiah', 'Pirmasens', '52 Santa Rosa Drive', '27222');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000492, 'Drew', 'Dardilly', '93rd Street', '16405');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000493, 'Thomas', 'Kuraby', '56 Gifu Street', '10832');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000494, 'Gino', 'Essen', '34 Reiner Drive', '20495');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000495, 'Shannyn', 'Verdun', '28 Highlands Ranch', '9W3 0L1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000496, 'Rickie', 'Buffalo Grove', '93 Rispoli Road', '15205');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000497, 'Kathy', 'Chapeco', '90 Malone Road', '34424');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000498, 'Dave', 'Aracruz', '49 LuPone Drive', '27484');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000499, 'Greg', 'Osaka', '80 Maxine Street', '19798');
commit;
prompt 500 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000500, 'Brittany', 'Cuenca', '77 Belmont Road', '39215');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000501, 'Kristin', 'Irvine', '100 Harary', '13394');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000502, 'Jude', 'Coppell', '41 Alston Street', '7455');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000503, 'Halle', 'Curitiba', '787 Christopher', '8123');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000504, 'Lynn', 'Suberg', '54 Bolzano Road', '22101');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000505, 'CeCe', 'Raleigh', '31 Kansas City Stree', '25553');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000506, 'Val', 'Longview', '9 Cherepovets Ave', '25020');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000507, 'Jaime', 'Dallas', '621 Brickell Road', '10962');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000508, 'Ryan', 'Nancy', '355 Purefoy Ave', '2876');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000509, 'Edie', 'Bellevue', '2 Warszawa Street', '4427');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000510, 'Pierce', 'Shenzhen', '674 Rascal Street', '40206');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000511, 'Kelli', 'Schaumburg', '42nd Street', '2161');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000512, 'Gino', 'St. Louis', '53rd Street', '28072');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000513, 'Marianne', 'Drogenbos', '72nd Street', '11929');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000514, 'Isabella', 'Hunt Valley', '48 Tobey Street', '36870');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000515, 'Marley', 'Maidenhead', '83 Rich Street', '2S5 4Y8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000516, 'Tcheky', 'Mumbai', '77 Glendale Street', '7281');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000517, 'Lin', 'Trento', '91 Elizondo Road', '40489');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000518, 'Anthony', 'Redmond', '114 Ward Street', '27948');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000519, 'Tobey', 'Anchorage', '49 Gambon Drive', '32046');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000520, 'Benjamin', 'St Leonards', '155 Rossellini Stree', '20134');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000521, 'Jackie', 'Columbus', '17 Monmouth Ave', '39814');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000522, 'Hope', 'Laguna Bbeach', '15 Maggie Drive', '40335');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000523, 'Ving', 'Szazhalombatta', '243 Hart Ave', '30638');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000524, 'Lily', 'Suberg', '78 Carrey Street', '5372');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000525, 'Stephen', 'Slmea', '69 Cobbs Road', '34637');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000526, 'Miko', 'Maintenon', '16 Royersford Road', '11882');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000527, 'Vern', 'Oshawa', '22nd Street', '2J7 8K1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000528, 'David', 'Wilmington', '29 Angelina Road', '33274');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000529, 'Johnny', 'Hounslow', '37 Farnham Street', '2S5 4S6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000530, 'Xander', 'Fairview Heights', '16 Matthau Street', '21292');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000531, 'Queen', 'Whitehouse Station', '60 Warsaw Road', '36160');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000532, 'Edgar', 'Ithaca', '35 Andrew Ave', '29459');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000533, 'Steve', 'Dortmund', '29 Purley Road', '28593');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000534, 'Nik', 'Warszawa', '29 Marley Road', '30834');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000535, 'Alessandro', 'Woking', '794 Lathrop Blvd', '7H3 6A8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000536, 'Geoff', 'Lublin', '45 Kristofferson Dri', '15531');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000537, 'Natasha', 'Philadelphia', '66 Reinhold Street', '36180');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000538, 'Stephen', 'Thessaloniki', '74 Love Road', '10125');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000539, 'Carla', 'Cuiab?', '52 Budapest Road', '15234');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000540, 'Juliette', 'Hunt Valley', '2 K?ln Drive', '8141');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000541, 'Wayman', 'Takamatsu', '16 McCain Drive', '24055');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000542, 'Christina', 'San Diego', '16 Stoneham Drive', '18215');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000543, 'Ralph', 'Vilnius', '933 Huntington Beach', '14356');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000544, 'Charlie', 'Pottendorf', '11 Bracco Road', '10410');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000545, 'Adam', 'Laredo', '8 Reynolds Road', '29155');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000546, 'Joshua', 'Den Haag', '3 Pearland Road', '8917QL');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000547, 'Moe', 'Pirmasens', '93 Withers Street', '14814');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000548, 'Franz', 'Vallauris', '9 Barueri Street', '7190');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000549, 'Ike', 'Mason', '60 Kotto Ave', '3285');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000550, 'Kasey', 'Towson', '38 Kevin Blvd', '22222');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000551, 'Dermot', 'Livermore', '98 Garber Road', '3978');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000552, 'Aidan', 'Ani?res', '534 Marie Road', '2504');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000553, 'Dar', 'Hohenfels', '22nd Street', '29520');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000554, 'Sylvester', 'Valencia', '1 Mould', '40301');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000555, 'Paula', 'Santa Cruz', '26 Vanderbijlpark Ro', '32691');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000556, 'Nikka', 'Madrid', '56 Rush Road', '18743');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000557, 'Merillee', 'Fort gordon', '54 Quinn Drive', '25672');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000558, 'Albertina', 'Roma', '11st Street', '26094');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000559, 'Glenn', 'Fukui', '31 Fogerty Street', '31578');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000560, 'Phil', 'Santorso', '98 Emmerich Blvd', '23730');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000561, 'Joaquin', 'Huntington', '42 McKellen Drive', '17363');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000562, 'Ewan', 'Enfield', '33rd Street', '3W8 7G4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000563, 'Manu', 'Madison', '64 Melrose Blvd', '25962');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000564, 'Jodie', 'Maebashi', '73 Belo Horizonte Dr', '21243');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000565, 'Fiona', 'Porto alegre', '92 Caviezel Street', '4244');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000566, 'Tommy', 'Pordenone', '78 Pompton Plains St', '17992');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000567, 'Mandy', 'Redding', '82 Arthur Ave', '13838');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000568, 'Pat', 'Parma', '54 Red Blvd', '15047');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000569, 'Rob', 'Adelaide', '16 Yankovic Street', '5541');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000570, 'Cledus', 'Elche', '16 Ferrer Road', '22120');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000571, 'Kate', 'Santorso', '97 Changwon-si Road', '26961');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000572, 'Warren', 'Athens', '47 Reinhold Street', '26565');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000573, 'Woody', 'Toledo', '50 Bkk Street', '36306');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000574, 'Devon', 'Louisville', '75 Ben-Gurion Street', '24976');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000575, 'Claude', 'Durban', '83 Taylor Road', '39225');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000576, 'Neneh', 'Mapo-gu', '50 Tambor Street', '25719');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000577, 'Mili', 'Cle Elum', '52nd Street', '20066');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000578, 'Neil', 'Charleston', '90 Stamp Road', '38055');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000579, 'Oded', 'Farnham', '92 Trevino Drive', '8T2 5K9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000580, 'Salma', 'Highton', '86 Ingelheim Drive', '29478');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000581, 'Stockard', 'Green bay', '826 K?benhavn Street', '31779');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000582, 'Rich', 'Juno Beach', '11 Steve Street', '2324');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000583, 'Emilio', 'Tualatin', '29 Hannah', '4224');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000584, 'Demi', 'Laurel', '80 Warburton Drive', '15482');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000585, 'Heath', 'Buffalo', '91 Tucker', '2T4 2Y8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000586, 'Vincent', 'Alexandria', '89 Nelson Drive', '8646');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000587, 'Loretta', 'Aomori', '24 Hershey Road', '2007');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000588, 'Rachid', 'Soroe', '7 Debi Road', '29386');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000589, 'Rene', 'Lancaster', '6 Mahoney Road', '29637');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000590, 'Lily', 'Antwerpen', '30 Imperioli Road', '25106');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000591, 'Ralph', 'Horsham', '89 Channing Street', '2603');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000592, 'Cate', 'Santa rita sapuca?', '71st Street', '28706');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000593, 'Patty', 'Giessen', '57 Neuwirth Road', '11610');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000594, 'Paula', 'Bolzano', '96 Andy', '8567');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000595, 'Vonda', 'Yokohama', '26 Cetera Ave', '35641');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000596, 'King', 'New orleans', '13 Fort Saskatchewan', '22003');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000597, 'Woody', 'Gliwice', '19 Johnny', '29384');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000598, 'Susan', 'Erpe-Mere', '76 Stellan Street', '2991');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000599, 'Joe', 'Parsippany', '16 Baez Drive', '7387');
commit;
prompt 600 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000600, 'Praga', 'Colombo', '365 Sorocaba Blvd', '40866');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000601, 'Gene', 'Ashdod', '387 Blackwell Street', '27586');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000602, 'Natasha', 'Cheshire', '55 Kevn Road', '7B6 3V4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000603, 'Emily', 'Hayward', '86 Parish Street', '17834');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000604, 'John', 'Belo Horizonte', '48 Fairbanks Street', '17918');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000605, 'Mae', 'Shenzhen', '62 Kimberly Ave', '26374');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000606, 'Kelly', 'Dardilly', '910 Betty Road', '35858');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000607, 'Gwyneth', 'Hiller?d', '44 Kweller Road', '18288');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000608, 'Sandra', 'Pasadena', '65 Webster Groves Dr', '21413');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000609, 'Dionne', 'Sydney', '93rd Street', '25077');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000610, 'Nicholas', 'Fort Collins', '45 Williamstown Stre', '31037');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000611, 'Caroline', 'Gummersbach', '9 Bergen', '39091');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000612, 'Belinda', 'Ludbreg', '86 Lake Forest Stree', '38836');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000613, 'Judge', 'Macclesfield', '60 Goldwyn Drive', '2D6 9J0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000614, 'Julianna', 'Bretzfeld-Waldbach', '972 Busta Road', '17650');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000615, 'Wayman', 'Milpitas', '21 El Segundo Street', '27318');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000616, 'Benjamin', 'Pottendorf', '18 Milla', '19350');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000617, 'Larenz', 'Suberg', '30 Suchet Drive', '7034');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000618, 'Fisher', 'Hampton', '74 Tustin Street', '11355');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000619, 'Deborah', 'Bedfordshire', '62nd Street', '2F4 3O9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000620, 'Debra', 'Edwardstown', '5 Donal', '18483');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000621, 'Natascha', 'Granada Hills', '98 Kahn Blvd', '17119');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000622, 'Rebeka', 'Nyn?shamn', '63 Kinney Road', '13960');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000623, 'Angela', 'Shawnee', '24 Kopavogur Road', '13866');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000624, 'Franz', 'Fleet', '28 Jeroen Drive', '7P0 7L0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000625, 'Whoopi', 'North Yorkshire', '89 Jeffrey Drive', '9O6 0V7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000626, 'Nile', 'Redwood City', '33rd Street', '6038');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000627, 'Ronny', 'Birmingham', '289 Ali Road', '7Y6 1I2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000628, 'Crystal', 'Cuiab?', '21 Benoit Street', '26174');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000629, 'Cameron', 'Allen', '13 Newton Street', '5172');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000630, 'Wendy', 'Warszawa', '7 Johnson Blvd', '12508');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000631, 'Andie', 'Brisbane', '43 Fleet Road', '19853');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000632, 'Tyrone', 'Nepean', '63rd Street', '3W8 9P2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000633, 'Elijah', 'St. Petersburg', '15 Wavre', '40023');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000634, 'Cary', 'Woodbridge', '641 Caviezel Drive', '35256');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000635, 'Harold', 'Dardilly', '89 Macau', '34054');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000636, 'Faye', 'Olympia', '6 Oshawa Drive', '40969');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000637, 'Tori', 'Pirmasens', '2 Cotton Street', '24354');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000638, 'Taylor', 'South Weber', '31 Kier Street', '25313');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000639, 'Jim', 'Amsterdam', '33 Swayze Drive', '2986YH');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000640, 'Karon', 'Reykjavik', '470 Schreiber Blvd', '15471');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000641, 'Christopher', 'Spring City', '33 Redgrave Drive', '16280');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000642, 'Austin', 'Kungki', '829 Steyr Road', '4189');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000643, 'Donald', 'Salt Lake City', '47 Natal Blvd', '17915');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000644, 'David', 'Oslo', '872 Leverkusen Road', '6198');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000645, 'Aimee', 'Cuiab?', '79 Ranger Drive', '20072');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000646, 'Maury', 'Piacenza', '81 Mike', '26340');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000647, 'Olympia', 'Cleveland', '73 Nile', '18823');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000648, 'Xander', 'Glenshaw', '90 Spine Blvd', '12991');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000649, 'Gladys', 'Augst', '19 Ernest Drive', '14876');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000650, 'Ronnie', 'Ringwood', '40 Pleasence Road', '13913');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000651, 'Percy', 'Whittier', '63 Chestnut Drive', '22074');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000652, 'Andrew', 'Den Haag', '50 Alfred Drive', '1341QV');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000653, 'Gordie', 'Lippetal', '53 Shizuoka Drive', '24285');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000654, 'Bill', 'Albany', '4 Dolenz Ave', '22627');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000655, 'Dwight', 'Draper', '82 Balthazar Street', '17469');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000656, 'Beverley', 'West Point', '97 Viterelli Ave', '5096');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000657, 'Teena', 'Goslar', '79 Marianne', '12632');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000658, 'Ani', 'Moorestown', '15 Boone Street', '10247');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000659, 'Emilio', 'Greenville', '68 DeGraw Drive', '33429');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000660, 'Frankie', 'Telford', '3 Chi', '2V2 1T8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000661, 'Saffron', 'Bismarck', '94 Dale Street', '26030');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000662, 'Gena', 'West Sussex', '72 Tobolowsky Street', '9S6 1E9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000663, 'Philip', 'Woodland Hills', '913 Biggs Street', '19431');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000664, 'Delroy', 'Bozeman', '329 Summerside Road', '35926');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000665, 'Patricia', 'Redwood City', '89 Winterthur Road', '31555');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000666, 'Roscoe', 'Kyunnam', '74 Cheadle Drive', '16691');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000667, 'Connie', 'Boucherville', '39 Plymouth Meeting', '2Z0 5W3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000668, 'Olga', 'Saitama', '86 Beth Drive', '20603');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000669, 'Lin', 'Oakland', '51st Street', '35688');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000670, 'Luke', 'Cambridge', '82 Alana Street', '34924');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000671, 'Millie', 'Yamagata', '731 Art Street', '38021');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000672, 'Victor', 'Takapuna', '85 Curry Road', '15943');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000673, 'Jodie', 'Waltham', '97 Suzy Street', '12804');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000674, 'Winona', 'Pensacola', '32 MacNeil Road', '31487');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000675, 'Adam', 'Aracruz', '100 Wine Drive', '19488');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000676, 'CeCe', 'Ankara', '10 Johansson Drive', '34530');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000677, 'Josh', 'Framingham', '60 Cube Street', '3403');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000678, 'Linda', 'Lecanto', '44 Sorvino Road', '40600');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000679, 'Lucy', 'Ettlingen', '420 Bedfordshire Dri', '2301');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000680, 'Ronny', 'Kaiserslautern', '87 Kinnear Street', '19296');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000681, 'Stockard', 'St. Petersburg', '60 Frederiksberg Dri', '3300');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000682, 'Ceili', 'Cle Elum', '53 Peine Street', '27803');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000683, 'Demi', 'Lehi', '80 Leto Road', '28495');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000684, 'Dylan', 'Salzburg', '69 New Hyde Park Roa', '26076');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000685, 'Brent', 'Dinslaken', '34 Schenectady Stree', '12237');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000686, 'Johnnie', 'Market Harborough', '32 Morris Blvd', '7A2 3O7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000687, 'Katie', 'Zagreb', '47 Calle Road', '23177');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000688, 'Davy', 'Leipzig', '14 Rockwell Road', '9082');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000689, 'Adina', 'Belp', '84 Orton Drive', '7226');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000690, 'Vin', 'Salt Lake City', '899 Rippy Street', '9179');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000691, 'Stellan', 'Goiania', '10 Ankara Street', '14471');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000692, 'Norm', 'Menlo Park', '49 Reinhold Drive', '3583');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000693, 'Tal', 'Los Angeles', '44 Moriarty', '8701');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000694, 'Glen', 'Oakland', '31 Rio Rancho Drive', '15467');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000695, 'Chalee', 'Suwon-city', '72 Mike Road', '17869');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000696, 'Jason', 'Bonn', '61 Frank Road', '30662');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000697, 'Orlando', 'Redwood City', '437 Chemnitz Road', '15387');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000698, 'Ian', 'Lyon', '65 Emilio Street', '20641');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000699, 'Elvis', 'Caguas', '15 Crimson Road', '7422');
commit;
prompt 700 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000700, 'Marley', 'Louisville', '7 Berwyn Street', '22058');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000701, 'Giancarlo', 'Dietikon', '19 Bradenton Road', '7362');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000702, 'Andre', 'Cambridge', '896 Kapanka Street', '3T1 3S4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000703, 'Rory', 'Kaohsiung', '25 Henstridge Ave', '6608');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000704, 'Rosanne', 'San Francisco', '79 Jared Street', '12724');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000705, 'Rickie', 'Palo Alto', '1 Jody Drive', '29405');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000706, 'Red', 'Berkshire', '98 Morse Street', '9F5 9G2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000707, 'Ozzy', 'Fremont', '1 Fierstein Road', '8783');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000708, 'Boyd', 'Haverhill', '82 Paal Beringen Dri', '2Y2 1T3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000709, 'Tobey', 'Bad Oeynhausen', '71st Street', '30762');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000710, 'Luke', 'Obfelden', '43 Curt Road', '37128');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000711, 'Pamela', 'Zwolle', '605 Jean Street', '6011NR');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000712, 'Ramsey', 'Koufu', '91st Street', '25034');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000713, 'Ivan', 'Dunn loring', '39 Ben', '5509');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000714, 'Annie', 'Echirolles', '47 Donal Road', '12960');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000715, 'Latin', 'Friedrichshafe', '93 Wellington Road', '21048');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000716, 'Julianna', 'West Windsor', '95 Stuart Road', '35199');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000717, 'Kim', 'Jerusalem', '43 Ismaning Street', '26814');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000718, 'Nora', 'Burlington', '968 Emily', '2G0 7K8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000719, 'Lorraine', 'Gersthofen', '890 Portland Street', '39890');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000720, 'Jesse', 'Berlin', '71 Kenoly Drive', '26395');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000721, 'Zooey', 'Fairview Heights', '95 Whitwam Street', '31206');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000722, 'Etta', 'O''fallon', '54 Garber Road', '39115');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000723, 'Lee', 'Hilton', '89 Willard Drive', '40456');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000724, 'Jeanne', 'Kejae City', '82 Carlene Drive', '36626');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000725, 'Carrie-Anne', 'Guelph', '6 Benbrook Street', '6G6 2S6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001018, 'Rhett', 'Edenbridge', '7 Mould Street', '4W3 9T9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001019, 'Cornell', 'Aomori', '59 Krieger Drive', '23947');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001020, 'Bobby', 'Mayfield Village', '92nd Street', '28107');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001021, 'Kristin', 'Kozani', '58 Favreau Road', '21427');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001022, 'Malcolm', 'Madrid', '582 Tommy Drive', '22368');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001023, 'Whoopi', 'Cypress', '88 Lublin Road', '20535');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001024, 'Wayman', 'Swannanoa', '75 LaBelle Street', '19787');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001025, 'Lucy', 'M?nchen', '5 Law Street', '23312');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001026, 'Veruca', 'Harahan', '932 Nicks Street', '5943');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001027, 'Marc', 'Holderbank', '26 M?nster', '8452');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001028, 'Joely', 'Elkins Park', '84 Davidson', '14315');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001029, 'Pamela', 'Chur', '155 Tyson Drive', '28694');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001030, 'Nicky', 'Bloemfontein', '40 First Drive', '13427');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001031, 'Vincent', 'Mablethorpe', '12nd Street', '8H6 7Q5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001032, 'Hector', 'Nantes', '97 Kris Road', '23519');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001033, 'Samantha', 'Flower mound', '69 San Ramon Ave', '36166');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001034, 'Elijah', 'Goiania', '25 Bedfordshire Road', '35331');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001035, 'Clay', 'Monument', '22 Isaak Drive', '33012');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001036, 'Suzi', 'Grand Rapids', '41 El Segundo Ave', '32324');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001037, 'Janice', 'Sutton', '453 Minnie Street', '38919');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001038, 'Juan', 'Delafield', '55 Chambery Street', '37265');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001039, 'Jill', 'Barbengo', '54 Maceo Street', '14064');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001040, 'Saul', 'Macclesfield', '956 Dourif Ave', '6N7 7J1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001041, 'Burton', 'durham', '99 Ving', '5N4 9G1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001042, 'Ashton', 'Caguas', '75 Holly Ave', '32316');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001043, 'Jessica', 'East sussex', '77 McClinton Street', '0D4 9D8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001044, 'Meryl', 'Brookfield', '52nd Street', '23720');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001045, 'Vince', 'Shenzhen', '40 Duncan Blvd', '9627');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001046, 'Cameron', 'Chicago', '91st Street', '22177');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001047, 'Aida', 'Santa Clarat', '32 Armand Street', '3J6 8G9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001048, 'Ty', 'Middletown', '73 Ferry Drive', '32541');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001049, 'Tamala', 'Bretzfeld-Waldbach', '62 James Road', '36651');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001050, 'Embeth', 'Salisbury', '714 Swannanoa Street', '3032');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001051, 'Michael', 'Pusan', '64 Adelaide Drive', '34523');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001052, 'Max', 'Fukuoka', '88 Geoff Street', '29457');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001053, 'Diane', 'Helsingborg', '870 Secada Ave', '37031');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001054, 'Jessica', 'Pulheim-brauweiler', '39 Lund Ave', '5926');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001055, 'Jude', 'Warsaw', '73 Bloomington Blvd', '22208');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001056, 'Dwight', 'Fort worth', '53 Cuenca Road', '21234');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001057, 'Katie', 'Trento', '48 Altst?tten Drive', '6650');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001058, 'Buffy', 'Bozeman', '1 Sarandon Drive', '4585');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001059, 'William', 'Santiago', '14 Polley Street', '37282');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001060, 'Lee', 'Ferraz  vasconcelos', '54 Soda Drive', '29315');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001061, 'Drew', 'Eiksmarka', '75 Savage Blvd', '14869');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001062, 'Nathan', 'Paraju', '689 Azucar Road', '30866');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001063, 'Greg', 'Milan', '94 Eliza Road', '18703');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001064, 'Jean', 'Maryville', '10 Alda Street', '17280');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001065, 'Laurie', 'Waco', '63 Haynes Ave', '39927');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001066, 'Jodie', 'Edison', '25 San Francisco Str', '28210');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001067, 'Joaquim', 'Copenhagen', '100 Pony Road', '8485');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001068, 'Gabrielle', 'Winnipeg', '76 Maceo', '6G5 8D0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001069, 'Remy', 'Itu', '31 Plymouth Meeting', '28711');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001070, 'Edward', 'Or-yehuda', '34 Crow Blvd', '20281');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001071, 'Val', 'Venice', '48 Keeslar Road', '6705');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001072, 'Frederic', 'Atlanta', '32 Oakland Street', '29422');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001073, 'Vern', 'High Wycombe', '96 Domino Street', '7E5 8W0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001074, 'Kirsten', 'G?vle', '39 Cameron', '35006');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001075, 'Lesley', 'Horb', '30 Javon Street', '25685');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001076, 'Lisa', 'Ani?res', '64 Detmer Blvd', '15157');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001077, 'Bo', 'Bielefeld', '98 Crowell Ave', '12307');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001078, 'Dorry', 'Tilst', '67 Gersthofen Blvd', '8691');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001079, 'Maggie', 'Obfelden', '26 Pitney Street', '39360');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001080, 'France', 'Paris', '27 Maggie Drive', '32461');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001081, 'Maury', 'Hounslow', '45 Eliza', '9M3 0G5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001082, 'Anne', 'Fort Lewis', '61 New Fairfield Blv', '22730');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001083, 'Leonardo', 'Ponta grossa', '59 Maxwell', '36780');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001084, 'Kelli', 'Hartmannsdorf', '19 Isaak', '25360');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001085, 'Stewart', 'Walnut Creek', '537 Pleasure Road', '15990');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001086, 'Julie', 'Auckland', '44 Akins Ave', '14179');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001087, 'Curt', 'League city', '78 Micky Ave', '24428');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001088, 'Eileen', 'Nicosia', '67 Lapointe Road', '15448');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001089, 'Earl', 'Bad Oeynhausen', '160 Ferrell', '28733');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001090, 'Bonnie', 'Burlington', '30 McConaughey Road', '18572');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001091, 'Ani', 'Swannanoa', '71 Kyle Street', '30739');
commit;
prompt 800 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001092, 'Orlando', 'Charlotte', '85 La Plata Street', '14880');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001093, 'Gena', 'St Kilda', '547 Tyler Drive', '25491');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001094, 'Christian', 'Biella', '40 Lodi Drive', '6637');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001095, 'Denzel', 'Kloten', '23 Kaiserslautern Ro', '22042');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001096, 'Hal', 'Vienna', '51 Gilliam', '28067');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001097, 'Ice', 'Derwood', '63rd Street', '26755');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001098, 'Alannah', 'Saudarkrokur', '23rd Street', '28191');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001099, 'Rhys', 'Tyne & Wear', '62 Rita', '5X9 9G0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001100, 'Josh', 'Michendorf', '50 Jerry Blvd', '38909');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001101, 'Aaron', 'Dearborn', '77 Polley Road', '2072');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001102, 'Desmond', 'Visselh?vede', '72nd Street', '11191');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001103, 'Molly', 'League city', '59 Van Damme Road', '37171');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001104, 'Pablo', 'Gaithersburg', '51 Harold Road', '40457');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001105, 'Ashton', 'San Antonio', '20 Fraser Ave', '30943');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001106, 'Lydia', 'Aurora', '81 Minogue Road', '12249');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001107, 'Chad', 'Leipzig', '21 Parsons', '39960');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001108, 'Alana', 'Vista', '98 Bogguss Road', '17262');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001109, 'Tom', 'Herndon', '95 Teena Street', '11551');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001110, 'Isabella', 'Stony Point', '46 Bedford Ave', '15641');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001111, 'Anita', 'Parma', '25 Ford Road', '15064');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001112, 'Dianne', 'San Francisco', '208 Connery Street', '8335');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001113, 'Morris', 'Cle Elum', '21st Street', '18582');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001114, 'Emm', 'Archbold', '49 Field Drive', '31562');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001115, 'Millie', 'Redhill', '62 Malm? Blvd', '9G1 8E1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001116, 'Alicia', 'Nanaimo', '99 Milton', '9E9 0A0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001117, 'Cevin', 'Kungens kurva', '94 Paquin Blvd', '35720');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001118, 'Ernest', 'Yomgok-dong', '40 Cromwell Street', '39463');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001119, 'Randy', 'Longview', '728 Kweller Drive', '1588');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001120, 'Gran', 'Pacific Grove', '93 Sundsvall Drive', '3676');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001121, 'Kim', 'Murray', '72 Dempsey Street', '28596');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001122, 'Jason', 'West Windsor', '30 Kinnear', '36486');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001123, 'Susan', 'Kongserbg', '50 Fiona Street', '34210');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001124, 'Rod', 'Barksdale afb', '28 Katt Street', '35112');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001125, 'Helen', 'Sparrows Point', '19 Raitt Ave', '6889');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001126, 'Anita', 'B?nes', '57 Chestnut Drive', '22626');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001127, 'Drew', 'Fort McMurray', '48 Vannelli Road', '9N8 4E1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001128, 'Teri', 'Cesena', '38 Traralgon Road', '23300');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001129, 'Praga', 'Warrenton', '14 Matthew Drive', '31878');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001130, 'Chalee', 'Des Plaines', '74 Sam Street', '20761');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001131, 'Aaron', 'Bradenton', '15 Jackman Blvd', '15539');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001132, 'Giancarlo', 'Germantown', '96 Phillips Blvd', '13295');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001133, 'Alec', 'Gersthofen', '17 Lewin', '11708');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001134, 'Steven', 'Ehningen', '23 McGill Ave', '39778');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001135, 'Julio', 'Springfield', '92nd Street', '38684');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001136, 'Shelby', 'Bernex', '73 S?o paulo Road', '4679');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001137, 'Ruth', 'New Haven', '257 LuPone', '34764');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001138, 'Marley', 'Douala', '91 O''fallon', '30392');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001139, 'Rhett', 'Oberwangen', '100 Joaquin Road', '22298');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001140, 'Horace', 'Eschborn', '11 Lin Road', '27126');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001141, 'Jon', 'Tulsa', '16 Velizy Villacoubl', '5579');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001142, 'Jeffery', 'Hong Kong', '96 Grand Rapids', '14571');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001143, 'Marty', 'Milano', '42 Holeman Road', '27076');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001144, 'Lena', 'Padova', '91 Kotto Street', '38444');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001145, 'Belinda', 'Melrose park', '51st Street', '35444');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001146, 'Sander', 'Santa Clarat', '72 Heron Street', '1I9 9B2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001147, 'Hector', 'Fairfax', '100 Zahn', '32430');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001148, 'Goldie', 'Westport', '584 Duncan Road', '35244');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001149, 'Cheech', 'Halfway house', '43 Stevenson Street', '28994');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001150, 'Shannon', 'Ohtsu', '8 Tia Drive', '27526');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001151, 'Beverley', 'Whitehouse Station', '62 urban Street', '37013');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001152, 'Kasey', 'San Antonio', '66 Giannini Drive', '19785');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001153, 'Jean', 'Osaka', '25 Phillippe Blvd', '5112');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001154, 'Yolanda', 'Freising', '216 Ball Ave', '11284');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001155, 'Jonatha', 'Newton-le-willows', '26 McKennitt Drive', '8Y4 2U4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001156, 'Aidan', 'Winnipeg', '10 Stallone Blvd', '6C4 8M9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001157, 'Jessica', 'Olympia', '93rd Street', '10026');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001158, 'Max', 'Springville', '507 Oyten Street', '20896');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001159, 'Sheena', 'Amsterdam', '1 Nugent Road', '1300HC');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001160, 'Nathan', 'Uetikon am See', '88 Harvey Street', '29837');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001161, 'Isaiah', 'Rochester', '97 Johnnie Street', '37619');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001162, 'Bob', 'Edenbridge', '34 Biehn Road', '9J1 5K1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001163, 'Rhea', 'Bloomington', '78 Micky Street', '14849');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001164, 'Clive', 'Pirapora bom Jesus', '34 Burke Street', '2001');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000727, 'Bernie', 'Menlo Park', '47 Freddie Drive', '14011');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000728, 'Rory', 'Milton Keynes', '70 Lara Street', '6K8 1D2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000729, 'Samuel', 'Amherst', '71 Anyang-si Ave', '17680');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000730, 'Alex', 'Moorestown', '87 Nina Street', '18597');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000731, 'Allison', 'Ft. Lauderdale', '737 Rupert Blvd', '4732');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000732, 'Warren', 'Lodi', '54 Long Island City ', '19288');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000733, 'Viggo', 'Dartmouth', '26 Michaels Street', '5F1 3A4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000734, 'Clay', 'Wilmington', '583 Rhys-Davies Driv', '22996');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000735, 'Maceo', 'Debary', '63 Kudrow Road', '35620');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000736, 'Jill', 'Whitehouse Station', '13 McGinley Road', '4172');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000737, 'Coley', 'S?o paulo', '1 Love Street', '33456');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000738, 'Oded', 'Sidney', '722 Applegate Drive', '3C1 3X0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000739, 'Rod', 'The Woodlands', '59 Mazzello Drive', '12542');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000740, 'Delbert', 'Kreuzau', '45 Clark Road', '18719');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000741, 'Shawn', 'West Lafayette', '272 Chant? Street', '40460');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000742, 'Harry', 'Breda', '21 Whitford Street', '9151VC');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000743, 'Lara', 'Meerbusch', '81 Thomson Road', '24411');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000744, 'Vendetta', 'New orleans', '23 Jerry Street', '29321');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000745, 'Crystal', 'Melrose', '39 Andrew Blvd', '29559');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000746, 'Roddy', 'West Sussex', '63 Mapo-gu Street', '7V4 6J1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000747, 'Roddy', 'Wageningen', '29 MacIsaac Blvd', '7003RE');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000748, 'Tara', 'Villata', '614 Nicks Road', '5201');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000749, 'Davy', 'Lummen', '49 Perrineau Street', '29919');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000750, 'Chet', 'Richmond', '32nd Street', '2V9 6O9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000751, 'Bonnie', 'Colombes', '30 Giovanni Drive', '18338');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000752, 'Geoffrey', 'Framingham', '100 Crosby Street', '25432');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000753, 'Lizzy', 'Huntsville', '81 Newman Blvd', '3544');
commit;
prompt 900 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000754, 'Horace', 'Horsham', '590 Steyr Street', '8L9 4M7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000755, 'Hugo', 'Augsburg', '66 Darren Road', '8816');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000756, 'Davey', 'L''union', '60 Belmont Ave', '25877');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000757, 'Ernie', 'Vanderbijlpark', '11 Nyn?shamn Street', '3392');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000758, 'Gordon', 'Milano', '77 Cypress Street', '8579');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000759, 'Paul', 'Debary', '28 Watson Road', '8146');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000760, 'Walter', 'Ben-Gurion', '44 Rocklin Drive', '31426');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000761, 'Buffy', 'Paisley', '837 Hercules Drive', '3C0 9Z5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000762, 'Raymond', 'Kreuzau', '4 Rivers Street', '1947');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000763, 'Gary', 'Noumea', '93 Pulheim-brauweile', '34833');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000764, 'Hilary', 'Vancouver', '53 Guinness', '1T4 8Y4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000765, 'Renee', 'Shizuoka', '640 Jennifer Street', '24129');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000766, 'Betty', 'Limeira', '52 Heron Blvd', '23122');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000767, 'Thin', 'Smyrna', '76 Trumbull', '6934');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000768, 'Tobey', 'Or-yehuda', '18 Kurtwood Road', '5460');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000769, 'Elizabeth', 'Manchester', '81 Marietta', '6S1 0E5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000770, 'Miko', 'Sundsvall', '59 Blackwell Road', '15352');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000771, 'Judd', 'Erpe-Mere', '95 Durham Drive', '30749');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000772, 'Ossie', 'Szazhalombatta', '63rd Street', '26244');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000773, 'Sydney', 'Campinas', '99 Michelle Street', '15894');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000774, 'Kazem', 'Ilmenau', '36 Levy Street', '29744');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000775, 'Javon', 'Leeds', '53rd Street', '7Y6 1A2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000776, 'Benjamin', 'Baarn', '63 Lake Oswego Drive', '3901MP');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000777, 'Geraldine', 'Waalwijk', '16 Cambridge Road', '7259SQ');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000778, 'Alex', 'Santa Clarita', '21st Street', '11864');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000779, 'Dylan', 'Aberdeen', '31 Wagner Street', '1T1 5G7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000780, 'Rade', 'Grand-mere', '73 Treviso', '2L7 0A5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000781, 'Arnold', 'Virginia Beach', '880 Delbert Drive', '5382');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000782, 'Tzi', 'Norderstedt', '47 Buscemi Ave', '6571');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000783, 'Rascal', 'Port Macquarie', '48 Horace Street', '23368');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000784, 'Ceili', 'Leimen', '40 Dempsey', '22463');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000785, 'Lucy', 'Aracruz', '44 Keener', '40623');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000786, 'Kitty', 'Valencia', '59 Buffalo Street', '15896');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000787, 'Danny', 'Pottendorf', '41st Street', '30833');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000788, 'Terrence', 'Oak park', '175 Lang Street', '22450');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000789, 'Walter', 'Dunn loring', '8 Pusan Ave', '14238');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000790, 'Julianne', 'Mt. Laurel', '48 Pa?o de Arcos Str', '27047');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000791, 'Marty', 'Matsue', '19 Green Ave', '39613');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000792, 'Wes', 'Kungki', '7 Moscow Blvd', '37314');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000793, 'Lee', 'Aurora', '78 Vienna Ave', '36767');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000794, 'Olga', 'Pacific Grove', '44 Sanchez Drive', '32814');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000795, 'Rip', 'Hercules', '34 Krieger Street', '27912');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000796, 'Emilio', 'Turku', '27 Bangalore', '12241');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000797, 'Merle', 'Cincinnati', '91 Seth Road', '3229');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000798, 'Praga', 'Kaysville', '98 Hatosy Road', '27942');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000799, 'Queen', 'Gummersbach', '26 North Wales Drive', '2551');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000800, 'Merrill', 'Soroe', '23 Bernie Street', '34175');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000801, 'Daniel', 'Ottawa', '39 Hidalgo Drive', '3V0 9R0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000802, 'Willie', 'Shreveport', '43 Tim Street', '40476');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000803, 'Laurie', 'Saga', '29 Kate Street', '40154');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000804, 'Geena', 'Oklahoma city', '69 Gilley Street', '4377');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000805, 'Jonatha', 'Kumamoto', '17 Horace Drive', '34673');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000806, 'Davis', 'Tartu', '43 Greenwood Street', '33843');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000807, 'Michelle', 'Concordville', '15 Grier Blvd', '23002');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000808, 'Clive', 'Den Haag', '57 Bassett Drive', '0954EU');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000809, 'Mac', 'Nanaimo', '13rd Street', '9E5 6D5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000810, 'Patrick', 'Fountain Hills', '87 Padova Drive', '29429');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000811, 'Jonatha', 'Plymouth Meeting', '62 Neill Road', '38148');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000812, 'Scarlett', 'St Kilda', '34 English Street', '16182');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000813, 'Darius', 'Osaka', '51 Berkoff Drive', '16247');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000814, 'Faye', 'Dorval', '41 Stoltz Street', '9M9 6C4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000815, 'Larnelle', 'Portland', '95 Johor Bahru Ave', '20310');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000816, 'Moe', 'Geneve', '3 Mazar Street', '15329');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000817, 'Mitchell', 'Leipzig', '21 Kopavogur Street', '23197');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000818, 'Ralph', 'Solikamsk', '36 Broderick', '39916');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000819, 'Gerald', 'Fuerth', '83 Santa Rosa Road', '13874');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000820, 'Dermot', 'West Monroe', '58 Langella Drive', '30979');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000821, 'Joey', 'Bartlett', '27 Coslada Street', '19335');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000822, 'Elle', 'Bkk', '80 Macy Street', '23398');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000823, 'Kazem', 'Burgess Hill', '209 Kiefer Street', '4Z4 0G5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000824, 'Lesley', 'Bruneck', '97 Jesus', '8104');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000825, 'Jared', 'Kingston', '45 Callow Drive', '8M5 9D8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000826, 'Reese', 'Bielefeld', '249 Rebeka Road', '19908');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000827, 'Queen', 'Market Harborough', '32 St Leonards Road', '3A2 7P9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000828, 'Natasha', 'Leimen', '12nd Street', '32894');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000829, 'Mia', 'Southend on Sea', '21 Hatchet Street', '8M3 1G7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000830, 'Jackson', 'Princeton', '27 Holly Road', '9560');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000831, 'Jay', 'New York City', '378 Owen Street', '27078');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000832, 'Melanie', 'Coventry', '83 Taryn Street', '0Q3 6N8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000833, 'Lindsey', 'M?nchengladbach', '94 Lunch Road', '37350');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000834, 'Mandy', 'Lake Bluff', '60 Rhys-Davies Blvd', '35060');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000835, 'Queen', 'Copenhagen', '660 Heslov Blvd', '37325');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000836, 'Mel', 'Yavne', '93 Clarkson Blvd', '34905');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000837, 'Albert', 'Maceio', '81 Busey Road', '13483');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000838, 'Connie', 'Olsztyn', '43rd Street', '35175');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000839, 'Ozzy', 'Key Biscayne', '32 Crow Ave', '12397');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000840, 'Lizzy', 'Almaty', '92 Mickey Ave', '25630');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000841, 'Simon', 'Lund', '97 Magnuson Drive', '30446');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000842, 'Gladys', 'Kochi', '558 Gellar Street', '23615');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000843, 'Chi', 'Douala', '93 Rio Ave', '36498');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000844, 'Cameron', 'Princeton', '17 Rauhofer Blvd', '8647');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000845, 'Mos', 'Spring City', '95 McCoy Drive', '30598');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000846, 'Benicio', 'Lima', '67 Ammons Road', '10196');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000847, 'Giancarlo', 'Unionville', '38 Blair Road', '1F4 7F9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000848, 'Spike', 'Valencia', '41st Street', '17885');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000849, 'Ruth', 'Lisbon', '28 William Drive', '10348');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000850, 'Ronnie', 'M?nchen', '78 Fuchstal-asch Dri', '1955');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000851, 'Dustin', 'Lund', '63 McCabe Road', '5398');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000852, 'Kieran', 'Calcutta', '851 Valladolid Drive', '30071');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000853, 'Kenneth', 'Tartu', '64 Chambersburg Stre', '40259');
commit;
prompt 1000 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000854, 'Mickey', 'Koppl', '75 Lily Road', '2456');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000855, 'Angelina', 'Braintree', '95 Freeman Road', '9H1 2S6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000856, 'Xander', 'West Windsor', '1 Wolf Drive', '2929');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000857, 'Kelli', 'Rueil-Malmaison', '13rd Street', '9114');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000858, 'Sigourney', 'S?o paulo', '95 Lightfoot Ave', '32687');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000859, 'Rufus', 'Kagoshima', '78 Melrose Street', '17532');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000860, 'Natalie', 'Santiago', '63 Fuerth Blvd', '37667');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000861, 'Jane', 'Juazeiro', '35 Dunn Drive', '19391');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000862, 'Jet', 'Richmond', '15 O''Neill Street', '22907');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000863, 'Jonny', 'Melrose', '63rd Street', '6014');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000864, 'Aaron', 'Bismarck', '59 Melrose Drive', '12797');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000865, 'Vienna', 'Walnut Creek', '3 Domino Drive', '2360');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000866, 'Pablo', 'Lakewood', '93 Oded Drive', '22946');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000867, 'Collective', 'Sydney', '42nd Street', '30955');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000868, 'Samuel', 'Anchorage', '611 Holy Road', '17870');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000869, 'Edwin', 'Tempe', '22 Ruffalo Road', '14809');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000870, 'Garth', 'Knutsford', '7 Withers Road', '6S0 4U0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000871, 'Elizabeth', 'Fairview Heights', '68 Quaid Street', '19616');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000872, 'Rich', 'Helsinki', '90 Luongo Road', '16722');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000873, 'Omar', 'Kansas City', '58 Ronstadt Street', '20635');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000874, 'Tori', 'M?nster', '1 Ellen Street', '30969');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000875, 'Dave', 'Odense', '55 Loveland Ave', '33121');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000876, 'Glen', 'Cambridge', '74 Andie Drive', '12611');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000877, 'Ryan', 'Warszawa', '70 Diane Road', '20147');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000878, 'Wendy', 'Nara', '35 Johnette Drive', '8161');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000879, 'Brian', 'Gelsenkirchen', '111 Bette Drive', '36236');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000880, 'Mae', 'Moreno Valley', '52 McBride Street', '32270');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000881, 'Lonnie', 'Sugar Land', '93rd Street', '21952');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000882, 'Susan', 'Snoqualmie', '33rd Street', '21154');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000883, 'Nastassja', 'Schenectady', '41 San Jose Drive', '12336');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000884, 'Pete', 'Wehrheim', '73 Westerberg Street', '11510');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000885, 'Sydney', 'Cesena', '95 Terry Road', '32736');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000886, 'Joaquim', 'Giessen', '4 Stanton Drive', '3462');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000887, 'Lydia', 'Erpe-Mere', '60 Shepard Blvd', '3488');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000888, 'Ted', 'Wageningen', '92 Cochran Street', '4907OC');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000889, 'Hector', 'Massagno', '71 Finn Street', '13225');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000890, 'Ron', 'Eindhoven', '34 Ifans Road', '7108PV');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000891, 'Gin', 'Sutton', '22 Alana Road', '16981');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000892, 'Julianne', 'Guadalajara', '69 Moraz Road', '5280');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000893, 'Trini', 'Neuch?tel', '17 Quentin Drive', '3565');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000894, 'Micky', 'Roanoke', '88 Evans Road', '20780');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000895, 'Bob', 'Tokyo', '38 Hutton Street', '5828');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000896, 'Shannon', 'Wichita', '98 Hal Street', '32119');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000897, 'Zooey', 'Saint Paul', '9 Moffat Street', '23078');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000898, 'Aida', 'High Wycombe', '37 St Kilda Road', '7Y7 7P0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000899, 'Jonathan', 'Leeds', '63 Belle Drive', '1R1 5T0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000900, 'Jena', 'durham', '63 Villata Street', '4G7 8C4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000901, 'Ray', 'Mount Laurel', '69 Hampton Road', '34533');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000902, 'Neneh', 'Trenton', '90 Aachen Road', '4239');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000903, 'Daryl', 'Oppenheim', '60 Waldbronn Street', '3752');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000904, 'Mili', 'Olympia', '41st Street', '14272');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000905, 'Dabney', 'Atlanta', '60 Wainwright Street', '10467');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000906, 'Oded', 'Carson City', '85 Suchet Drive', '30952');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000907, 'Albert', 'Neuquen', '82 Owen Street', '20178');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000908, 'Nathan', 'Dunn loring', '149 Elvis Ave', '24520');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000909, 'Sylvester', 'Michendorf', '91 Masur Road', '32389');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000910, 'Uma', 'Ohtsu', '73rd Street', '19800');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000911, 'Drew', 'Rua eteno', '31 Tustin Street', '7806');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000912, 'Nathan', 'Cromwell', '89 Gere Street', '20814');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000913, 'Al', 'Padova', '66 Glasgow Road', '19556');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000914, 'Anthony', 'K?benhavn', '8 Debary Street', '20617');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000915, 'Goran', 'Wavre', '56 Tooele Street', '14189');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000916, 'Terry', 'Slidel', '49 Encinitas Road', '17585');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000917, 'Pam', 'Sheffield', '132 Istanbul Road', '6D0 2M3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000918, 'Brian', 'Cuenca', '53rd Street', '27235');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000919, 'Hector', 'Northampton', '64 James Road', '3Y6 3K5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000920, 'Toni', 'Fukushima', '82 Maureen Road', '13723');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000921, 'Ron', 'Altamonte Springs', '72 Keeslar Drive', '5091');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000922, 'Jena', 'Boise', '70 Belles Blvd', '22638');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000923, 'Frankie', 'Leinfelden-Echterdin', '70 Mac', '35801');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000924, 'Dustin', 'Herford', '64 Holland Road', '13970');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000925, 'Albert', 'Annandale', '801 Venora Drive', '20411');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000926, 'Sona', 'Caracas', '48 Mahood Street', '9343');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000927, 'Chant?', 'San Antonio', '52nd Street', '18380');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000928, 'Quentin', 'Omaha', '136 Juazeiro', '11681');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000929, 'Madeline', 'Oxon', '62 Ivan Ave', '6N4 4P5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000930, 'Ving', 'Colombo', '30 Omar', '31662');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000931, 'Brittany', 'Chennai', '62nd Street', '28779');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000932, 'Lennie', 'Koblenz', '67 Jack Road', '17525');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000933, 'Ty', 'San Ramon', '86 Rio Street', '8010');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000934, 'Brittany', 'Kista', '13 Nile Street', '19966');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000935, 'Taye', 'Rosario', '14 Avril Blvd', '33335');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000936, 'Lynette', 'Waite Park', '23 Friedrichshafe Ro', '3689');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000937, 'Hookah', 'Harrisburg', '96 Klein Blvd', '34813');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000938, 'Ving', 'Annandale', '40 Berkeley Drive', '19236');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000939, 'Michelle', 'Den Haag', '60 Freiburg Street', '1257XH');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000940, 'Jaime', 'Annandale', '84 Brooke Ave', '33737');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000941, 'Kiefer', 'Santana do parna?ba', '99 Newton-le-willows', '40684');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000942, 'Denny', 'Edison', '69 Edie Road', '8274');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000943, 'Gil', 'Lund', '406 Sacramento Road', '7112');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000944, 'Barbara', 'Warren', '923 Fox', '18119');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000945, 'Olga', 'Suffern', '66 Celia', '13859');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000946, 'Meredith', 'Paramus', '72 Ann Road', '3388');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000947, 'Nicolas', 'Bad Camberg', '9 April Street', '38153');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000948, 'Lisa', 'Carlin', '82 Tartu Street', '32904');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000949, 'Tamala', 'Oshawa', '401 Cuba Drive', '5G7 1F9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000950, 'Seth', 'W?rzburg', '15 Carter Drive', '18413');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000951, 'Nik', 'Tulsa', '76 LaPaglia Road', '2929');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000952, 'Hal', 'Yucca', '172 Broza', '17949');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000953, 'Balthazar', 'Sarasota', '164 Seongnam-si Blvd', '2092');
commit;
prompt 1100 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000954, 'Murray', 'Vilafranca Penedes', '721 Sarah Street', '24600');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000955, 'Anna', 'Staten Island', '76 Aiken Road', '4855');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000956, 'Vickie', 'Wien', '49 Wong Drive', '21231');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000957, 'Moe', 'Wuerzburg', '60 Jake Ave', '8646');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000958, 'Elijah', 'Redmond', '37 Balaban Blvd', '36407');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000959, 'Rebeka', 'Southampton', '63rd Street', '5P1 9B2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000960, 'Rade', 'Cobham', '91st Street', '7S4 8X8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000961, 'Holland', 'Gainesville', '84 Chappelle Blvd', '31825');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000962, 'Hope', 'Schaumburg', '6 Edmunds Street', '15590');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000963, 'Pablo', 'Magstadt', '507 Lynne', '13254');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000964, 'Maura', 'Stans', '23rd Street', '23345');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000965, 'Albert', 'Orlando', '97 Lucas Street', '32527');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000966, 'Juan', 'Lake Oswego', '908 Dorval Road', '33999');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000967, 'Gena', 'Chiba', '9 Liotta', '6488');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000968, 'Miguel', 'Athens', '98 Warden Drive', '35040');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000969, 'Jonatha', 'Lehi', '80 Anchorage Road', '5511');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000970, 'Katie', 'Istanbul', '59 Flatts Street', '21570');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000971, 'Talvin', 'Luedenscheid', '77 Weiland Drive', '25197');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000972, 'Geraldine', 'Blue bell', '68 Maidstone Street', '32004');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000973, 'Josh', 'Geneva', '25 Alda Drive', '13030');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000974, 'Tobey', 'Annandale', '56 Owen Road', '34679');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000975, 'Harris', 'Sugar Land', '62nd Street', '37136');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000976, 'Ron', 'Courbevoie', '78 Broza Road', '16936');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000977, 'Tilda', 'Boulder', '64 Khan Drive', '29348');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000978, 'Arnold', 'Offenburg', '9 Nils Drive', '38552');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000979, 'Freddy', 'Woodland Hills', '53rd Street', '38344');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000980, 'Luis', 'Unionville', '83 Kyoto Drive', '0K2 2X0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000981, 'Paul', 'Manchester', '88 Downie Drive', '0R3 1P9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000982, 'Pam', 'Ravensburg', '943 Supernaw Road', '12284');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000983, 'Udo', 'Milpitas', '87 Vendetta Road', '32054');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000984, 'Boyd', 'Madrid', '93rd Street', '10956');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000985, 'Tcheky', 'Holderbank', '16 Rothenburg Drive', '32109');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000986, 'Kathleen', 'Tokushima', '47 Benoit Drive', '6761');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000987, 'Simon', 'Stockholm', '77 Geoff', '17246');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000988, 'Demi', 'Budapest', '54 Rosanne Road', '8831');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000989, 'Jeff', 'Ferraz  vasconcelos', '5 Sapporo Road', '31498');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000990, 'Garth', 'Johannesburg', '74 Milla Street', '29603');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000991, 'Angela', 'Hyderabad', '70 Suzi Road', '28402');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000992, 'Ali', 'Cherepovets', '28 Mt. Laurel Street', '2201');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000993, 'Toni', 'Istanbul', '12nd Street', '10734');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000994, 'Dabney', 'Newcastle upon Tyne', '82 Spector Street', '8C7 4N3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000995, 'Marisa', 'Crete', '95 Monroe Ave', '34690');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000996, 'Embeth', 'Lima', '43 Day Drive', '15802');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000997, 'Lee', 'Bekescsaba', '8 Creek Street', '30716');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000998, 'Regina', 'Eindhoven', '92nd Street', '8528SX');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000999, 'Pete', 'Pearland', '53 Glenshaw', '22769');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001000, 'Peter', 'Lucca', '96 Purefoy Street', '39511');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001001, 'Eddie', 'Taoyuan', '46 Kopavogur', '19078');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001002, 'Laurence', 'Carlin', '34 Andre', '19931');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001003, 'Lionel', 'Walnut Creek', '69 Irene Road', '9817');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001004, 'Danny', 'Halfway house', '86 Chung Street', '29675');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001005, 'Ritchie', 'Eisenh?ttenstadt', '47 Balaban Road', '2166');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001006, 'Fisher', 'Enfield', '718 Rundgren Street', '7J2 5Y4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001007, 'Pelvic', 'Milwaukee', '98 Gin Street', '17789');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001008, 'Chely', 'Valencia', '576 Cannock Ave', '10394');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001009, 'Jonathan', 'Oldenburg', '39 Latifah Drive', '37601');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001010, 'Balthazar', 'Pensacola', '97 Terrence Road', '4090');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001011, 'Gino', 'Woodbridge', '94 Miriam Street', '39234');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001012, 'Johnnie', 'Edinburgh', '23rd Street', '8Q9 2Q0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001013, 'Mira', 'Newnan', '66 Trick Drive', '12095');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001014, 'Patti', 'Barcelona', '21 Flack Street', '33559');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001015, 'Brad', 'Glen allen', '21 Curtis Road', '6788');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001016, 'Tea', 'Eschen', '2 Loreena Blvd', '6270');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001017, 'Jet', 'Qu?bec', '33rd Street', '3R6 0F6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001747, 'Madeline', 'Appenzell', '3 Sydney Road', '18248');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001748, 'Brendan', 'Freiburg', '87 Kyra Road', '39915');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001749, 'Andrew', 'Bolton', '715 G?vle Road', '3Y5 1A1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001750, 'Alex', 'Matsuyama', '97 Fisher', '35587');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001751, 'Lara', 'Adamstown', '76 Willie Road', '5130');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001752, 'LeVar', 'Gersthofen', '510 Nigel Drive', '4936');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001753, 'Trini', 'Pompeia', '17 Cusack Road', '39651');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001754, 'Lin', 'Sidney', '256 Lisa Drive', '6O8 5G4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001755, 'Ewan', 'Gummersbach', '147 Regina Street', '24933');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001756, 'Lara', 'Daejeon', '4 Dean Road', '34067');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001757, 'Andy', 'Maebashi', '59 Liam Road', '26004');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001758, 'Percy', 'Berkshire', '888 Hirsch Drive', '8D7 2J0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001759, 'Liquid', 'Kaunas', '79 Evans Road', '11300');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001760, 'Kathy', 'Woking', '91st Street', '5G3 9E2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001761, 'Amy', 'Bloomington', '88 Holts Summit Road', '21683');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001762, 'Bob', 'Carlingford', '29 Verdun', '26161');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001763, 'Chalee', 'Natal', '54 Dennis Ave', '27829');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001764, 'Gina', 'Pa?o de Arcos', '41 Araras Blvd', '4433');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001765, 'Bette', 'Debary', '4 Ike Road', '28125');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001766, 'Murray', 'Ebersdorf', '87 Batavia', '38129');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001767, 'Alan', 'Tampa', '48 Barcelona Drive', '17697');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001768, 'Horace', 'Karlsruhe', '45 Shepherd Ave', '18432');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001769, 'Coley', 'Hermitage', '22 Minnie Road', '39817');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001770, 'Glen', 'Burr Ridge', '99 Franks Road', '10466');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001771, 'Wesley', 'Huntington', '19 Carrere', '24557');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001772, 'Harriet', 'Waltham', '13 Statham Blvd', '21884');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001773, 'Maggie', 'Orleans', '30 Hopkins Drive', '6939');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001774, 'Maureen', 'Mexico City', '40 Isaiah Road', '15682');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001775, 'Barbara', 'Slmea', '97 Conlee Road', '7935');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001776, 'Patricia', 'Naha', '22 Irons Road', '2404');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001777, 'Garland', 'Milford', '67 Dean Street', '22227');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001778, 'Tamala', 'Timonium', '10 Bill Ave', '16514');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001779, 'Maxine', 'Wilmington', '53 Rebhorn Ave', '15073');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001780, 'Spencer', 'Firenze', '17 Horb Ave', '16869');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001781, 'Keanu', 'Dublin', '47 Winans Drive', '2927');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001782, 'Brenda', 'Bay Shore', '48 Spector Ave', '2726');
commit;
prompt 1200 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001783, 'Ashton', 'Carson City', '1 Marsden Drive', '23808');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001784, 'Giovanni', 'Monterrey', '22 Visnjic Road', '24164');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001785, 'Jody', 'Johor Bahru', '15 Plowright Street', '21093');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001786, 'Kieran', 'Lenexa', '80 Hilary Street', '38780');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001787, 'Meryl', 'Gauteng', '55 Taye Road', '22108');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001788, 'Alex', 'Delafield', '97 Chely Street', '28488');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001789, 'Jim', 'Biella', '63 Pretoria Road', '29247');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001790, 'Jackson', 'Chorz?w', '46 Suzi Drive', '33547');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001791, 'Austin', 'Salzburg', '12 Rudd Street', '32515');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001792, 'Jeanne', 'Battle Creek', '98 Guzman Street', '31529');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001793, 'Harrison', 'Peterborough', '697 Mantegna Road', '17101');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001794, 'Brad', 'Kaohsiung', '85 Maxwell Road', '34721');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001795, 'Anita', 'Bergara', '842 Spiner Drive', '19022');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001796, 'Debra', 'Huntington', '52nd Street', '17904');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001797, 'Tamala', 'Gen?ve', '43 Bridges Ave', '11600');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001798, 'Roberta', 'Aachen', '45 Kazem Street', '2873');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001799, 'Bette', 'Annandale', '52nd Street', '36165');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001800, 'Cornell', 'Unionville', '69 Juno Beach Drive', '9G6 4G6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001801, 'Holly', 'Pecs', '674 McCready', '12846');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001802, 'Suzi', 'North Sydney', '15 Brosnan Road', '40008');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001803, 'Dom', 'North Wales', '35 Bentley Drive', '38920');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001804, 'Chet', 'Ringwood', '15 Redwood Shores St', '12774');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001805, 'Taryn', 'Dresden', '802 CeCe Blvd', '18739');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001806, 'Nicholas', 'Marburg', '93 New Hyde Park Str', '12939');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001807, 'Noah', 'Geneve', '39 France Ave', '31362');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001808, 'Crystal', 'Peterborough', '76 Roger Drive', '32636');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001809, 'Emmylou', 'Coventry', '596 Makeba Street', '7U1 0D4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001810, 'Drew', 'Germantown', '82 Berwyn Road', '2232');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001811, 'Cyndi', 'Bloomington', '57 Herbie Street', '20839');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001812, 'Pelvic', 'Bozeman', '37 Mohr Street', '10214');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001813, 'Benicio', 'Tbilisi', '11st Street', '29269');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001814, 'Dwight', 'Sao jose rio preto', '55 Cledus Street', '15200');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001815, 'Rene', 'Rua eteno', '56 Carlisle Ave', '14803');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001816, 'Freda', 'Oklahoma city', '11st Street', '34030');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001817, 'Donald', 'Seongnam-si', '46 Checker Street', '36279');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001818, 'Lena', 'Ft. Leavenworth', '44 Mary-Louise Drive', '39759');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001819, 'Clint', 'Ciudad del Este', '55 Kinney Street', '5754');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001820, 'Suzanne', 'Sarasota', '42 Visnjic Street', '1192');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001821, 'James', 'Menlo Park', '13rd Street', '26024');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001822, 'Kieran', 'Forest Park', '99 Jim Street', '31310');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001823, 'CeCe', 'Rocklin', '55 Almaty Drive', '22863');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001824, 'Warren', 'Tustin', '65 Imperioli Road', '34806');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001825, 'Murray', 'Bellerose', '16 Rizzo Ave', '25564');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001826, 'Vienna', 'Bolzano', '14 Micky Blvd', '37758');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001827, 'Rachel', 'Pa?o de Arcos', '38 Carrie Drive', '26962');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001828, 'Don', 'Uetikon am See', '67 Fisher Street', '20185');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001829, 'Ossie', 'Eschen', '71 Mandrell Street', '3100');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001830, 'Steven', 'Colorado Springs', '219 Jake Street', '22227');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001831, 'Lin', 'Biel', '3 Valencia', '31242');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001832, 'Cary', 'Washington', '63 Holland', '30095');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001833, 'Candice', 'Harrisburg', '69 Tokushima Road', '20260');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001834, 'Tara', 'Highlands Ranch', '66 Krabbe', '23231');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001835, 'Patrick', 'Knutsford', '14 Ward Street', '9V0 7D7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001836, 'Geena', 'Hearst', '65 Rain Blvd', '0W5 5H5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001837, 'Andrae', 'Lenexa', '334 Lattimore Street', '7575');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001838, 'Rod', 'Port Macquarie', '931 Murray Drive', '2194');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001839, 'Dennis', 'Dreieich', '541 McIntyre Street', '1675');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001840, 'Chely', 'Niles', '56 Cuenca Road', '3844');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001841, 'Ty', 'Regina', '24 Campbell Road', '2C2 2X7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001842, 'Natascha', 'Lenexa', '92 Raitt Street', '23024');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001843, 'Fred', 'Oshawa', '32nd Street', '3P1 9C3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001844, 'Patty', 'Tooele', '48 Roy Ave', '8654');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001845, 'Albert', 'Piacenza', '78 Kennedy Road', '5663');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001846, 'Tanya', 'Parma', '164 Buffalo Ave', '4505');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001847, 'Joanna', 'Cesena', '47 Dom Drive', '19573');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001848, 'Lily', 'Mayfield Village', '90 Chubby Blvd', '35933');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001849, 'Meryl', 'Market Harborough', '93 Joaquin', '8O6 7O9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001850, 'Tara', 'Santorso', '61 Debi Drive', '10840');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001851, 'Ruth', 'Conshohocken', '591 Natascha Road', '23905');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001852, 'Mena', 'Thessaloniki', '32 Carrey Street', '22417');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001853, 'Luke', 'West Windsor', '985 Stallone', '31539');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001854, 'Carl', 'Macclesfield', '125 Cotton Road', '0Q8 9W5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001855, 'Kris', 'L?beck', '70 Hewitt Street', '39458');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001856, 'Jane', 'Boucherville', '4 Allison Blvd', '3M8 8M2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001857, 'Brent', 'Vallauris', '97 McElhone', '32955');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001858, 'Alice', 'Pecs', '55 Mazzello Drive', '25659');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001859, 'Sarah', 'Duisburg', '74 Charlottesville S', '28894');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001860, 'Chi', 'Rueil-Malmaison', '63 North Yorkshire R', '21926');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001861, 'Belinda', 'Durham', '209 Snider Ave', '7581');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001862, 'Stewart', 'Buffalo Grove', '9 Tokushima Road', '21657');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001863, 'Ritchie', 'Batavia', '82nd Street', '12516');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001864, 'Vin', 'Salt Lake City', '653 Joely Road', '35983');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001865, 'Cherry', 'Houma', '15 Chinnor Road', '20333');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001866, 'Jamie', 'Oslo', '83rd Street', '14095');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001867, 'Garland', 'Malm?', '50 Michael Road', '21668');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001868, 'Noah', 'Olsztyn', '42 Northbrook Drive', '19277');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001869, 'Louise', 'Coldmeece', '69 Gandolfini Street', '7N8 8X9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001870, 'Brooke', 'Johor Bahru', '74 Donovan Road', '26746');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001871, 'Dionne', 'Rueil-Malmaison', '75 Fort Lewis Road', '18846');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001872, 'Juliana', 'Sheffield', '838 Sweeney Street', '5H2 6Y0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001873, 'Paula', 'Cromwell', '32 Lengdorf Street', '19028');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001874, 'Mark', 'Pusan-city', '110 Hayek Drive', '10436');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001875, 'Harriet', 'Thames Ditton', '36 Tracy Street', '4R3 6X1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001876, 'Janice', 'Jun-nam', '34 Moorer Drive', '24421');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001877, 'Nora', 'Ft. Leavenworth', '8 Kilmer Ave', '23996');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001878, 'Freddie', 'Lisbon', '937 Caine Drive', '4196');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001879, 'Luis', 'Longview', '20 Ermey Street', '17780');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001880, 'Cole', 'Raleigh', '676 Hatfield Ave', '15275');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001881, 'Jean-Luc', 'San Mateo', '325 Sayer Ave', '36517');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001882, 'Anjelica', 'Sheffield', '40 Sherman', '0Q6 5G5');
commit;
prompt 1300 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001883, 'Linda', 'Knoxville', '11 Mantegna Drive', '25044');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001884, 'Thelma', 'Bedford', '87 Rollins Street', '10944');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001885, 'Clarence', 'Mississauga', '85 Berkoff Drive', '0G7 2A1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001886, 'Frank', 'Telford', '93 Quinn Road', '7S9 7S2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001887, 'Angelina', 'Woodland Hills', '100 Christine Ave', '5663');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001888, 'Lara', 'Burlington', '71 Micky Street', '15033');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001889, 'Jesse', 'Immenstaad', '756 Bradford Road', '8310');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001890, 'Bridget', 'Duesseldorf', '64 Broadbent Street', '12022');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001165, 'Benicio', 'Salzburg', '14 Matthau Blvd', '14631');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001166, 'Collin', 'Sendai', '32 Antwerpen Drive', '8790');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001167, 'Ramsey', 'Tualatin', '6 Morioka Ave', '12702');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001168, 'Nicolas', 'Tualatin', '38 Botti', '2592');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001169, 'Treat', 'Billerica', '92 Erpe-Mere Ave', '36430');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001170, 'Gates', 'Auckland', '17 Maxine Street', '10458');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001171, 'Geggy', 'Encinitas', '14 Brody', '40953');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001172, 'Rebeka', 'Lake Forest', '576 Powell River Dri', '9106');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001173, 'Jody', 'Princeton', '21 Aaron Ave', '18445');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001174, 'Elisabeth', 'Wien', '315 Forster Road', '5716');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001175, 'Will', 'Kopavogur', '19 Campinas', '31298');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001176, 'Malcolm', 'Flushing', '734 Matarazzo Street', '34519');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001177, 'Trini', 'Balmoral', '43 Washington Road', '26454');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001178, 'First', 'Redwood City', '997 Guilfoyle Drive', '34319');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001179, 'Sal', 'Reno', '85 Chris', '16023');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001180, 'Nikka', 'Bellevue', '37 Niven Blvd', '38872');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001181, 'Owen', 'Miyazaki', '382 Kapanka Road', '3107');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001182, 'Uma', 'Laredo', '23 Fair Lawn Road', '33567');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001183, 'Annette', 'Sevilla', '490 Leeds Drive', '13585');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001184, 'Corey', 'Gaza', '26 Trejo Road', '38130');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001185, 'Terrence', 'Barcelona', '974 Jena Road', '5301');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001186, 'Chloe', 'Biel', '6 Isabella Street', '25940');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001187, 'Jesse', 'Ulsteinvik', '91 Berkeley Street', '22598');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001188, 'Jimmie', 'Austin', '34 Waite Park Road', '36148');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001189, 'Salma', 'Appenzell', '677 Royston Drive', '21702');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001190, 'Miranda', 'Paderborn', '20 Bologna Road', '12634');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001191, 'Denise', 'Butner', '95 Herndon Ave', '27592');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001192, 'Suzy', 'Stony Point', '1 Alec Ave', '27424');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001193, 'Mos', 'Gliwice', '23 Bratt Street', '2674');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001194, 'Jamie', 'Dinslaken', '377 Larnelle Ave', '1798');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001195, 'Miranda', 'Essex', '81 Azaria Drive', '5A6 7O1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001196, 'Doug', 'Regina', '82 Kate Drive', '7E5 1F9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001197, 'Bill', 'Richmond', '80 Corey', '14250');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001198, 'Richie', 'Maidstone', '24 Melanie Street', '0I2 7A6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001199, 'Anna', 'Irkutsk', '98 Elias', '12709');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001200, 'Raul', 'Milwaukee', '63rd Street', '18526');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001201, 'Eric', 'Mobile', '23rd Street', '10915');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001202, 'Victoria', 'Farmington Hills', '77 Northampton Stree', '18063');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001203, 'Gavin', 'Copenhagen', '73rd Street', '9891');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001204, 'Keith', 'Rochester', '841 Benet Road', '36474');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001205, 'Angelina', 'New Fairfield', '35 S?o paulo Road', '14841');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001206, 'Christian', 'Raleigh', '61 Leguizamo Drive', '12197');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001207, 'Melanie', 'H?ssleholm', '971 Collette Ave', '19451');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001208, 'Candice', 'Odense', '650 Gilberto Road', '39637');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001209, 'Burton', 'Breda', '57 Laws', '4283KP');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001210, 'Gina', 'New Hope', '51 Thelma Street', '16847');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001211, 'Anthony', 'Tulsa', '41st Street', '29118');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001212, 'Hugh', 'Reading', '81 Jonze Road', '9D5 0M0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001213, 'Gwyneth', 'Bruneck', '68 Reubens Street', '15265');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001214, 'Amanda', 'Dinslaken', '29 Jennifer Blvd', '30067');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001215, 'Kid', 'Wuerzburg', '68 Nakai Ave', '36343');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001216, 'Horace', 'B?nes', '96 Kieran Road', '2789');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001217, 'Holly', 'Manchester', '41 Davies Blvd', '23893');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001218, 'Cledus', 'Bristol', '58 Bo Road', '22259');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001219, 'Vickie', 'Sundsvall', '22 Gothenburg Drive', '27431');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001220, 'Thora', 'Toledo', '91 Blue bell Road', '20260');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001221, 'Dabney', 'Kevelaer', '46 Burrows Street', '30190');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001222, 'Bruce', 'East Providence', '11 Steiger Street', '5215');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001223, 'Eliza', 'Ponta grossa', '607 Burton Road', '3383');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001224, 'Orlando', 'Glenshaw', '198 West Chester', '23681');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001225, 'Samantha', 'Brampton', '67 Foster Drive', '8Y3 2D1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001226, 'Blair', 'Th?rishaus', '1 Kinski Road', '23009');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001227, 'Merillee', 'Riverdale', '44 Blige Street', '8123');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001228, 'Ian', 'Exeter', '37 Sigourney Ave', '10834');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001229, 'Eugene', 'Ringwood', '50 Redmond Road', '23785');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001230, 'Crystal', 'Leverkusen', '90 Bale Ave', '26470');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001231, 'Lauren', 'Bloemfontein', '311 Vista Street', '5043');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001232, 'Vienna', 'Santa rita sapuca?', '35 Hannah Ave', '33104');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001233, 'Ricardo', 'Bloemfontein', '84 Hatosy Drive', '17542');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001234, 'Emmylou', 'Manchester', '84 San Dimas Street', '8Z4 4N6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001235, 'Kris', 'San Francisco', '40 Oulu Drive', '37865');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001236, 'Jamie', 'Maidstone', '12nd Street', '7W6 9S3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001237, 'Susan', 'Miami', '42nd Street', '26694');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001238, 'Frank', 'West Chester', '66 Boz Road', '15729');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001239, 'Madeline', 'Olsztyn', '31 Hauer Road', '26572');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001240, 'Burton', 'Riverdale', '53 Collins Drive', '28767');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001241, 'Olympia', 'Lund', '603 Mayfield Village', '37050');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001242, 'Donna', 'Narrows', '11st Street', '2750');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001243, 'James', 'Portsmouth', '807 Vannelli Drive', '31779');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001244, 'Rod', 'Cedar Park', '80 Carolyn Road', '33642');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001245, 'Casey', 'Takapuna', '815 Lea Road', '14654');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001246, 'Leelee', 'Flushing', '21 Walken Blvd', '21885');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001247, 'Leo', 'Rochester', '75 Galecki Road', '20824');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001248, 'Wallace', 'Rueil-Malmaison', '216 Delbert Drive', '7502');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001249, 'Garland', 'Ismaning', '58 Roy Parnell Road', '3152');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001250, 'Patty', 'Santana do parna?ba', '14 Z?rich Road', '26263');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001251, 'Rodney', 'Redhill', '28 Martin Street', '4L4 9E6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001252, 'Randy', 'Pearland', '88 Kelly Ave', '29883');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001253, 'Freda', 'Alcobendas', '49 McGovern Drive', '22889');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001254, 'Aidan', 'Duisburg', '95 Hilton Street', '31642');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001255, 'Jake', 'Enschede', '60 Martin Street', '9141NK');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001256, 'Alice', 'Saint Paul', '58 Sao roque Street', '2248');
commit;
prompt 1400 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001257, 'Delbert', 'Yomgok-dong', '53 Begley Blvd', '36253');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001258, 'Colin', 'Shreveport', '99 Astin Road', '24652');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001259, 'Edward', 'Thessaloniki', '308 Tyson Road', '20760');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001260, 'Bradley', 'Leipzig', '59 Rueil-Malmaison S', '34623');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001261, 'Rickie', 'Orlando', '79 Shaye Drive', '29267');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001262, 'Richie', 'Tilst', '55 Russo Road', '10891');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001263, 'Ian', 'La Plata', '75 Brody Drive', '3862');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001264, 'Bernard', 'Marburg', '76 Marley Street', '30332');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001265, 'Derrick', 'Minneapolis', '65 Rachid Road', '26028');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001266, 'Matt', 'Ismaning', '18 Mandrell Road', '4893');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001267, 'Jackie', 'Delafield', '55 Mechelen Drive', '26532');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001268, 'Joaquin', 'Utsunomiya', '79 Carrey Street', '30574');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001269, 'Rutger', 'Arlington', '131 Hong Road', '30794');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001270, 'Parker', 'Tilburg', '72 Malcolm Street', '7230YJ');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001271, 'Nik', 'Qu?bec', '81 Young Road', '3O6 8I3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001272, 'Jarvis', 'Waldbronn', '935 Bremen Street', '31514');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001273, 'Tracy', 'P?tion-ville', '91st Street', '14422');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001274, 'Samantha', 'K?ln', '92 Westerberg Street', '37824');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001275, 'Humberto', 'Porto alegre', '44 Coltrane Ave', '6881');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001276, 'Steve', 'Portland', '757 Friedrichshafe D', '21821');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001277, 'Louise', 'Gdansk', '82nd Street', '34617');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001278, 'Celia', 'Edison', '80 Zahn Drive', '26185');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001279, 'Clarence', 'Yogyakarta', '679 Pomona Street', '35968');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001280, 'Dabney', 'Knutsford', '24 Patton Road', '1O0 5D1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001281, 'Mia', 'Lubbock', '56 Slmea Street', '35872');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001282, 'Robby', 'Kaunas', '137 Derek Drive', '1665');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001283, 'Cliff', 'Sale', '24 Reeves Drive', '0Q1 0V9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001284, 'Lizzy', 'Kyoto', '468 Dayne Drive', '32407');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001285, 'Chet', 'S?o paulo', '5 McCann Blvd', '4834');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001286, 'Lee', 'Maebashi', '30 L?beck Road', '1646');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001287, 'Arnold', 'Zafferana Etnea', '7 Neil Blvd', '28038');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001288, 'Danni', 'Vaduz', '48 Christopher Stree', '12784');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001289, 'Kurt', 'San Jose', '60 Le chesnay Street', '25640');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001290, 'Temuera', 'Veenendaal', '770 Nik Drive', '5694UE');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001291, 'Aidan', 'Venice', '89 Coleman Street', '8376');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001292, 'Katrin', 'Singapore', '72 Amarillo Road', '17825');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001293, 'Joe', 'Dunn loring', '12nd Street', '6509');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001294, 'Kieran', 'Farnham', '568 Elliott', '0D0 6S7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001295, 'Quentin', 'Rochester', '34 Kungens kurva Roa', '8671');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001296, 'Chubby', 'Zipf', '22nd Street', '19925');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001297, 'Rolando', 'Reno', '79 Mel Drive', '33188');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001298, 'Loren', 'Terrasa', '12nd Street', '12607');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001299, 'Melanie', 'Salt Lake City', '388 Tokushima Road', '30432');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001300, 'Rupert', 'Oldenburg', '84 Gene Street', '4219');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001301, 'Tracy', 'Holderbank', '9 Carter Road', '16584');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001302, 'Denis', 'Libertyville', '83 Mohr Drive', '24891');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001303, 'Albert', 'Monument', '46 Nicky Street', '22070');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001304, 'Jake', 'Silver Spring', '94 Studi Road', '21286');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001305, 'Art', 'Las Vegas', '50 Jesse Street', '14379');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001306, 'Harrison', 'Barueri', '61st Street', '35079');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001307, 'Sophie', 'Stafford', '45 Gambon Road', '21636');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001308, 'Lennie', 'Johor Bahru', '54 Hatchet Drive', '1937');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001309, 'Emmylou', 'Staten Island', '838 Aurora Road', '14950');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001310, 'Busta', 'Maserada sul Piave', '18 Marlon Road', '35187');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001311, 'John', 'Irving', '12 Carlyle Road', '14505');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001312, 'Morris', 'Shoreline', '62 Christie', '3777');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001313, 'Radney', 'Concordville', '818 Braintree Road', '2293');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001314, 'Rachel', 'Malm?', '23 Lucas Street', '16881');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001315, 'Mary-Louise', 'Laurel', '97 Clarence Blvd', '10029');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001316, 'Laura', 'W?rzburg', '73 Sarsgaard Ave', '23636');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001317, 'Meryl', 'Mechanicsburg', '66 K?benhavn Road', '39504');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001318, 'Bebe', 'Ehningen', '90 Lathrop Road', '7685');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001319, 'Ty', 'New Hope', '41st Street', '28013');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001320, 'Rebecca', 'Slidel', '54 Jane Street', '15419');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001321, 'Julianne', 'Lowell', '7 Perrineau Blvd', '25847');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001322, 'Tony', 'Rosario', '28 Lloyd Street', '27541');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001323, 'Victor', 'Kumamoto', '99 Ontiveros Drive', '26024');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001324, 'Lindsey', 'Sarasota', '72nd Street', '15201');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001325, 'Adam', 'Karachi', '141 Will', '2045');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001326, 'Saul', 'Turku', '82 Cleveland Blvd', '12719');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001327, 'Ricky', 'Bremen', '33rd Street', '28718');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001328, 'Lara', 'Miyazaki', '20 Copeland Street', '1536');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001329, 'Fisher', 'Mechanicsburg', '779 Coolidge Street', '7510');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001330, 'Tal', 'Rueil-Malmaison', '55 Cusack Street', '24620');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001331, 'Sissy', 'Saga', '88 Uma Road', '34777');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001332, 'Natalie', 'Drogenbos', '11 Kidman', '15226');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001333, 'Rawlins', 'Braintree', '401 Ponty Road', '3X7 2O8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001334, 'Holly', 'Victoria', '41st Street', '5L1 9G9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001335, 'Kid', 'Ani?res', '33 Avital Street', '29983');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001336, 'Madeline', 'Eden prairie', '49 Somerset Road', '16258');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001337, 'Jessica', 'Oklahoma city', '65 Barry Road', '33131');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001338, 'George', 'Cardiff', '79 Zappacosta Drive', '1J9 7G6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001339, 'Suzi', 'Manchester', '70 Lynn Street', '6W7 8I4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001340, 'Derrick', 'Toulouse', '792 Chet Road', '40040');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001341, 'Julie', 'Swarthmore', '7 Van Der Beek Road', '12932');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001342, 'Norm', 'Saint Paul', '84 Kathy Street', '20637');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001343, 'Jeroen', 'New Hope', '21 Pusan Ave', '4486');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001344, 'Jason', 'Narrows', '67 Stallone Road', '36434');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001345, 'Dermot', 'Berkeley', '76 Ifans Road', '32992');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001346, 'Crispin', 'Barcelona', '13 Roundtree Ave', '21160');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001347, 'Viggo', 'Belgrad', '42 Gummersbach', '20018');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001348, 'Rhys', 'Gliwice', '70 Jeffery', '17714');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001349, 'Olympia', 'Fairborn', '33 Margulies Street', '39436');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001350, 'Ralph', 'Stavanger', '56 Connie Blvd', '15522');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001351, 'Remy', 'Netanya', '63rd Street', '8201');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001352, 'Liquid', 'Colombes', '18 Biel Road', '14515');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001353, 'Josh', 'Lake Bluff', '18 Bern Street', '38369');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001354, 'Terry', 'Oulu', '32 Ferrell', '26166');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001355, 'Colm', 'Portland', '94 Allison Road', '13719');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001356, 'Ronnie', 'Odense', '17 Tampa Road', '4623');
commit;
prompt 1500 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001357, 'Jody', 'Den Haag', '36 Senior Drive', '8971WP');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001358, 'Nick', 'San Ramon', '89 Fort McMurray Str', '34297');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001359, 'Ashton', 'Holderbank', '80 Portland Drive', '18995');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001360, 'Humberto', 'Middleburg Heights', '6 Rob Drive', '25385');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001361, 'Chuck', 'Huntsville', '22nd Street', '31478');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001362, 'Tobey', 'Pasadena', '10 Nicholson Blvd', '35677');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001363, 'Debby', 'Ribeirao preto', '87 Samrand Drive', '7868');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001364, 'Brendan', 'K?benhavn', '57 Moorer Street', '23831');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001365, 'Liam', 'Mito', '709 Hyde Road', '27549');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001366, 'Irene', 'Gainesville', '4 Jean-Luc Road', '36474');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001367, 'Robert', 'Enschede', '91 Hawn Street', '3477IF');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001368, 'Oro', 'Brisbane', '46 Del Toro Drive', '28065');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001369, 'Stellan', 'Gifu', '17 Chapman Blvd', '10972');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001370, 'Lee', 'St. Louis', '9 Northbrook Road', '21656');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001371, 'Dennis', 'Santa Clarat', '5 Strong Drive', '3O6 6A7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001372, 'Nils', 'Mississauga', '92 Jamal Ave', '7R1 3Y1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001373, 'Gino', 'M?nchengladbach', '18 Keith Road', '10010');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001374, 'Dabney', 'Jun-nam', '62 George', '23835');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001375, 'Davy', 'Chicago', '87 Coyote Street', '17098');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001376, 'Humberto', 'Coppell', '65 Arlington', '27201');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001377, 'Carrie', 'Taoyuan', '96 Haggard Drive', '24101');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001378, 'Lin', 'Pusan', '57 Prague Street', '31239');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001379, 'Grace', 'Mechanicsburg', '66 Manning Drive', '21144');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001380, 'Faye', 'Sydney', '16 New Fairfield Roa', '20978');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001381, 'Karon', 'Tempe', '92nd Street', '33434');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001382, 'Swoosie', 'Reno', '34 Griggs Street', '38413');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001383, 'Carl', 'Hochwald', '42nd Street', '24214');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001384, 'Lauren', 'Richardson', '2 Dorff Road', '22594');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001385, 'Darius', 'Hounslow', '100 Farmington Hills', '0E3 7K5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001386, 'Shannyn', 'Stavanger', '79 Cara Drive', '16559');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001387, 'Bret', 'Fountain Hills', '63 Kenneth Drive', '25049');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001388, 'Kirk', 'Horb', '83rd Street', '29212');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001389, 'Chuck', 'Bangalore', '100 Jamie', '10193');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001390, 'William', 'Fuchstal-asch', '93 Zevon Road', '27603');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001391, 'Tal', 'Bristol', '69 Taryn Drive', '7V7 3B2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001392, 'Maureen', 'Moorestown', '94 Ratzenberger Driv', '25951');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001393, 'Balthazar', 'West Launceston', '3 Sharon', '2103');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001394, 'Jeroen', 'Erpe-Mere', '49 McCann Street', '18577');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001395, 'Percy', 'Richardson', '52 Dardilly Drive', '37042');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001396, 'Lucinda', 'St Jean de Soudain', '71 Haggard Road', '13933');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001397, 'Charlton', 'Durham', '68 Osbourne Drive', '22376');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001398, 'Buffy', 'Canal Winchester', '46 Malm? Drive', '28809');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001399, 'Danni', 'Lisbon', '4 Haslam Drive', '19038');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001400, 'Austin', 'Chur', '51 Noseworthy Drive', '32731');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001401, 'Ian', 'Tlalpan', '828 Cumming Street', '14020');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001402, 'Lenny', 'Chinnor', '41 Myers Ave', '3Z4 7L0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001403, 'Emerson', 'Pasadena', '16 Redding Blvd', '15249');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001404, 'Kenny', 'Warrington', '14 Clive Street', '5T8 4E1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001405, 'Alex', 'San Jose', '41 MacPherson Drive', '6563');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001406, 'LeVar', 'Wellington', '654 Leo Blvd', '5178');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001407, 'Stephanie', 'Germantown', '50 Holliday Drive', '3617');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001408, 'Lucy', 'Leinfelden-Echterdin', '90 Donal Drive', '19287');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001409, 'Nigel', 'Chapeco', '444 Kathleen Street', '23663');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001410, 'Gordon', 'Chur', '209 Tim Drive', '40338');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001411, 'Ricardo', 'Ohtsu', '443 Head Street', '26493');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001412, 'Alan', 'San Francisco', '26 Menlo Park Drive', '32995');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001413, 'Radney', 'Winnipeg', '90 Hurt Street', '8L1 0H4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001414, 'Gwyneth', 'Massagno', '288 Bruxelles Road', '11523');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001415, 'Larry', 'Bristol', '56 Carolyn Drive', '1L8 9Q6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001416, 'Colm', 'Magstadt', '86 Zahn', '34535');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001417, 'Debra', 'Guadalajara', '509 Atkinson Road', '18535');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001418, 'Alessandro', 'Ankara', '62 Orange Road', '31889');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001419, 'Rawlins', 'Akron', '46 Sanders Drive', '16911');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001420, 'Rose', 'Shoreline', '5 Hirsch Ave', '22776');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001421, 'Bette', 'Sao caetano do sul', '94 Rauhofer Street', '9779');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001422, 'David', 'Solon', '96 Long Island City ', '26463');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001423, 'Hikaru', 'Albany', '44 Gina Street', '9588');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001424, 'Suzi', 'Kyunnam', '34 Mogliano Veneto R', '6132');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001425, 'Rob', 'Nordhausen', '30 Agoncillo Road', '9215');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001426, 'Lionel', 'Padova', '148 Hughes Drive', '16437');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001427, 'Albertina', 'Hochwald', '50 Naestved Street', '40047');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001428, 'Maggie', 'L''union', '437 Arjona Street', '7303');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001429, 'Johnny', 'Mariano Comense', '19 Vickie', '12385');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001430, 'Kathleen', 'Pandrup', '83 Murphy Drive', '5856');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001431, 'Lindsey', 'Taoyuan', '40 Mary Beth Road', '16184');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001432, 'Jeffrey', 'Longueuil', '57 Playboys Road', '2Z9 4Y5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001433, 'Shannon', 'Maarssen', '57 Goteborg Street', '6596OR');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001434, 'Jeff', 'Alessandria', '80 Cockburn Ave', '4100');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001435, 'Omar', 'Cary', '41 Sheena Road', '7787');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001436, 'Anjelica', 'Elche', '800 Chad Drive', '34925');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001437, 'Etta', 'Brampton', '54 Drogenbos Road', '9T0 3X8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001438, 'Brothers', 'Glasgow', '26 Newnan Road', '3V3 6O5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001439, 'Stockard', 'Richmond', '100 Douglas Street', '28303');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001440, 'Wesley', 'Essen', '47 Detmer Drive', '29746');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001441, 'Marie', 'Hiller?d', '543 Atkins Drive', '38553');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001442, 'Jay', 'Odense', '210 Takamatsu Street', '11518');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001443, 'Meg', 'Buenos Aires', '78 Pearce Street', '23202');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001444, 'Marianne', 'Fambach', '11 Ford Road', '20360');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001445, 'Rutger', 'Auckland', '66 Gailard', '16197');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001446, 'Edward', 'Brossard', '58 Jeffery Street', '1R2 8A8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001447, 'Jay', 'Rio Rancho', '51 Everett Street', '5818');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001448, 'Neve', 'Herne', '60 Hong Drive', '13522');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001449, 'Ice', 'Chur', '86 Rhys-Davies Ave', '4601');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001450, 'Ashton', 'Lenexa', '741 Idol Road', '30653');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001451, 'Kathy', 'Karlstad', '550 Cruise Drive', '14044');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001452, 'Leon', 'Rothenburg', '62 Wilder Drive', '2040');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001453, 'Will', 'K?ln', '33 Liv Street', '16277');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001454, 'Scott', 'Stocksbridge', '55 Hong Street', '5Y4 1K4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001455, 'Andrea', 'Rheinfelden', '52 Heston Road', '28513');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001456, 'Latin', 'Prague', '48 Traralgon Ave', '38249');
commit;
prompt 1600 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001457, 'Jane', 'Olympia', '51st Street', '11949');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001458, 'Trini', 'Santa rita sapuca?', '786 Caracas Road', '28547');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001459, 'Pablo', 'Market Harborough', '980 Christmas', '8Q4 8T8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001460, 'Eliza', 'Guamo', '98 Bruce Road', '3751');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001461, 'Brenda', 'Kloten', '102 Micky Road', '7208');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001462, 'Tyrone', 'Beaverton', '35 Olyphant Street', '13084');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001463, 'Boyd', 'Dunn loring', '44 Dalton Street', '11632');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001464, 'Thelma', 'Bradenton', '59 Baez Road', '1010');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001465, 'Kurt', 'Chur', '52 Renee Road', '21672');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001466, 'Lupe', 'Arlington', '973 Gaines Street', '17223');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001467, 'Juliet', 'Bollensen', '32 Sisto Ave', '33196');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001468, 'Simon', 'Wakayama', '61 Soul Ave', '30774');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001469, 'Mika', 'Bloemfontein', '23 Samrand Drive', '21247');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001470, 'Nile', 'Sale', '80 Ali Street', '8J2 6K1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001471, 'Jack', 'Cambridge', '518 Micky Ave', '5S7 3I6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001472, 'Terry', 'Tustin', '42 Silverman Street', '5179');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001473, 'Darius', 'Koufu', '42 Americana Street', '23103');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001474, 'Gran', 'Olympia', '84 Driver Road', '15612');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001475, 'Marina', 'Le chesnay', '225 Rita', '8558');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001476, 'Mint', 'Wien', '12 Algermissen Road', '37012');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001477, 'Jonatha', 'Pirmasens', '60 Lang Street', '3760');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001478, 'Jaime', 'Aracruz', '68 Athens Blvd', '24796');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001479, 'Quentin', 'Richmond', '52 Finney Road', '4517');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001480, 'Emilio', 'Irati', '52nd Street', '20927');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001481, 'Owen', 'Mogi Guacu', '2 Chung Ave', '15563');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001482, 'Kay', 'W?rth', '762 Clarkson Drive', '2577');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001483, 'Bradley', 'Yogyakarta', '67 Laura Road', '35390');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001484, 'Martha', 'Goteborg', '70 Raybon Street', '8807');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001485, 'Cameron', 'Stellenbosch', '491 Rua eteno Drive', '21106');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001486, 'Kathleen', 'Las Vegas', '91 Horb Street', '34198');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001487, 'Hugh', 'Telford', '25 Dreyfuss Drive', '9P6 4Y9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001488, 'Lili', 'Regensburg', '81 Karlsruhe Road', '30977');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001489, 'Matt', 'Treviso', '99 Hewitt Drive', '7540');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001490, 'Claire', 'Sale', '68 Salonga Blvd', '6G6 8T9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001491, 'Nick', 'Hounslow', '98 King Street', '1A5 5D9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001492, 'Wallace', 'Pordenone', '44 Geoff Street', '27049');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001493, 'Alannah', 'Billerica', '313 Cape town Road', '24986');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001494, 'Famke', 'Campinas', '76 Harrison Ave', '9202');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001495, 'Hilton', 'Nizhnevartovsk', '61 League city Road', '12630');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001496, 'Ruth', 'Ribeirao preto', '36 Goiania Ave', '3195');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001497, 'Edwin', 'Sutton', '85 Aaron Road', '8257');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001498, 'Nancy', 'Bkk', '35 Nelligan Drive', '36003');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001499, 'Cate', 'Thames Ditton', '145 Jay Road', '2A2 2Q8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001500, 'Vickie', 'Aiken', '91 Santa Clarita Str', '11437');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001501, 'Natalie', 'Matsuyama', '25 McClinton Street', '4442');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001502, 'Sophie', 'Redhill', '82 Alice Road', '0W6 5G3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001503, 'Vern', 'Helsingborg', '59 Gordon Street', '37808');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001504, 'Russell', 'Lubbock', '84 Ponty Drive', '12972');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001505, 'Fats', 'Jun-nam', '30 Gauteng Drive', '8835');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001506, 'Aaron', 'Wageningen', '45 Vannelli Drive', '8229OS');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001507, 'Trini', 'Berlin', '75 Ponty Road', '26111');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001508, 'Derrick', 'Shelton', '62 Nikka Street', '21197');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001509, 'Udo', 'Swannanoa', '853 Hauser Road', '25279');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001510, 'Alan', 'Duisburg', '40 Kretschmann Drive', '22572');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001511, 'Matthew', 'Koufu', '32nd Street', '8100');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001512, 'Lydia', 'Kaysville', '25 Campana Street', '36434');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001513, 'Josh', 'O''fallon', '47 Cruz Street', '14595');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001514, 'Maceo', 'S. Bernardo do Campo', '42 Bell Drive', '25026');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001515, 'Bruce', 'Wehrheim', '29 DiBiasio Street', '32110');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001516, 'Terri', 'Zurich', '53rd Street', '20143');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001517, 'Dave', 'Houston', '51st Street', '31315');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001518, 'Benicio', 'Bad Camberg', '486 Courbevoie Road', '31332');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001519, 'Maureen', 'Ettlingen', '98 Adkins Drive', '22254');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001520, 'Powers', 'Arlington', '95 Biehn Drive', '19591');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001521, 'Catherine', 'Birmensdorf', '78 Clea', '26727');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001522, 'Rachid', 'Harahan', '18 Thornton Road', '7696');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001523, 'Kitty', 'Scottsdale', '74 Lloyd', '17051');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001524, 'Nanci', 'Gaza', '62 Hayward Street', '36795');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001525, 'Micky', 'Silverdale', '41 Blackwell Blvd', '7938');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001526, 'Ving', 'Mclean', '9 Lucinda Blvd', '31532');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001527, 'Shelby', 'Winterthur', '91 Downey Drive', '32546');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001528, 'Rutger', 'Schlieren', '86 Orlando Road', '29487');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001529, 'Joely', 'San Francisco', '23 Levy', '3678');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001530, 'Rebecca', 'Kejae City', '42 Peine Ave', '26114');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001531, 'Bridgette', 'Londrina', '73 Lodi', '35173');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001532, 'Nelly', 'Mt. Laurel', '22 Juliette Drive', '20866');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001533, 'Laurence', 'Ft. Leavenworth', '13 Mary Drive', '1605');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001534, 'Christina', 'Dinslaken', '20 Sanders Street', '11952');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001535, 'Harold', 'Lima', '89 Julie Drive', '7498');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001536, 'Adrien', 'Huntsville', '38 Samrand Street', '30546');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001537, 'Cesar', 'Th?rishaus', '9 Wilder Road', '29868');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001538, 'Bonnie', 'Northampton', '84 Van Helden Street', '7X4 5L9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001539, 'Anjelica', 'Di Savigliano', '82nd Street', '1005');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001540, 'Charles', 'Carlin', '54 Pelvic Street', '37454');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001541, 'Maggie', 'Athens', '81st Street', '23228');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001542, 'Bryan', 'Hiroshima', '58 John Blvd', '16621');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001543, 'Brad', 'Guadalajara', '129 Lena Drive', '40430');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001544, 'Kurtwood', 'Valencia', '98 Phifer Road', '26750');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001545, 'Lorraine', 'Pointe-claire', '16 Eugene Ave', '1K9 6C3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001546, 'Buddy', 'Warren', '11 Steagall Ave', '14837');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001547, 'Rodney', 'Coquitlam', '254 Portman Street', '0G5 4P1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001548, 'Mae', 'Dardilly', '87 Bedford Ave', '22826');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001549, 'Bob', 'Jakarta', '32 Kramer Drive', '3271');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001550, 'Juliette', 'South Weber', '73 Tarantino Ave', '16062');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001551, 'Ray', 'Concordville', '19 Breckin Street', '24794');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001552, 'Goldie', 'Kaysville', '75 Itu Street', '34628');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001553, 'Joseph', 'Atlanta', '91 Ben', '32894');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001554, 'Ossie', 'Menlo Park', '50 Elijah', '9668');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001555, 'Kristin', 'Debary', '46 Kotto Street', '35181');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001556, 'George', 'Chemnitz', '38 Secada Blvd', '10462');
commit;
prompt 1700 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001557, 'Sander', 'P?tion-ville', '68 Darius Drive', '14367');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001558, 'Joy', 'Tbilisi', '2 Omaha Road', '26490');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001559, 'Morgan', 'Woodbridge', '59 Isaac Street', '22750');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001560, 'Helen', 'Mason', '795 Sheffield Blvd', '14383');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001561, 'Sinead', 'Ohita', '85 Cleary Street', '32305');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001562, 'Mark', 'Mechelen', '52 Llewelyn Blvd', '4793');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001563, 'Edward', 'Macau', '50 Mogliano Veneto R', '5524');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001564, 'Chloe', 'Obfelden', '791 Jim', '9331');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001565, 'Armand', 'Visselh?vede', '14 Albert Road', '6393');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001566, 'Bob', 'Boise', '48 Grant Blvd', '11300');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001567, 'Garland', 'Waco', '29 Freda Road', '32149');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001568, 'Donal', 'Ulm', '71 Nina Street', '32266');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001569, 'Davey', 'Peachtree City', '93rd Street', '24732');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001570, 'Gina', 'Ft. Lauderdale', '50 Gagnon', '32736');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001571, 'Uma', 'Barbengo', '53rd Street', '19153');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001572, 'Daryl', 'Seattle', '469 Tobolowsky Stree', '9346');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001573, 'Chuck', 'Potsdam', '68 Weaving Ave', '2290');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001574, 'Rod', 'W?rth', '37 Alleroed Road', '24213');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001575, 'Liquid', 'Plymouth Meeting', '3 Oldenburg Ave', '37932');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001576, 'Denis', 'Edwardstown', '28 Broza Street', '12465');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001577, 'Vonda', 'Ferraz  vasconcelos', '25 LaBelle Drive', '10376');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001578, 'Beverley', 'Horsham', '5 McCain Street', '9H1 9D1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001579, 'Kay', 'Englewood Cliffs', '94 Borgnine Road', '27552');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001580, 'Rufus', 'Udine', '88 Bentley Street', '40833');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001581, 'Courtney', 'El Segundo', '88 Strathairn Drive', '2244');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001582, 'Buddy', 'Durban', '8 K?benhavn Street', '20378');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001583, 'Jaime', 'Kristiansand', '45 Claymont', '27123');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001584, 'Uma', 'Ebersberg', '12nd Street', '6564');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001585, 'Lily', 'Runcorn', '12nd Street', '7K4 6I3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001586, 'Roscoe', 'Herne', '42 Frakes Road', '32002');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001587, 'Carlene', 'Bloomington', '2 Derek Road', '20119');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001588, 'Merrilee', 'Murray', '58 Satriani Road', '20204');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001589, 'Rebeka', 'Charlotte', '97 Checker', '33775');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001590, 'Judd', 'Grand-mere', '47 Frederiksberg Roa', '2I5 7W4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001591, 'Milla', 'Dartmouth', '268 Sophie Road', '7D7 8O2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001592, 'April', 'Fort Saskatchewan', '98 Colman Street', '3H4 7J3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001593, 'Christina', 'Freiburg', '868 New York Road', '23951');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001594, 'Alana', 'Turku', '6 Osaka Street', '7402');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001595, 'Richie', 'Houston', '9 Nightingale Road', '10754');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001596, 'Mike', 'Essex', '464 Crewson Street', '2A6 0Z6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001597, 'Yaphet', 'Marlboro', '64 Chambersburg Stre', '32497');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001598, 'Ralph', 'Helsingborg', '11 Austin Road', '26187');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001599, 'Forest', 'Sevilla', '39 Sawa Drive', '30502');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001600, 'Jessica', 'Madison', '42 Masur Road', '8662');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001601, 'Campbell', 'Douala', '10 McCabe Blvd', '15110');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001602, 'Kirk', 'Dortmund', '705 Flanery Road', '34263');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001603, 'Steven', 'Gettysburg', '71 West Windsor Ave', '23082');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001604, 'Maura', 'Newbury', '50 Cotton Street', '23303');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001605, 'Rufus', 'Akron', '69 Lerner Blvd', '25810');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001606, 'Denise', 'Grapevine', '433 Redhill Blvd', '27045');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001607, 'Gordie', 'Olsztyn', '49 Ryder', '6370');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001608, 'Minnie', 'Drogenbos', '57 Swinton Street', '11399');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001609, 'Lucy', 'Lyon', '58 DeVito Road', '6659');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001610, 'Hazel', 'Gersthofen', '23 Wesley Drive', '10509');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001611, 'Robert', 'Palo Alto', '26 Aglukark Road', '36567');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001612, 'Jonatha', 'Berlin-Adlershof', '43 Cassidy Blvd', '1408');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001613, 'Busta', 'Hiller?d', '93 Sledge Street', '25047');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001614, 'Breckin', 'Boulogne', '77 Niles Road', '32632');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001615, 'Forest', 'Okayama', '62 Louise Street', '4672');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001616, 'Cherry', 'Nizhnevartovsk', '61 Andrews Drive', '40090');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001617, 'Freddy', 'Oklahoma city', '6 El Dorado Hills St', '13224');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001618, 'Maxine', 'West Drayton', '94 Velizy Villacoubl', '4S3 7F8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001619, 'Meg', 'Santana do parna?ba', '929 Freiburg Street', '24529');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001620, 'Jodie', 'Leeds', '659 Gill Street', '4R2 4S3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001621, 'Suzy', 'Archbold', '38 Clarkson Road', '35508');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001622, 'Zooey', 'Anchorage', '71 Marianne Drive', '31358');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001623, 'Rhys', 'Montreal', '42 Burmester', '4E6 6X8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001624, 'Swoosie', 'Roanoke', '96 Jeffery Blvd', '23665');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001625, 'Antonio', 'Ipswich', '68 Marley Ave', '6X0 4P7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001626, 'Quentin', 'Dardilly', '32 Deejay Road', '15415');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001627, 'Wallace', 'Boulder', '19 Gordon Street', '34413');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001628, 'Luis', 'Hong Kong', '54 Saint Paul Street', '32683');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001629, 'Gloria', 'Pittsburgh', '42nd Street', '22288');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001630, 'Carl', 'Lathrop', '83 Jose Blvd', '40665');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001631, 'Mika', 'Yucca', '4 Speaks Road', '13782');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001632, 'Bridgette', 'Gliwice', '11 Todd Street', '29033');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001633, 'Queen', 'Manchester', '42nd Street', '29854');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001634, 'Gaby', 'Haverhill', '754 Redwood City Dri', '5W2 4O8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001635, 'Louise', 'Glasgow', '37 Douala Road', '5W8 5J5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001636, 'Vin', 'Purley', '22 Bretzfeld-Waldbac', '7V1 2R0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001637, 'Tommy', 'Sidney', '345 Madeline Street', '1V4 9X3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001638, 'Murray', 'P?tion-ville', '63 Doug Road', '3854');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001639, 'Ernie', 'Solon', '93rd Street', '13536');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001640, 'Talvin', 'Offenburg', '339 Kurtwood Road', '15254');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001641, 'Ritchie', 'Warren', '61st Street', '12993');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001642, 'Mint', 'Sihung-si', '33 Wolf', '34545');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001643, 'Alana', 'St Leonards', '12 Bachman', '23827');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001644, 'Ray', 'Glen allen', '57 Duchovny Road', '28178');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001645, 'Omar', 'Edmonton', '79 Gleeson Street', '7C8 0R1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001646, 'Shannon', 'Buffalo', '267 Cromwell Ave', '5S0 1F2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001647, 'Mira', 'Dartmouth', '87 Alfred Blvd', '1Q0 0V8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001648, 'Art', 'Rtp', '90 Diggs Ave', '12755');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001649, 'Buddy', 'Huntsville', '52 Tambor Road', '22220');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001650, 'CeCe', 'Rockland', '18 Edinburgh Road', '1671');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001651, 'Darren', 'Leverkusen', '12nd Street', '24344');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001652, 'Lizzy', 'Lecanto', '59 Giamatti Blvd', '30689');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001653, 'Nelly', 'Uden', '18 Tokushima', '2840PB');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001654, 'Joanna', 'Bad Oeynhausen', '666 Rupert', '24233');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001655, 'Fiona', 'Irvine', '5 Kitty Road', '8612');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001656, 'Lenny', 'Chorz?w', '10 Rains Ave', '15887');
commit;
prompt 1800 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001657, 'Corey', 'Gen?ve', '72 Mills Blvd', '31329');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001658, 'Joan', 'Ellicott City', '97 Cassidy Road', '3424');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001659, 'Toni', 'Newcastle upon Tyne', '97 Lexington Ave', '7M0 1I5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001660, 'Rueben', 'Haverhill', '87 Preston Road', '0T5 7C7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001661, 'Jeremy', 'Durban', '85 Garr Road', '12306');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001662, 'Franco', 'M?nchen', '50 Bellevue Drive', '11377');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001663, 'Julio', 'Dunn loring', '52 Hyde Road', '35302');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001664, 'Wallace', 'Ternitz', '42 Lunch', '34244');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001665, 'Giovanni', 'Overland park', '59 Terri Street', '32510');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001666, 'Jaime', 'Orleans', '65 Emilio Street', '13409');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001667, 'Candice', 'Pirmasens', '66 Hamilton Street', '32997');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001668, 'Rolando', 'Banbury', '51 Charleston Street', '1O1 3W3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001669, 'Hugo', 'Toledo', '18 Woking', '33675');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001670, 'Jonny Lee', 'Courbevoie', '42 Domino Street', '37516');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001671, 'Eddie', 'Meerbusch', '19 Jordan Street', '7474');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001672, 'Praga', 'Kreuzau', '306 Khan Drive', '8450');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001673, 'Cesar', 'Soest', '2 Greenwood', '0071ZR');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001674, 'Scarlett', 'Portland', '61 Tarantino Blvd', '5046');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001675, 'Jeff', 'Ashdod', '94 Domino Road', '11632');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001676, 'Thora', 'Draper', '98 Hutton Drive', '5522');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001677, 'Regina', 'Walnut Creek', '91st Street', '33288');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001678, 'Jamie', 'Lakeville', '634 Santa Fe Drive', '36366');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001679, 'Casey', 'Karachi', '93 Ricci Ave', '13085');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001680, 'Julianne', 'Piacenza', '407 Emily', '8678');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001681, 'Cliff', 'Grand Rapids', '91st Street', '33658');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001682, 'Jessica', 'Sao caetano do sul', '88 Salt Road', '27079');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001683, 'Jeff', 'Melrose park', '68 Burlington Blvd', '28843');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001684, 'Angela', 'Bangalore', '53rd Street', '12767');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001685, 'Radney', 'Rosario', '50 Summer Road', '25737');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001686, 'Davey', 'Lake Bluff', '16 Makowicz', '12890');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001687, 'Taylor', 'Parsippany', '71 Salma Road', '14406');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001688, 'Henry', 'Barueri', '43 Dolenz Road', '28512');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001689, 'Chely', 'Nashua', '57 Howard Road', '26857');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001690, 'Deborah', 'Fukuoka', '83 Phoenix Drive', '30500');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001691, 'Anjelica', 'Horb', '92 Springfield Road', '28085');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001692, 'Anne', 'Amsterdam', '63 Marlboro Drive', '1958XP');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001693, 'Carl', 'Linz', '83 Midler Street', '25553');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001694, 'Joseph', 'Albany', '91 Noah Road', '34428');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001695, 'Mia', 'Orleans', '44 Blige Road', '35115');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001696, 'Bo', 'Melrose park', '62nd Street', '15377');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001697, 'Harris', 'Adamstown', '68 Peter Drive', '31196');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001698, 'Gloria', 'Cincinnati', '28 Rob Street', '8216');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001699, 'Johnette', 'Loveland', '61st Street', '17789');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001700, 'Tracy', 'Peterborough', '78 Liam Ave', '4419');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001701, 'Desmond', 'Tilst', '42 Ron Drive', '14540');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001702, 'Faye', 'Santa Cruz', '61st Street', '17157');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001703, 'Stephanie', 'Paramus', '98 Vince Road', '13987');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001704, 'Desmond', 'West Launceston', '56 Luongo Street', '10548');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001705, 'Vickie', 'Americana', '340 Des Plaines Driv', '3168');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001706, 'Ming-Na', 'Kerava', '52nd Street', '1919');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001707, 'Jose', 'Le chesnay', '34 Galecki Blvd', '18451');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001708, 'Avril', 'Kejae City', '597 Matarazzo', '21654');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001709, 'Davy', 'Irkutsk', '997 Bedelia Ave', '9108');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001710, 'Armand', 'G?vle', '45 Neustadt Road', '1113');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001711, 'Neve', 'Milwaukee', '92 Pearland Street', '32658');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001712, 'Micky', 'Gersthofen', '666 Judd Road', '23582');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001713, 'Walter', 'Burr Ridge', '27 Kingsley Road', '38608');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001714, 'Loreena', 'Stuttgart', '157 Flatts', '13829');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001715, 'Shawn', 'Porto alegre', '162 Duchovny Road', '33092');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001716, 'Betty', 'Ponta grossa', '83rd Street', '22032');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001717, 'Nils', 'Middletown', '68 Esposito Ave', '33896');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001718, 'Lena', 'Belo Horizonte', '53 Masur Street', '36372');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001719, 'Dean', 'Venice', '64 Mars Drive', '27074');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001720, 'Betty', 'Kozani', '50 Mathis Drive', '27528');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001721, 'Maxine', 'Barcelona', '52 Cara Ave', '8401');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001722, 'Colm', 'Bronx', '680 Toni Drive', '22730');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001723, 'Trey', 'Issaquah', '53 Edison Drive', '19928');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001724, 'Carole', 'Kwun Tong', '31st Street', '4145');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001725, 'Pamela', 'Woodbridge', '42 Bellevue Street', '18104');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001726, 'Ronny', 'Borger', '30 Brooks Street', '8077');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001727, 'Vendetta', 'Canal Winchester', '5 Macclesfield Stree', '26139');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001728, 'Stephen', 'Newbury', '67 Mt. Laurel Ave', '30900');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001729, 'Michelle', 'Toyama', '77 Christina Drive', '25002');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001730, 'Garland', 'Chirignago', '28 McCabe Road', '33323');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001731, 'Benjamin', 'Hines', '85 Zevon Street', '39217');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001732, 'Danny', 'Cape town', '91 Kagoshima', '37033');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001733, 'Natalie', 'Peine', '88 Ricardson Ave', '4244');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001734, 'Liam', 'Altst?tten', '28 Bras?lia Drive', '28300');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001735, 'Linda', 'Bloomington', '968 Ramsey Drive', '8885');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001736, 'Giovanni', 'Vanderbijlpark', '74 Mito Road', '27124');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001737, 'Tom', 'Washington', '45 Tokyo Drive', '17310');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001738, 'Cliff', 'Kagoshima', '87 Peniston Road', '8307');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001739, 'Norm', 'Austin', '77 Gordon Road', '35838');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001740, 'Nick', 'Aurora', '62 Hackensack Drive', '7921');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001741, 'Kelly', 'Gettysburg', '51 Franks Drive', '29006');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001742, 'Jodie', 'Parma', '41st Street', '8211');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001743, 'Millie', 'Roma', '53rd Street', '40687');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001744, 'Kurt', 'Ljubljana', '298 Anyang-si Drive', '4728');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001745, 'Jeffrey', 'Elkins Park', '90 Dunn Street', '26927');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001746, 'Woody', 'Mapo-gu', '20 Bradenton Blvd', '8127');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000726, 'Diane', 'Douala', '32nd Street', '29744');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001891, 'Darius', 'Bruxelles', '72 Julia Street', '4006');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001892, 'Talvin', 'Calcutta', '67 Brandt Drive', '30641');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001893, 'Mykelti', 'Nuernberg', '415 Lin Street', '12200');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001894, 'Jeffrey', 'Gaza', '182 Albright', '20094');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001895, 'Sally', 'Bremen', '69 Cumming Road', '13769');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001896, 'Nicky', 'Longueuil', '61 Lennix Road', '4L2 9S4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001897, 'Frances', 'Rocklin', '4 Pulheim-brauweiler', '13159');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001898, 'Alfred', 'North Point', '27 Drive Drive', '15609');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001899, 'Teri', 'Thames Ditton', '45 Haggard Street', '7P2 0F4');
commit;
prompt 1900 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001900, 'Colleen', 'Santorso', '969 Emmerich Street', '1678');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001901, 'Jerry', 'Delafield', '6 Villata Street', '7432');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001902, 'Lennie', 'Anchorage', '42 Cobham Road', '33946');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001903, 'Armand', 'Horb', '41st Street', '21438');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001904, 'Miriam', 'Vilnius', '88 Stone Street', '32677');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001905, 'Johnnie', 'Valencia', '39 Pesci Road', '23136');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001906, 'Martin', 'Syracuse', '12nd Street', '27442');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001907, 'Richard', 'New Hyde Park', '42nd Street', '2147');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001908, 'Judi', 'Salvador', '77 Market Harborough', '7074');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001909, 'Kimberly', 'Le chesnay', '63 Ammons Blvd', '7890');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001910, 'Tilda', 'Shreveport', '52nd Street', '14942');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001911, 'Ron', 'Yokohama', '63rd Street', '1150');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001912, 'Liam', 'League city', '13 Larter Drive', '8749');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001913, 'Carl', 'Stavanger', '44 Chesnutt', '27405');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001914, 'Dionne', 'Lakewood', '68 Seth Road', '11642');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001915, 'Teena', 'Hines', '81 Sepulveda Drive', '37330');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001916, 'Brian', 'Sainte-foy', '55 Janney Ave', '3A8 0Q0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001917, 'Casey', 'Pusan', '468 Burlington', '24464');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001918, 'Marisa', 'Holliston', '11 Depp Street', '37771');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001919, 'Eddie', 'Natal', '93 Carrack Drive', '36762');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001920, 'Jason', 'Staten Island', '50 Conley', '17012');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001921, 'Alessandro', 'Rimini', '3 Enschede Ave', '16383');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001922, 'Josh', 'Whittier', '87 Woodland Hills Dr', '31958');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001923, 'Edie', 'Tsu', '43 Peet Blvd', '23513');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001924, 'Albertina', 'Scottsdale', '27 Busta Street', '34916');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001925, 'Cledus', 'P?tion-ville', '15 Hamilton Road', '16047');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001926, 'Malcolm', 'Drogenbos', '72 Suwon-city Drive', '8617');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001927, 'Wesley', 'Nagoya', '65 Albertina', '17781');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001928, 'Elvis', 'Oppenheim', '37 Fairfax Road', '2042');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001929, 'Raymond', 'S?o paulo', '57 Hynde Street', '29938');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001930, 'Rip', 'Eindhoven', '62 Rick Street', '5784DF');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001931, 'Dwight', 'Noumea', '43rd Street', '2965');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001932, 'Fred', 'Burgess Hill', '53rd Street', '8K7 6X6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001933, 'Kylie', 'Wehrheim', '12 Orbit', '38896');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001934, 'Rachael', 'Herndon', '25 Trace Road', '35368');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001935, 'Charles', 'Barcelona', '43 Stanton Street', '19457');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001936, 'Horace', 'Eisenh?ttenstadt', '57 Orton Drive', '5770');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001937, 'Giovanni', 'Koeln', '561 Mantova Street', '38924');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001938, 'Boz', 'Fountain Hills', '82nd Street', '1125');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001939, 'Juliana', 'Glendale', '114 Fierstein', '38503');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001940, 'Winona', 'Lodi', '3 Eisenh?ttenstadt A', '27809');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001941, 'Liquid', 'Warsaw', '94 W?rth', '30335');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001942, 'Vondie', 'Pretoria', '99 Whitehouse Statio', '8103');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001943, 'Thora', 'Hartmannsdorf', '83rd Street', '17787');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001944, 'Ronnie', 'Fountain Hills', '84 Orbit Ave', '30686');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001945, 'Pamela', 'Horsham', '28 Suzi Street', '33526');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001946, 'Billy', 'Doncaster', '6 Geoff Street', '3A5 8Z8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001947, 'Emerson', 'Kaunas', '48 Stigers Ave', '32147');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001948, 'Ramsey', 'Daejeon', '76 Bebe Blvd', '5364');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001949, 'Roger', 'Bend', '75 Sanders Ave', '32682');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001950, 'Willie', 'Wellington', '338 Rhymes Blvd', '30062');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001951, 'Tracy', 'Salvador', '11 O''Donnell Road', '39544');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001952, 'Jon', 'Berkeley', '752 Faye Drive', '30706');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001953, 'Cornell', 'Tadley', '13 Chur Drive', '9Y9 7F5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001954, 'Latin', 'Freiburg', '492 Cleese Street', '31024');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001955, 'Alicia', 'Ft. Leavenworth', '22nd Street', '8298');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001956, 'Loretta', 'Caguas', '88 Andre Street', '14004');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001957, 'Denis', 'San Diego', '99 Karon Road', '39825');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001958, 'Tara', 'Traralgon', '79 Utsunomiya Road', '2144');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001959, 'Doug', 'Wilmington', '32 Valencia', '16142');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001960, 'Nigel', 'Daejeon', '2 Famke Road', '6464');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001961, 'Kim', 'Glasgow', '22 Judge Drive', '5G9 6W0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001962, 'Jeff', 'Research Triangle', '25 Halfway house Blv', '15934');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001963, 'Judy', 'Monterrey', '95 Piven Road', '16456');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001964, 'Bradley', 'Leimen', '96 Remar Blvd', '38476');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001965, 'Benjamin', 'Oxford', '56 Estevez', '2T0 9U2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001966, 'Colm', 'Ann Arbor', '42nd Street', '39926');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001967, 'Vertical', 'Fountain Hills', '53 Lehi Drive', '36976');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001968, 'Brent', 'Sarasota', '7 Dern Drive', '5669');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001969, 'Phil', 'Powell River', '385 Downie Road', '8P3 0Y1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001970, 'Freddy', 'Birmingham', '3 Sledge Street', '5842');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001971, 'Aimee', 'Firenze', '98 Cassidy Drive', '5664');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001972, 'Lena', 'Sevilla', '57 Neve Drive', '36927');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001973, 'Jared', 'Hartmannsdorf', '38 Allison Street', '21912');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001974, 'Chrissie', 'Stellenbosch', '17 Thalwil Blvd', '22690');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001975, 'Lydia', 'Melbourne', '94 Albertina Drive', '17361');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001976, 'Natalie', 'Nyn?shamn', '181 Norderstedt Stre', '31960');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001977, 'Oded', 'Ebersdorf', '29 Ming-Na Ave', '13268');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001978, 'Woody', 'Herne', '61 Vanessa Road', '8716');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001979, 'Ani', 'Hohenfels', '63rd Street', '9106');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001980, 'Casey', 'Chambery', '67 Swinton Road', '34527');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001981, 'Wang', 'Farnham', '900 Sean Drive', '7U4 3A0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001982, 'Jeffrey', 'Unionville', '2 Maarssen Ave', '7E9 3U0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001983, 'Hilary', 'Sainte-foy', '63 Bridges Drive', '8T3 3S1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001984, 'Chloe', 'Koeln', '35 Basinger Road', '33577');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001985, 'Joanna', 'Curitiba', '52 Tennison Road', '12437');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001986, 'Kirsten', 'Thames Ditton', '39 Van Der Beek Ave', '2L0 3W4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001987, 'Joan', 'Manchester', '30 Pirmasens Road', '4H6 3O2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001988, 'Andrea', 'Rocklin', '55 North Yorkshire S', '27026');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001989, 'Austin', 'Leimen', '18 Stafford', '28104');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001990, 'Lara', 'Thalwil', '40 Freddie Road', '3312');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001991, 'Johnette', 'North Point', '63 Posey Ave', '18663');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001992, 'Connie', 'Obfelden', '90 Fair Lawn Drive', '23163');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001993, 'Ossie', 'Th?rishaus', '78 Cary Street', '10706');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001994, 'Bridget', 'Highton', '16 Balin Street', '2133');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001995, 'Jena', 'Saudarkrokur', '62 Wade Ave', '38932');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001996, 'Janice', 'West Sussex', '520 Jody Street', '8B0 1R9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001997, 'Hank', 'Spresiano', '309 Terrasa Ave', '27013');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001998, 'Tilda', 'Fort Lee', '83 Marlboro Road', '16616');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000001999, 'Frankie', 'Edenbridge', '38 Crudup Street', '1Z8 7Z0');
commit;
prompt 2000 records loaded
prompt Loading DRIVER...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000290);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000291);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000292);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000293);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000294);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000295);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000296);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000297);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000298);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000299);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000300);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000301);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000302);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000303);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000304);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000305);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000306);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000307);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000308);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000309);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000310);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000311);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000312);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000313);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000314);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000315);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000316);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000317);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000318);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000319);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000320);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000321);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000322);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000323);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000324);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000325);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000326);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000327);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000328);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000329);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000330);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000331);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000332);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000333);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000334);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000335);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000336);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000337);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000338);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000339);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000340);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000341);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000342);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000343);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000344);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000345);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000346);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000347);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000348);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000349);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000350);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000351);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000352);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000353);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000354);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000355);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000356);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000357);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000358);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000359);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000360);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000361);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000362);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000363);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000364);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000365);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000366);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000367);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000368);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000369);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000370);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000371);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000372);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000373);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000374);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000375);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000376);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000377);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000378);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000379);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000380);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000381);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000382);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000383);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000384);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000385);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000386);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000387);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000388);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000389);
commit;
prompt 100 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000390);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000391);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000392);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000393);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000394);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000395);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000396);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000397);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000398);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000399);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000400);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000401);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000402);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000403);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000404);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000405);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000406);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000407);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000408);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000409);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000410);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000411);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000412);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000413);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000414);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000415);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000416);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000417);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000418);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000419);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000420);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000421);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000422);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000423);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000424);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000425);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000426);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000427);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000428);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000429);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000430);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000431);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000432);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000433);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000434);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000435);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000436);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000437);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000438);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000439);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000440);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000441);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000442);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000443);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000444);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000445);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000446);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000447);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000448);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000449);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000450);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000451);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000452);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000453);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000454);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000455);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000456);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000457);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000458);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000459);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000460);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000461);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000462);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000463);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000464);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000465);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000466);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000467);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000468);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000469);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000470);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000471);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000472);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000473);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000474);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000475);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000476);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000477);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000478);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000479);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000480);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000481);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000482);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000483);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000484);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000485);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000486);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000487);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000488);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000489);
commit;
prompt 200 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000490);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000491);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000492);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000493);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000494);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000495);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000496);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000497);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000498);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000499);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000500);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000501);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000502);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000503);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000504);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000505);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000506);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000507);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000508);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000509);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000510);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000511);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000512);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000513);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000514);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000515);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000516);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000517);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000518);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000519);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000520);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000521);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000522);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000523);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000524);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000525);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000526);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000527);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000528);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000529);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000530);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000531);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000532);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000533);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000534);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000535);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000536);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000537);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000538);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000539);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000540);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000541);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000542);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000543);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000544);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000545);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000546);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000547);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000548);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000549);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000550);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000551);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000552);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000553);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000554);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000555);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000556);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000557);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000558);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000559);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000560);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000561);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000562);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000563);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000564);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000565);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000566);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000567);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000568);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000569);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000570);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000571);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000572);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000573);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000574);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000575);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000576);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000577);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000578);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000579);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000580);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000581);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000582);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000583);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000584);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000585);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000586);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000587);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000588);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000589);
commit;
prompt 300 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000590);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000591);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000592);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000593);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000594);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000595);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000596);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000597);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000598);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000599);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000600);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000601);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000602);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000603);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000604);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000605);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000606);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000607);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000608);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000609);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000610);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000611);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000612);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000613);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000614);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000615);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000616);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000617);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000618);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000619);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000620);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000621);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000622);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000623);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000624);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000625);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000626);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000627);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000628);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000629);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000630);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000631);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000632);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000633);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000634);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000635);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000636);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000637);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000638);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000639);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000640);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000641);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000642);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000643);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000644);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000645);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000646);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000647);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000648);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000649);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000650);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000651);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000652);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000653);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000654);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000655);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000656);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000657);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000658);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000659);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000660);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000661);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000662);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000663);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000664);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000665);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000666);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000667);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000668);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000669);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000670);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000671);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000672);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000673);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000674);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000675);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000676);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000677);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000678);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000679);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000680);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000681);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000682);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000683);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000684);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000685);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000686);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000687);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000688);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000689);
commit;
prompt 400 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000690);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000691);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000692);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000693);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000694);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000695);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000696);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000697);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000698);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000699);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000700);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000701);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000702);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000703);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000704);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000705);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000706);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000707);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000708);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000709);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000710);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000711);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000712);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000713);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000714);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000715);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000716);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000717);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000718);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000719);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000720);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000721);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000722);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000723);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000724);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000725);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000726);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000727);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000728);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000729);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000730);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000731);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000732);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000733);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000734);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000735);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000736);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000737);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000738);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000739);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000740);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000741);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000742);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000743);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000744);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000745);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000746);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000747);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000748);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000749);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000750);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000751);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000752);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000753);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000754);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000755);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000756);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000757);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000758);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000759);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000760);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000761);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000762);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000763);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000764);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000765);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000766);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000767);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000768);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000769);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000770);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000771);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000772);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000773);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000774);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000775);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000776);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000777);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000778);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000779);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000780);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000781);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000782);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000783);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000784);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000785);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000786);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000787);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000788);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000789);
commit;
prompt 500 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000790);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000791);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000792);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000793);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000794);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000795);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000796);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000797);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000798);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000799);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000800);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000801);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000802);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000803);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000804);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000805);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000806);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000807);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000808);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000809);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000810);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000811);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000812);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000813);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000814);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000815);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000816);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000817);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000818);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000819);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000820);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000821);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000822);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000823);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000824);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000825);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000826);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000827);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000828);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000829);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000830);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000831);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000832);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000833);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000834);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000835);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000836);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000837);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000838);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000839);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000840);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000841);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000842);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000843);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000844);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000845);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000846);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000847);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000848);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000849);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000850);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000851);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000852);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000853);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000854);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000855);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000856);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000857);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000858);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000859);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000860);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000861);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000862);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000863);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000864);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000865);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000866);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000867);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000868);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000869);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000870);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000871);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000872);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000873);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000874);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000875);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000876);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000877);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000878);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000879);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000880);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000881);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000882);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000883);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000884);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000885);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000886);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000887);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000888);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000889);
commit;
prompt 600 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000890);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000891);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000892);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000893);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000894);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000895);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000896);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000897);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000898);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000899);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000900);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000901);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000902);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000903);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000904);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000905);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000906);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000907);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000908);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000909);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000910);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000911);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000912);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000913);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000914);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000915);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000916);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000917);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000918);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000919);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000920);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000921);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000922);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000923);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000924);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000925);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000926);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000927);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000928);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000929);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000930);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000931);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000932);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000933);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000934);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000935);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000936);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000937);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000938);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000939);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000940);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000941);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000942);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000943);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000944);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000945);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000946);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000947);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000948);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000949);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000950);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000951);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000952);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000953);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000954);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000955);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000956);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000957);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000958);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000959);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000960);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000961);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000962);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000963);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000964);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000965);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000966);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000967);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000968);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000969);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000970);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000971);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000972);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000973);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000974);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000975);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000976);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000977);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000978);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000979);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000980);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000981);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000982);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000983);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000984);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000985);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000986);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000987);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000988);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000989);
commit;
prompt 700 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000990);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000991);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000992);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000993);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000994);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000995);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000996);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000997);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000998);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000999);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001000);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001001);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001002);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001003);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001004);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001005);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001006);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001007);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001008);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001009);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001010);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001011);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001012);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001013);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001014);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001015);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001016);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001017);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001018);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001019);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001020);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001021);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001022);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001023);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001024);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001025);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001026);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001027);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001028);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001029);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001030);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001031);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001032);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001033);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001034);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001035);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001036);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001037);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001038);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001039);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001040);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001041);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001042);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001043);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001044);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001045);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001046);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001047);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001048);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001049);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001050);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001051);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001052);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001053);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001054);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001055);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001056);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001057);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001058);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001059);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001060);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001061);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001062);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001063);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001064);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001065);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001066);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001067);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001068);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001069);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001070);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001071);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001072);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001073);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001074);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001075);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001076);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001077);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001078);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001079);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001080);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001081);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001082);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001083);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001084);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001085);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001086);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001087);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001088);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001089);
commit;
prompt 800 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001090);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001091);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001092);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001093);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001094);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001095);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001096);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001097);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001098);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001099);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001100);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001101);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001102);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001103);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001104);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001105);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001106);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001107);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001108);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001109);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001110);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001111);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001112);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001113);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001114);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001115);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001116);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001117);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001118);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001119);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001120);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001121);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001122);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001123);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001124);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001125);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001126);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001127);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001128);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001129);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001130);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001131);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001132);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001133);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001134);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001135);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001136);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001137);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001138);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001139);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001140);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001141);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001142);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001143);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001144);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001145);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001146);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001147);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001148);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001149);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001150);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001151);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001152);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001153);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001154);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001155);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001156);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001157);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001158);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001159);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001160);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001161);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001162);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001163);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001164);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001165);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001166);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001167);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001168);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001169);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001170);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001171);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001172);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001173);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001174);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001175);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001176);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001177);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001178);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001179);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001180);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001181);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001182);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001183);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000001184);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000001185);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000001186);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001187);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001188);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000001189);
commit;
prompt 900 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001190);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000001191);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000001192);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001193);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000001194);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001195);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001196);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000001197);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000001198);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000001199);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000000);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000001);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000002);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000003);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000004);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000005);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000006);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000007);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000008);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000009);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000010);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000011);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000012);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000013);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000014);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000015);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000016);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000017);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000018);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000019);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000020);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000021);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000022);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000023);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000024);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000025);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000026);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000027);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000028);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000029);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000030);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000031);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000032);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000033);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000034);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000035);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000036);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000037);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000038);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000039);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000040);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000041);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000042);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000043);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000044);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000045);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000046);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000047);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000048);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000049);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000050);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000051);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000052);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000053);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000054);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000055);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000056);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000057);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000058);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000059);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000060);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000061);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000062);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000063);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000064);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000065);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000066);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000067);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000068);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000069);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000070);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000071);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000072);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000073);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000074);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000075);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000076);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000077);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000078);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000079);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000080);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000081);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000082);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000083);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000084);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000085);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000086);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000087);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000088);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000089);
commit;
prompt 1000 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000090);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000091);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000092);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000093);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000094);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000095);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000096);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000097);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000098);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000099);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000100);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000101);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000102);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000103);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000104);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000105);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000106);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000107);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000108);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000109);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000110);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000111);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000112);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000113);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000114);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000115);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000116);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000117);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000118);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000119);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000120);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000121);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000122);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000123);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000124);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000125);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000126);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000127);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000128);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000129);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000130);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000131);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000132);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000133);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000134);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000135);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000136);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000137);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000138);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000139);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000140);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000141);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000142);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000143);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000144);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000145);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000146);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000147);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000148);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000149);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000150);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000151);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000152);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000153);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000154);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000155);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000156);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000157);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000158);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000159);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000160);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000161);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000162);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000163);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000164);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000165);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000166);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000167);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000168);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000169);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000170);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000171);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000172);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000173);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000174);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000175);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000176);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000177);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000178);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000179);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000180);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000181);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000182);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000183);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000184);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000185);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000186);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000187);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000188);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000189);
commit;
prompt 1100 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000190);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000191);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000192);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000193);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000194);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000195);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000196);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000197);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000198);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000199);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000200);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000201);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000202);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000203);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000204);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000205);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000206);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000207);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000208);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000209);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000210);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000211);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000212);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000213);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000214);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000215);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000216);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000217);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000218);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000219);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000220);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000221);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000222);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000223);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000224);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000225);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000226);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000227);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000228);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000229);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000230);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000231);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000232);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000233);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000234);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000235);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000236);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000237);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000238);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000239);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000240);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000241);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000242);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000243);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000244);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000245);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000246);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000247);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000248);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000249);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000250);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000251);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000252);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000253);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000254);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000255);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000256);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000257);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000258);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000259);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000260);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000261);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000262);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000263);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000264);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000265);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000266);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000267);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000268);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000269);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000270);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000271);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000272);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000273);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000274);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000275);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000276);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000277);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000278);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000279);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000280);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000281);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000282);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000283);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000284);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000285);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000286);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000287);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000288);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000289);
commit;
prompt 1200 records loaded
prompt Loading DELIVERY...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (100, 'sent', to_date('07-02-2000', 'dd-mm-yyyy'), to_date('12-10-2000', 'dd-mm-yyyy'), 1000000000);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (101, 'sent', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('06-11-2000', 'dd-mm-yyyy'), 1000000001);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (102, 'sent', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('10-12-2000', 'dd-mm-yyyy'), 1000000002);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (103, 'deliverd', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('01-07-2000', 'dd-mm-yyyy'), 1000000003);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (104, 'created', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('08-09-2000', 'dd-mm-yyyy'), 1000000004);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (105, 'sent', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('04-05-2000', 'dd-mm-yyyy'), 1000000005);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (106, 'sent', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 1000000006);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (107, 'deliverd', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('03-10-2000', 'dd-mm-yyyy'), 1000000007);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (108, 'created', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('03-08-2000', 'dd-mm-yyyy'), 1000000008);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (109, 'sent', to_date('25-01-2000', 'dd-mm-yyyy'), to_date('11-08-2000', 'dd-mm-yyyy'), 1000000009);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (110, 'deliverd', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('18-08-2000', 'dd-mm-yyyy'), 1000000010);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (111, 'created', to_date('07-03-2000', 'dd-mm-yyyy'), to_date('03-06-2000', 'dd-mm-yyyy'), 1000000011);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (112, 'created', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('21-07-2000', 'dd-mm-yyyy'), 1000000012);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (113, 'sent', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('26-11-2000', 'dd-mm-yyyy'), 1000000013);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (114, 'deliverd', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('08-11-2000', 'dd-mm-yyyy'), 1000000014);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (115, 'deliverd', to_date('08-03-2000', 'dd-mm-yyyy'), to_date('21-10-2000', 'dd-mm-yyyy'), 1000000015);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (116, 'sent', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('05-12-2000', 'dd-mm-yyyy'), 1000000016);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (117, 'deliverd', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('17-07-2000', 'dd-mm-yyyy'), 1000000017);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (118, 'created', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000018);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (119, 'created', to_date('08-03-2000', 'dd-mm-yyyy'), to_date('11-09-2000', 'dd-mm-yyyy'), 1000000019);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (120, 'created', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('30-11-2000', 'dd-mm-yyyy'), 1000000020);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (121, 'deliverd', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('26-11-2000', 'dd-mm-yyyy'), 1000000021);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (122, 'created', to_date('16-03-2000', 'dd-mm-yyyy'), to_date('10-10-2000', 'dd-mm-yyyy'), 1000000022);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (123, 'deliverd', to_date('08-03-2000', 'dd-mm-yyyy'), to_date('21-07-2000', 'dd-mm-yyyy'), 1000000023);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (124, 'created', to_date('03-03-2000', 'dd-mm-yyyy'), to_date('11-09-2000', 'dd-mm-yyyy'), 1000000024);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (125, 'sent', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('28-06-2000', 'dd-mm-yyyy'), 1000000025);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (126, 'created', to_date('03-03-2000', 'dd-mm-yyyy'), to_date('03-05-2000', 'dd-mm-yyyy'), 1000000026);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (127, 'created', to_date('04-02-2000', 'dd-mm-yyyy'), to_date('02-11-2000', 'dd-mm-yyyy'), 1000000027);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (128, 'sent', to_date('23-02-2000', 'dd-mm-yyyy'), to_date('11-08-2000', 'dd-mm-yyyy'), 1000000028);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (129, 'sent', to_date('05-02-2000', 'dd-mm-yyyy'), to_date('24-09-2000', 'dd-mm-yyyy'), 1000000029);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (130, 'created', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('29-09-2000', 'dd-mm-yyyy'), 1000000030);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (131, 'sent', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('20-06-2000', 'dd-mm-yyyy'), 1000000031);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (132, 'deliverd', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('08-12-2000', 'dd-mm-yyyy'), 1000000032);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (133, 'deliverd', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('02-12-2000', 'dd-mm-yyyy'), 1000000033);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (134, 'created', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('11-05-2000', 'dd-mm-yyyy'), 1000000034);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (135, 'deliverd', to_date('27-04-2000', 'dd-mm-yyyy'), to_date('14-05-2000', 'dd-mm-yyyy'), 1000000035);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (136, 'sent', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('08-12-2000', 'dd-mm-yyyy'), 1000000036);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (137, 'sent', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('01-11-2000', 'dd-mm-yyyy'), 1000000037);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (138, 'sent', to_date('08-03-2000', 'dd-mm-yyyy'), to_date('25-08-2000', 'dd-mm-yyyy'), 1000000038);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (139, 'created', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('19-07-2000', 'dd-mm-yyyy'), 1000000039);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (140, 'deliverd', to_date('11-02-2000', 'dd-mm-yyyy'), to_date('21-06-2000', 'dd-mm-yyyy'), 1000000040);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (141, 'deliverd', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('15-10-2000', 'dd-mm-yyyy'), 1000000041);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (142, 'sent', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('23-09-2000', 'dd-mm-yyyy'), 1000000042);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (143, 'deliverd', to_date('13-02-2000', 'dd-mm-yyyy'), to_date('29-11-2000', 'dd-mm-yyyy'), 1000000043);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (144, 'sent', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('03-09-2000', 'dd-mm-yyyy'), 1000000044);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (145, 'deliverd', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('15-10-2000', 'dd-mm-yyyy'), 1000000045);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (146, 'created', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('02-08-2000', 'dd-mm-yyyy'), 1000000046);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (147, 'sent', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('09-09-2000', 'dd-mm-yyyy'), 1000000047);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (148, 'deliverd', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('26-06-2000', 'dd-mm-yyyy'), 1000000048);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (149, 'deliverd', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('14-07-2000', 'dd-mm-yyyy'), 1000000049);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (150, 'created', to_date('09-02-2000', 'dd-mm-yyyy'), to_date('12-11-2000', 'dd-mm-yyyy'), 1000000050);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (151, 'created', to_date('04-02-2000', 'dd-mm-yyyy'), to_date('02-11-2000', 'dd-mm-yyyy'), 1000000051);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (152, 'deliverd', to_date('01-01-2000', 'dd-mm-yyyy'), to_date('13-09-2000', 'dd-mm-yyyy'), 1000000052);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (153, 'created', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('14-05-2000', 'dd-mm-yyyy'), 1000000053);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (154, 'created', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('03-11-2000', 'dd-mm-yyyy'), 1000000054);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (155, 'created', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('01-05-2000', 'dd-mm-yyyy'), 1000000055);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (156, 'sent', to_date('19-02-2000', 'dd-mm-yyyy'), to_date('08-11-2000', 'dd-mm-yyyy'), 1000000056);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (157, 'created', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('02-05-2000', 'dd-mm-yyyy'), 1000000057);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (158, 'deliverd', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('04-08-2000', 'dd-mm-yyyy'), 1000000058);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (159, 'sent', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('25-10-2000', 'dd-mm-yyyy'), 1000000059);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (160, 'sent', to_date('23-03-2000', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 1000000060);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (161, 'deliverd', to_date('28-03-2000', 'dd-mm-yyyy'), to_date('28-10-2000', 'dd-mm-yyyy'), 1000000061);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (162, 'created', to_date('25-03-2000', 'dd-mm-yyyy'), to_date('27-08-2000', 'dd-mm-yyyy'), 1000000062);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (163, 'created', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('01-06-2000', 'dd-mm-yyyy'), 1000000063);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (164, 'deliverd', to_date('12-02-2000', 'dd-mm-yyyy'), to_date('04-07-2000', 'dd-mm-yyyy'), 1000000064);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (165, 'deliverd', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('30-05-2000', 'dd-mm-yyyy'), 1000000065);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (166, 'sent', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('19-08-2000', 'dd-mm-yyyy'), 1000000066);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (167, 'deliverd', to_date('22-03-2000', 'dd-mm-yyyy'), to_date('03-09-2000', 'dd-mm-yyyy'), 1000000067);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (168, 'sent', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('01-11-2000', 'dd-mm-yyyy'), 1000000068);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (169, 'created', to_date('17-04-2000', 'dd-mm-yyyy'), to_date('02-11-2000', 'dd-mm-yyyy'), 1000000069);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (170, 'sent', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('25-09-2000', 'dd-mm-yyyy'), 1000000070);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (171, 'deliverd', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('10-05-2000', 'dd-mm-yyyy'), 1000000071);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (172, 'deliverd', to_date('23-04-2000', 'dd-mm-yyyy'), to_date('03-08-2000', 'dd-mm-yyyy'), 1000000072);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (173, 'created', to_date('14-01-2000', 'dd-mm-yyyy'), to_date('28-11-2000', 'dd-mm-yyyy'), 1000000073);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (174, 'sent', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('03-09-2000', 'dd-mm-yyyy'), 1000000074);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (175, 'sent', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 1000000075);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (176, 'sent', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('25-06-2000', 'dd-mm-yyyy'), 1000000076);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (177, 'deliverd', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('17-08-2000', 'dd-mm-yyyy'), 1000000077);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (178, 'deliverd', to_date('04-03-2000', 'dd-mm-yyyy'), to_date('11-11-2000', 'dd-mm-yyyy'), 1000000078);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (179, 'created', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('20-05-2000', 'dd-mm-yyyy'), 1000000079);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (180, 'sent', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('08-08-2000', 'dd-mm-yyyy'), 1000000080);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (181, 'sent', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('20-09-2000', 'dd-mm-yyyy'), 1000000081);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (182, 'deliverd', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('18-07-2000', 'dd-mm-yyyy'), 1000000082);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (183, 'created', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('16-08-2000', 'dd-mm-yyyy'), 1000000083);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (184, 'sent', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('09-09-2000', 'dd-mm-yyyy'), 1000000084);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (185, 'created', to_date('19-04-2000', 'dd-mm-yyyy'), to_date('25-09-2000', 'dd-mm-yyyy'), 1000000085);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (186, 'deliverd', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('28-08-2000', 'dd-mm-yyyy'), 1000000086);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (187, 'sent', to_date('11-02-2000', 'dd-mm-yyyy'), to_date('27-09-2000', 'dd-mm-yyyy'), 1000000087);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (188, 'sent', to_date('16-03-2000', 'dd-mm-yyyy'), to_date('01-06-2000', 'dd-mm-yyyy'), 1000000088);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (189, 'sent', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('02-11-2000', 'dd-mm-yyyy'), 1000000089);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (190, 'created', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('24-10-2000', 'dd-mm-yyyy'), 1000000090);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (191, 'sent', to_date('14-04-2000', 'dd-mm-yyyy'), to_date('17-08-2000', 'dd-mm-yyyy'), 1000000091);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (192, 'sent', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('05-08-2000', 'dd-mm-yyyy'), 1000000092);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (193, 'sent', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('19-05-2000', 'dd-mm-yyyy'), 1000000093);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (194, 'sent', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('09-12-2000', 'dd-mm-yyyy'), 1000000094);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (195, 'created', to_date('23-02-2000', 'dd-mm-yyyy'), to_date('18-09-2000', 'dd-mm-yyyy'), 1000000095);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (196, 'deliverd', to_date('24-01-2000', 'dd-mm-yyyy'), to_date('13-10-2000', 'dd-mm-yyyy'), 1000000096);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (197, 'deliverd', to_date('02-04-2000', 'dd-mm-yyyy'), to_date('27-06-2000', 'dd-mm-yyyy'), 1000000097);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (198, 'deliverd', to_date('07-03-2000', 'dd-mm-yyyy'), to_date('11-05-2000', 'dd-mm-yyyy'), 1000000098);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (199, 'deliverd', to_date('25-03-2000', 'dd-mm-yyyy'), to_date('08-08-2000', 'dd-mm-yyyy'), 1000000099);
commit;
prompt 100 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (200, 'sent', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('07-09-2000', 'dd-mm-yyyy'), 1000000100);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (201, 'created', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('11-12-2000', 'dd-mm-yyyy'), 1000000101);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (202, 'sent', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('13-11-2000', 'dd-mm-yyyy'), 1000000102);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (203, 'created', to_date('28-01-2000', 'dd-mm-yyyy'), to_date('08-09-2000', 'dd-mm-yyyy'), 1000000103);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (204, 'deliverd', to_date('22-01-2000', 'dd-mm-yyyy'), to_date('04-07-2000', 'dd-mm-yyyy'), 1000000104);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (205, 'sent', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('10-11-2000', 'dd-mm-yyyy'), 1000000105);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (206, 'sent', to_date('23-02-2000', 'dd-mm-yyyy'), to_date('25-09-2000', 'dd-mm-yyyy'), 1000000106);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (207, 'deliverd', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('31-10-2000', 'dd-mm-yyyy'), 1000000107);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (208, 'created', to_date('01-04-2000', 'dd-mm-yyyy'), to_date('05-08-2000', 'dd-mm-yyyy'), 1000000108);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (209, 'deliverd', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('22-05-2000', 'dd-mm-yyyy'), 1000000109);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (210, 'deliverd', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('18-08-2000', 'dd-mm-yyyy'), 1000000110);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (211, 'sent', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('10-12-2000', 'dd-mm-yyyy'), 1000000111);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (212, 'sent', to_date('21-03-2000', 'dd-mm-yyyy'), to_date('24-09-2000', 'dd-mm-yyyy'), 1000000112);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (213, 'deliverd', to_date('28-02-2000', 'dd-mm-yyyy'), to_date('29-05-2000', 'dd-mm-yyyy'), 1000000113);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (214, 'deliverd', to_date('13-01-2000', 'dd-mm-yyyy'), to_date('27-09-2000', 'dd-mm-yyyy'), 1000000114);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (215, 'sent', to_date('29-02-2000', 'dd-mm-yyyy'), to_date('02-05-2000', 'dd-mm-yyyy'), 1000000115);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (216, 'deliverd', to_date('03-02-2000', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 1000000116);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (217, 'sent', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('25-10-2000', 'dd-mm-yyyy'), 1000000117);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (218, 'deliverd', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('01-07-2000', 'dd-mm-yyyy'), 1000000118);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (219, 'created', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('20-05-2000', 'dd-mm-yyyy'), 1000000119);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (220, 'sent', to_date('14-04-2000', 'dd-mm-yyyy'), to_date('03-05-2000', 'dd-mm-yyyy'), 1000000120);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (221, 'created', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('17-10-2000', 'dd-mm-yyyy'), 1000000121);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (222, 'deliverd', to_date('30-01-2000', 'dd-mm-yyyy'), to_date('10-11-2000', 'dd-mm-yyyy'), 1000000122);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (223, 'created', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('30-11-2000', 'dd-mm-yyyy'), 1000000123);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (224, 'deliverd', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('03-09-2000', 'dd-mm-yyyy'), 1000000124);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (225, 'sent', to_date('05-02-2000', 'dd-mm-yyyy'), to_date('24-10-2000', 'dd-mm-yyyy'), 1000000125);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (226, 'created', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('05-07-2000', 'dd-mm-yyyy'), 1000000126);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (227, 'created', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('03-09-2000', 'dd-mm-yyyy'), 1000000127);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (228, 'deliverd', to_date('11-01-2000', 'dd-mm-yyyy'), to_date('02-12-2000', 'dd-mm-yyyy'), 1000000128);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (229, 'created', to_date('18-01-2000', 'dd-mm-yyyy'), to_date('27-09-2000', 'dd-mm-yyyy'), 1000000129);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (230, 'created', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('17-05-2000', 'dd-mm-yyyy'), 1000000130);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (231, 'deliverd', to_date('03-02-2000', 'dd-mm-yyyy'), to_date('14-08-2000', 'dd-mm-yyyy'), 1000000131);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (232, 'created', to_date('19-04-2000', 'dd-mm-yyyy'), to_date('25-08-2000', 'dd-mm-yyyy'), 1000000132);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (233, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('01-05-2000', 'dd-mm-yyyy'), 1000000133);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (234, 'created', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('31-10-2000', 'dd-mm-yyyy'), 1000000134);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (235, 'sent', to_date('18-04-2000', 'dd-mm-yyyy'), to_date('28-05-2000', 'dd-mm-yyyy'), 1000000135);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (236, 'sent', to_date('13-01-2000', 'dd-mm-yyyy'), to_date('03-06-2000', 'dd-mm-yyyy'), 1000000136);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (237, 'sent', to_date('31-03-2000', 'dd-mm-yyyy'), to_date('01-07-2000', 'dd-mm-yyyy'), 1000000137);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (238, 'created', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('27-08-2000', 'dd-mm-yyyy'), 1000000138);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (239, 'deliverd', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('15-08-2000', 'dd-mm-yyyy'), 1000000139);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (240, 'sent', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('25-07-2000', 'dd-mm-yyyy'), 1000000140);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (241, 'sent', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('14-10-2000', 'dd-mm-yyyy'), 1000000141);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (242, 'deliverd', to_date('08-03-2000', 'dd-mm-yyyy'), to_date('03-12-2000', 'dd-mm-yyyy'), 1000000142);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (243, 'created', to_date('17-04-2000', 'dd-mm-yyyy'), to_date('08-11-2000', 'dd-mm-yyyy'), 1000000143);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (244, 'created', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('24-08-2000', 'dd-mm-yyyy'), 1000000144);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (245, 'deliverd', to_date('07-03-2000', 'dd-mm-yyyy'), to_date('28-05-2000', 'dd-mm-yyyy'), 1000000145);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (246, 'deliverd', to_date('07-03-2000', 'dd-mm-yyyy'), to_date('25-06-2000', 'dd-mm-yyyy'), 1000000146);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (247, 'created', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('01-12-2000', 'dd-mm-yyyy'), 1000000147);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (248, 'deliverd', to_date('19-03-2000', 'dd-mm-yyyy'), to_date('01-11-2000', 'dd-mm-yyyy'), 1000000148);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (249, 'created', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('20-06-2000', 'dd-mm-yyyy'), 1000000149);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (250, 'deliverd', to_date('19-04-2000', 'dd-mm-yyyy'), to_date('28-07-2000', 'dd-mm-yyyy'), 1000000150);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (251, 'created', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('15-07-2000', 'dd-mm-yyyy'), 1000000151);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (252, 'deliverd', to_date('01-01-2000', 'dd-mm-yyyy'), to_date('08-05-2000', 'dd-mm-yyyy'), 1000000152);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (253, 'created', to_date('10-01-2000', 'dd-mm-yyyy'), to_date('27-10-2000', 'dd-mm-yyyy'), 1000000153);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (254, 'created', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('01-09-2000', 'dd-mm-yyyy'), 1000000154);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (255, 'created', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('30-10-2000', 'dd-mm-yyyy'), 1000000155);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (256, 'sent', to_date('21-04-2000', 'dd-mm-yyyy'), to_date('02-09-2000', 'dd-mm-yyyy'), 1000000156);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (257, 'sent', to_date('31-03-2000', 'dd-mm-yyyy'), to_date('04-08-2000', 'dd-mm-yyyy'), 1000000157);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (258, 'created', to_date('29-02-2000', 'dd-mm-yyyy'), to_date('12-05-2000', 'dd-mm-yyyy'), 1000000158);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (259, 'created', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('24-09-2000', 'dd-mm-yyyy'), 1000000159);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (260, 'created', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('19-05-2000', 'dd-mm-yyyy'), 1000000160);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (261, 'deliverd', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('06-06-2000', 'dd-mm-yyyy'), 1000000161);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (262, 'sent', to_date('08-03-2000', 'dd-mm-yyyy'), to_date('07-09-2000', 'dd-mm-yyyy'), 1000000162);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (263, 'sent', to_date('18-03-2000', 'dd-mm-yyyy'), to_date('13-08-2000', 'dd-mm-yyyy'), 1000000163);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (264, 'sent', to_date('23-04-2000', 'dd-mm-yyyy'), to_date('30-09-2000', 'dd-mm-yyyy'), 1000000164);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (265, 'deliverd', to_date('23-03-2000', 'dd-mm-yyyy'), to_date('16-06-2000', 'dd-mm-yyyy'), 1000000165);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (266, 'created', to_date('11-01-2000', 'dd-mm-yyyy'), to_date('04-05-2000', 'dd-mm-yyyy'), 1000000166);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (267, 'sent', to_date('02-04-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000000167);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (268, 'created', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('12-07-2000', 'dd-mm-yyyy'), 1000000168);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (269, 'created', to_date('21-03-2000', 'dd-mm-yyyy'), to_date('20-11-2000', 'dd-mm-yyyy'), 1000000169);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (270, 'created', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('17-11-2000', 'dd-mm-yyyy'), 1000000170);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (271, 'sent', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('08-07-2000', 'dd-mm-yyyy'), 1000000171);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (272, 'deliverd', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('17-09-2000', 'dd-mm-yyyy'), 1000000172);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (273, 'deliverd', to_date('09-02-2000', 'dd-mm-yyyy'), to_date('20-10-2000', 'dd-mm-yyyy'), 1000000173);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (274, 'created', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('20-07-2000', 'dd-mm-yyyy'), 1000000174);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (275, 'sent', to_date('18-04-2000', 'dd-mm-yyyy'), to_date('08-05-2000', 'dd-mm-yyyy'), 1000000175);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (276, 'sent', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('06-06-2000', 'dd-mm-yyyy'), 1000000176);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (277, 'created', to_date('12-03-2000', 'dd-mm-yyyy'), to_date('30-07-2000', 'dd-mm-yyyy'), 1000000177);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (278, 'created', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 1000000178);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (279, 'sent', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('28-11-2000', 'dd-mm-yyyy'), 1000000179);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (280, 'created', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('20-09-2000', 'dd-mm-yyyy'), 1000000180);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (281, 'created', to_date('03-03-2000', 'dd-mm-yyyy'), to_date('06-08-2000', 'dd-mm-yyyy'), 1000000181);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (282, 'deliverd', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('27-05-2000', 'dd-mm-yyyy'), 1000000182);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (283, 'deliverd', to_date('29-03-2000', 'dd-mm-yyyy'), to_date('28-10-2000', 'dd-mm-yyyy'), 1000000183);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (284, 'created', to_date('18-01-2000', 'dd-mm-yyyy'), to_date('26-10-2000', 'dd-mm-yyyy'), 1000000184);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (285, 'deliverd', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('19-11-2000', 'dd-mm-yyyy'), 1000000185);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (286, 'created', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('18-11-2000', 'dd-mm-yyyy'), 1000000186);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (287, 'sent', to_date('07-02-2000', 'dd-mm-yyyy'), to_date('30-06-2000', 'dd-mm-yyyy'), 1000000187);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (288, 'deliverd', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('04-11-2000', 'dd-mm-yyyy'), 1000000188);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (289, 'created', to_date('13-03-2000', 'dd-mm-yyyy'), to_date('06-10-2000', 'dd-mm-yyyy'), 1000000189);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (290, 'sent', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('04-07-2000', 'dd-mm-yyyy'), 1000000190);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (291, 'created', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000191);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (292, 'sent', to_date('28-03-2000', 'dd-mm-yyyy'), to_date('20-10-2000', 'dd-mm-yyyy'), 1000000192);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (293, 'deliverd', to_date('29-02-2000', 'dd-mm-yyyy'), to_date('11-12-2000', 'dd-mm-yyyy'), 1000000193);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (294, 'deliverd', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('11-06-2000', 'dd-mm-yyyy'), 1000000194);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (295, 'deliverd', to_date('06-01-2000', 'dd-mm-yyyy'), to_date('15-07-2000', 'dd-mm-yyyy'), 1000000195);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (296, 'sent', to_date('11-02-2000', 'dd-mm-yyyy'), to_date('06-11-2000', 'dd-mm-yyyy'), 1000000196);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (297, 'deliverd', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('01-10-2000', 'dd-mm-yyyy'), 1000000197);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (298, 'deliverd', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('17-11-2000', 'dd-mm-yyyy'), 1000000198);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (299, 'sent', to_date('22-03-2000', 'dd-mm-yyyy'), to_date('11-08-2000', 'dd-mm-yyyy'), 1000000199);
commit;
prompt 200 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (300, 'created', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('05-06-2000', 'dd-mm-yyyy'), 1000000200);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (301, 'created', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('04-08-2000', 'dd-mm-yyyy'), 1000000201);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (302, 'deliverd', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('15-09-2000', 'dd-mm-yyyy'), 1000000202);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (303, 'deliverd', to_date('02-01-2000', 'dd-mm-yyyy'), to_date('11-05-2000', 'dd-mm-yyyy'), 1000000203);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (304, 'sent', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('01-12-2000', 'dd-mm-yyyy'), 1000000204);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (305, 'sent', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('16-10-2000', 'dd-mm-yyyy'), 1000000205);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (306, 'sent', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('30-05-2000', 'dd-mm-yyyy'), 1000000206);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (307, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('14-10-2000', 'dd-mm-yyyy'), 1000000207);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (308, 'sent', to_date('29-03-2000', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 1000000208);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (309, 'created', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('12-06-2000', 'dd-mm-yyyy'), 1000000209);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (310, 'sent', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('30-05-2000', 'dd-mm-yyyy'), 1000000210);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (311, 'deliverd', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('26-09-2000', 'dd-mm-yyyy'), 1000000211);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (312, 'sent', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('16-11-2000', 'dd-mm-yyyy'), 1000000212);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (313, 'sent', to_date('29-01-2000', 'dd-mm-yyyy'), to_date('10-09-2000', 'dd-mm-yyyy'), 1000000213);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (314, 'created', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('06-09-2000', 'dd-mm-yyyy'), 1000000214);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (315, 'deliverd', to_date('13-03-2000', 'dd-mm-yyyy'), to_date('17-06-2000', 'dd-mm-yyyy'), 1000000215);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (316, 'sent', to_date('10-03-2000', 'dd-mm-yyyy'), to_date('16-11-2000', 'dd-mm-yyyy'), 1000000216);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (317, 'created', to_date('30-03-2000', 'dd-mm-yyyy'), to_date('04-12-2000', 'dd-mm-yyyy'), 1000000217);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (318, 'deliverd', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('19-05-2000', 'dd-mm-yyyy'), 1000000218);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (319, 'created', to_date('11-01-2000', 'dd-mm-yyyy'), to_date('22-05-2000', 'dd-mm-yyyy'), 1000000219);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (320, 'deliverd', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('18-05-2000', 'dd-mm-yyyy'), 1000000220);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (321, 'deliverd', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('30-08-2000', 'dd-mm-yyyy'), 1000000221);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (322, 'sent', to_date('13-03-2000', 'dd-mm-yyyy'), to_date('30-07-2000', 'dd-mm-yyyy'), 1000000222);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (323, 'created', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('06-07-2000', 'dd-mm-yyyy'), 1000000223);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (324, 'created', to_date('10-03-2000', 'dd-mm-yyyy'), to_date('08-06-2000', 'dd-mm-yyyy'), 1000000224);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (325, 'sent', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('12-11-2000', 'dd-mm-yyyy'), 1000000225);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (326, 'deliverd', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('12-06-2000', 'dd-mm-yyyy'), 1000000226);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (327, 'created', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('15-05-2000', 'dd-mm-yyyy'), 1000000227);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (328, 'sent', to_date('30-04-2000', 'dd-mm-yyyy'), to_date('07-09-2000', 'dd-mm-yyyy'), 1000000228);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (329, 'sent', to_date('28-02-2000', 'dd-mm-yyyy'), to_date('16-06-2000', 'dd-mm-yyyy'), 1000000229);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (330, 'sent', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('20-10-2000', 'dd-mm-yyyy'), 1000000230);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (331, 'deliverd', to_date('28-03-2000', 'dd-mm-yyyy'), to_date('13-06-2000', 'dd-mm-yyyy'), 1000000231);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (332, 'created', to_date('19-02-2000', 'dd-mm-yyyy'), to_date('02-05-2000', 'dd-mm-yyyy'), 1000000232);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (333, 'deliverd', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('14-08-2000', 'dd-mm-yyyy'), 1000000233);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (334, 'deliverd', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('02-10-2000', 'dd-mm-yyyy'), 1000000234);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (335, 'sent', to_date('19-02-2000', 'dd-mm-yyyy'), to_date('05-05-2000', 'dd-mm-yyyy'), 1000000235);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (336, 'created', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('08-08-2000', 'dd-mm-yyyy'), 1000000236);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (337, 'deliverd', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000237);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (338, 'sent', to_date('14-01-2000', 'dd-mm-yyyy'), to_date('30-05-2000', 'dd-mm-yyyy'), 1000000238);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (339, 'created', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('02-05-2000', 'dd-mm-yyyy'), 1000000239);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (340, 'deliverd', to_date('19-04-2000', 'dd-mm-yyyy'), to_date('09-12-2000', 'dd-mm-yyyy'), 1000000240);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (341, 'deliverd', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('05-06-2000', 'dd-mm-yyyy'), 1000000241);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (342, 'sent', to_date('22-01-2000', 'dd-mm-yyyy'), to_date('20-08-2000', 'dd-mm-yyyy'), 1000000242);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (343, 'sent', to_date('29-02-2000', 'dd-mm-yyyy'), to_date('17-11-2000', 'dd-mm-yyyy'), 1000000243);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (344, 'deliverd', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('21-10-2000', 'dd-mm-yyyy'), 1000000244);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (345, 'created', to_date('02-01-2000', 'dd-mm-yyyy'), to_date('06-09-2000', 'dd-mm-yyyy'), 1000000245);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (346, 'deliverd', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('18-10-2000', 'dd-mm-yyyy'), 1000000246);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (347, 'sent', to_date('01-02-2000', 'dd-mm-yyyy'), to_date('16-09-2000', 'dd-mm-yyyy'), 1000000247);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (348, 'deliverd', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('26-11-2000', 'dd-mm-yyyy'), 1000000248);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (349, 'created', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('08-11-2000', 'dd-mm-yyyy'), 1000000249);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (350, 'deliverd', to_date('01-01-2000', 'dd-mm-yyyy'), to_date('06-08-2000', 'dd-mm-yyyy'), 1000000250);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (351, 'created', to_date('22-03-2000', 'dd-mm-yyyy'), to_date('25-09-2000', 'dd-mm-yyyy'), 1000000251);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (352, 'sent', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('22-06-2000', 'dd-mm-yyyy'), 1000000252);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (353, 'deliverd', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('11-05-2000', 'dd-mm-yyyy'), 1000000253);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (354, 'created', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('13-06-2000', 'dd-mm-yyyy'), 1000000254);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (355, 'created', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('31-07-2000', 'dd-mm-yyyy'), 1000000255);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (356, 'created', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('08-12-2000', 'dd-mm-yyyy'), 1000000256);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (357, 'created', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('28-11-2000', 'dd-mm-yyyy'), 1000000257);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (358, 'deliverd', to_date('20-03-2000', 'dd-mm-yyyy'), to_date('22-08-2000', 'dd-mm-yyyy'), 1000000258);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (359, 'created', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('10-10-2000', 'dd-mm-yyyy'), 1000000259);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (360, 'deliverd', to_date('30-03-2000', 'dd-mm-yyyy'), to_date('14-06-2000', 'dd-mm-yyyy'), 1000000260);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (361, 'deliverd', to_date('19-03-2000', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 1000000261);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (362, 'sent', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('05-11-2000', 'dd-mm-yyyy'), 1000000262);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (363, 'sent', to_date('03-02-2000', 'dd-mm-yyyy'), to_date('02-11-2000', 'dd-mm-yyyy'), 1000000263);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (364, 'created', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('26-06-2000', 'dd-mm-yyyy'), 1000000264);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (365, 'created', to_date('20-03-2000', 'dd-mm-yyyy'), to_date('16-09-2000', 'dd-mm-yyyy'), 1000000265);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (366, 'created', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('30-06-2000', 'dd-mm-yyyy'), 1000000266);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (367, 'created', to_date('28-01-2000', 'dd-mm-yyyy'), to_date('27-05-2000', 'dd-mm-yyyy'), 1000000267);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (368, 'deliverd', to_date('21-04-2000', 'dd-mm-yyyy'), to_date('01-08-2000', 'dd-mm-yyyy'), 1000000268);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (369, 'deliverd', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('29-10-2000', 'dd-mm-yyyy'), 1000000269);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (370, 'sent', to_date('16-01-2000', 'dd-mm-yyyy'), to_date('12-09-2000', 'dd-mm-yyyy'), 1000000270);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (371, 'deliverd', to_date('23-04-2000', 'dd-mm-yyyy'), to_date('03-10-2000', 'dd-mm-yyyy'), 1000000271);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (372, 'created', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('07-05-2000', 'dd-mm-yyyy'), 1000000272);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (373, 'deliverd', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('10-08-2000', 'dd-mm-yyyy'), 1000000273);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (374, 'sent', to_date('05-02-2000', 'dd-mm-yyyy'), to_date('26-06-2000', 'dd-mm-yyyy'), 1000000274);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (375, 'created', to_date('27-01-2000', 'dd-mm-yyyy'), to_date('16-08-2000', 'dd-mm-yyyy'), 1000000275);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (376, 'deliverd', to_date('05-02-2000', 'dd-mm-yyyy'), to_date('26-06-2000', 'dd-mm-yyyy'), 1000000276);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (377, 'created', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('03-12-2000', 'dd-mm-yyyy'), 1000000277);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (378, 'deliverd', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('08-09-2000', 'dd-mm-yyyy'), 1000000278);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (379, 'deliverd', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('26-07-2000', 'dd-mm-yyyy'), 1000000279);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (380, 'deliverd', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('04-09-2000', 'dd-mm-yyyy'), 1000000280);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (381, 'created', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('21-07-2000', 'dd-mm-yyyy'), 1000000281);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (382, 'deliverd', to_date('22-03-2000', 'dd-mm-yyyy'), to_date('01-08-2000', 'dd-mm-yyyy'), 1000000282);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (383, 'created', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('14-11-2000', 'dd-mm-yyyy'), 1000000283);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (384, 'deliverd', to_date('19-04-2000', 'dd-mm-yyyy'), to_date('24-08-2000', 'dd-mm-yyyy'), 1000000284);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (385, 'deliverd', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('30-08-2000', 'dd-mm-yyyy'), 1000000285);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (386, 'sent', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('05-11-2000', 'dd-mm-yyyy'), 1000000286);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (387, 'deliverd', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('28-10-2000', 'dd-mm-yyyy'), 1000000287);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (388, 'created', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('29-07-2000', 'dd-mm-yyyy'), 1000000288);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (389, 'deliverd', to_date('29-01-2000', 'dd-mm-yyyy'), to_date('01-11-2000', 'dd-mm-yyyy'), 1000000289);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (390, 'created', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('04-10-2000', 'dd-mm-yyyy'), 1000000290);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (391, 'created', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('09-08-2000', 'dd-mm-yyyy'), 1000000291);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (392, 'deliverd', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('29-10-2000', 'dd-mm-yyyy'), 1000000292);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (393, 'sent', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 1000000293);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (394, 'sent', to_date('01-02-2000', 'dd-mm-yyyy'), to_date('15-06-2000', 'dd-mm-yyyy'), 1000000294);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (395, 'deliverd', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('30-05-2000', 'dd-mm-yyyy'), 1000000295);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (396, 'deliverd', to_date('03-03-2000', 'dd-mm-yyyy'), to_date('01-07-2000', 'dd-mm-yyyy'), 1000000296);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (397, 'sent', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('29-07-2000', 'dd-mm-yyyy'), 1000000297);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (398, 'created', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('22-09-2000', 'dd-mm-yyyy'), 1000000298);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (399, 'created', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('30-10-2000', 'dd-mm-yyyy'), 1000000299);
commit;
prompt 300 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (400, 'deliverd', to_date('23-04-2000', 'dd-mm-yyyy'), to_date('12-08-2000', 'dd-mm-yyyy'), 1000000300);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (401, 'sent', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 1000000301);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (402, 'created', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 1000000302);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (403, 'created', to_date('14-01-2000', 'dd-mm-yyyy'), to_date('16-08-2000', 'dd-mm-yyyy'), 1000000303);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (404, 'sent', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('10-09-2000', 'dd-mm-yyyy'), 1000000304);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (405, 'deliverd', to_date('20-01-2000', 'dd-mm-yyyy'), to_date('23-09-2000', 'dd-mm-yyyy'), 1000000305);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (406, 'deliverd', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('07-05-2000', 'dd-mm-yyyy'), 1000000306);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (407, 'deliverd', to_date('18-03-2000', 'dd-mm-yyyy'), to_date('20-07-2000', 'dd-mm-yyyy'), 1000000307);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (408, 'sent', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('10-05-2000', 'dd-mm-yyyy'), 1000000308);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (409, 'deliverd', to_date('19-03-2000', 'dd-mm-yyyy'), to_date('09-05-2000', 'dd-mm-yyyy'), 1000000309);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (410, 'sent', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('03-11-2000', 'dd-mm-yyyy'), 1000000310);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (411, 'created', to_date('28-01-2000', 'dd-mm-yyyy'), to_date('22-06-2000', 'dd-mm-yyyy'), 1000000311);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (412, 'created', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('03-08-2000', 'dd-mm-yyyy'), 1000000312);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (413, 'deliverd', to_date('13-01-2000', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 1000000313);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (414, 'deliverd', to_date('09-01-2000', 'dd-mm-yyyy'), to_date('18-09-2000', 'dd-mm-yyyy'), 1000000314);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (415, 'created', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('02-07-2000', 'dd-mm-yyyy'), 1000000315);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (416, 'sent', to_date('01-02-2000', 'dd-mm-yyyy'), to_date('28-07-2000', 'dd-mm-yyyy'), 1000000316);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (417, 'created', to_date('20-03-2000', 'dd-mm-yyyy'), to_date('31-08-2000', 'dd-mm-yyyy'), 1000000317);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (418, 'deliverd', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('24-11-2000', 'dd-mm-yyyy'), 1000000318);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (419, 'sent', to_date('21-04-2000', 'dd-mm-yyyy'), to_date('13-07-2000', 'dd-mm-yyyy'), 1000000319);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (420, 'sent', to_date('31-03-2000', 'dd-mm-yyyy'), to_date('29-05-2000', 'dd-mm-yyyy'), 1000000320);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (421, 'deliverd', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('05-09-2000', 'dd-mm-yyyy'), 1000000321);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (422, 'sent', to_date('16-03-2000', 'dd-mm-yyyy'), to_date('04-12-2000', 'dd-mm-yyyy'), 1000000322);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (423, 'sent', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('11-08-2000', 'dd-mm-yyyy'), 1000000323);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (424, 'deliverd', to_date('18-03-2000', 'dd-mm-yyyy'), to_date('26-06-2000', 'dd-mm-yyyy'), 1000000324);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (425, 'sent', to_date('10-01-2000', 'dd-mm-yyyy'), to_date('25-07-2000', 'dd-mm-yyyy'), 1000000325);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (426, 'sent', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('07-11-2000', 'dd-mm-yyyy'), 1000000326);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (427, 'created', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('24-06-2000', 'dd-mm-yyyy'), 1000000327);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (428, 'created', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('17-08-2000', 'dd-mm-yyyy'), 1000000328);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (429, 'created', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('09-07-2000', 'dd-mm-yyyy'), 1000000329);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (430, 'created', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('20-06-2000', 'dd-mm-yyyy'), 1000000330);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (431, 'sent', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('05-06-2000', 'dd-mm-yyyy'), 1000000331);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (432, 'created', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('09-08-2000', 'dd-mm-yyyy'), 1000000332);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (433, 'created', to_date('16-01-2000', 'dd-mm-yyyy'), to_date('13-08-2000', 'dd-mm-yyyy'), 1000000333);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (434, 'deliverd', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('07-11-2000', 'dd-mm-yyyy'), 1000000334);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (435, 'created', to_date('12-02-2000', 'dd-mm-yyyy'), to_date('14-11-2000', 'dd-mm-yyyy'), 1000000335);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (436, 'sent', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('27-07-2000', 'dd-mm-yyyy'), 1000000336);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (437, 'created', to_date('19-03-2000', 'dd-mm-yyyy'), to_date('26-10-2000', 'dd-mm-yyyy'), 1000000337);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (438, 'sent', to_date('09-04-2000', 'dd-mm-yyyy'), to_date('23-05-2000', 'dd-mm-yyyy'), 1000000338);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (439, 'deliverd', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('30-08-2000', 'dd-mm-yyyy'), 1000000339);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (440, 'sent', to_date('28-03-2000', 'dd-mm-yyyy'), to_date('21-09-2000', 'dd-mm-yyyy'), 1000000340);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (441, 'sent', to_date('07-02-2000', 'dd-mm-yyyy'), to_date('25-10-2000', 'dd-mm-yyyy'), 1000000341);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (442, 'sent', to_date('04-03-2000', 'dd-mm-yyyy'), to_date('11-06-2000', 'dd-mm-yyyy'), 1000000342);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (443, 'created', to_date('09-04-2000', 'dd-mm-yyyy'), to_date('12-06-2000', 'dd-mm-yyyy'), 1000000343);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (444, 'sent', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('09-06-2000', 'dd-mm-yyyy'), 1000000344);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (445, 'created', to_date('10-03-2000', 'dd-mm-yyyy'), to_date('30-06-2000', 'dd-mm-yyyy'), 1000000345);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (446, 'sent', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('31-10-2000', 'dd-mm-yyyy'), 1000000346);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (447, 'deliverd', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('29-11-2000', 'dd-mm-yyyy'), 1000000347);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (448, 'sent', to_date('30-01-2000', 'dd-mm-yyyy'), to_date('15-09-2000', 'dd-mm-yyyy'), 1000000348);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (449, 'sent', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('24-10-2000', 'dd-mm-yyyy'), 1000000349);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (450, 'sent', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('30-07-2000', 'dd-mm-yyyy'), 1000000350);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (451, 'sent', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('26-09-2000', 'dd-mm-yyyy'), 1000000351);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (452, 'created', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('30-07-2000', 'dd-mm-yyyy'), 1000000352);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (453, 'deliverd', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('04-10-2000', 'dd-mm-yyyy'), 1000000353);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (454, 'deliverd', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('06-06-2000', 'dd-mm-yyyy'), 1000000354);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (455, 'sent', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('12-05-2000', 'dd-mm-yyyy'), 1000000355);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (456, 'deliverd', to_date('29-01-2000', 'dd-mm-yyyy'), to_date('05-06-2000', 'dd-mm-yyyy'), 1000000356);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (457, 'created', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('24-11-2000', 'dd-mm-yyyy'), 1000000357);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (458, 'created', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('23-09-2000', 'dd-mm-yyyy'), 1000000358);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (459, 'created', to_date('19-03-2000', 'dd-mm-yyyy'), to_date('14-09-2000', 'dd-mm-yyyy'), 1000000359);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (460, 'sent', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('05-07-2000', 'dd-mm-yyyy'), 1000000360);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (461, 'deliverd', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('26-10-2000', 'dd-mm-yyyy'), 1000000361);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (462, 'deliverd', to_date('19-04-2000', 'dd-mm-yyyy'), to_date('10-09-2000', 'dd-mm-yyyy'), 1000000362);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (463, 'deliverd', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('24-10-2000', 'dd-mm-yyyy'), 1000000363);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (464, 'sent', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('21-08-2000', 'dd-mm-yyyy'), 1000000364);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (465, 'deliverd', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('05-10-2000', 'dd-mm-yyyy'), 1000000365);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (466, 'sent', to_date('25-03-2000', 'dd-mm-yyyy'), to_date('15-05-2000', 'dd-mm-yyyy'), 1000000366);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (467, 'sent', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('24-06-2000', 'dd-mm-yyyy'), 1000000367);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (468, 'sent', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('28-09-2000', 'dd-mm-yyyy'), 1000000368);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (469, 'sent', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('23-07-2000', 'dd-mm-yyyy'), 1000000369);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (470, 'created', to_date('03-01-2000', 'dd-mm-yyyy'), to_date('25-07-2000', 'dd-mm-yyyy'), 1000000370);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (471, 'created', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('25-05-2000', 'dd-mm-yyyy'), 1000000371);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (472, 'deliverd', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('06-07-2000', 'dd-mm-yyyy'), 1000000372);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (473, 'deliverd', to_date('18-03-2000', 'dd-mm-yyyy'), to_date('21-11-2000', 'dd-mm-yyyy'), 1000000373);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (474, 'deliverd', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('19-06-2000', 'dd-mm-yyyy'), 1000000374);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (475, 'deliverd', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('17-09-2000', 'dd-mm-yyyy'), 1000000375);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (476, 'sent', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('21-08-2000', 'dd-mm-yyyy'), 1000000376);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (477, 'created', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('10-05-2000', 'dd-mm-yyyy'), 1000000377);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (478, 'deliverd', to_date('19-02-2000', 'dd-mm-yyyy'), to_date('13-11-2000', 'dd-mm-yyyy'), 1000000378);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (479, 'created', to_date('23-04-2000', 'dd-mm-yyyy'), to_date('02-09-2000', 'dd-mm-yyyy'), 1000000379);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (480, 'deliverd', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('11-06-2000', 'dd-mm-yyyy'), 1000000380);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (481, 'deliverd', to_date('20-01-2000', 'dd-mm-yyyy'), to_date('11-06-2000', 'dd-mm-yyyy'), 1000000381);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (482, 'deliverd', to_date('27-01-2000', 'dd-mm-yyyy'), to_date('22-09-2000', 'dd-mm-yyyy'), 1000000382);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (483, 'deliverd', to_date('09-01-2000', 'dd-mm-yyyy'), to_date('10-07-2000', 'dd-mm-yyyy'), 1000000383);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (484, 'created', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('05-12-2000', 'dd-mm-yyyy'), 1000000384);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (485, 'sent', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('10-06-2000', 'dd-mm-yyyy'), 1000000385);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (486, 'sent', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('19-10-2000', 'dd-mm-yyyy'), 1000000386);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (487, 'created', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('13-09-2000', 'dd-mm-yyyy'), 1000000387);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (488, 'created', to_date('08-04-2000', 'dd-mm-yyyy'), to_date('21-11-2000', 'dd-mm-yyyy'), 1000000388);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (489, 'deliverd', to_date('03-01-2000', 'dd-mm-yyyy'), to_date('26-11-2000', 'dd-mm-yyyy'), 1000000389);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (490, 'sent', to_date('10-03-2000', 'dd-mm-yyyy'), to_date('24-07-2000', 'dd-mm-yyyy'), 1000000390);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (491, 'sent', to_date('28-01-2000', 'dd-mm-yyyy'), to_date('10-12-2000', 'dd-mm-yyyy'), 1000000391);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (492, 'created', to_date('19-03-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000000392);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (493, 'sent', to_date('01-02-2000', 'dd-mm-yyyy'), to_date('23-06-2000', 'dd-mm-yyyy'), 1000000393);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (494, 'created', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000394);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (495, 'created', to_date('01-04-2000', 'dd-mm-yyyy'), to_date('19-11-2000', 'dd-mm-yyyy'), 1000000395);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (496, 'deliverd', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('01-05-2000', 'dd-mm-yyyy'), 1000000396);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (497, 'deliverd', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('25-08-2000', 'dd-mm-yyyy'), 1000000397);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (498, 'deliverd', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('15-09-2000', 'dd-mm-yyyy'), 1000000398);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (499, 'created', to_date('30-04-2000', 'dd-mm-yyyy'), to_date('14-10-2000', 'dd-mm-yyyy'), 1000000399);
commit;
prompt 400 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (500, 'created', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('10-06-2000', 'dd-mm-yyyy'), 1000000400);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (501, 'deliverd', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('15-07-2000', 'dd-mm-yyyy'), 1000000401);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (502, 'deliverd', to_date('29-01-2000', 'dd-mm-yyyy'), to_date('04-08-2000', 'dd-mm-yyyy'), 1000000402);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (503, 'sent', to_date('18-04-2000', 'dd-mm-yyyy'), to_date('22-06-2000', 'dd-mm-yyyy'), 1000000403);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (504, 'deliverd', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('07-05-2000', 'dd-mm-yyyy'), 1000000404);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (505, 'sent', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('24-10-2000', 'dd-mm-yyyy'), 1000000405);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (506, 'deliverd', to_date('11-02-2000', 'dd-mm-yyyy'), to_date('28-07-2000', 'dd-mm-yyyy'), 1000000406);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (507, 'created', to_date('30-04-2000', 'dd-mm-yyyy'), to_date('17-06-2000', 'dd-mm-yyyy'), 1000000407);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (508, 'deliverd', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('21-05-2000', 'dd-mm-yyyy'), 1000000408);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (509, 'sent', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('17-06-2000', 'dd-mm-yyyy'), 1000000409);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (510, 'sent', to_date('10-01-2000', 'dd-mm-yyyy'), to_date('02-11-2000', 'dd-mm-yyyy'), 1000000410);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (511, 'sent', to_date('30-03-2000', 'dd-mm-yyyy'), to_date('17-07-2000', 'dd-mm-yyyy'), 1000000411);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (512, 'sent', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('25-07-2000', 'dd-mm-yyyy'), 1000000412);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (513, 'deliverd', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('14-11-2000', 'dd-mm-yyyy'), 1000000413);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (514, 'created', to_date('09-04-2000', 'dd-mm-yyyy'), to_date('27-07-2000', 'dd-mm-yyyy'), 1000000414);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (515, 'created', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('17-09-2000', 'dd-mm-yyyy'), 1000000415);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (516, 'deliverd', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('20-05-2000', 'dd-mm-yyyy'), 1000000416);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (517, 'created', to_date('12-03-2000', 'dd-mm-yyyy'), to_date('08-08-2000', 'dd-mm-yyyy'), 1000000417);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (518, 'deliverd', to_date('06-01-2000', 'dd-mm-yyyy'), to_date('17-11-2000', 'dd-mm-yyyy'), 1000000418);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (519, 'created', to_date('29-04-2000', 'dd-mm-yyyy'), to_date('07-09-2000', 'dd-mm-yyyy'), 1000000419);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (520, 'sent', to_date('29-04-2000', 'dd-mm-yyyy'), to_date('27-09-2000', 'dd-mm-yyyy'), 1000000420);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (521, 'sent', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('01-08-2000', 'dd-mm-yyyy'), 1000000421);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (522, 'created', to_date('19-02-2000', 'dd-mm-yyyy'), to_date('01-10-2000', 'dd-mm-yyyy'), 1000000422);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (523, 'deliverd', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('24-08-2000', 'dd-mm-yyyy'), 1000000423);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (524, 'deliverd', to_date('21-04-2000', 'dd-mm-yyyy'), to_date('20-08-2000', 'dd-mm-yyyy'), 1000000424);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (525, 'created', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('10-12-2000', 'dd-mm-yyyy'), 1000000425);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (526, 'deliverd', to_date('14-01-2000', 'dd-mm-yyyy'), to_date('18-09-2000', 'dd-mm-yyyy'), 1000000426);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (527, 'created', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('05-07-2000', 'dd-mm-yyyy'), 1000000427);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (528, 'sent', to_date('28-03-2000', 'dd-mm-yyyy'), to_date('17-09-2000', 'dd-mm-yyyy'), 1000000428);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (529, 'deliverd', to_date('08-01-2000', 'dd-mm-yyyy'), to_date('18-11-2000', 'dd-mm-yyyy'), 1000000429);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (530, 'created', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('01-10-2000', 'dd-mm-yyyy'), 1000000430);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (531, 'sent', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('21-07-2000', 'dd-mm-yyyy'), 1000000431);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (532, 'sent', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('13-06-2000', 'dd-mm-yyyy'), 1000000432);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (533, 'deliverd', to_date('15-01-2000', 'dd-mm-yyyy'), to_date('18-05-2000', 'dd-mm-yyyy'), 1000000433);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (534, 'created', to_date('25-03-2000', 'dd-mm-yyyy'), to_date('04-08-2000', 'dd-mm-yyyy'), 1000000434);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (535, 'created', to_date('01-01-2000', 'dd-mm-yyyy'), to_date('03-06-2000', 'dd-mm-yyyy'), 1000000435);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (536, 'created', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('18-09-2000', 'dd-mm-yyyy'), 1000000436);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (537, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('23-08-2000', 'dd-mm-yyyy'), 1000000437);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (538, 'created', to_date('13-03-2000', 'dd-mm-yyyy'), to_date('15-05-2000', 'dd-mm-yyyy'), 1000000438);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (539, 'created', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('08-12-2000', 'dd-mm-yyyy'), 1000000439);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (540, 'sent', to_date('22-01-2000', 'dd-mm-yyyy'), to_date('25-09-2000', 'dd-mm-yyyy'), 1000000440);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (541, 'sent', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('18-07-2000', 'dd-mm-yyyy'), 1000000441);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (542, 'deliverd', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('04-11-2000', 'dd-mm-yyyy'), 1000000442);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (543, 'sent', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000000443);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (544, 'created', to_date('17-04-2000', 'dd-mm-yyyy'), to_date('14-10-2000', 'dd-mm-yyyy'), 1000000444);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (545, 'sent', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('15-06-2000', 'dd-mm-yyyy'), 1000000445);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (546, 'created', to_date('07-03-2000', 'dd-mm-yyyy'), to_date('23-10-2000', 'dd-mm-yyyy'), 1000000446);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (547, 'sent', to_date('23-02-2000', 'dd-mm-yyyy'), to_date('14-10-2000', 'dd-mm-yyyy'), 1000000447);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (548, 'sent', to_date('09-01-2000', 'dd-mm-yyyy'), to_date('28-08-2000', 'dd-mm-yyyy'), 1000000448);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (549, 'sent', to_date('14-02-2000', 'dd-mm-yyyy'), to_date('19-07-2000', 'dd-mm-yyyy'), 1000000449);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (550, 'deliverd', to_date('27-04-2000', 'dd-mm-yyyy'), to_date('11-07-2000', 'dd-mm-yyyy'), 1000000450);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (551, 'created', to_date('14-04-2000', 'dd-mm-yyyy'), to_date('19-08-2000', 'dd-mm-yyyy'), 1000000451);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (552, 'sent', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('15-07-2000', 'dd-mm-yyyy'), 1000000452);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (553, 'sent', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('13-05-2000', 'dd-mm-yyyy'), 1000000453);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (554, 'sent', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('27-05-2000', 'dd-mm-yyyy'), 1000000454);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (555, 'deliverd', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('12-09-2000', 'dd-mm-yyyy'), 1000000455);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (556, 'sent', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('28-10-2000', 'dd-mm-yyyy'), 1000000456);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (557, 'deliverd', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('20-07-2000', 'dd-mm-yyyy'), 1000000457);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (558, 'deliverd', to_date('31-03-2000', 'dd-mm-yyyy'), to_date('30-05-2000', 'dd-mm-yyyy'), 1000000458);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (559, 'sent', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('12-07-2000', 'dd-mm-yyyy'), 1000000459);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (560, 'created', to_date('01-01-2000', 'dd-mm-yyyy'), to_date('30-06-2000', 'dd-mm-yyyy'), 1000000460);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (561, 'sent', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('04-05-2000', 'dd-mm-yyyy'), 1000000461);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (562, 'created', to_date('20-03-2000', 'dd-mm-yyyy'), to_date('11-11-2000', 'dd-mm-yyyy'), 1000000462);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (563, 'sent', to_date('19-02-2000', 'dd-mm-yyyy'), to_date('30-11-2000', 'dd-mm-yyyy'), 1000000463);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (564, 'sent', to_date('27-01-2000', 'dd-mm-yyyy'), to_date('18-08-2000', 'dd-mm-yyyy'), 1000000464);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (565, 'sent', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('11-08-2000', 'dd-mm-yyyy'), 1000000465);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (566, 'created', to_date('23-04-2000', 'dd-mm-yyyy'), to_date('19-06-2000', 'dd-mm-yyyy'), 1000000466);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (567, 'deliverd', to_date('11-02-2000', 'dd-mm-yyyy'), to_date('11-06-2000', 'dd-mm-yyyy'), 1000000467);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (568, 'sent', to_date('30-03-2000', 'dd-mm-yyyy'), to_date('21-09-2000', 'dd-mm-yyyy'), 1000000468);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (569, 'created', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('17-11-2000', 'dd-mm-yyyy'), 1000000469);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (570, 'deliverd', to_date('03-03-2000', 'dd-mm-yyyy'), to_date('15-08-2000', 'dd-mm-yyyy'), 1000000470);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (571, 'deliverd', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('04-07-2000', 'dd-mm-yyyy'), 1000000471);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (572, 'sent', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('23-11-2000', 'dd-mm-yyyy'), 1000000472);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (573, 'created', to_date('30-03-2000', 'dd-mm-yyyy'), to_date('07-12-2000', 'dd-mm-yyyy'), 1000000473);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (574, 'sent', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('17-06-2000', 'dd-mm-yyyy'), 1000000474);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (575, 'sent', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('20-07-2000', 'dd-mm-yyyy'), 1000000475);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (576, 'deliverd', to_date('16-03-2000', 'dd-mm-yyyy'), to_date('16-05-2000', 'dd-mm-yyyy'), 1000000476);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (577, 'sent', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('03-10-2000', 'dd-mm-yyyy'), 1000000477);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (578, 'deliverd', to_date('08-01-2000', 'dd-mm-yyyy'), to_date('16-07-2000', 'dd-mm-yyyy'), 1000000478);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (579, 'sent', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('28-09-2000', 'dd-mm-yyyy'), 1000000479);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (580, 'sent', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('11-09-2000', 'dd-mm-yyyy'), 1000000480);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (581, 'created', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('24-06-2000', 'dd-mm-yyyy'), 1000000481);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (582, 'sent', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('09-08-2000', 'dd-mm-yyyy'), 1000000482);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (583, 'sent', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('03-12-2000', 'dd-mm-yyyy'), 1000000483);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (584, 'deliverd', to_date('04-02-2000', 'dd-mm-yyyy'), to_date('15-09-2000', 'dd-mm-yyyy'), 1000000484);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (585, 'deliverd', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('30-06-2000', 'dd-mm-yyyy'), 1000000485);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (586, 'sent', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('29-05-2000', 'dd-mm-yyyy'), 1000000486);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (587, 'sent', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('02-05-2000', 'dd-mm-yyyy'), 1000000487);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (588, 'sent', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('02-09-2000', 'dd-mm-yyyy'), 1000000488);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (589, 'sent', to_date('29-03-2000', 'dd-mm-yyyy'), to_date('11-09-2000', 'dd-mm-yyyy'), 1000000489);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (590, 'sent', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('20-05-2000', 'dd-mm-yyyy'), 1000000490);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (591, 'created', to_date('08-03-2000', 'dd-mm-yyyy'), to_date('27-11-2000', 'dd-mm-yyyy'), 1000000491);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (592, 'deliverd', to_date('12-02-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000000492);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (593, 'created', to_date('08-04-2000', 'dd-mm-yyyy'), to_date('01-07-2000', 'dd-mm-yyyy'), 1000000493);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (594, 'deliverd', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('30-05-2000', 'dd-mm-yyyy'), 1000000494);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (595, 'created', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000000495);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (596, 'created', to_date('20-01-2000', 'dd-mm-yyyy'), to_date('21-07-2000', 'dd-mm-yyyy'), 1000000496);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (597, 'created', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('21-10-2000', 'dd-mm-yyyy'), 1000000497);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (598, 'sent', to_date('09-04-2000', 'dd-mm-yyyy'), to_date('04-07-2000', 'dd-mm-yyyy'), 1000000498);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (599, 'deliverd', to_date('09-01-2000', 'dd-mm-yyyy'), to_date('14-10-2000', 'dd-mm-yyyy'), 1000000499);
commit;
prompt 500 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (600, 'deliverd', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('26-07-2000', 'dd-mm-yyyy'), 1000000500);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (601, 'sent', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('04-08-2000', 'dd-mm-yyyy'), 1000000501);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (602, 'created', to_date('18-04-2000', 'dd-mm-yyyy'), to_date('17-10-2000', 'dd-mm-yyyy'), 1000000502);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (603, 'sent', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('26-10-2000', 'dd-mm-yyyy'), 1000000503);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (604, 'created', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('18-09-2000', 'dd-mm-yyyy'), 1000000504);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (605, 'created', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('09-09-2000', 'dd-mm-yyyy'), 1000000505);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (606, 'created', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('31-07-2000', 'dd-mm-yyyy'), 1000000506);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (607, 'created', to_date('28-03-2000', 'dd-mm-yyyy'), to_date('04-12-2000', 'dd-mm-yyyy'), 1000000507);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (608, 'deliverd', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('08-08-2000', 'dd-mm-yyyy'), 1000000508);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (609, 'deliverd', to_date('09-02-2000', 'dd-mm-yyyy'), to_date('19-05-2000', 'dd-mm-yyyy'), 1000000509);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (610, 'created', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('10-12-2000', 'dd-mm-yyyy'), 1000000510);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (611, 'created', to_date('02-04-2000', 'dd-mm-yyyy'), to_date('20-06-2000', 'dd-mm-yyyy'), 1000000511);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (612, 'deliverd', to_date('02-01-2000', 'dd-mm-yyyy'), to_date('19-05-2000', 'dd-mm-yyyy'), 1000000512);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (613, 'created', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('17-11-2000', 'dd-mm-yyyy'), 1000000513);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (614, 'sent', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('12-07-2000', 'dd-mm-yyyy'), 1000000514);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (615, 'deliverd', to_date('25-01-2000', 'dd-mm-yyyy'), to_date('01-10-2000', 'dd-mm-yyyy'), 1000000515);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (616, 'deliverd', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('28-11-2000', 'dd-mm-yyyy'), 1000000516);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (617, 'created', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000000517);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (618, 'created', to_date('23-03-2000', 'dd-mm-yyyy'), to_date('07-05-2000', 'dd-mm-yyyy'), 1000000518);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (619, 'deliverd', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('03-11-2000', 'dd-mm-yyyy'), 1000000519);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (620, 'deliverd', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('25-06-2000', 'dd-mm-yyyy'), 1000000520);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (621, 'created', to_date('21-04-2000', 'dd-mm-yyyy'), to_date('19-11-2000', 'dd-mm-yyyy'), 1000000521);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (622, 'deliverd', to_date('10-01-2000', 'dd-mm-yyyy'), to_date('19-10-2000', 'dd-mm-yyyy'), 1000000522);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (623, 'deliverd', to_date('07-02-2000', 'dd-mm-yyyy'), to_date('23-09-2000', 'dd-mm-yyyy'), 1000000523);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (624, 'sent', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('03-10-2000', 'dd-mm-yyyy'), 1000000524);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (625, 'deliverd', to_date('11-01-2000', 'dd-mm-yyyy'), to_date('27-06-2000', 'dd-mm-yyyy'), 1000000525);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (626, 'created', to_date('29-02-2000', 'dd-mm-yyyy'), to_date('07-11-2000', 'dd-mm-yyyy'), 1000000526);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (627, 'created', to_date('14-02-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000527);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (628, 'sent', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('21-09-2000', 'dd-mm-yyyy'), 1000000528);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (629, 'sent', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('24-10-2000', 'dd-mm-yyyy'), 1000000529);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (630, 'created', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('14-10-2000', 'dd-mm-yyyy'), 1000000530);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (631, 'created', to_date('12-02-2000', 'dd-mm-yyyy'), to_date('04-07-2000', 'dd-mm-yyyy'), 1000000531);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (632, 'sent', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('29-11-2000', 'dd-mm-yyyy'), 1000000532);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (633, 'created', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('11-07-2000', 'dd-mm-yyyy'), 1000000533);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (634, 'sent', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('26-11-2000', 'dd-mm-yyyy'), 1000000534);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (635, 'sent', to_date('04-02-2000', 'dd-mm-yyyy'), to_date('22-08-2000', 'dd-mm-yyyy'), 1000000535);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (636, 'sent', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('28-08-2000', 'dd-mm-yyyy'), 1000000536);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (637, 'created', to_date('30-01-2000', 'dd-mm-yyyy'), to_date('13-09-2000', 'dd-mm-yyyy'), 1000000537);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (638, 'deliverd', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('03-05-2000', 'dd-mm-yyyy'), 1000000538);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (639, 'deliverd', to_date('18-01-2000', 'dd-mm-yyyy'), to_date('27-08-2000', 'dd-mm-yyyy'), 1000000539);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (640, 'sent', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('12-06-2000', 'dd-mm-yyyy'), 1000000540);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (641, 'sent', to_date('19-02-2000', 'dd-mm-yyyy'), to_date('12-07-2000', 'dd-mm-yyyy'), 1000000541);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (642, 'sent', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('12-05-2000', 'dd-mm-yyyy'), 1000000542);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (643, 'deliverd', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('13-05-2000', 'dd-mm-yyyy'), 1000000543);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (644, 'created', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('11-07-2000', 'dd-mm-yyyy'), 1000000544);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (645, 'deliverd', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('29-08-2000', 'dd-mm-yyyy'), 1000000545);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (646, 'deliverd', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('20-09-2000', 'dd-mm-yyyy'), 1000000546);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (647, 'deliverd', to_date('02-03-2000', 'dd-mm-yyyy'), to_date('02-08-2000', 'dd-mm-yyyy'), 1000000547);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (648, 'sent', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('29-08-2000', 'dd-mm-yyyy'), 1000000548);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (649, 'created', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('21-08-2000', 'dd-mm-yyyy'), 1000000549);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (650, 'deliverd', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('13-05-2000', 'dd-mm-yyyy'), 1000000550);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (651, 'deliverd', to_date('04-02-2000', 'dd-mm-yyyy'), to_date('17-08-2000', 'dd-mm-yyyy'), 1000000551);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (652, 'created', to_date('06-01-2000', 'dd-mm-yyyy'), to_date('29-07-2000', 'dd-mm-yyyy'), 1000000552);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (653, 'deliverd', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000553);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (654, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('06-09-2000', 'dd-mm-yyyy'), 1000000554);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (655, 'deliverd', to_date('13-02-2000', 'dd-mm-yyyy'), to_date('04-09-2000', 'dd-mm-yyyy'), 1000000555);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (656, 'deliverd', to_date('08-04-2000', 'dd-mm-yyyy'), to_date('20-09-2000', 'dd-mm-yyyy'), 1000000556);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (657, 'deliverd', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('19-10-2000', 'dd-mm-yyyy'), 1000000557);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (658, 'deliverd', to_date('13-01-2000', 'dd-mm-yyyy'), to_date('19-10-2000', 'dd-mm-yyyy'), 1000000558);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (659, 'sent', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('01-06-2000', 'dd-mm-yyyy'), 1000000559);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (660, 'sent', to_date('21-03-2000', 'dd-mm-yyyy'), to_date('21-09-2000', 'dd-mm-yyyy'), 1000000560);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (661, 'deliverd', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('05-10-2000', 'dd-mm-yyyy'), 1000000561);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (662, 'created', to_date('23-03-2000', 'dd-mm-yyyy'), to_date('15-07-2000', 'dd-mm-yyyy'), 1000000562);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (663, 'sent', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('26-07-2000', 'dd-mm-yyyy'), 1000000563);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (664, 'deliverd', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 1000000564);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (665, 'sent', to_date('21-03-2000', 'dd-mm-yyyy'), to_date('17-08-2000', 'dd-mm-yyyy'), 1000000565);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (666, 'deliverd', to_date('22-01-2000', 'dd-mm-yyyy'), to_date('24-11-2000', 'dd-mm-yyyy'), 1000000566);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (667, 'created', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('17-10-2000', 'dd-mm-yyyy'), 1000000567);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (668, 'sent', to_date('28-01-2000', 'dd-mm-yyyy'), to_date('31-07-2000', 'dd-mm-yyyy'), 1000000568);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (669, 'deliverd', to_date('25-03-2000', 'dd-mm-yyyy'), to_date('01-08-2000', 'dd-mm-yyyy'), 1000000569);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (670, 'deliverd', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('16-10-2000', 'dd-mm-yyyy'), 1000000570);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (671, 'deliverd', to_date('22-01-2000', 'dd-mm-yyyy'), to_date('11-06-2000', 'dd-mm-yyyy'), 1000000571);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (672, 'sent', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('23-11-2000', 'dd-mm-yyyy'), 1000000572);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (673, 'created', to_date('30-01-2000', 'dd-mm-yyyy'), to_date('04-09-2000', 'dd-mm-yyyy'), 1000000573);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (674, 'created', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('17-06-2000', 'dd-mm-yyyy'), 1000000574);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (675, 'created', to_date('03-01-2000', 'dd-mm-yyyy'), to_date('20-09-2000', 'dd-mm-yyyy'), 1000000575);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (676, 'created', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000000576);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (677, 'created', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('10-11-2000', 'dd-mm-yyyy'), 1000000577);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (678, 'created', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 1000000578);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (679, 'sent', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('02-05-2000', 'dd-mm-yyyy'), 1000000579);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (680, 'created', to_date('13-03-2000', 'dd-mm-yyyy'), to_date('26-07-2000', 'dd-mm-yyyy'), 1000000580);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (681, 'sent', to_date('23-02-2000', 'dd-mm-yyyy'), to_date('06-11-2000', 'dd-mm-yyyy'), 1000000581);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (682, 'sent', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('09-07-2000', 'dd-mm-yyyy'), 1000000582);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (683, 'deliverd', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('08-10-2000', 'dd-mm-yyyy'), 1000000583);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (684, 'sent', to_date('27-01-2000', 'dd-mm-yyyy'), to_date('29-08-2000', 'dd-mm-yyyy'), 1000000584);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (685, 'deliverd', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('13-07-2000', 'dd-mm-yyyy'), 1000000585);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (686, 'created', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('13-05-2000', 'dd-mm-yyyy'), 1000000586);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (687, 'deliverd', to_date('29-03-2000', 'dd-mm-yyyy'), to_date('20-07-2000', 'dd-mm-yyyy'), 1000000587);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (688, 'sent', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('02-12-2000', 'dd-mm-yyyy'), 1000000588);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (689, 'created', to_date('12-03-2000', 'dd-mm-yyyy'), to_date('25-10-2000', 'dd-mm-yyyy'), 1000000589);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (690, 'created', to_date('01-04-2000', 'dd-mm-yyyy'), to_date('08-05-2000', 'dd-mm-yyyy'), 1000000590);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (691, 'created', to_date('19-04-2000', 'dd-mm-yyyy'), to_date('28-07-2000', 'dd-mm-yyyy'), 1000000591);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (692, 'sent', to_date('03-01-2000', 'dd-mm-yyyy'), to_date('18-06-2000', 'dd-mm-yyyy'), 1000000592);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (693, 'deliverd', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('12-06-2000', 'dd-mm-yyyy'), 1000000593);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (694, 'deliverd', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('16-08-2000', 'dd-mm-yyyy'), 1000000594);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (695, 'created', to_date('11-02-2000', 'dd-mm-yyyy'), to_date('28-09-2000', 'dd-mm-yyyy'), 1000000595);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (696, 'created', to_date('24-01-2000', 'dd-mm-yyyy'), to_date('28-09-2000', 'dd-mm-yyyy'), 1000000596);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (697, 'sent', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('26-08-2000', 'dd-mm-yyyy'), 1000000597);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (698, 'deliverd', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('29-08-2000', 'dd-mm-yyyy'), 1000000598);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (699, 'sent', to_date('05-02-2000', 'dd-mm-yyyy'), to_date('15-06-2000', 'dd-mm-yyyy'), 1000000599);
commit;
prompt 600 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (700, 'created', to_date('13-01-2000', 'dd-mm-yyyy'), to_date('09-05-2000', 'dd-mm-yyyy'), 1000000600);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (701, 'created', to_date('11-01-2000', 'dd-mm-yyyy'), to_date('21-07-2000', 'dd-mm-yyyy'), 1000000601);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (702, 'created', to_date('18-03-2000', 'dd-mm-yyyy'), to_date('20-08-2000', 'dd-mm-yyyy'), 1000000602);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (703, 'sent', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('23-09-2000', 'dd-mm-yyyy'), 1000000603);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (704, 'created', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('20-08-2000', 'dd-mm-yyyy'), 1000000604);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (705, 'created', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000000605);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (706, 'deliverd', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('05-09-2000', 'dd-mm-yyyy'), 1000000606);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (707, 'created', to_date('04-03-2000', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 1000000607);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (708, 'deliverd', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('21-11-2000', 'dd-mm-yyyy'), 1000000608);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (709, 'deliverd', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('03-05-2000', 'dd-mm-yyyy'), 1000000609);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (710, 'sent', to_date('30-04-2000', 'dd-mm-yyyy'), to_date('25-08-2000', 'dd-mm-yyyy'), 1000000610);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (711, 'created', to_date('12-03-2000', 'dd-mm-yyyy'), to_date('25-07-2000', 'dd-mm-yyyy'), 1000000611);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (712, 'deliverd', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('21-06-2000', 'dd-mm-yyyy'), 1000000612);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (713, 'deliverd', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('25-07-2000', 'dd-mm-yyyy'), 1000000613);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (714, 'created', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('26-10-2000', 'dd-mm-yyyy'), 1000000614);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (715, 'created', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('10-09-2000', 'dd-mm-yyyy'), 1000000615);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (716, 'sent', to_date('01-01-2000', 'dd-mm-yyyy'), to_date('16-06-2000', 'dd-mm-yyyy'), 1000000616);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (717, 'deliverd', to_date('13-01-2000', 'dd-mm-yyyy'), to_date('19-09-2000', 'dd-mm-yyyy'), 1000000617);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (718, 'sent', to_date('10-01-2000', 'dd-mm-yyyy'), to_date('21-11-2000', 'dd-mm-yyyy'), 1000000618);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (719, 'created', to_date('23-04-2000', 'dd-mm-yyyy'), to_date('03-07-2000', 'dd-mm-yyyy'), 1000000619);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (720, 'sent', to_date('21-03-2000', 'dd-mm-yyyy'), to_date('22-11-2000', 'dd-mm-yyyy'), 1000000620);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (721, 'sent', to_date('27-01-2000', 'dd-mm-yyyy'), to_date('29-08-2000', 'dd-mm-yyyy'), 1000000621);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (722, 'sent', to_date('31-03-2000', 'dd-mm-yyyy'), to_date('12-06-2000', 'dd-mm-yyyy'), 1000000622);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (723, 'created', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('05-06-2000', 'dd-mm-yyyy'), 1000000623);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (724, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('12-10-2000', 'dd-mm-yyyy'), 1000000624);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (725, 'sent', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('22-07-2000', 'dd-mm-yyyy'), 1000000625);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (726, 'deliverd', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('14-06-2000', 'dd-mm-yyyy'), 1000000626);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (727, 'created', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('07-11-2000', 'dd-mm-yyyy'), 1000000627);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (728, 'sent', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('02-11-2000', 'dd-mm-yyyy'), 1000000628);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (729, 'created', to_date('29-01-2000', 'dd-mm-yyyy'), to_date('18-10-2000', 'dd-mm-yyyy'), 1000000629);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (730, 'sent', to_date('19-02-2000', 'dd-mm-yyyy'), to_date('13-08-2000', 'dd-mm-yyyy'), 1000000630);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (731, 'created', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('04-11-2000', 'dd-mm-yyyy'), 1000000631);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (732, 'created', to_date('12-03-2000', 'dd-mm-yyyy'), to_date('21-06-2000', 'dd-mm-yyyy'), 1000000632);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (733, 'created', to_date('30-03-2000', 'dd-mm-yyyy'), to_date('13-10-2000', 'dd-mm-yyyy'), 1000000633);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (734, 'sent', to_date('17-04-2000', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 1000000634);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (735, 'created', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('17-06-2000', 'dd-mm-yyyy'), 1000000635);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (736, 'sent', to_date('14-02-2000', 'dd-mm-yyyy'), to_date('12-05-2000', 'dd-mm-yyyy'), 1000000636);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (737, 'sent', to_date('16-03-2000', 'dd-mm-yyyy'), to_date('18-09-2000', 'dd-mm-yyyy'), 1000000637);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (738, 'sent', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('12-09-2000', 'dd-mm-yyyy'), 1000000638);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (739, 'sent', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('19-05-2000', 'dd-mm-yyyy'), 1000000639);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (740, 'deliverd', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('17-08-2000', 'dd-mm-yyyy'), 1000000640);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (741, 'deliverd', to_date('16-03-2000', 'dd-mm-yyyy'), to_date('07-09-2000', 'dd-mm-yyyy'), 1000000641);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (742, 'created', to_date('08-03-2000', 'dd-mm-yyyy'), to_date('27-09-2000', 'dd-mm-yyyy'), 1000000642);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (743, 'sent', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('28-08-2000', 'dd-mm-yyyy'), 1000000643);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (744, 'deliverd', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('08-09-2000', 'dd-mm-yyyy'), 1000000644);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (745, 'created', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('08-05-2000', 'dd-mm-yyyy'), 1000000645);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (746, 'created', to_date('24-02-2000', 'dd-mm-yyyy'), to_date('31-07-2000', 'dd-mm-yyyy'), 1000000646);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (747, 'created', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('26-08-2000', 'dd-mm-yyyy'), 1000000647);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (748, 'deliverd', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('05-12-2000', 'dd-mm-yyyy'), 1000000648);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (749, 'deliverd', to_date('29-04-2000', 'dd-mm-yyyy'), to_date('21-07-2000', 'dd-mm-yyyy'), 1000000649);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (750, 'deliverd', to_date('27-04-2000', 'dd-mm-yyyy'), to_date('05-12-2000', 'dd-mm-yyyy'), 1000000650);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (751, 'sent', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('09-06-2000', 'dd-mm-yyyy'), 1000000651);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (752, 'deliverd', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('03-05-2000', 'dd-mm-yyyy'), 1000000652);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (753, 'deliverd', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('31-07-2000', 'dd-mm-yyyy'), 1000000653);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (754, 'created', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('05-06-2000', 'dd-mm-yyyy'), 1000000654);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (755, 'sent', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('23-06-2000', 'dd-mm-yyyy'), 1000000655);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (756, 'sent', to_date('18-01-2000', 'dd-mm-yyyy'), to_date('14-05-2000', 'dd-mm-yyyy'), 1000000656);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (757, 'created', to_date('02-03-2000', 'dd-mm-yyyy'), to_date('28-10-2000', 'dd-mm-yyyy'), 1000000657);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (758, 'created', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('09-06-2000', 'dd-mm-yyyy'), 1000000658);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (759, 'deliverd', to_date('01-01-2000', 'dd-mm-yyyy'), to_date('08-10-2000', 'dd-mm-yyyy'), 1000000659);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (760, 'created', to_date('13-01-2000', 'dd-mm-yyyy'), to_date('24-10-2000', 'dd-mm-yyyy'), 1000000660);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (761, 'deliverd', to_date('11-02-2000', 'dd-mm-yyyy'), to_date('15-06-2000', 'dd-mm-yyyy'), 1000000661);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (762, 'created', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('06-07-2000', 'dd-mm-yyyy'), 1000000662);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (763, 'created', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('03-12-2000', 'dd-mm-yyyy'), 1000000663);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (764, 'deliverd', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('28-10-2000', 'dd-mm-yyyy'), 1000000664);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (765, 'created', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('25-10-2000', 'dd-mm-yyyy'), 1000000665);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (766, 'deliverd', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('15-06-2000', 'dd-mm-yyyy'), 1000000666);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (767, 'sent', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('17-10-2000', 'dd-mm-yyyy'), 1000000667);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (768, 'sent', to_date('27-04-2000', 'dd-mm-yyyy'), to_date('08-12-2000', 'dd-mm-yyyy'), 1000000668);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (769, 'sent', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('18-10-2000', 'dd-mm-yyyy'), 1000000669);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (770, 'deliverd', to_date('17-04-2000', 'dd-mm-yyyy'), to_date('10-06-2000', 'dd-mm-yyyy'), 1000000670);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (771, 'sent', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('11-05-2000', 'dd-mm-yyyy'), 1000000671);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (772, 'deliverd', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('27-06-2000', 'dd-mm-yyyy'), 1000000672);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (773, 'created', to_date('30-03-2000', 'dd-mm-yyyy'), to_date('14-09-2000', 'dd-mm-yyyy'), 1000000673);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (774, 'deliverd', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('30-07-2000', 'dd-mm-yyyy'), 1000000674);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (775, 'created', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('01-09-2000', 'dd-mm-yyyy'), 1000000675);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (776, 'created', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('09-10-2000', 'dd-mm-yyyy'), 1000000676);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (777, 'created', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('03-08-2000', 'dd-mm-yyyy'), 1000000677);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (778, 'deliverd', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('24-11-2000', 'dd-mm-yyyy'), 1000000678);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (779, 'created', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('22-06-2000', 'dd-mm-yyyy'), 1000000679);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (780, 'created', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('30-07-2000', 'dd-mm-yyyy'), 1000000680);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (781, 'deliverd', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('21-08-2000', 'dd-mm-yyyy'), 1000000681);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (782, 'created', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('15-06-2000', 'dd-mm-yyyy'), 1000000682);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (783, 'sent', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('08-08-2000', 'dd-mm-yyyy'), 1000000683);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (784, 'deliverd', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('10-05-2000', 'dd-mm-yyyy'), 1000000684);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (785, 'deliverd', to_date('29-04-2000', 'dd-mm-yyyy'), to_date('03-05-2000', 'dd-mm-yyyy'), 1000000685);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (786, 'deliverd', to_date('27-01-2000', 'dd-mm-yyyy'), to_date('28-06-2000', 'dd-mm-yyyy'), 1000000686);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (787, 'sent', to_date('22-03-2000', 'dd-mm-yyyy'), to_date('26-06-2000', 'dd-mm-yyyy'), 1000000687);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (788, 'created', to_date('21-04-2000', 'dd-mm-yyyy'), to_date('11-09-2000', 'dd-mm-yyyy'), 1000000688);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (789, 'sent', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('26-08-2000', 'dd-mm-yyyy'), 1000000689);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (790, 'created', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('14-10-2000', 'dd-mm-yyyy'), 1000000690);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (791, 'deliverd', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('31-05-2000', 'dd-mm-yyyy'), 1000000691);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (792, 'deliverd', to_date('21-03-2000', 'dd-mm-yyyy'), to_date('11-08-2000', 'dd-mm-yyyy'), 1000000692);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (793, 'created', to_date('29-04-2000', 'dd-mm-yyyy'), to_date('08-09-2000', 'dd-mm-yyyy'), 1000000693);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (794, 'sent', to_date('08-04-2000', 'dd-mm-yyyy'), to_date('23-08-2000', 'dd-mm-yyyy'), 1000000694);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (795, 'created', to_date('03-02-2000', 'dd-mm-yyyy'), to_date('23-06-2000', 'dd-mm-yyyy'), 1000000695);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (796, 'deliverd', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('09-09-2000', 'dd-mm-yyyy'), 1000000696);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (797, 'created', to_date('15-01-2000', 'dd-mm-yyyy'), to_date('09-10-2000', 'dd-mm-yyyy'), 1000000697);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (798, 'created', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('13-09-2000', 'dd-mm-yyyy'), 1000000698);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (799, 'created', to_date('16-03-2000', 'dd-mm-yyyy'), to_date('09-10-2000', 'dd-mm-yyyy'), 1000000699);
commit;
prompt 700 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (800, 'deliverd', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('04-12-2000', 'dd-mm-yyyy'), 1000000700);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (801, 'deliverd', to_date('27-03-2000', 'dd-mm-yyyy'), to_date('22-08-2000', 'dd-mm-yyyy'), 1000000701);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (802, 'deliverd', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('07-09-2000', 'dd-mm-yyyy'), 1000000702);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (803, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('29-11-2000', 'dd-mm-yyyy'), 1000000703);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (804, 'deliverd', to_date('16-01-2000', 'dd-mm-yyyy'), to_date('29-05-2000', 'dd-mm-yyyy'), 1000000704);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (805, 'sent', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('13-09-2000', 'dd-mm-yyyy'), 1000000705);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (806, 'created', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('17-09-2000', 'dd-mm-yyyy'), 1000000706);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (807, 'sent', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('08-09-2000', 'dd-mm-yyyy'), 1000000707);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (808, 'sent', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('02-10-2000', 'dd-mm-yyyy'), 1000000708);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (809, 'created', to_date('16-01-2000', 'dd-mm-yyyy'), to_date('11-11-2000', 'dd-mm-yyyy'), 1000000709);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (810, 'deliverd', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('05-05-2000', 'dd-mm-yyyy'), 1000000710);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (811, 'deliverd', to_date('28-02-2000', 'dd-mm-yyyy'), to_date('24-10-2000', 'dd-mm-yyyy'), 1000000711);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (812, 'sent', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('23-05-2000', 'dd-mm-yyyy'), 1000000712);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (813, 'sent', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('05-12-2000', 'dd-mm-yyyy'), 1000000713);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (814, 'sent', to_date('02-04-2000', 'dd-mm-yyyy'), to_date('10-10-2000', 'dd-mm-yyyy'), 1000000714);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (815, 'created', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('19-05-2000', 'dd-mm-yyyy'), 1000000715);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (816, 'sent', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('11-05-2000', 'dd-mm-yyyy'), 1000000716);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (817, 'created', to_date('14-02-2000', 'dd-mm-yyyy'), to_date('05-06-2000', 'dd-mm-yyyy'), 1000000717);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (818, 'deliverd', to_date('21-03-2000', 'dd-mm-yyyy'), to_date('15-06-2000', 'dd-mm-yyyy'), 1000000718);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (819, 'created', to_date('18-01-2000', 'dd-mm-yyyy'), to_date('25-09-2000', 'dd-mm-yyyy'), 1000000719);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (820, 'deliverd', to_date('13-02-2000', 'dd-mm-yyyy'), to_date('25-06-2000', 'dd-mm-yyyy'), 1000000720);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (821, 'deliverd', to_date('30-04-2000', 'dd-mm-yyyy'), to_date('11-12-2000', 'dd-mm-yyyy'), 1000000721);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (822, 'deliverd', to_date('07-02-2000', 'dd-mm-yyyy'), to_date('06-11-2000', 'dd-mm-yyyy'), 1000000722);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (823, 'deliverd', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('13-05-2000', 'dd-mm-yyyy'), 1000000723);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (824, 'sent', to_date('12-04-2000', 'dd-mm-yyyy'), to_date('25-08-2000', 'dd-mm-yyyy'), 1000000724);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (825, 'deliverd', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('11-07-2000', 'dd-mm-yyyy'), 1000000725);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (826, 'sent', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('15-08-2000', 'dd-mm-yyyy'), 1000000726);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (827, 'sent', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('19-09-2000', 'dd-mm-yyyy'), 1000000727);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (828, 'created', to_date('15-01-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000728);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (829, 'created', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('28-09-2000', 'dd-mm-yyyy'), 1000000729);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (830, 'created', to_date('05-02-2000', 'dd-mm-yyyy'), to_date('19-11-2000', 'dd-mm-yyyy'), 1000000730);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (831, 'sent', to_date('12-02-2000', 'dd-mm-yyyy'), to_date('31-05-2000', 'dd-mm-yyyy'), 1000000731);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (832, 'created', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('23-11-2000', 'dd-mm-yyyy'), 1000000732);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (833, 'sent', to_date('12-02-2000', 'dd-mm-yyyy'), to_date('07-05-2000', 'dd-mm-yyyy'), 1000000733);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (834, 'created', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('06-08-2000', 'dd-mm-yyyy'), 1000000734);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (835, 'deliverd', to_date('03-01-2000', 'dd-mm-yyyy'), to_date('28-07-2000', 'dd-mm-yyyy'), 1000000735);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (836, 'created', to_date('14-04-2000', 'dd-mm-yyyy'), to_date('23-08-2000', 'dd-mm-yyyy'), 1000000736);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (837, 'sent', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('24-08-2000', 'dd-mm-yyyy'), 1000000737);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (838, 'created', to_date('20-03-2000', 'dd-mm-yyyy'), to_date('08-11-2000', 'dd-mm-yyyy'), 1000000738);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (839, 'sent', to_date('15-01-2000', 'dd-mm-yyyy'), to_date('12-11-2000', 'dd-mm-yyyy'), 1000000739);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (840, 'deliverd', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('06-07-2000', 'dd-mm-yyyy'), 1000000740);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (841, 'sent', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('28-07-2000', 'dd-mm-yyyy'), 1000000741);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (842, 'deliverd', to_date('10-01-2000', 'dd-mm-yyyy'), to_date('28-06-2000', 'dd-mm-yyyy'), 1000000742);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (843, 'deliverd', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('03-09-2000', 'dd-mm-yyyy'), 1000000743);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (844, 'created', to_date('14-01-2000', 'dd-mm-yyyy'), to_date('27-09-2000', 'dd-mm-yyyy'), 1000000744);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (845, 'deliverd', to_date('03-03-2000', 'dd-mm-yyyy'), to_date('24-09-2000', 'dd-mm-yyyy'), 1000000745);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (846, 'sent', to_date('05-02-2000', 'dd-mm-yyyy'), to_date('24-10-2000', 'dd-mm-yyyy'), 1000000746);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (847, 'created', to_date('31-03-2000', 'dd-mm-yyyy'), to_date('24-09-2000', 'dd-mm-yyyy'), 1000000747);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (848, 'sent', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('17-07-2000', 'dd-mm-yyyy'), 1000000748);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (849, 'deliverd', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('11-11-2000', 'dd-mm-yyyy'), 1000000749);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (850, 'deliverd', to_date('12-02-2000', 'dd-mm-yyyy'), to_date('20-05-2000', 'dd-mm-yyyy'), 1000000750);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (851, 'sent', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('11-10-2000', 'dd-mm-yyyy'), 1000000751);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (852, 'sent', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000752);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (853, 'sent', to_date('13-03-2000', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 1000000753);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (854, 'sent', to_date('14-01-2000', 'dd-mm-yyyy'), to_date('20-05-2000', 'dd-mm-yyyy'), 1000000754);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (855, 'deliverd', to_date('03-03-2000', 'dd-mm-yyyy'), to_date('22-08-2000', 'dd-mm-yyyy'), 1000000755);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (856, 'sent', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('01-08-2000', 'dd-mm-yyyy'), 1000000756);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (857, 'created', to_date('18-03-2000', 'dd-mm-yyyy'), to_date('29-08-2000', 'dd-mm-yyyy'), 1000000757);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (858, 'sent', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('10-08-2000', 'dd-mm-yyyy'), 1000000758);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (859, 'deliverd', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('06-08-2000', 'dd-mm-yyyy'), 1000000759);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (860, 'created', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('19-06-2000', 'dd-mm-yyyy'), 1000000760);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (861, 'deliverd', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('18-10-2000', 'dd-mm-yyyy'), 1000000761);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (862, 'deliverd', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('28-09-2000', 'dd-mm-yyyy'), 1000000762);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (863, 'deliverd', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('16-09-2000', 'dd-mm-yyyy'), 1000000763);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (864, 'deliverd', to_date('01-04-2000', 'dd-mm-yyyy'), to_date('11-05-2000', 'dd-mm-yyyy'), 1000000764);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (865, 'deliverd', to_date('03-01-2000', 'dd-mm-yyyy'), to_date('03-10-2000', 'dd-mm-yyyy'), 1000000765);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (866, 'created', to_date('16-03-2000', 'dd-mm-yyyy'), to_date('29-10-2000', 'dd-mm-yyyy'), 1000000766);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (867, 'created', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('05-11-2000', 'dd-mm-yyyy'), 1000000767);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (868, 'sent', to_date('04-02-2000', 'dd-mm-yyyy'), to_date('16-07-2000', 'dd-mm-yyyy'), 1000000768);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (869, 'deliverd', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('16-10-2000', 'dd-mm-yyyy'), 1000000769);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (870, 'sent', to_date('01-04-2000', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 1000000770);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (871, 'deliverd', to_date('02-01-2000', 'dd-mm-yyyy'), to_date('10-10-2000', 'dd-mm-yyyy'), 1000000771);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (872, 'created', to_date('08-01-2000', 'dd-mm-yyyy'), to_date('27-05-2000', 'dd-mm-yyyy'), 1000000772);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (873, 'sent', to_date('28-02-2000', 'dd-mm-yyyy'), to_date('11-10-2000', 'dd-mm-yyyy'), 1000000773);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (874, 'created', to_date('24-01-2000', 'dd-mm-yyyy'), to_date('23-05-2000', 'dd-mm-yyyy'), 1000000774);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (875, 'deliverd', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('30-06-2000', 'dd-mm-yyyy'), 1000000775);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (876, 'sent', to_date('13-02-2000', 'dd-mm-yyyy'), to_date('11-10-2000', 'dd-mm-yyyy'), 1000000776);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (877, 'sent', to_date('08-04-2000', 'dd-mm-yyyy'), to_date('25-07-2000', 'dd-mm-yyyy'), 1000000777);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (878, 'created', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('23-10-2000', 'dd-mm-yyyy'), 1000000778);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (879, 'sent', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('08-07-2000', 'dd-mm-yyyy'), 1000000779);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (880, 'deliverd', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('23-08-2000', 'dd-mm-yyyy'), 1000000780);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (881, 'sent', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('17-07-2000', 'dd-mm-yyyy'), 1000000781);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (882, 'created', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('29-07-2000', 'dd-mm-yyyy'), 1000000782);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (883, 'created', to_date('20-01-2000', 'dd-mm-yyyy'), to_date('08-09-2000', 'dd-mm-yyyy'), 1000000783);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (884, 'created', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('26-05-2000', 'dd-mm-yyyy'), 1000000784);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (885, 'created', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('30-07-2000', 'dd-mm-yyyy'), 1000000785);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (886, 'created', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('08-10-2000', 'dd-mm-yyyy'), 1000000786);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (887, 'sent', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('09-09-2000', 'dd-mm-yyyy'), 1000000787);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (888, 'sent', to_date('03-03-2000', 'dd-mm-yyyy'), to_date('16-07-2000', 'dd-mm-yyyy'), 1000000788);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (889, 'deliverd', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('15-05-2000', 'dd-mm-yyyy'), 1000000789);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (890, 'created', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('09-09-2000', 'dd-mm-yyyy'), 1000000790);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (891, 'sent', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('03-07-2000', 'dd-mm-yyyy'), 1000000791);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (892, 'deliverd', to_date('20-01-2000', 'dd-mm-yyyy'), to_date('30-10-2000', 'dd-mm-yyyy'), 1000000792);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (893, 'deliverd', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('08-05-2000', 'dd-mm-yyyy'), 1000000793);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (894, 'created', to_date('27-04-2000', 'dd-mm-yyyy'), to_date('17-09-2000', 'dd-mm-yyyy'), 1000000794);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (895, 'sent', to_date('05-02-2000', 'dd-mm-yyyy'), to_date('16-07-2000', 'dd-mm-yyyy'), 1000000795);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (896, 'created', to_date('08-01-2000', 'dd-mm-yyyy'), to_date('28-10-2000', 'dd-mm-yyyy'), 1000000796);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (897, 'deliverd', to_date('04-03-2000', 'dd-mm-yyyy'), to_date('15-05-2000', 'dd-mm-yyyy'), 1000000797);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (898, 'deliverd', to_date('31-03-2000', 'dd-mm-yyyy'), to_date('29-05-2000', 'dd-mm-yyyy'), 1000000798);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (899, 'sent', to_date('06-01-2000', 'dd-mm-yyyy'), to_date('01-09-2000', 'dd-mm-yyyy'), 1000000799);
commit;
prompt 800 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (900, 'created', to_date('24-02-2000', 'dd-mm-yyyy'), to_date('15-05-2000', 'dd-mm-yyyy'), 1000000800);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (901, 'created', to_date('29-03-2000', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 1000000801);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (902, 'deliverd', to_date('04-03-2000', 'dd-mm-yyyy'), to_date('29-09-2000', 'dd-mm-yyyy'), 1000000802);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (903, 'deliverd', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('29-08-2000', 'dd-mm-yyyy'), 1000000803);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (904, 'deliverd', to_date('28-02-2000', 'dd-mm-yyyy'), to_date('20-08-2000', 'dd-mm-yyyy'), 1000000804);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (905, 'created', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('09-07-2000', 'dd-mm-yyyy'), 1000000805);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (906, 'sent', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('16-11-2000', 'dd-mm-yyyy'), 1000000806);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (907, 'sent', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('03-12-2000', 'dd-mm-yyyy'), 1000000807);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (908, 'created', to_date('30-04-2000', 'dd-mm-yyyy'), to_date('23-11-2000', 'dd-mm-yyyy'), 1000000808);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (909, 'deliverd', to_date('09-01-2000', 'dd-mm-yyyy'), to_date('26-11-2000', 'dd-mm-yyyy'), 1000000809);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (910, 'sent', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('26-06-2000', 'dd-mm-yyyy'), 1000000810);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (911, 'sent', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('18-10-2000', 'dd-mm-yyyy'), 1000000811);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (912, 'deliverd', to_date('23-04-2000', 'dd-mm-yyyy'), to_date('26-07-2000', 'dd-mm-yyyy'), 1000000812);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (913, 'created', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('05-05-2000', 'dd-mm-yyyy'), 1000000813);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (914, 'sent', to_date('25-01-2000', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 1000000814);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (915, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('01-06-2000', 'dd-mm-yyyy'), 1000000815);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (916, 'created', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('10-10-2000', 'dd-mm-yyyy'), 1000000816);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (917, 'created', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('01-09-2000', 'dd-mm-yyyy'), 1000000817);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (918, 'sent', to_date('16-03-2000', 'dd-mm-yyyy'), to_date('14-09-2000', 'dd-mm-yyyy'), 1000000818);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (919, 'created', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('14-08-2000', 'dd-mm-yyyy'), 1000000819);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (920, 'created', to_date('12-03-2000', 'dd-mm-yyyy'), to_date('04-07-2000', 'dd-mm-yyyy'), 1000000820);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (921, 'sent', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('09-08-2000', 'dd-mm-yyyy'), 1000000821);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (922, 'sent', to_date('09-02-2000', 'dd-mm-yyyy'), to_date('24-11-2000', 'dd-mm-yyyy'), 1000000822);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (923, 'deliverd', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('30-05-2000', 'dd-mm-yyyy'), 1000000823);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (924, 'deliverd', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('26-05-2000', 'dd-mm-yyyy'), 1000000824);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (925, 'deliverd', to_date('10-01-2000', 'dd-mm-yyyy'), to_date('25-08-2000', 'dd-mm-yyyy'), 1000000825);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (926, 'created', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('16-09-2000', 'dd-mm-yyyy'), 1000000826);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (927, 'deliverd', to_date('01-02-2000', 'dd-mm-yyyy'), to_date('16-05-2000', 'dd-mm-yyyy'), 1000000827);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (928, 'deliverd', to_date('25-01-2000', 'dd-mm-yyyy'), to_date('23-11-2000', 'dd-mm-yyyy'), 1000000828);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (929, 'created', to_date('03-02-2000', 'dd-mm-yyyy'), to_date('23-11-2000', 'dd-mm-yyyy'), 1000000829);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (930, 'created', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('18-06-2000', 'dd-mm-yyyy'), 1000000830);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (931, 'sent', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('18-09-2000', 'dd-mm-yyyy'), 1000000831);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (932, 'created', to_date('16-01-2000', 'dd-mm-yyyy'), to_date('22-09-2000', 'dd-mm-yyyy'), 1000000832);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (933, 'deliverd', to_date('15-01-2000', 'dd-mm-yyyy'), to_date('19-05-2000', 'dd-mm-yyyy'), 1000000833);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (934, 'deliverd', to_date('02-01-2000', 'dd-mm-yyyy'), to_date('27-08-2000', 'dd-mm-yyyy'), 1000000834);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (935, 'sent', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('22-10-2000', 'dd-mm-yyyy'), 1000000835);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (936, 'sent', to_date('13-01-2000', 'dd-mm-yyyy'), to_date('28-08-2000', 'dd-mm-yyyy'), 1000000836);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (937, 'deliverd', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 1000000837);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (938, 'deliverd', to_date('23-03-2000', 'dd-mm-yyyy'), to_date('08-11-2000', 'dd-mm-yyyy'), 1000000838);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (939, 'deliverd', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('02-05-2000', 'dd-mm-yyyy'), 1000000839);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (940, 'deliverd', to_date('04-03-2000', 'dd-mm-yyyy'), to_date('19-11-2000', 'dd-mm-yyyy'), 1000000840);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (941, 'created', to_date('19-04-2000', 'dd-mm-yyyy'), to_date('12-05-2000', 'dd-mm-yyyy'), 1000000841);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (942, 'sent', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('10-11-2000', 'dd-mm-yyyy'), 1000000842);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (943, 'created', to_date('19-02-2000', 'dd-mm-yyyy'), to_date('11-07-2000', 'dd-mm-yyyy'), 1000000843);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (944, 'deliverd', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('19-05-2000', 'dd-mm-yyyy'), 1000000844);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (945, 'sent', to_date('16-01-2000', 'dd-mm-yyyy'), to_date('24-08-2000', 'dd-mm-yyyy'), 1000000845);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (946, 'deliverd', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('21-06-2000', 'dd-mm-yyyy'), 1000000846);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (947, 'created', to_date('19-02-2000', 'dd-mm-yyyy'), to_date('11-06-2000', 'dd-mm-yyyy'), 1000000847);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (948, 'created', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('23-06-2000', 'dd-mm-yyyy'), 1000000848);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (949, 'deliverd', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('17-11-2000', 'dd-mm-yyyy'), 1000000849);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (950, 'created', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('05-07-2000', 'dd-mm-yyyy'), 1000000850);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (951, 'created', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('04-08-2000', 'dd-mm-yyyy'), 1000000851);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (952, 'created', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('07-12-2000', 'dd-mm-yyyy'), 1000000852);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (953, 'sent', to_date('21-03-2000', 'dd-mm-yyyy'), to_date('21-11-2000', 'dd-mm-yyyy'), 1000000853);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (954, 'sent', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('28-07-2000', 'dd-mm-yyyy'), 1000000854);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (955, 'created', to_date('08-01-2000', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 1000000855);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (956, 'deliverd', to_date('13-02-2000', 'dd-mm-yyyy'), to_date('09-05-2000', 'dd-mm-yyyy'), 1000000856);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (957, 'created', to_date('29-03-2000', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 1000000857);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (958, 'deliverd', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('22-09-2000', 'dd-mm-yyyy'), 1000000858);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (959, 'deliverd', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('03-06-2000', 'dd-mm-yyyy'), 1000000859);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (960, 'created', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('27-07-2000', 'dd-mm-yyyy'), 1000000860);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (961, 'sent', to_date('14-02-2000', 'dd-mm-yyyy'), to_date('20-06-2000', 'dd-mm-yyyy'), 1000000861);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (962, 'created', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('06-07-2000', 'dd-mm-yyyy'), 1000000862);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (963, 'deliverd', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('01-05-2000', 'dd-mm-yyyy'), 1000000863);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (964, 'created', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('04-09-2000', 'dd-mm-yyyy'), 1000000864);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (965, 'deliverd', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('28-06-2000', 'dd-mm-yyyy'), 1000000865);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (966, 'deliverd', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('25-11-2000', 'dd-mm-yyyy'), 1000000866);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (967, 'sent', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('11-12-2000', 'dd-mm-yyyy'), 1000000867);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (968, 'sent', to_date('14-04-2000', 'dd-mm-yyyy'), to_date('24-05-2000', 'dd-mm-yyyy'), 1000000868);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (969, 'created', to_date('04-03-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000869);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (970, 'deliverd', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('28-05-2000', 'dd-mm-yyyy'), 1000000870);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (971, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('23-05-2000', 'dd-mm-yyyy'), 1000000871);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (972, 'created', to_date('20-03-2000', 'dd-mm-yyyy'), to_date('17-07-2000', 'dd-mm-yyyy'), 1000000872);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (973, 'sent', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('05-08-2000', 'dd-mm-yyyy'), 1000000873);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (974, 'deliverd', to_date('04-03-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000874);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (975, 'created', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('11-11-2000', 'dd-mm-yyyy'), 1000000875);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (976, 'created', to_date('29-04-2000', 'dd-mm-yyyy'), to_date('07-12-2000', 'dd-mm-yyyy'), 1000000876);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (977, 'sent', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('24-09-2000', 'dd-mm-yyyy'), 1000000877);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (978, 'deliverd', to_date('13-01-2000', 'dd-mm-yyyy'), to_date('30-09-2000', 'dd-mm-yyyy'), 1000000878);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (979, 'sent', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('07-07-2000', 'dd-mm-yyyy'), 1000000879);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (980, 'deliverd', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('03-06-2000', 'dd-mm-yyyy'), 1000000880);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (981, 'created', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('09-06-2000', 'dd-mm-yyyy'), 1000000881);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (982, 'deliverd', to_date('29-04-2000', 'dd-mm-yyyy'), to_date('26-11-2000', 'dd-mm-yyyy'), 1000000882);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (983, 'deliverd', to_date('13-03-2000', 'dd-mm-yyyy'), to_date('24-10-2000', 'dd-mm-yyyy'), 1000000883);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (984, 'sent', to_date('08-04-2000', 'dd-mm-yyyy'), to_date('26-11-2000', 'dd-mm-yyyy'), 1000000884);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (985, 'created', to_date('02-04-2000', 'dd-mm-yyyy'), to_date('28-07-2000', 'dd-mm-yyyy'), 1000000885);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (986, 'sent', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('31-10-2000', 'dd-mm-yyyy'), 1000000886);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (987, 'sent', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('05-07-2000', 'dd-mm-yyyy'), 1000000887);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (988, 'deliverd', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('24-08-2000', 'dd-mm-yyyy'), 1000000888);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (989, 'deliverd', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('19-11-2000', 'dd-mm-yyyy'), 1000000889);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (990, 'sent', to_date('29-01-2000', 'dd-mm-yyyy'), to_date('07-11-2000', 'dd-mm-yyyy'), 1000000890);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (991, 'created', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('20-08-2000', 'dd-mm-yyyy'), 1000000891);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (992, 'sent', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('14-08-2000', 'dd-mm-yyyy'), 1000000892);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (993, 'deliverd', to_date('29-02-2000', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 1000000893);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (994, 'deliverd', to_date('09-02-2000', 'dd-mm-yyyy'), to_date('05-12-2000', 'dd-mm-yyyy'), 1000000894);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (995, 'created', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('05-08-2000', 'dd-mm-yyyy'), 1000000895);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (996, 'sent', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('30-10-2000', 'dd-mm-yyyy'), 1000000896);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (997, 'created', to_date('21-04-2000', 'dd-mm-yyyy'), to_date('22-11-2000', 'dd-mm-yyyy'), 1000000897);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (998, 'created', to_date('08-01-2000', 'dd-mm-yyyy'), to_date('12-09-2000', 'dd-mm-yyyy'), 1000000898);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (999, 'deliverd', to_date('27-01-2000', 'dd-mm-yyyy'), to_date('01-11-2000', 'dd-mm-yyyy'), 1000000899);
commit;
prompt 900 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1000, 'deliverd', to_date('22-03-2000', 'dd-mm-yyyy'), to_date('06-11-2000', 'dd-mm-yyyy'), 1000000900);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1001, 'deliverd', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('22-07-2000', 'dd-mm-yyyy'), 1000000901);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1002, 'deliverd', to_date('28-01-2000', 'dd-mm-yyyy'), to_date('10-10-2000', 'dd-mm-yyyy'), 1000000902);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1003, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('30-06-2000', 'dd-mm-yyyy'), 1000000903);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1004, 'deliverd', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('26-11-2000', 'dd-mm-yyyy'), 1000000904);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1005, 'deliverd', to_date('01-04-2000', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 1000000905);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1006, 'deliverd', to_date('29-01-2000', 'dd-mm-yyyy'), to_date('25-11-2000', 'dd-mm-yyyy'), 1000000906);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1007, 'sent', to_date('22-03-2000', 'dd-mm-yyyy'), to_date('08-11-2000', 'dd-mm-yyyy'), 1000000907);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1008, 'sent', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('09-10-2000', 'dd-mm-yyyy'), 1000000908);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1009, 'deliverd', to_date('08-04-2000', 'dd-mm-yyyy'), to_date('13-08-2000', 'dd-mm-yyyy'), 1000000909);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1010, 'created', to_date('18-03-2000', 'dd-mm-yyyy'), to_date('03-08-2000', 'dd-mm-yyyy'), 1000000910);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1011, 'created', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('21-11-2000', 'dd-mm-yyyy'), 1000000911);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1012, 'created', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('12-08-2000', 'dd-mm-yyyy'), 1000000912);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1013, 'sent', to_date('08-01-2000', 'dd-mm-yyyy'), to_date('11-09-2000', 'dd-mm-yyyy'), 1000000913);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1014, 'deliverd', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('13-07-2000', 'dd-mm-yyyy'), 1000000914);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1015, 'sent', to_date('07-03-2000', 'dd-mm-yyyy'), to_date('03-12-2000', 'dd-mm-yyyy'), 1000000915);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1016, 'sent', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('30-07-2000', 'dd-mm-yyyy'), 1000000916);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1017, 'created', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('31-08-2000', 'dd-mm-yyyy'), 1000000917);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1018, 'sent', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('20-11-2000', 'dd-mm-yyyy'), 1000000918);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1019, 'deliverd', to_date('18-01-2000', 'dd-mm-yyyy'), to_date('05-06-2000', 'dd-mm-yyyy'), 1000000919);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1020, 'deliverd', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('16-08-2000', 'dd-mm-yyyy'), 1000000920);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1021, 'created', to_date('14-04-2000', 'dd-mm-yyyy'), to_date('11-09-2000', 'dd-mm-yyyy'), 1000000921);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1022, 'deliverd', to_date('07-02-2000', 'dd-mm-yyyy'), to_date('20-08-2000', 'dd-mm-yyyy'), 1000000922);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1023, 'sent', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('14-09-2000', 'dd-mm-yyyy'), 1000000923);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1024, 'created', to_date('25-03-2000', 'dd-mm-yyyy'), to_date('01-10-2000', 'dd-mm-yyyy'), 1000000924);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1025, 'created', to_date('02-01-2000', 'dd-mm-yyyy'), to_date('28-05-2000', 'dd-mm-yyyy'), 1000000925);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1026, 'deliverd', to_date('30-01-2000', 'dd-mm-yyyy'), to_date('23-06-2000', 'dd-mm-yyyy'), 1000000926);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1027, 'deliverd', to_date('20-01-2000', 'dd-mm-yyyy'), to_date('20-08-2000', 'dd-mm-yyyy'), 1000000927);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1028, 'deliverd', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('20-11-2000', 'dd-mm-yyyy'), 1000000928);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1029, 'created', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('10-10-2000', 'dd-mm-yyyy'), 1000000929);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1030, 'sent', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('24-11-2000', 'dd-mm-yyyy'), 1000000930);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1031, 'deliverd', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('30-11-2000', 'dd-mm-yyyy'), 1000000931);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1032, 'created', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('05-06-2000', 'dd-mm-yyyy'), 1000000932);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1033, 'sent', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('06-07-2000', 'dd-mm-yyyy'), 1000000933);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1034, 'deliverd', to_date('09-01-2000', 'dd-mm-yyyy'), to_date('01-09-2000', 'dd-mm-yyyy'), 1000000934);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1035, 'sent', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('11-11-2000', 'dd-mm-yyyy'), 1000000935);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1036, 'deliverd', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('21-07-2000', 'dd-mm-yyyy'), 1000000936);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1037, 'sent', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('19-08-2000', 'dd-mm-yyyy'), 1000000937);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1038, 'deliverd', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 1000000938);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1039, 'sent', to_date('20-03-2000', 'dd-mm-yyyy'), to_date('12-07-2000', 'dd-mm-yyyy'), 1000000939);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1040, 'sent', to_date('30-04-2000', 'dd-mm-yyyy'), to_date('14-06-2000', 'dd-mm-yyyy'), 1000000940);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1041, 'sent', to_date('19-04-2000', 'dd-mm-yyyy'), to_date('10-06-2000', 'dd-mm-yyyy'), 1000000941);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1042, 'sent', to_date('16-03-2000', 'dd-mm-yyyy'), to_date('20-11-2000', 'dd-mm-yyyy'), 1000000942);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1043, 'deliverd', to_date('14-04-2000', 'dd-mm-yyyy'), to_date('27-06-2000', 'dd-mm-yyyy'), 1000000943);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1044, 'created', to_date('15-01-2000', 'dd-mm-yyyy'), to_date('01-10-2000', 'dd-mm-yyyy'), 1000000944);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1045, 'deliverd', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('26-10-2000', 'dd-mm-yyyy'), 1000000945);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1046, 'sent', to_date('27-04-2000', 'dd-mm-yyyy'), to_date('24-11-2000', 'dd-mm-yyyy'), 1000000946);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1047, 'created', to_date('25-03-2000', 'dd-mm-yyyy'), to_date('11-08-2000', 'dd-mm-yyyy'), 1000000947);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1048, 'created', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('08-08-2000', 'dd-mm-yyyy'), 1000000948);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1049, 'deliverd', to_date('21-04-2000', 'dd-mm-yyyy'), to_date('06-10-2000', 'dd-mm-yyyy'), 1000000949);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1050, 'created', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 1000000950);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1051, 'sent', to_date('03-03-2000', 'dd-mm-yyyy'), to_date('29-05-2000', 'dd-mm-yyyy'), 1000000951);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1052, 'created', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('19-11-2000', 'dd-mm-yyyy'), 1000000952);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1053, 'created', to_date('23-02-2000', 'dd-mm-yyyy'), to_date('16-05-2000', 'dd-mm-yyyy'), 1000000953);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1054, 'sent', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('04-05-2000', 'dd-mm-yyyy'), 1000000954);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1055, 'created', to_date('30-03-2000', 'dd-mm-yyyy'), to_date('02-09-2000', 'dd-mm-yyyy'), 1000000955);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1056, 'sent', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('01-11-2000', 'dd-mm-yyyy'), 1000000956);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1057, 'created', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('30-09-2000', 'dd-mm-yyyy'), 1000000957);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1058, 'sent', to_date('07-03-2000', 'dd-mm-yyyy'), to_date('19-08-2000', 'dd-mm-yyyy'), 1000000958);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1059, 'sent', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('16-09-2000', 'dd-mm-yyyy'), 1000000959);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1060, 'sent', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('10-11-2000', 'dd-mm-yyyy'), 1000000960);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1061, 'deliverd', to_date('03-01-2000', 'dd-mm-yyyy'), to_date('29-10-2000', 'dd-mm-yyyy'), 1000000961);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1062, 'created', to_date('01-01-2000', 'dd-mm-yyyy'), to_date('21-11-2000', 'dd-mm-yyyy'), 1000000962);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1063, 'deliverd', to_date('24-02-2000', 'dd-mm-yyyy'), to_date('08-06-2000', 'dd-mm-yyyy'), 1000000963);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1064, 'deliverd', to_date('09-04-2000', 'dd-mm-yyyy'), to_date('17-06-2000', 'dd-mm-yyyy'), 1000000964);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1065, 'sent', to_date('19-03-2000', 'dd-mm-yyyy'), to_date('08-06-2000', 'dd-mm-yyyy'), 1000000965);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1066, 'sent', to_date('13-02-2000', 'dd-mm-yyyy'), to_date('31-07-2000', 'dd-mm-yyyy'), 1000000966);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1067, 'created', to_date('24-02-2000', 'dd-mm-yyyy'), to_date('07-09-2000', 'dd-mm-yyyy'), 1000000967);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1068, 'deliverd', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('20-07-2000', 'dd-mm-yyyy'), 1000000968);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1069, 'sent', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('12-07-2000', 'dd-mm-yyyy'), 1000000969);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1070, 'deliverd', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('14-06-2000', 'dd-mm-yyyy'), 1000000970);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1071, 'created', to_date('05-02-2000', 'dd-mm-yyyy'), to_date('16-11-2000', 'dd-mm-yyyy'), 1000000971);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1072, 'deliverd', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('13-09-2000', 'dd-mm-yyyy'), 1000000972);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1073, 'created', to_date('14-02-2000', 'dd-mm-yyyy'), to_date('23-06-2000', 'dd-mm-yyyy'), 1000000973);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1074, 'deliverd', to_date('24-01-2000', 'dd-mm-yyyy'), to_date('03-12-2000', 'dd-mm-yyyy'), 1000000974);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1075, 'deliverd', to_date('28-04-2000', 'dd-mm-yyyy'), to_date('04-08-2000', 'dd-mm-yyyy'), 1000000975);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1076, 'created', to_date('24-01-2000', 'dd-mm-yyyy'), to_date('09-11-2000', 'dd-mm-yyyy'), 1000000976);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1077, 'created', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('14-11-2000', 'dd-mm-yyyy'), 1000000977);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1078, 'sent', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('29-10-2000', 'dd-mm-yyyy'), 1000000978);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1079, 'created', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('05-11-2000', 'dd-mm-yyyy'), 1000000979);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1080, 'sent', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('05-11-2000', 'dd-mm-yyyy'), 1000000980);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1081, 'sent', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('26-11-2000', 'dd-mm-yyyy'), 1000000981);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1082, 'deliverd', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('27-07-2000', 'dd-mm-yyyy'), 1000000982);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1083, 'sent', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('28-10-2000', 'dd-mm-yyyy'), 1000000983);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1084, 'deliverd', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('17-10-2000', 'dd-mm-yyyy'), 1000000984);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1085, 'deliverd', to_date('29-03-2000', 'dd-mm-yyyy'), to_date('24-05-2000', 'dd-mm-yyyy'), 1000000985);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1086, 'created', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('02-12-2000', 'dd-mm-yyyy'), 1000000986);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1087, 'created', to_date('22-01-2000', 'dd-mm-yyyy'), to_date('11-12-2000', 'dd-mm-yyyy'), 1000000987);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1088, 'sent', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('27-11-2000', 'dd-mm-yyyy'), 1000000988);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1089, 'deliverd', to_date('09-04-2000', 'dd-mm-yyyy'), to_date('17-09-2000', 'dd-mm-yyyy'), 1000000989);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1090, 'deliverd', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('21-08-2000', 'dd-mm-yyyy'), 1000000990);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1091, 'created', to_date('24-01-2000', 'dd-mm-yyyy'), to_date('07-05-2000', 'dd-mm-yyyy'), 1000000991);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1092, 'created', to_date('09-02-2000', 'dd-mm-yyyy'), to_date('21-06-2000', 'dd-mm-yyyy'), 1000000992);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1093, 'created', to_date('14-02-2000', 'dd-mm-yyyy'), to_date('16-10-2000', 'dd-mm-yyyy'), 1000000993);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1094, 'created', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('18-06-2000', 'dd-mm-yyyy'), 1000000994);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1095, 'created', to_date('06-01-2000', 'dd-mm-yyyy'), to_date('16-07-2000', 'dd-mm-yyyy'), 1000000995);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1096, 'sent', to_date('28-03-2000', 'dd-mm-yyyy'), to_date('28-11-2000', 'dd-mm-yyyy'), 1000000996);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1097, 'sent', to_date('26-01-2000', 'dd-mm-yyyy'), to_date('23-09-2000', 'dd-mm-yyyy'), 1000000997);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1098, 'sent', to_date('12-03-2000', 'dd-mm-yyyy'), to_date('08-12-2000', 'dd-mm-yyyy'), 1000000998);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1099, 'sent', to_date('16-01-2000', 'dd-mm-yyyy'), to_date('01-08-2000', 'dd-mm-yyyy'), 1000000999);
commit;
prompt 1000 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1100, 'deliverd', to_date('02-03-2000', 'dd-mm-yyyy'), to_date('25-09-2000', 'dd-mm-yyyy'), 1000001000);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1101, 'created', to_date('17-04-2000', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 1000001001);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1102, 'deliverd', to_date('28-03-2000', 'dd-mm-yyyy'), to_date('11-09-2000', 'dd-mm-yyyy'), 1000001002);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1103, 'deliverd', to_date('06-02-2000', 'dd-mm-yyyy'), to_date('13-10-2000', 'dd-mm-yyyy'), 1000001003);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1104, 'deliverd', to_date('03-01-2000', 'dd-mm-yyyy'), to_date('20-07-2000', 'dd-mm-yyyy'), 1000001004);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1105, 'deliverd', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('02-07-2000', 'dd-mm-yyyy'), 1000001005);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1106, 'sent', to_date('10-03-2000', 'dd-mm-yyyy'), to_date('30-10-2000', 'dd-mm-yyyy'), 1000001006);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1107, 'deliverd', to_date('13-02-2000', 'dd-mm-yyyy'), to_date('11-07-2000', 'dd-mm-yyyy'), 1000001007);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1108, 'deliverd', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('27-08-2000', 'dd-mm-yyyy'), 1000001008);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1109, 'deliverd', to_date('01-04-2000', 'dd-mm-yyyy'), to_date('30-07-2000', 'dd-mm-yyyy'), 1000001009);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1110, 'deliverd', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 1000001010);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1111, 'deliverd', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('16-10-2000', 'dd-mm-yyyy'), 1000001011);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1112, 'created', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 1000001012);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1113, 'sent', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('04-12-2000', 'dd-mm-yyyy'), 1000001013);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1114, 'created', to_date('30-04-2000', 'dd-mm-yyyy'), to_date('26-09-2000', 'dd-mm-yyyy'), 1000001014);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1115, 'deliverd', to_date('18-04-2000', 'dd-mm-yyyy'), to_date('23-05-2000', 'dd-mm-yyyy'), 1000001015);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1116, 'sent', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('05-05-2000', 'dd-mm-yyyy'), 1000001016);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1117, 'created', to_date('01-04-2000', 'dd-mm-yyyy'), to_date('05-08-2000', 'dd-mm-yyyy'), 1000001017);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1118, 'sent', to_date('28-02-2000', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 1000001018);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1119, 'deliverd', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 1000001019);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1120, 'sent', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('19-07-2000', 'dd-mm-yyyy'), 1000001020);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1121, 'created', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('27-11-2000', 'dd-mm-yyyy'), 1000001021);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1122, 'sent', to_date('14-01-2000', 'dd-mm-yyyy'), to_date('08-08-2000', 'dd-mm-yyyy'), 1000001022);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1123, 'deliverd', to_date('09-01-2000', 'dd-mm-yyyy'), to_date('29-10-2000', 'dd-mm-yyyy'), 1000001023);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1124, 'deliverd', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('15-05-2000', 'dd-mm-yyyy'), 1000001024);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1125, 'deliverd', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('08-09-2000', 'dd-mm-yyyy'), 1000001025);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1126, 'deliverd', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000001026);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1127, 'created', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('29-07-2000', 'dd-mm-yyyy'), 1000001027);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1128, 'created', to_date('09-04-2000', 'dd-mm-yyyy'), to_date('10-05-2000', 'dd-mm-yyyy'), 1000001028);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1129, 'deliverd', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('17-05-2000', 'dd-mm-yyyy'), 1000001029);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1130, 'deliverd', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('11-11-2000', 'dd-mm-yyyy'), 1000001030);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1131, 'created', to_date('09-04-2000', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 1000001031);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1132, 'sent', to_date('18-02-2000', 'dd-mm-yyyy'), to_date('10-12-2000', 'dd-mm-yyyy'), 1000001032);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1133, 'sent', to_date('19-01-2000', 'dd-mm-yyyy'), to_date('26-05-2000', 'dd-mm-yyyy'), 1000001033);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1134, 'deliverd', to_date('02-03-2000', 'dd-mm-yyyy'), to_date('31-05-2000', 'dd-mm-yyyy'), 1000001034);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1135, 'sent', to_date('20-04-2000', 'dd-mm-yyyy'), to_date('23-09-2000', 'dd-mm-yyyy'), 1000001035);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1136, 'created', to_date('13-01-2000', 'dd-mm-yyyy'), to_date('10-06-2000', 'dd-mm-yyyy'), 1000001036);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1137, 'created', to_date('11-04-2000', 'dd-mm-yyyy'), to_date('31-05-2000', 'dd-mm-yyyy'), 1000001037);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1138, 'sent', to_date('09-01-2000', 'dd-mm-yyyy'), to_date('18-05-2000', 'dd-mm-yyyy'), 1000001038);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1139, 'sent', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('29-09-2000', 'dd-mm-yyyy'), 1000001039);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1140, 'created', to_date('14-04-2000', 'dd-mm-yyyy'), to_date('19-10-2000', 'dd-mm-yyyy'), 1000001040);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1141, 'sent', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('24-07-2000', 'dd-mm-yyyy'), 1000001041);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1142, 'created', to_date('22-03-2000', 'dd-mm-yyyy'), to_date('09-12-2000', 'dd-mm-yyyy'), 1000001042);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1143, 'created', to_date('03-02-2000', 'dd-mm-yyyy'), to_date('25-11-2000', 'dd-mm-yyyy'), 1000001043);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1144, 'sent', to_date('14-01-2000', 'dd-mm-yyyy'), to_date('18-10-2000', 'dd-mm-yyyy'), 1000001044);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1145, 'deliverd', to_date('04-02-2000', 'dd-mm-yyyy'), to_date('30-06-2000', 'dd-mm-yyyy'), 1000001045);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1146, 'created', to_date('30-01-2000', 'dd-mm-yyyy'), to_date('19-07-2000', 'dd-mm-yyyy'), 1000001046);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1147, 'deliverd', to_date('17-04-2000', 'dd-mm-yyyy'), to_date('03-07-2000', 'dd-mm-yyyy'), 1000001047);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1148, 'created', to_date('24-04-2000', 'dd-mm-yyyy'), to_date('09-10-2000', 'dd-mm-yyyy'), 1000001048);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1149, 'deliverd', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('11-10-2000', 'dd-mm-yyyy'), 1000001049);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1150, 'deliverd', to_date('30-01-2000', 'dd-mm-yyyy'), to_date('13-05-2000', 'dd-mm-yyyy'), 1000001050);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1151, 'deliverd', to_date('23-03-2000', 'dd-mm-yyyy'), to_date('13-11-2000', 'dd-mm-yyyy'), 1000001051);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1152, 'deliverd', to_date('17-04-2000', 'dd-mm-yyyy'), to_date('26-09-2000', 'dd-mm-yyyy'), 1000001052);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1153, 'created', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('01-11-2000', 'dd-mm-yyyy'), 1000001053);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1154, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('13-11-2000', 'dd-mm-yyyy'), 1000001054);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1155, 'deliverd', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('06-11-2000', 'dd-mm-yyyy'), 1000001055);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1156, 'sent', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('28-11-2000', 'dd-mm-yyyy'), 1000001056);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1157, 'created', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('23-10-2000', 'dd-mm-yyyy'), 1000001057);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1158, 'sent', to_date('15-01-2000', 'dd-mm-yyyy'), to_date('18-09-2000', 'dd-mm-yyyy'), 1000001058);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1159, 'created', to_date('02-03-2000', 'dd-mm-yyyy'), to_date('21-07-2000', 'dd-mm-yyyy'), 1000001059);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1160, 'sent', to_date('03-04-2000', 'dd-mm-yyyy'), to_date('09-12-2000', 'dd-mm-yyyy'), 1000001060);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1161, 'deliverd', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('23-08-2000', 'dd-mm-yyyy'), 1000001061);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1162, 'sent', to_date('14-04-2000', 'dd-mm-yyyy'), to_date('23-08-2000', 'dd-mm-yyyy'), 1000001062);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1163, 'sent', to_date('07-03-2000', 'dd-mm-yyyy'), to_date('31-05-2000', 'dd-mm-yyyy'), 1000001063);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1164, 'sent', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000001064);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1165, 'sent', to_date('04-02-2000', 'dd-mm-yyyy'), to_date('27-11-2000', 'dd-mm-yyyy'), 1000001065);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1166, 'created', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('19-08-2000', 'dd-mm-yyyy'), 1000001066);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1167, 'sent', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('02-12-2000', 'dd-mm-yyyy'), 1000001067);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1168, 'created', to_date('16-02-2000', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 1000001068);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1169, 'created', to_date('22-01-2000', 'dd-mm-yyyy'), to_date('11-11-2000', 'dd-mm-yyyy'), 1000001069);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1170, 'created', to_date('06-01-2000', 'dd-mm-yyyy'), to_date('18-10-2000', 'dd-mm-yyyy'), 1000001070);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1171, 'deliverd', to_date('22-01-2000', 'dd-mm-yyyy'), to_date('10-05-2000', 'dd-mm-yyyy'), 1000001071);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1172, 'created', to_date('09-02-2000', 'dd-mm-yyyy'), to_date('02-06-2000', 'dd-mm-yyyy'), 1000001072);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1173, 'created', to_date('25-03-2000', 'dd-mm-yyyy'), to_date('27-06-2000', 'dd-mm-yyyy'), 1000001073);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1174, 'created', to_date('20-01-2000', 'dd-mm-yyyy'), to_date('25-09-2000', 'dd-mm-yyyy'), 1000001074);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1175, 'created', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('08-06-2000', 'dd-mm-yyyy'), 1000001075);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1176, 'sent', to_date('18-04-2000', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 1000001076);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1177, 'sent', to_date('27-04-2000', 'dd-mm-yyyy'), to_date('11-12-2000', 'dd-mm-yyyy'), 1000001077);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1178, 'deliverd', to_date('31-01-2000', 'dd-mm-yyyy'), to_date('21-09-2000', 'dd-mm-yyyy'), 1000001078);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1179, 'deliverd', to_date('03-03-2000', 'dd-mm-yyyy'), to_date('25-11-2000', 'dd-mm-yyyy'), 1000001079);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1180, 'created', to_date('29-04-2000', 'dd-mm-yyyy'), to_date('10-11-2000', 'dd-mm-yyyy'), 1000001080);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1181, 'created', to_date('07-01-2000', 'dd-mm-yyyy'), to_date('21-09-2000', 'dd-mm-yyyy'), 1000001081);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1182, 'deliverd', to_date('04-02-2000', 'dd-mm-yyyy'), to_date('07-05-2000', 'dd-mm-yyyy'), 1000001082);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1183, 'created', to_date('29-03-2000', 'dd-mm-yyyy'), to_date('20-08-2000', 'dd-mm-yyyy'), 1000001083);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1184, 'sent', to_date('23-03-2000', 'dd-mm-yyyy'), to_date('06-10-2000', 'dd-mm-yyyy'), 1000001084);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1185, 'deliverd', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('29-09-2000', 'dd-mm-yyyy'), 1000001085);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1186, 'deliverd', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('15-10-2000', 'dd-mm-yyyy'), 1000001086);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1187, 'deliverd', to_date('06-04-2000', 'dd-mm-yyyy'), to_date('11-11-2000', 'dd-mm-yyyy'), 1000001087);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1188, 'sent', to_date('28-01-2000', 'dd-mm-yyyy'), to_date('29-11-2000', 'dd-mm-yyyy'), 1000001088);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1189, 'deliverd', to_date('21-02-2000', 'dd-mm-yyyy'), to_date('05-07-2000', 'dd-mm-yyyy'), 1000001089);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1190, 'created', to_date('18-01-2000', 'dd-mm-yyyy'), to_date('23-06-2000', 'dd-mm-yyyy'), 1000001090);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1191, 'sent', to_date('31-03-2000', 'dd-mm-yyyy'), to_date('13-07-2000', 'dd-mm-yyyy'), 1000001091);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1192, 'created', to_date('25-01-2000', 'dd-mm-yyyy'), to_date('02-05-2000', 'dd-mm-yyyy'), 1000001092);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1193, 'created', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('09-10-2000', 'dd-mm-yyyy'), 1000001093);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1194, 'created', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('04-07-2000', 'dd-mm-yyyy'), 1000001094);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1195, 'deliverd', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('03-10-2000', 'dd-mm-yyyy'), 1000001095);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1196, 'created', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('16-11-2000', 'dd-mm-yyyy'), 1000001096);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1197, 'created', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('31-08-2000', 'dd-mm-yyyy'), 1000001097);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1198, 'sent', to_date('07-02-2000', 'dd-mm-yyyy'), to_date('12-08-2000', 'dd-mm-yyyy'), 1000001098);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1199, 'sent', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('14-09-2000', 'dd-mm-yyyy'), 1000001099);
commit;
prompt 1100 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1200, 'deliverd', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('01-06-2000', 'dd-mm-yyyy'), 1000001100);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1201, 'deliverd', to_date('07-03-2000', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 1000001101);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1202, 'created', to_date('25-04-2000', 'dd-mm-yyyy'), to_date('26-06-2000', 'dd-mm-yyyy'), 1000001102);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1203, 'deliverd', to_date('20-01-2000', 'dd-mm-yyyy'), to_date('02-11-2000', 'dd-mm-yyyy'), 1000001103);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1204, 'deliverd', to_date('26-04-2000', 'dd-mm-yyyy'), to_date('19-10-2000', 'dd-mm-yyyy'), 1000001104);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1205, 'deliverd', to_date('02-01-2000', 'dd-mm-yyyy'), to_date('03-12-2000', 'dd-mm-yyyy'), 1000001105);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1206, 'created', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('21-07-2000', 'dd-mm-yyyy'), 1000001106);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1207, 'deliverd', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('22-07-2000', 'dd-mm-yyyy'), 1000001107);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1208, 'created', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('16-11-2000', 'dd-mm-yyyy'), 1000001108);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1209, 'created', to_date('29-01-2000', 'dd-mm-yyyy'), to_date('04-05-2000', 'dd-mm-yyyy'), 1000001109);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1210, 'sent', to_date('08-04-2000', 'dd-mm-yyyy'), to_date('05-09-2000', 'dd-mm-yyyy'), 1000001110);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1211, 'created', to_date('22-02-2000', 'dd-mm-yyyy'), to_date('27-11-2000', 'dd-mm-yyyy'), 1000001111);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1212, 'deliverd', to_date('06-01-2000', 'dd-mm-yyyy'), to_date('19-08-2000', 'dd-mm-yyyy'), 1000001112);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1213, 'created', to_date('08-02-2000', 'dd-mm-yyyy'), to_date('15-10-2000', 'dd-mm-yyyy'), 1000001113);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1214, 'created', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('16-05-2000', 'dd-mm-yyyy'), 1000001114);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1215, 'deliverd', to_date('12-04-2000', 'dd-mm-yyyy'), to_date('03-05-2000', 'dd-mm-yyyy'), 1000001115);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1216, 'deliverd', to_date('13-03-2000', 'dd-mm-yyyy'), to_date('14-09-2000', 'dd-mm-yyyy'), 1000001116);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1217, 'deliverd', to_date('25-03-2000', 'dd-mm-yyyy'), to_date('21-05-2000', 'dd-mm-yyyy'), 1000001117);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1218, 'created', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('29-07-2000', 'dd-mm-yyyy'), 1000001118);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1219, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('05-08-2000', 'dd-mm-yyyy'), 1000001119);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1220, 'deliverd', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('30-09-2000', 'dd-mm-yyyy'), 1000001120);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1221, 'sent', to_date('21-03-2000', 'dd-mm-yyyy'), to_date('21-08-2000', 'dd-mm-yyyy'), 1000001121);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1222, 'deliverd', to_date('30-01-2000', 'dd-mm-yyyy'), to_date('14-06-2000', 'dd-mm-yyyy'), 1000001122);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1223, 'created', to_date('02-02-2000', 'dd-mm-yyyy'), to_date('13-08-2000', 'dd-mm-yyyy'), 1000001123);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1224, 'created', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('22-05-2000', 'dd-mm-yyyy'), 1000001124);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1225, 'created', to_date('01-02-2000', 'dd-mm-yyyy'), to_date('04-06-2000', 'dd-mm-yyyy'), 1000001125);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1226, 'deliverd', to_date('05-03-2000', 'dd-mm-yyyy'), to_date('09-08-2000', 'dd-mm-yyyy'), 1000001126);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1227, 'sent', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('03-10-2000', 'dd-mm-yyyy'), 1000001127);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1228, 'sent', to_date('08-03-2000', 'dd-mm-yyyy'), to_date('04-05-2000', 'dd-mm-yyyy'), 1000001128);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1229, 'sent', to_date('07-03-2000', 'dd-mm-yyyy'), to_date('28-06-2000', 'dd-mm-yyyy'), 1000001129);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1230, 'deliverd', to_date('09-04-2000', 'dd-mm-yyyy'), to_date('06-12-2000', 'dd-mm-yyyy'), 1000001130);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1231, 'deliverd', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('21-05-2000', 'dd-mm-yyyy'), 1000001131);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1232, 'sent', to_date('18-03-2000', 'dd-mm-yyyy'), to_date('05-05-2000', 'dd-mm-yyyy'), 1000001132);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1233, 'deliverd', to_date('25-03-2000', 'dd-mm-yyyy'), to_date('28-05-2000', 'dd-mm-yyyy'), 1000001133);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1234, 'created', to_date('10-02-2000', 'dd-mm-yyyy'), to_date('17-07-2000', 'dd-mm-yyyy'), 1000001134);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1235, 'sent', to_date('28-02-2000', 'dd-mm-yyyy'), to_date('22-06-2000', 'dd-mm-yyyy'), 1000001135);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1236, 'created', to_date('28-02-2000', 'dd-mm-yyyy'), to_date('23-06-2000', 'dd-mm-yyyy'), 1000001136);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1237, 'created', to_date('09-02-2000', 'dd-mm-yyyy'), to_date('09-11-2000', 'dd-mm-yyyy'), 1000001137);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1238, 'created', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('28-07-2000', 'dd-mm-yyyy'), 1000001138);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1239, 'sent', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('16-08-2000', 'dd-mm-yyyy'), 1000001139);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1240, 'created', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('23-11-2000', 'dd-mm-yyyy'), 1000001140);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1241, 'created', to_date('08-01-2000', 'dd-mm-yyyy'), to_date('15-11-2000', 'dd-mm-yyyy'), 1000001141);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1242, 'sent', to_date('04-02-2000', 'dd-mm-yyyy'), to_date('20-05-2000', 'dd-mm-yyyy'), 1000001142);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1243, 'sent', to_date('09-03-2000', 'dd-mm-yyyy'), to_date('03-09-2000', 'dd-mm-yyyy'), 1000001143);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1244, 'sent', to_date('07-02-2000', 'dd-mm-yyyy'), to_date('26-09-2000', 'dd-mm-yyyy'), 1000001144);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1245, 'sent', to_date('07-02-2000', 'dd-mm-yyyy'), to_date('12-09-2000', 'dd-mm-yyyy'), 1000001145);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1246, 'sent', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('06-08-2000', 'dd-mm-yyyy'), 1000001146);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1247, 'created', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('02-12-2000', 'dd-mm-yyyy'), 1000001147);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1248, 'sent', to_date('28-02-2000', 'dd-mm-yyyy'), to_date('16-10-2000', 'dd-mm-yyyy'), 1000001148);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1249, 'sent', to_date('12-03-2000', 'dd-mm-yyyy'), to_date('14-11-2000', 'dd-mm-yyyy'), 1000001149);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1250, 'sent', to_date('04-01-2000', 'dd-mm-yyyy'), to_date('06-09-2000', 'dd-mm-yyyy'), 1000001150);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1251, 'sent', to_date('26-02-2000', 'dd-mm-yyyy'), to_date('22-11-2000', 'dd-mm-yyyy'), 1000001151);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1252, 'deliverd', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 1000001152);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1253, 'sent', to_date('01-01-2000', 'dd-mm-yyyy'), to_date('27-06-2000', 'dd-mm-yyyy'), 1000001153);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1254, 'sent', to_date('02-04-2000', 'dd-mm-yyyy'), to_date('24-07-2000', 'dd-mm-yyyy'), 1000001154);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1255, 'sent', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 1000001155);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1256, 'created', to_date('01-04-2000', 'dd-mm-yyyy'), to_date('03-05-2000', 'dd-mm-yyyy'), 1000001156);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1257, 'sent', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('09-12-2000', 'dd-mm-yyyy'), 1000001157);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1258, 'created', to_date('24-02-2000', 'dd-mm-yyyy'), to_date('30-05-2000', 'dd-mm-yyyy'), 1000001158);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1259, 'deliverd', to_date('29-04-2000', 'dd-mm-yyyy'), to_date('26-10-2000', 'dd-mm-yyyy'), 1000001159);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1260, 'deliverd', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('15-07-2000', 'dd-mm-yyyy'), 1000001160);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1261, 'created', to_date('13-02-2000', 'dd-mm-yyyy'), to_date('17-07-2000', 'dd-mm-yyyy'), 1000001161);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1262, 'sent', to_date('05-04-2000', 'dd-mm-yyyy'), to_date('30-05-2000', 'dd-mm-yyyy'), 1000001162);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1263, 'created', to_date('30-04-2000', 'dd-mm-yyyy'), to_date('21-08-2000', 'dd-mm-yyyy'), 1000001163);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1264, 'created', to_date('10-04-2000', 'dd-mm-yyyy'), to_date('05-08-2000', 'dd-mm-yyyy'), 1000001164);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1265, 'created', to_date('06-01-2000', 'dd-mm-yyyy'), to_date('17-10-2000', 'dd-mm-yyyy'), 1000001165);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1266, 'deliverd', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('18-06-2000', 'dd-mm-yyyy'), 1000001166);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1267, 'created', to_date('12-04-2000', 'dd-mm-yyyy'), to_date('10-07-2000', 'dd-mm-yyyy'), 1000001167);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1268, 'created', to_date('03-02-2000', 'dd-mm-yyyy'), to_date('03-10-2000', 'dd-mm-yyyy'), 1000001168);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1269, 'created', to_date('10-01-2000', 'dd-mm-yyyy'), to_date('19-10-2000', 'dd-mm-yyyy'), 1000001169);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1270, 'created', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('30-09-2000', 'dd-mm-yyyy'), 1000001170);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1271, 'deliverd', to_date('13-04-2000', 'dd-mm-yyyy'), to_date('30-08-2000', 'dd-mm-yyyy'), 1000001171);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1272, 'sent', to_date('07-04-2000', 'dd-mm-yyyy'), to_date('14-06-2000', 'dd-mm-yyyy'), 1000001172);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1273, 'created', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('12-11-2000', 'dd-mm-yyyy'), 1000001173);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1274, 'sent', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('09-05-2000', 'dd-mm-yyyy'), 1000001174);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1275, 'deliverd', to_date('12-01-2000', 'dd-mm-yyyy'), to_date('19-07-2000', 'dd-mm-yyyy'), 1000001175);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1276, 'deliverd', to_date('21-01-2000', 'dd-mm-yyyy'), to_date('08-08-2000', 'dd-mm-yyyy'), 1000001176);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1277, 'created', to_date('01-01-2000', 'dd-mm-yyyy'), to_date('03-10-2000', 'dd-mm-yyyy'), 1000001177);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1278, 'deliverd', to_date('27-01-2000', 'dd-mm-yyyy'), to_date('27-08-2000', 'dd-mm-yyyy'), 1000001178);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1279, 'deliverd', to_date('15-04-2000', 'dd-mm-yyyy'), to_date('12-08-2000', 'dd-mm-yyyy'), 1000001179);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1280, 'created', to_date('18-03-2000', 'dd-mm-yyyy'), to_date('23-10-2000', 'dd-mm-yyyy'), 1000001180);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1281, 'created', to_date('31-03-2000', 'dd-mm-yyyy'), to_date('09-05-2000', 'dd-mm-yyyy'), 1000001181);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1282, 'deliverd', to_date('25-02-2000', 'dd-mm-yyyy'), to_date('24-07-2000', 'dd-mm-yyyy'), 1000001182);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1283, 'deliverd', to_date('17-01-2000', 'dd-mm-yyyy'), to_date('27-08-2000', 'dd-mm-yyyy'), 1000001183);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1284, 'deliverd', to_date('22-04-2000', 'dd-mm-yyyy'), to_date('16-07-2000', 'dd-mm-yyyy'), 1000001184);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1285, 'deliverd', to_date('12-03-2000', 'dd-mm-yyyy'), to_date('07-11-2000', 'dd-mm-yyyy'), 1000001185);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1286, 'deliverd', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('27-06-2000', 'dd-mm-yyyy'), 1000001186);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1287, 'created', to_date('08-01-2000', 'dd-mm-yyyy'), to_date('16-07-2000', 'dd-mm-yyyy'), 1000001187);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1288, 'created', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('04-07-2000', 'dd-mm-yyyy'), 1000001188);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1289, 'deliverd', to_date('26-03-2000', 'dd-mm-yyyy'), to_date('21-05-2000', 'dd-mm-yyyy'), 1000001189);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1290, 'deliverd', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('24-07-2000', 'dd-mm-yyyy'), 1000001190);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1291, 'deliverd', to_date('29-01-2000', 'dd-mm-yyyy'), to_date('05-12-2000', 'dd-mm-yyyy'), 1000001191);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1292, 'sent', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('02-10-2000', 'dd-mm-yyyy'), 1000001192);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1293, 'created', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 1000001193);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1294, 'sent', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('01-06-2000', 'dd-mm-yyyy'), 1000001194);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1295, 'deliverd', to_date('11-01-2000', 'dd-mm-yyyy'), to_date('19-08-2000', 'dd-mm-yyyy'), 1000001195);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1296, 'deliverd', to_date('15-03-2000', 'dd-mm-yyyy'), to_date('30-07-2000', 'dd-mm-yyyy'), 1000001196);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1297, 'sent', to_date('17-03-2000', 'dd-mm-yyyy'), to_date('13-08-2000', 'dd-mm-yyyy'), 1000001197);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1298, 'deliverd', to_date('05-01-2000', 'dd-mm-yyyy'), to_date('05-08-2000', 'dd-mm-yyyy'), 1000001198);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (1299, 'created', to_date('24-03-2000', 'dd-mm-yyyy'), to_date('29-11-2000', 'dd-mm-yyyy'), 1000001199);
commit;
prompt 1200 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (2000, 'created', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('15-02-2000', 'dd-mm-yyyy'), 1000001193);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (2001, 'created', to_date('15-02-2000', 'dd-mm-yyyy'), to_date('15-02-2000', 'dd-mm-yyyy'), 1000001193);
commit;
prompt 1202 records loaded
prompt Loading FOODDELIVERY...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Flat Panel Speakers ', 'SK-015', 'D', 624);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 2.4 Ghz CPU', 'CP-020', 'D', 625);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VLB Intel ', 'MB-014', 'M', 626);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & Gigab', 'ABB-057', 'M', 627);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ Biostar', 'CMA-053', 'D', 628);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Benwin S54 Surround ', 'SK-013', 'D', 629);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case 250W P', 'CS-077', 'D', 630);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('PCI 56K V.92 Fax Mod', 'FM-010', 'M', 631);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 306 Sub Woofer ', 'SK-012', 'D', 632);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.0gh', 'IBB-007', 'M', 633);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sound Blaster Audigy', 'SC-002', 'D', 634);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('8012 Black case with', 'CS-032', 'M', 635);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Front panel USB kit ', 'CS-018', 'D', 636);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GigaByte G-Max Intel', 'SY-005', 'D', 637);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('SVA-USA VR-17S 17" T', 'MT-014', 'M', 638);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-093', 'D', 639);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 406 Sub Woofer ', 'SK-016', 'M', 640);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AOC 17" Monitor 7FSL', 'MT-013', 'D', 641);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1700+ c', 'CMA-124', 'D', 642);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 1050 Sub Woofer', 'SK-014', 'M', 643);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radion 7000 64Mb', 'VC-035', 'M', 644);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.8ghz', 'IBB-014', 'D', 645);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('PowerColor 128MB USB', 'GM-005', 'M', 646);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-7VKMLE', 'MB-046', 'M', 647);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6TBA skt 37', 'MB-089', 'M', 648);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('64Mb RDRam SAMSUNG M', 'ME-019', 'M', 649);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-078', 'D', 650);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel D845PEBT2 M/B ', 'MB-024', 'D', 651);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LG 52x24x52x CD-RW (', 'RD-002', 'M', 652);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & Gigab', 'ABB-064', 'D', 653);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.7ghz', 'IBB-012', 'D', 654);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('10 Pack CD-R cd''s Co', 'RD-011', 'D', 655);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 1.44 Floppy ', 'FD-001', 'M', 656);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD 1.1Ghz BareBone ', 'ABB-053', 'D', 657);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.4gh', 'IBB-108', 'M', 658);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Serial ATA Power Con', 'ML-040', 'D', 659);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.3Ghz & G', 'ABB-060', 'D', 660);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CP-691 Stereo Speake', 'SK-004', 'D', 661);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.3Ghz', 'IBB-005', 'M', 662);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.1Ghz', 'CP-042', 'D', 663);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD 1.3Ghz BareBone ', 'ABB-070', 'D', 664);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.2Ghz OEM', 'CP-035', 'M', 665);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.1G', 'CMA-063', 'M', 666);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Matrox Dual Head G55', 'VC-031', 'M', 667);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.0gh', 'IBB-015', 'M', 668);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Creative Sound Blast', 'SC-010', 'D', 669);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6TWL skt 37', 'MB-010', 'M', 670);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATX 300W High Qualit', 'CS-004', 'D', 671);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LABTEC Internet Keyb', 'KB-008', 'M', 672);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('6066-C10 ATX Black M', 'CS-033', 'D', 673);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 2', 'CS-078', 'D', 674);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('10ft Cat 5 network c', 'NC-014', 'D', 675);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1800+ C', 'CMA-064', 'D', 676);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('SVA-USA VR-15A 15" T', 'MT-002', 'D', 677);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 4', 'CS-059', 'D', 678);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ASUS A7N8X Deluxe NV', 'CMA-160', 'D', 679);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.0gh', 'IBB-037', 'M', 680);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.4gh', 'IBB-114', 'M', 681);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.7gh', 'IBB-044', 'M', 682);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.0Gh', 'CMI-051', 'M', 683);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Maxtor 40G 7200RPM A', 'HD-020', 'D', 684);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-8SMMLP S', 'MB-050', 'D', 685);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2700+ FBS 333', 'ABB-106', 'M', 686);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CoolerMaster Thermal', 'ML-024', 'M', 687);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Round ', 'ML-017', 'M', 688);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-158', 'M', 689);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AOC 15" Monitor .27m', 'MT-007', 'D', 690);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows 2000 w/Servi', 'SW-005', 'M', 691);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Gigab', 'ABB-054', 'M', 692);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.8Ghz', 'CP-025', 'D', 693);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radion 7000 64Mb', 'VC-035', 'D', 694);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LG 32x10x40 and 16x ', 'RD-023', 'M', 695);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ (', 'CMA-110', 'M', 696);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-087', 'D', 697);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony Black 16X DVD .', 'RD-014', 'D', 698);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Fast Ethernet 10/100', 'NC-012', 'M', 699);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('5ft Cat5 network cab', 'NC-023', 'M', 700);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cyber Power 1000VA B', 'UP-017', 'D', 701);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS USB2000 USB Turb', 'NC-001', 'M', 702);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows XP Pro Regis', 'SW-010', 'D', 703);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Logitech Quick Cam W', 'VC-004', 'M', 704);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;7Ghz + In', 'IBB-031', 'D', 705);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Keyboard Converter f', 'ML-015', 'M', 706);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.9gh', 'IBB-027', 'D', 707);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ASUS A7N8X Deluxe NV', 'MB-011', 'M', 708);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD MP 1500+ G', 'CMA-106', 'M', 709);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;7Ghz + In', 'IBB-031', 'M', 710);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD MP 1500+ G', 'CMA-106', 'D', 711);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATX 300W High Qualit', 'CS-004', 'M', 712);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.9Gh', 'CMI-086', 'M', 713);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black RF Wireless Ke', 'KB-018', 'M', 714);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Logitech Optical Mou', 'MS-009', 'M', 715);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VCF MICRO ', 'MB-029', 'D', 716);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CoolerMaster Thermal', 'ML-030', 'D', 717);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 3.06g', 'CMI-114', 'D', 718);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-087', 'M', 719);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master DP5-6J', 'ML-036', 'M', 720);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('8012 Black case with', 'CS-032', 'D', 721);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Case Fan 3 1/2"(80mm', 'ML-029', 'M', 722);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('14inch LCD MG-015A X', 'MT-020', 'D', 723);
commit;
prompt 100 records committed...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('128Mb SDRAM PC133 Mi', 'ME-015', 'D', 724);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2700+ FBS 333', 'ABB-106', 'M', 725);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;8Ghz (478', 'CP-015', 'D', 726);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Biost', 'ABB-025', 'M', 727);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Asus P4C800 Deluxe i', 'CMI-116', 'D', 728);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-106', 'D', 729);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKB Ver2.0', 'MB-007', 'M', 730);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('10ft Cat 5 network c', 'NC-014', 'M', 731);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('YS AMD XP 2000+ Perf', 'YS-010', 'M', 732);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 2', 'CS-078', 'M', 733);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cyber Power 725VA Ba', 'UP-005', 'M', 734);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate Baraccuda 40', 'HD-024', 'D', 735);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2000 Bi', 'CMA-153', 'D', 736);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AOC LM520 Flat Scree', 'MT-010', 'M', 737);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.6gh', 'IBB-043', 'D', 738);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CNet External 56k V.', 'FM-008', 'D', 739);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ c', 'CMA-102', 'M', 740);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.1Ghz', 'IBB-033', 'M', 741);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.2Ghz OEM', 'CP-035', 'M', 742);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VCF MICRO ', 'MB-029', 'D', 743);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312D ATX color case(', 'CS-072', 'D', 744);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radion 7000 64Mb', 'VC-035', 'M', 745);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 7000 32MB', 'VC-048', 'D', 746);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-096', 'D', 747);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & Gigab', 'ABB-055', 'M', 748);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('MITSUMI 54X CD-Rom B', 'RD-008', 'D', 749);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Double RJ45 Surface ', 'NC-011', 'M', 750);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel D845WN 478Pin ', 'MB-026', 'D', 751);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black LG Electronics', 'RD-007', 'D', 752);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312J ATX Case with 4', 'CS-066', 'M', 753);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD MP 1500+ G', 'CMA-106', 'D', 754);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Matrox Dual Head G55', 'VC-031', 'D', 755);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Epson Stylus C42UX -', 'PT-003', 'D', 756);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.2G', 'CMA-149', 'M', 757);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 2.2Ghz', 'CP-017', 'M', 758);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ B', 'CMA-155', 'D', 759);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 306 Sub Woofer ', 'SK-012', 'M', 760);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Fast Ethernet 10/100', 'NC-012', 'D', 761);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('xAMD XP 1600+ Biosta', 'CMA-045', 'D', 762);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & Biost', 'ABB-108', 'M', 763);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 306 Sub Woofer ', 'SK-012', 'M', 764);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2500+ & Gigab', 'ABB-098', 'M', 765);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS USB2000 USB Turb', 'NC-001', 'D', 766);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & Biost', 'ABB-049', 'M', 767);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('PS2 2 Button Mouse', 'MS-004', 'D', 768);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & Biost', 'ABB-109', 'D', 769);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Dynatron MicroFin DC', 'ML-038', 'D', 770);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2700+ Retail ', 'CP-005', 'D', 771);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512Mb DDR PC2100 Kin', 'ME-016', 'D', 772);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-132', 'D', 773);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AOC 17" Monitor 7Elr', 'MT-005', 'M', 774);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2200+( ', 'CMA-108', 'M', 775);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.7gh', 'CMI-068', 'M', 776);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ B', 'CMA-155', 'D', 777);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('M7SXF P4 478pin Moth', 'MB-028', 'M', 778);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Iomega Internal EIDE', 'TB-009', 'M', 779);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master ATA133', 'ML-023', 'M', 780);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb DDR 333 PC2700', 'ME-031', 'D', 781);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.0gh', 'IBB-038', 'M', 782);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('8012 Black case with', 'CS-032', 'M', 783);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('White RF Wireless Ke', 'KB-004', 'M', 784);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ Box/wit', 'CP-009', 'M', 785);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GigaByte G-Max Intel', 'SY-005', 'M', 786);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.0Gh', 'CMI-051', 'D', 787);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel D 850MV P4 M/B', 'MB-001', 'M', 788);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Matrox Dual Head G55', 'VC-031', 'D', 789);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS Technologies Fir', 'VC-016', 'M', 790);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 7000 32MB', 'VC-048', 'D', 791);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.4gh', 'IBB-108', 'D', 792);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313H ATX 400w Case W', 'CS-050', 'M', 793);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('6066-C10 ATX Black M', 'CS-033', 'M', 794);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2500+ & GigaB', 'ABB-010', 'M', 795);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('USB to Parallel Prin', 'ML-001', 'D', 796);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb PC133 SDRam Mi', 'ME-014', 'D', 797);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312A Black ATX case ', 'CS-060', 'M', 798);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-7VAXP AM', 'MB-052', 'D', 799);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ OEM', 'CP-030', 'M', 800);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VCF MICRO ', 'MB-029', 'D', 801);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313N-B ATX case 300W', 'CS-031', 'M', 802);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 2.0Ghz', 'YS-026', 'M', 803);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 1.44 Floppy ', 'FD-003', 'D', 804);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate 40GB 5400RPM', 'HD-003', 'D', 805);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 406 Sub Woofer ', 'SK-016', 'D', 806);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('9011 ATX Mid Server ', 'CS-009', 'D', 807);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('W.D 120G 7200RPM (12', 'HD-012', 'M', 808);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel D845PEBT2 P4 M', 'MB-111', 'M', 809);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GA-7N400L nForce 2 U', 'MB-058', 'M', 810);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.7Gh', 'CMI-095', 'M', 811);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2500+ & GigaB', 'ABB-010', 'D', 812);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1.8 Ghz CPU', 'CP-015', 'M', 813);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel D845PEBT2 P4 M', 'MB-111', 'D', 814);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Printer Cable', 'ML-013', 'D', 815);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Ball B', 'ML-028', 'M', 816);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.2Ghz OEM', 'CP-035', 'M', 817);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-110', 'M', 818);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-8IE800 I', 'MB-035', 'M', 819);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-101', 'M', 820);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('YS AMD XP 2000+ Perf', 'YS-010', 'D', 821);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('219L ATX color Case ', 'CS-046', 'D', 822);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.2G', 'CMA-149', 'M', 823);
commit;
prompt 200 records committed...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.2G', 'CMA-113', 'D', 824);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('YS AMD T-Bird 1.2 Gh', 'YS-017', 'D', 825);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('SVA-USA VR-15A 15" T', 'MT-002', 'D', 826);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMDXP2000+ Box Biost', 'CMA-152', 'M', 827);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black LG Electronics', 'RD-007', 'D', 828);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KIT Keyboard Mouse a', 'CS-012', 'D', 829);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1700+ c', 'CMA-124', 'M', 830);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('PS2 2 Button Mouse', 'MS-004', 'M', 831);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sound Blaster Audigy', 'SC-002', 'D', 832);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('SVA-USA VR-17S 17" T', 'MT-014', 'D', 833);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black Sony CD-RW 52x', 'RD-025', 'M', 834);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512Mb DDR 333 PC2700', 'ME-029', 'M', 835);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 9800 Pro ', 'VC-019', 'D', 836);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ c', 'CMA-130', 'D', 837);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2700+ FBS 333', 'ABB-106', 'M', 838);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;8Ghz (478', 'CP-015', 'M', 839);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400 Bi', 'CMA-154', 'D', 840);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;7Ghz Box ', 'CP-027', 'D', 841);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('PCI 56K V.92 Fax Mod', 'FM-010', 'M', 842);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.8Ghz', 'YS-025', 'D', 843);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('6072-1 case with sid', 'CS-024', 'D', 844);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD 1.1Ghz Starter S', 'YS-006', 'D', 845);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKD-Pro AM', 'MB-017', 'D', 846);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Gigab', 'ABB-083', 'M', 847);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('6066-C10 ATX Black M', 'CS-033', 'M', 848);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-087', 'D', 849);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512MB DDR400 PC3200 ', 'ME-026', 'D', 850);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Maxtor External 80Gb', 'HD-007', 'M', 851);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Maxtor 30GB 7200RPM ', 'HD-023', 'D', 852);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Gigab', 'ABB-089', 'D', 853);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6gh', 'CMI-067', 'M', 854);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GigaByte G-Max Intel', 'SY-005', 'D', 855);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('10/100 REALTEK NETWO', 'NC-004', 'D', 856);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKB Ver2.0', 'MB-007', 'M', 857);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb DDR 333 PC2700', 'ME-031', 'D', 858);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Western Digital 20GB', 'HD-044', 'D', 859);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Logitech Smart Click', 'VC-001', 'D', 860);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VLB Intel ', 'MB-014', 'M', 861);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate Baraccuda 40', 'HD-024', 'M', 862);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-056', 'M', 863);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.2Ghz', 'IBB-032', 'M', 864);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-081', 'M', 865);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-7NNXP Mo', 'MB-063', 'D', 866);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('MITSUMI 54X CD-Rom B', 'RD-008', 'M', 867);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 48x 12 x 40 ', 'RD-030', 'D', 868);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-132', 'M', 869);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 3', 'Enterprise Computing', 'D', 2000);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('6066-C10 Black Compu', 'Phoenix Rehabilitati', 'M', 2001);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Logitech Quick Cam W', 'VC-004', 'D', 870);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2200+ C', 'CMA-144', 'D', 871);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA 7DPXDW-c', 'MB-042', 'M', 872);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 1.44 Floppy ', 'FD-001', 'D', 873);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512mb DDR ECC Regist', 'ME-032', 'D', 874);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.3G', 'CMA-114', 'M', 875);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('64Mb RDRam SAMSUNG M', 'ME-019', 'M', 876);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ C', 'CMA-131', 'D', 877);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Gigab', 'ABB-061', 'M', 878);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-013', 'M', 879);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows 2000 w/Servi', 'SW-005', 'D', 880);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-087', 'D', 881);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black Sony CD-RW 52x', 'RD-025', 'D', 882);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.1Ghz (11', 'CP-013', 'D', 883);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2400+ FBS 333', 'ABB-104', 'D', 884);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-110', 'D', 885);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Biost', 'ABB-113', 'M', 886);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.7ghz', 'IBB-006', 'M', 887);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 2000 Sub Woofer', 'SK-008', 'M', 888);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKB Ver2.0', 'MB-007', 'D', 889);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radion 7000 64Mb', 'VC-035', 'D', 890);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ (Box) &', 'ABB-065', 'M', 891);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows XP Pro Regis', 'SW-010', 'D', 892);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 7000 VIVO', 'VC-009', 'M', 893);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-081', 'M', 894);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.1Ghz (11', 'CP-013', 'M', 895);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Dynatron MicroFin DC', 'ML-038', 'D', 896);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Windows XP', 'SW-007', 'D', 897);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GA-7N400 Pro nForce ', 'MB-060', 'M', 898);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP1800 Biostar M', 'CMA-039', 'D', 899);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-132', 'D', 900);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('128Mb SDRAM PC133 Mi', 'ME-015', 'M', 901);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ Box/wit', 'CP-009', 'D', 902);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313B Black 300W P4/A', 'CS-014', 'M', 903);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-105', 'D', 904);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate 20GB ATA100 ', 'HD-035', 'D', 905);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-087', 'M', 906);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CyberPower 525VA(525', 'UP-018', 'M', 907);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Headphone & Mic', 'SK-010', 'M', 908);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA 7DPXDW-c', 'MB-042', 'D', 909);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 52x 40 x 48 ', 'RD-037', 'D', 910);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ B', 'CMA-157', 'M', 911);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AOC 19" Monitor .26 ', 'MT-009', 'D', 912);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Logitech Smart Click', 'VC-001', 'M', 913);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256MB DDR PC2700 Kin', 'ME-033', 'D', 914);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('YS Intel P4 2.0Ghz P', 'YS-015', 'M', 915);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2200+ C', 'CMA-111', 'M', 916);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GeForceFX 5200 128MB', 'VC-025', 'D', 917);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & Biost', 'ABB-026', 'M', 918);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.6Gh', 'IBB-021', 'D', 919);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ Box & G', 'ABB-058', 'M', 920);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel D845PESV P4 M/', 'MB-002', 'D', 921);
commit;
prompt 300 records committed...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Internet K', 'KB-013', 'D', 922);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400 Bi', 'CMA-154', 'D', 923);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('MicroSoft Windows Se', 'SW-011', 'D', 924);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-113', 'M', 925);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case (No Po', 'CS-079', 'M', 926);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATA 100 RAID control', 'NC-016', 'D', 927);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6gh', 'CMI-067', 'M', 928);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('SIS Xabre200 64MB DD', 'VC-013', 'D', 929);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Office 200', 'SW-014', 'D', 930);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313F-B ATX case 400W', 'CS-043', 'M', 931);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Gigab', 'ABB-089', 'D', 932);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ c', 'CMA-117', 'M', 933);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;7Ghz Box ', 'CP-027', 'D', 934);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512MB DDR PC3200 Kin', 'ME-017', 'D', 935);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Headset with Mircoph', 'SK-010', 'D', 936);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-132', 'M', 937);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('1.7Ghz Intel Celeron', 'CMI-080', 'D', 938);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black Sony CD-RW 52x', 'RD-025', 'D', 939);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-112', 'D', 940);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313B Black 300W P4/A', 'CS-014', 'D', 941);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.4gh', 'CMI-108', 'M', 942);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.4gh', 'CMI-111', 'M', 943);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('MITSUMI 54X CD-Rom B', 'RD-008', 'M', 944);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Allied 400watt Power', 'CS-051', 'D', 945);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('6066-C10 Black Compu', 'CS-088', 'M', 946);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.7ghz', 'IBB-006', 'M', 947);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKQ Duron ', 'ABB-001', 'M', 948);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GA-7N400L nForce 2 U', 'MB-058', 'D', 949);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6gh', 'CMI-067', 'D', 950);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Promise Fast Track A', 'NC-017', 'M', 951);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP2000+ Biostar ', 'CMA-059', 'D', 952);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313M ATX color Case ', 'CS-048', 'M', 953);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('10/100 REALTEK NETWO', 'NC-004', 'M', 954);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LABTEC Internet Keyb', 'KB-008', 'D', 955);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium 4 2.0 ', 'CP-029', 'M', 956);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AOC LM520 Flat Scree', 'MT-010', 'M', 957);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('219L ATX color Case ', 'CS-046', 'D', 958);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CP-691 Stereo Speake', 'SK-004', 'D', 959);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Headset with Mircoph', 'SK-010', 'D', 960);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Wireless O', 'MS-006', 'M', 961);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('PS2 2 Button Mouse', 'MS-004', 'M', 962);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('TV Tuner card PCI (K', 'VC-030', 'D', 963);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Gigab', 'ABB-072', 'D', 964);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-101', 'M', 965);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 3.06Ghz (47', 'CP-038', 'M', 966);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Pentiume 4 1.8Ghz/12', 'YS-027', 'D', 967);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CNet External 56k V.', 'FM-008', 'D', 968);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case 250W P', 'CS-077', 'D', 969);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2700+ & Gigab', 'ABB-095', 'M', 970);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-8SG800 M', 'MB-057', 'M', 971);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313M ATX color Case ', 'CS-048', 'D', 972);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512mb DDR ECC Regist', 'ME-032', 'M', 973);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('128Mb DDRam PC2100 K', 'ME-023', 'M', 974);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 2.0Ghz', 'YS-026', 'M', 975);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ (', 'CMA-127', 'D', 976);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6Gh', 'CMI-088', 'M', 977);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 2.4G BareBo', 'IBB-110', 'M', 978);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-142', 'D', 979);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-107', 'D', 980);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1800+ B', 'CMA-151', 'D', 981);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ C', 'CMA-156', 'M', 982);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CNet External 56k V.', 'FM-008', 'D', 983);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-087', 'M', 984);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 3000+ B', 'CMA-160', 'D', 985);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1800+ c', 'CMA-116', 'M', 986);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & Gigab', 'ABB-062', 'M', 987);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 52x 40 x 48 ', 'RD-037', 'M', 988);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS 2 Port USB Pci c', 'NC-003', 'D', 989);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb SDRam PC133 Ki', 'ME-022', 'D', 990);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1800+ C', 'CMA-147', 'M', 991);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CyberPower 525VA(525', 'UP-018', 'D', 992);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-063', 'D', 993);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('SVA-USA VR-15B 15" T', 'MT-018', 'D', 994);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ c', 'CMA-130', 'M', 995);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Linksys Wireless Acc', 'NC-021', 'M', 996);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMDXP1800/128M/30G B', 'YS-019', 'M', 997);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 7000 32MB', 'VC-048', 'M', 998);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi Win 2000 Int', 'KB-006', 'M', 999);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6Gh', 'CMI-094', 'D', 1000);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LABTEC Internet Keyb', 'KB-008', 'M', 1001);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATX 300W High Qualit', 'CS-004', 'M', 1002);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 2.4 Ghz CPU', 'CP-004', 'D', 1003);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-087', 'M', 1004);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & GigaB', 'ABB-100', 'D', 1005);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('SVA-USA VR-15A 15" T', 'MT-002', 'D', 1006);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.1G', 'CMA-063', 'D', 1007);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.3Ghz & G', 'ABB-060', 'D', 1008);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400 Bi', 'CMA-154', 'M', 1009);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256MB DDR PC2700 Kin', 'ME-033', 'D', 1010);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi PS2 Keyboard', 'KB-005', 'D', 1011);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS 2 Port USB Pci c', 'NC-003', 'D', 1012);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-7VKMLE', 'MB-046', 'D', 1013);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb PC133 SDRam Mi', 'ME-014', 'D', 1014);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATA 100 RAID control', 'NC-016', 'D', 1015);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATA 100 Controller C', 'NC-015', 'D', 1016);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-112', 'M', 1017);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('9011 ATX Mid Server ', 'CS-009', 'M', 1018);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('USB to Parallel Prin', 'ML-001', 'M', 1019);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KIT Keyboard Mouse a', 'CS-012', 'M', 1020);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Matrox Dual Head G55', 'VC-031', 'D', 1021);
commit;
prompt 400 records committed...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ (Box) &', 'ABB-082', 'M', 1022);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKG M/B up', 'MB-022', 'D', 1023);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KDS 15" Flat Screen ', 'MT-016', 'D', 1024);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('128Mb PC2100 266Mhz ', 'ME-010', 'M', 1025);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS USB 4 Port Hub', 'NC-013', 'D', 1026);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512Mb SDRam PC133 Ki', 'ME-025', 'D', 1027);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1600+ CPU (OE', 'CP-033', 'M', 1028);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate 60GB 7200rpm', 'HD-036', 'M', 1029);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.3Ghz & G', 'ABB-077', 'D', 1030);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black LG Electronics', 'RD-007', 'M', 1031);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Serial ATA IDE Conne', 'ML-039', 'D', 1032);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & GigaB', 'ABB-009', 'D', 1033);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Gigab', 'ABB-078', 'M', 1034);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2700+ FBS 333', 'ABB-106', 'M', 1035);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6Gh', 'CMI-088', 'M', 1036);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.4Gh', 'CMI-098', 'M', 1037);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312D ATX color case(', 'CS-072', 'M', 1038);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-7VAXP AM', 'MB-052', 'M', 1039);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Gigab', 'ABB-061', 'D', 1040);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.4gh', 'CMI-119', 'D', 1041);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony 16X DVD-CDRom (', 'RD-029', 'D', 1042);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('WD Caviar 20.0G 7200', 'HD-015', 'D', 1043);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-8IPE1000', 'MB-056', 'D', 1044);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.3GHz', 'CP-003', 'M', 1045);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-6VEML sk', 'MB-045', 'D', 1046);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 4', 'CS-059', 'D', 1047);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('500W P4 Dual Fan Cod', 'CS-055', 'D', 1048);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-101', 'M', 1049);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.8Gh', 'IBB-035', 'M', 1050);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 9800 Pro ', 'VC-019', 'M', 1051);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-080', 'M', 1052);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2700+ C', 'CMA-135', 'M', 1053);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mircosoft Ergonomic ', 'KB-015', 'D', 1054);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2700+ Retail ', 'CP-005', 'D', 1055);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2200+ C', 'CMA-111', 'M', 1056);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('5ft Cat5 network cab', 'NC-023', 'M', 1057);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 406 Sub Woofer ', 'SK-016', 'D', 1058);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.3Ghz', 'IBB-005', 'M', 1059);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony 16X DVD-CDRom (', 'RD-029', 'M', 1060);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-076', 'M', 1061);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512mb DDR ECC Regist', 'ME-032', 'M', 1062);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;7Ghz + In', 'IBB-031', 'M', 1063);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Removeable ATA100 ha', 'ML-003', 'M', 1064);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate 20GB ATA100 ', 'HD-035', 'D', 1065);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('1.7Ghz Intel Celeron', 'CMI-080', 'D', 1066);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312D ATX color case(', 'CS-092', 'D', 1067);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6Gh', 'CMI-094', 'D', 1068);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.0Gh', 'CMI-100', 'M', 1069);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sound Blaster PC128 ', 'SC-003', 'D', 1070);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony 48x24x48 and 16', 'RD-038', 'D', 1071);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 7000 32MB', 'VC-048', 'M', 1072);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LG Goldstar 16X DVD ', 'RD-027', 'D', 1073);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6Gh', 'CMI-060', 'M', 1074);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radion 7000 64Mb', 'VC-035', 'D', 1075);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2000+ C', 'CMA-146', 'D', 1076);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('14inch LCD MG-015A X', 'MT-020', 'M', 1077);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.3GHz', 'CP-003', 'D', 1078);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2700+ C', 'CMA-141', 'D', 1079);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('YS Intel Celeron 1.1', 'YS-005', 'D', 1080);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMDXP2400/128M/30G B', 'YS-023', 'D', 1081);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony 48x24x40 and 16', 'RD-024', 'D', 1082);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312D ATX color case(', 'CS-008', 'D', 1083);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.4gh', 'CMI-108', 'M', 1084);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.4gh', 'IBB-040', 'D', 1085);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.1Ghz', 'IBB-033', 'M', 1086);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb DDRam PC2100 K', 'ME-024', 'D', 1087);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cyber Power 1250VA B', 'UP-011', 'M', 1088);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GigaByte G-Max Intel', 'SY-005', 'D', 1089);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Allied 300watt Power', 'CS-015', 'M', 1090);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Audio Cable.', 'ML-031', 'D', 1091);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Linksys USB Wireless', 'NC-020', 'M', 1092);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Visioneer 5800 48bit', 'SN-007', 'D', 1093);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-107', 'M', 1094);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VIK SKT A ', 'MB-004', 'M', 1095);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.3G', 'CMA-104', 'M', 1096);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black Complete Compu', 'YS-020', 'M', 1097);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ Box CPU', 'CP-007', 'M', 1098);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2700+ C', 'CMA-135', 'M', 1099);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6TSU M/B(30', 'MB-021', 'D', 1100);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1600+ CPU (OE', 'CP-033', 'M', 1101);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate Baraccuda 40', 'HD-024', 'D', 1102);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.3GHz', 'CP-003', 'M', 1103);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('MicroSoft Windows Se', 'SW-011', 'D', 1104);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313K 300W P4/AMD and', 'CS-020', 'M', 1105);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-084', 'D', 1106);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.1Ghz (11', 'CP-013', 'D', 1107);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black Complete Compu', 'YS-020', 'M', 1108);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 2000 Sub Woofer', 'SK-008', 'M', 1109);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMDXP2000+ Box Biost', 'CMA-152', 'M', 1110);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ Biostar', 'CMA-053', 'M', 1111);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Wireless O', 'KB-017', 'M', 1112);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LABTEC Internet Keyb', 'KB-008', 'D', 1113);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CyberDrive 40X16X48X', 'RD-026', 'M', 1114);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 52x 40 x 48 ', 'RD-037', 'D', 1115);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Copper', 'ML-011', 'M', 1116);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 1.44 Floppy ', 'FD-003', 'D', 1117);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('US Robotics 56K V.90', 'FM-011', 'D', 1118);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Allied 300watt Power', 'CS-015', 'M', 1119);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;6Ghz Box ', 'CP-026', 'D', 1120);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKD-Pro AM', 'MB-017', 'M', 1121);
commit;
prompt 500 records committed...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black Mitsumi CD-RW ', 'RD-034', 'M', 1122);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('OptoRite 48X16X48X C', 'RD-028', 'D', 1123);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CyberPower PhoneSave', 'UP-020', 'D', 1124);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312D ATX color case(', 'CS-072', 'D', 1125);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Front panel USB kit ', 'CS-018', 'M', 1126);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.9gh', 'CMI-069', 'M', 1127);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.7Gh', 'CMI-095', 'M', 1128);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CoolerMaster Thermal', 'ML-024', 'M', 1129);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CyberPower PhoneSave', 'UP-020', 'M', 1130);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 3000+ B', 'CMA-160', 'D', 1131);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2500+ Barton ', 'ABB-116', 'M', 1132);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD 1.1Ghz BareBone ', 'ABB-053', 'M', 1133);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 7500 PCI ', 'VC-023', 'D', 1134);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Assembly CPU/Fan; Mo', 'ML-035', 'D', 1135);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ c', 'CMA-130', 'M', 1136);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Printer Cable', 'ML-013', 'D', 1137);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-8IE800 I', 'MB-035', 'M', 1138);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ G', 'CMA-070', 'M', 1139);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Office 200', 'SW-014', 'M', 1140);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('128Mb RDRam 800Mhz K', 'ME-011', 'D', 1141);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.1/128M/3', 'YS-029', 'D', 1142);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mircosoft Ergonomic ', 'KB-015', 'M', 1143);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7TDR P4 M/B', 'MB-016', 'M', 1144);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium 4 2.0 ', 'CP-029', 'M', 1145);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ (OEM)', 'CP-002', 'D', 1146);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;7Ghz + In', 'IBB-031', 'D', 1147);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.0Gh', 'CMI-100', 'M', 1148);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi Win 2000 Int', 'KB-006', 'M', 1149);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2000 Bi', 'CMA-153', 'M', 1150);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2800+ Retail ', 'CP-002', 'D', 1151);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATA 100 RAID control', 'NC-016', 'M', 1152);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATA 100 RAID control', 'NC-016', 'M', 1153);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.3G', 'CMA-114', 'D', 1154);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.2Ghz', 'IBB-032', 'M', 1155);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.3G', 'CMA-150', 'D', 1156);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & Gigab', 'ABB-074', 'M', 1157);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Office XP ', 'SW-002', 'D', 1158);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GigaByte G-Max AMD F', 'SY-008', 'M', 1159);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKB Ver2.0', 'MB-007', 'M', 1160);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1800+ B', 'CMA-151', 'M', 1161);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('YS AMD XP 2000+ Perf', 'YS-010', 'D', 1162);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Linksys Wireless Acc', 'NC-021', 'M', 1163);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Dynatron MicroFin DC', 'ML-038', 'D', 1164);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Gigab', 'ABB-061', 'D', 1165);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ B', 'CMA-155', 'M', 1166);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.2G', 'CMA-149', 'M', 1167);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.0gh', 'CMI-104', 'D', 1168);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony 48x24x40 and 16', 'RD-024', 'M', 1169);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 3.0Ghz FSB ', 'CP-006', 'D', 1170);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1800+ c', 'CMA-116', 'D', 1171);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ Box w/F', 'ABB-069', 'D', 1172);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 1.44 Floppy ', 'FD-001', 'D', 1173);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Case Fan 3 1/2"(80mm', 'ML-029', 'M', 1174);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-132', 'D', 1175);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('C Rimm', 'ME-017', 'D', 1176);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar Mini BareBon', 'SY-012', 'D', 1177);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.9gh', 'CMI-069', 'D', 1178);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Printer Cable', 'ML-013', 'D', 1179);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & Biost', 'ABB-109', 'M', 1180);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CoolerMaster Thermal', 'ML-030', 'D', 1181);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Assembly CPU/Fan; Mo', 'ML-035', 'M', 1182);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6TWL skt 37', 'MB-010', 'M', 1183);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & Gigab', 'ABB-057', 'D', 1184);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('128Mb DDRam PC2100 K', 'ME-023', 'M', 1185);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 3.0gh', 'CMI-120', 'M', 1186);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('128Mb SDRAM PC133 Mi', 'ME-015', 'D', 1187);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KDS 15" Flat Screen ', 'MT-016', 'M', 1188);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ C', 'CMA-138', 'M', 1189);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GigaByte G-Max AMD F', 'SY-008', 'M', 1190);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 2.0Ghz', 'CP-040', 'D', 1191);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Creative Sound Blast', 'SC-010', 'D', 1192);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & Biost', 'ABB-109', 'D', 1193);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VLR skt 37', 'MB-008', 'M', 1194);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.3Ghz', 'IBB-005', 'D', 1195);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('10 Pack CD-R cd''s Co', 'RD-011', 'D', 1196);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Front panel USB kit ', 'CS-018', 'M', 1197);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('319A ATX case 400W P', 'CS-007', 'D', 1198);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows XP Pro Regis', 'SW-010', 'D', 1199);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & GigaB', 'ABB-100', 'D', 1200);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2700+ FBS 333', 'ABB-106', 'M', 1201);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;7Ghz + In', 'IBB-031', 'M', 1202);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KIT with Mistumi Int', 'CS-099', 'D', 1203);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Surge protector', 'ML-018', 'M', 1204);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Epson Stylus C42UX -', 'PT-003', 'M', 1205);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VCF MICRO ', 'MB-029', 'M', 1206);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb DDR 333 PC2700', 'ME-031', 'M', 1207);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256MB DDR 400 (PC320', 'ME-019', 'D', 1208);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.3G', 'CMA-114', 'D', 1209);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Creative Sound Blast', 'SC-009', 'D', 1210);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Gigab', 'ABB-089', 'M', 1211);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7SXD P4 M/B', 'MB-006', 'M', 1212);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP1800 Biostar M', 'CMA-039', 'M', 1213);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('219L ATX color Case ', 'CS-046', 'D', 1214);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GA-8LD533 Intel®845G', 'MB-050', 'M', 1215);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cyber Power 725VA Ba', 'UP-005', 'M', 1216);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel D845PEBT2 P4 M', 'MB-111', 'M', 1217);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb PC133 SDRam Mi', 'ME-014', 'M', 1218);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate 120GB Serial', 'HD-017', 'D', 1219);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-158', 'M', 1220);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate 60GB 7200rpm', 'HD-036', 'D', 1221);
commit;
prompt 600 records committed...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS USB2000 USB Turb', 'NC-001', 'D', 1222);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.7Gh', 'IBB-020', 'M', 1223);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ (', 'CMA-072', 'D', 1224);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('8012 Black case with', 'CS-032', 'D', 1225);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ C', 'CMA-128', 'D', 1226);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD 1.1Ghz Starter S', 'YS-006', 'M', 1227);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows XP Pro Regis', 'SW-010', 'M', 1228);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P3 1.13 GMhz F', 'CP-041', 'D', 1229);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CyberPower 525VA(525', 'UP-018', 'D', 1230);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312J ATX Case with 4', 'CS-066', 'M', 1231);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('M7SXF P4 478pin Moth', 'MB-028', 'M', 1232);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GeForceFX 5200 128MB', 'VC-025', 'D', 1233);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb DDR 333 PC2700', 'ME-031', 'D', 1234);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.0 Gh', 'CP-044', 'D', 1235);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.4gh', 'IBB-111', 'M', 1236);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ASUS A7N8X Deluxe NV', 'MB-011', 'M', 1237);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2200+ C', 'CMA-111', 'M', 1238);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-106', 'D', 1239);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Socket', 'ML-027', 'D', 1240);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ G', 'CMA-070', 'M', 1241);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Logitech Optical Mou', 'MS-009', 'M', 1242);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Antec PFII Series 10', 'CS-057', 'M', 1243);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Antec Plus 660 ATX M', 'CS-042', 'D', 1244);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Gigab', 'ABB-073', 'D', 1245);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi PS/2 Net scr', 'MS-002', 'D', 1246);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2600+ & Biost', 'ABB-114', 'M', 1247);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb DDRam PC2100 K', 'ME-024', 'D', 1248);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 3', 'CS-010', 'D', 1249);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Epson Stylus C42UX -', 'PT-003', 'D', 1250);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('400 Watt UL ATX Powe', 'CS-003', 'D', 1251);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ c', 'CMA-122', 'M', 1252);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('DVI to 15pin CRT ada', 'VC-041', 'D', 1253);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ (', 'CMA-110', 'D', 1254);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('BIOSTAR M6TSL skt370', 'MB-011', 'D', 1255);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LABTEC Cordless Desk', 'KB-009', 'M', 1256);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('400 Watt UL ATX Powe', 'CS-003', 'M', 1257);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 3.0Ghz FSB ', 'CP-006', 'M', 1258);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-096', 'D', 1259);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master ATA133', 'ML-023', 'M', 1260);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312J ATX Case with 4', 'CS-066', 'M', 1261);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;6Ghz Bare', 'IBB-022', 'D', 1262);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.7gh', 'IBB-044', 'D', 1263);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-014', 'M', 1264);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.0Gh', 'CMI-097', 'M', 1265);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.7gh', 'IBB-044', 'D', 1266);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313F-B ATX case 400W', 'CS-043', 'D', 1267);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ CPU Oem', 'CP-047', 'D', 1268);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cable/DSL Broadband ', 'NC-027', 'D', 1269);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-056', 'M', 1270);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.7gh', 'CMI-068', 'D', 1271);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 3000+ B', 'CMA-160', 'D', 1272);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400 Bi', 'CMA-154', 'M', 1273);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('128Mb RDRam 800Mhz K', 'ME-011', 'D', 1274);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CyberPower 525VA(525', 'UP-018', 'D', 1275);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate 120GB Serial', 'HD-017', 'D', 1276);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-158', 'D', 1277);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Internet K', 'KB-013', 'M', 1278);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 48x 12 x 40 ', 'RD-030', 'M', 1279);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Wireless O', 'MS-006', 'M', 1280);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AOC 17" Monitor 7Elr', 'MT-005', 'D', 1281);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VLB Intel ', 'MB-014', 'M', 1282);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & Gigab', 'ABB-062', 'M', 1283);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VLB Intel ', 'MB-014', 'D', 1284);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KDS 15" Flat Screen ', 'MT-016', 'D', 1285);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATA 100 RAID control', 'NC-016', 'D', 1286);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ (Box) &', 'ABB-082', 'D', 1287);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Round ', 'ML-017', 'D', 1288);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 1.44 Floppy ', 'FD-003', 'D', 1289);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 9600 256M', 'VC-034', 'D', 1290);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LABTEC Cordless Desk', 'KB-009', 'M', 1291);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;8Ghz (478', 'CP-015', 'D', 1292);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 3', 'CS-010', 'D', 1293);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-087', 'D', 1294);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-096', 'D', 1295);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Achieve Gold Dual Fa', 'CS-058', 'M', 1296);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & Gigab', 'ABB-055', 'D', 1297);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GigaByte 7N400Pro An', 'ABB-011', 'D', 1298);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('219L ATX color Case ', 'CS-046', 'M', 1299);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATA 100 RAID control', 'NC-016', 'D', 500);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 7000 32MB', 'VC-048', 'D', 501);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.8ghz', 'IBB-008', 'D', 502);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Creative Sound Blast', 'SC-010', 'D', 503);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS Technologies Fir', 'VC-015', 'D', 504);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-081', 'D', 505);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;8Ghz (478', 'CP-015', 'M', 506);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LABTEC Cordless Desk', 'KB-009', 'D', 507);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('W.D 80.0Gb 7200rpm A', 'HD-022', 'M', 508);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ Box & G', 'ABB-058', 'D', 509);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-103', 'M', 510);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7SXD P4 M/B', 'MB-006', 'D', 511);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2000+ C', 'CMA-161', 'D', 512);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 2.4ghz', 'IBB-042', 'M', 513);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cyber Power 1000VA B', 'UP-017', 'D', 514);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313K 300W P4/AMD and', 'CS-020', 'D', 515);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2600+ FBS 333', 'ABB-105', 'M', 516);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-112', 'D', 517);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('W.D 120G 7200RPM (12', 'HD-012', 'M', 518);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 2', 'CS-078', 'M', 519);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-7VAXP AM', 'MB-052', 'D', 520);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;6Ghz Bare', 'IBB-022', 'D', 521);
commit;
prompt 700 records committed...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ C', 'CMA-128', 'D', 522);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black RF Wireless Ke', 'KB-018', 'M', 523);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-103', 'M', 524);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ C', 'CMA-162', 'M', 525);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony Black 16X DVD .', 'RD-014', 'D', 526);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Gigab', 'ABB-078', 'D', 527);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;7Ghz + In', 'IBB-031', 'M', 528);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ASUS A7N8X Deluxe NV', 'MB-011', 'D', 529);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb PC133 SDRam Mi', 'ME-014', 'M', 530);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.3G', 'CMA-114', 'M', 531);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.4gh', 'IBB-114', 'M', 532);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-110', 'M', 533);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Copper', 'ML-011', 'D', 534);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6Gh', 'CMI-088', 'M', 535);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel D845PESV P4 M/', 'MB-002', 'M', 536);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CyberPower Surge Pro', 'UP-019', 'D', 537);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Socket', 'ML-027', 'D', 538);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6TSU M/B(30', 'MB-021', 'M', 539);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KIT Keyboard Mouse a', 'CS-012', 'D', 540);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('PCI 56K V.92 Fax Mod', 'FM-010', 'M', 541);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('YS Intel P4 2.0Ghz P', 'YS-015', 'D', 542);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LABTEC Cordless Desk', 'KB-009', 'D', 543);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS USB Turbo 2.0 We', 'VC-022', 'M', 544);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 2000 Sub Woofer', 'SK-008', 'D', 545);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Biost', 'ABB-113', 'M', 546);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KIT Keyboard Mouse a', 'CS-025', 'D', 547);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2400+ FBS 333', 'ABB-104', 'M', 548);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6TSU M/B(30', 'MB-021', 'M', 549);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GigaByte 7N400Pro An', 'ABB-011', 'D', 550);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb DDR 333 PC2700', 'ME-031', 'D', 551);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1700+ c', 'CMA-100', 'D', 552);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('8012 Black case with', 'CS-032', 'D', 553);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD 1.1Ghz Starter S', 'YS-006', 'M', 554);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 2.4 Ghz CPU', 'CP-004', 'M', 555);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Logitech Optical Mou', 'MS-009', 'D', 556);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Boka 1050 Sub Woofer', 'SK-014', 'D', 557);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKD-Pro AM', 'MB-017', 'D', 558);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CP-691 Stereo Speake', 'SK-004', 'M', 559);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black Mitsumi CD-RW ', 'RD-034', 'D', 560);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.0gh', 'IBB-037', 'D', 561);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMDXP2200/128M/30G B', 'YS-022', 'D', 562);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Office XP ', 'SW-002', 'D', 563);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.8Ghz', 'CP-025', 'D', 564);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-112', 'M', 565);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar Mini BareBon', 'sy-006', 'D', 566);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ Retail ', 'CP-048', 'M', 567);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ C', 'CMA-131', 'D', 568);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Wireless O', 'MS-006', 'M', 569);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & GigaB', 'ABB-100', 'M', 570);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('YS Intel Celeron 1.1', 'YS-005', 'D', 571);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ CPU (oe', 'CP-043', 'D', 572);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 7000 32MB', 'VC-037', 'D', 573);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313K 300W P4/AMD and', 'CS-020', 'M', 574);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony 48x24x48 and 16', 'RD-038', 'M', 575);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ c', 'CMA-122', 'M', 576);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.8gh', 'IBB-112', 'M', 577);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313D Black 400W P4/A', 'CS-053', 'M', 578);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.7Ghz', 'YS-024', 'M', 579);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ (Box) &', 'ABB-065', 'D', 580);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Dynatron CPU Cooler ', 'ML-037', 'M', 581);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Assembly CPU/Fan; Mo', 'ML-035', 'D', 582);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 7000 32MB', 'VC-037', 'D', 583);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2400+ FBS 333', 'ABB-104', 'D', 584);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mouse Pad', 'ML-002', 'M', 585);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CNet External 56k V.', 'FM-008', 'D', 586);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.1Ghz', 'IBB-033', 'D', 587);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2200+( ', 'CMA-108', 'M', 588);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.4gh', 'IBB-108', 'D', 589);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Promise Fast Track A', 'NC-017', 'D', 590);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('White RF Wireless Ke', 'KB-004', 'M', 591);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.0gh', 'CMI-015', 'M', 592);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony 48x24x40 and 16', 'RD-024', 'M', 593);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Ball B', 'ML-028', 'M', 594);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('C Rimm', 'ME-017', 'D', 595);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Windows XP', 'SW-007', 'D', 596);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS External USB 2.0', 'NC-010', 'M', 597);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel D 850MV P4 M/B', 'MB-001', 'D', 598);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ Box w/F', 'CP-019', 'M', 599);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Fast Ethernet 10/100', 'NC-012', 'D', 600);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black LG Electronics', 'RD-007', 'D', 601);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black Mitsumi CD-RW ', 'RD-034', 'M', 602);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.0gh', 'IBB-039', 'M', 603);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Gigab', 'ABB-083', 'D', 604);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Office XP ', 'SW-002', 'M', 605);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1700+ & Gigab', 'ABB-089', 'D', 606);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.2G', 'CMA-107', 'D', 607);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMDXP1800/128M/30G B', 'YS-019', 'D', 608);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-014', 'M', 609);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.8gh', 'IBB-010', 'M', 610);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ASUS P4SDX SiS655 Ch', 'MB-012', 'M', 611);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512MB DDR PC3200 Kin', 'ME-017', 'D', 612);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-8SG800 M', 'MB-057', 'D', 613);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-106', 'D', 614);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312J ATX color case(', 'CS-095', 'M', 615);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Assembly & Testing o', 'ML-999', 'M', 616);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-8IE533 I', 'MB-051', 'D', 617);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.7Gh', 'CMI-095', 'M', 618);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-013', 'D', 619);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ c', 'CMA-117', 'M', 620);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512Mb DDR PC2100 Kin', 'ME-016', 'D', 621);
commit;
prompt 800 records committed...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.2G', 'CMA-113', 'D', 622);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Creative Sound Blast', 'SC-010', 'D', 623);
commit;
prompt 802 records loaded
prompt Loading SUPPLYSDELIVERY...
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000000, '90 Gifu Road', 100);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000001, '15 Ward Street', 101);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000002, '653 Englewood Cliffs', 102);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000003, '51 Oslo Drive', 103);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000004, '44 McIntosh Street', 104);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000005, '35 Damon Street', 105);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000006, '56 Chazz Street', 106);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000007, '95 Freda Ave', 107);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000008, '140 Summerside Stree', 108);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000009, '16 Kozani', 109);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000010, '343 Dorn Street', 110);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000011, '44 Law Street', 111);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000012, '41st Street', 112);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000013, '30 Kadison Street', 113);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000014, '92 Spall Street', 114);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000015, '30 Saudarkrokur Road', 115);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000016, '122 Mablethorpe Driv', 116);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000017, '87 North Wales Ave', 117);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000018, '78 White Road', 118);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000019, '41st Street', 119);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000020, '77 Biel Blvd', 120);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000021, '576 Harrisburg Drive', 121);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000022, '33rd Street', 122);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000023, '712 Carrie Street', 123);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000024, '16 Lennox Street', 124);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000025, '42 Turner Road', 125);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000026, '71 Murdock Drive', 126);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000027, '57 Balthazar Street', 127);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000028, '99 Brooke Blvd', 128);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000029, '45 Sledge Blvd', 129);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000030, '336 Warsaw Road', 130);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000031, '387 Kloten Blvd', 131);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000032, '75 Cruz Road', 132);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000033, '70 Nelly Blvd', 133);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000034, '53 Sydney Street', 134);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000035, '84 Weisz', 135);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000036, '11st Street', 136);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000037, '92 Malcolm Drive', 137);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000038, '626 Laredo Road', 138);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000039, '23 Seth Drive', 139);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000040, '40 Campbell Road', 140);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000041, '73 Regina Road', 141);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000042, '54 Stallone Street', 142);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000043, '63 Cyndi Blvd', 143);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000044, '22 Quinones Road', 144);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000045, '802 McConaughey Road', 145);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000046, '28 Madeline Road', 146);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000047, '37 Portland Drive', 147);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000048, '40 Garner Blvd', 148);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000049, '10 Ottawa Blvd', 149);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000050, '473 Winger Street', 150);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000051, '397 Jonny Lee Street', 151);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000052, '30 Johansson', 152);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000053, '349 Cross', 153);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000054, '54 Spencer Street', 154);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000055, '68 Rizzo Street', 155);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000056, '72 Savage', 156);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000057, '87 Portland Drive', 157);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000058, '62nd Street', 158);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000059, '928 Braintree Ave', 159);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000060, '45 Vincent Road', 160);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000061, '78 Dean Street', 161);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000062, '87 Paul Street', 162);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000063, '57 Blanchett Street', 163);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000064, '92nd Street', 164);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000065, '906 Chaka Road', 165);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000066, '88 Horton Ave', 166);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000067, '23 Balin Drive', 167);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000068, '652 Copeland Ave', 168);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000069, '88 Newton Ave', 169);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000070, '88 Ball Road', 170);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000071, '44 Samrand Street', 171);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000072, '27 Assante Street', 172);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000073, '25 Chemnitz', 173);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000074, '62nd Street', 174);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000075, '35 Kirkwood Road', 175);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000076, '3 Derrick Street', 176);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000077, '857 Posener Street', 177);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000078, '41 Wayman Road', 178);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000079, '81st Street', 179);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000080, '674 Hatfield Street', 180);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000081, '15 Media Drive', 181);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000082, '32 Sarandon Street', 182);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000083, '367 Gil Ave', 183);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000084, '83 Holeman Road', 184);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000085, '7 Malm? Street', 185);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000086, '71 Zevon Street', 186);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000087, '215 Jesse Road', 187);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000088, '895 Ricardo Road', 188);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000089, '96 Love Ave', 189);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000090, '58 Gleeson Street', 190);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000091, '81 Orlando Ave', 191);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000092, '43rd Street', 192);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000093, '8 Eugene Street', 193);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000094, '11 Luke', 194);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000095, '76 Walker Blvd', 195);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000096, '63rd Street', 196);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000097, '66 Treviso Road', 197);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000098, '88 Jackman Ave', 198);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000099, '25 Marc Road', 199);
commit;
prompt 100 records committed...
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000100, '86 Steagall Road', 200);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000101, '195 Glover Blvd', 201);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000102, '631 Chung Street', 202);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000103, '970 Ellicott City St', 203);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000104, '47 Kanazawa Road', 204);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000105, '23rd Street', 205);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000106, '60 Vaughan Street', 206);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000107, '11 Glen Cove Drive', 207);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000108, '92 Bale Street', 208);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000109, '64 Peachtree City Ro', 209);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000110, '8 King Blvd', 210);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000111, '79 Victoria Road', 211);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000112, '63rd Street', 212);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000113, '82nd Street', 213);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000114, '69 Seatle Street', 214);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000115, '75 Juazeiro Street', 215);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000116, '41 Smurfit Street', 216);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000117, '321 Salt Street', 217);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000118, '143 Gerald', 218);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000119, '78 Squier Street', 219);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000120, '272 St-bruno Blvd', 220);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000121, '180 Dean Street', 221);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000122, '359 Dorn Blvd', 222);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000123, '55 Hannover Road', 223);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000124, '81 Haynes Street', 224);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000125, '53 Adelaide Road', 225);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000126, '69 Stevens Road', 226);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000127, '61 Elliott Ave', 227);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000128, '45 Neneh Road', 228);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000129, '91 Branagh Ave', 229);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000130, '52 Oliver', 230);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000131, '62 Jamal Street', 231);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000132, '744 Palmer Road', 232);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000133, '77 Schlieren Street', 233);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000134, '1 B?nes Road', 234);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000135, '74 McCann Drive', 235);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000136, '18 Ceasar Blvd', 236);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000137, '20 Macau', 237);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000138, '587 MacPherson Road', 238);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000139, '50 Reston Road', 239);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000140, '155 Rossellini Blvd', 240);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000141, '79 Harvey Street', 241);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000142, '4 Johor Bahru Ave', 242);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000143, '80 Bush Road', 243);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000144, '96 Neuwirth Street', 244);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000145, '21st Street', 245);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000146, '29 Loggia Ave', 246);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000147, '69 Thomas Road', 247);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000148, '19 Radney Drive', 248);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000149, '22 Kitty Road', 249);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000150, '18 Pitney Street', 250);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000151, '94 Ramirez Drive', 251);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000152, '13 Phillippe', 252);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000153, '73 Belinda Street', 253);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000154, '79 Coward Drive', 254);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000155, '10 Douala Ave', 255);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000156, '83 Waite Park Road', 256);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000157, '38 Soda Drive', 257);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000158, '81st Street', 258);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000159, '94 Winans Ave', 259);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000160, '800 Hedaya Road', 260);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000161, '582 Vannelli Road', 261);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000162, '40 Brosnan Street', 262);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000163, '26 Close Road', 263);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000164, '31 Jena Street', 264);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000165, '91 Rochester Road', 265);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000166, '27 Macht Drive', 266);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000167, '2 Tisdale Street', 267);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000168, '56 Paisley Street', 268);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000169, '40 Clint', 269);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000170, '84 Jay Drive', 270);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000171, '72 Lattimore Drive', 271);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000172, '74 Gerald Road', 272);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000173, '33 Fisher Street', 273);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000174, '43 Duesseldorf Road', 274);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000175, '48 K?benhavn Road', 275);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000176, '17 Charlottesville R', 276);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000177, '25 Price Road', 277);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000178, '67 Kudrow Road', 278);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000179, '61 Whitman Road', 279);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000180, '71st Street', 280);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000181, '96 Lake Oswego Stree', 281);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000182, '11 Emmett Ave', 282);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000183, '85 Holly Drive', 283);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000184, '21 Wopat Drive', 284);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000185, '67 Lachey Street', 285);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000186, '86 Faithfull Road', 286);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000187, '34 Hewett Street', 287);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000188, '8 Moore Street', 288);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000189, '585 Ashdod Street', 289);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000190, '621 Redondo beach Av', 290);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000191, '32nd Street', 291);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000192, '78 Briscoe Street', 292);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000193, '23 B?nes Road', 293);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000194, '73 Karon Blvd', 294);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000195, '997 Gill Drive', 295);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000196, '67 Kurtwood Street', 296);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000197, '49 Leary Road', 297);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000198, '247 Barry Ave', 298);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000199, '72nd Street', 299);
commit;
prompt 200 records committed...
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000200, '88 Mablethorpe Road', 300);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000201, '10 Colm Drive', 301);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000202, '62 Springville Drive', 302);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000203, '35 Carrack Street', 303);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000204, '390 Pfeiffer Street', 304);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000205, '43 Tottori', 305);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000206, '67 Whitley Street', 306);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000207, '91 Kenny', 307);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000208, '94 Lin Street', 308);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000209, '893 Archer Road', 309);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000210, '69 L''union Blvd', 310);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000211, '88 Nielsen Road', 311);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000212, '65 Treviso Drive', 312);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000213, '58 P?tion-ville Road', 313);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000214, '88 Phoenix Road', 314);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000215, '9 Madison Road', 315);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000216, '31st Street', 316);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000217, '77 Graham Street', 317);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000218, '51st Street', 318);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000219, '7 Whitley Drive', 319);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000220, '52 Cheryl Street', 320);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000221, '86 Rick Road', 321);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000222, '516 McDormand Drive', 322);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000223, '60 Nelson Blvd', 323);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000224, '30 Lynskey Drive', 324);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000225, '648 Daniels Drive', 325);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000226, '47 Jesus Street', 326);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000227, '142 Pat Street', 327);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000228, '80 Ledger Road', 328);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000229, '93 Lubbock Blvd', 329);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000230, '32 Conway Road', 330);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000231, '540 Farrow Street', 331);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000232, '32nd Street', 332);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000233, '12 Raymond Street', 333);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000234, '17 Shannyn Street', 334);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000235, '40 Holliston Ave', 335);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000236, '88 Reilly Blvd', 336);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000237, '74 DeVita Road', 337);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000238, '30 Getty Drive', 338);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000239, '28 Harsum Drive', 339);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000240, '28 Barnett Street', 340);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000241, '11st Street', 341);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000242, '46 Brooks Street', 342);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000243, '88 Black Blvd', 343);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000244, '50 Gainesville Drive', 344);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000245, '38 Ian Drive', 345);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000246, '52 Vassar', 346);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000247, '85 Ike Drive', 347);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000248, '33 Anyang-si Drive', 348);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000249, '21 Bonn Road', 349);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000250, '12 Ali Road', 350);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000251, '99 Judd Street', 351);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000252, '228 Fredericia Drive', 352);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000253, '83 Chely Road', 353);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000254, '70 Thewlis Road', 354);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000255, '9 Aiken Road', 355);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000256, '41 Rhea Drive', 356);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000257, '306 Shawn Drive', 357);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000258, '96 Nepean Street', 358);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000259, '583 Enfield Road', 359);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000260, '66 Moreno Street', 360);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000261, '70 Leslie Street', 361);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000262, '576 Kristin Street', 362);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000263, '103 Ponce Ave', 363);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000264, '19 Redwood City Stre', 364);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000265, '426 Mann Road', 365);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000266, '58 Tate Ave', 366);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000267, '50 Beckham Drive', 367);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000268, '95 Zeta-Jones Blvd', 368);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000269, '35 Carla Blvd', 369);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000270, '19 Smurfit Street', 370);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000271, '4 Harold', 371);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000272, '34 Jaime Blvd', 372);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000273, '23rd Street', 373);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000274, '97 Maarssen Road', 374);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000275, '33rd Street', 375);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000276, '84 Spector Street', 376);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000277, '41 Tobolowsky Blvd', 377);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000278, '54 Villata Road', 378);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000279, '72 Ving Street', 379);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000280, '6 Murphy Road', 380);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000281, '88 Fiorentino Street', 381);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000282, '20 Sedaka Street', 382);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000283, '5 Hershey Road', 383);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000284, '38 Fort Lewis Road', 384);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000285, '79 Zane Road', 385);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000286, '23 Giamatti Drive', 386);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000287, '31 Doucette Ave', 387);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000288, '61 Geraldine Ave', 388);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000289, '49 George Road', 389);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000290, '42nd Street', 390);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000291, '226 Freising Road', 391);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000292, '7 Chet Road', 392);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000293, '87 McCormack Street', 393);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000294, '61 Raitt Street', 394);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000295, '52nd Street', 395);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000296, '36 Pierce Road', 396);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000297, '11 Briscoe Street', 397);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000298, '2 Anchorage Road', 398);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000299, '53 Stills Street', 399);
commit;
prompt 300 records committed...
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000300, '31 McGovern Street', 400);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000301, '37 Shawn Road', 401);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000302, '27 Rockland Ave', 402);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000303, '24 Tate Blvd', 403);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000304, '36 Harrison Drive', 404);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000305, '110 Eric Road', 405);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000306, '73 Tallahassee Drive', 406);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000307, '265 Gleeson Street', 407);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000308, '12nd Street', 408);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000309, '60 Connick Street', 409);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000310, '956 Wood Street', 410);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000311, '22nd Street', 411);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000312, '1 Shearer Ave', 412);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000313, '15 Avril Blvd', 413);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000314, '968 Baldwin Street', 414);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000315, '653 Newman Ave', 415);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000316, '3 Monk Drive', 416);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000317, '79 Shelton Blvd', 417);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000318, '692 Wopat Ave', 418);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000319, '34 Goran Street', 419);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000320, '92nd Street', 420);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000321, '27 Merrilee Street', 421);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000322, '11 Kyunnam Road', 422);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000323, '92 Biella Road', 423);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000324, '49 Heiligenhaus Driv', 424);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000325, '50 Conners Ave', 425);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000326, '100 Laurence Ave', 426);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000327, '64 Zeta-Jones Street', 427);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000328, '41 Tallahassee Stree', 428);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000329, '614 Hynde Blvd', 429);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000330, '12 Farina Blvd', 430);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000331, '77 Key Biscayne Driv', 431);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000332, '32 Black Drive', 432);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000333, '93 Janssen Street', 433);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000334, '254 Sevigny Street', 434);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000335, '8 Jackson Road', 435);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000336, '57 Coe Street', 436);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000337, '14 Connick Road', 437);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000338, '1 Barrymore Street', 438);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000339, '171 Flanagan Street', 439);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000340, '54 Etta Drive', 440);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000341, '76 Statham Street', 441);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000342, '31st Street', 442);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000343, '255 Kungki Road', 443);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000344, '72nd Street', 444);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000345, '90 Johansen Road', 445);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000346, '22 Toni', 446);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000347, '31 Sandler Road', 447);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000348, '89 Carrack Street', 448);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000349, '11st Street', 449);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000350, '84 Leverkusen Drive', 450);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000351, '92 Cochran Drive', 451);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000352, '66 Lisbon Ave', 452);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000353, '92 Oak park Drive', 453);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000354, '19 Kyoto Road', 454);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000355, '68 Olympia Ave', 455);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000356, '66 Noseworthy Blvd', 456);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000357, '88 Ann Arbor Road', 457);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000358, '66 Marianne Drive', 458);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000359, '553 Beckham Street', 459);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000360, '637 Kathy Blvd', 460);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000361, '68 Waalwijk Drive', 461);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000362, '62nd Street', 462);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000363, '14 Campbell Street', 463);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000364, '79 Cara Road', 464);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000365, '84 Sale Road', 465);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000366, '23 Coughlan Drive', 466);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000367, '36 Chestnut Street', 467);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000368, '73 LaMond Street', 468);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000369, '56 W?rth Street', 469);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000370, '30 Anyang-si Street', 470);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000371, '142 Dourif Road', 471);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000372, '374 Rhodes Ave', 472);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000373, '861 Chris Blvd', 473);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000374, '90 Rickles Street', 474);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000375, '57 Myers Road', 475);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000376, '98 Cara', 476);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000377, '28 Griffiths Road', 477);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000378, '95 Winter', 478);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000379, '32 Donna', 479);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000380, '12 Oberwangen Drive', 480);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000381, '96 Cattrall Street', 481);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000382, '830 Delafield Ave', 482);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000383, '11st Street', 483);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000384, '73 Singletary Street', 484);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000385, '662 Vinton', 485);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000386, '66 Ike', 486);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000387, '72nd Street', 487);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000388, '18 Sant Cugat Del Va', 488);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000389, '27 McBride Drive', 489);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000390, '5 Underwood Ave', 490);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000391, '35 Tilburg Street', 491);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000392, '357 Sevilla Drive', 492);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000393, '636 Neuquen Drive', 493);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000394, '24 Derrick Street', 494);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000395, '72 Desmond Drive', 495);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 2000000396, '598 Dalmine Street', 496);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000397, '247 Maxwell Road', 497);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000398, '38 Fleet Street', 498);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 2000000399, '33rd Street', 499);
commit;
prompt 400 records loaded
prompt Loading COMMUNITYMEMBER...
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001200, 100, 500, 701);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001201, 101, 501, 702);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001202, 102, 502, 703);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001203, 103, 503, 704);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001204, 104, 504, 705);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001205, 105, 505, 706);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001206, 106, 506, 707);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001207, 107, 507, 708);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001208, 108, 508, 709);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001209, 109, 509, 710);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001210, 110, 510, 711);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001211, 111, 511, 712);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001212, 112, 512, 713);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001213, 113, 513, 714);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001214, 114, 514, 715);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001215, 115, 515, 716);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001216, 116, 516, 717);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001217, 117, 517, 718);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001218, 118, 518, 719);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001219, 119, 519, 720);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001220, 120, 520, 721);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001221, 121, 521, 722);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001222, 122, 522, 723);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001223, 123, 523, 724);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001224, 124, 524, 725);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001225, 125, 525, 726);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001226, 126, 526, 727);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001227, 127, 527, 728);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001228, 128, 528, 729);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001229, 129, 529, 730);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001230, 130, 530, 731);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001231, 131, 531, 732);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001232, 132, 532, 733);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001233, 133, 533, 734);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001234, 134, 534, 735);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001235, 135, 535, 736);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001236, 136, 536, 737);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001237, 137, 537, 738);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001238, 138, 538, 739);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001239, 139, 539, 740);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001240, 140, 540, 741);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001241, 141, 541, 742);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001242, 142, 542, 743);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001243, 143, 543, 744);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001244, 144, 544, 745);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001245, 145, 545, 746);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001246, 146, 546, 747);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001247, 147, 547, 748);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001248, 148, 548, 749);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001249, 149, 549, 750);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001250, 150, 550, 751);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001251, 151, 551, 752);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001252, 152, 552, 753);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001253, 153, 553, 754);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001254, 154, 554, 755);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001255, 155, 555, 756);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001256, 156, 556, 757);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001257, 157, 557, 758);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001258, 158, 558, 759);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001259, 159, 559, 760);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001260, 160, 560, 761);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001261, 161, 561, 762);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001262, 162, 562, 763);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001263, 163, 563, 764);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001264, 164, 564, 765);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001265, 165, 565, 766);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001266, 166, 566, 767);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001267, 167, 567, 768);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001268, 168, 568, 769);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001269, 169, 569, 770);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001270, 170, 570, 771);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001271, 171, 571, 772);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001272, 172, 572, 773);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001273, 173, 573, 774);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001274, 174, 574, 775);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001275, 175, 575, 776);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001276, 176, 576, 777);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001277, 177, 577, 778);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001278, 178, 578, 779);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001279, 179, 579, 780);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001280, 180, 580, 781);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001281, 181, 581, 782);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001282, 182, 582, 783);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001283, 183, 583, 784);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001284, 184, 584, 785);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001285, 185, 585, 786);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001286, 186, 586, 787);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001287, 187, 587, 788);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001288, 188, 588, 789);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001289, 189, 589, 790);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001290, 190, 590, 791);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001291, 191, 591, 792);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001292, 192, 592, 793);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001293, 193, 593, 794);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001294, 194, 594, 795);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001295, 195, 595, 796);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001296, 196, 596, 797);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001297, 197, 597, 798);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001298, 198, 598, 799);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001299, 199, 599, 800);
commit;
prompt 100 records committed...
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001300, 200, 600, 801);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001301, 201, 601, 802);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001302, 202, 602, 803);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001303, 203, 603, 804);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001304, 204, 604, 805);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001305, 205, 605, 806);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001306, 206, 606, 807);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001307, 207, 607, 808);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001308, 208, 608, 809);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001309, 209, 609, 810);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001310, 210, 610, 811);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001311, 211, 611, 812);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001312, 212, 612, 813);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001313, 213, 613, 814);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001314, 214, 614, 815);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001315, 215, 615, 816);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001316, 216, 616, 817);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001317, 217, 617, 818);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001318, 218, 618, 819);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001319, 219, 619, 820);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001320, 220, 620, 821);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001321, 221, 621, 822);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001322, 222, 622, 823);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001323, 223, 623, 824);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001324, 224, 624, 825);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001325, 225, 625, 826);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001326, 226, 626, 827);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001327, 227, 627, 828);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001328, 228, 628, 829);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001329, 229, 629, 830);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001330, 230, 630, 831);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001331, 231, 631, 832);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001332, 232, 632, 833);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001333, 233, 633, 834);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001334, 234, 634, 835);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001335, 235, 635, 836);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001336, 236, 636, 837);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001337, 237, 637, 838);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001338, 238, 638, 839);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001339, 239, 639, 840);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001340, 240, 640, 841);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001341, 241, 641, 842);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001342, 242, 642, 843);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001343, 243, 643, 844);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001344, 244, 644, 845);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001345, 245, 645, 846);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001346, 246, 646, 847);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001347, 247, 647, 848);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001348, 248, 648, 849);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001349, 249, 649, 850);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001350, 250, 650, 851);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001351, 251, 651, 852);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001352, 252, 652, 853);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001353, 253, 653, 854);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001354, 254, 654, 855);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001355, 255, 655, 856);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001356, 256, 656, 857);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001357, 257, 657, 858);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001358, 258, 658, 859);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001359, 259, 659, 860);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001360, 260, 660, 861);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001361, 261, 661, 862);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001362, 262, 662, 863);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001363, 263, 663, 864);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001364, 264, 664, 865);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001365, 265, 665, 866);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001366, 266, 666, 867);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001367, 267, 667, 868);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001368, 268, 668, 869);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001369, 269, 669, 870);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001370, 270, 670, 871);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001371, 271, 671, 872);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001372, 272, 672, 873);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001373, 273, 673, 874);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001374, 274, 674, 875);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001375, 275, 675, 876);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001376, 276, 676, 877);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001377, 277, 677, 878);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001378, 278, 678, 879);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001379, 279, 679, 880);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001380, 280, 680, 881);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001381, 281, 681, 882);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001382, 282, 682, 883);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001383, 283, 683, 884);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001384, 284, 684, 885);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001385, 285, 685, 886);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001386, 286, 686, 887);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001387, 287, 687, 888);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001388, 288, 688, 889);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001389, 289, 689, 890);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001390, 290, 690, 891);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001391, 291, 691, 892);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001392, 292, 692, 893);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001393, 293, 693, 894);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001394, 294, 694, 895);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001395, 295, 695, 896);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001396, 296, 696, 897);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001397, 297, 697, 898);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001398, 298, 698, 899);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001399, 299, 699, 900);
commit;
prompt 200 records committed...
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001400, 300, 700, 901);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001401, 301, 701, 902);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001402, 302, 702, 903);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001403, 303, 703, 904);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001404, 304, 704, 905);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001405, 305, 705, 906);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001406, 306, 706, 907);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001407, 307, 707, 908);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001408, 308, 708, 909);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001409, 309, 709, 910);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001410, 310, 710, 911);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001411, 311, 711, 912);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001412, 312, 712, 913);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001413, 313, 713, 914);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001414, 314, 714, 915);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001415, 315, 715, 916);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001416, 316, 716, 917);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001417, 317, 717, 918);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001418, 318, 718, 919);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001419, 319, 719, 920);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001420, 320, 720, 921);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001421, 321, 721, 922);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001422, 322, 722, 923);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001423, 323, 723, 924);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001424, 324, 724, 925);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001425, 325, 725, 926);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001426, 326, 726, 927);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001427, 327, 727, 928);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001428, 328, 728, 929);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001429, 329, 729, 930);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001430, 330, 730, 931);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001431, 331, 731, 932);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001432, 332, 732, 933);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001433, 333, 733, 934);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001434, 334, 734, 935);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001435, 335, 735, 936);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001436, 336, 736, 937);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001437, 337, 737, 938);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001438, 338, 738, 939);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001439, 339, 739, 940);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001440, 340, 740, 941);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001441, 341, 741, 942);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001442, 342, 742, 943);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001443, 343, 743, 944);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001444, 344, 744, 945);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001445, 345, 745, 946);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001446, 346, 746, 947);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001447, 347, 747, 948);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001448, 348, 748, 949);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001449, 349, 749, 950);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001450, 350, 750, 951);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001451, 351, 751, 952);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001452, 352, 752, 953);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001453, 353, 753, 954);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001454, 354, 754, 955);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001455, 355, 755, 956);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001456, 356, 756, 957);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001457, 357, 757, 958);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001458, 358, 758, 959);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001459, 359, 759, 960);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001460, 360, 760, 961);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001461, 361, 761, 962);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001462, 362, 762, 963);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001463, 363, 763, 964);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001464, 364, 764, 965);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001465, 365, 765, 966);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001466, 366, 766, 967);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001467, 367, 767, 968);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001468, 368, 768, 969);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001469, 369, 769, 970);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001470, 370, 770, 971);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001471, 371, 771, 972);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001472, 372, 772, 973);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001473, 373, 773, 974);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001474, 374, 774, 975);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001475, 375, 775, 976);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001476, 376, 776, 977);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001477, 377, 777, 978);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001478, 378, 778, 979);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001479, 379, 779, 980);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001480, 380, 780, 981);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001481, 381, 781, 982);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001482, 382, 782, 983);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001483, 383, 783, 984);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001484, 384, 784, 985);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001485, 385, 785, 986);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001486, 386, 786, 987);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001487, 387, 787, 988);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001488, 388, 788, 989);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001489, 389, 789, 990);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001490, 390, 790, 991);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001491, 391, 791, 992);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001492, 392, 792, 993);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001493, 393, 793, 994);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001494, 394, 794, 995);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001495, 395, 795, 996);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001496, 396, 796, 997);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001497, 397, 797, 998);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001498, 398, 798, 999);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001499, 399, 799, 1000);
commit;
prompt 300 records committed...
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001500, 400, 800, 1001);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001501, 401, 801, 1002);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001502, 402, 802, 1003);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001503, 403, 803, 1004);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001504, 404, 804, 1005);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001505, 405, 805, 1006);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001506, 406, 806, 1007);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001507, 407, 807, 1008);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001508, 408, 808, 1009);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001509, 409, 809, 1010);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001510, 410, 810, 1011);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001511, 411, 811, 1012);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001512, 412, 812, 1013);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001513, 413, 813, 1014);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001514, 414, 814, 1015);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001515, 415, 815, 1016);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001516, 416, 816, 1017);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001517, 417, 817, 1018);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001518, 418, 818, 1019);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001519, 419, 819, 1020);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001520, 420, 820, 1021);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001521, 421, 821, 1022);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001522, 422, 822, 1023);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001523, 423, 823, 1024);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001524, 424, 824, 1025);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001525, 425, 825, 1026);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001526, 426, 826, 1027);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001527, 427, 827, 1028);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001528, 428, 828, 1029);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001529, 429, 829, 1030);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001530, 430, 830, 1031);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001531, 431, 831, 1032);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001532, 432, 832, 1033);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001533, 433, 833, 1034);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001534, 434, 834, 1035);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001535, 435, 835, 1036);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001536, 436, 836, 1037);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001537, 437, 837, 1038);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001538, 438, 838, 1039);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001539, 439, 839, 1040);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001540, 440, 840, 1041);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001541, 441, 841, 1042);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001542, 442, 842, 1043);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001543, 443, 843, 1044);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001544, 444, 844, 1045);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001545, 445, 845, 1046);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001546, 446, 846, 1047);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001547, 447, 847, 1048);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001548, 448, 848, 1049);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001549, 449, 849, 1050);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001550, 450, 850, 1051);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001551, 451, 851, 1052);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001552, 452, 852, 1053);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001553, 453, 853, 1054);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001554, 454, 854, 1055);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001555, 455, 855, 1056);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001556, 456, 856, 1057);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001557, 457, 857, 1058);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001558, 458, 858, 1059);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001559, 459, 859, 1060);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001560, 460, 860, 1061);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001561, 461, 861, 1062);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001562, 462, 862, 1063);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001563, 463, 863, 1064);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001564, 464, 864, 1065);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001565, 465, 865, 1066);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001566, 466, 866, 1067);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001567, 467, 867, 1068);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001568, 468, 868, 1069);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001569, 469, 869, 1070);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001570, 470, 870, 1071);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001571, 471, 871, 1072);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001572, 472, 872, 1073);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001573, 473, 873, 1074);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001574, 474, 874, 1075);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001575, 475, 875, 1076);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001576, 476, 876, 1077);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001577, 477, 877, 1078);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001578, 478, 878, 1079);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001579, 479, 879, 1080);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001580, 480, 880, 1081);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001581, 481, 881, 1082);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001582, 482, 882, 1083);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001583, 483, 883, 1084);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001584, 484, 884, 1085);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001585, 485, 885, 1086);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001586, 486, 886, 1087);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001587, 487, 887, 1088);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001588, 488, 888, 1089);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001589, 489, 889, 1090);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001590, 490, 890, 1091);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001591, 491, 891, 1092);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001592, 492, 892, 1093);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001593, 493, 893, 1094);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001594, 494, 894, 1095);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001595, 495, 895, 1096);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001596, 496, 896, 1097);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001597, 497, 897, 1098);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001598, 498, 898, 1099);
insert into COMMUNITYMEMBER (phonenum, deliverynum, deliverynumto, fooddeliveryfromdeliverynum)
values (1000001599, 499, 899, 1100);
commit;
prompt 400 records loaded
prompt Loading BIRTH...
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (1, to_date('18-07-2000', 'dd-mm-yyyy'), 4, 1000001200);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (2, to_date('17-10-2000', 'dd-mm-yyyy'), 6, 1000001201);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (3, to_date('26-04-2000', 'dd-mm-yyyy'), 1, 1000001202);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (4, to_date('12-06-2000', 'dd-mm-yyyy'), 3, 1000001203);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (5, to_date('11-04-2000', 'dd-mm-yyyy'), 6, 1000001204);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (6, to_date('04-03-2000', 'dd-mm-yyyy'), 5, 1000001205);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (7, to_date('13-04-2000', 'dd-mm-yyyy'), 2, 1000001206);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (8, to_date('07-06-2000', 'dd-mm-yyyy'), 4, 1000001207);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (9, to_date('11-12-2000', 'dd-mm-yyyy'), 2, 1000001208);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (10, to_date('31-10-2000', 'dd-mm-yyyy'), 3, 1000001209);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (11, to_date('09-01-2000', 'dd-mm-yyyy'), 1, 1000001210);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (12, to_date('28-09-2000', 'dd-mm-yyyy'), 5, 1000001211);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (13, to_date('03-03-2000', 'dd-mm-yyyy'), 1, 1000001212);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (14, to_date('20-10-2000', 'dd-mm-yyyy'), 1, 1000001213);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (15, to_date('03-10-2000', 'dd-mm-yyyy'), 1, 1000001214);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (16, to_date('29-10-2000', 'dd-mm-yyyy'), 4, 1000001215);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (17, to_date('26-08-2000', 'dd-mm-yyyy'), 1, 1000001216);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (18, to_date('13-05-2000', 'dd-mm-yyyy'), 6, 1000001217);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (19, to_date('04-05-2000', 'dd-mm-yyyy'), 5, 1000001218);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (20, to_date('15-09-2000', 'dd-mm-yyyy'), 5, 1000001219);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (21, to_date('13-05-2000', 'dd-mm-yyyy'), 3, 1000001220);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (22, to_date('18-11-2000', 'dd-mm-yyyy'), 3, 1000001221);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (23, to_date('07-03-2000', 'dd-mm-yyyy'), 2, 1000001222);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (24, to_date('07-03-2000', 'dd-mm-yyyy'), 5, 1000001223);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (25, to_date('14-07-2000', 'dd-mm-yyyy'), 3, 1000001224);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (26, to_date('25-02-2000', 'dd-mm-yyyy'), 2, 1000001225);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (27, to_date('07-08-2000', 'dd-mm-yyyy'), 4, 1000001226);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (28, to_date('31-03-2000', 'dd-mm-yyyy'), 4, 1000001227);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (29, to_date('20-03-2000', 'dd-mm-yyyy'), 5, 1000001228);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (30, to_date('05-05-2000', 'dd-mm-yyyy'), 6, 1000001229);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (31, to_date('24-09-2000', 'dd-mm-yyyy'), 4, 1000001230);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (32, to_date('27-01-2000', 'dd-mm-yyyy'), 1, 1000001231);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (33, to_date('19-02-2000', 'dd-mm-yyyy'), 5, 1000001232);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (34, to_date('29-02-2000', 'dd-mm-yyyy'), 3, 1000001233);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (35, to_date('02-03-2000', 'dd-mm-yyyy'), 1, 1000001234);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (36, to_date('21-11-2000', 'dd-mm-yyyy'), 2, 1000001235);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (37, to_date('08-09-2000', 'dd-mm-yyyy'), 5, 1000001236);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (38, to_date('15-07-2000', 'dd-mm-yyyy'), 2, 1000001237);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (39, to_date('03-06-2000', 'dd-mm-yyyy'), 1, 1000001238);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (40, to_date('19-09-2000', 'dd-mm-yyyy'), 2, 1000001239);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (41, to_date('12-09-2000', 'dd-mm-yyyy'), 4, 1000001240);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (42, to_date('19-03-2000', 'dd-mm-yyyy'), 2, 1000001241);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (43, to_date('03-07-2000', 'dd-mm-yyyy'), 1, 1000001242);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (44, to_date('01-10-2000', 'dd-mm-yyyy'), 6, 1000001243);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (45, to_date('29-09-2000', 'dd-mm-yyyy'), 6, 1000001244);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (46, to_date('26-02-2000', 'dd-mm-yyyy'), 4, 1000001245);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (47, to_date('18-11-2000', 'dd-mm-yyyy'), 1, 1000001246);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (48, to_date('29-08-2000', 'dd-mm-yyyy'), 4, 1000001247);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (49, to_date('11-08-2000', 'dd-mm-yyyy'), 5, 1000001248);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (50, to_date('23-08-2000', 'dd-mm-yyyy'), 3, 1000001249);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (51, to_date('09-08-2000', 'dd-mm-yyyy'), 3, 1000001250);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (52, to_date('09-11-2000', 'dd-mm-yyyy'), 2, 1000001251);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (53, to_date('14-05-2000', 'dd-mm-yyyy'), 5, 1000001252);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (54, to_date('13-08-2000', 'dd-mm-yyyy'), 2, 1000001253);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (55, to_date('24-11-2000', 'dd-mm-yyyy'), 5, 1000001254);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (56, to_date('08-04-2000', 'dd-mm-yyyy'), 2, 1000001255);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (57, to_date('23-04-2000', 'dd-mm-yyyy'), 5, 1000001256);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (58, to_date('05-02-2000', 'dd-mm-yyyy'), 4, 1000001257);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (59, to_date('14-01-2000', 'dd-mm-yyyy'), 5, 1000001258);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (60, to_date('19-02-2000', 'dd-mm-yyyy'), 5, 1000001259);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (61, to_date('26-09-2000', 'dd-mm-yyyy'), 4, 1000001260);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (62, to_date('04-02-2000', 'dd-mm-yyyy'), 6, 1000001261);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (63, to_date('18-05-2000', 'dd-mm-yyyy'), 6, 1000001262);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (64, to_date('30-06-2000', 'dd-mm-yyyy'), 3, 1000001263);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (65, to_date('29-07-2000', 'dd-mm-yyyy'), 3, 1000001264);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (66, to_date('03-12-2000', 'dd-mm-yyyy'), 3, 1000001265);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (67, to_date('15-01-2000', 'dd-mm-yyyy'), 5, 1000001266);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (68, to_date('12-10-2000', 'dd-mm-yyyy'), 2, 1000001267);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (69, to_date('11-08-2000', 'dd-mm-yyyy'), 1, 1000001268);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (70, to_date('14-10-2000', 'dd-mm-yyyy'), 3, 1000001269);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (71, to_date('10-07-2000', 'dd-mm-yyyy'), 4, 1000001270);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (72, to_date('06-09-2000', 'dd-mm-yyyy'), 6, 1000001271);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (73, to_date('21-10-2000', 'dd-mm-yyyy'), 2, 1000001272);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (74, to_date('12-05-2000', 'dd-mm-yyyy'), 6, 1000001273);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (75, to_date('17-11-2000', 'dd-mm-yyyy'), 5, 1000001274);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (76, to_date('23-05-2000', 'dd-mm-yyyy'), 1, 1000001275);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (77, to_date('23-04-2000', 'dd-mm-yyyy'), 4, 1000001276);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (78, to_date('07-02-2000', 'dd-mm-yyyy'), 4, 1000001277);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (79, to_date('26-03-2000', 'dd-mm-yyyy'), 4, 1000001278);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (80, to_date('29-02-2000', 'dd-mm-yyyy'), 6, 1000001279);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (81, to_date('21-02-2000', 'dd-mm-yyyy'), 4, 1000001280);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (82, to_date('28-08-2000', 'dd-mm-yyyy'), 6, 1000001281);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (83, to_date('16-02-2000', 'dd-mm-yyyy'), 1, 1000001282);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (84, to_date('12-03-2000', 'dd-mm-yyyy'), 1, 1000001283);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (85, to_date('05-12-2000', 'dd-mm-yyyy'), 5, 1000001284);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (86, to_date('12-10-2000', 'dd-mm-yyyy'), 3, 1000001285);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (87, to_date('21-01-2000', 'dd-mm-yyyy'), 2, 1000001286);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (88, to_date('19-10-2000', 'dd-mm-yyyy'), 2, 1000001287);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (89, to_date('29-06-2000', 'dd-mm-yyyy'), 2, 1000001288);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (90, to_date('28-03-2000', 'dd-mm-yyyy'), 2, 1000001289);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (91, to_date('28-05-2000', 'dd-mm-yyyy'), 4, 1000001290);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (92, to_date('08-01-2000', 'dd-mm-yyyy'), 2, 1000001291);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (93, to_date('23-09-2000', 'dd-mm-yyyy'), 6, 1000001292);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (94, to_date('09-03-2000', 'dd-mm-yyyy'), 2, 1000001293);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (95, to_date('23-06-2000', 'dd-mm-yyyy'), 5, 1000001294);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (96, to_date('28-01-2000', 'dd-mm-yyyy'), 1, 1000001295);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (97, to_date('30-01-2000', 'dd-mm-yyyy'), 5, 1000001296);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (98, to_date('21-01-2000', 'dd-mm-yyyy'), 4, 1000001297);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (99, to_date('11-02-2000', 'dd-mm-yyyy'), 6, 1000001298);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (100, to_date('02-11-2000', 'dd-mm-yyyy'), 2, 1000001299);
commit;
prompt 100 records committed...
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (101, to_date('25-01-2000', 'dd-mm-yyyy'), 2, 1000001300);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (102, to_date('31-05-2000', 'dd-mm-yyyy'), 5, 1000001301);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (103, to_date('17-03-2000', 'dd-mm-yyyy'), 5, 1000001302);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (104, to_date('01-04-2000', 'dd-mm-yyyy'), 6, 1000001303);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (105, to_date('30-03-2000', 'dd-mm-yyyy'), 6, 1000001304);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (106, to_date('10-06-2000', 'dd-mm-yyyy'), 6, 1000001305);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (107, to_date('16-03-2000', 'dd-mm-yyyy'), 1, 1000001306);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (108, to_date('06-09-2000', 'dd-mm-yyyy'), 4, 1000001307);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (109, to_date('08-08-2000', 'dd-mm-yyyy'), 5, 1000001308);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (110, to_date('07-06-2000', 'dd-mm-yyyy'), 5, 1000001309);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (111, to_date('22-02-2000', 'dd-mm-yyyy'), 4, 1000001310);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (112, to_date('29-06-2000', 'dd-mm-yyyy'), 2, 1000001311);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (113, to_date('21-11-2000', 'dd-mm-yyyy'), 1, 1000001312);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (114, to_date('25-10-2000', 'dd-mm-yyyy'), 6, 1000001313);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (115, to_date('13-08-2000', 'dd-mm-yyyy'), 6, 1000001314);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (116, to_date('12-01-2000', 'dd-mm-yyyy'), 1, 1000001315);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (117, to_date('04-10-2000', 'dd-mm-yyyy'), 4, 1000001316);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (118, to_date('07-07-2000', 'dd-mm-yyyy'), 1, 1000001317);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (119, to_date('14-09-2000', 'dd-mm-yyyy'), 1, 1000001318);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (120, to_date('22-05-2000', 'dd-mm-yyyy'), 2, 1000001319);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (121, to_date('27-08-2000', 'dd-mm-yyyy'), 5, 1000001320);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (122, to_date('05-05-2000', 'dd-mm-yyyy'), 6, 1000001321);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (123, to_date('29-05-2000', 'dd-mm-yyyy'), 2, 1000001322);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (124, to_date('24-07-2000', 'dd-mm-yyyy'), 5, 1000001323);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (125, to_date('17-08-2000', 'dd-mm-yyyy'), 2, 1000001324);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (126, to_date('20-01-2000', 'dd-mm-yyyy'), 1, 1000001325);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (127, to_date('12-02-2000', 'dd-mm-yyyy'), 2, 1000001326);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (128, to_date('25-07-2000', 'dd-mm-yyyy'), 3, 1000001327);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (129, to_date('19-11-2000', 'dd-mm-yyyy'), 6, 1000001328);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (130, to_date('15-06-2000', 'dd-mm-yyyy'), 5, 1000001329);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (131, to_date('19-10-2000', 'dd-mm-yyyy'), 6, 1000001330);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (132, to_date('17-02-2000', 'dd-mm-yyyy'), 3, 1000001331);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (133, to_date('01-04-2000', 'dd-mm-yyyy'), 3, 1000001332);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (134, to_date('06-02-2000', 'dd-mm-yyyy'), 5, 1000001333);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (135, to_date('10-04-2000', 'dd-mm-yyyy'), 5, 1000001334);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (136, to_date('09-07-2000', 'dd-mm-yyyy'), 2, 1000001335);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (137, to_date('18-02-2000', 'dd-mm-yyyy'), 4, 1000001336);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (138, to_date('20-10-2000', 'dd-mm-yyyy'), 2, 1000001337);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (139, to_date('14-08-2000', 'dd-mm-yyyy'), 3, 1000001338);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (140, to_date('15-01-2000', 'dd-mm-yyyy'), 2, 1000001339);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (141, to_date('30-09-2000', 'dd-mm-yyyy'), 2, 1000001340);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (142, to_date('24-03-2000', 'dd-mm-yyyy'), 2, 1000001341);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (143, to_date('15-04-2000', 'dd-mm-yyyy'), 4, 1000001342);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (144, to_date('21-03-2000', 'dd-mm-yyyy'), 3, 1000001343);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (145, to_date('01-01-2000', 'dd-mm-yyyy'), 2, 1000001344);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (146, to_date('27-10-2000', 'dd-mm-yyyy'), 3, 1000001345);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (147, to_date('31-03-2000', 'dd-mm-yyyy'), 1, 1000001346);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (148, to_date('08-01-2000', 'dd-mm-yyyy'), 5, 1000001347);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (149, to_date('16-09-2000', 'dd-mm-yyyy'), 4, 1000001348);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (150, to_date('21-02-2000', 'dd-mm-yyyy'), 2, 1000001349);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (151, to_date('13-06-2000', 'dd-mm-yyyy'), 3, 1000001350);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (152, to_date('25-09-2000', 'dd-mm-yyyy'), 3, 1000001351);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (153, to_date('08-08-2000', 'dd-mm-yyyy'), 1, 1000001352);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (154, to_date('25-05-2000', 'dd-mm-yyyy'), 4, 1000001353);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (155, to_date('15-11-2000', 'dd-mm-yyyy'), 1, 1000001354);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (156, to_date('05-10-2000', 'dd-mm-yyyy'), 6, 1000001355);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (157, to_date('26-02-2000', 'dd-mm-yyyy'), 6, 1000001356);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (158, to_date('24-04-2000', 'dd-mm-yyyy'), 5, 1000001357);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (159, to_date('05-07-2000', 'dd-mm-yyyy'), 6, 1000001358);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (160, to_date('03-03-2000', 'dd-mm-yyyy'), 5, 1000001359);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (161, to_date('23-09-2000', 'dd-mm-yyyy'), 5, 1000001360);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (162, to_date('09-07-2000', 'dd-mm-yyyy'), 6, 1000001361);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (163, to_date('13-11-2000', 'dd-mm-yyyy'), 6, 1000001362);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (164, to_date('16-10-2000', 'dd-mm-yyyy'), 1, 1000001363);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (165, to_date('16-09-2000', 'dd-mm-yyyy'), 1, 1000001364);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (166, to_date('01-10-2000', 'dd-mm-yyyy'), 2, 1000001365);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (167, to_date('25-10-2000', 'dd-mm-yyyy'), 2, 1000001366);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (168, to_date('01-01-2000', 'dd-mm-yyyy'), 6, 1000001367);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (169, to_date('13-11-2000', 'dd-mm-yyyy'), 2, 1000001368);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (170, to_date('21-02-2000', 'dd-mm-yyyy'), 6, 1000001369);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (171, to_date('11-09-2000', 'dd-mm-yyyy'), 2, 1000001370);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (172, to_date('23-11-2000', 'dd-mm-yyyy'), 5, 1000001371);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (173, to_date('12-02-2000', 'dd-mm-yyyy'), 3, 1000001372);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (174, to_date('10-09-2000', 'dd-mm-yyyy'), 2, 1000001373);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (175, to_date('01-08-2000', 'dd-mm-yyyy'), 5, 1000001374);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (176, to_date('10-01-2000', 'dd-mm-yyyy'), 4, 1000001375);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (177, to_date('18-07-2000', 'dd-mm-yyyy'), 2, 1000001376);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (178, to_date('09-08-2000', 'dd-mm-yyyy'), 3, 1000001377);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (179, to_date('06-04-2000', 'dd-mm-yyyy'), 2, 1000001378);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (180, to_date('21-01-2000', 'dd-mm-yyyy'), 3, 1000001379);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (181, to_date('30-11-2000', 'dd-mm-yyyy'), 5, 1000001380);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (182, to_date('19-03-2000', 'dd-mm-yyyy'), 3, 1000001381);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (183, to_date('03-12-2000', 'dd-mm-yyyy'), 1, 1000001382);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (184, to_date('04-12-2000', 'dd-mm-yyyy'), 6, 1000001383);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (185, to_date('23-05-2000', 'dd-mm-yyyy'), 5, 1000001384);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (186, to_date('22-08-2000', 'dd-mm-yyyy'), 4, 1000001385);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (187, to_date('13-01-2000', 'dd-mm-yyyy'), 5, 1000001386);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (188, to_date('23-10-2000', 'dd-mm-yyyy'), 5, 1000001387);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (189, to_date('18-03-2000', 'dd-mm-yyyy'), 6, 1000001388);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (190, to_date('14-11-2000', 'dd-mm-yyyy'), 4, 1000001389);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (191, to_date('09-04-2000', 'dd-mm-yyyy'), 3, 1000001390);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (192, to_date('05-03-2000', 'dd-mm-yyyy'), 2, 1000001391);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (193, to_date('06-06-2000', 'dd-mm-yyyy'), 4, 1000001392);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (194, to_date('12-10-2000', 'dd-mm-yyyy'), 2, 1000001393);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (195, to_date('03-04-2000', 'dd-mm-yyyy'), 1, 1000001394);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (196, to_date('20-06-2000', 'dd-mm-yyyy'), 6, 1000001395);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (197, to_date('12-04-2000', 'dd-mm-yyyy'), 3, 1000001396);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (198, to_date('05-09-2000', 'dd-mm-yyyy'), 3, 1000001397);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (199, to_date('07-04-2000', 'dd-mm-yyyy'), 5, 1000001398);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (200, to_date('07-04-2000', 'dd-mm-yyyy'), 3, 1000001399);
commit;
prompt 200 records committed...
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (201, to_date('01-04-2000', 'dd-mm-yyyy'), 3, 1000001400);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (202, to_date('22-03-2000', 'dd-mm-yyyy'), 2, 1000001401);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (203, to_date('17-03-2000', 'dd-mm-yyyy'), 2, 1000001402);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (204, to_date('30-03-2000', 'dd-mm-yyyy'), 2, 1000001403);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (205, to_date('15-03-2000', 'dd-mm-yyyy'), 3, 1000001404);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (206, to_date('07-06-2000', 'dd-mm-yyyy'), 5, 1000001405);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (207, to_date('26-03-2000', 'dd-mm-yyyy'), 3, 1000001406);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (208, to_date('04-11-2000', 'dd-mm-yyyy'), 2, 1000001407);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (209, to_date('20-02-2000', 'dd-mm-yyyy'), 4, 1000001408);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (210, to_date('06-05-2000', 'dd-mm-yyyy'), 4, 1000001409);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (211, to_date('02-04-2000', 'dd-mm-yyyy'), 3, 1000001410);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (212, to_date('06-04-2000', 'dd-mm-yyyy'), 4, 1000001411);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (213, to_date('18-10-2000', 'dd-mm-yyyy'), 6, 1000001412);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (214, to_date('31-07-2000', 'dd-mm-yyyy'), 2, 1000001413);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (215, to_date('14-03-2000', 'dd-mm-yyyy'), 5, 1000001414);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (216, to_date('19-04-2000', 'dd-mm-yyyy'), 1, 1000001415);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (217, to_date('19-04-2000', 'dd-mm-yyyy'), 6, 1000001416);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (218, to_date('05-08-2000', 'dd-mm-yyyy'), 2, 1000001417);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (219, to_date('19-02-2000', 'dd-mm-yyyy'), 2, 1000001418);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (220, to_date('09-03-2000', 'dd-mm-yyyy'), 4, 1000001419);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (221, to_date('19-01-2000', 'dd-mm-yyyy'), 2, 1000001420);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (222, to_date('04-12-2000', 'dd-mm-yyyy'), 3, 1000001421);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (223, to_date('21-02-2000', 'dd-mm-yyyy'), 3, 1000001422);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (224, to_date('15-03-2000', 'dd-mm-yyyy'), 4, 1000001423);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (225, to_date('03-02-2000', 'dd-mm-yyyy'), 1, 1000001424);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (226, to_date('07-02-2000', 'dd-mm-yyyy'), 5, 1000001425);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (227, to_date('03-02-2000', 'dd-mm-yyyy'), 6, 1000001426);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (228, to_date('29-10-2000', 'dd-mm-yyyy'), 3, 1000001427);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (229, to_date('13-11-2000', 'dd-mm-yyyy'), 1, 1000001428);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (230, to_date('28-04-2000', 'dd-mm-yyyy'), 3, 1000001429);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (231, to_date('20-02-2000', 'dd-mm-yyyy'), 3, 1000001430);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (232, to_date('17-04-2000', 'dd-mm-yyyy'), 2, 1000001431);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (233, to_date('08-02-2000', 'dd-mm-yyyy'), 4, 1000001432);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (234, to_date('21-03-2000', 'dd-mm-yyyy'), 6, 1000001433);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (235, to_date('07-02-2000', 'dd-mm-yyyy'), 4, 1000001434);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (236, to_date('19-01-2000', 'dd-mm-yyyy'), 1, 1000001435);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (237, to_date('06-11-2000', 'dd-mm-yyyy'), 2, 1000001436);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (238, to_date('08-03-2000', 'dd-mm-yyyy'), 3, 1000001437);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (239, to_date('27-07-2000', 'dd-mm-yyyy'), 1, 1000001438);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (240, to_date('19-01-2000', 'dd-mm-yyyy'), 6, 1000001439);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (241, to_date('05-06-2000', 'dd-mm-yyyy'), 6, 1000001440);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (242, to_date('12-06-2000', 'dd-mm-yyyy'), 2, 1000001441);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (243, to_date('16-01-2000', 'dd-mm-yyyy'), 3, 1000001442);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (244, to_date('24-01-2000', 'dd-mm-yyyy'), 3, 1000001443);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (245, to_date('10-01-2000', 'dd-mm-yyyy'), 1, 1000001444);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (246, to_date('19-05-2000', 'dd-mm-yyyy'), 6, 1000001445);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (247, to_date('23-05-2000', 'dd-mm-yyyy'), 4, 1000001446);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (248, to_date('23-04-2000', 'dd-mm-yyyy'), 5, 1000001447);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (249, to_date('05-11-2000', 'dd-mm-yyyy'), 5, 1000001448);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (250, to_date('05-01-2000', 'dd-mm-yyyy'), 3, 1000001449);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (251, to_date('29-10-2000', 'dd-mm-yyyy'), 3, 1000001450);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (252, to_date('30-06-2000', 'dd-mm-yyyy'), 4, 1000001451);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (253, to_date('07-02-2000', 'dd-mm-yyyy'), 6, 1000001452);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (254, to_date('08-11-2000', 'dd-mm-yyyy'), 1, 1000001453);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (255, to_date('26-02-2000', 'dd-mm-yyyy'), 3, 1000001454);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (256, to_date('14-02-2000', 'dd-mm-yyyy'), 2, 1000001455);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (257, to_date('22-01-2000', 'dd-mm-yyyy'), 6, 1000001456);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (258, to_date('07-06-2000', 'dd-mm-yyyy'), 3, 1000001457);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (259, to_date('17-10-2000', 'dd-mm-yyyy'), 6, 1000001458);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (260, to_date('06-12-2000', 'dd-mm-yyyy'), 5, 1000001459);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (261, to_date('02-11-2000', 'dd-mm-yyyy'), 5, 1000001460);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (262, to_date('11-05-2000', 'dd-mm-yyyy'), 6, 1000001461);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (263, to_date('14-04-2000', 'dd-mm-yyyy'), 2, 1000001462);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (264, to_date('28-03-2000', 'dd-mm-yyyy'), 2, 1000001463);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (265, to_date('04-08-2000', 'dd-mm-yyyy'), 4, 1000001464);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (266, to_date('24-06-2000', 'dd-mm-yyyy'), 5, 1000001465);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (267, to_date('13-08-2000', 'dd-mm-yyyy'), 3, 1000001466);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (268, to_date('12-08-2000', 'dd-mm-yyyy'), 5, 1000001467);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (269, to_date('27-03-2000', 'dd-mm-yyyy'), 3, 1000001468);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (270, to_date('01-12-2000', 'dd-mm-yyyy'), 2, 1000001469);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (271, to_date('29-04-2000', 'dd-mm-yyyy'), 3, 1000001470);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (272, to_date('08-12-2000', 'dd-mm-yyyy'), 5, 1000001471);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (273, to_date('15-06-2000', 'dd-mm-yyyy'), 1, 1000001472);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (274, to_date('11-08-2000', 'dd-mm-yyyy'), 5, 1000001473);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (275, to_date('20-08-2000', 'dd-mm-yyyy'), 5, 1000001474);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (276, to_date('22-01-2000', 'dd-mm-yyyy'), 6, 1000001475);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (277, to_date('22-05-2000', 'dd-mm-yyyy'), 1, 1000001476);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (278, to_date('18-11-2000', 'dd-mm-yyyy'), 1, 1000001477);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (279, to_date('17-01-2000', 'dd-mm-yyyy'), 6, 1000001478);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (280, to_date('05-10-2000', 'dd-mm-yyyy'), 5, 1000001479);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (281, to_date('25-11-2000', 'dd-mm-yyyy'), 6, 1000001480);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (282, to_date('15-10-2000', 'dd-mm-yyyy'), 1, 1000001481);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (283, to_date('06-02-2000', 'dd-mm-yyyy'), 6, 1000001482);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (284, to_date('28-09-2000', 'dd-mm-yyyy'), 6, 1000001483);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (285, to_date('02-02-2000', 'dd-mm-yyyy'), 6, 1000001484);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (286, to_date('30-04-2000', 'dd-mm-yyyy'), 1, 1000001485);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (287, to_date('30-07-2000', 'dd-mm-yyyy'), 5, 1000001486);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (288, to_date('08-01-2000', 'dd-mm-yyyy'), 4, 1000001487);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (289, to_date('29-11-2000', 'dd-mm-yyyy'), 2, 1000001488);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (290, to_date('06-03-2000', 'dd-mm-yyyy'), 1, 1000001489);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (291, to_date('04-03-2000', 'dd-mm-yyyy'), 3, 1000001490);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (292, to_date('30-01-2000', 'dd-mm-yyyy'), 2, 1000001491);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (293, to_date('06-09-2000', 'dd-mm-yyyy'), 1, 1000001492);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (294, to_date('02-10-2000', 'dd-mm-yyyy'), 4, 1000001493);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (295, to_date('19-10-2000', 'dd-mm-yyyy'), 1, 1000001494);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (296, to_date('30-06-2000', 'dd-mm-yyyy'), 3, 1000001495);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (297, to_date('22-03-2000', 'dd-mm-yyyy'), 4, 1000001496);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (298, to_date('23-08-2000', 'dd-mm-yyyy'), 6, 1000001497);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (299, to_date('02-05-2000', 'dd-mm-yyyy'), 2, 1000001498);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (300, to_date('03-08-2000', 'dd-mm-yyyy'), 3, 1000001499);
commit;
prompt 300 records committed...
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (301, to_date('28-07-2000', 'dd-mm-yyyy'), 3, 1000001500);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (302, to_date('21-01-2000', 'dd-mm-yyyy'), 1, 1000001501);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (303, to_date('11-05-2000', 'dd-mm-yyyy'), 5, 1000001502);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (304, to_date('29-05-2000', 'dd-mm-yyyy'), 2, 1000001503);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (305, to_date('11-06-2000', 'dd-mm-yyyy'), 3, 1000001504);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (306, to_date('10-10-2000', 'dd-mm-yyyy'), 5, 1000001505);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (307, to_date('11-06-2000', 'dd-mm-yyyy'), 5, 1000001506);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (308, to_date('21-02-2000', 'dd-mm-yyyy'), 4, 1000001507);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (309, to_date('17-02-2000', 'dd-mm-yyyy'), 3, 1000001508);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (310, to_date('30-09-2000', 'dd-mm-yyyy'), 6, 1000001509);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (311, to_date('17-10-2000', 'dd-mm-yyyy'), 4, 1000001510);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (312, to_date('30-09-2000', 'dd-mm-yyyy'), 3, 1000001511);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (313, to_date('04-07-2000', 'dd-mm-yyyy'), 5, 1000001512);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (314, to_date('23-04-2000', 'dd-mm-yyyy'), 2, 1000001513);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (315, to_date('01-12-2000', 'dd-mm-yyyy'), 3, 1000001514);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (316, to_date('02-03-2000', 'dd-mm-yyyy'), 2, 1000001515);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (317, to_date('29-11-2000', 'dd-mm-yyyy'), 4, 1000001516);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (318, to_date('14-03-2000', 'dd-mm-yyyy'), 6, 1000001517);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (319, to_date('10-01-2000', 'dd-mm-yyyy'), 6, 1000001518);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (320, to_date('29-03-2000', 'dd-mm-yyyy'), 3, 1000001519);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (321, to_date('16-08-2000', 'dd-mm-yyyy'), 3, 1000001520);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (322, to_date('21-10-2000', 'dd-mm-yyyy'), 3, 1000001521);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (323, to_date('26-01-2000', 'dd-mm-yyyy'), 1, 1000001522);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (324, to_date('26-08-2000', 'dd-mm-yyyy'), 3, 1000001523);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (325, to_date('05-03-2000', 'dd-mm-yyyy'), 4, 1000001524);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (326, to_date('05-10-2000', 'dd-mm-yyyy'), 5, 1000001525);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (327, to_date('12-02-2000', 'dd-mm-yyyy'), 2, 1000001526);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (328, to_date('02-10-2000', 'dd-mm-yyyy'), 1, 1000001527);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (329, to_date('01-08-2000', 'dd-mm-yyyy'), 1, 1000001528);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (330, to_date('03-08-2000', 'dd-mm-yyyy'), 4, 1000001529);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (331, to_date('02-12-2000', 'dd-mm-yyyy'), 6, 1000001530);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (332, to_date('03-10-2000', 'dd-mm-yyyy'), 1, 1000001531);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (333, to_date('07-07-2000', 'dd-mm-yyyy'), 3, 1000001532);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (334, to_date('08-12-2000', 'dd-mm-yyyy'), 1, 1000001533);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (335, to_date('28-10-2000', 'dd-mm-yyyy'), 1, 1000001534);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (336, to_date('04-05-2000', 'dd-mm-yyyy'), 5, 1000001535);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (337, to_date('08-11-2000', 'dd-mm-yyyy'), 2, 1000001536);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (338, to_date('29-02-2000', 'dd-mm-yyyy'), 2, 1000001537);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (339, to_date('01-01-2000', 'dd-mm-yyyy'), 4, 1000001538);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (340, to_date('08-06-2000', 'dd-mm-yyyy'), 1, 1000001539);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (341, to_date('26-07-2000', 'dd-mm-yyyy'), 2, 1000001540);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (342, to_date('08-10-2000', 'dd-mm-yyyy'), 3, 1000001541);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (343, to_date('18-09-2000', 'dd-mm-yyyy'), 1, 1000001542);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (344, to_date('17-07-2000', 'dd-mm-yyyy'), 1, 1000001543);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (345, to_date('23-11-2000', 'dd-mm-yyyy'), 5, 1000001544);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (346, to_date('10-12-2000', 'dd-mm-yyyy'), 4, 1000001545);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (347, to_date('17-10-2000', 'dd-mm-yyyy'), 4, 1000001546);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (348, to_date('23-02-2000', 'dd-mm-yyyy'), 6, 1000001547);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (349, to_date('17-11-2000', 'dd-mm-yyyy'), 2, 1000001548);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (350, to_date('12-08-2000', 'dd-mm-yyyy'), 1, 1000001549);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (351, to_date('08-03-2000', 'dd-mm-yyyy'), 6, 1000001550);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (352, to_date('30-05-2000', 'dd-mm-yyyy'), 6, 1000001551);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (353, to_date('02-04-2000', 'dd-mm-yyyy'), 6, 1000001552);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (354, to_date('29-03-2000', 'dd-mm-yyyy'), 4, 1000001553);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (355, to_date('30-08-2000', 'dd-mm-yyyy'), 6, 1000001554);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (356, to_date('11-07-2000', 'dd-mm-yyyy'), 2, 1000001555);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (357, to_date('15-04-2000', 'dd-mm-yyyy'), 4, 1000001556);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (358, to_date('27-10-2000', 'dd-mm-yyyy'), 4, 1000001557);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (359, to_date('10-09-2000', 'dd-mm-yyyy'), 1, 1000001558);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (360, to_date('05-12-2000', 'dd-mm-yyyy'), 1, 1000001559);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (361, to_date('27-08-2000', 'dd-mm-yyyy'), 4, 1000001560);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (362, to_date('06-06-2000', 'dd-mm-yyyy'), 4, 1000001561);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (363, to_date('23-06-2000', 'dd-mm-yyyy'), 2, 1000001562);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (364, to_date('26-03-2000', 'dd-mm-yyyy'), 1, 1000001563);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (365, to_date('06-11-2000', 'dd-mm-yyyy'), 2, 1000001564);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (366, to_date('04-07-2000', 'dd-mm-yyyy'), 2, 1000001565);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (367, to_date('18-03-2000', 'dd-mm-yyyy'), 2, 1000001566);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (368, to_date('01-01-2000', 'dd-mm-yyyy'), 1, 1000001567);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (369, to_date('30-06-2000', 'dd-mm-yyyy'), 2, 1000001568);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (370, to_date('18-02-2000', 'dd-mm-yyyy'), 2, 1000001569);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (371, to_date('28-01-2000', 'dd-mm-yyyy'), 1, 1000001570);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (372, to_date('13-05-2000', 'dd-mm-yyyy'), 3, 1000001571);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (373, to_date('01-06-2000', 'dd-mm-yyyy'), 4, 1000001572);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (374, to_date('02-02-2000', 'dd-mm-yyyy'), 1, 1000001573);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (375, to_date('07-01-2000', 'dd-mm-yyyy'), 4, 1000001574);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (376, to_date('31-08-2000', 'dd-mm-yyyy'), 4, 1000001575);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (377, to_date('10-09-2000', 'dd-mm-yyyy'), 4, 1000001576);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (378, to_date('20-07-2000', 'dd-mm-yyyy'), 5, 1000001577);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (379, to_date('30-04-2000', 'dd-mm-yyyy'), 4, 1000001578);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (380, to_date('20-05-2000', 'dd-mm-yyyy'), 3, 1000001579);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (381, to_date('01-06-2000', 'dd-mm-yyyy'), 1, 1000001580);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (382, to_date('22-01-2000', 'dd-mm-yyyy'), 6, 1000001581);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (383, to_date('21-02-2000', 'dd-mm-yyyy'), 1, 1000001582);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (384, to_date('21-05-2000', 'dd-mm-yyyy'), 1, 1000001583);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (385, to_date('20-02-2000', 'dd-mm-yyyy'), 3, 1000001584);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (386, to_date('07-06-2000', 'dd-mm-yyyy'), 5, 1000001585);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (387, to_date('22-06-2000', 'dd-mm-yyyy'), 1, 1000001586);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (388, to_date('29-08-2000', 'dd-mm-yyyy'), 4, 1000001587);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (389, to_date('29-04-2000', 'dd-mm-yyyy'), 2, 1000001588);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (390, to_date('30-08-2000', 'dd-mm-yyyy'), 4, 1000001589);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (391, to_date('29-06-2000', 'dd-mm-yyyy'), 4, 1000001590);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (392, to_date('27-03-2000', 'dd-mm-yyyy'), 6, 1000001591);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (393, to_date('09-08-2000', 'dd-mm-yyyy'), 1, 1000001592);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (394, to_date('07-07-2000', 'dd-mm-yyyy'), 4, 1000001593);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (395, to_date('12-03-2000', 'dd-mm-yyyy'), 6, 1000001594);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (396, to_date('11-04-2000', 'dd-mm-yyyy'), 6, 1000001595);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (397, to_date('15-09-2000', 'dd-mm-yyyy'), 4, 1000001596);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (398, to_date('07-09-2000', 'dd-mm-yyyy'), 6, 1000001597);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (399, to_date('05-02-2000', 'dd-mm-yyyy'), 4, 1000001598);
insert into BIRTH (birthid, birtdate, numberofbabies, phonenum)
values (400, to_date('16-10-2000', 'dd-mm-yyyy'), 4, 1000001599);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for DRIVER...
alter table DRIVER enable constraint SYS_C00717522;
prompt Enabling foreign key constraints for DELIVERY...
alter table DELIVERY enable constraint SYS_C00717527;
prompt Enabling foreign key constraints for FOODDELIVERY...
alter table FOODDELIVERY enable constraint SYS_C00717530;
prompt Enabling foreign key constraints for SUPPLYSDELIVERY...
alter table SUPPLYSDELIVERY enable constraint SYS_C00717535;
prompt Enabling foreign key constraints for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER enable constraint SYS_C00717541;
alter table COMMUNITYMEMBER enable constraint SYS_C00717542;
alter table COMMUNITYMEMBER enable constraint SYS_C00717543;
alter table COMMUNITYMEMBER enable constraint SYS_C00717544;
prompt Enabling foreign key constraints for BIRTH...
alter table BIRTH enable constraint SYS_C00717550;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for DRIVER...
alter table DRIVER enable all triggers;
prompt Enabling triggers for DELIVERY...
alter table DELIVERY enable all triggers;
prompt Enabling triggers for FOODDELIVERY...
alter table FOODDELIVERY enable all triggers;
prompt Enabling triggers for SUPPLYSDELIVERY...
alter table SUPPLYSDELIVERY enable all triggers;
prompt Enabling triggers for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER enable all triggers;
prompt Enabling triggers for BIRTH...
alter table BIRTH enable all triggers;

set feedback on
set define on
prompt Done
