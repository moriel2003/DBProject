CREATE TABLE person
(
  phoneNum INT NOT NULL,
  name varchar2(20) NOT NULL,
  city varchar2(20) NOT NULL,
  street varchar2(20) NOT NULL,
  zipCode varchar2(20),
  PRIMARY KEY (phoneNum)
);

CREATE TABLE driver
(
  vehicle varchar2(20) NOT NULL,
  isAvailable varchar2(3) NOT NULL,
  phoneNum INT NOT NULL,
  PRIMARY KEY (phoneNum),
  FOREIGN KEY (phoneNum) REFERENCES person(phoneNum)
);

CREATE TABLE delivery
(
  deliveryNum INT NOT NULL,
  status varchar2(20);
  deliveryDate DATE NOT NULL,
  deliveryFinishedDate DATE ,
  phoneNum INT NOT NULL,
  PRIMARY KEY (deliveryNum),
  FOREIGN KEY (phoneNum) REFERENCES driver(phoneNum)
);

CREATE TABLE foodDelivery
(
  mealDescription varchar2(20),
  kashrus varchar2(20),
  typeDM varchar2(1),
  deliveryNum INT NOT NULL,
  PRIMARY KEY (deliveryNum),
  FOREIGN KEY (deliveryNum) REFERENCES delivery(deliveryNum)
);

CREATE TABLE SupplysDelivery
(
  needsCooling varchar2(3),
  providerPhoneNum INT NOT NULL,
  providerAdress varchar2(20) NOT NULL,
  deliveryNum INT NOT NULL,
  PRIMARY KEY (deliveryNum),
  FOREIGN KEY (deliveryNum) REFERENCES delivery(deliveryNum)
);

CREATE TABLE communityMember
(
  phoneNum INT NOT NULL,
  deliveryNum INT NOT NULL,
  deliveryNumTo INT NOT NULL,
  foodDeliveryFromdeliveryNum INT NOT NULL,
  PRIMARY KEY (phoneNum),
  FOREIGN KEY (phoneNum) REFERENCES person(phoneNum),
  FOREIGN KEY (deliveryNum) REFERENCES SupplysDelivery(deliveryNum),
  FOREIGN KEY (deliveryNumTo) REFERENCES foodDelivery(deliveryNum),
  FOREIGN KEY (foodDeliveryFromdeliveryNum) REFERENCES foodDelivery(deliveryNum)
);

CREATE TABLE birth
(
  birthID INT NOT NULL,
  birtDate Date NOT NULL,
  numberOfBabies INT NOT NULL,
  phoneNum INT NOT NULL,
  PRIMARY KEY (birthID),
  FOREIGN KEY (phoneNum) REFERENCES communityMember(phoneNum)
);
