CREATE TABLE community
(
  ComId INT NOT NULL,
  ComName varchar2(100) NOT NULL,
  Cdescripstion varchar2(1000) NOT NULL,
  city varchar2(50) NOT NULL,
  PRIMARY KEY (ComId)
);

CREATE TABLE meal
(
  mealId INT NOT NULL,
  kashrus varchar2(20) ,
  mealDescription varchar2(20) NOT NULL,
  typeDM varchar2(1) NOT NULL,
  PRIMARY KEY (mealId)
);


ALTER TABLE foodDelivery
  DROP COLUMN mealDescription,
  DROP COLUMN kashrus,
  DROP COLUMN typeDM;


ALTER TABLE foodDelivery
  ADD mealId INT;

ALTER TABLE foodDelivery
  ADD FOREIGN KEY (mealId) REFERENCES meal(mealId)


ALTER TABLE communityMember
  ADD userName varchar2(50),
  ADD userPassword INT,
  ADD ComId INT NOT NULL,
  ADD FOREIGN KEY (ComId) REFERENCES community(ComId);




ALTER TABLE birth
  ADD mealCount INT;
