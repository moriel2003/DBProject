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
alter table DRIVER disable constraint SYS_C00708671;
prompt Disabling foreign key constraints for DELIVERY...
alter table DELIVERY disable constraint SYS_C00708676;
prompt Disabling foreign key constraints for FOODDELIVERY...
alter table FOODDELIVERY disable constraint SYS_C00708679;
prompt Disabling foreign key constraints for SUPPLYSDELIVERY...
alter table SUPPLYSDELIVERY disable constraint SYS_C00708684;
prompt Disabling foreign key constraints for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER disable constraint SYS_C00708690;
alter table COMMUNITYMEMBER disable constraint SYS_C00708691;
alter table COMMUNITYMEMBER disable constraint SYS_C00708692;
alter table COMMUNITYMEMBER disable constraint SYS_C00708693;
prompt Disabling foreign key constraints for BIRTH...
alter table BIRTH disable constraint SYS_C00708699;
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
values (1000000293, 'Luis', 'Sidney', '38 Oxon', '9N7 1C3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000294, 'Jaime', 'West Sussex', '618 Burwood East Str', '6I3 7K4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000295, 'Suzi', 'Radovljica', '132 Weston Road', '17028');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000296, 'Sander', 'Alessandria', '84 Busey Ave', '23115');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000297, 'Yaphet', 'Bethesda', '44 Thessaloniki Driv', '8411');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000298, 'Belinda', 'Meppel', '8 Tal Road', '2027CE');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000299, 'Dermot', 'Hampton', '95 Coward Street', '29099');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000300, 'Cyndi', 'Suwon', '13rd Street', '10341');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000301, 'Brooke', 'Pirapora bom Jesus', '66 Rhodes Ave', '38610');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000302, 'John', 'Rochester', '58 Bridget Ave', '3333');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000303, 'Daryl', 'Kuopio', '91 Elle Drive', '24570');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000304, 'Don', 'Waldbronn', '642 Raul Road', '16716');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000305, 'Derrick', 'Burr Ridge', '34 Vantaa Drive', '15249');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000306, 'Dean', 'Pensacola', '76 Drew Drive', '32220');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000307, 'Solomon', 'Ottawa', '25 Moriarty Ave', '1U5 1W9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000308, 'Tamala', 'Boston', '1 McDowell', '7522');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000309, 'Anita', 'Copenhagen', '70 DiCaprio Blvd', '18060');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000310, 'Remy', 'Leipzig', '70 Lattimore Blvd', '32916');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000311, 'Hookah', 'Schlieren', '7 Rosario', '10107');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000312, 'Mitchell', 'Mclean', '640 Suzy Road', '11798');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000313, 'Anjelica', 'Matsuyama', '284 Nik Drive', '3702');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000314, 'Bridgette', 'Greenwood Village', '18 Gosdin Street', '22208');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000315, 'Illeana', 'New York City', '97 Daniels Ave', '38721');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000316, 'Gabrielle', 'M?nchen', '72 Campinas', '31875');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000317, 'Judd', 'Z?rich', '27 Oslo Road', '11844');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000318, 'Viggo', 'Lengdorf', '70 Lily Blvd', '3315');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000319, 'Janeane', 'Montreal', '12 Connie Drive', '2D9 4K8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000320, 'Glen', 'Osaka', '25 Stevens Drive', '10578');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000321, 'Gin', 'Tilburg', '33 Lonnie Road', '6227JO');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000322, 'Vondie', 'Aachen', '50 Lincoln Street', '19022');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000323, 'Michael', 'Bedfordshire', '90 Mendoza Road', '4D9 5A9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000324, 'Hilton', 'Fort gordon', '29 Lauper Ave', '10763');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000325, 'Zooey', 'Bangalore', '269 Rhys Drive', '23424');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000326, 'Bernard', 'Battle Creek', '96 Banderas Blvd', '19652');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000327, 'Drew', 'Woking', '52 Irving Street', '2Y4 6E4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000328, 'Vertical', 'K?benhavn', '81 Costello Street', '36936');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000329, 'Burton', 'Anyang-si', '52nd Street', '4342');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000330, 'Larry', 'Shreveport', '8 Houston Drive', '30940');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000331, 'Micky', 'Bkk', '55 LaBelle Road', '5810');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000332, 'Kenny', 'Reading', '96 Kristofferson Str', '0O5 8U7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000333, 'Geoff', 'Lippetal', '54 Chuck Ave', '32063');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000334, 'Carlos', 'Telford', '202 Sursee Street', '5J9 3V6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000335, 'Alessandro', 'Rio Rancho', '218 Lofgren Street', '25027');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000336, 'Ronnie', 'durham', '470 Heche Road', '4A6 4T6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000337, 'Isaac', 'Glendale', '14 Jesus', '23499');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000338, 'Sona', 'Chur', '80 Janney Drive', '24927');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000339, 'Bill', 'Rtp', '94 Gray Street', '22161');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000340, 'Gilberto', 'Geneva', '94 Randal Road', '35235');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000341, 'Guy', 'Baarn', '20 Herzlia Road', '7824FA');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000342, 'Jesus', 'Holderbank', '540 Rawls Street', '22183');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000343, 'Avril', 'Douala', '1 Brickell Street', '25611');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000344, 'Jonny Lee', 'Singapore', '86 Liev Road', '12830');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000345, 'Maureen', 'Laguna Bbeach', '574 Hector', '23005');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000346, 'Kay', 'Radovljica', '15 Gaynor Street', '18652');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000347, 'Kirk', 'Fort Lee', '33 Raul Street', '14413');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000348, 'Chant?', 'Cesena', '12nd Street', '14300');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000349, 'Freddy', 'San Francisco', '965 Gallant', '29253');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000350, 'Willie', 'Istanbul', '44 Fornacette Street', '31687');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000351, 'Nikki', 'Lake worth', '8 Merchant Ave', '9642');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000352, 'Ike', 'Gersthofen', '58 Bedford Drive', '40980');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000353, 'Mary Beth', 'Chorz?w', '5 Beals Drive', '33926');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000354, 'Rosie', 'Orlando', '45 Dennis Road', '15072');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000355, 'Suzy', 'Koufu', '82 Woody', '25229');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000356, 'Frank', 'Spring City', '67 Kay Road', '23173');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000357, 'Tara', 'Novara', '268 Belmont Drive', '16459');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000358, 'Kenny', 'Ljubljana', '85 Shirley Blvd', '19497');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000359, 'Nicky', 'Washington', '76 Fisher Drive', '16170');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000360, 'Arnold', 'Suwon-city', '45 Garfunkel Blvd', '32009');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000361, 'Thomas', 'Chur', '32 Freeman Ave', '25662');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000362, 'Dionne', 'Hearst', '89 Darius Street', '2Y8 1K2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000363, 'Crispin', 'Steyr', '6 Rupert Road', '7295');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000364, 'Laurence', 'Augsburg', '29 Red Drive', '10123');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000365, 'Bernard', 'Bedfordshire', '93 Millie Road', '5B7 0X4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000366, 'Bobbi', 'Brampton', '90 Kelly Blvd', '9L0 6W0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000367, 'Garth', 'Fairborn', '42 Chaplin Drive', '12601');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000368, 'Ty', 'Hiller?d', '76 Turturro Street', '34505');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000369, 'Morris', 'Mariano Comense', '31 Cagle Blvd', '6255');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000370, 'Clay', 'Berkeley', '84 Payne Street', '18885');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000371, 'Melanie', 'Hjallerup', '57 Douglas Drive', '19880');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000372, 'Lizzy', 'Regensburg', '35 Dawson Drive', '6193');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000373, 'Stephanie', 'Heiligenhaus', '32 Wally Street', '36801');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000374, 'Darren', 'Baltimore', '31 Tamala Road', '21315');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000375, 'Mae', 'Irvine', '53rd Street', '24697');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000376, 'Colin', 'Zaandam', '92nd Street', '9108MI');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000377, 'Vincent', 'Benbrook', '35 Copenhagen', '16443');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000378, 'Joaquim', 'Tokushima', '109 Sally Street', '32398');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000379, 'Ned', 'Highlands Ranch', '442 Remar Road', '20278');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000380, 'Gilberto', 'Redwood City', '56 McElhone Drive', '1378');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000381, 'Vondie', 'Vista', '32nd Street', '17707');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000382, 'Lloyd', 'Saga', '82 Rossellini Street', '8589');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000383, 'Cornell', 'Zuerich', '78 Kline', '33495');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000384, 'Arturo', 'Halfway house', '71 Armstrong Drive', '30655');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000385, 'Linda', 'Germantown', '531 Santana do parna', '16496');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000386, 'Lou', 'Friedrichshafe', '545 Oldenburg Drive', '18197');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000387, 'Gord', 'Butner', '55 Paymer Blvd', '16376');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000388, 'Linda', 'Rheinfelden', '73 Oosterhout Road', '2673');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000389, 'Merrilee', 'Bielefeld', '40 Potter Ave', '23796');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000390, 'Joan', 'Pensacola', '204 Lincoln Road', '26097');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000391, 'Bobbi', 'Bologna', '38 Prague', '27233');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000392, 'Frank', 'Potsdam', '88 Remy Street', '39056');
commit;
prompt 100 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000393, 'Christian', 'Cambridge', '53 Ettlingen Blvd', '6579');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000394, 'Carlene', 'Knoxville', '50 Diane Drive', '6473');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000395, 'Paula', 'Halfway house', '38 Milsap Road', '15744');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000396, 'Orlando', 'Cle Elum', '49 Murray Drive', '4528');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000397, 'Juice', 'Harahan', '68 Spall Street', '16411');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000398, 'Donald', 'Cesena', '7 Rockford Road', '26668');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000399, 'Debra', 'Northampton', '7 Bristol Drive', '2L0 7R3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000400, 'Madeline', 'Claymont', '59 Chloe Drive', '30135');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000401, 'Mel', 'Vaduz', '50 Hatchet Road', '3947');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000402, 'Talvin', 'Utsunomiya', '829 Cloris Drive', '38538');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000403, 'Emilio', 'Bellevue', '92 Tramaine Street', '7588');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000404, 'Goldie', 'Durham', '89 Alexander Drive', '1004');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000405, 'Alec', 'Edison', '62 Rochester', '4443');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000406, 'Vondie', 'Mclean', '92 Dermot Road', '4391');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000407, 'Mika', 'Palo Alto', '71 Marburg Blvd', '11879');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000408, 'Jean', 'Echirolles', '16 MacNeil Street', '16181');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000409, 'Samuel', 'Brentwood', '54 Chappelle Street', '17903');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000410, 'Samantha', 'Seoul', '6 Brody Street', '18288');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000411, 'Clint', 'Moscow', '3 Curfman Street', '29507');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000412, 'Hector', 'Summerside', '81st Street', '1N0 3X5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000413, 'Shirley', 'Bham', '250 Meniketti Road', '2309');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000414, 'Josh', 'Lexington', '92nd Street', '21083');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000415, 'Jimmie', 'Purley', '63rd Street', '2E8 8F8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000416, 'Delbert', 'Bristol', '74 Gates Road', '37278');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000417, 'Gavin', 'Leipzig', '14 Oxford Street', '38340');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000418, 'Rich', 'Nagasaki', '51 Rebhorn Drive', '40105');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000419, 'Vickie', 'Niigata', '78 Balk Street', '10109');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000420, 'Anita', 'Cincinnati', '93 Kyra Drive', '36566');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000421, 'Peabo', 'Scottsdale', '53rd Street', '27917');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000422, 'Powers', 'Wichita', '32 Purley', '11695');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000423, 'Zooey', 'Spring City', '86 Bobbi Road', '22220');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000424, 'Christian', 'Richmond', '19 Street Street', '2Q7 0A7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000425, 'Collin', 'Cedar Rapids', '96 Brno Road', '22979');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000426, 'Yaphet', 'Forest Park', '14 Keen Street', '31966');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000427, 'Marina', 'Oshawa', '95 Mollard Drive', '0V1 0B7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000428, 'Crispin', 'Firenze', '507 Caviezel Drive', '16928');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000429, 'Bernard', 'Kungens kurva', '11 Lonsdale Drive', '11364');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000430, 'Orlando', 'Longview', '40 Trace Blvd', '5702');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000431, 'Patrick', 'Shelton', '63rd Street', '18561');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000432, 'Sammy', 'Chennai', '77 Harry Street', '38771');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000433, 'Joely', 'Torino', '71 Petach-Tikva', '2835');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000434, 'Pete', 'Ulsteinvik', '45 Shoreline Street', '17495');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000435, 'Tony', 'Lummen', '17 Gore Street', '15509');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000436, 'Beverley', 'Burlington', '49 Kimberly Road', '34688');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000437, 'Ashley', 'Toulouse', '65 Kista Road', '14873');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000438, 'Rickie', 'New Fairfield', '731 Ellis Drive', '6487');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000439, 'Daryl', 'Pusan-city', '1 Sinatra Ave', '12856');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000586, 'Swoosie', 'Treviso', '75 Hauser Road', '39422');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000587, 'Kirk', 'Kanata', '51 Cherry Drive', '1B3 2D4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000588, 'Derek', 'Ravensburg', '946 Aracruz Street', '19622');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000589, 'Rutger', 'Mountain View', '19 Finn', '23087');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000590, 'Willie', 'Denver', '719 Manning Street', '37458');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000591, 'Brian', 'Reston', '82nd Street', '11269');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000592, 'Jonny', 'Soest', '51st Street', '6125JU');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000593, 'Jarvis', 'Grapevine', '16 Seagal Road', '28939');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000594, 'Catherine', 'Hanover', '67 Reeve Road', '33329');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000595, 'Denise', 'Lengdorf', '20 Richardson Ave', '25531');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000596, 'Kay', 'Zwolle', '74 Veruca Road', '4705SZ');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000597, 'Janeane', 'Westport', '23 L''union Street', '12733');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000598, 'Edwin', 'Bergara', '42 Gatlin Drive', '30166');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000599, 'Jerry', 'Essex', '601 Diesel', '0Y4 6I3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000600, 'Holland', 'Nordhausen', '98 Julianne Street', '21230');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000601, 'Cheech', 'Shenzhen', '887 Jeffreys', '27624');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000602, 'Anthony', 'Huntington Beach', '77 Louise Drive', '8432');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000603, 'Seann', 'Dubai', '8 Fogerty Blvd', '25850');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000604, 'Buddy', 'San Antonio', '22nd Street', '27337');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000605, 'Loreena', 'Bolton', '95 Hanley Street', '7N5 0Z6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000606, 'Cliff', 'Kuopio', '95 Goodman Street', '27861');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000607, 'Anne', 'Albuquerque', '68 Kris Road', '25365');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000608, 'Nicky', 'Charleston', '967 Herford Street', '13185');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000609, 'Karon', 'Sihung-si', '85 Athens Road', '6658');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000610, 'Cuba', 'Hines', '34 Wageningen Road', '25953');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000611, 'Eric', 'Oulu', '58 Freda Drive', '13303');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000612, 'Ramsey', 'Belo Horizonte', '73 Roy Parnell Road', '15403');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000613, 'Nora', 'Burr Ridge', '100 Joey Street', '16231');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000614, 'Ethan', 'Ohita', '299 Reeves Drive', '30597');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000615, 'Albertina', 'Mechelen', '97 Waalwijk Ave', '35448');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000616, 'Chi', 'Rtp', '47 Guilfoyle Ave', '3920');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000617, 'Judy', 'Nuernberg', '2 Swinton Road', '24275');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000618, 'Liam', 'K?benhavn', '32 Sinead Blvd', '19307');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000619, 'Suzi', 'Stockholm', '24 Hersh Street', '18170');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000620, 'Gran', 'East sussex', '11 Stockard Road', '5B4 3H0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000621, 'Josh', 'Lathrop', '28 Meppel', '9834');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000622, 'Adrien', 'Gliwice', '57 Pfeiffer Street', '10752');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000623, 'Luke', 'Lake Forest', '96 Waterloo Road', '34021');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000624, 'Sonny', 'Berlin-Adlershof', '89 Griggs Drive', '8553');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000625, 'Chant?', 'Turku', '40 Thurman Blvd', '6227');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000626, 'Brothers', 'Woking', '32nd Street', '5D0 4B9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000627, 'Corey', 'Pacific Grove', '427 Ramsey Street', '22888');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000628, 'Emm', 'Marburg', '94 Rachael Drive', '5981');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000629, 'Eliza', 'Heubach', '1 Juliette Street', '20358');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000630, 'Gavin', 'Matsue', '49 Schneider', '27524');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000631, 'Treat', 'M?nchengladbach', '61 Gryner Street', '17399');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000632, 'Marc', 'Gliwice', '21 Akins Road', '17710');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000633, 'Willie', 'Olsztyn', '23rd Street', '26314');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000634, 'France', 'Canal Winchester', '71st Street', '35346');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000635, 'Aida', 'Irving', '10 Marley Street', '28714');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000636, 'Charles', 'Irving', '15 Vanderbijlpark Bl', '4293');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000637, 'Stellan', 'Guelph', '80 Magnuson Street', '4Y3 2O3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000638, 'Wes', 'Streamwood', '5 Jamal Street', '22525');
commit;
prompt 200 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000639, 'Maggie', 'Athens', '386 Checker Street', '39020');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000640, 'Ellen', 'Kansas City', '1 Londrina', '39339');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000641, 'Brad', 'Kungki', '488 Schenectady Stre', '14189');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000642, 'Sonny', 'Raleigh', '994 Aberdeen Road', '17252');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000643, 'Clarence', 'Northampton', '81 Warden Road', '6J0 3K0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000644, 'Jean-Claude', 'Rua eteno', '68 Embeth Road', '7564');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000645, 'Teena', 'Ebersberg', '15 Clooney Road', '6059');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000646, 'Chely', 'Montreal', '32 Warburton Road', '3L8 0J5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000647, 'Alicia', 'Allen', '64 Ranger Street', '5171');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000648, 'Elisabeth', 'Spresiano', '73rd Street', '37274');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000649, 'Dustin', 'Bristol', '20 Andy Drive', '4G5 8K7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000650, 'Nile', 'Sidney', '82 Cale Road', '3Z6 1P4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000651, 'Thin', 'Durban', '3 Parish Drive', '22416');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000652, 'Omar', 'Newbury', '17 San Francisco Str', '15447');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000653, 'Bridgette', 'Boise', '42 Pesci Street', '1977');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000654, 'Gavin', 'Juazeiro', '93 DiCaprio Road', '38340');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000655, 'Chazz', 'Key Biscayne', '798 Lake Bluff Road', '6903');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000656, 'Ceili', 'Hartmannsdorf', '84 Paxton Road', '17766');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000657, 'Fats', 'Herzlia', '67 Burr Ridge Street', '31022');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000658, 'Earl', 'Ringwood', '35 Lattimore Drive', '23424');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000659, 'Clint', 'Deerfield', '11st Street', '36599');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000660, 'Wayman', 'Kaunas', '9 Salt Street', '1408');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000661, 'Lucinda', 'Singapore', '40 Sedgwick Ave', '27414');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000662, 'Dabney', 'Wakayama', '55 Bratislava Road', '16343');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000663, 'Russell', 'Mount Laurel', '204 Brooke Road', '16358');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000664, 'Stewart', 'Rochester', '13 Roma Drive', '20569');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000665, 'Danni', 'Sundsvall', '24 Douala', '31350');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000666, 'Samantha', 'Or-yehuda', '37 New York City Roa', '1270');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000667, 'Karen', 'Tartu', '58 Sevenfold Drive', '40985');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000668, 'Charlie', 'Stuttgart', '88 Joely Road', '7135');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000669, 'Emilio', 'S. Bernardo do Campo', '2 Carlton Street', '2145');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000670, 'Hazel', 'Alcobendas', '15 Obfelden Street', '39288');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000671, 'Cevin', 'Milton Keynes', '4 Browne Blvd', '8Y3 5A6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000672, 'Dabney', 'Lima', '946 Fairbanks Road', '37694');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000673, 'Norm', 'South Jordan', '828 Lea Road', '6272');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000674, 'Campbell', 'Rosario', '44 Maguire Drive', '5154');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000675, 'Judge', 'Nantes', '62 Skerritt Road', '8176');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000676, 'Hal', 'Den Haag', '53rd Street', '8760CF');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000677, 'Harris', 'St. Louis', '18 Scorsese Road', '12881');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000678, 'Karen', 'Mapo-gu', '87 Chuck Road', '12183');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000679, 'Jaime', 'L''union', '60 Gordie Drive', '40560');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000680, 'Sigourney', 'Towson', '78 Stans Drive', '33246');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000681, 'Dave', 'Houma', '100 Leonardo Road', '4135');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000682, 'Saul', 'Mablethorpe', '13 Cash Blvd', '2G5 7P9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000683, 'Alfie', 'Sydney', '94 Fuerth Road', '26160');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000684, 'Greg', 'Kejae City', '17 Hilton Road', '11309');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000685, 'Lindsay', 'Mainz-kastel', '757 Pleasence Road', '39910');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000686, 'Nanci', 'Cape town', '53 Chinlund Road', '10675');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000687, 'Kieran', 'Germantown', '65 North bethesda', '33760');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000688, 'Mos', 'Baarn', '939 Harary Blvd', '6908DT');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000689, 'Avril', 'Englewood Cliffs', '13 Tilly Drive', '6614');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000690, 'Percy', 'Pirapora bom Jesus', '8 Merrilee Road', '17593');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000691, 'Angela', 'Rheinfelden', '2 Niigata Road', '38681');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000692, 'Kate', 'Milsons Point', '24 Lyonne Road', '25078');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000693, 'Vince', 'Burgess Hill', '31st Street', '1K5 4P9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000694, 'Lynette', 'Santana do parna?ba', '5 MacPherson', '40979');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000695, 'Woody', 'Den Haag', '17 MacIsaac Road', '2475GL');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000696, 'Neil', 'Dinslaken', '33 Denis Street', '21276');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000697, 'Anna', 'Swarthmore', '50 Ceasar Street', '28837');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000698, 'Maxine', 'Amsterdam', '63rd Street', '1499SL');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000699, 'Cesar', 'Bekescsaba', '68 Damon Drive', '8446');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000700, 'Linda', 'Douala', '75 Ving Road', '20458');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000701, 'Angie', 'Dublin', '48 Lange Drive', '9079');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000702, 'Nicholas', 'Amsterdam', '91st Street', '8204YE');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000703, 'James', 'Santorso', '58 Assante Ave', '8997');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000704, 'Powers', 'Lyon', '74 Vantaa Ave', '3515');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000705, 'Miranda', 'Hartford', '66 Hawke Street', '3951');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000706, 'Eric', 'Milpitas', '27 Lance Ave', '27815');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000707, 'Busta', 'Reykjavik', '353 Lyonne Road', '27808');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000708, 'Julio', 'Colombo', '925 Hank', '19051');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000709, 'Jonatha', 'Silver Spring', '51 Avon', '10501');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000710, 'Davey', 'Bellevue', '70 Sarsgaard Street', '40452');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000711, 'Heath', 'Mainz-kastel', '388 Portsmouth Stree', '40633');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000712, 'Davy', 'Takamatsu', '94 Oldham Drive', '6206');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000713, 'Samuel', 'Ramat Gan', '753 Farris', '23104');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000714, 'Michael', 'Cle Elum', '95 Murphy', '26765');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000715, 'Katrin', 'Offenburg', '81 Houma Road', '17514');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000716, 'Parker', 'Ann Arbor', '30 Dzundza Road', '27640');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000717, 'Randy', 'Somerset', '29 Chaka Street', '12097');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000718, 'Maggie', 'Huntington', '19 Diehl Street', '12948');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000719, 'Boz', 'Marlboro', '50 Bronx Street', '28389');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000720, 'Nicolas', 'Athens', '53rd Street', '9578');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000721, 'Andrea', 'Woking', '77 Holiday Drive', '0I7 3D7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000722, 'Uma', 'West Launceston', '71 Rod Street', '20693');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000723, 'Campbell', 'Kopavogur', '52 Marina Drive', '7758');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000724, 'Dar', 'Bielefeld', '456 Midler Blvd', '37032');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000725, 'Lena', 'Herndon', '957 Cledus Blvd', '2529');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000726, 'Crispin', 'Ithaca', '70 Yaphet', '5952');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000727, 'Bruce', 'Cle Elum', '55 Rheinfelden Drive', '22904');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000728, 'Will', 'Biel', '94 Spencer', '27361');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000729, 'Kevin', 'Calgary', '761 Rimini Blvd', '3S5 0N8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000730, 'CeCe', 'Parsippany', '6 Berenger Blvd', '23029');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000440, 'Larry', 'Woodland Hills', '96 Holly Drive', '12539');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000441, 'Leelee', 'Southampton', '14 Pompeia Road', '9Y0 9J5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000442, 'Tanya', 'Reykjavik', '19 Fiennes Drive', '17609');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000443, 'Nils', 'Exeter', '28 Hornsby', '5097');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000444, 'Meg', 'Sarasota', '72 Paul Road', '37141');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000445, 'Ann', 'Bangalore', '10 Brosnan Drive', '23625');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000446, 'Christian', 'San Francisco', '45 Lewis Street', '10486');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000447, 'Carole', 'Stans', '91 Malone Ave', '29214');
commit;
prompt 300 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000448, 'Nils', 'Drogenbos', '32nd Street', '28842');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000449, 'Chuck', 'Gersthofen', '36 Edenbridge Road', '36152');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000450, 'Peter', 'Dorval', '97 Keitel Road', '0H4 2X2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000451, 'Maceo', 'Redwood City', '4 Church Ave', '17791');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000452, 'Kyle', 'Rorschach', '64 Wayne Drive', '1871');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000453, 'Treat', 'Kaunas', '416 Elias Street', '12963');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000454, 'Ann', 'West Lafayette', '856 Leto Ave', '17523');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000455, 'Carlos', 'Bronx', '45 Tracy Drive', '18110');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000456, 'Rob', 'Newbury', '63 Austin Ave', '35113');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000457, 'Busta', 'Pottendorf', '72 Ben-Gurion Street', '17133');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000458, 'Mia', 'Rochester', '361 Dawson Street', '39456');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000459, 'Pam', 'Karlstad', '35 Kurtz', '31529');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000460, 'Bernard', 'Aracruz', '76 Salisbury Road', '28383');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000461, 'Sarah', 'Plymouth Meeting', '72 Merchant Road', '10702');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000462, 'Janeane', 'Glen Cove', '40 Nash Road', '5520');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000463, 'Luis', 'North bethesda', '21 Vince', '19703');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000464, 'Kate', 'Sacramento', '32 Cattrall Blvd', '15503');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000465, 'Jeffery', 'Bern', '12 Bruce Drive', '8684');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000466, 'Woody', 'Dartmouth', '72 Mariano Comense S', '5C3 2S2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000467, 'Tom', 'Northbrook', '82 Carrie-Anne Stree', '18249');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000468, 'Greg', 'Winterthur', '85 Morrison Street', '30532');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000469, 'Nick', 'Melbourne', '22nd Street', '9186');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000470, 'Wally', 'Swannanoa', '99 Rascal Road', '15773');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000471, 'Cesar', 'Oak park', '5 Shalhoub Street', '37451');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000472, 'Maxine', 'Monterey', '69 Rio Street', '19248');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000473, 'Geena', 'Chapel hill', '71 McConaughey Drive', '24337');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000474, 'Salma', 'K?ln', '65 Bremen Street', '30603');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000475, 'Chi', 'Londrina', '75 McBride Blvd', '4084');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000476, 'Suzanne', 'Buffalo Grove', '651 Brad Road', '12049');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000477, 'Phil', 'Augst', '79 Santa Clarita Dri', '9812');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000478, 'Milla', 'Salisbury', '32 Hawthorne Ave', '15849');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000479, 'Cherry', 'Veenendaal', '42 Judi Street', '1273WS');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000480, 'Judi', 'Belgrad', '99 Furay Street', '31209');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000481, 'Chely', 'San Diego', '71st Street', '10874');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000482, 'Sandra', 'Valladolid', '57 Nathan Road', '22131');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000483, 'Vanessa', 'Yokohama', '26 Capshaw Street', '3363');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000484, 'Tea', 'Arlington', '26 Teng Road', '25662');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000485, 'Andrae', 'Enschede', '190 Robards Street', '3831ZW');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000486, 'Jarvis', 'St-bruno', '35 Eder Drive', '5G3 8A7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000487, 'Gailard', 'Arlington', '48 Zipf Street', '7053');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000488, 'Spike', 'Slough', '36 Tilst Street', '5S6 0P0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000489, 'Juliette', 'G?vle', '47 Harrison Street', '29035');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000490, 'Jason', 'Burlington', '85 Woody Street', '1260');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000491, 'Vanessa', 'Lyngby', '23 Cromwell Road', '35002');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000492, 'Keith', 'Ismaning', '43 Rhett Drive', '13013');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000493, 'Kieran', 'Singapore', '67 Roberta Drive', '13633');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000494, 'Avenged', 'Redding', '10 Kristin Ave', '20968');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000495, 'Rodney', 'Durham', '215 Holy', '17089');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000496, 'Bradley', 'Auckland', '91 Rydell Road', '10104');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000497, 'Carla', 'Orleans', '871 Benbrook Street', '13939');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000498, 'Stockard', 'Fuerth', '14 Lizzy Drive', '16938');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000499, 'Jeremy', 'Sutton', '612 Lindsay Street', '6329');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000500, 'Patti', 'Yucca', '414 Fishburne Road', '18883');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000501, 'Kenneth', 'Valencia', '78 Dylan Road', '29218');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000502, 'Joseph', 'Neustadt', '25 Belp', '6085');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000503, 'Christian', 'Libertyville', '32 Mann Street', '13927');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000504, 'Jean-Luc', 'Th?rishaus', '46 Palin Ave', '37538');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000505, 'Chrissie', 'Hampton', '94 Baker Road', '9186');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000506, 'Carla', 'Atlanta', '74 Unger Drive', '37061');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000507, 'Lupe', 'Miami', '32 Webster Groves Ro', '24856');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000508, 'Robin', 'Pusan-city', '78 Spike Blvd', '18242');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000509, 'Forest', 'Woking', '19 Tanon Street', '6P9 8Q3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000510, 'Minnie', 'Huntington', '89 Dunaway Road', '6808');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000511, 'Minnie', 'Grapevine', '34 Francis Street', '10322');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000512, 'Illeana', 'Lahr', '53 Saxon Road', '31698');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000513, 'Howard', 'Pearland', '14 Gaynor Blvd', '25719');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000514, 'Willem', 'Chur', '34 Paula Street', '36648');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000515, 'Sammy', 'Piacenza', '84 Rob Street', '32650');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000516, 'Janeane', 'Ljubljana', '489 Dutton Ave', '31975');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000517, 'Rosanna', 'Rockford', '135 Carrington', '28850');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000518, 'Beverley', 'Rockford', '798 Nancy Ave', '15742');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000519, 'Angelina', 'West Point', '837 Braugher Road', '23926');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000520, 'Giancarlo', 'Bergen', '98 Statham Drive', '34672');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000521, 'Meredith', 'Bern', '448 Gertner Road', '40789');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000522, 'Tracy', 'Dunn loring', '174 Wine Blvd', '38178');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000523, 'Blair', 'Westfield', '76 W?rzburg Road', '36575');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000524, 'Matthew', 'San Jose', '96 Isaac Street', '7018');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000525, 'Paula', 'Hanover', '58 Bryson Street', '6474');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000526, 'Mindy', 'Enschede', '54 Riverdale Road', '6984SQ');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000527, 'Kris', 'Sarasota', '44 Hilary Road', '28874');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000528, 'Juliana', 'San Ramon', '72nd Street', '3303');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000529, 'Roger', 'Salisbury', '18 Walsh Drive', '12458');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000530, 'Mary', 'Fairfax', '92nd Street', '12532');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000531, 'Diamond', 'New Delhi', '89 Barry', '4367');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000532, 'Billy', 'Paal Beringen', '58 Candice Street', '32909');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000533, 'Nathan', 'Athens', '49 Foster City Stree', '40431');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000534, 'Maureen', 'Somerset', '489 Shoreline Road', '33309');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000535, 'Nicole', 'Thames Ditton', '94 Armin Street', '8M9 7F4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000536, 'Chubby', 'Orlando', '12 Carr Street', '4635');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000537, 'Sara', 'Chapeco', '47 Balaban Ave', '16782');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000538, 'Kevn', 'Budapest', '39 Purefoy Drive', '29834');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000539, 'Wally', 'T?by', '38 Breckin Ave', '6549');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000540, 'Gavin', 'Crete', '8 Breslin Street', '35170');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000541, 'Carlene', 'Monmouth', '506 Street Road', '24007');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000542, 'Melanie', 'Horb', '99 Niven', '29280');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000543, 'Nickel', 'Fremont', '49 Tripplehorn Stree', '6395');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000544, 'Marisa', 'Paisley', '19 Rodriguez Street', '4B7 3Y1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000545, 'Lena', 'Nagano', '64 Andre Road', '9564');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000546, 'Bryan', 'durham', '62nd Street', '4D2 9V4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000547, 'Raymond', 'Olsztyn', '38 Vienna Road', '22582');
commit;
prompt 400 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000548, 'Martha', 'Pointe-claire', '27 Jay Drive', '9X6 5B6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000549, 'Leslie', 'Pompton Plains', '8 Pitney', '17180');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000550, 'Rose', 'Redondo beach', '34 Jovovich Drive', '19898');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000551, 'Nicolas', 'Bangalore', '31 Bancroft Street', '23680');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000552, 'Gilbert', 'Kaohsiung', '26 Brock Road', '38700');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000553, 'Ronnie', 'Roma', '63rd Street', '3295');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000554, 'Alannah', 'Lippetal', '38 Capshaw Street', '14095');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000555, 'April', 'Laredo', '84 Humphrey Road', '6638');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000556, 'Elias', 'Tucson', '93 Ricardson Street', '32365');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000557, 'Frederic', 'Novara', '33 Ratzenberger Road', '27656');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000558, 'Pelvic', 'Milano', '78 Saint Paul Road', '24411');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000559, 'Uma', 'Shizuoka', '25 Jordan Blvd', '40073');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000560, 'Mira', 'Breda', '22 Barcelona', '4688NC');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000561, 'Dwight', 'Bronx', '5 McGoohan Drive', '38382');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000562, 'Gordie', 'Richmond', '82nd Street', '9W3 3B9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000563, 'Cheryl', 'Loveland', '722 Jose Drive', '33264');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000564, 'Dustin', 'Linz', '66 Khan Road', '16155');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000565, 'Philip', 'Pa?o de Arcos', '52 Geggy Drive', '22780');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000566, 'Alicia', 'Rua eteno', '21 El Segundo Drive', '11276');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000567, 'Marty', 'Rimini', '87 Slidel Drive', '19315');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000568, 'Gladys', 'Almaty', '6 Bobby Street', '40133');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000569, 'Robin', 'Boulogne', '77 Henstridge Ave', '19887');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000570, 'Harriet', 'Guadalajara', '874 Thompson Blvd', '26332');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000571, 'Jake', 'Vienna', '71 Franco Drive', '34835');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000572, 'Herbie', 'Nyn?shamn', '301 Polito Ave', '21085');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000573, 'Martha', 'Beaverton', '98 Groton Road', '16883');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000574, 'Corey', 'Lathrop', '8 Todd Drive', '16488');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000575, 'Henry', 'Greenville', '57 Starr Drive', '3470');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000576, 'Michelle', 'Cary', '42 Slmea Street', '30472');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000577, 'Jean-Luc', 'Winnipeg', '25 Gershon Road', '4V7 5O1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000578, 'Olympia', 'Kristiansand', '41 Kitty Street', '21472');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000579, 'Val', 'Kuopio', '4 Duschel Road', '20179');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000580, 'Cuba', 'Derwood', '27 Valladolid', '11618');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000581, 'Shelby', 'Glenshaw', '85 Calle Blvd', '29479');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000582, 'Billy', 'Gothenburg', '33rd Street', '30925');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000583, 'Leon', 'Grapevine', '17 Stormare Street', '4061');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000584, 'Isabella', 'Mechanicsburg', '95 White Street', '5748');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000585, 'Ashton', 'Mogi Guacu', '7 Pasadena Street', '20851');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000000, 'Maria', 'Chinnor', '5 Porter Street', '5R6 7M1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000001, 'Rod', 'Ribeirao preto', '978 Ontiveros Street', '34852');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000002, 'Tyrone', 'Matsue', '39 Chubby Road', '6966');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000003, 'Phil', 'Aurora', '34 Finn Drive', '31262');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000004, 'Kiefer', 'Dinslaken', '73 Greene Street', '28187');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000005, 'Jonny', 'New orleans', '86 Esposito Road', '7818');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000006, 'Juliet', 'Billund', '218 Church', '29812');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000007, 'Gaby', 'Aiken', '139 Stevie Road', '37335');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000008, 'Rosario', 'Dortmund', '700 Santorso', '30256');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000009, 'Tara', 'Burlington', '57 Witherspoon Ave', '36134');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000010, 'Jesse', 'Cambridge', '14 Mantova Street', '3N5 9P6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000011, 'Solomon', 'Swarthmore', '23 Unger Drive', '8440');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000012, 'Donna', 'Vallauris', '9 Rosanna Blvd', '5893');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000013, 'Cevin', 'Bham', '734 Wehrheim Drive', '35801');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000014, 'Sissy', 'Dublin', '31st Street', '35350');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000015, 'Luke', 'Caguas', '77 Taoyuan Road', '22579');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000016, 'Nina', 'Lisbon', '91 Gertner Ave', '28909');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000017, 'Carla', 'Abbotsford', '814 Piacenza Road', '37063');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000018, 'Barbara', 'Fairbanks', '96 Torres Street', '11090');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000019, 'Courtney', 'Tustin', '32 Salvador Blvd', '22054');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000020, 'Pam', 'Smyrna', '14 Charlie Street', '7411');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000021, 'Gladys', 'Vista', '625 Chubby Drive', '30745');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000022, 'Selma', 'Kista', '82 Kid Street', '3625');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000023, 'Mac', 'Minneapolis', '45 Durham Drive', '33800');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000024, 'Vince', 'Gauteng', '11 Cotton Drive', '21410');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000025, 'Bridgette', 'Manaus', '41 Cara Road', '2162');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000026, 'Malcolm', 'Jakarta', '97 Rade', '7819');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000027, 'Gran', 'Suffern', '33 Sylvian Blvd', '2860');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000028, 'Rip', 'Streamwood', '349 Gertner Street', '3625');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000029, 'Cuba', 'Rotterdam', '83 Daniels Street', '3505QU');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000030, 'Dave', 'Oyten', '98 Salt', '33119');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000031, 'Taryn', 'Battle Creek', '90 Melvin Blvd', '13513');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000032, 'Elizabeth', 'Scottsdale', '80 Sewell Blvd', '3717');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000033, 'Manu', 'Somerset', '83rd Street', '22725');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000034, 'Corey', 'Rheinfelden', '121 Wagner Road', '3453');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000035, 'Pablo', 'Middletown', '66 Eschen', '15888');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000036, 'Hugo', 'Pacific Grove', '93 Dublin Road', '33362');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000037, 'Brent', 'Horsham', '54 Cotton Road', '6V5 7A1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000038, 'Breckin', 'Wavre', '137 Petula Street', '24494');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000039, 'Avenged', 'Agoncillo', '9 Garland Street', '31268');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000040, 'Claude', 'Archbold', '70 Johnson Street', '28140');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000041, 'Jonny Lee', 'St Jean de Soudain', '5 Baez Street', '38395');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000042, 'Willie', 'Wellington', '132 Noah Drive', '10522');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000043, 'Kay', 'West Lafayette', '89 Flower mound Ave', '37261');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000044, 'Madeleine', 'Gifu', '36 Southend on Sea B', '39292');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000045, 'Natalie', 'Wichita', '43 Mandrell Road', '11949');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000046, 'Merrilee', 'Niles', '28 Northampton Stree', '20536');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000047, 'Ahmad', 'Nantes', '9 Detmer Road', '17084');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000048, 'Ralph', 'Obfelden', '97 Telford Ave', '36858');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000049, 'John', 'Marietta', '15 Mablethorpe Drive', '12029');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000050, 'Charlie', 'Butner', '76 Rodney Street', '34792');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000051, 'Peter', 'Rorschach', '33 Gray Drive', '18978');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000052, 'Angelina', 'Meerbusch', '45 Makeba Road', '39742');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000053, 'Goran', 'Gdansk', '31 Avril Road', '14039');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000054, 'Kevn', 'Santiago', '21 Minnie Street', '21429');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000055, 'Vickie', 'Cle Elum', '56 Emmerich Road', '7304');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000056, 'Franco', 'Chennai', '39 Molina Road', '9114');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000057, 'Gino', 'Boston', '21 Flack Road', '25390');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000058, 'Johnnie', 'Zwolle', '7 Stuart Ave', '3531FU');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000059, 'George', 'O''fallon', '6 Giancarlo Road', '22149');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000060, 'Jake', 'Narrows', '11 Bruce Road', '9530');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000061, 'Ivan', 'Southend on Sea', '81st Street', '1E3 3O6');
commit;
prompt 500 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000062, 'Cledus', 'Bolzano', '111 Henstridge Road', '21413');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000063, 'Oliver', 'Herne', '74 Duncan Road', '15527');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000064, 'Patty', 'Enschede', '84 Cervine Road', '8229PY');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000065, 'Taryn', 'Paraju', '42nd Street', '39850');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000066, 'Leelee', 'Ft. Lauderdale', '87 Mekhi Street', '9917');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000067, 'Joanna', 'Archbold', '4 Mindy Street', '10851');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000068, 'Alessandro', 'Lexington', '74 Warren Drive', '38088');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000069, 'Richard', 'Rheinfelden', '57 Flanagan Road', '31987');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000070, 'Jesse', 'Exeter', '717 Popper Street', '7033');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000071, 'Patricia', 'Fairfax', '90 St Leonards Road', '2341');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000072, 'Lucinda', 'Charlotte', '11st Street', '19634');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000073, 'Annie', 'Bethesda', '52nd Street', '1403');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000074, 'Ramsey', 'Winnipeg', '98 Mapo-gu Street', '4M3 1R6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000075, 'Brendan', 'Birmingham', '5 Epps Street', '0E5 8G6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000076, 'Gordie', 'Blue bell', '5 Reykjavik Blvd', '39432');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000077, 'Alfred', 'Pecs', '604 Howard Blvd', '14824');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000078, 'Graham', 'Belo Horizonte', '680 Horton Drive', '13707');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000079, 'Mena', 'Hamburg', '53 Bacharach Ave', '39520');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000080, 'Ian', 'Bollensen', '34 Mississauga Blvd', '31306');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000081, 'Aidan', 'Smyrna', '33 Ethan Ave', '4620');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000082, 'Rascal', 'Lisboa', '35 Vin Street', '6607');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000083, 'Bebe', 'Nepean', '63 Sayer Road', '9J0 2Q2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000084, 'Morgan', 'Barcelona', '56 Shocked Road', '4600');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000085, 'Armin', 'Londrina', '37 Al Road', '23622');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000086, 'Christina', 'Leimen', '643 Clint Street', '30752');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000087, 'Bradley', 'Kerava', '78 Ipswich Road', '18687');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000088, 'Lydia', 'Milsons Point', '17 McGoohan Road', '20129');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000089, 'Burton', 'Reykjavik', '75 Goodall Street', '13337');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000090, 'Connie', 'K?ln', '463 Nina Drive', '16735');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000091, 'Chubby', 'Mablethorpe', '12nd Street', '7B1 4P6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000092, 'Lance', 'Lakewood', '40 Wiedlin Road', '27641');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000093, 'Famke', 'Leverkusen', '16 Masur Street', '20015');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000094, 'Philip', 'Oldwick', '71 Channing Road', '3918');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000095, 'Vertical', 'Coburg', '43 Meniketti Street', '18485');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000096, 'Greg', 'Knutsford', '895 Archbold Road', '1Q3 2B3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000097, 'Gino', 'Framingaham', '25 Hatosy Road', '20388');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000098, 'Nicholas', 'Veenendaal', '39 Liotta Street', '8521LX');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000099, 'Gordie', 'Royersford', '57 Wavre Drive', '25328');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000100, 'Tony', 'Hunt Valley', '44 Curry Street', '3495');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000101, 'Xander', 'Herdecke', '82 Jerry Road', '1811');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000102, 'Jane', 'Cannock', '90 Hawn Blvd', '9Y9 2J9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000103, 'Mika', 'Piacenza', '76 Frederiksberg Ave', '12955');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000104, 'Jann', 'Southampton', '97 Brando Drive', '8V0 1U3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000105, 'Natascha', 'Tallahassee', '81st Street', '36525');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000106, 'Sandra', 'Silverdale', '16 Barueri Blvd', '13957');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000107, 'Ashton', 'East sussex', '13 Antonio Road', '2S4 4O0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000108, 'Cledus', 'Takapuna', '218 Juno Beach', '25015');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000109, 'Daryle', 'Valencia', '886 San Dimas Road', '24186');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000110, 'Liev', 'Neuch?tel', '54 Diehl', '26424');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000111, 'Annette', 'Doncaster', '12nd Street', '3L1 2X9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000112, 'Rade', 'Dardilly', '49 Hersh Street', '30018');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000113, 'Sheryl', 'Research Triangle', '30 Plimpton Drive', '31980');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000114, 'Albert', 'Karlsruhe', '42 Azaria', '10138');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000115, 'Mike', 'Tilst', '41 Liotta Road', '36537');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000116, 'Freda', 'Solon', '30 Favreau Street', '16111');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000117, 'Nicholas', 'West Drayton', '556 Silverman', '6M8 6V3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000118, 'Brendan', 'Reisterstown', '969 Sophie Road', '38287');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000119, 'Nick', 'Boucherville', '14 Mewes Ave', '9P2 1T1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000120, 'John', 'High Wycombe', '62 Curt Street', '6X8 0R9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000121, 'Hugo', 'Alexandria', '70 Sanchez Street', '18620');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000122, 'Ernie', 'Warszawa', '10 Johansson Street', '23020');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000123, 'Roy', 'Tokushima', '27 Alana Road', '32660');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000124, 'Chi', 'Kreuzau', '75 Archer Drive', '27050');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000125, 'Lindsey', 'Pacific Grove', '39 Keeslar Road', '29402');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000126, 'Juliana', 'East Providence', '164 Ribisi Road', '18938');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000127, 'Colin', 'Bartlett', '1 Linda Road', '29725');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000128, 'Denny', 'Baarn', '54 Machine', '9073KQ');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000129, 'Scarlett', 'Cleveland', '44 Caroline Ave', '27724');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000130, 'Jason', 'Columbia', '67 Stevens Street', '21673');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000131, 'Buffy', 'Kungens kurva', '49 Ronnie Road', '18039');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000132, 'Salma', 'Lund', '42nd Street', '25958');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000133, 'Nile', 'Carson City', '87 Bruce Ave', '29928');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000134, 'Dar', 'Oak park', '458 Schiff Drive', '18713');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000135, 'Pam', 'Sursee', '24 Joanna Road', '24253');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000136, 'Uma', 'Pirapora bom Jesus', '56 Lawrence Drive', '7582');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000137, 'Nils', 'Zurich', '97 Arkin Blvd', '35009');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000138, 'Leelee', 'Waco', '621 Paquin Road', '29904');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000139, 'Heath', 'Highlands Ranch', '649 Lenny Road', '32603');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000140, 'Larry', 'Sao paulo', '20 Candy Drive', '35210');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000141, 'Lizzy', 'Ann Arbor', '59 Chambers Street', '40628');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000142, 'Lenny', 'Melbourne', '91st Street', '28816');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000143, 'Rufus', 'Sutton', '91 Lipnicki Blvd', '27685');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000144, 'Gladys', 'Rocklin', '98 Elizabeth Blvd', '9681');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000145, 'Roger', 'Arlington', '41 Schiff Street', '21035');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000146, 'Kathleen', 'Albany', '78 Oak Park Ave', '40068');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000147, 'Samuel', 'Coquitlam', '43rd Street', '1J0 3I0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000148, 'Brendan', 'Richmond', '25 West Chester Stre', '22262');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000149, 'Rascal', 'Bozeman', '71 Moe', '16182');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000150, 'Kris', 'Lima', '147 Murray Drive', '35128');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000151, 'Rosanna', 'Maryville', '71st Street', '14138');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000152, 'Dave', 'Oldham', '21 Julie Drive', '3X6 4D6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000153, 'Paul', 'Manaus', '13rd Street', '12563');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000154, 'Yaphet', 'Stone Mountain', '93 Johnette Street', '19333');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000155, 'Renee', 'Zurich', '26 Tokyo Road', '20522');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000156, 'Antonio', 'Salem', '237 Rip Ave', '28875');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000157, 'Larnelle', 'Freising', '30 Fonda', '24237');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000158, 'Mark', 'St-bruno', '37 Dermot Drive', '9E9 1Z0');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000159, 'Annie', 'Saitama', '62 Branch Road', '39005');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000160, 'Gabriel', 'Fukushima', '56 Getty Road', '36198');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000161, 'Val', 'Lima', '33 Todd Drive', '34341');
commit;
prompt 600 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000162, 'Madeleine', 'Bangalore', '1 Skerritt Ave', '8224');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000163, 'Terry', 'Tempe', '53 Bruxelles Road', '22925');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000164, 'Remy', 'Zwolle', '99 Irati Street', '2680JC');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000165, 'Raymond', 'Pointe-claire', '14 Worrell Drive', '3F8 5Z8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000166, 'Kirsten', 'San Jose', '31st Street', '12187');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000167, 'Katie', 'Farmington Hills', '48 LaBelle Drive', '3914');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000168, 'James', 'Stockholm', '69 Gertner Street', '21066');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000169, 'April', 'Rozenburg', '86 Ellicott City Blv', '0645QH');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000170, 'Bo', 'Stavanger', '71 Hopper Road', '1591');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000171, 'Donald', 'Unionville', '21 Baker Street', '0V8 8O6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000172, 'Rachel', 'Erlangen', '86 Costa Street', '21402');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000173, 'Arnold', 'Yomgok-dong', '10 Happy Valley Stre', '38714');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000174, 'Sheryl', 'Bremen', '52nd Street', '14345');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000175, 'Mary-Louise', 'Warrington', '747 Margolyes', '6G4 2V8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000176, 'Buddy', 'Buffalo', '72nd Street', '7G5 7M5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000177, 'Hugo', 'Rozenburg', '35 Irene Street', '1376HJ');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000178, 'Penelope', 'Mumbai', '91 Rozenburg Drive', '23866');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000179, 'Avenged', 'Lakewood', '21st Street', '30660');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000180, 'Temuera', 'Ohita', '676 Jacksonville Str', '19752');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000181, 'Latin', 'Shawnee', '31 Neustadt Blvd', '31993');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000182, 'Elias', 'Caguas', '214 Avenged Blvd', '24605');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000183, 'Robin', 'Avon', '17 Cheryl Ave', '7952');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000184, 'Deborah', 'Vanderbijlpark', '33 Luis Road', '13169');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000185, 'Maura', 'Yucca', '480 Bullock Road', '9577');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000186, 'Spike', 'Menlo Park', '27 Bryson Road', '40212');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000187, 'Dionne', 'Bischofshofen', '50 Nancy Road', '2077');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000188, 'Meryl', 'Verdun', '82 Th?rishaus Ave', '9X9 7I1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000189, 'Connie', 'Mount Laurel', '38 New York City Ave', '7085');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000190, 'Kylie', 'Osaka', '394 Connie Ave', '2849');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000191, 'Seth', 'Orlando', '8 Hilton Street', '35353');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000192, 'Elijah', 'Scottsdale', '14 Newman Ave', '29165');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000193, 'Rory', 'Suwon-city', '45 Noseworthy', '15894');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000194, 'Emma', 'Towson', '81 McGill Blvd', '17272');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000195, 'Sander', 'Birmingham', '77 Santana Blvd', '6D7 0B4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000196, 'Lauren', 'Brossard', '74 Morales', '9P2 3X7');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000197, 'Suzanne', 'Coquitlam', '365 Englund Street', '9S3 7Y9');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000198, 'Jay', 'Meerbusch', '38 Ving Street', '21725');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000199, 'Davey', 'Elche', '92 Scaggs Blvd', '1450');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000200, 'Art', 'Houston', '90 Gosdin Road', '33899');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000201, 'Juice', 'Sidney', '32nd Street', '8W2 2E5');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000202, 'Marty', 'Rosario', '84 Pfeiffer Street', '31946');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000203, 'Ritchie', 'Bologna', '546 Pacino Drive', '13714');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000204, 'Elijah', 'Manchester', '100 Edmonton Road', '2S8 2D8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000205, 'Morgan', 'Coventry', '82nd Street', '7K6 6H6');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000206, 'Amy', 'Yogyakarta', '65 Christine Road', '39542');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000207, 'Glenn', 'New orleans', '22nd Street', '5592');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000208, 'Loreena', 'North Point', '95 Orlando Street', '4605');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000209, 'Natacha', 'Regensburg', '93rd Street', '1111');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000210, 'Wally', 'Erlangen', '2 Beck Road', '7120');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000211, 'Queen', 'Slough', '862 Wolf Street', '0D0 6L2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000212, 'Edwin', 'Melbourne', '53rd Street', '38101');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000213, 'David', 'Bismarck', '29 Fender Blvd', '34914');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000214, 'Ty', 'Holts Summit', '63 Monk Road', '2320');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000215, 'Scarlett', 'Raleigh', '65 Chicago Drive', '25298');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000216, 'Loreena', 'Salt Lake City', '14 Saffron Road', '3744');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000217, 'Sally', 'Ohtsu', '706 Turku Road', '2266');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000218, 'Josh', 'Cerritos', '52 Brody Road', '20843');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000219, 'Scarlett', 'Lummen', '82nd Street', '40577');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000220, 'Sigourney', 'Marlboro', '43 Kudrow Street', '3659');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000221, 'Arturo', 'Lyngby', '838 Foxx Road', '11066');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000222, 'Toshiro', 'Newton-le-willows', '22 Willard Drive', '6P0 3G4');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000223, 'Sonny', 'Slidel', '10 Wine Road', '27712');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000224, 'Mint', 'Toyama', '10 Isaak Road', '9910');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000225, 'Owen', 'B?nes', '35 Huntsville Road', '9541');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000226, 'Natascha', 'Santiago', '73rd Street', '29842');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000227, 'Jerry', 'West Chester', '81 Tisdale', '19100');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000228, 'Chet', 'Claymont', '48 Duvall Street', '18299');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000229, 'April', 'Utsunomiya', '871 Washington Ave', '7588');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000230, 'Rodney', 'Aracruz', '64 Bernard Street', '26089');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000231, 'Henry', 'Yamaguchi', '26 Daryle Blvd', '40540');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000232, 'Cherry', 'Herndon', '335 Hoffman Ave', '13322');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000233, 'Dermot', 'Fort worth', '39 Carrack Ave', '36756');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000234, 'Ernie', 'Dublin', '89 Pusan-city Road', '5972');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000235, 'Clive', 'Bismarck', '76 Chad Drive', '12864');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000236, 'Taryn', 'Or-yehuda', '5 Bonneville Street', '40888');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000237, 'Thomas', 'Kista', '48 Rhys-Davies Ave', '24448');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000238, 'Oro', 'Brisbane', '39 Alannah Road', '14562');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000239, 'Keith', 'Buffalo Grove', '92 Leary Road', '30255');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000240, 'Aida', 'Barcelona', '21 Leon Road', '23238');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000241, 'Cuba', 'South Hadley', '75 Chaykin', '9995');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000242, 'Garry', 'Paderborn', '19 Chloe Road', '21527');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000243, 'Rosie', 'Kreuzau', '42 Ludbreg Road', '22640');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000244, 'Cathy', 'Delafield', '53 Laws Street', '31622');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000245, 'Gladys', 'Orlando', '83rd Street', '36990');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000246, 'Derek', 'Ilmenau', '50 Jennifer Blvd', '34531');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000247, 'Mira', 'Brampton', '8 Holliston Road', '5G8 5Z2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000248, 'Don', 'Lake Oswego', '379 Hutch Drive', '19130');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000249, 'Saffron', 'Redondo beach', '22nd Street', '9956');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000250, 'Roger', 'Suwon-city', '100 Latifah Street', '37265');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000251, 'Sissy', 'Coppell', '26 Ivan Road', '6951');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000252, 'Garland', 'Sugar Hill', '23 Plimpton Blvd', '2140');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000253, 'Solomon', 'Pomona', '21st Street', '13136');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000254, 'Jean-Luc', 'Aracruz', '303 Bingham Farms', '20919');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000255, 'Kathy', 'Burwood East', '815 Debby Blvd', '16003');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000256, 'Joaquin', 'Green bay', '727 Loring Ave', '15987');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000257, 'Rory', 'Foster City', '100 Spears', '28155');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000258, 'Sal', 'Athens', '69 Karen Road', '1262');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000259, 'Christina', 'Curitiba', '47 Tolkan Street', '34099');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000260, 'Ceili', 'Nordhausen', '931 urban Road', '11544');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000261, 'Bridgette', 'Shawnee', '51 Daniels Street', '23413');
commit;
prompt 700 records committed...
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000262, 'Derrick', 'Horsham', '99 Venora Drive', '36363');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000263, 'Madeline', 'Mobile', '61st Street', '12698');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000264, 'Miko', 'Ebersberg', '315 Janssen Drive', '14150');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000265, 'Christina', 'Mclean', '114 Terri Drive', '33448');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000266, 'Carlos', 'Kristiansand', '72nd Street', '3506');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000267, 'Isaac', 'Mito', '79 Costa Street', '29178');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000268, 'Pierce', 'Bloemfontein', '22nd Street', '6815');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000269, 'Terri', 'Herndon', '88 Magnuson Drive', '30068');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000270, 'Edie', 'Waterloo', '23rd Street', '8Q2 3E8');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000271, 'Ivan', 'Suffern', '8 Bullock Street', '28574');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000272, 'Julia', 'Berlin-Adlershof', '6 Saint-vincent-de-d', '39993');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000273, 'Robby', 'Helsinki', '4 Bedelia Street', '13089');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000274, 'Rosanna', 'Billerica', '54 Josh Blvd', '19196');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000275, 'Adina', 'Milan', '42nd Street', '9170');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000276, 'Ben', 'Grand Rapids', '78 McKean Ave', '39736');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000277, 'Gord', 'Rosario', '38 Merchant', '13008');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000278, 'Bonnie', 'Kevelaer', '19 Culkin Drive', '21920');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000279, 'Gord', 'Wakayama', '16 Rockwell Drive', '27447');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000280, 'Cary', 'Bloomington', '74 Rik Drive', '38167');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000281, 'Franco', 'Seongnam-si', '2 Giannini Road', '20411');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000282, 'Isaac', 'Braintree', '43 Fred Ave', '6J3 5L1');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000283, 'Beverley', 'Ravensburg', '77 Thompson Street', '35360');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000284, 'Judy', 'Kanazawa', '46 Withers Street', '34411');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000285, 'Miguel', 'San Jose', '24 DiFranco Blvd', '13638');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000286, 'Merrilee', 'Sugar Hill', '55 Franklin Ave', '8666');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000287, 'Annie', 'Kumamoto', '29 Willis Drive', '11278');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000288, 'Julie', 'Moreno Valley', '14 Fehr Street', '28820');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000289, 'Morris', 'St. Petersburg', '957 Stevie Drive', '25967');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000290, 'Max', 'Slough', '33 Dan', '0L9 8T3');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000291, 'Frank', 'Raleigh', '12nd Street', '17086');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000292, 'Kid', 'Birmensdorf', '82 Mike', '20468');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000731, 'Boyd', 'Deerfield', '34 Bay Shore Road', '35474');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000732, 'Suzy', 'Peachtree City', '88 Lucy Ave', '24337');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000733, 'Irene', 'Carlingford', '45 Hilton Blvd', '22395');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000734, 'Merrilee', 'Valencia', '851 Lunch', '10044');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000735, 'Shannon', 'Ben-Gurion', '13 Broadbent Street', '7344');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000736, 'Harry', 'Kerava', '20 Plimpton Drive', '32716');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000737, 'Randall', 'Milan', '29 Sonny', '9352');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000738, 'Rupert', 'Farmington Hills', '8 Glen Cove Blvd', '6208');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000739, 'Queen', 'Dubai', '54 Claude Ave', '19180');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000740, 'Glenn', 'Mount Olive', '497 New hartford Blv', '11179');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000741, 'Jean-Claude', 'Albuquerque', '373 Macht Blvd', '15040');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000742, 'Lou', 'Colombes', '37 Price Road', '6534');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000743, 'Juliet', 'Reston', '63 Altamonte Springs', '4450');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000744, 'Austin', 'Kansas City', '74 Reubens Street', '18030');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000745, 'Hal', 'Tlalpan', '5 Carmen Street', '22097');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000746, 'Vienna', 'San Jose', '94 Lili Blvd', '8850');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000747, 'Steven', 'Manchester', '10 Jesse', '31824');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000748, 'Ashton', 'Stellenbosch', '79 Chant? Road', '20953');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000749, 'Jude', 'Durham', '82 Salvador Drive', '5724');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000750, 'Roddy', 'Rockford', '44 Vilnius Road', '13376');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000751, 'Bette', 'Kongserbg', '501 Tolkan Road', '27521');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000752, 'Gates', 'Laurel', '760 Cozier Ave', '37971');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000753, 'Natascha', 'Drogenbos', '14 Heatherly', '8501');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000754, 'Lara', 'Melrose park', '9 Lofgren Road', '30647');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000755, 'Aimee', 'Birmingham', '16 Edwin Road', '39290');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000756, 'Guy', 'L''union', '69 Rispoli', '20976');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000757, 'Jet', 'Issaquah', '19 Rubinek Road', '19872');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000758, 'Ann', 'Walnut Creek', '99 Thelma Drive', '2450');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000759, 'Roger', 'La Plata', '57 Eschborn Drive', '28597');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000760, 'Bradley', 'Amarillo', '23rd Street', '22507');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000761, 'Parker', 'Cheshire', '95 England Street', '2Z5 7C2');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000762, 'Powers', 'Herzogenrath', '646 Kelly Road', '4736');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000763, 'Nickel', 'Ulsteinvik', '60 Pleasence', '34178');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000764, 'Ellen', 'Aachen', '782 Gdansk Street', '37863');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000765, 'Annette', 'Venice', '14 Donna Drive', '13232');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000766, 'Jeremy', 'Hermitage', '92nd Street', '11757');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000767, 'Kevn', 'Monroe', '2 Augst', '15262');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000768, 'Scarlett', 'Taoyuan', '45 Mainz-kastel Blvd', '36654');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000769, 'Benjamin', 'Traralgon', '58 Peter Drive', '40304');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000770, 'Kim', 'Lakeville', '449 Cumming Street', '15664');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000771, 'Ozzy', 'Potsdam', '3 Laguna Bbeach Road', '24950');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000772, 'Molly', 'Cary', '83 Smith Ave', '35240');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000773, 'Rick', 'Macau', '73 Fred Road', '13474');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000774, 'Bo', 'Oppenheim', '69 Slidel Drive', '13678');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000775, 'Dave', 'Olympia', '90 Leslie Road', '18010');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000776, 'Cuba', 'Udine', '88 Parsippany Road', '8474');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000777, 'Kiefer', 'Bountiful', '29 Cherry', '15393');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000778, 'Uma', 'Westfield', '70 Gdansk Street', '40418');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000779, 'Pat', 'Bellevue', '94 Balin', '10939');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000780, 'Davis', 'Darmstadt', '39 Rodgers Street', '27140');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000781, 'Rhett', 'Portsmouth', '918 La Plata Street', '17669');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000782, 'Bernie', 'Huntsville', '92nd Street', '31644');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000783, 'Joshua', 'Terrasa', '44 Hackensack Road', '5995');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000784, 'Lorraine', 'Gaithersburg', '517 Bracknell Road', '9926');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000785, 'Stellan', 'Westport', '6 Statham', '18958');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000786, 'Judi', 'Oosterhout', '948 Rifkin Street', '1743SE');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000787, 'Richie', 'Nashua', '19 Minnie Drive', '8542');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000788, 'Simon', 'St Leonards', '3 Austin', '34003');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000789, 'Ashley', 'Karlstad', '38 Elizabeth Street', '9595');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000790, 'Joan', 'Kaunas', '64 Charles Road', '35701');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000791, 'Angela', 'Spring Valley', '78 Pollak Road', '31721');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000792, 'Rene', 'Shreveport', '21 Benjamin Ave', '11716');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000793, 'Miguel', 'San Diego', '98 Antonio Street', '38705');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000794, 'Mykelti', 'Carmichael', '93rd Street', '28540');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000795, 'Pierce', 'Varzea grande', '11 Lightfoot Street', '16927');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000796, 'Sandra', 'Hannover', '85 Kotto', '6801');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000797, 'Vonda', 'Pomona', '500 Mississauga Ave', '16971');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000798, 'Dom', 'Aurora', '80 Janssen Blvd', '17587');
insert into PERSON (phonenum, name, city, street, zipcode)
values (1000000799, 'Mary', 'Germantown', '62 Wainwright Road', '25462');
commit;
prompt 800 records loaded
prompt Loading DRIVER...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000000);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000001);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000002);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000003);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000004);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000005);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000006);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000007);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000008);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000009);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000010);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000011);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000012);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000013);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000014);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000015);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000016);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000017);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000018);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000019);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000020);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000021);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000022);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000023);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000024);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000025);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000026);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000027);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000028);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000029);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000030);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000031);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000032);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000033);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000034);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000035);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000036);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000037);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000038);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000039);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000040);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000041);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000042);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000043);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000044);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000045);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000046);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000047);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000048);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000049);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000050);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000051);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000052);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000053);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000054);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000055);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000056);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000057);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000058);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000059);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000060);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000061);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000062);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000063);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000064);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000065);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000066);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000067);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000068);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000069);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000070);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000071);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000072);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000073);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000074);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000075);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000076);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000077);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000078);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000079);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000080);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000081);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000082);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000083);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000084);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000085);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000086);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000087);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000088);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000089);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000090);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000091);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000092);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000093);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000094);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000095);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000096);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000097);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000098);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000099);
commit;
prompt 100 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000100);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000101);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000102);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000103);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000104);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000105);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000106);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000107);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000108);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000109);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000110);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000111);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000112);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000113);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000114);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000115);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000116);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000117);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000118);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000119);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000120);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000121);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000122);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000123);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000124);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000125);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000126);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000127);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000128);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000129);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000130);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000131);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000132);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000133);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000134);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000135);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000136);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000137);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000138);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000139);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000140);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000141);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000142);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000143);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000144);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000145);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000146);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000147);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000148);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000149);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000150);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000151);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000152);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000153);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000154);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000155);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000156);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000157);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000158);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000159);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000160);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000161);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000162);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000163);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000164);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000165);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000166);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000167);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000168);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000169);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000170);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000171);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000172);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000173);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000174);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000175);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000176);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000177);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000178);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000179);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000180);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000181);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000182);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000183);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000184);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000185);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000186);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000187);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000188);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000189);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000190);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000191);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000192);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000193);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000194);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000195);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000196);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000197);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000198);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000199);
commit;
prompt 200 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000200);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000201);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000202);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000203);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000204);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000205);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000206);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000207);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000208);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000209);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000210);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000211);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000212);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000213);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000214);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000215);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000216);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000217);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000218);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000219);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000220);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000221);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000222);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000223);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000224);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000225);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000226);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000227);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000228);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000229);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000230);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000231);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000232);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000233);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000234);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000235);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000236);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000237);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000238);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000239);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000240);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000241);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000242);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000243);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000244);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000245);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000246);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000247);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000248);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000249);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000250);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000251);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000252);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000253);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000254);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000255);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000256);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000257);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000258);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000259);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000260);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000261);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000262);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000263);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000264);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000265);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000266);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000267);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000268);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000269);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000270);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000271);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000272);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000273);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000274);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000275);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000276);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000277);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000278);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000279);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000280);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000281);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000282);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000283);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000284);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000285);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000286);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000287);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000288);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000289);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000290);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000291);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000292);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000293);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000294);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000295);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000296);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000297);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000298);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000299);
commit;
prompt 300 records committed...
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000300);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000301);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000302);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000303);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000304);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000305);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000306);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000307);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000308);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000309);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000310);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000311);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000312);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000313);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000314);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000315);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000316);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000317);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000318);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000319);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000320);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000321);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000322);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000323);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000324);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000325);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000326);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000327);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000328);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000329);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000330);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000331);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000332);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000333);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000334);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000335);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000336);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000337);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000338);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000339);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000340);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000341);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000342);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000343);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000344);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000345);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000346);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000347);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000348);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000349);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000350);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000351);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000352);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000353);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000354);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000355);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000356);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000357);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000358);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000359);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000360);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000361);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'Yes', 1000000362);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000363);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000364);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000365);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000366);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000367);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000368);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000369);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000370);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'Yes', 1000000371);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000372);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000373);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000374);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000375);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000376);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000377);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000378);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000379);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000380);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000381);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000382);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000383);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000384);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'No', 1000000385);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000386);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000387);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'Yes', 1000000388);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000389);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000390);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000391);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000392);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'No', 1000000393);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('elrctric bicycle', 'No', 1000000394);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('bicycle', 'Yes', 1000000395);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000396);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('car', 'No', 1000000397);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('truck', 'No', 1000000398);
insert into DRIVER (vehicle, isavailable, phonenum)
values ('scooter', 'Yes', 1000000399);
commit;
prompt 400 records loaded
prompt Loading DELIVERY...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (489, null, to_date('11-12-2004', 'dd-mm-yyyy'), to_date('07-06-2009', 'dd-mm-yyyy'), 1000000389);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (490, null, to_date('08-08-2007', 'dd-mm-yyyy'), to_date('04-06-2003', 'dd-mm-yyyy'), 1000000390);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (491, 'deliverd', to_date('17-07-2003', 'dd-mm-yyyy'), to_date('25-02-2008', 'dd-mm-yyyy'), 1000000391);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (492, 'sent', to_date('05-04-2006', 'dd-mm-yyyy'), to_date('14-04-2005', 'dd-mm-yyyy'), 1000000392);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (493, null, to_date('30-10-2005', 'dd-mm-yyyy'), to_date('12-11-2003', 'dd-mm-yyyy'), 1000000393);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (494, null, to_date('20-01-2006', 'dd-mm-yyyy'), to_date('30-07-2009', 'dd-mm-yyyy'), 1000000394);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (495, 'sent', to_date('03-08-2000', 'dd-mm-yyyy'), to_date('06-06-2003', 'dd-mm-yyyy'), 1000000395);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (496, null, to_date('07-03-2001', 'dd-mm-yyyy'), to_date('05-10-2006', 'dd-mm-yyyy'), 1000000396);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (497, 'sent', to_date('28-11-2008', 'dd-mm-yyyy'), to_date('08-01-2000', 'dd-mm-yyyy'), 1000000397);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (498, 'sent', to_date('29-08-2005', 'dd-mm-yyyy'), to_date('01-11-2009', 'dd-mm-yyyy'), 1000000398);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (499, 'deliverd', to_date('15-10-2007', 'dd-mm-yyyy'), to_date('07-10-2005', 'dd-mm-yyyy'), 1000000399);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (100, 'deliverd', to_date('10-06-2005', 'dd-mm-yyyy'), to_date('20-08-2009', 'dd-mm-yyyy'), 1000000000);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (101, 'deliverd', to_date('15-12-2005', 'dd-mm-yyyy'), to_date('15-04-2003', 'dd-mm-yyyy'), 1000000001);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (102, 'deliverd', to_date('10-12-2005', 'dd-mm-yyyy'), to_date('23-01-2001', 'dd-mm-yyyy'), 1000000002);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (103, 'deliverd', to_date('06-07-2006', 'dd-mm-yyyy'), to_date('19-05-2001', 'dd-mm-yyyy'), 1000000003);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (104, 'deliverd', to_date('08-07-2002', 'dd-mm-yyyy'), to_date('27-06-2007', 'dd-mm-yyyy'), 1000000004);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (105, null, to_date('19-09-2003', 'dd-mm-yyyy'), to_date('02-05-2009', 'dd-mm-yyyy'), 1000000005);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (106, null, to_date('17-12-2008', 'dd-mm-yyyy'), to_date('25-11-2008', 'dd-mm-yyyy'), 1000000006);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (107, 'sent', to_date('23-01-2007', 'dd-mm-yyyy'), to_date('13-05-2004', 'dd-mm-yyyy'), 1000000007);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (108, 'deliverd', to_date('01-09-2007', 'dd-mm-yyyy'), to_date('22-08-2006', 'dd-mm-yyyy'), 1000000008);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (109, 'sent', to_date('07-10-2003', 'dd-mm-yyyy'), to_date('15-04-2006', 'dd-mm-yyyy'), 1000000009);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (110, 'deliverd', to_date('22-09-2004', 'dd-mm-yyyy'), to_date('22-10-2001', 'dd-mm-yyyy'), 1000000010);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (111, 'sent', to_date('28-02-2006', 'dd-mm-yyyy'), to_date('18-10-2006', 'dd-mm-yyyy'), 1000000011);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (112, 'sent', to_date('25-03-2007', 'dd-mm-yyyy'), to_date('17-08-2004', 'dd-mm-yyyy'), 1000000012);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (113, 'deliverd', to_date('09-04-2000', 'dd-mm-yyyy'), to_date('27-05-2009', 'dd-mm-yyyy'), 1000000013);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (114, 'sent', to_date('22-10-2008', 'dd-mm-yyyy'), to_date('03-07-2009', 'dd-mm-yyyy'), 1000000014);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (115, null, to_date('09-03-2007', 'dd-mm-yyyy'), to_date('12-08-2007', 'dd-mm-yyyy'), 1000000015);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (116, null, to_date('24-04-2000', 'dd-mm-yyyy'), to_date('13-01-2005', 'dd-mm-yyyy'), 1000000016);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (117, 'sent', to_date('12-03-2007', 'dd-mm-yyyy'), to_date('02-06-2003', 'dd-mm-yyyy'), 1000000017);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (118, 'sent', to_date('17-01-2004', 'dd-mm-yyyy'), to_date('09-12-2006', 'dd-mm-yyyy'), 1000000018);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (119, 'deliverd', to_date('30-05-2005', 'dd-mm-yyyy'), to_date('17-06-2005', 'dd-mm-yyyy'), 1000000019);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (120, null, to_date('10-07-2003', 'dd-mm-yyyy'), to_date('04-06-2009', 'dd-mm-yyyy'), 1000000020);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (121, 'deliverd', to_date('13-07-2002', 'dd-mm-yyyy'), to_date('23-09-2005', 'dd-mm-yyyy'), 1000000021);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (122, 'deliverd', to_date('27-05-2007', 'dd-mm-yyyy'), to_date('19-10-2005', 'dd-mm-yyyy'), 1000000022);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (123, 'deliverd', to_date('21-06-2007', 'dd-mm-yyyy'), to_date('28-11-2004', 'dd-mm-yyyy'), 1000000023);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (124, 'sent', to_date('14-07-2007', 'dd-mm-yyyy'), to_date('11-12-2001', 'dd-mm-yyyy'), 1000000024);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (125, 'deliverd', to_date('09-08-2004', 'dd-mm-yyyy'), to_date('07-07-2003', 'dd-mm-yyyy'), 1000000025);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (126, null, to_date('22-12-2002', 'dd-mm-yyyy'), to_date('21-04-2003', 'dd-mm-yyyy'), 1000000026);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (127, 'deliverd', to_date('05-12-2007', 'dd-mm-yyyy'), to_date('02-07-2004', 'dd-mm-yyyy'), 1000000027);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (128, null, to_date('29-06-2000', 'dd-mm-yyyy'), to_date('15-07-2004', 'dd-mm-yyyy'), 1000000028);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (129, 'deliverd', to_date('12-08-2007', 'dd-mm-yyyy'), to_date('09-08-2008', 'dd-mm-yyyy'), 1000000029);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (130, 'deliverd', to_date('18-03-2001', 'dd-mm-yyyy'), to_date('12-08-2001', 'dd-mm-yyyy'), 1000000030);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (131, null, to_date('05-12-2006', 'dd-mm-yyyy'), to_date('10-11-2002', 'dd-mm-yyyy'), 1000000031);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (132, 'deliverd', to_date('24-04-2004', 'dd-mm-yyyy'), to_date('12-07-2004', 'dd-mm-yyyy'), 1000000032);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (133, 'sent', to_date('02-02-2001', 'dd-mm-yyyy'), to_date('02-01-2009', 'dd-mm-yyyy'), 1000000033);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (134, null, to_date('19-07-2000', 'dd-mm-yyyy'), to_date('19-06-2005', 'dd-mm-yyyy'), 1000000034);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (135, 'deliverd', to_date('10-02-2002', 'dd-mm-yyyy'), to_date('10-12-2001', 'dd-mm-yyyy'), 1000000035);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (136, 'deliverd', to_date('22-03-2000', 'dd-mm-yyyy'), to_date('30-07-2006', 'dd-mm-yyyy'), 1000000036);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (137, 'sent', to_date('08-02-2003', 'dd-mm-yyyy'), to_date('21-02-2006', 'dd-mm-yyyy'), 1000000037);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (138, 'deliverd', to_date('18-01-2008', 'dd-mm-yyyy'), to_date('27-05-2007', 'dd-mm-yyyy'), 1000000038);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (139, null, to_date('12-04-2007', 'dd-mm-yyyy'), to_date('27-09-2008', 'dd-mm-yyyy'), 1000000039);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (140, 'deliverd', to_date('02-05-2000', 'dd-mm-yyyy'), to_date('02-11-2005', 'dd-mm-yyyy'), 1000000040);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (141, null, to_date('23-03-2003', 'dd-mm-yyyy'), to_date('20-04-2001', 'dd-mm-yyyy'), 1000000041);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (142, 'sent', to_date('23-09-2007', 'dd-mm-yyyy'), to_date('04-07-2002', 'dd-mm-yyyy'), 1000000042);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (143, null, to_date('11-06-2008', 'dd-mm-yyyy'), to_date('21-07-2009', 'dd-mm-yyyy'), 1000000043);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (144, 'sent', to_date('28-12-2001', 'dd-mm-yyyy'), to_date('06-12-2009', 'dd-mm-yyyy'), 1000000044);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (145, 'deliverd', to_date('14-08-2001', 'dd-mm-yyyy'), to_date('08-12-2005', 'dd-mm-yyyy'), 1000000045);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (146, 'deliverd', to_date('04-09-2001', 'dd-mm-yyyy'), to_date('31-03-2007', 'dd-mm-yyyy'), 1000000046);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (147, null, to_date('28-04-2004', 'dd-mm-yyyy'), to_date('22-09-2002', 'dd-mm-yyyy'), 1000000047);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (148, null, to_date('08-02-2005', 'dd-mm-yyyy'), to_date('30-01-2001', 'dd-mm-yyyy'), 1000000048);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (149, 'deliverd', to_date('21-11-2008', 'dd-mm-yyyy'), to_date('09-12-2003', 'dd-mm-yyyy'), 1000000049);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (150, 'deliverd', to_date('03-03-2008', 'dd-mm-yyyy'), to_date('13-11-2009', 'dd-mm-yyyy'), 1000000050);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (151, 'sent', to_date('17-05-2001', 'dd-mm-yyyy'), to_date('18-03-2009', 'dd-mm-yyyy'), 1000000051);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (152, 'sent', to_date('11-11-2004', 'dd-mm-yyyy'), to_date('08-11-2000', 'dd-mm-yyyy'), 1000000052);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (153, 'sent', to_date('20-05-2008', 'dd-mm-yyyy'), to_date('03-04-2005', 'dd-mm-yyyy'), 1000000053);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (154, null, to_date('14-04-2002', 'dd-mm-yyyy'), to_date('28-01-2001', 'dd-mm-yyyy'), 1000000054);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (155, 'sent', to_date('20-11-2006', 'dd-mm-yyyy'), to_date('12-09-2002', 'dd-mm-yyyy'), 1000000055);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (156, null, to_date('01-06-2000', 'dd-mm-yyyy'), to_date('30-06-2004', 'dd-mm-yyyy'), 1000000056);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (157, null, to_date('01-03-2002', 'dd-mm-yyyy'), to_date('18-07-2004', 'dd-mm-yyyy'), 1000000057);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (158, null, to_date('07-11-2002', 'dd-mm-yyyy'), to_date('11-06-2007', 'dd-mm-yyyy'), 1000000058);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (159, null, to_date('22-10-2002', 'dd-mm-yyyy'), to_date('10-11-2001', 'dd-mm-yyyy'), 1000000059);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (160, 'sent', to_date('07-07-2008', 'dd-mm-yyyy'), to_date('05-01-2002', 'dd-mm-yyyy'), 1000000060);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (161, 'deliverd', to_date('25-11-2002', 'dd-mm-yyyy'), to_date('29-01-2009', 'dd-mm-yyyy'), 1000000061);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (162, 'deliverd', to_date('13-09-2007', 'dd-mm-yyyy'), to_date('28-09-2002', 'dd-mm-yyyy'), 1000000062);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (163, 'deliverd', to_date('14-04-2002', 'dd-mm-yyyy'), to_date('23-11-2002', 'dd-mm-yyyy'), 1000000063);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (164, 'deliverd', to_date('07-02-2001', 'dd-mm-yyyy'), to_date('07-03-2007', 'dd-mm-yyyy'), 1000000064);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (165, null, to_date('07-04-2007', 'dd-mm-yyyy'), to_date('27-04-2004', 'dd-mm-yyyy'), 1000000065);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (166, 'sent', to_date('16-06-2003', 'dd-mm-yyyy'), to_date('12-08-2002', 'dd-mm-yyyy'), 1000000066);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (167, null, to_date('03-02-2005', 'dd-mm-yyyy'), to_date('15-11-2009', 'dd-mm-yyyy'), 1000000067);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (168, 'deliverd', to_date('07-06-2003', 'dd-mm-yyyy'), to_date('28-03-2008', 'dd-mm-yyyy'), 1000000068);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (169, 'sent', to_date('11-09-2006', 'dd-mm-yyyy'), to_date('03-07-2006', 'dd-mm-yyyy'), 1000000069);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (170, 'deliverd', to_date('22-06-2008', 'dd-mm-yyyy'), to_date('23-11-2003', 'dd-mm-yyyy'), 1000000070);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (171, 'deliverd', to_date('29-05-2003', 'dd-mm-yyyy'), to_date('23-02-2005', 'dd-mm-yyyy'), 1000000071);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (172, null, to_date('20-02-2006', 'dd-mm-yyyy'), to_date('27-02-2005', 'dd-mm-yyyy'), 1000000072);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (173, 'sent', to_date('24-07-2003', 'dd-mm-yyyy'), to_date('28-11-2005', 'dd-mm-yyyy'), 1000000073);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (174, null, to_date('04-08-2001', 'dd-mm-yyyy'), to_date('13-05-2009', 'dd-mm-yyyy'), 1000000074);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (175, 'sent', to_date('24-08-2002', 'dd-mm-yyyy'), to_date('10-12-2002', 'dd-mm-yyyy'), 1000000075);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (176, 'sent', to_date('19-05-2004', 'dd-mm-yyyy'), to_date('25-06-2002', 'dd-mm-yyyy'), 1000000076);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (177, 'sent', to_date('02-02-2003', 'dd-mm-yyyy'), to_date('10-12-2004', 'dd-mm-yyyy'), 1000000077);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (178, 'deliverd', to_date('07-10-2005', 'dd-mm-yyyy'), to_date('25-02-2003', 'dd-mm-yyyy'), 1000000078);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (179, null, to_date('27-04-2006', 'dd-mm-yyyy'), to_date('15-07-2003', 'dd-mm-yyyy'), 1000000079);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (180, 'sent', to_date('03-01-2002', 'dd-mm-yyyy'), to_date('12-03-2008', 'dd-mm-yyyy'), 1000000080);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (181, null, to_date('21-08-2007', 'dd-mm-yyyy'), to_date('18-05-2009', 'dd-mm-yyyy'), 1000000081);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (182, 'deliverd', to_date('07-11-2003', 'dd-mm-yyyy'), to_date('01-03-2003', 'dd-mm-yyyy'), 1000000082);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (183, null, to_date('31-01-2006', 'dd-mm-yyyy'), to_date('04-02-2006', 'dd-mm-yyyy'), 1000000083);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (184, 'deliverd', to_date('23-03-2001', 'dd-mm-yyyy'), to_date('20-03-2002', 'dd-mm-yyyy'), 1000000084);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (185, 'sent', to_date('25-01-2006', 'dd-mm-yyyy'), to_date('20-10-2002', 'dd-mm-yyyy'), 1000000085);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (186, null, to_date('06-01-2005', 'dd-mm-yyyy'), to_date('25-01-2001', 'dd-mm-yyyy'), 1000000086);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (187, 'sent', to_date('17-06-2002', 'dd-mm-yyyy'), to_date('12-12-2001', 'dd-mm-yyyy'), 1000000087);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (188, 'deliverd', to_date('05-06-2000', 'dd-mm-yyyy'), to_date('30-05-2009', 'dd-mm-yyyy'), 1000000088);
commit;
prompt 100 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (189, 'deliverd', to_date('10-06-2007', 'dd-mm-yyyy'), to_date('06-05-2006', 'dd-mm-yyyy'), 1000000089);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (190, 'deliverd', to_date('13-08-2006', 'dd-mm-yyyy'), to_date('10-10-2000', 'dd-mm-yyyy'), 1000000090);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (191, 'deliverd', to_date('08-12-2002', 'dd-mm-yyyy'), to_date('21-12-2001', 'dd-mm-yyyy'), 1000000091);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (192, 'deliverd', to_date('06-01-2007', 'dd-mm-yyyy'), to_date('05-01-2007', 'dd-mm-yyyy'), 1000000092);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (193, 'sent', to_date('08-03-2008', 'dd-mm-yyyy'), to_date('24-01-2000', 'dd-mm-yyyy'), 1000000093);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (194, null, to_date('13-06-2003', 'dd-mm-yyyy'), to_date('10-09-2000', 'dd-mm-yyyy'), 1000000094);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (195, null, to_date('14-05-2000', 'dd-mm-yyyy'), to_date('11-12-2004', 'dd-mm-yyyy'), 1000000095);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (196, null, to_date('15-05-2002', 'dd-mm-yyyy'), to_date('15-04-2005', 'dd-mm-yyyy'), 1000000096);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (197, null, to_date('21-06-2000', 'dd-mm-yyyy'), to_date('19-01-2002', 'dd-mm-yyyy'), 1000000097);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (198, 'sent', to_date('02-10-2000', 'dd-mm-yyyy'), to_date('09-06-2006', 'dd-mm-yyyy'), 1000000098);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (199, null, to_date('05-12-2008', 'dd-mm-yyyy'), to_date('15-04-2005', 'dd-mm-yyyy'), 1000000099);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (200, 'deliverd', to_date('03-06-2005', 'dd-mm-yyyy'), to_date('27-05-2006', 'dd-mm-yyyy'), 1000000100);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (201, 'deliverd', to_date('17-07-2005', 'dd-mm-yyyy'), to_date('04-01-2007', 'dd-mm-yyyy'), 1000000101);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (202, 'sent', to_date('27-05-2007', 'dd-mm-yyyy'), to_date('15-10-2003', 'dd-mm-yyyy'), 1000000102);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (203, 'sent', to_date('02-01-2003', 'dd-mm-yyyy'), to_date('08-10-2001', 'dd-mm-yyyy'), 1000000103);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (204, null, to_date('13-05-2005', 'dd-mm-yyyy'), to_date('30-04-2006', 'dd-mm-yyyy'), 1000000104);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (205, null, to_date('18-01-2001', 'dd-mm-yyyy'), to_date('05-10-2005', 'dd-mm-yyyy'), 1000000105);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (206, 'sent', to_date('26-01-2006', 'dd-mm-yyyy'), to_date('29-05-2003', 'dd-mm-yyyy'), 1000000106);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (207, null, to_date('23-10-2002', 'dd-mm-yyyy'), to_date('22-02-2001', 'dd-mm-yyyy'), 1000000107);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (208, 'sent', to_date('23-06-2004', 'dd-mm-yyyy'), to_date('06-04-2008', 'dd-mm-yyyy'), 1000000108);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (209, 'sent', to_date('01-11-2000', 'dd-mm-yyyy'), to_date('05-05-2001', 'dd-mm-yyyy'), 1000000109);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (210, 'sent', to_date('09-06-2007', 'dd-mm-yyyy'), to_date('02-09-2002', 'dd-mm-yyyy'), 1000000110);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (211, 'deliverd', to_date('09-08-2003', 'dd-mm-yyyy'), to_date('11-03-2003', 'dd-mm-yyyy'), 1000000111);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (212, 'sent', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('23-07-2008', 'dd-mm-yyyy'), 1000000112);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (213, 'sent', to_date('15-08-2007', 'dd-mm-yyyy'), to_date('27-04-2009', 'dd-mm-yyyy'), 1000000113);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (214, 'deliverd', to_date('04-08-2000', 'dd-mm-yyyy'), to_date('02-11-2000', 'dd-mm-yyyy'), 1000000114);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (215, null, to_date('06-10-2005', 'dd-mm-yyyy'), to_date('29-10-2005', 'dd-mm-yyyy'), 1000000115);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (216, 'sent', to_date('15-08-2007', 'dd-mm-yyyy'), to_date('21-02-2008', 'dd-mm-yyyy'), 1000000116);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (217, 'deliverd', to_date('20-06-2002', 'dd-mm-yyyy'), to_date('23-10-2002', 'dd-mm-yyyy'), 1000000117);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (218, null, to_date('15-04-2001', 'dd-mm-yyyy'), to_date('15-07-2007', 'dd-mm-yyyy'), 1000000118);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (219, 'deliverd', to_date('17-02-2000', 'dd-mm-yyyy'), to_date('27-11-2001', 'dd-mm-yyyy'), 1000000119);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (220, 'sent', to_date('15-09-2001', 'dd-mm-yyyy'), to_date('09-06-2005', 'dd-mm-yyyy'), 1000000120);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (221, null, to_date('26-02-2002', 'dd-mm-yyyy'), to_date('28-08-2003', 'dd-mm-yyyy'), 1000000121);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (222, 'sent', to_date('01-09-2005', 'dd-mm-yyyy'), to_date('05-09-2006', 'dd-mm-yyyy'), 1000000122);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (223, 'deliverd', to_date('14-05-2008', 'dd-mm-yyyy'), to_date('20-05-2001', 'dd-mm-yyyy'), 1000000123);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (224, 'sent', to_date('19-01-2001', 'dd-mm-yyyy'), to_date('04-12-2008', 'dd-mm-yyyy'), 1000000124);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (225, null, to_date('08-09-2001', 'dd-mm-yyyy'), to_date('16-09-2006', 'dd-mm-yyyy'), 1000000125);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (226, null, to_date('12-08-2001', 'dd-mm-yyyy'), to_date('14-09-2009', 'dd-mm-yyyy'), 1000000126);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (227, null, to_date('31-03-2001', 'dd-mm-yyyy'), to_date('28-08-2005', 'dd-mm-yyyy'), 1000000127);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (228, 'deliverd', to_date('10-05-2006', 'dd-mm-yyyy'), to_date('20-05-2000', 'dd-mm-yyyy'), 1000000128);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (229, 'deliverd', to_date('07-08-2008', 'dd-mm-yyyy'), to_date('09-05-2003', 'dd-mm-yyyy'), 1000000129);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (230, null, to_date('15-11-2002', 'dd-mm-yyyy'), to_date('03-03-2006', 'dd-mm-yyyy'), 1000000130);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (231, 'deliverd', to_date('09-02-2006', 'dd-mm-yyyy'), to_date('21-08-2002', 'dd-mm-yyyy'), 1000000131);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (232, null, to_date('04-06-2002', 'dd-mm-yyyy'), to_date('18-05-2001', 'dd-mm-yyyy'), 1000000132);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (233, 'sent', to_date('04-11-2008', 'dd-mm-yyyy'), to_date('10-01-2005', 'dd-mm-yyyy'), 1000000133);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (234, null, to_date('22-07-2001', 'dd-mm-yyyy'), to_date('17-03-2000', 'dd-mm-yyyy'), 1000000134);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (235, 'deliverd', to_date('21-11-2005', 'dd-mm-yyyy'), to_date('30-10-2003', 'dd-mm-yyyy'), 1000000135);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (236, 'sent', to_date('01-07-2001', 'dd-mm-yyyy'), to_date('13-01-2000', 'dd-mm-yyyy'), 1000000136);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (237, null, to_date('14-05-2003', 'dd-mm-yyyy'), to_date('03-09-2009', 'dd-mm-yyyy'), 1000000137);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (238, 'sent', to_date('23-09-2006', 'dd-mm-yyyy'), to_date('09-08-2005', 'dd-mm-yyyy'), 1000000138);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (239, 'deliverd', to_date('28-06-2008', 'dd-mm-yyyy'), to_date('08-12-2007', 'dd-mm-yyyy'), 1000000139);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (240, 'deliverd', to_date('21-10-2008', 'dd-mm-yyyy'), to_date('08-12-2004', 'dd-mm-yyyy'), 1000000140);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (241, 'sent', to_date('29-08-2004', 'dd-mm-yyyy'), to_date('02-10-2005', 'dd-mm-yyyy'), 1000000141);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (242, 'deliverd', to_date('14-02-2006', 'dd-mm-yyyy'), to_date('10-12-2003', 'dd-mm-yyyy'), 1000000142);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (243, 'sent', to_date('18-05-2001', 'dd-mm-yyyy'), to_date('19-10-2006', 'dd-mm-yyyy'), 1000000143);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (244, null, to_date('08-06-2000', 'dd-mm-yyyy'), to_date('18-02-2008', 'dd-mm-yyyy'), 1000000144);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (245, 'deliverd', to_date('03-12-2001', 'dd-mm-yyyy'), to_date('31-07-2001', 'dd-mm-yyyy'), 1000000145);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (246, 'deliverd', to_date('29-03-2005', 'dd-mm-yyyy'), to_date('22-02-2002', 'dd-mm-yyyy'), 1000000146);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (247, 'deliverd', to_date('01-09-2003', 'dd-mm-yyyy'), to_date('26-09-2002', 'dd-mm-yyyy'), 1000000147);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (248, 'deliverd', to_date('30-12-2005', 'dd-mm-yyyy'), to_date('09-09-2009', 'dd-mm-yyyy'), 1000000148);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (249, null, to_date('07-08-2004', 'dd-mm-yyyy'), to_date('20-07-2000', 'dd-mm-yyyy'), 1000000149);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (250, null, to_date('16-05-2003', 'dd-mm-yyyy'), to_date('03-01-2000', 'dd-mm-yyyy'), 1000000150);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (251, 'sent', to_date('06-02-2007', 'dd-mm-yyyy'), to_date('23-10-2008', 'dd-mm-yyyy'), 1000000151);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (252, 'deliverd', to_date('05-08-2003', 'dd-mm-yyyy'), to_date('17-02-2000', 'dd-mm-yyyy'), 1000000152);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (253, 'sent', to_date('06-06-2006', 'dd-mm-yyyy'), to_date('09-06-2004', 'dd-mm-yyyy'), 1000000153);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (254, 'sent', to_date('31-03-2002', 'dd-mm-yyyy'), to_date('24-11-2008', 'dd-mm-yyyy'), 1000000154);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (255, 'deliverd', to_date('29-08-2004', 'dd-mm-yyyy'), to_date('12-02-2006', 'dd-mm-yyyy'), 1000000155);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (256, 'sent', to_date('19-02-2003', 'dd-mm-yyyy'), to_date('27-06-2008', 'dd-mm-yyyy'), 1000000156);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (257, 'sent', to_date('13-04-2002', 'dd-mm-yyyy'), to_date('26-03-2000', 'dd-mm-yyyy'), 1000000157);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (258, 'deliverd', to_date('02-06-2001', 'dd-mm-yyyy'), to_date('07-11-2006', 'dd-mm-yyyy'), 1000000158);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (259, 'sent', to_date('01-10-2001', 'dd-mm-yyyy'), to_date('09-09-2003', 'dd-mm-yyyy'), 1000000159);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (260, null, to_date('08-01-2003', 'dd-mm-yyyy'), to_date('30-10-2007', 'dd-mm-yyyy'), 1000000160);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (261, 'sent', to_date('02-06-2003', 'dd-mm-yyyy'), to_date('01-09-2007', 'dd-mm-yyyy'), 1000000161);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (262, null, to_date('24-07-2008', 'dd-mm-yyyy'), to_date('06-02-2006', 'dd-mm-yyyy'), 1000000162);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (263, null, to_date('21-02-2006', 'dd-mm-yyyy'), to_date('28-12-2000', 'dd-mm-yyyy'), 1000000163);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (264, 'deliverd', to_date('15-08-2002', 'dd-mm-yyyy'), to_date('16-10-2009', 'dd-mm-yyyy'), 1000000164);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (265, 'sent', to_date('10-12-2007', 'dd-mm-yyyy'), to_date('25-08-2008', 'dd-mm-yyyy'), 1000000165);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (266, 'sent', to_date('01-04-2005', 'dd-mm-yyyy'), to_date('08-11-2003', 'dd-mm-yyyy'), 1000000166);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (267, null, to_date('25-02-2004', 'dd-mm-yyyy'), to_date('27-08-2003', 'dd-mm-yyyy'), 1000000167);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (268, 'sent', to_date('29-03-2003', 'dd-mm-yyyy'), to_date('21-09-2005', 'dd-mm-yyyy'), 1000000168);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (269, 'sent', to_date('25-07-2002', 'dd-mm-yyyy'), to_date('28-10-2009', 'dd-mm-yyyy'), 1000000169);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (270, null, to_date('17-12-2008', 'dd-mm-yyyy'), to_date('30-03-2007', 'dd-mm-yyyy'), 1000000170);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (271, 'deliverd', to_date('05-10-2004', 'dd-mm-yyyy'), to_date('20-09-2006', 'dd-mm-yyyy'), 1000000171);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (272, null, to_date('08-05-2004', 'dd-mm-yyyy'), to_date('24-05-2001', 'dd-mm-yyyy'), 1000000172);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (273, null, to_date('29-12-2001', 'dd-mm-yyyy'), to_date('13-09-2004', 'dd-mm-yyyy'), 1000000173);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (274, 'sent', to_date('05-05-2005', 'dd-mm-yyyy'), to_date('30-09-2007', 'dd-mm-yyyy'), 1000000174);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (275, null, to_date('09-08-2001', 'dd-mm-yyyy'), to_date('06-08-2001', 'dd-mm-yyyy'), 1000000175);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (276, null, to_date('18-05-2004', 'dd-mm-yyyy'), to_date('26-10-2006', 'dd-mm-yyyy'), 1000000176);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (277, null, to_date('08-07-2008', 'dd-mm-yyyy'), to_date('27-02-2002', 'dd-mm-yyyy'), 1000000177);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (278, 'sent', to_date('18-12-2003', 'dd-mm-yyyy'), to_date('04-07-2001', 'dd-mm-yyyy'), 1000000178);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (279, 'deliverd', to_date('20-01-2002', 'dd-mm-yyyy'), to_date('09-08-2005', 'dd-mm-yyyy'), 1000000179);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (280, 'deliverd', to_date('09-04-2008', 'dd-mm-yyyy'), to_date('17-04-2004', 'dd-mm-yyyy'), 1000000180);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (281, null, to_date('17-08-2001', 'dd-mm-yyyy'), to_date('07-01-2002', 'dd-mm-yyyy'), 1000000181);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (282, 'sent', to_date('11-02-2005', 'dd-mm-yyyy'), to_date('31-05-2005', 'dd-mm-yyyy'), 1000000182);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (283, null, to_date('01-11-2004', 'dd-mm-yyyy'), to_date('19-01-2006', 'dd-mm-yyyy'), 1000000183);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (284, 'sent', to_date('18-08-2001', 'dd-mm-yyyy'), to_date('25-11-2009', 'dd-mm-yyyy'), 1000000184);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (285, null, to_date('06-10-2006', 'dd-mm-yyyy'), to_date('08-01-2000', 'dd-mm-yyyy'), 1000000185);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (286, 'sent', to_date('30-05-2000', 'dd-mm-yyyy'), to_date('13-04-2001', 'dd-mm-yyyy'), 1000000186);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (287, null, to_date('25-11-2007', 'dd-mm-yyyy'), to_date('02-11-2001', 'dd-mm-yyyy'), 1000000187);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (288, 'sent', to_date('24-03-2006', 'dd-mm-yyyy'), to_date('31-10-2007', 'dd-mm-yyyy'), 1000000188);
commit;
prompt 200 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (289, 'deliverd', to_date('21-06-2006', 'dd-mm-yyyy'), to_date('05-05-2007', 'dd-mm-yyyy'), 1000000189);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (290, null, to_date('04-03-2006', 'dd-mm-yyyy'), to_date('12-09-2001', 'dd-mm-yyyy'), 1000000190);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (291, 'deliverd', to_date('23-06-2004', 'dd-mm-yyyy'), to_date('31-08-2009', 'dd-mm-yyyy'), 1000000191);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (292, 'sent', to_date('07-01-2001', 'dd-mm-yyyy'), to_date('02-02-2007', 'dd-mm-yyyy'), 1000000192);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (293, null, to_date('05-08-2008', 'dd-mm-yyyy'), to_date('16-10-2002', 'dd-mm-yyyy'), 1000000193);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (294, 'deliverd', to_date('26-11-2004', 'dd-mm-yyyy'), to_date('19-09-2005', 'dd-mm-yyyy'), 1000000194);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (295, 'deliverd', to_date('19-07-2008', 'dd-mm-yyyy'), to_date('05-12-2003', 'dd-mm-yyyy'), 1000000195);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (296, null, to_date('26-02-2008', 'dd-mm-yyyy'), to_date('27-11-2004', 'dd-mm-yyyy'), 1000000196);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (297, 'sent', to_date('25-04-2003', 'dd-mm-yyyy'), to_date('09-11-2006', 'dd-mm-yyyy'), 1000000197);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (298, 'deliverd', to_date('15-05-2005', 'dd-mm-yyyy'), to_date('08-03-2003', 'dd-mm-yyyy'), 1000000198);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (299, 'deliverd', to_date('20-02-2000', 'dd-mm-yyyy'), to_date('26-07-2000', 'dd-mm-yyyy'), 1000000199);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (300, null, to_date('25-06-2006', 'dd-mm-yyyy'), to_date('16-12-2001', 'dd-mm-yyyy'), 1000000200);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (301, 'sent', to_date('06-02-2002', 'dd-mm-yyyy'), to_date('28-08-2001', 'dd-mm-yyyy'), 1000000201);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (302, 'sent', to_date('30-12-2001', 'dd-mm-yyyy'), to_date('13-09-2009', 'dd-mm-yyyy'), 1000000202);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (303, null, to_date('19-03-2007', 'dd-mm-yyyy'), to_date('02-05-2000', 'dd-mm-yyyy'), 1000000203);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (304, 'deliverd', to_date('23-07-2003', 'dd-mm-yyyy'), to_date('05-12-2007', 'dd-mm-yyyy'), 1000000204);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (305, null, to_date('01-12-2002', 'dd-mm-yyyy'), to_date('01-06-2000', 'dd-mm-yyyy'), 1000000205);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (306, 'sent', to_date('10-09-2003', 'dd-mm-yyyy'), to_date('26-07-2007', 'dd-mm-yyyy'), 1000000206);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (307, 'sent', to_date('07-01-2003', 'dd-mm-yyyy'), to_date('08-09-2006', 'dd-mm-yyyy'), 1000000207);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (308, 'sent', to_date('01-04-2005', 'dd-mm-yyyy'), to_date('24-05-2008', 'dd-mm-yyyy'), 1000000208);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (309, 'deliverd', to_date('05-04-2007', 'dd-mm-yyyy'), to_date('12-06-2005', 'dd-mm-yyyy'), 1000000209);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (310, 'deliverd', to_date('01-04-2007', 'dd-mm-yyyy'), to_date('08-06-2008', 'dd-mm-yyyy'), 1000000210);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (311, 'deliverd', to_date('17-03-2002', 'dd-mm-yyyy'), to_date('31-10-2007', 'dd-mm-yyyy'), 1000000211);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (312, null, to_date('20-04-2002', 'dd-mm-yyyy'), to_date('15-09-2005', 'dd-mm-yyyy'), 1000000212);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (313, 'sent', to_date('05-11-2000', 'dd-mm-yyyy'), to_date('14-01-2004', 'dd-mm-yyyy'), 1000000213);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (314, null, to_date('12-12-2008', 'dd-mm-yyyy'), to_date('26-07-2008', 'dd-mm-yyyy'), 1000000214);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (315, null, to_date('27-01-2003', 'dd-mm-yyyy'), to_date('28-11-2003', 'dd-mm-yyyy'), 1000000215);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (316, 'deliverd', to_date('27-07-2005', 'dd-mm-yyyy'), to_date('04-05-2000', 'dd-mm-yyyy'), 1000000216);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (317, 'sent', to_date('20-01-2001', 'dd-mm-yyyy'), to_date('18-11-2004', 'dd-mm-yyyy'), 1000000217);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (318, 'sent', to_date('19-01-2006', 'dd-mm-yyyy'), to_date('03-09-2007', 'dd-mm-yyyy'), 1000000218);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (319, null, to_date('05-09-2001', 'dd-mm-yyyy'), to_date('01-08-2003', 'dd-mm-yyyy'), 1000000219);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (320, 'sent', to_date('26-09-2001', 'dd-mm-yyyy'), to_date('18-07-2000', 'dd-mm-yyyy'), 1000000220);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (321, 'deliverd', to_date('27-05-2006', 'dd-mm-yyyy'), to_date('21-10-2000', 'dd-mm-yyyy'), 1000000221);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (322, null, to_date('03-04-2005', 'dd-mm-yyyy'), to_date('14-06-2006', 'dd-mm-yyyy'), 1000000222);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (323, 'deliverd', to_date('17-10-2008', 'dd-mm-yyyy'), to_date('26-05-2006', 'dd-mm-yyyy'), 1000000223);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (324, 'sent', to_date('19-09-2000', 'dd-mm-yyyy'), to_date('27-05-2001', 'dd-mm-yyyy'), 1000000224);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (325, 'sent', to_date('06-09-2000', 'dd-mm-yyyy'), to_date('23-08-2004', 'dd-mm-yyyy'), 1000000225);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (326, 'sent', to_date('23-04-2003', 'dd-mm-yyyy'), to_date('18-08-2009', 'dd-mm-yyyy'), 1000000226);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (327, 'deliverd', to_date('12-11-2002', 'dd-mm-yyyy'), to_date('30-07-2009', 'dd-mm-yyyy'), 1000000227);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (328, 'sent', to_date('09-02-2006', 'dd-mm-yyyy'), to_date('23-02-2006', 'dd-mm-yyyy'), 1000000228);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (329, 'sent', to_date('01-08-2004', 'dd-mm-yyyy'), to_date('16-04-2009', 'dd-mm-yyyy'), 1000000229);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (330, null, to_date('19-05-2006', 'dd-mm-yyyy'), to_date('24-03-2004', 'dd-mm-yyyy'), 1000000230);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (331, 'sent', to_date('23-06-2006', 'dd-mm-yyyy'), to_date('19-11-2000', 'dd-mm-yyyy'), 1000000231);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (332, 'deliverd', to_date('28-04-2003', 'dd-mm-yyyy'), to_date('04-01-2006', 'dd-mm-yyyy'), 1000000232);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (333, 'deliverd', to_date('25-10-2007', 'dd-mm-yyyy'), to_date('13-10-2003', 'dd-mm-yyyy'), 1000000233);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (334, 'sent', to_date('22-11-2003', 'dd-mm-yyyy'), to_date('29-07-2004', 'dd-mm-yyyy'), 1000000234);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (335, 'sent', to_date('11-12-2007', 'dd-mm-yyyy'), to_date('07-02-2001', 'dd-mm-yyyy'), 1000000235);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (336, 'sent', to_date('23-04-2008', 'dd-mm-yyyy'), to_date('23-05-2006', 'dd-mm-yyyy'), 1000000236);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (337, 'sent', to_date('24-02-2004', 'dd-mm-yyyy'), to_date('15-11-2000', 'dd-mm-yyyy'), 1000000237);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (338, 'deliverd', to_date('05-11-2003', 'dd-mm-yyyy'), to_date('19-06-2009', 'dd-mm-yyyy'), 1000000238);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (339, 'sent', to_date('09-02-2001', 'dd-mm-yyyy'), to_date('24-05-2003', 'dd-mm-yyyy'), 1000000239);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (340, 'deliverd', to_date('04-01-2006', 'dd-mm-yyyy'), to_date('23-08-2000', 'dd-mm-yyyy'), 1000000240);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (341, 'deliverd', to_date('26-11-2002', 'dd-mm-yyyy'), to_date('18-02-2004', 'dd-mm-yyyy'), 1000000241);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (342, null, to_date('03-12-2004', 'dd-mm-yyyy'), to_date('23-09-2007', 'dd-mm-yyyy'), 1000000242);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (343, null, to_date('03-06-2004', 'dd-mm-yyyy'), to_date('25-04-2007', 'dd-mm-yyyy'), 1000000243);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (344, 'deliverd', to_date('28-11-2005', 'dd-mm-yyyy'), to_date('17-03-2004', 'dd-mm-yyyy'), 1000000244);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (345, 'sent', to_date('12-09-2000', 'dd-mm-yyyy'), to_date('17-03-2004', 'dd-mm-yyyy'), 1000000245);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (346, 'sent', to_date('14-11-2007', 'dd-mm-yyyy'), to_date('25-11-2001', 'dd-mm-yyyy'), 1000000246);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (347, null, to_date('26-10-2003', 'dd-mm-yyyy'), to_date('13-09-2009', 'dd-mm-yyyy'), 1000000247);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (348, null, to_date('12-05-2003', 'dd-mm-yyyy'), to_date('30-07-2005', 'dd-mm-yyyy'), 1000000248);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (349, 'deliverd', to_date('05-08-2007', 'dd-mm-yyyy'), to_date('08-12-2006', 'dd-mm-yyyy'), 1000000249);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (350, 'sent', to_date('20-11-2008', 'dd-mm-yyyy'), to_date('02-05-2002', 'dd-mm-yyyy'), 1000000250);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (351, 'deliverd', to_date('11-02-2000', 'dd-mm-yyyy'), to_date('10-01-2006', 'dd-mm-yyyy'), 1000000251);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (352, 'deliverd', to_date('15-07-2006', 'dd-mm-yyyy'), to_date('02-07-2001', 'dd-mm-yyyy'), 1000000252);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (353, 'sent', to_date('13-11-2007', 'dd-mm-yyyy'), to_date('20-11-2008', 'dd-mm-yyyy'), 1000000253);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (354, 'deliverd', to_date('17-02-2001', 'dd-mm-yyyy'), to_date('13-02-2006', 'dd-mm-yyyy'), 1000000254);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (355, 'sent', to_date('28-10-2001', 'dd-mm-yyyy'), to_date('22-07-2008', 'dd-mm-yyyy'), 1000000255);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (356, 'deliverd', to_date('07-03-2003', 'dd-mm-yyyy'), to_date('04-11-2007', 'dd-mm-yyyy'), 1000000256);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (357, null, to_date('20-02-2008', 'dd-mm-yyyy'), to_date('19-07-2007', 'dd-mm-yyyy'), 1000000257);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (358, 'deliverd', to_date('07-07-2003', 'dd-mm-yyyy'), to_date('07-09-2007', 'dd-mm-yyyy'), 1000000258);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (359, 'deliverd', to_date('25-08-2004', 'dd-mm-yyyy'), to_date('11-09-2000', 'dd-mm-yyyy'), 1000000259);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (360, 'deliverd', to_date('13-07-2004', 'dd-mm-yyyy'), to_date('20-06-2009', 'dd-mm-yyyy'), 1000000260);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (361, 'sent', to_date('06-07-2003', 'dd-mm-yyyy'), to_date('26-06-2006', 'dd-mm-yyyy'), 1000000261);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (362, 'sent', to_date('01-05-2003', 'dd-mm-yyyy'), to_date('27-09-2000', 'dd-mm-yyyy'), 1000000262);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (363, 'sent', to_date('13-01-2001', 'dd-mm-yyyy'), to_date('19-12-2007', 'dd-mm-yyyy'), 1000000263);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (364, null, to_date('26-01-2000', 'dd-mm-yyyy'), to_date('21-03-2004', 'dd-mm-yyyy'), 1000000264);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (365, 'deliverd', to_date('07-12-2000', 'dd-mm-yyyy'), to_date('20-03-2008', 'dd-mm-yyyy'), 1000000265);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (366, null, to_date('10-07-2007', 'dd-mm-yyyy'), to_date('05-07-2003', 'dd-mm-yyyy'), 1000000266);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (367, 'deliverd', to_date('30-07-2002', 'dd-mm-yyyy'), to_date('25-12-2000', 'dd-mm-yyyy'), 1000000267);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (368, null, to_date('14-12-2000', 'dd-mm-yyyy'), to_date('14-11-2009', 'dd-mm-yyyy'), 1000000268);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (369, null, to_date('18-01-2007', 'dd-mm-yyyy'), to_date('07-11-2009', 'dd-mm-yyyy'), 1000000269);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (370, 'deliverd', to_date('20-07-2003', 'dd-mm-yyyy'), to_date('06-04-2002', 'dd-mm-yyyy'), 1000000270);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (371, 'sent', to_date('24-02-2006', 'dd-mm-yyyy'), to_date('30-11-2004', 'dd-mm-yyyy'), 1000000271);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (372, 'sent', to_date('30-04-2001', 'dd-mm-yyyy'), to_date('24-01-2005', 'dd-mm-yyyy'), 1000000272);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (373, 'sent', to_date('03-02-2007', 'dd-mm-yyyy'), to_date('02-02-2009', 'dd-mm-yyyy'), 1000000273);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (374, 'deliverd', to_date('21-02-2002', 'dd-mm-yyyy'), to_date('11-03-2009', 'dd-mm-yyyy'), 1000000274);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (375, 'deliverd', to_date('05-01-2008', 'dd-mm-yyyy'), to_date('18-06-2006', 'dd-mm-yyyy'), 1000000275);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (376, 'deliverd', to_date('12-11-2003', 'dd-mm-yyyy'), to_date('28-05-2006', 'dd-mm-yyyy'), 1000000276);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (377, 'deliverd', to_date('09-10-2008', 'dd-mm-yyyy'), to_date('29-11-2000', 'dd-mm-yyyy'), 1000000277);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (378, null, to_date('20-06-2003', 'dd-mm-yyyy'), to_date('08-05-2005', 'dd-mm-yyyy'), 1000000278);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (379, 'sent', to_date('01-05-2001', 'dd-mm-yyyy'), to_date('30-11-2007', 'dd-mm-yyyy'), 1000000279);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (380, null, to_date('27-02-2006', 'dd-mm-yyyy'), to_date('02-12-2008', 'dd-mm-yyyy'), 1000000280);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (381, 'deliverd', to_date('18-01-2002', 'dd-mm-yyyy'), to_date('18-04-2007', 'dd-mm-yyyy'), 1000000281);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (382, 'sent', to_date('17-06-2000', 'dd-mm-yyyy'), to_date('03-06-2009', 'dd-mm-yyyy'), 1000000282);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (383, null, to_date('29-10-2002', 'dd-mm-yyyy'), to_date('22-05-2003', 'dd-mm-yyyy'), 1000000283);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (384, 'deliverd', to_date('10-12-2008', 'dd-mm-yyyy'), to_date('01-02-2007', 'dd-mm-yyyy'), 1000000284);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (385, 'sent', to_date('17-04-2003', 'dd-mm-yyyy'), to_date('29-11-2005', 'dd-mm-yyyy'), 1000000285);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (386, 'sent', to_date('04-05-2000', 'dd-mm-yyyy'), to_date('01-04-2008', 'dd-mm-yyyy'), 1000000286);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (387, 'sent', to_date('21-06-2003', 'dd-mm-yyyy'), to_date('26-12-2002', 'dd-mm-yyyy'), 1000000287);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (388, 'deliverd', to_date('02-03-2001', 'dd-mm-yyyy'), to_date('31-07-2007', 'dd-mm-yyyy'), 1000000288);
commit;
prompt 300 records committed...
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (389, 'sent', to_date('15-04-2003', 'dd-mm-yyyy'), to_date('09-02-2004', 'dd-mm-yyyy'), 1000000289);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (390, 'sent', to_date('01-08-2002', 'dd-mm-yyyy'), to_date('18-10-2004', 'dd-mm-yyyy'), 1000000290);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (391, 'sent', to_date('19-06-2001', 'dd-mm-yyyy'), to_date('28-04-2004', 'dd-mm-yyyy'), 1000000291);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (392, null, to_date('01-06-2005', 'dd-mm-yyyy'), to_date('02-04-2007', 'dd-mm-yyyy'), 1000000292);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (393, null, to_date('30-12-2000', 'dd-mm-yyyy'), to_date('21-08-2009', 'dd-mm-yyyy'), 1000000293);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (394, 'deliverd', to_date('01-11-2008', 'dd-mm-yyyy'), to_date('12-01-2004', 'dd-mm-yyyy'), 1000000294);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (395, null, to_date('24-12-2007', 'dd-mm-yyyy'), to_date('30-04-2002', 'dd-mm-yyyy'), 1000000295);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (396, 'deliverd', to_date('23-03-2008', 'dd-mm-yyyy'), to_date('23-09-2001', 'dd-mm-yyyy'), 1000000296);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (397, null, to_date('02-02-2001', 'dd-mm-yyyy'), to_date('24-04-2000', 'dd-mm-yyyy'), 1000000297);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (398, 'deliverd', to_date('09-08-2007', 'dd-mm-yyyy'), to_date('09-05-2008', 'dd-mm-yyyy'), 1000000298);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (399, 'sent', to_date('02-04-2008', 'dd-mm-yyyy'), to_date('29-05-2001', 'dd-mm-yyyy'), 1000000299);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (400, null, to_date('15-04-2007', 'dd-mm-yyyy'), to_date('07-01-2003', 'dd-mm-yyyy'), 1000000300);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (401, null, to_date('11-08-2008', 'dd-mm-yyyy'), to_date('15-01-2007', 'dd-mm-yyyy'), 1000000301);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (402, null, to_date('20-08-2004', 'dd-mm-yyyy'), to_date('04-04-2007', 'dd-mm-yyyy'), 1000000302);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (403, 'deliverd', to_date('28-02-2007', 'dd-mm-yyyy'), to_date('27-07-2006', 'dd-mm-yyyy'), 1000000303);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (404, null, to_date('29-07-2004', 'dd-mm-yyyy'), to_date('06-04-2007', 'dd-mm-yyyy'), 1000000304);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (405, null, to_date('11-05-2002', 'dd-mm-yyyy'), to_date('03-08-2009', 'dd-mm-yyyy'), 1000000305);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (406, null, to_date('19-05-2001', 'dd-mm-yyyy'), to_date('20-11-2007', 'dd-mm-yyyy'), 1000000306);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (407, 'deliverd', to_date('19-04-2002', 'dd-mm-yyyy'), to_date('03-04-2002', 'dd-mm-yyyy'), 1000000307);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (408, 'sent', to_date('19-11-2001', 'dd-mm-yyyy'), to_date('15-05-2005', 'dd-mm-yyyy'), 1000000308);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (409, 'deliverd', to_date('12-10-2005', 'dd-mm-yyyy'), to_date('03-04-2003', 'dd-mm-yyyy'), 1000000309);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (410, null, to_date('25-11-2005', 'dd-mm-yyyy'), to_date('08-09-2006', 'dd-mm-yyyy'), 1000000310);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (411, 'sent', to_date('23-02-2000', 'dd-mm-yyyy'), to_date('29-11-2009', 'dd-mm-yyyy'), 1000000311);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (412, 'deliverd', to_date('27-04-2003', 'dd-mm-yyyy'), to_date('16-07-2002', 'dd-mm-yyyy'), 1000000312);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (413, null, to_date('01-07-2007', 'dd-mm-yyyy'), to_date('25-05-2000', 'dd-mm-yyyy'), 1000000313);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (414, null, to_date('23-02-2001', 'dd-mm-yyyy'), to_date('07-07-2003', 'dd-mm-yyyy'), 1000000314);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (415, 'deliverd', to_date('19-12-2003', 'dd-mm-yyyy'), to_date('19-04-2009', 'dd-mm-yyyy'), 1000000315);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (416, null, to_date('24-09-2004', 'dd-mm-yyyy'), to_date('18-02-2005', 'dd-mm-yyyy'), 1000000316);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (417, 'deliverd', to_date('01-10-2007', 'dd-mm-yyyy'), to_date('20-10-2001', 'dd-mm-yyyy'), 1000000317);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (418, 'deliverd', to_date('03-07-2004', 'dd-mm-yyyy'), to_date('18-02-2003', 'dd-mm-yyyy'), 1000000318);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (419, null, to_date('22-05-2003', 'dd-mm-yyyy'), to_date('25-05-2008', 'dd-mm-yyyy'), 1000000319);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (420, 'deliverd', to_date('28-02-2006', 'dd-mm-yyyy'), to_date('25-07-2005', 'dd-mm-yyyy'), 1000000320);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (421, 'deliverd', to_date('13-05-2001', 'dd-mm-yyyy'), to_date('12-02-2005', 'dd-mm-yyyy'), 1000000321);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (422, 'sent', to_date('29-11-2003', 'dd-mm-yyyy'), to_date('29-01-2001', 'dd-mm-yyyy'), 1000000322);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (423, 'sent', to_date('26-11-2006', 'dd-mm-yyyy'), to_date('13-04-2002', 'dd-mm-yyyy'), 1000000323);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (424, null, to_date('16-09-2004', 'dd-mm-yyyy'), to_date('12-03-2008', 'dd-mm-yyyy'), 1000000324);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (425, null, to_date('01-02-2007', 'dd-mm-yyyy'), to_date('21-11-2000', 'dd-mm-yyyy'), 1000000325);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (426, 'deliverd', to_date('07-02-2008', 'dd-mm-yyyy'), to_date('10-03-2003', 'dd-mm-yyyy'), 1000000326);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (427, 'deliverd', to_date('17-09-2007', 'dd-mm-yyyy'), to_date('27-04-2001', 'dd-mm-yyyy'), 1000000327);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (428, 'deliverd', to_date('02-07-2008', 'dd-mm-yyyy'), to_date('04-08-2002', 'dd-mm-yyyy'), 1000000328);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (429, 'sent', to_date('16-04-2003', 'dd-mm-yyyy'), to_date('16-06-2008', 'dd-mm-yyyy'), 1000000329);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (430, null, to_date('31-08-2000', 'dd-mm-yyyy'), to_date('23-03-2001', 'dd-mm-yyyy'), 1000000330);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (431, 'sent', to_date('12-08-2000', 'dd-mm-yyyy'), to_date('11-05-2003', 'dd-mm-yyyy'), 1000000331);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (432, null, to_date('23-07-2006', 'dd-mm-yyyy'), to_date('20-09-2001', 'dd-mm-yyyy'), 1000000332);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (433, null, to_date('25-06-2001', 'dd-mm-yyyy'), to_date('21-09-2007', 'dd-mm-yyyy'), 1000000333);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (434, 'deliverd', to_date('06-01-2004', 'dd-mm-yyyy'), to_date('06-08-2008', 'dd-mm-yyyy'), 1000000334);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (435, 'sent', to_date('08-12-2007', 'dd-mm-yyyy'), to_date('10-09-2005', 'dd-mm-yyyy'), 1000000335);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (436, 'sent', to_date('28-10-2002', 'dd-mm-yyyy'), to_date('31-08-2006', 'dd-mm-yyyy'), 1000000336);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (437, 'deliverd', to_date('14-02-2005', 'dd-mm-yyyy'), to_date('16-02-2003', 'dd-mm-yyyy'), 1000000337);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (438, 'sent', to_date('13-06-2002', 'dd-mm-yyyy'), to_date('29-12-2003', 'dd-mm-yyyy'), 1000000338);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (439, 'deliverd', to_date('17-08-2002', 'dd-mm-yyyy'), to_date('08-02-2006', 'dd-mm-yyyy'), 1000000339);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (440, 'deliverd', to_date('25-08-2008', 'dd-mm-yyyy'), to_date('23-07-2000', 'dd-mm-yyyy'), 1000000340);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (441, 'deliverd', to_date('03-08-2008', 'dd-mm-yyyy'), to_date('20-03-2001', 'dd-mm-yyyy'), 1000000341);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (442, null, to_date('29-11-2006', 'dd-mm-yyyy'), to_date('15-04-2001', 'dd-mm-yyyy'), 1000000342);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (443, 'deliverd', to_date('23-01-2006', 'dd-mm-yyyy'), to_date('19-03-2004', 'dd-mm-yyyy'), 1000000343);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (444, null, to_date('29-05-2007', 'dd-mm-yyyy'), to_date('09-05-2007', 'dd-mm-yyyy'), 1000000344);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (445, 'sent', to_date('23-05-2004', 'dd-mm-yyyy'), to_date('02-11-2003', 'dd-mm-yyyy'), 1000000345);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (446, 'deliverd', to_date('25-02-2006', 'dd-mm-yyyy'), to_date('25-01-2009', 'dd-mm-yyyy'), 1000000346);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (447, 'deliverd', to_date('09-03-2001', 'dd-mm-yyyy'), to_date('05-02-2007', 'dd-mm-yyyy'), 1000000347);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (448, 'sent', to_date('16-02-2006', 'dd-mm-yyyy'), to_date('09-10-2004', 'dd-mm-yyyy'), 1000000348);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (449, 'sent', to_date('12-12-2004', 'dd-mm-yyyy'), to_date('11-04-2002', 'dd-mm-yyyy'), 1000000349);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (450, null, to_date('24-04-2001', 'dd-mm-yyyy'), to_date('05-08-2003', 'dd-mm-yyyy'), 1000000350);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (451, 'deliverd', to_date('02-01-2006', 'dd-mm-yyyy'), to_date('27-09-2005', 'dd-mm-yyyy'), 1000000351);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (452, 'deliverd', to_date('29-04-2003', 'dd-mm-yyyy'), to_date('07-09-2000', 'dd-mm-yyyy'), 1000000352);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (453, 'sent', to_date('28-06-2006', 'dd-mm-yyyy'), to_date('19-09-2009', 'dd-mm-yyyy'), 1000000353);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (454, 'deliverd', to_date('21-03-2008', 'dd-mm-yyyy'), to_date('03-10-2001', 'dd-mm-yyyy'), 1000000354);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (455, null, to_date('23-07-2006', 'dd-mm-yyyy'), to_date('13-10-2000', 'dd-mm-yyyy'), 1000000355);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (456, null, to_date('27-04-2001', 'dd-mm-yyyy'), to_date('25-06-2007', 'dd-mm-yyyy'), 1000000356);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (457, null, to_date('17-12-2004', 'dd-mm-yyyy'), to_date('10-12-2002', 'dd-mm-yyyy'), 1000000357);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (458, null, to_date('27-11-2003', 'dd-mm-yyyy'), to_date('10-11-2004', 'dd-mm-yyyy'), 1000000358);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (459, null, to_date('01-12-2008', 'dd-mm-yyyy'), to_date('24-05-2009', 'dd-mm-yyyy'), 1000000359);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (460, 'sent', to_date('21-10-2004', 'dd-mm-yyyy'), to_date('12-10-2009', 'dd-mm-yyyy'), 1000000360);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (461, null, to_date('08-12-2004', 'dd-mm-yyyy'), to_date('19-08-2004', 'dd-mm-yyyy'), 1000000361);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (462, 'deliverd', to_date('01-02-2003', 'dd-mm-yyyy'), to_date('05-03-2004', 'dd-mm-yyyy'), 1000000362);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (463, 'sent', to_date('01-11-2003', 'dd-mm-yyyy'), to_date('02-05-2007', 'dd-mm-yyyy'), 1000000363);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (464, 'deliverd', to_date('21-06-2003', 'dd-mm-yyyy'), to_date('16-05-2003', 'dd-mm-yyyy'), 1000000364);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (465, 'sent', to_date('09-12-2000', 'dd-mm-yyyy'), to_date('01-02-2003', 'dd-mm-yyyy'), 1000000365);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (466, null, to_date('01-09-2002', 'dd-mm-yyyy'), to_date('12-01-2003', 'dd-mm-yyyy'), 1000000366);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (467, 'deliverd', to_date('14-01-2000', 'dd-mm-yyyy'), to_date('25-08-2001', 'dd-mm-yyyy'), 1000000367);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (468, 'deliverd', to_date('05-11-2001', 'dd-mm-yyyy'), to_date('05-08-2006', 'dd-mm-yyyy'), 1000000368);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (469, null, to_date('13-09-2002', 'dd-mm-yyyy'), to_date('25-05-2005', 'dd-mm-yyyy'), 1000000369);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (470, 'sent', to_date('24-06-2002', 'dd-mm-yyyy'), to_date('25-10-2002', 'dd-mm-yyyy'), 1000000370);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (471, 'deliverd', to_date('10-05-2005', 'dd-mm-yyyy'), to_date('11-02-2004', 'dd-mm-yyyy'), 1000000371);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (472, 'sent', to_date('14-10-2008', 'dd-mm-yyyy'), to_date('30-09-2007', 'dd-mm-yyyy'), 1000000372);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (473, null, to_date('16-03-2007', 'dd-mm-yyyy'), to_date('15-06-2005', 'dd-mm-yyyy'), 1000000373);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (474, 'deliverd', to_date('25-10-2006', 'dd-mm-yyyy'), to_date('05-02-2002', 'dd-mm-yyyy'), 1000000374);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (475, null, to_date('20-02-2008', 'dd-mm-yyyy'), to_date('25-03-2006', 'dd-mm-yyyy'), 1000000375);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (476, 'deliverd', to_date('06-03-2000', 'dd-mm-yyyy'), to_date('27-05-2003', 'dd-mm-yyyy'), 1000000376);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (477, null, to_date('02-08-2002', 'dd-mm-yyyy'), to_date('17-08-2008', 'dd-mm-yyyy'), 1000000377);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (478, 'deliverd', to_date('04-07-2003', 'dd-mm-yyyy'), to_date('24-12-2000', 'dd-mm-yyyy'), 1000000378);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (479, null, to_date('01-09-2004', 'dd-mm-yyyy'), to_date('27-06-2009', 'dd-mm-yyyy'), 1000000379);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (480, 'deliverd', to_date('25-10-2005', 'dd-mm-yyyy'), to_date('31-07-2006', 'dd-mm-yyyy'), 1000000380);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (481, 'deliverd', to_date('28-03-2001', 'dd-mm-yyyy'), to_date('10-11-2008', 'dd-mm-yyyy'), 1000000381);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (482, 'deliverd', to_date('17-07-2000', 'dd-mm-yyyy'), to_date('18-03-2005', 'dd-mm-yyyy'), 1000000382);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (483, null, to_date('07-07-2003', 'dd-mm-yyyy'), to_date('22-10-2007', 'dd-mm-yyyy'), 1000000383);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (484, 'sent', to_date('17-07-2005', 'dd-mm-yyyy'), to_date('31-08-2005', 'dd-mm-yyyy'), 1000000384);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (485, null, to_date('02-09-2002', 'dd-mm-yyyy'), to_date('20-05-2005', 'dd-mm-yyyy'), 1000000385);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (486, 'deliverd', to_date('23-07-2004', 'dd-mm-yyyy'), to_date('30-03-2007', 'dd-mm-yyyy'), 1000000386);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (487, 'deliverd', to_date('18-01-2003', 'dd-mm-yyyy'), to_date('10-08-2000', 'dd-mm-yyyy'), 1000000387);
insert into DELIVERY (deliverynum, status, deliverydate, deliveryfinisheddate, phonenum)
values (488, 'sent', to_date('06-02-2006', 'dd-mm-yyyy'), to_date('27-08-2006', 'dd-mm-yyyy'), 1000000388);
commit;
prompt 400 records loaded
prompt Loading FOODDELIVERY...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.0gh', 'IBB-015', 'D', 161);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512Mb SDRam PC133 Ki', 'ME-025', 'M', 117);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;8Ghz (478', 'CP-015', 'M', 149);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.4gh', 'IBB-108', 'D', 287);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Epson Stylus C42UX -', 'PT-003', 'M', 323);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Assembly CPU/Fan; Mo', 'ML-035', 'M', 327);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony 16X DVD-CDRom (', 'RD-029', 'M', 333);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case 250W P', 'CS-077', 'M', 110);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7SXF P4 478', 'CMI-070', 'D', 394);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate 120GB Serial', 'HD-017', 'D', 240);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-080', 'D', 301);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313B Black 300W P4/A', 'CS-014', 'D', 222);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('4 Port USB 2.0 High-', 'NC-001', 'M', 416);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.4gh', 'IBB-040', 'D', 382);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master DP5-6J', 'ML-036', 'M', 499);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CyberDrive 40X16X48X', 'RD-026', 'M', 345);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LG 32x10x40 and 16x ', 'RD-023', 'M', 305);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Creative Inspire 2.1', 'SK-017', 'D', 242);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-084', 'M', 234);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GA-7N400 Pro nForce ', 'MB-060', 'D', 134);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows XP Pro Regis', 'SW-010', 'M', 282);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.0gh', 'IBB-007', 'M', 426);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Surge protector', 'ML-018', 'D', 420);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-8IE533 I', 'MB-051', 'D', 404);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;6Ghz Bare', 'IBB-019', 'M', 249);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2600+ FBS 333', 'ABB-105', 'M', 128);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Gigab', 'ABB-073', 'M', 377);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Epson Stylus C42UX -', 'PT-003', 'M', 344);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ c', 'CMA-122', 'D', 251);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Fast Ethernet 10/100', 'NC-012', 'D', 259);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.7gh', 'CMI-068', 'D', 439);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8gh', 'CMI-103', 'D', 125);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMDXP1800/128M/30G B', 'YS-019', 'D', 109);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312D ATX translucent', 'CS-072', 'M', 119);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313G-B ATX case 400W', 'CS-030', 'D', 442);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Western Digital 20GB', 'HD-044', 'M', 338);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('HP 1300 Laser Jet Ne', 'PT-002', 'D', 461);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.2G', 'CMA-149', 'M', 299);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mouse Pad', 'ML-002', 'M', 170);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2400+ Retail ', 'CP-049', 'D', 388);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ G', 'CMA-070', 'D', 418);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.8gh', 'IBB-026', 'D', 343);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS USB2000 USB Turb', 'NC-001', 'D', 127);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-8SG800 M', 'MB-057', 'M', 487);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sound Blaster Audigy', 'SC-002', 'M', 409);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ASUS P4C800 Deluxe S', 'MB-010', 'M', 262);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-142', 'M', 265);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMDXP2400/128M/30G B', 'YS-023', 'M', 142);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.8Gh', 'IBB-035', 'M', 406);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('64Mb RDRam SAMSUNG M', 'ME-019', 'D', 167);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radion 7000 64Mb', 'VC-035', 'D', 314);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('17" Filter Screen', 'ML-034', 'D', 473);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium 4 2.0 ', 'CP-029', 'M', 126);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6Gh', 'CMI-094', 'D', 488);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & GigaB', 'ABB-009', 'M', 396);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.2MHz & B', 'ABB-111', 'D', 438);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Headset with Mircoph', 'SK-010', 'D', 457);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & Biost', 'ABB-108', 'D', 341);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD 1.1Ghz BareBone ', 'ABB-053', 'D', 319);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('400 Watt UL ATX Powe', 'CS-003', 'M', 114);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('219L ATX color Case ', 'CS-046', 'D', 389);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb DDR 333 PC2700', 'ME-031', 'D', 478);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.4gh', 'CMI-108', 'D', 378);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1800+ c', 'CMA-116', 'D', 455);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400 Bi', 'CMA-154', 'D', 308);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Front panel USB kit ', 'CS-018', 'M', 477);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2200+( ', 'CMA-108', 'M', 281);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ w', 'CMA-099', 'D', 402);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD MP 1900+ OEM cpu', 'CP-024', 'D', 156);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD Duron 1.3G', 'CMA-150', 'M', 198);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ C', 'CMA-128', 'D', 375);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('CyberDrive 40X16X48X', 'RD-026', 'D', 162);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 2.4 Ghz CPU', 'CP-004', 'M', 440);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radion 7000; 64M', 'VC-045', 'D', 102);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.8Ghz', 'YS-025', 'D', 362);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & Gigab', 'ABB-064', 'M', 150);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Desk Top Microphone', 'SK-005', 'M', 368);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi 52x 40 x 48 ', 'RD-037', 'D', 399);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black OptoRite 48X16', 'RD-015', 'M', 155);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ c', 'CMA-102', 'M', 489);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMDXP1800/128M/30G B', 'YS-019', 'M', 475);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312J ATX Case with 4', 'CS-066', 'M', 444);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 2.4 Ghz CPU', 'CP-004', 'M', 360);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-078', 'M', 211);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6Gh', 'CMI-088', 'D', 270);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ B', 'CMA-157', 'D', 197);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows XP Pro Regis', 'SW-010', 'M', 297);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Mitsumi Win 2000 Int', 'KB-006', 'M', 334);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2400+ Retail ', 'CP-049', 'M', 254);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('3Com 905cx-txm NIC (', 'NC-005', 'M', 227);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.4gh', 'IBB-040', 'M', 422);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 1;6Ghz Box ', 'CP-026', 'D', 391);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VLR skt 37', 'MB-008', 'D', 384);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Logitech Cordless El', 'KB-002', 'D', 484);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Biost', 'ABB-113', 'M', 217);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Dynatron CPU Cooler ', 'ML-037', 'M', 219);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ C', 'CMA-143', 'D', 182);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6Gh', 'CMI-099', 'D', 100);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('LG 32x10x40 and 16x ', 'RD-023', 'D', 113);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 2.0gh', 'CMI-104', 'M', 428);
commit;
prompt 100 records committed...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2400+ Retail ', 'CP-049', 'M', 199);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ASUS A7N8X Deluxe NV', 'CMA-160', 'M', 311);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2200+ C', 'CMA-111', 'D', 185);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1700+ G', 'CMA-068', 'D', 166);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Socket', 'ML-027', 'M', 115);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Socket', 'ML-027', 'D', 225);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Pentiume 4 3.0Ghz 80', 'YS-028', 'D', 367);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('DVI to 15pin CRT ada', 'VC-041', 'M', 331);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows 2000 w/Servi', 'SW-005', 'D', 429);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 4', 'CS-059', 'D', 286);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 3.0gh', 'IBB-113', 'M', 348);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2700+ C', 'CMA-141', 'M', 139);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.8Ghz', 'CP-025', 'M', 171);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 2.4ghz', 'IBB-042', 'M', 369);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 7000 VIVO', 'VC-009', 'M', 302);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb PC133 SDRam Mi', 'ME-014', 'M', 424);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.7gh', 'CMI-068', 'D', 335);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('3Com 905cx-txm NIC (', 'NC-005', 'D', 316);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb DDRam PC2100 K', 'ME-024', 'D', 306);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKD AMD 1G', 'CMA-021', 'M', 289);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ (', 'CMA-127', 'D', 425);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ Box & G', 'ABB-058', 'M', 292);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony 48x24x48 and 16', 'RD-038', 'D', 239);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.3Ghz & G', 'ABB-077', 'D', 431);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('YS AMD T-Bird 1.2 Gh', 'YS-017', 'M', 448);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.2Ghz OEM', 'CP-035', 'D', 379);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Western Digital 20GB', 'HD-044', 'M', 164);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.8gh', 'IBB-112', 'D', 423);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('C Rimm', 'ME-017', 'D', 458);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2000+ c', 'CMA-118', 'D', 135);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('SVA-USA VR-15A 15" T', 'MT-002', 'D', 255);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.3MHz & B', 'ABB-110', 'D', 264);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KDS 15" Flat Screen ', 'MT-016', 'D', 492);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & Gigab', 'ABB-081', 'M', 312);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313F-B ATX case 400W', 'CS-043', 'D', 263);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cyber Power 325SL Ba', 'UP-001', 'M', 413);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512mb DDR ECC Regist', 'ME-032', 'M', 494);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2500+ Barton ', 'CP-032', 'M', 233);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256MB DDR PC2700 Kin', 'ME-033', 'D', 231);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KDS 15" Flat Screen ', 'MT-016', 'M', 274);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Flat Panel Speakers ', 'SK-015', 'D', 309);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2700+ C', 'CMA-135', 'D', 195);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('hp scanjet 5550c sca', 'PT-099', 'D', 303);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black Sony CD-RW 52x', 'RD-025', 'D', 380);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6Gh', 'CMI-060', 'D', 207);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('2 Year Warranty On C', 'ML-101', 'D', 480);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.7Ghz', 'YS-024', 'D', 498);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Gigab', 'ABB-072', 'D', 437);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7SXF P4 478', 'CMI-070', 'M', 247);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS Firewire Web Cam', 'VC-014', 'D', 148);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Fast Ethernet 10/100', 'NC-012', 'M', 433);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('256Mb DDR PC2100 (Mi', 'ME-008', 'D', 145);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-105', 'M', 136);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KIT Keyboard Mouse a', 'CS-012', 'M', 121);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313K 300W P4/AMD and', 'CS-020', 'M', 237);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.3GHz', 'CP-003', 'M', 229);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('KIT Keyboard Mouse a', 'CS-025', 'M', 354);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD MP 1900+ OEM cpu', 'CP-024', 'D', 106);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Gigabyte GA-7VAXP AM', 'MB-052', 'D', 260);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Biost', 'ABB-113', 'D', 320);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Creative Sound Blast', 'SC-010', 'D', 250);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2700+ Retail ', 'CP-005', 'M', 258);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('M7SXF P4 478pin Moth', 'MB-028', 'D', 387);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GigaByte G-Max Intel', 'SY-005', 'D', 215);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.6gh', 'CMI-067', 'D', 446);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.8gh', 'IBB-008', 'D', 447);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & Gigab', 'ABB-081', 'M', 449);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ c', 'CMA-122', 'D', 275);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('xAMD XP 1600+ Biosta', 'CMA-045', 'M', 322);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('512Mb SDRam PC133', 'ME-013', 'D', 210);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.3Ghz', 'IBB-005', 'M', 238);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master ATA133', 'ML-023', 'M', 184);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Seagate Baraccuda 40', 'HD-024', 'D', 490);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-132', 'D', 358);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.1Ghz (11', 'CP-013', 'M', 353);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313H ATX 400w Case W', 'CS-050', 'D', 357);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black Complete Compu', 'YS-020', 'D', 103);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Antec PlusView1000AM', 'CS-021', 'D', 112);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6VLB Intel ', 'MB-014', 'M', 317);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-087', 'M', 337);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Serial ATA IDE Conne', 'ML-039', 'D', 146);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-078', 'M', 172);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP2000+ Biostar ', 'CMA-059', 'M', 397);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2500+ FBS 333', 'ABB-012', 'M', 427);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMR 56K V.90 Modem R', 'FM-006', 'D', 371);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2100+ Box & G', 'ABB-058', 'D', 204);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('MITSUMI 54X CD-Rom B', 'RD-008', 'M', 267);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.7ghz', 'IBB-006', 'D', 105);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Windows XP', 'SW-007', 'D', 253);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1700+ G', 'CMA-068', 'D', 202);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar Mini BareBon', 'sy-006', 'M', 221);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ B', 'CMA-155', 'D', 392);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ C', 'CMA-145', 'D', 218);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 1.8gh', 'IBB-026', 'M', 476);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Microsoft Wireless O', 'MS-006', 'D', 464);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ADS USB 4 Port Hub', 'NC-013', 'D', 419);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ C', 'CMA-128', 'M', 174);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M6TSU M/B(30', 'MB-021', 'D', 205);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('BIOSTAR M6TSL skt370', 'MB-011', 'D', 243);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Pentium4 2.0gh', 'IBB-039', 'D', 261);
commit;
prompt 200 records committed...
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.8Gh', 'CMI-101', 'D', 412);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 3000+ Barton ', 'ABB-117', 'M', 201);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel P4 1.7gh', 'CMI-068', 'D', 188);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('W.D 120G 7200RPM (12', 'HD-012', 'D', 398);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-142', 'D', 129);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('HP 1300 Laser Jet Ne', 'PT-002', 'M', 290);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Testing of CPU/Fan a', 'ML-016', 'D', 410);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('17" Filter Screen', 'ML-034', 'M', 481);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1800+ c', 'CMA-116', 'D', 241);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ C', 'CMA-138', 'D', 277);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2000+ & GigaB', 'ABB-009', 'D', 213);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ (', 'CMA-110', 'M', 209);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ G', 'CMA-070', 'M', 496);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ c', 'CMA-102', 'M', 160);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.3Ghz', 'IBB-005', 'D', 451);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Linksys Instant Wire', 'NC-025', 'M', 291);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.8ghz', 'IBB-014', 'D', 470);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.1Ghz', 'IBB-033', 'M', 395);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Cooler Master Copper', 'ML-011', 'D', 173);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1800+ & Biost', 'ABB-109', 'D', 469);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Maxtor 30GB 7200RPM ', 'HD-023', 'D', 158);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Pentiume 4 1.8Ghz/12', 'YS-027', 'M', 280);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Desk Top Microphone', 'SK-005', 'M', 430);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7VKD AMD 1G', 'CMA-021', 'M', 467);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('17" Filter Screen', 'ML-034', 'M', 482);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2400+ C', 'CMA-128', 'D', 372);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony 48x24x48 and 16', 'RD-038', 'M', 454);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows XP Pro Regis', 'SW-010', 'M', 266);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ (', 'CMA-072', 'D', 324);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('GA-8LD533 Intel®845G', 'MB-050', 'D', 390);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313F-B ATX case 400W', 'CS-043', 'M', 147);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('64Mb RDRam SAMSUNG M', 'ME-019', 'D', 192);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Windows 2000 w/Servi', 'SW-005', 'D', 456);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 1900+ & Gigab', 'ABB-063', 'M', 342);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Flat Panel Speakers ', 'SK-015', 'M', 350);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 4', 'CS-059', 'M', 421);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Sony Black 16X DVD .', 'RD-014', 'D', 374);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Biostar M7SXF P4 478', 'CMI-070', 'D', 169);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('312B ATX Case with 3', 'CS-010', 'D', 453);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ C', 'CMA-164', 'M', 271);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('313K 300W P4/AMD and', 'CS-020', 'D', 460);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD Duron 1.3MHz & B', 'ABB-110', 'D', 157);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2500+ B', 'CMA-157', 'M', 111);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo Intel Celeron ', 'CMI-079', 'D', 381);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel D875PBZ M/B on', 'CMI-122', 'M', 101);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Creative Inspire 520', 'SK-002', 'M', 465);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ASUS A7N8X Deluxe NV', 'MB-011', 'D', 190);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Black RF Wireless Ke', 'KB-018', 'D', 152);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2600+ C', 'CMA-158', 'D', 163);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel Celeron 1.8ghz', 'IBB-014', 'D', 393);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ATI Radeon 9800 Pro ', 'VC-019', 'M', 414);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Intel P4 2.4 Ghz CPU', 'CP-004', 'D', 283);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 1900+ c', 'CMA-122', 'D', 159);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('ASUS P4C800 Deluxe S', 'MB-010', 'D', 332);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('AMD XP 2200+ & Gigab', 'ABB-072', 'D', 224);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Allied 400watt Power', 'CS-051', 'M', 329);
insert into FOODDELIVERY (mealdescription, kashrus, typedm, deliverynum)
values ('Combo AMD XP 2100+ C', 'CMA-145', 'D', 228);
commit;
prompt 257 records loaded
prompt Loading SUPPLYSDELIVERY...
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000000, '87 Carlene Street', 242);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000001, '597 Chapman', 220);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000002, '85 Davidson', 401);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000003, '21 Scottsdale Ave', 186);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000004, '74 Espoo Blvd', 202);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000005, '58 New boston Street', 246);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000006, '922 Campbell Drive', 100);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000007, '272 Lineback Ave', 422);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000008, '881 Arturo Blvd', 258);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000009, '263 Murray Road', 219);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000010, '7 Lewin Road', 345);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000011, '7 Viterelli', 403);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000012, '74 Patty', 147);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000013, '4 Wagner Ave', 218);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000014, '8 Michelle Drive', 164);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000015, '276 Schenectady', 247);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000016, '29 Shatner Ave', 335);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000017, '72 Fairfax Road', 206);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000018, '55 Rifkin Road', 442);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000019, '13 Jordan Blvd', 193);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000020, '76 Creek Blvd', 297);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000022, '41st Street', 110);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000023, '13 Lofgren Street', 284);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000024, '6 McCready Street', 181);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000025, '345 Kanata Street', 287);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000026, '68 Black Drive', 126);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000027, '4 Copeland Street', 358);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000029, '74 McKean Drive', 260);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000031, '30 Jean-Claude', 402);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000033, '37 Flanery Street', 421);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000034, '7 Natascha', 322);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000035, '10 Kumamoto Road', 423);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000036, '58 Christie Ave', 319);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000037, '63 Mindy Road', 180);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000038, '90 Vince Blvd', 367);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000040, '45 Carrack Road', 256);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000041, '38 Patty Drive', 467);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000042, '30 Michael Road', 142);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000045, '2 Kuraby Road', 472);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000046, '32nd Street', 333);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000049, '30 Annie Road', 189);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000050, '1 Warburton Blvd', 470);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000051, '7 Chaykin Road', 292);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000052, '55 Melrose Street', 185);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000053, '41st Street', 325);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000054, '741 Anita Drive', 291);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000055, '49 Arlington', 443);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000056, '47 Pony Road', 432);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000058, '507 Begley', 395);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000059, '19 Ohtsu', 404);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000060, '71st Street', 303);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000061, '32 Overland park Dri', 289);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000062, '72 Favreau Road', 366);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000063, '85 Wallace Drive', 207);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000064, '95 Dooley Street', 157);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000065, '33 Edie Road', 255);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000066, '90 Neville Ave', 337);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000067, '59 Hurley', 458);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000068, '685 Chappelle Drive', 148);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000069, '32 Loeb Road', 311);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000070, '535 Payne Drive', 228);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000071, '27 Stuart', 214);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000072, '93 Woods Ave', 290);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000073, '11 Lindsay Blvd', 426);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000074, '23 Cyndi Road', 225);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000075, '49 Newnan Drive', 452);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000077, '174 Weisz Drive', 480);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000079, '52 Saint Ouen Drive', 368);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000081, '215 Miles Ave', 428);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000082, '22nd Street', 121);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000083, '58 Imbruglia Ave', 109);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000084, '32 McGowan Street', 112);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000085, '38 Maxine Street', 175);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000086, '51 Leon Street', 251);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000087, '32 Claude Drive', 330);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000088, '74 Reston Drive', 433);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000089, '26 Anjelica Street', 429);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000091, '589 Wayans Ave', 416);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000092, '23 Ricci', 350);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000093, '1 Brian Drive', 435);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000095, '50 Tallahassee Stree', 376);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000096, '949 M?nchengladbach ', 153);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000097, '215 Collie Street', 150);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000098, '21 Denise Street', 254);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000099, '14 Petach-Tikva Stre', 359);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000101, '631 Sarsgaard', 481);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000103, '26 Aberdeen Street', 465);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000104, '31 Vern Road', 340);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000105, '58 Mitchell Street', 476);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000106, '63 Cruise Road', 461);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000107, '40 Julio', 276);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000110, '14 Gaines Ave', 488);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000111, '49 McKennitt Drive', 454);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000112, '52 urban Road', 281);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000113, '52nd Street', 336);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000114, '71st Street', 397);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000115, '38 Hochwald Ave', 492);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000116, '9 Yomgok-dong Street', 363);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000117, '715 Chaplin Ave', 111);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000118, '927 Merchant Street', 324);
commit;
prompt 100 records committed...
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000119, '96 Mahood Street', 119);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000120, '30 Lillard Drive', 339);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000122, '809 Casey Street', 496);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000123, '53 Alpharetta Street', 425);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000124, '67 Apple Drive', 127);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000125, '71st Street', 382);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000126, '12 Fremont Street', 199);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000127, '52 Rade Road', 108);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000128, '32 Lake Oswego Drive', 233);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000129, '87 Frampton Ave', 137);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000130, '682 Hong Kong Road', 445);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000133, '4 Quaid Road', 145);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000135, '714 Aaron Road', 257);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000136, '92 Gilley', 332);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000137, '22 Watley', 271);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000138, '64 Morton Road', 128);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000139, '43rd Street', 278);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000140, '80 Hampton Drive', 315);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000142, '39 Spacek Ave', 224);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000143, '48 Griffin Road', 234);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000144, '49 Veruca Street', 409);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000145, '13 Patillo Street', 377);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000148, '94 Nicholas Road', 436);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000149, '794 Ellicott City Dr', 250);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000151, '24 Denver Drive', 450);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000152, '51st Street', 455);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000155, '463 Love Drive', 498);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000158, '64 Anita Street', 177);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000160, '6 Hirsch Drive', 392);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000163, '22 Farris Drive', 353);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000165, '39 James Ave', 210);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000166, '73rd Street', 146);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000167, '19 Gosdin Road', 261);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000169, '1 Deborah Ave', 141);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000171, '45 Bernex', 115);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000173, '20 Belp Drive', 131);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000174, '61 Archbold Road', 268);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000177, '26 Harvey Road', 431);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000179, '8 Remy Road', 390);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000180, '619 Taylor Blvd', 280);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000181, '99 Qu?bec Drive', 105);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000183, '83 Vaduz Road', 279);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000184, '84 Buscemi', 264);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000185, '653 Rourke Street', 370);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000186, '12 Nolte Road', 263);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000187, '19 Mandrell Drive', 197);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000189, '83 Alexandria Street', 469);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000190, '29 West Chester Stre', 444);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000191, '580 Meryl Drive', 125);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000192, '6 Streep', 161);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000193, '22 Tobolowsky Ave', 361);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000194, '22nd Street', 491);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000195, '3 Brothers Drive', 217);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000196, '725 Solon Road', 171);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000198, '218 East Providence ', 151);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000199, '155 Boothe Drive', 349);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000203, '21st Street', 494);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000204, '49 Kumamoto Street', 459);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000205, '86 Rochester Blvd', 277);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000207, '98 Coldmeece Blvd', 212);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000208, '9 Trenton Road', 267);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000211, '51 Lloyd Road', 184);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000212, '94 Akron Road', 130);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000214, '18 Algermissen', 371);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000215, '56 Stevenson Drive', 328);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000216, '27 Aiken Road', 468);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000217, '72 Sammy Ave', 196);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000219, '82 Dietikon Ave', 456);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000221, '6 Perrineau Road', 372);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000223, '75 Van Shelton Stree', 102);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000224, '54 Lowe Ave', 183);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000225, '7 Cervine Blvd', 302);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000226, '86 Browne Street', 117);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000228, '71 Hurt Street', 300);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000229, '507 Saul Road', 457);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000230, '52 Oxon Drive', 483);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000236, '51 Schwimmer Drive', 104);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000238, '12 Recife Road', 486);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000239, '10 Radney Drive', 346);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000240, '21 Warden Road', 410);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000241, '3 King of Prussia Ro', 318);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000243, '37 Vanessa Road', 385);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000247, '84 Marin Street', 139);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000250, '27 Wilkinson Road', 190);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000251, '296 Milsap Road', 101);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000252, '46 Enschede Street', 499);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000253, '993 Leipzig Road', 222);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000254, '31 Connelly Blvd', 313);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000255, '75 Moore Road', 310);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000256, '54 Randy', 482);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000257, '14 Gordie Ave', 209);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000259, '33 Lloyd Street', 200);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000261, '91 Walnut Creek Stre', 296);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000262, '59 Vienna Street', 381);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000267, '68 Campbell Drive', 230);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000268, '357 Kristofferson Ro', 192);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000269, '105 Percy Street', 331);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000270, '51st Street', 113);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000271, '96 Ferrell', 293);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000273, '47 Samantha Road', 243);
commit;
prompt 200 records committed...
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000275, '48 Woodbridge Street', 244);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000279, '63 Zooey', 348);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000280, '2 Mollard Street', 374);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000283, '63rd Street', 204);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000286, '2 Ronstadt Road', 152);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000288, '33 Brian Street', 172);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000289, '983 Donovan Road', 323);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000293, '14 Skaggs Drive', 412);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000295, '63rd Street', 162);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000296, '33 Barnegat Blvd', 226);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000297, '70 South Jordan Road', 493);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000300, '19 Simon Blvd', 136);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000303, '61 Pigott-Smith Blvd', 237);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000307, '21 Atlas Street', 342);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000308, '134 Bloomington Stre', 133);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000310, '59 Dayne Street', 272);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000312, '728 Spiner Street', 373);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000313, '43 Crudup Ave', 229);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000315, '74 Issaquah Road', 485);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000316, '8 Ebersdorf Road', 221);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000319, '69 Schock Road', 356);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000321, '435 Reubens Drive', 205);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000322, '26 Pony Street', 386);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000324, '100 Kista Drive', 168);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000325, '42 Jonatha Blvd', 232);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000326, '12nd Street', 343);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000328, '805 Buffalo Grove St', 235);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000329, '477 Emm Street', 240);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000330, '33 Skerritt Road', 406);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000331, '23 O''Keefe Road', 236);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000334, '8 Masur Ave', 273);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000340, '53rd Street', 341);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000343, '9 Roberta Blvd', 447);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000348, '78 Griffin Road', 449);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000350, '88 Spacek Road', 179);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000351, '5 Bernie Blvd', 451);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000354, '53 Murray Road', 448);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000355, '597 Burke Street', 380);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000356, '36 Schock Road', 173);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000359, '31st Street', 388);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000360, '894 Tucson Street', 270);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000361, '12 Bernard Street', 282);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000368, '25 Clive', 163);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000370, '264 Quinones Street', 321);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000371, '280 Kramer Road', 176);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000373, '67 Terri Drive', 265);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000375, '91 Red', 462);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000376, '19 Farris Street', 208);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000377, '3 Ramsey Drive', 306);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000381, '31 Judd Ave', 216);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000382, '45 Gino Street', 334);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000383, '1 Athens', 266);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000385, '63 Raleigh Street', 301);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000387, '18 Budapest Road', 132);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000389, '552 Arkenstone Ave', 460);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('No', 1000000390, '57 Barry Road', 439);
insert into SUPPLYSDELIVERY (needscooling, providerphonenum, provideradress, deliverynum)
values ('Yes', 1000000392, '11 Wainwright Street', 252);
commit;
prompt 257 records loaded
prompt Loading COMMUNITYMEMBER...
prompt Table is empty
prompt Loading BIRTH...
prompt Table is empty
prompt Enabling foreign key constraints for DRIVER...
alter table DRIVER enable constraint SYS_C00708671;
prompt Enabling foreign key constraints for DELIVERY...
alter table DELIVERY enable constraint SYS_C00708676;
prompt Enabling foreign key constraints for FOODDELIVERY...
alter table FOODDELIVERY enable constraint SYS_C00708679;
prompt Enabling foreign key constraints for SUPPLYSDELIVERY...
alter table SUPPLYSDELIVERY enable constraint SYS_C00708684;
prompt Enabling foreign key constraints for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER enable constraint SYS_C00708690;
alter table COMMUNITYMEMBER enable constraint SYS_C00708691;
alter table COMMUNITYMEMBER enable constraint SYS_C00708692;
alter table COMMUNITYMEMBER enable constraint SYS_C00708693;
prompt Enabling foreign key constraints for BIRTH...
alter table BIRTH enable constraint SYS_C00708699;
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
