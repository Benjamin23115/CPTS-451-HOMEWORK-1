CREATE DATABASE IF NOT EXISTS CptS451_VetClinic_bfdm;

USE CptS451_VetClinic_bfdm;

CREATE TABLE IF NOT EXISTS Owner (
    OwnerID VARCHAR(255) PRIMARY KEY,
    OwnerFirstName VARCHAR(20),
    OwnerLastName VARCHAR(20),
    OwnerAddress VARCHAR(40),
    OwnerCity VARCHAR(176),
    OwnerState VARCHAR(2),
    OwnerZipCode VARCHAR(10),
    OwnerPhone VARCHAR(17)
);

CREATE TABLE IF NOT EXISTS Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
        FOREIGN KEY (PatientOwnerID)
        REFERENCES Owner (OwnerID),
    PatientOwnerID VARCHAR(255),
    PatientName VARCHAR(20),
    PatientSpecies VARCHAR(15),
    PatientGender VARCHAR(1),
    PatientBirthDate VARCHAR(10),
    PatientNotes VARCHAR(255)
);

INSERT ignore INTO Owner (OwnerID, OwnerFirstName, OwnerLastName, OwnerAddress, OwnerCity, OwnerState, OwnerZipCode, OwnerPhone)
values ("K-344a", "Georgette", "Smith", "157 Pine Tree Lane", "Beacon Hill", "TX", 78212, "555-568-7752");
INSERT ignore INTO Owner (OwnerID, OwnerFirstName, OwnerLastName, OwnerAddress, OwnerCity, OwnerState, OwnerZipCode, OwnerPhone)
values ("E-052x", "Jackson", "Guiles", "33 MacLaine Lane", "Dignowity Hill", "TX", 78202, "555-824-3351");
INSERT ignore INTO Owner (OwnerID, OwnerFirstName, OwnerLastName, OwnerAddress, OwnerCity, OwnerState, OwnerZipCode, OwnerPhone)
values ("F-011h", "Allison", "Jones", "99 Main Street", "Monte Vista", "TX", 78212, "555-336-8843");
INSERT ignore INTO Owner (OwnerID, OwnerFirstName, OwnerLastName, OwnerAddress, OwnerCity, OwnerState, OwnerZipCode, OwnerPhone)
values ("K-344a", "Georgette", "Smith", "157 Pine Tree Lane", "Beacon Hill", "TX", 78212, "555-568-7752");

insert ignore into Patient (PatientID, PatientOwnerID, PatientName, PatientSpecies, PatientGender, PatientBirthDate, PatientNotes)
values (0113, "K-344a", "Jacqueline of the Marsh", "Canine", "F", "2016-12-02", "Golden Labrador");

insert ignore into Patient (PatientID, PatientOwnerID, PatientName, PatientSpecies, PatientGender, PatientBirthDate, PatientNotes)
values (2857, "E-052x", "Slick", "Equine", "M", "2019-08-29", "Hanoverian, Black");

insert ignore into Patient (PatientID, PatientOwnerID, PatientName, PatientSpecies, PatientGender, PatientBirthDate, PatientNotes)
values (1512, "F-011h", "Fluffy", "Reptilia", "F", "2020-01-27", "Banded Gila Monster");

insert ignore into Patient (PatientID, PatientOwnerID, PatientName, PatientSpecies, PatientGender, PatientBirthDate, PatientNotes)
values (6548, "K-344a", "Mr. Spiffy Pants", "Feline", "M", "2017-05-22", "Black & White, short hair, Manx");