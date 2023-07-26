CREATE TABLE user_details(user_id varchar(6), first_name varchar(30), last_name varchar(30), DOB date, phone_no varchar(10), email_id varchar(30), passw varchar(20), CONSTRAINT PK_Customer PRIMARY KEY(user_id, phone_no));

insert into user_details values('pat228','Arav','Abi','1989-01-20','9232348904','pat.johnston@example.com','jarhead');
insert into user_details values('lan348','Landon ','Morris','1992-02-12','9023488904','landon.morris@example.com','homeboy');
insert into user_details values('gla343','Gladys ','Morris','1988-01-10','9232333444','gladys.morris@example.com','drpepper');
insert into user_details values('lon612','Lonnie','Hopkins','1991-08-22','9129038904','lonnie.hopkins@example.com','justus');
insert into user_details values('yvo809','Yvonne','Garrett','1985-12-31','9090808904','yvonne.garrett@example.com','mustang6');

insert into user_details values('ari231','Arisa','Page','1985-01-05', '9055129336','ari.page@example.com','pages855');
insert into user_details values('jes766','Jessie','McCoy','1986-10-08', '9043307087','jes.mcc@example.com','wadada12');
insert into user_details values('bea504','Beatrice','Rowland','1987-04-05', '9016880423','beatrice.rows@example.com','pepperflakes');
insert into user_details values('aly872','Alyssa','Joseph','1988-03-14', '9716673281','aly.joseph@example.com','among89us');
insert into user_details values('sla772','Slade','Goodwin','1989-09-05', '9154153682','slader.good@example.com','sliderslade');
CREATE TABLE customer_details(user_id varchar(6), auto_renewal INTEGER(1), postal_code integer(6), account_no varchar(16), card_holder_name varchar(20), card_no varchar(20), expiry_date date, service_no integer(3), CONSTRAINT PK_cust PRIMARY KEY(user_id));
alter table customer_details modify column service_no integer(3) not null unique;
INSERT INTO customer_details VALUES('pat228', 1, 679543,'6052501403744375','Pat', '2753585703246848', '2024-01-22',599);
INSERT INTO customer_details VALUES('lan348', 1, 537341,'9759007875959620','Landon','5601580950710594 ','2023-02-15',600);
INSERT INTO customer_details VALUES('gla343', 1, 479001,'7503589801761989 ','Gladys','3154166141412956 ', '2025-01-02',110);
INSERT INTO customer_details VALUES('lon612', 0, 432098,'3057171446652151 ','Lonnie','6607822161935602 ', '2026-07-29',230);
INSERT INTO customer_details VALUES('yvo809', 0, 324561,'8417146815012068 ','Yvonne','1234123412341234 ', '2023-06-20',560);

-- 3.	Admin_details
CREATE TABLE Admin_details(admin_id varchar(6), user_id varchar(6), admin_control_area varchar(15), CONSTRAINT PK_Admin PRIMARY KEY(admin_id, user_id));
insert into Admin_details values('ari231','pat228',560024); 
insert into Admin_details values('jes766','lan348',560024);
insert into Admin_details values('bea504','gla343',560024);
insert into Admin_details values('aly872','lon612',231102); 
insert into Admin_details values('sla772','yvo809',231102); 
-- 4.	Address
CREATE TABLE Address(user_id varchar(6), pincode integer, city varchar(20), state varchar(20), CONSTRAINT PK_Address PRIMARY KEY(pincode));

insert into Address values('pat228',599118,'Bangalore','Karnataka');
insert into Address values('lan348',600001,'Chennai','Tamilnadu');
insert into Address values('gla343',110001,'Delhi','Haryana');
insert into Address values('lon612',230532,'Mumbai','Maharashtra');
insert into Address values('yvo809',560091,'Hyderabad','Andrapradesh');
-- 5.	service_details
CREATE TABLE service_details(service_no integer(3), pincode integer(6), CONSTRAINT PK_ser PRIMARY KEY(service_no), FOREIGN key(pincode) REFERENCES Address(pincode), FOREIGN key(service_no) REFERENCES customer_details(service_no));
INSERT INTO service_details VALUES(599,599118);
INSERT INTO service_details VALUES(600,600001);
INSERT INTO service_details VALUES(110,110001);
INSERT INTO service_details VALUES(230,230532);
INSERT INTO service_details VALUES(560,560091);

CREATE TABLE Energy_charge(ec_id integer, energy_charge_per_unit float, tariff_slab varchar(10), total_energy_charges float, CONSTRAINT PK_EC PRIMARY KEY(ec_id));

INSERT INTO Energy_charge VALUES(220,'1200','2342','4366');
INSERT INTO Energy_charge VALUES(221,'2200','3442','2340');
INSERT INTO Energy_charge VALUES(222,'3200','4442','2531');
INSERT INTO Energy_charge VALUES(223,'1908','2341','1234');
INSERT INTO Energy_charge VALUES(224,'4312','1231','3421');


CREATE TABLE other_charge(oc_id integer, Duty float, GST float, fixed_charges float, total_other_charges float, CONSTRAINT PK_EC PRIMARY KEY(oc_id));
INSERT INTO other_charge VALUES(110,'1212','5656','8988','5676');
INSERT INTO other_charge VALUES(111,'1122','3908','7771','3411');
INSERT INTO other_charge VALUES(112,'1200','5096','8966','5006');
INSERT INTO other_charge VALUES(113,'3213','2000','1090','5555');
INSERT INTO other_charge VALUES(114,'1012','7878','2134','6191');

CREATE TABLE Appliances(cons_appl_id integer(5), office integer(3), laundry integer(3), Heating_Cooling integer(3), Living_Room integer(3), lights integer(3), kitchen integer(3), misc integer(3), tools integer(3), CONSTRAINT PK_EC PRIMARY KEY(cons_appl_id));

INSERT INTO Appliances VALUES(86490,10,20,15,23,12,18,6,9); 
INSERT INTO Appliances VALUES(24313,23413,23211,22111,11231,22113,11223,11223,11223); 
INSERT INTO Appliances VALUES(11233,34521,33442,22323,13132,45321,12323,12323,12323); 
INSERT INTO Appliances VALUES(23231,19867,18881,14341,10932,54123,12342,12342,12342); 
INSERT INTO Appliances VALUES(11224,45421,90213,32412,32675,45451,23421,23421,23421); 

CREATE TABLE Consumption(cons_category_id integer, units_consumed_heavy integer(3), units_consumed_medium integer(3), units_consumed_low integer(3), CONSTRAINT PK_EC PRIMARY KEY(cons_category_id));

INSERT INTO Consumption VALUES(86490,102,48,89);
INSERT INTO Consumption VALUES(20320,4441,123,250); 
INSERT INTO Consumption VALUES(30333,2221,212,250); 
INSERT INTO Consumption VALUES(23434,1231,120,250); 
INSERT INTO Consumption VALUES(55785,7676,671,250); 
INSERT INTO Consumption VALUES(20321,2345,567,250); 

CREATE TABLE Billing(bill_no varchar(12), cons_category_id integer, cons_appl_id integer, ec_id integer, oc_id  integer, units_consumed_cycle integer(5), FOREIGN key(ec_id) REFERENCES Energy_charge(ec_id), FOREIGN key(oc_id) REFERENCES other_charge(oc_id), FOREIGN key(cons_appl_id) REFERENCES Appliances(cons_appl_id), FOREIGN key(cons_category_id) REFERENCES Consumption(cons_category_id), PRIMARY KEY(bill_no));

INSERT INTO Billing VALUES('642581757212', 86490, 86490, 220, 110, 1200);
INSERT INTO Billing VALUES('569225387797', 20320, 24313, 221, 111, 1650);
INSERT INTO Billing VALUES('159320833161', 30333, 11233, 222, 112, 2100);
INSERT INTO Billing VALUES('640961225729', 23434, 23231, 223, 113, 970);
INSERT INTO Billing VALUES('629331870828', 55785, 11224, 224, 114, 2250);
INSERT INTO Billing VALUES('954297254243', 55785, 11224, 224, 114, 2250);
INSERT INTO Billing VALUES('936810891522', 55785, 11224, 224, 114, 2250);
INSERT INTO Billing VALUES('481215591710', 55785, 11224, 224, 114, 2250);
INSERT INTO Billing VALUES('446864205641', 55785, 11224, 224, 114, 2250);
INSERT INTO Billing VALUES('546864205641', 55785, 11224, 224, 114, 2250);
INSERT INTO Billing VALUES('646864205641', 55785, 11224, 224, 114, 2250);
INSERT INTO Billing VALUES('746864205641', 55785, 11224, 224, 114, 2250);
INSERT INTO Billing VALUES('160079570022', 86490, 11233, 224, 114, 2250);


CREATE TABLE Payment_details(transaction_id varchar(10), pay_amt float, pay_status varchar(10), pay_date date, pay_time timestamp, CONSTRAINT PK_Payment PRIMARY KEY(transaction_id));

INSERT INTO Payment_details VALUES('8546509433',4791, 'Successful','2022-01-21','2021-01-20 23:30:23'); 
INSERT INTO Payment_details VALUES('8485327687',4326, 'Successful', '2021-11-02','2021-11-02 14:48:33'); 
INSERT INTO Payment_details VALUES('2757608823',4326, 'Failed', '2021-11-09','2021-09-02 14:48:33'); 
INSERT INTO Payment_details VALUES('6869803935', 4873, 'Successful', '2021-01-18','2021-01-18 06:46:34'); 
INSERT INTO Payment_details VALUES('8546502433', 7931, 'Successful', '2021-02-13','2021-02-13 12:56:45'); 
INSERT INTO Payment_details VALUES('8485357687', 7931, 'Successful', '2021-02-13','2021-02-13 12:56:45'); 
INSERT INTO Payment_details VALUES('5757608823', 7931, 'Successful', '2021-02-13','2021-02-13 12:56:45'); 
INSERT INTO Payment_details VALUES('6369803935', 7931, 'Successful', '2021-02-13','2021-02-13 12:56:45'); 
INSERT INTO Payment_details VALUES('8546549433', 7931, 'Successful', '2021-02-13','2021-02-13 12:56:45'); 
INSERT INTO Payment_details VALUES('8435327687', 7931, 'Successful', '2021-02-13','2021-02-13 12:56:45'); 
INSERT INTO Payment_details VALUES('2757208823', 7931, 'Successful', '2021-02-13','2021-02-13 12:56:45'); 
INSERT INTO Payment_details VALUES('6863803935', 7931, 'Successful', '2021-02-13','2021-02-13 12:56:45'); 
INSERT INTO Payment_details VALUES('8741015707',4791, 'Successful', '2022-01-10','2022-01-10 23:30:23'); 

CREATE TABLE Bill_details(bill_no varchar(12), user_id varchar(6), transaction_id varchar(10), bill_amt float, bill_area integer, issue_month varchar(9), issue_date date, due_date date, discon_date date, CONSTRAINT PK_billDet PRIMARY KEY(bill_no, user_id), FOREIGN key(bill_no) REFERENCES Billing(bill_no), FOREIGN key(user_id) REFERENCES customer_details(user_id), FOREIGN KEY(transaction_id) REFERENCES Payment_details(transaction_id));


-- INSERT INTO Bill_details VALUES('642581757212','yvo809', '8546509433', 4791, 231348 ,'Jan', '2022-02-02', '2022-02-02', '2022-02-02'); 
-- INSERT INTO Bill_details VALUES('569225387797','pat228', '8485327687', 4326, 611273 ,'Nov', '2021-11-02', '2021-02-02', '2021-02-02'); 
-- INSERT INTO Bill_details VALUES('159320833161','lan348', '2757608823', 4873, 893958 ,'Jan', '2021-01-18', '2021-03-18', '2021-03-18'); 
-- INSERT INTO Bill_details VALUES('640961225729','gla343', '6869803935', 7931, 388011 ,'Feb', '2021-02-13', '2021-04-13', '2021-04-13'); 
-- INSERT INTO Bill_details VALUES('936810891522','yvo809', '2757608823', 7347, 813010 ,'Oct', '2021-10-01', '2021-07-01', '2021-07-01');

INSERT INTO Bill_details VALUES('642581757212','yvo809', '8546509433', 479, 231348 , 'Feb', '2021-02-12', '2021-02-17', '2021-02-22'); 
INSERT INTO Bill_details VALUES('569225387797','yvo809', '8485327687', 432, 611273 , 'Mar', '2021-03-12', '2021-03-17', '2021-03-22'); 
INSERT INTO Bill_details VALUES('159320833161','yvo809', '2757608823', 487, 893958 , 'Apr', '2021-04-12', '2021-04-17', '2021-04-22'); 
INSERT INTO Bill_details VALUES('640961225729','yvo809', '6869803935', 793, 388011 , 'May', '2021-05-12', '2021-05-17', '2021-05-22'); 
INSERT INTO Bill_details VALUES('629331870828','yvo809', '8546502433', 608, 818357 , 'Jun', '2021-06-12', '2021-06-17', '2021-06-22'); 
INSERT INTO Bill_details VALUES('954297254243','yvo809', '8485357687', 734, 813010 , 'Jul', '2021-07-12', '2021-07-17', '2021-07-22'); 
INSERT INTO Bill_details VALUES('936810891522','yvo809', '5757608823', 967, 813010 , 'Aug', '2021-08-12', '2021-08-17', '2021-08-22'); 
INSERT INTO Bill_details VALUES('481215591710','yvo809', '6369803935', 858, 813010 , 'Sep', '2021-09-12', '2021-09-17', '2021-09-22');
INSERT INTO Bill_details VALUES('446864205641','yvo809', '8546549433', 568, 813010 , 'Oct', '2021-10-12', '2021-10-17', '2021-10-22');
INSERT INTO Bill_details VALUES('546864205641','yvo809', '8435327687', 856, 813010 , 'Nov', '2021-11-12', '2021-11-17', '2021-11-22');
INSERT INTO Bill_details VALUES('646864205641','yvo809', '2757208823', 967, 813010 , 'Dec', '2021-12-12', '2021-12-17', '2021-12-22');
INSERT INTO Bill_details VALUES('746864205641','yvo809', '6863803935', 856, 813010 , 'Jan', '2022-01-12', '2021-12-17', '2021-12-22');
INSERT INTO Bill_details VALUES('160079570022','yvo809', '8741015707', 4791, 813010 , 'Jan', '2021-12-13', '2022-01-13', '2022-01-22');

CREATE TABLE Feedback(fb_id integer(3), user_id varchar(6),fb_desc varchar(100), fb_date date, fb_time timestamp, Constraint PK_Feedback PRIMARY KEY(fb_id, user_id), FOREIGN KEY(user_id) REFERENCES customer_details(user_id)); 


INSERT INTO Feedback VALUES(127 , 'pat228', 'It was a really good user friendly website, made the payment process esier','2021-01-20','2021-01-20 23:30:23'); 
INSERT INTO Feedback VALUES(929 , 'lan348', 'Had a problem with payment process','2021-11-02','2021-11-02 14:48:33'); 
INSERT INTO Feedback VALUES(244 , 'gla343', 'Payment was pretty smooth','2021-01-18','2021-01-18 06:46:34'); 
INSERT INTO Feedback VALUES(743 , 'lon612', 'Auto renewal not working','2021-02-13','2021-02-13 12:56:45'); 
INSERT INTO Feedback VALUES(192 , 'yvo809', 'It is good','2021-12-09','2021-12-09 11:13:56'); 
INSERT INTO Feedback VALUES(632 , 'yvo809', 'Auto renewal option is really helpful','2021-10-01','2021-10-01 17:00:45'); 
