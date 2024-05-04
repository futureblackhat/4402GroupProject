-- Create a new database called 'HospitalManagement'
CREATE DATABASE IF NOT EXISTS HospitalManagement;

-- Switch to the newly created database
USE HospitalManagement;

-- staff table
CREATE TABLE STAFF (
   staff_id      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name          VARCHAR(20) NOT NULL,
   department    VARCHAR(30),
   salary        INT NOT NULL,
   age           VARCHAR(5) NOT NULL,
   address       VARCHAR(50) NOT NULL,
   email         VARCHAR(30) NOT NULL
);

CREATE INDEX idx_staff_id_name_department ON STAFF(staff_id, name, department);

-- phonenumber table
CREATE TABLE PHONENUMBER (
   staff_id     INT NOT NULL,
   phone_number  VARCHAR(15) NOT NULL,
   FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id)
);

-- doctors table
CREATE TABLE DOCTOR (
   doctor_id     INT NOT NULL PRIMARY KEY,
   dname         VARCHAR(20) NOT NULL,
   specialty     VARCHAR(15) NOT NULL,
   department    VARCHAR(30) NOT NULL,
   FOREIGN KEY (doctor_id, dname, department)
   REFERENCES STAFF(staff_id, name, department)
   ON DELETE CASCADE
   ON UPDATE CASCADE,
   CONSTRAINT chk_valid_department
   CHECK (department IN ('Emergency Department (ER)', 'Internal Medicine', 'Surgery', 'Pediatrics', 'Obstetrics and Gynecology', 'Cardiology', 'Oncology', 'Radiology', 'Neurology', 'Psychiatry', 'Anesthesiology', 'Orthopedics', 'Ophthalmology', 'Dermatology', 'ENT'))
);

-- nurses table
CREATE TABLE NURSE (
   nurse_id      INT NOT NULL PRIMARY KEY,
   nname          VARCHAR(20) NOT NULL,
   department    VARCHAR(15) NOT NULL,
   FOREIGN KEY (nurse_id, nname, department)
   REFERENCES STAFF(staff_id, name, department)
   ON DELETE CASCADE
   ON UPDATE CASCADE,
   CONSTRAINT chk_valid_department
   CHECK (department IN ('Emergency Department (ER)', 'Internal Medicine', 'Surgery', 'Pediatrics', 'Obstetrics and Gynecology', 'Cardiology', 'Oncology', 'Radiology', 'Neurology', 'Psychiatry', 'Anesthesiology', 'Orthopedics', 'Ophthalmology', 'Dermatology', 'ENT'))
);

-- patient table
CREATE TABLE PATIENT (
   patient_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   pname          VARCHAR(20) NOT NULL,
   age           VARCHAR(5) NOT NULL,
   address       VARCHAR(50) NOT NULL,
   insurance     VARCHAR(5) NOT NULL,
   ssn           INT NOT NULL
);

CREATE INDEX idx_patient_id_name ON PATIENT(patient_id, pname);

-- medication table
CREATE TABLE MEDICATION (
   medicine_code INT NOT NULL PRIMARY KEY,
   name          VARCHAR(20) NOT NULL,
   brand         VARCHAR(20),
   description   VARCHAR(50) NOT NULL
);

-- procedures table
CREATE TABLE PROCEDURES (
   procedure_code  INT NOT NULL PRIMARY KEY,
   name            VARCHAR(20) NOT NULL,
   cost            INT NOT NULL
);

-- insurance table
CREATE TABLE INSURANCE (
   insurance_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   patient_id INT NOT NULL,
   iname VARCHAR(50) NOT NULL,
   policy_number VARCHAR(20) NOT NULL,
   insurance_company VARCHAR(50) NOT NULL,
   coverage_details VARCHAR(255),
   FOREIGN KEY (patient_id, iname) REFERENCES PATIENT(patient_id, pname)
);

-- treatments table
CREATE TABLE TREATMENT (
   treatment_id   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   procedure_code INT NOT NULL,
   doctor_id      INT NOT NULL,
   patient_id     INT NOT NULL,
   insurance_id   INT,
   date           DATE NOT NULL,
   FOREIGN KEY (procedure_code) REFERENCES PROCEDURES(procedure_code),
   FOREIGN KEY (doctor_id) REFERENCES DOCTOR(doctor_id),
   FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id),
   FOREIGN KEY (insurance_id) REFERENCES INSURANCE(insurance_id)
);

CREATE INDEX idx_treatment_procedure_doctor_patient ON TREATMENT(procedure_code, doctor_id, patient_id);

-- appointments table
CREATE TABLE APPOINTMENT (
   appointment_id  INT PRIMARY KEY AUTO_INCREMENT,
   patient_id      INT NOT NULL,
   doctor_id       INT NOT NULL,
   date            DATE NOT NULL,
   time            TIME NOT NULL,
   reason          VARCHAR(50) NOT NULL,
   room            INT NOT NULL,
   FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id),
   FOREIGN KEY (doctor_id) REFERENCES DOCTOR(doctor_id)
);

-- relation between treatment and nurse
CREATE TABLE TREATMENT_NURSE (
   procedure_code INT NOT NULL,
   doctor_id      INT NOT NULL,
   patient_id     INT NOT NULL,
   nurse_id       INT NOT NULL,
   date           DATE NOT NULL,
   FOREIGN KEY (procedure_code, doctor_id, patient_id) REFERENCES TREATMENT(procedure_code, doctor_id, patient_id),
   FOREIGN KEY (nurse_id) REFERENCES NURSE(nurse_id)
);

-- prescription table
CREATE TABLE PRESCRIPTION (
   medicine_code INT NOT NULL,
   doctor_id     INT NOT NULL,
   patient_id    INT NOT NULL,
   date          DATE NOT NULL,
   dosage        VARCHAR(20) NOT NULL,
   PRIMARY KEY (medicine_code, doctor_id, patient_id),
   FOREIGN KEY (medicine_code) REFERENCES MEDICATION(medicine_code),
   FOREIGN KEY (doctor_id) REFERENCES DOCTOR(doctor_id),
   FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id)
);

