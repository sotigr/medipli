CREATE TABLE USERS (
USERID				INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
MASTERKEY			VARCHAR(16) NOT NULL UNIQUE,
TITLE				CHAR(7),
FIRSTNAME 			CHAR(20),
LASTNAME			CHAR(20),
GENDER				CHAR(10),
DATEOFBIRTH			DATE,
PROFESSION			CHAR(20),
EMAIL				CHAR(40),
PASSWORD			CHAR(16), 
ADDRESS1			CHAR(40), 
PHONE				NUMERIC(10),
CELLPHONE			NUMERIC(10),
TOWN				CHAR(20),
ZIPCODE				CHAR(20),
COUNTRY				CHAR(20));

CREATE TABLE ACCOUNT_TYPES (
ACCT				INT(6) PRIMARY KEY,
DESCRIPTION			CHAR(20));

CREATE TABLE USERS_MIDDLE (
USERID 				INT(6) NOT NULL,
ACCT				INT(6),
CONSTRAINT MIDDLETABLE_FOREIGN_KEY FOREIGN KEY (USERID) REFERENCES USERS (USERID),
CONSTRAINT MIDDLETABLE2_FOREIGN_KEY FOREIGN KEY (ACCT) REFERENCES ACCOUNT_TYPES (ACCT),
CONSTRAINT MIDDLETABLE_PRIMARY_KEY PRIMARY KEY(USERID,ACCT));

CREATE TABLE MESSAGING (
MESSID 				INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
RECIPIENT			INT(6) NOT NULL,
SENDER				INT(6) NOT NULL,
DATEOFMESSAGE		DATE,
SUBJECT				VARCHAR(255),
MESSAGE				TEXT NOT NULL);

CREATE TABLE MESSAGES_MIDDLE (
USERID				INT(6),
MESSID				INT(6),
CONSTRAINT MESSAGE_FOREIGN_KEY FOREIGN KEY (USERID) REFERENCES USERS (USERID),
CONSTRAINT MESSAGE2_FOREIGN_KEY FOREIGN KEY (MESSID) REFERENCES MESSAGING (MESSID),
CONSTRAINT MESSAGE_PRIMARY_KEY PRIMARY KEY (USERID,MESSID));

CREATE TABLE HOSPITALS (
HID					INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
NAME				CHAR(50),
ADDRESS				CHAR(40),
PHONE1				NUMERIC(10),
PHONE2				NUMERIC(10),
EMAIL1				CHAR(40),
EMAIL2				CHAR(40),
FAX					NUMERIC(10),
DEPARTMENTS			CHAR(40));

CREATE TABLE HOSPITALS_MIDDLE (
ACCT				INT(6),
HID					INT(6),
CONSTRAINT HOSPITAL_FOREIGN_KEY FOREIGN KEY (ACCT) REFERENCES ACCOUNT_TYPES (ACCT),
CONSTRAINT HOSPITALS2_FOREIGN_KEY FOREIGN KEY (HID) REFERENCES HOSPITALS (HID),
CONSTRAINT HOSPITALS_PRIMARY_KEY PRIMARY KEY (ACCT,HID));

ALTER TABLE USERS
AUTO_INCREMENT=101;

ALTER TABLE HOSPITALS
AUTO_INCREMENT=2001;

ALTER TABLE MESSAGING
AUTO_INCREMENT=5001;


