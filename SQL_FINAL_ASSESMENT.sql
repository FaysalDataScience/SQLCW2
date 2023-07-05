
DROP TABLE VIEWING_APPOINTMENT;
DROP TABLE SALE_PROPERTY;
DROP TABLE POTENTIAL_BUYER;
DROP TABLE SELLER;
DROP TABLE STAFF_MEMBER;


CREATE TABLE POTENTIAL_BUYER
       (BUYER_NO NUMBER(5) NOT NULL,
        BUYER_NAME VARCHAR2(20) NOT NULL,
        BUYER_ADDRESS VARCHAR2(150) NOT NULL,
        BUYER_AREA VARCHAR2(20) NOT NULL,
        MINIMUM_BEDROOM NUMBER(8) NOT NULL,
        MINIMUM_BATHROOM NUMBER(4) NOT NULL,
        MINIMUM_RECEPTIONROOM NUMBER(3) NOT NULL,
        GARAGE_REQUIRED NUMBER(3) NOT NULL,
        MAXIMUM_PRICE NUMBER(10,2) NOT NULL,

CONSTRAINT buyer_no_pk PRIMARY KEY (BUYER_NO));


CREATE TABLE SELLER
       (SELLER_ID NUMBER(5) NOT NULL,
        SELLER_NAME VARCHAR2(20) NOT NULL,
        SELLER_ADDRESS VARCHAR2(150) NOT NULL,
        SELLER_PHONE_NUMBER NUMBER(14) NOT NULL,
        
CONSTRAINT seller_id_pk PRIMARY KEY (SELLER_ID));



CREATE TABLE SALE_PROPERTY 
       (PROPERTY_CODE NUMBER(5) NOT NULL, 
        PROPERTY_AREA VARCHAR2(20) NOT NULL, 
        PROPERTY_ADDRESS VARCHAR2(150) NOT NULL, 
        NO_BEDROOM NUMBER(8) NOT NULL, 
        NO_BATHROOM NUMBER(4) NOT NULL, 
        NO_RECEPTIONROOM NUMBER(3) NOT NULL, 
        PROPERTY_TYPE VARCHAR2(20) NOT NULL CHECK( PROPERTY_TYPE IN ('Detached','Semi-detached','Terrace', 'Link') ), 
        PROPERTY_PRICE NUMBER(10) NOT NULL, 
        NO_GARAGE NUMBER(3) NOT NULL, 
        STATE_PROPERTY VARCHAR2(20) NOT NULL CHECK( STATE_PROPERTY IN ('Unsold','Sold') ), 
        WHETHER_PROPERTY VARCHAR2(20) NOT NULL CHECK( WHETHER_PROPERTY IN ('freehold','leasehold') ), 
        DATE_PLACED DATE NOT NULL, 
        SELLER_ID NUMBER(5) NOT NULL, 
CONSTRAINT property_code_pk PRIMARY KEY (PROPERTY_CODE), 
CONSTRAINT sellproperty_sellerid_fk FOREIGN KEY (SELLER_ID) REFERENCES SELLER(SELLER_ID)ON DELETE CASCADE);


CREATE TABLE STAFF_MEMBER
       (STAFF_MEMBER_ID NUMBER(5) NOT NULL,
        STAFF_MEMBER_NAME VARCHAR2(20) NOT NULL,
        STAFF_MEMBER_ADDRESS VARCHAR2(150) NOT NULL,
        STAFF_MEMBER_PHONE_NUMBER NUMBER(14) NOT NULL,
        STAFF_MEMBER_BRANCH VARCHAR2(20) NOT NULL,
        STAFF_MEMBER_ROLE VARCHAR2(20) NOT NULL,

CONSTRAINT staffmember_id_pk PRIMARY KEY (STAFF_MEMBER_ID));


CREATE TABLE VIEWING_APPOINTMENT
       (APPOINTMENT_ID NUMBER(5) NOT NULL,
        APPOINTMENT_DATE TIMESTAMP NOT NULL,
        APPOINTMENT_STATUS VARCHAR2(100) NOT NULL CHECK( APPOINTMENT_STATUS IN ('Successfull','pending') ),
        BUYER_NO NUMBER(5) NOT NULL,
        PROPERTY_CODE NUMBER(5) NOT NULL,
        STAFF_MEMBER_ID NUMBER(5) NOT NULL,

CONSTRAINT Appoinmentid_pk PRIMARY KEY (APPOINTMENT_ID),
CONSTRAINT buyerno_fk FOREIGN KEY (BUYER_NO) REFERENCES POTENTIAL_BUYER(BUYER_NO)ON DELETE CASCADE,
CONSTRAINT propertycode_fk FOREIGN KEY (PROPERTY_CODE) REFERENCES SALE_PROPERTY(PROPERTY_CODE)ON DELETE CASCADE,
CONSTRAINT staffmemberid_fk FOREIGN KEY (STAFF_MEMBER_ID) REFERENCES STAFF_MEMBER(STAFF_MEMBER_ID)ON DELETE CASCADE);











----
INSERT INTO potential_buyer VALUES ('1001', 'Muhammad', '39 King George V Dr W, Cardiff CF14 4EE', 'Cardiff', '3', '1', '1', '1', '800000');
INSERT INTO potential_buyer VALUES ('1002', 'George', '74 St Anthony Rd, Cardiff CF14 4DJ', 'Cardiff', '5', '2', '1', '1', '1500000');
INSERT INTO potential_buyer VALUES ('1003', 'Arthur', '28 St Georges Rd, Cardiff CF14 4AQ', 'Cardiff', '3', '2', '1', '1', '1000000');
INSERT INTO potential_buyer VALUES ('1004', 'Jacob', '24 Silver Birch Cl, Cardiff CF14 1EL', 'Cardiff', '6', '3', '1', '2', '1800000');
INSERT INTO potential_buyer VALUES ('1005', 'Harry', '78 Heol Gabriel, Cardiff CF14 1JW', 'Cardiff', '4', '2', '1', '1', '1500000');
INSERT INTO potential_buyer VALUES ('1006', 'Jesse', '11 Court Rd, Cardiff CF14 1HN', 'Cardiff', '3', '1', '1', '2', '1500000');
INSERT INTO potential_buyer VALUES ('1007', 'Emily ', '92 Wood Rd, Treforest, Pontypridd', 'Pontypridd', '2', '1', '1', '1', '800000');
INSERT INTO potential_buyer VALUES ('1008', 'Oliver', '8 New Park Terrace, Treforest, Pontypridd CF37 1TH', 'Pontypridd', '4', '2', '1', '1', '1500000');
INSERT INTO potential_buyer VALUES ('1009', 'Bartholomew', '9 King St, Treforest, Pontypridd CF37 1RP', 'Pontypridd', '4', '2', '1', '1', '1400000');
INSERT INTO potential_buyer VALUES ('1010', 'Griffith', '25 S Market St, Newport NP20 2AX', 'Newport', '3', '2', '2', '1', '1100000');
INSERT INTO potential_buyer VALUES ('1011', 'Jones', '9 Bolt St, Newport NP20 2AN', 'Newport', '5', '2', '1', '1', '1500000');
INSERT INTO potential_buyer VALUES ('1012', 'Tobiah', '135A Commercial Rd, Newport NP20 2PH', 'Newport', '6', '3', '2', '2', '1700000');
INSERT INTO potential_buyer VALUES ('1013', 'Wilbert', '17 Carlton Terrace, Swansea SA1 6AB', 'Swansea ', '3', '2', '2', '2', '1200000');


INSERT INTO seller VALUES ('101', 'Adam', '8 Ethel St, Cardiff CF5 1EJ', '07901777227');
INSERT INTO seller VALUES ('102', 'Alexander', '10 Daisy St, Cardiff CF5 1ES', '07714642772');
INSERT INTO seller VALUES ('103', 'Ronnie', '18 Daisy St, Cardiff CF5 1EP', '07029484764');
INSERT INTO seller VALUES ('104', 'Tommy', '32 Romilly Rd, Cardiff CF5 1FN', '07913785949');
INSERT INTO seller VALUES ('105', 'Acacius', '2 Egham St, Cardiff CF5 1FQ', '07785206064');
INSERT INTO seller VALUES ('106', 'Arlo', '21 Preswylfa St, Cardiff CF5 1FS', '07746857155');
INSERT INTO seller VALUES ('107', 'Grey', '26 Lysaght Ave, Newport NP19 0XB', '07834187098');
INSERT INTO seller VALUES ('108', 'Archie', '16 Lysaght Way, Newport NP19 4AD', '07730259380');
INSERT INTO seller VALUES ('109', 'Easton', '736 Corporation Rd, Newport NP19 4AD', '07015468023');
INSERT INTO seller VALUES ('110', 'Hunter', '17 Clarke Rd, Newport NP19 0XB', '07902911961');
INSERT INTO seller VALUES ('111', 'Finn', '12 Lysaght Way, Newport NP19 4AD', '07951825351');
INSERT INTO seller VALUES ('112', 'Luca', '8 MacKintosh Rd, Pontypridd CF37 4AE', '07079489831');
INSERT INTO seller VALUES ('113', 'Roman', '26 MacKintosh Rd, Pontypridd CF37 4AG', '07734168728');
INSERT INTO seller VALUES ('114', 'Asher', '6 Tygwyn Rd, Church Village, Pontypridd CF38 1DY', '07900026081');
INSERT INTO seller VALUES ('115', 'Hugo', '22 Wingfield Cl, Pontypridd CF37 4AB', '07066108996');
INSERT INTO seller VALUES ('116', 'Mateo', '9 Page St, Swansea SA1 4EZ', '07048185629');
INSERT INTO seller VALUES ('117', 'Otto', '26 Page St, Swansea SA1 4EY', '0788278732');
INSERT INTO seller VALUES ('118', 'James', '12 Nicholl St, Swansea SA1 4HE', '07989974498');
INSERT INTO seller VALUES ('119', 'Aarav', '28 Page St, Swansea SA1 4EY', '07861384206');
INSERT INTO seller VALUES ('120', 'Jasper', '70 Mansel St, Swansea SA1 5TN', '07003183470');
INSERT INTO seller VALUES ('121', 'Micah', '7 Carlton Terrace, Swansea SA1 6AB', '07003183471');


INSERT INTO sale_property VALUES ('5001', 'Cardiff', '8 Ethel St, Cardiff CF5 1EJ', '4', '2', '2', 'Detached', '1000000', '1', 'Unsold', 'freehold', '01-Jan-22', '101');
INSERT INTO sale_property VALUES ('5002', 'Cardiff', '10 Daisy St, Cardiff CF5 1ES', '3', '1', '1', 'Link', '900000', '2', 'Sold', 'leasehold', '02-Jan-22', '102');
INSERT INTO sale_property VALUES ('5003', 'Cardiff', '18 Daisy St, Cardiff CF5 1EP', '2', '1', '1', 'Detached', '800000', '1', 'Unsold', 'leasehold', '05-Jan-22', '103');
INSERT INTO sale_property VALUES ('5004', 'Cardiff', '32 Romilly Rd, Cardiff CF5 1FN', '5', '2', '2', 'Detached', '1500000', '2', 'Unsold', 'freehold', '06-Jan-22', '104');
INSERT INTO sale_property VALUES ('5005', 'Cardiff', '2 Egham St, Cardiff CF5 1FQ', '3', '1', '1', 'Link', '900000', '1', 'Sold', 'leasehold', '07-Jan-22', '105');
INSERT INTO sale_property VALUES ('5006', 'Cardiff', '21 Preswylfa St, Cardiff CF5 1FS', '2', '1', '1', 'Semi-detached', '800000', '1', 'Sold', 'freehold', '08-Jan-22', '106');
INSERT INTO sale_property VALUES ('5007', 'Newport', '26 Lysaght Ave, Newport NP19 0XB', '4', '2', '1', 'Terrace', '1300000', '1', 'Sold', 'leasehold', '15-Jan-22', '107');
INSERT INTO sale_property VALUES ('5008', 'Newport', '16 Lysaght Way, Newport NP19 4AD', '5', '2', '2', 'Semi-detached', '1600000', '2', 'Unsold', 'freehold', '01-Feb-22', '108');
INSERT INTO sale_property VALUES ('5009', 'Newport', '736 Corporation Rd, Newport NP19 4AD', '6', '3', '3', 'Link', '1700000', '2', 'Sold', 'freehold', '05-Feb-22', '109');
INSERT INTO sale_property VALUES ('5010', 'Newport', '17 Clarke Rd, Newport NP19 0XB', '4', '2', '2', 'Semi-detached', '1300000', '1', 'Unsold', 'leasehold', '07-Feb-22', '110');
INSERT INTO sale_property VALUES ('5011', 'Newport', '12 Lysaght Way, Newport NP19 4AD', '4', '2', '1', 'Terrace', '1350000', '1', 'Unsold', 'freehold', '08-Feb-22', '111');
INSERT INTO sale_property VALUES ('5012', 'Pontypridd', '8 MacKintosh Rd, Pontypridd CF37 4AE', '3', '1', '1', 'Terrace', '1300000', '1', 'Sold', 'leasehold', '17-Feb-22', '112');
INSERT INTO sale_property VALUES ('5013', 'Pontypridd', '26 MacKintosh Rd, Pontypridd CF37 4AG', '2', '1', '1', 'Semi-detached', '850000', '1', 'Sold', 'freehold', '01-Mar-22', '113');
INSERT INTO sale_property VALUES ('5014', 'Pontypridd', '6 Tygwyn Rd, Church Village, Pontypridd CF38 1DY', '5', '3', '2', 'Link', '750000', '2', 'Unsold', 'leasehold', '05-Mar-22', '114');
INSERT INTO sale_property VALUES ('5015', 'Pontypridd', '22 Wingfield Cl, Pontypridd CF37 4AB', '3', '1', '1', 'Detached', '900000', '1', 'Sold', 'freehold', '10-Mar-22', '115');
INSERT INTO sale_property VALUES ('5016', 'Swansea', '9 Page St, Swansea SA1 4EZ', '3', '1', '1', 'Terrace', '950000', '1', 'Unsold', 'freehold', '22-Mar-22', '116');
INSERT INTO sale_property VALUES ('5017', 'Swansea', '26 Page St, Swansea SA1 4EY', '4', '2', '2', 'Semi-detached', '1150000', '2', 'Sold', 'leasehold', '24-Mar-22', '117');
INSERT INTO sale_property VALUES ('5019', 'Swansea', '28 Page St, Swansea SA1 4EY', '3', '2', '1', 'Detached', '850000', '1', 'Sold', 'freehold', '25-Mar-22', '119');
INSERT INTO sale_property VALUES ('5020', 'Swansea', '70 Mansel St, Swansea SA1 5TN', '4', '2', '2', 'Link', '950000', '1', 'Unsold', 'leasehold', '01-Dec-22', '120');
INSERT INTO sale_property VALUES ('5021', 'Swansea', '7 Carlton Terrace, Swansea SA1 6AB', '3', '1', '1', 'Semi-detached', '750000', '2', 'Sold', 'freehold', '02-Dec-22', '121');


INSERT INTO staff_member VALUES ('3001', 'Patrick Vieira', '35 Jenkins St, Newport NP19 0GQ', '07823948561', 'Cardiff', 'Manager ');
INSERT INTO staff_member VALUES ('3002', 'Sophie', '16 Henson St, Newport NP19 0HN', '07859227583', 'Cardiff', 'senior Staff ');
INSERT INTO staff_member VALUES ('3003', 'Violet', '14 Liscombe St, Newport NP19 0HQ', '07948264679', 'Swansea ', 'Junior staff');
INSERT INTO staff_member VALUES ('3004', 'Graham Potter', '57 Liscombe St, Newport NP19 0HQ', '07071614190', 'Newport', 'Manager ');
INSERT INTO staff_member VALUES ('3005', 'Willow', '3 Hurford St, Maesycoed, Pontypridd CF37 1EW', '07741155127', 'Newport', 'senior Staff ');
INSERT INTO staff_member VALUES ('3006', 'Antonio Conte', '32 Hurford St, Maesycoed, Pontypridd CF37 1EW', '07040188661', 'Newport', 'Manager ');
INSERT INTO staff_member VALUES ('3007', 'Zoe', '29 Barry Rd, Pontypridd CF37 1HY', '07715800226', 'Pontypridd ', 'senior Staff ');
INSERT INTO staff_member VALUES ('3008', 'Phoebe', '138 Western Ave N, Cardiff CF14 2SD', '07824657508', 'Swansea ', 'Junior staff');
INSERT INTO staff_member VALUES ('3009', ' Marco Silva', '78 Ton-Yr-Ywen Ave, Cardiff CF14 4PB', '07957838317', 'Pontypridd ', 'Manager ');
INSERT INTO staff_member VALUES ('3010', 'Emma', '157 Western St, Swansea SA1 3JZ', '07057142929', 'Pontypridd ', 'Junior staff');



INSERT INTO viewing_appointment VALUES ('7001', '01-Jan-22 10.14.23.111001 AM', 'Successfull', '1009', '5004', '3001');
INSERT INTO viewing_appointment VALUES ('7002', '02-Jan-22 11.34.13.112211 AM', 'pending', '1010', '5005', '3002');
INSERT INTO viewing_appointment VALUES ('7003', '03-Jan-22 10.24.03.111111 AM', 'Successfull', '1005', '5006', '3003');
INSERT INTO viewing_appointment VALUES ('7004', '04-Jan-22 08.14.22.111133 AM', 'Successfull', '1006', '5007', '3004');
INSERT INTO viewing_appointment VALUES ('7005', '07-Jan-22 10.19.23.111111 AM', 'pending', '1007', '5008', '3005');
INSERT INTO viewing_appointment VALUES ('7006', '11-Jan-22 10.54.25.111111 AM', 'Successfull', '1008', '5009', '3006');
INSERT INTO viewing_appointment VALUES ('7007', '12-Jan-22 11.24.23.111111 AM', 'Successfull', '1006', '5010', '3002');
INSERT INTO viewing_appointment VALUES ('7008', '11-Feb-22 01.04.25.111111 AM', 'pending', '1007', '5011', '3003');
INSERT INTO viewing_appointment VALUES ('7009', '12-Feb-22 01.54.33.111111 AM', 'Successfull', '1008', '5012', '3004');
INSERT INTO viewing_appointment VALUES ('7010', '13-Feb-22 08.34.23.111111 AM', 'Successfull', '1009', '5013', '3005');
INSERT INTO viewing_appointment VALUES ('7011', '17-Mar-22 11.24.13.111111 AM', 'pending', '1010', '5014', '3006');
INSERT INTO viewing_appointment VALUES ('7012', '11-Mar-22 01.14.03.111111 AM', 'pending', '1011', '5015', '3005');
INSERT INTO viewing_appointment VALUES ('7013', '19-Mar-22 09.04.23.112211 AM', 'Successfull', '1012', '5016', '3006');
INSERT INTO viewing_appointment VALUES ('7014', '21-Apr-22 02.12.11.111111 AM', 'pending', '1010', '5017', '3007');




-- QUSTION:1
SELECT * FROM SALE_PROPERTY WHERE PROPERTY_AREA='Swansea';

-- QUESTION:2
SELECT * FROM SALE_PROPERTY WHERE PROPERTY_TYPE='Semi-detached' AND STATE_PROPERTY= 'Sold';

-- QUESTION:3

SELECT 
    PROPERTY_TYPE AS Type, 
    COUNT (STATE_PROPERTY) AS NumberSold
  FROM SALE_PROPERTY
  WHERE 
    STATE_PROPERTY = 'Sold'
  GROUP BY 
    PROPERTY_TYPE;


-- QUESTION:4
SELECT * FROM SALE_PROPERTY
WHERE  STATE_PROPERTY =  'Unsold'
AND PROPERTY_PRICE = (( SELECT MIN(PROPERTY_PRICE) FROM SALE_PROPERTY WHERE  STATE_PROPERTY =  'Unsold')) 
OR PROPERTY_PRICE = ((SELECT MAX(PROPERTY_PRICE) FROM SALE_PROPERTY WHERE  STATE_PROPERTY =  'Unsold' ));


-- QUESTION:5
SELECT *
FROM SALE_PROPERTY
WHERE NO_BEDROOM >= 3 AND NO_BATHROOM >= 1 AND NO_GARAGE= 1;

-- QUESTION:6
SELECT * FROM SALE_PROPERTY
WHERE DATE_PLACED BETWEEN '01-JAN-22' AND '28-FEB-22';

-- QUESTION:7


SELECT * FROM SALE_PROPERTY WHERE
STATE_PROPERTY =  'Unsold'
AND PROPERTY_PRICE IN ( SELECT MIN(PROPERTY_PRICE) FROM SALE_PROPERTY WHERE STATE_PROPERTY = 'Unsold' GROUP BY PROPERTY_TYPE )
OR PROPERTY_PRICE IN ( SELECT MAX(PROPERTY_PRICE) FROM SALE_PROPERTY WHERE STATE_PROPERTY = 'Unsold' GROUP BY PROPERTY_TYPE )
order by PROPERTY_TYPE;


-- QUESTION 8

SELECT	SM.STAFF_MEMBER_NAME, SM.STAFF_MEMBER_PHONE_NUMBER, SP.PROPERTY_CODE, SP.PROPERTY_AREA, SP.PROPERTY_ADDRESS, SP.NO_BEDROOM, SP.NO_BATHROOM, SP.NO_RECEPTIONROOM, SP.PROPERTY_TYPE, SP.PROPERTY_PRICE, SP.NO_GARAGE, SP.STATE_PROPERTY, SP.WHETHER_PROPERTY                           
FROM VIEWING_APPOINTMENT V , STAFF_MEMBER SM, SALE_PROPERTY SP
WHERE SM.STAFF_MEMBER_ID  = V.STAFF_MEMBER_ID AND V.PROPERTY_CODE=SP.PROPERTY_CODE AND 
SM.STAFF_MEMBER_NAME = 'Sophie';



-- QUESTION 9
    
SELECT BUYER_NAME, SELLER_NAME,PROPERTY_ADDRESS, STAFF_MEMBER_NAME, APPOINTMENT_DATE	FROM VIEWING_APPOINTMENT , POTENTIAL_BUYER, SELLER, SALE_PROPERTY , STAFF_MEMBER
	
WHERE	POTENTIAL_BUYER.BUYER_NO (+) = VIEWING_APPOINTMENT.BUYER_NO AND
        SELLER.SELLER_ID (+) = SALE_PROPERTY.SELLER_ID AND
        SALE_PROPERTY.PROPERTY_CODE (+) = VIEWING_APPOINTMENT.PROPERTY_CODE AND
        STAFF_MEMBER.STAFF_MEMBER_ID (+) = VIEWING_APPOINTMENT.STAFF_MEMBER_ID;


