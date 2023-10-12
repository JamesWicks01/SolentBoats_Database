-- Database Coursework
-- By James Wicks UP2122177


-- CREATE AND CONNECTS TO THE DATABASE
CREATE DATABASE up2122177_cw;
\c up2122177_cw



-- CREATE THE TABLES


-- CREATE CUSTOMER TABLE
CREATE TABLE CUSTOMER(
CUST_ID SERIAL PRIMARY KEY,
CUST_FNAME VARCHAR(60) NOT NULL,
CUST_LNAME VARCHAR(60) NOT NULL,
EMAIL VARCHAR(255) NOT NULL,
PHONE VARCHAR(20) NOT NULL,
ADDR1 VARCHAR(50) NOT NULL,
ADDR2 VARCHAR(50),
TOWN VARCHAR(60) NOT NULL,
POSTCODE CHAR(8) NOT NULL
);

-- CREATE BOATYARD TABLE
CREATE TABLE BOATYARD(
BOATYARD_ID SERIAL PRIMARY KEY,
BOATYARD_NAME VARCHAR(50) NOT NULL,
ADDR1 VARCHAR(50) NOT NULL,
ADDR2 VARCHAR(50),
TOWN VARCHAR(60) NOT NULL,
POSTCODE CHAR(8) NOT NULL
);

-- CREATE BOAT TABLE
CREATE TABLE BOAT(
BOAT_ID SERIAL PRIMARY KEY,
BOAT_NAME VARCHAR(50) NOT NULL,
BOAT_MODEL VARCHAR(50) NOT NULL,
BOAT_ENGINE VARCHAR(50) NOT NULL,
BOAT_BUILTDATE DATE NOT NULL,
BOAT_FUEL VARCHAR(10) NOT NULL,
BOATYARD INT NOT NULL REFERENCES BOATYARD(BOATYARD_ID),
OWNER INT NOT NULL REFERENCES CUSTOMER(CUST_ID)
);

-- CREATE STAFF TABLE
CREATE TABLE STAFF(
STAFF_ID SERIAL PRIMARY KEY,
STAFF_FNAME VARCHAR(60) NOT NULL,
STAFF_LNAME VARCHAR(60) NOT NULL,
WORK_EMAIL VARCHAR(100) NOT NULL,
HOME_EMAIL VARCHAR(255) NOT NULL,
ADDR1 VARCHAR(50) NOT NULL,
ADDR2 VARCHAR(50),
TOWN VARCHAR(60) NOT NULL,
POSTCODE CHAR(8) NOT NULL,
BOATYARD INT NOT NULL REFERENCES BOATYARD(BOATYARD_ID)
);

-- CREATE ROLE TABLE
CREATE TABLE ROLE(
ROLE_ID SERIAL PRIMARY KEY,
ROLE_NAME VARCHAR(40) NOT NULL
);

-- CREATE STAFF_ROLE TABLE
CREATE TABLE STAFF_ROLE (
ROLE_ID INT NOT NULL,
STAFF_ID INT NOT NULL,
PRIMARY KEY (ROLE_ID, STAFF_ID),
FOREIGN KEY (ROLE_ID) REFERENCES ROLE(ROLE_ID),
FOREIGN KEY (STAFF_ID) REFERENCES STAFF(STAFF_ID)
);

-- CREATE BOOKED SERVICE TABLE 
CREATE TABLE BOOKED_SERVICE(
SERVICE_ID SERIAL PRIMARY KEY,
SERVICE_BOAT INT NOT NULL REFERENCES BOAT(BOAT_ID),
SERVICE_DATE DATE NOT NULL
);

-- CREATE COMPLETED SERVICE TABLE
CREATE TABLE COMPLETED_SERVICE(
COMPLETED_SERVICE_ID SERIAL PRIMARY KEY,
SERVICE_ID INT NOT NULL REFERENCES BOOKED_SERVICE(SERVICE_ID),
SERVICE_TYPE VARCHAR(255) NOT NULL,
SERVICE_DETAILS VARCHAR(255) NOT NULL
);

-- CREATE SERVICE_STAFF TABLE
CREATE TABLE SERVICE_STAFF(
COMPLETED_SERVICE_ID INT NOT NULL,
STAFF_ID INT NOT NULL,
PRIMARY KEY (COMPLETED_SERVICE_ID, STAFF_ID),
FOREIGN KEY (COMPLETED_SERVICE_ID) REFERENCES COMPLETED_SERVICE(COMPLETED_SERVICE_ID),
FOREIGN KEY (STAFF_ID) REFERENCES STAFF(STAFF_ID)
);



-- POPULATING THE TABLES


-- CUSTOMER TABLE 
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Corly', 'Santarelli', 'csantarelli0@360.cn', '3301338520', '82327 6th Avenue', 'Room 559', 'Taung', '8609');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Scott', 'Juares', 'sjuares1@hexun.com', '4465869042', '05667 New Castle Point', 'PO Box 43997', 'Wabana', 'V7X');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Corey', 'Sturley', 'csturley2@reverbnation.com', '9371908584', '4795 Erie Pass', null, 'Xuxiake', '12345');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Amalle', 'Tallent', 'atallent3@bizjournals.com', '3218888669', '63 Drewry Trail', 'Room 1866', 'Enschede', '7524');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Aleta', 'Juckes', 'ajuckes4@bizjournals.com', '2673198523', '8 Judy Alley', 'Suite 26', 'Wat Sing', '17120');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Wilfrid', 'Hurtado', 'whurtado5@blogspot.com', '2584861732', '3644 Hermina Center', null, 'Mursaba', '13532');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Fraze', 'Briatt', 'fbriatt6@howstuffworks.com', '7155081034', '2 Goodland Alley', null, 'Qihama', '14521');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Hayyim', 'Sunman', 'hsunman7@pinterest.com', '1166716053', '830 Portage Avenue', null, 'Darhan', '25256');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Devlin', 'Fruish', 'dfruish8@altervista.org', '9085188867', '6965 3rd Trail', null, 'Mirskoy', '352159');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Willy', 'Matcham', 'wmatcham9@economist.com', '2931266849', '76486 Express Terrace', null, 'Gopaan', '52424');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Carroll', 'Sinderland', 'csinderlanda@army.mil', '3642598871', '4618 Sage Road', 'Suite 88', 'Piekielnik', '34-472');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Gerik', 'Zucker', 'gzuckerb@storify.com', '7032790868', '9392 Canary Court', null, 'Pasaco', '22015');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Eugene', 'Tivolier', 'etivolierc@fda.gov', '7276650819', '09545 Prairie Rose Street', null, 'Pérama', '44522');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Corney', 'Dymott', 'cdymottd@t-online.de', '5701070302', '5106 Talmadge Alley', null, 'Kyzyl-Kyya', '35252');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Misha', 'Hearl', 'mhearle@elpais.com', '8223060977', '4556 Marquette Terrace', null, 'Pau', '64029');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Harald', 'Duberry', 'hduberryf@nydailynews.com', '2129426417', '0 Eastwood Street', null, 'Krajan', '525225');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Gael', 'Sutton', 'gsuttong@vk.com', '4022128161', '2 Mendota Hill', 'Room 263', 'Krajan Dua Sumbersari', '53532');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Fair', 'Eouzan', 'feouzanh@go.com', '5971501489', '2101 Thierer Terrace', null, 'Apatin', '535224');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Brandea', 'Tremayne', 'btremaynei@ustream.tv', '5445547699', '0953 Russell Parkway', '16th Floor', 'Bisert’', '623050');
insert into CUSTOMER (CUST_FNAME, CUST_LNAME, EMAIL, PHONE, ADDR1, ADDR2, TOWN, POSTCODE) values ('Sharl', 'How to preserve', 'showtopreservej@bing.com', '4956471441', '4185 Buell Alley', 'PO Box 4554', 'Chynadiyovo', '46865');


-- BOATYARD TABLE
insert into BOATYARD (BOATYARD_NAME, ADDR1, ADDR2, TOWN, POSTCODE) values ('Uppsala Boatyard', '63 Erie Junction', null, 'Uppsala', '753 14');
insert into BOATYARD (BOATYARD_NAME, ADDR1, ADDR2, TOWN, POSTCODE) values ('Kashin Boatyard', '191 Morningstar Hill', 'Room 388', 'Kashin', '171649');
insert into BOATYARD (BOATYARD_NAME, ADDR1, ADDR2, TOWN, POSTCODE) values ('Jejkowice Boatyard', '5 Di Loreto Junction', null, 'Jejkowice', '44-290');
insert into BOATYARD (BOATYARD_NAME, ADDR1, ADDR2, TOWN, POSTCODE) values ('Bobadela Boatyard', '129 Laurel Park', 'Room 543', 'Bobadela', '3405-006');

-- BOAT TABLE
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Narrowleaf Yucca', 'Princess V50', '2 x 5500cc', '2020/10/02', 'Diesel', 1, 1);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Coralbells', 'Princess V50', '2 x 5500cc', '2021/07/14',  'Diesel', 1, 2);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Largeflower Bellwort', 'Princess V50', '2 x 5500cc', '2020/09/02',  'Diesel', 1, 3);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Oxandra', 'Sea doo Jetski', '899cc', '2021/05/24', 'Petrol', 1, 4);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Appalachian Quillwort', 'Sea doo Jetski', '899cc', '2021/03/29',  'Petrol', 1, 5);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Bigfruit Crab', 'Sailing Dinghy', 'N/A', '2020/10/19', 'N/A', 1, 6);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Longroot Smartweed', 'Sailing Dinghy', 'N/A', '2022/12/18', 'N/A', 1, 7);

insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Olancha Peak Buckwheat', 'Princess V50', '2 x 5500cc', '2022/12/16',  'Diesel', 2, 8);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Paper Nailwort', 'Princess V50', '2 x 5500cc', '2021/11/10',  'Diesel', 2, 9);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Western Hemlock', 'Princess V50', '2 x 5500cc', '2021/11/17',  'Diesel', 2, 10);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Adobe Navarretia', 'Princess V50', '2 x 5500cc', '2021/08/31',  'Diesel', 2, 11);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Lousewort', 'Sea doo Jetski', '899cc', '2021/08/13',  'Petrol', 2, 12);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('California Fishscale Lichen', 'Sea doo Jetski', '899cc', '2021/04/17',  'Petrol', 2, 13);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Bluegrass', 'Sea doo Jetski', '899cc', '2021/06/26',  'Petrol', 2, 14);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Common Dittany', 'Sailing Dinghy', 'N/A', '2022/05/27', 'N/A', 2, 15);

insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Weeping Willow', 'Princess V50', '2 x 5500cc', '2021/12/03',  'Diesel', 3, 16);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Yellow Phacelia', 'Princess V50', '2 x 5500cc', '2021/09/19',  'Diesel', 3, 17);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Southwestern Ringstem', 'Princess V50', '2 x 5500cc', '2022/03/10',  'Diesel', 3, 18);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Lanceleaf Beardtongue', 'Princess V50', '2 x 5500cc', '2020/01/14',  'Diesel', 3, 19);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Sessileflower False Goldenaster', 'Sea doo Jetski', '899cc', '2021/03/26',  'Petrol', 3, 20);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Lindley''s Clerodendrum', 'Sailing Dinghy', 'N/A', '2021/04/25', 'N/A', 3, 11);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Laelia', 'Sailing Dinghy', 'N/A', '2022/11/15', 'N/A', 3, 7);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Florida Yellow Flax', 'Sailing Dinghy', 'N/A', '2022/02/10', 'N/A', 3, 5);

insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Jamaican Maiden Fern', 'Princess V50', '2 x 5500cc', '2023/01/09',   'Diesel', 4, 8);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Island Bushmint', 'Princess V50', '2 x 5500cc', '2022/11/25',   'Diesel', 4, 9);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('St. Marks Yelloweyed Grass', 'Sea doo Jetski', '899cc', '2020/12/15',  'Petrol', 4, 10);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('White Mountain Ragwort', 'Sea doo Jetski', '899cc', '2021/07/08',  'Petrol', 4, 15);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Jelly Lichen', 'Sea doo Jetski', '899cc', '2022/12/25',  'Petrol', 4, 16);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Pyrenopsis Lichen', 'Sailing Dinghy', 'N/A', '2021/09/25', 'N/A', 4, 17);
insert into BOAT (BOAT_NAME, BOAT_MODEL, BOAT_ENGINE, BOAT_BUILTDATE, BOAT_FUEL, BOATYARD, OWNER) values ('Thamnobryum Moss', 'Sailing Dinghy', 'N/A', '2021/04/16', 'N/A', 4, 2);


-- STAFF TABLE
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Patricia', 'Jerzyk', 'patricia.jerzyk@solentboats.net', 'pjerzyk0@exblog.jp', '81230 Melby Avenue', 'Suite 95', 'Huitán', '09015', 1);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Ara', 'Clutheram', 'ara.clutheram@solentboats.net', 'aclutheram1@imdb.com', '264 Ronald Regan Center', '16th Floor', 'Randegan', '53421', 1);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Brandy', 'Lazarus', 'brandy.lazarus@solentboats.net', 'blazarus2@odnoklassniki.ru', '83693 Kenwood Point', null, 'Portorož', '6333', 1);

insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Ivory', 'Guynemer', 'ivory.guynemer@solentboats.net', 'iguynemer3@mediafire.com', '84808 Hoepker Road', null, 'Tuam', 'H54', 2);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Harwell', 'Botha', 'harwell.botha@solentboats.net', 'hbotha4@chron.com', '536 Hudson Drive', null, 'Farkhah', '35325', 2);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Tildi', 'Heinsius', 'tildi.heinsius@solentboats.net', 'theinsius5@indiegogo.com', '2572 Havey Point', 'PO Box 46575', 'Kinmparana', '5241', 2);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Tome', 'Spencock', 'tome.spencock@solentboats.net', 'tspencock6@wunderground.com', '52 David Park', 'Room 1822', 'Tres Arroyos', '2445', 2);

insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Alissa', 'Gerran', 'alissa.gerran@solentboats.net', 'agerran7@51.la', '127 Lillian Street', 'Room 494', 'Pitanga', '85200', 3);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Amber', 'Pointing', 'amber.pointing@solentboats.net', 'apointing8@newyorker.com', '18 Gina Crossing', null, 'Zheleznodorozhnyy', '393925', 3);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Charita', 'Hurdidge', 'charita.hurdidge@solentboats.net', 'churdidge9@ebay.co.uk', '07549 Bonner Junction', null, 'Semambung', '421512', 3);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Zaccaria', 'McCole', 'zaccaria.mccole@solentboats.net', 'zmccolea@webeden.co.uk', '67487 Claremont Circle', 'Room 136', 'Machang', '21412', 3);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Agace', 'Butterly', 'agace.butterly@solentboats.net', 'abutterlyb@intel.com', '38713 Raven Trail', null, 'Los Angeles', '90065', 3);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Jimmie', 'Robins', 'jimmie.robins@solentboats.net', 'jrobinsc@cyberchimps.com', '603 Alpine Way', null, 'Maria Aurora', '3202', 3);

insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Berti', 'Borrie', 'berti.borrie@solentboats.net', 'bborried@vimeo.com', '57 Kedzie Lane', 'PO Box 67099', 'Riobamba', '5241', 4);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Ellerey', 'Cicculini', 'ellerey.cicculini@solentboats.net', 'ecicculinie@wufoo.com', '0909 Troy Place', 'Suite 85', 'Gazojak', '62411', 4);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Emylee', 'Kall', 'emylee.kall@solentboats.net', 'ekallf@youku.com', '58 Surrey Trail', 'PO Box 85393', 'Krajan', '511515', 4);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Gifford', 'Dominguez', 'gifford.dominguez@solentboats.net', 'gdominguezg@flavors.me', '751 Clyde Gallagher Alley', '1st Floor', 'Ljupina', '35400', 4);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Elnar', 'Caghy', 'elnar.caghy@solentboats.net', 'ecaghyh@webeden.co.uk', '523 Maple Wood Point', '16th Floor', 'Kunashak', '456730', 4);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Quintin', 'Postin', 'quintin.postin@solentboats.net', 'qpostini@ezinearticles.com', '3 Gateway Crossing', null, 'Tcholliré', '251141', 4);
insert into STAFF (STAFF_FNAME, STAFF_LNAME, WORK_EMAIL, HOME_EMAIL, ADDR1, ADDR2, TOWN, POSTCODE, BOATYARD) values ('Mariellen', 'Rignall', 'mariellen.rignall@solentboats.net', 'mrignallj@yale.edu', '15 Fuller Center', 'Suite 8', 'Mainang', '5141', 4);


-- ROLE TABLE
insert into ROLE (ROLE_NAME) values ('Manager');
insert into ROLE (ROLE_NAME) values ('Glass Fibre Specialist');
insert into ROLE (ROLE_NAME) values ('Engine Technician');
insert into ROLE (ROLE_NAME) values ('General');
insert into ROLE (ROLE_NAME) values ('Electrician');
insert into ROLE (ROLE_NAME) values ('Technician');

-- STAFF ROLE TABLE
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (1, 1);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (1, 2);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (2, 3);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (2, 4);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (3, 5);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (3, 6);

insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (4, 1);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (5, 2);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (6, 3);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (6, 4);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (7, 5);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (7, 6);

insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (8, 1);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (9, 2);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (10, 3);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (11, 4);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (12, 5);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (13, 6);

insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (14, 1);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (15, 2);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (16, 3);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (17, 4);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (18, 5);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (19, 6);
insert into STAFF_ROLE (STAFF_ID, ROLE_ID) values (20, 4);



-- BOOKED SERVICES TABLE
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (1, '2022/09/28');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (2, '2021/03/05');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (3, '2020/01/18');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (4, '2020/01/10');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (5, '2022/09/15');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (6, '2021/11/01');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (7, '2020/06/17');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (8, '2020/12/03');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (9, '2021/04/01');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (10, '2022/12/09');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (11, '2020/12/19');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (12, '2021/07/15');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (13, '2020/07/27');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (14, '2021/02/26');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (15, '2021/01/28');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (16, '2021/09/05');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (17, '2022/12/08');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (18, '2020/07/01');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (19, '2021/01/28');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (20, '2021/09/26');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (21, '2020/03/16');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (22, '2020/12/20');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (23, '2020/11/25');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (24, '2021/08/25');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (25, '2021/06/23');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (26, '2022/12/02');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (27, '2020/11/05');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (28, '2022/11/15');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (29, '2022/05/04');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (30, '2022/11/29');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (10, '2023/11/16');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (15, '2023/11/14');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (6, '2023/12/23');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (9, '2023/03/11');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (11, '2023/04/30');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (2, '2023/07/13');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (14, '2023/12/27');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (17, '2023/07/03');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (20, '2023/02/10');
insert into BOOKED_SERVICE (SERVICE_BOAT, SERVICE_DATE) values (25, '2023/02/15');

-- COMPLETED SERVICE TABLE
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (1, 'Engine', 'A Normal Engine Service');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (2, 'Full Service', 'A Full Service of the Boat');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (3, 'Hull Service', 'A Repair on the Hull');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (4, 'Electric Systems', 'Normal Electrical Systems Check');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (5, 'Engine', 'A Normal Engine Service');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (6, 'Full Service', 'A Full Service of the Boat');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (7, 'Oil Change', 'Change of the oil');

insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (8, 'Electric Systems', 'Normal Electrical Systems Check');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (9, 'Oil Change', 'Change of the oil');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (10, 'Engine', 'A Normal Engine Service');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (11, 'Oil Change', 'Change of the oil');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (12, 'Engine', 'A Normal Engine Service');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (13, 'Full Service', 'A Full Service of the Boat');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (14, 'Electric Systems', 'Normal Electrical Systems Check');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (15, 'Oil Change', 'Change of the oil');

insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (16, 'Engine', 'A Normal Engine Service');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (17, 'Hull Service', 'A Repair on the Hull');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (18, 'Full Service', 'A Full Service of the Boat');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (19, 'Full Service', 'A Full Service of the Boat');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (20, 'Hull Service', 'A Full Service of the Boat');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (21, 'Electric Systems', 'Normal Electrical Systems Check');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (22, 'Engine', 'A Normal Engine Service');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (23, 'Oil Change', 'Change of the oil');

insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (24, 'Full Service', 'RA Full Service of the BoatDV');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (25, 'Hull Service', 'A Repair on the Hull');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (26, 'Electric Systems', 'Normal Electrical Systems Check');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (27, 'Engine', 'A Normal Engine Service');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (28, 'Full Service', 'A Full Service of the Boat');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (29, 'Hull Service', 'A Repair on the Hull');
insert into COMPLETED_SERVICE (SERVICE_ID, SERVICE_TYPE, SERVICE_DETAILS) values (30, 'Engine', 'A Normal Engine Service');

-- SERVICE STAFF TABLE
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (1, 2);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (2, 3);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (2, 2);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (2, 1);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (3, 1);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (4, 3);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (5, 2);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (6, 3);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (6, 2);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (6, 1);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (7, 2);

insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (8, 7);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (9, 6);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (10, 6);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (11, 6);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (12, 6);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (13, 5);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (13, 6);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (13, 7);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (14, 7);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (15, 6);

insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (16, 10);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (17, 9);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (18, 9);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (18, 10);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (18, 12);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (19, 9);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (19, 10);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (19, 12);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (20, 9);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (21, 12);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (22, 10);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (23, 11);

insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (24, 15);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (24, 16);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (24, 18);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (25, 15);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (26, 18);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (27, 16);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (27, 19);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (28, 15);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (28, 16);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (28, 20);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (29, 15);
insert into SERVICE_STAFF (COMPLETED_SERVICE_ID, STAFF_ID) values (30, 16);
