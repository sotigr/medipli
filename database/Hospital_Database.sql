CREATE TABLE HOSPITALS (
NAME		CHAR PRIMARY KEY,
ADDRESS		CHAR,
PHONE		INT,
TOWN		CHAR,
COUNTRY		CHAR);

CREATE TABLE PERSONEL(
ID          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NAME		CHAR,
LASTNAME	CHAR,
ADDRESS		CHAR,
SPECIALITY 	CHAR,
PHONE		INT,
EMAIL		CHAR);

CREATE TABLE PERSONEL_TYPE (
TYPES		CHAR PRIMARY KEY,
DESCRIPTION	CHAR);

CREATE TABLE MIDDLEPERSONEL(
NAME		CHAR,
ID 			INT ,
CONSTRAINT MIDDLETABLE_FOREIGN_KEY FOREIGN KEY (NAME) REFERENCES HOSPITALS (NAME),
CONSTRAINT MIDDLETABL_FOREIGN_KEY FOREIGN KEY (ID) REFERENCES PERSONEL (ID),
CONSTRAINT MIDDLETABLE_PRIMARY_KEY PRIMARY KEY (NAME,ID));

CREATE TABLE MIDDLEPERSONEL2(
ID		INT,
TYPES	CHAR,
CONSTRAINT PERSONELMIDDLE_FOREIGN_KEY FOREIGN KEY (ID) REFERENCES PERSONEL (ID),
CONSTRAINT PERSONEMIDDLE_FOREIGN_KEY FOREIGN KEY (TYPES) REFERENCES PERSONEL_TYPE (TYPES),
CONSTRAINT PERSONELMIDDLE_PRIMARY_KEY PRIMARY KEY (ID,TYPES));

CREATE TABLE PATIENT(
PID		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NAME	CHAR,
LASTNAME CHAR,
PHONE	INT,
ADDRESS	CHAR,
TOWN	CHAR,
COUNTRY	CHAR,
EMAIL	CHAR);

CREATE TABLE EXAMINIATIONTS(
EID		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
DESCRIPTIONN	CHAR);

CREATE TABLE PATIENTMIDDLE(
PID		INT,
EID		INT,
CONSTRAINT PATTIENTMIDDLE_FOREIGN_KEY FOREIGN KEY (PID) REFERENCES PATIENT (PID),
CONSTRAINT PATTIENTMIDDL_FOREIGN_KEY FOREIGN KEY (EID) REFERENCES EXAMINIATIONTS (EID),
CONSTRAINT PATTIENTMIDDLE_PRIMARY_KEY PRIMARY KEY (PID,EID));

CREATE TABLE PERSONELPATIENTMIDDLE(
ID		INT,
PID		INT,
CONSTRAINT PERSONELPATIENTMIDDLE_FOREIGN_KEY FOREIGN KEY (ID) REFERENCES PERSONEL(ID),
CONSTRAINT PERSONELPATIENTMIDDL_FOREIGN_KEY FOREIGN KEY (PID) REFERENCES PATIENT(PID),
CONSTRAINT PERSONELPATIENTMIDDLE_PRIMARY_KEY PRIMARY KEY (ID,PID));

ALTER TABLE PERSONEL
AUTO_INCREMENT=1;

ALTER TABLE PATIENT
AUTO_INCREMENT=1000;

ALTER TABLE EXAMINIATIONTS
AUTO_INCREMENT=10000;








