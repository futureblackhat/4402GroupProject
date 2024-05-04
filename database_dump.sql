-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitalmanagement
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `reason` varchar(50) NOT NULL,
  `room` int NOT NULL,
  `insurance` varchar(5) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,100,1,'2024-04-26','18:57:49','Treatment 1000',98,'A1234'),(2,100,1,'2024-04-26','18:57:49','Treatment 1001',72,'A1234'),(3,128,12,'2024-04-28','18:57:49','Treatment 1002',65,'C9013'),(4,128,12,'2024-04-28','18:57:49','Treatment 1003',10,'C9013'),(5,120,17,'2024-04-18','18:57:49','Treatment 1004',54,'U8901'),(6,120,17,'2024-04-22','18:57:49','Treatment 1005',39,'U8901'),(7,115,6,'2024-04-25','18:57:49','Treatment 1006',31,'P7890'),(8,102,3,'2024-04-25','18:57:49','Treatment 1007',37,'C9012'),(9,102,3,'2024-04-01','18:57:49','Treatment 1008',91,'C9012'),(10,129,13,'2024-04-25','18:57:49','Treatment 1009',46,'D3456'),(11,129,13,'2024-04-25','18:57:49','Treatment 1010',56,'D3456'),(12,118,6,'2024-04-25','18:57:49','Treatment 1011',43,'S0123'),(13,118,6,'2024-04-25','18:57:49','Treatment 1012',46,'S0123'),(14,109,18,'2024-04-25','18:57:49','Treatment 1013',100,'J8901'),(15,111,3,'2024-04-12','18:57:49','Treatment 1014',60,'L6789'),(16,122,13,'2024-04-25','18:57:49','Treatment 1015',99,'W6789'),(17,127,5,'2024-04-18','18:57:49','Treatment 1016',14,'B5678'),(18,107,18,'2024-04-25','18:57:49','Treatment 1017',74,'H0123'),(19,126,14,'2024-04-21','18:57:49','Treatment 1018',29,'A1234'),(20,112,14,'2024-04-08','18:57:49','Treatment 1019',19,'M0123'),(21,118,14,'2024-04-08','18:57:49','Treatment 1020',10,'S0123');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` int NOT NULL,
  `dname` varchar(20) NOT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  `department` varchar(30) NOT NULL,
  PRIMARY KEY (`doctor_id`),
  KEY `doctor_id` (`doctor_id`,`dname`,`department`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doctor_id`, `dname`, `department`) REFERENCES `staff` (`staff_id`, `name`, `department`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'John Smith','Emergency Department (ER)','Emergency Department (ER)'),(2,'Emily Johnson','Internal Medicine','Internal Medicine'),(3,'Michael Williams','Surgery','Surgery'),(4,'Jessica Brown','Pediatrics','Pediatrics'),(5,'Daniel Davis','Obstetrics and Gynecology','Obstetrics and Gynecology'),(6,'Sarah Taylor','Cardiology','Cardiology'),(7,'Christopher Martinez','Oncology','Oncology'),(8,'Amanda Rodriguez','Radiology','Radiology'),(9,'James Garcia','Neurology','Neurology'),(10,'Jennifer Hernandez','Psychiatry','Psychiatry'),(11,'Matthew Martinez','Anesthesiology','Anesthesiology'),(12,'Kennedy Achord','Optometry','Optometry'),(13,'Andrew Gonzalez','Ophthalmology','Ophthalmology'),(14,'Olivia Perez','Dermatology','Dermatology'),(15,'David Wilson','ENT','ENT'),(16,'Sophia Carter','Emergency Department (ER)','Emergency Department (ER)'),(17,'William Wright','Internal Medicine','Internal Medicine'),(18,'Isabella Hill','Surgery','Surgery'),(19,'Joseph Young','Pediatrics','Pediatrics'),(20,'Charlotte Scott','Obstetrics and Gynecology','Obstetrics and Gynecology');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `insurance_id` varchar(10) NOT NULL,
  `patient_id` int DEFAULT NULL,
  `iname` varchar(50) DEFAULT NULL,
  `policy_number` varchar(20) NOT NULL,
  `insurance_company` varchar(50) DEFAULT NULL,
  `coverage_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`policy_number`),
  KEY `patient_id` (`patient_id`,`iname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES ('1',100,'Blue Cross Blue Shield','A1234','Blue Cross Blue Shield','Basic Coverage'),('5',126,'Humana','A1235','Humana Inc','Mental Health Coverage'),('1',101,'Blue Cross Blue Shield','B5678','Blue Cross Blue Shield','Basic Coverage'),('5',127,'Humana','B5679','Humana Inc','Mental Health Coverage'),('1',102,'Blue Cross Blue Shield','C9012','Blue Cross Blue Shield','Basic Coverage'),('6',128,'Metlife','C9013','MetLife Inc','Comprehensive Vision Plan'),('1',103,'Blue Cross Blue Shield','D3456','Blue Cross Blue Shield','Basic Coverage'),('6',129,'Metlife','D3457','MetLife Inc','Comprehensive Vision Plan'),('1',104,'Blue Cross Blue Shield','E7890','Blue Cross Blue Shield','Basic Coverage'),('1',105,'Blue Cross Blue Shield','F2345','Blue Cross Blue Shield','Basic Coverage'),('2',106,'Aetna','G6789','Aetna Inc','High Deductible Plan'),('2',107,'Aetna','H0123','Aetna Inc','High Deductible Plan'),('2',108,'Aetna','I4567','Aetna Inc','High Deductible Plan'),('2',109,'Aetna','J8901','Aetna Inc','High Deductible Plan'),('2',110,'Aetna','K2345','Aetna Inc','High Deductible Plan'),('2',111,'Aetna','L6789','Aetna Inc','High Deductible Plan'),('3',112,'Cigna','M0123','Cigna Corporation','Comprehensive Dental Care'),('3',113,'Cigna','N4567','Cigna Corporation','Comprehensive Dental Care'),('3',114,'Cigna','O8901','Cigna Corporation','Comprehensive Dental Care'),('3',115,'Cigna','P7890','Cigna Corporation','Comprehensive Dental Care'),('3',116,'Cigna','Q2345','Cigna Corporation','Comprehensive Dental Care'),('3',117,'Cigna','R6789','Cigna Corporation','Comprehensive Dental Care'),('4',118,'United Health Care','S0123','UnitedHealth Group','Family Coverage'),('4',119,'United Health Care','T4567','UnitedHealth Group','Family Coverage'),('4',120,'United Health Care','U8901','UnitedHealth Group','Family Coverage'),('4',121,'United Health Care','V2345','UnitedHealth Group','Family Coverage'),('4',122,'United Health Care','W6789','UnitedHealth Group','Family Coverage'),('4',123,'United Health Care','X0123','UnitedHealth Group','Family Coverage'),('5',124,'Humana','Y4567','Humana Inc','Mental Health Coverage'),('5',125,'Humana','Z8901','Humana Inc','Mental Health Coverage');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `medicine_code` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `description` varchar(75) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`medicine_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1000,'Aspirin','Bayer','Reduces fever, pain, inflammation',95.95),(1001,'Ibuprofen','Advil','Relieves arthritis, fever',1071.90),(1002,'Acetaminophen','Tylenol','Treats pain, reduces fever',767.71),(1003,'Lisinopril','Prinivil','Manages high blood pressure',604.49),(1004,'Levothyroxine','Synthroid','Treats underactive thyroid gland',792.24),(1005,'Atorvastatin','Lipitor','Lowers cholesterol levels',104.78),(1006,'Metformin','Glucophage','Treats type 2 diabetes',178.16),(1007,'Amlodipine','Norvasc','Treats high blood pressure, chest pain',618.66),(1008,'Simvastatin','Zocor','Lowers cholesterol levels',328.07),(1009,'Losartan','Cozaar','Treats high blood pressure, reduces stroke risk',792.94),(1010,'Albuterol','Proventil','Treats bronchospasm',421.13),(1011,'Omeprazole','Prilosec','Treats GERD symptoms',444.10),(1012,'Metoprolol','Lopressor','Treats high blood pressure, chest pain, heart failure',835.66),(1013,'Hydrochlorothiazide','Microzide','Treats high blood pressure, fluid retention',692.30),(1014,'Prednisone','Rayos','Treats arthritis, blood disorders, allergies',366.50),(1015,'Gabapentin','Neurontin','Treats epilepsy, nerve pain, hot flashes',659.70),(1016,'Sertraline','Zoloft','Treats depression, anxiety disorders',219.46),(1017,'Amoxicillin','Moxatag','Treats bacterial infections',33.25),(1018,'Warfarin','Coumadin','Prevents blood clots',451.68),(1019,'Fluoxetine','Prozac','Treats depression, anxiety disorders',309.44);
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `nurse_id` int NOT NULL,
  `nname` varchar(20) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nurse_id`),
  CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`nurse_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (21,'Mason Nelson','Cardiology'),(22,'Harper Adams','Oncology'),(23,'Evelyn Baker','Radiology'),(24,'Jackson King','Neurology'),(25,'Liam Ward','Psychiatry'),(26,'John Doe','Emergency Department (ER)'),(27,'Jane Smith','Internal Medicine'),(28,'Michael Johnson','Surgery'),(29,'Emily Williams','Pediatrics'),(30,'Christopher Brown','Obstetrics and Gynecology'),(31,'Jessica Davis','Cardiology'),(32,'David Taylor','Oncology'),(33,'Maria Martinez','Neurology'),(34,'Daniel Rodriguez','Psychiatry'),(35,'Sarah Garcia','Anesthesiology'),(36,'Matthew Hernandez','Orthopedics'),(37,'Amanda Martinez','Ophthalmology'),(38,'Laura Lopez','Dermatology'),(39,'Robert Gonzalez','ENT'),(40,'Jennifer Perez','Radiology'),(41,'William Wilson','Emergency Department (ER)'),(42,'Mary Carter','Cardiology'),(43,'James Wright','Internal Medicine'),(44,'Karen Hill','Surgery'),(45,'Michael Young','Pediatrics'),(46,'Jennifer Scott','Obstetrics and Gynecology'),(47,'David Nelson','Oncology'),(48,'Jessica Adams','Neurology'),(49,'John Baker','Radiology'),(50,'Mary King','Orthopedics');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) NOT NULL,
  `age` varchar(5) NOT NULL,
  `address` varchar(50) NOT NULL,
  `insurance` varchar(5) NOT NULL,
  `ssn` int NOT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `idx_patient_id_name` (`patient_id`,`pname`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (100,'Emily Taylor','27','123 Elm St','A1234',123456789),(101,'Christopher Wilson','29','456 Oak St','B5678',234567890),(102,'Jessica Martinez','31','789 Maple St','C9012',345678901),(103,'Matthew Hernandez','33','101 Pine St','D3456',456789012),(104,'Sarah Gonzalez','35','246 Cedar St','E7890',567890123),(105,'David Rodriguez','37','369 Walnut St','F2345',678901234),(106,'Jennifer Lopez','39','579 Birch St','G6789',789012345),(107,'Michael King','41','135 Elm St','H0123',890123456),(108,'Laura Scott','43','258 Oak St','I4567',901234567),(109,'William Adams','45','963 Maple St','J8901',123456780),(110,'Mary Green','47','147 Pine St','K2345',234567891),(111,'Daniel Baker','49','369 Cedar St','L6789',345678912),(112,'Amanda Clark','51','579 Walnut St','M0123',456789123),(113,'Robert Lewis','53','123 Birch St','N4567',567890134),(114,'Jennifer Hall','55','246 Elm St','O8901',678901245),(115,'Jessica Turner','28','789 Pine St','P7890',987654321),(116,'Michael White','30','456 Elm St','Q2345',876543210),(117,'Ashley Harris','32','369 Cedar St','R6789',765432109),(118,'James Martin','34','123 Oak St','S0123',654321098),(119,'Elizabeth Thompson','36','963 Maple St','T4567',543210987),(120,'John Garcia','38','258 Pine St','U8901',432109876),(121,'Michelle Martinez','40','579 Elm St','V2345',321098765),(122,'Christopher Young','42','147 Cedar St','W6789',210987654),(123,'Amanda Rodriguez','44','579 Walnut St','X0123',109876543),(124,'Daniel Hernandez','46','369 Oak St','Y4567',987654321),(125,'Jessica King','48','135 Maple St','Z8901',876543210),(126,'Matthew Lee','50','579 Pine St','A1234',765432109),(127,'Sarah Adams','52','369 Elm St','B5678',654321098),(128,'David Clark','54','147 Cedar St','C9013',543210987),(129,'Jennifer Scott','56','579 Walnut St','D3456',432109876);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumber`
--

DROP TABLE IF EXISTS `phonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phonenumber` (
  `staff_id` int NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `phonenumber_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumber`
--

LOCK TABLES `phonenumber` WRITE;
/*!40000 ALTER TABLE `phonenumber` DISABLE KEYS */;
INSERT INTO `phonenumber` VALUES (1,'225-123-4567'),(2,'225-234-5678'),(3,'225-345-6789'),(4,'225-456-7890'),(5,'225-567-8901'),(6,'225-678-9012'),(7,'225-789-0123'),(8,'225-890-1234'),(9,'225-901-2345'),(10,'225-012-3456'),(11,'225-123-4567'),(12,'225-234-5678'),(13,'225-345-6789'),(14,'225-456-7890'),(15,'225-567-8901'),(16,'225-678-9012'),(17,'225-789-0123'),(18,'225-890-1234'),(19,'225-901-2345'),(20,'225-012-3456'),(21,'225-123-4567'),(22,'225-234-5678'),(23,'225-345-6789'),(24,'225-456-7890'),(25,'225-567-8901');
/*!40000 ALTER TABLE `phonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `medicine_code` int NOT NULL,
  `doctor_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `date` date NOT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`medicine_code`,`doctor_id`,`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`medicine_code`) REFERENCES `medication` (`medicine_code`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1000,1,100,'2024-04-28','Take one tablet every 4-6 hours as needed for pain'),(1001,2,101,'2024-04-28','Take one tablet every 6-8 hours with food'),(1002,3,102,'2024-04-28','Take two tablets twice daily with water'),(1002,3,106,'2024-04-21','Take 4 tablet(s) once daily'),(1003,2,123,'2024-04-20','Take 4 tablet(s) twice daily'),(1003,7,105,'2024-04-25','Take 3 tablet(s) once daily'),(1003,18,127,'2024-04-28','Take 4 tablet(s) once daily'),(1003,20,114,'2024-04-12','Take 3 tablet(s) once daily'),(1004,4,108,'2024-04-29','Take 4 tablet(s) once daily'),(1005,5,108,'2024-04-26','Take 2 tablet(s) once daily'),(1005,8,127,'2024-04-18','Take 1 tablet(s) once daily'),(1006,2,111,'2024-04-20','Take 1 tablet(s) twice daily'),(1006,8,128,'2024-04-20','Take 2 tablet(s) twice daily'),(1007,1,127,'2024-04-20','Take 3 tablet(s) twice daily'),(1007,3,111,'2024-04-18','Take 3 tablet(s) twice daily'),(1007,3,115,'2024-04-06','Take 2 tablet(s) twice daily'),(1009,1,120,'2024-04-13','Take 4 tablet(s) twice daily'),(1009,17,119,'2024-04-25','Take 1 tablet(s) once daily'),(1010,20,107,'2024-04-09','Take 4 tablet(s) twice daily'),(1011,14,116,'2024-04-23','Take 1 tablet(s) once daily'),(1011,17,108,'2024-04-01','Take 2 tablet(s) once daily'),(1012,13,111,'2024-04-28','Take 3 tablet(s) twice daily'),(1012,14,116,'2024-04-20','Take 3 tablet(s) once daily'),(1013,17,127,'2024-04-08','Take 2 tablet(s) once daily'),(1014,10,103,'2024-04-05','Take 2 tablet(s) twice daily'),(1014,12,119,'2024-04-17','Take 4 tablet(s) once daily'),(1015,18,102,'2024-04-24','Take 3 tablet(s) once daily'),(1016,10,124,'2024-04-22','Take 1 tablet(s) once daily');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedures`
--

DROP TABLE IF EXISTS `procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedures` (
  `procedure_code` int NOT NULL,
  `name` varchar(35) DEFAULT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`procedure_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures`
--

LOCK TABLES `procedures` WRITE;
/*!40000 ALTER TABLE `procedures` DISABLE KEYS */;
INSERT INTO `procedures` VALUES (500,'Appendectomy',5000),(501,'Colonoscopy',1500),(502,'Endoscopy',2000),(503,'Cataract Surgery',3000),(504,'Knee Replacement',10000),(505,'Hip Replacement',12000),(506,'Gallbladder Removal',4000),(507,'Hysterectomy',6000),(508,'Laser Eye Surgery',2500),(509,'Root Canal',800),(510,'Wisdom Teeth Removal',1500),(511,'Cardiac Catheterization',7000),(512,'Angioplasty',9000),(513,'Hernia Repair',3500),(514,'Tonsillectomy',2000),(515,'Rhinoplasty',5500),(516,'Breast Biopsy',3000),(517,'Lumbar Puncture',1200),(518,'Colon Resection',8000),(519,'Gastric Bypass',15000);
/*!40000 ALTER TABLE `procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `department` varchar(30) DEFAULT NULL,
  `salary` int NOT NULL,
  `age` varchar(5) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `idx_staff_id_name_department` (`staff_id`,`name`,`department`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'John Smith','Emergency Department (ER)',80000,'35','123 Main St','j.smith@email.com'),(2,'Emily Johnson','Internal Medicine',85000,'40','456 Elm St','e.johnson@email.com'),(3,'Michael Williams','Surgery',157500,'45','789 Oak St','m.williams@email.com'),(4,'Jessica Brown','Pediatrics',75000,'30','321 Pine St','j.brown@email.com'),(5,'Daniel Davis','Obstetrics and Gynecology',95000,'50','654 Maple St','d.davis@email.com'),(6,'Sarah Taylor','Cardiology',198500,'55','987 Cedar St','s.taylor@email.com'),(7,'Christopher Martinez','Oncology',85000,'40','741 Birch St','c.martinez@email.com'),(8,'Amanda Rodriguez','Radiology',90000,'45','852 Walnut St','a.rodriguez@email.com'),(9,'James Garcia','Neurology',160000,'35','369 Pineapple St','j.garcia@email.com'),(10,'Jennifer Hernandez','Psychiatry',95000,'50','258 Banana St','j.hernandez@email.com'),(11,'Matthew Martinez','Anesthesiology',85000,'40','147 Orange St','m.martinez@email.com'),(12,'Kennedy Achord','Optometry',112500,'26','369 Lemon St','k.achord@email.com'),(13,'Andrew Gonzalez','Ophthalmology',108750,'30','741 Grape St','a.gonzalez@email.com'),(14,'Olivia Perez','Dermatology',100000,'55','852 Mango St','o.perez@email.com'),(15,'David Wilson','ENT',148000,'35','963 Peach St','d.wilson@email.com'),(16,'Sophia Carter','Emergency Department (ER)',85000,'40','147 Plum St','s.carter@email.com'),(17,'William Wright','Internal Medicine',90000,'45','258 Apple St','w.wright@email.com'),(18,'Isabella Hill','Surgery',166250,'50','369 Pear St','i.hill@email.com'),(19,'Joseph Young','Pediatrics',80000,'35','741 Cherry St','j.young@email.com'),(20,'Charlotte Scott','Obstetrics and Gynecology',85000,'40','852 Grapefruit St','c.scott@email.com'),(21,'Mason Nelson','Cardiology',178650,'45','963 Kiwi St','m.nelson@email.com'),(22,'Harper Adams','Oncology',75000,'30','147 Watermelon St','h.adams@email.com'),(23,'Evelyn Baker','Radiology',100000,'55','258 Blueberry St','e.baker@email.com'),(24,'Jackson King','Neurology',160000,'35','369 Raspberry St','j.king@email.com'),(25,'Liam Ward','Psychiatry',85000,'40','741 Blackberry St','l.ward@email.com'),(26,'John Doe','Emergency Department (ER)',95000,'35','123 Main St','jdoe@email.com'),(27,'Jane Smith','Internal Medicine',90000,'40','456 Elm St','jsmith@email.com'),(28,'Michael Johnson','Surgery',183750,'45','789 Oak St','mjohnson@email.com'),(29,'Emily Williams','Pediatrics',85000,'30','101 Maple St','ewilliams@email.com'),(30,'Christopher Brown','Obstetrics and Gynecology',110000,'38','246 Pine St','cbrown@email.com'),(31,'Jessica Davis','Cardiology',198500,'42','369 Cedar St','jdavis@email.com'),(32,'David Taylor','Oncology',95000,'35','135 Walnut St','dtaylor@email.com'),(33,'Maria Martinez','Neurology',210000,'40','579 Birch St','mmartinez@email.com'),(34,'Daniel Rodriguez','Psychiatry',90000,'37','246 Oak St','drodriguez@email.com'),(35,'Sarah Garcia','Anesthesiology',110000,'45','789 Elm St','sgarcia@email.com'),(36,'Matthew Hernandez','Orthopedics',100000,'41','963 Maple St','mhernandez@email.com'),(37,'Amanda Martinez','Ophthalmology',137750,'32','147 Cedar St','amartinez@email.com'),(38,'Laura Lopez','Dermatology',105000,'39','258 Pine St','llopez@email.com'),(39,'Robert Gonzalez','ENT',166500,'36','369 Walnut St','rgonzalez@email.com'),(40,'Jennifer Perez','Radiology',100000,'43','579 Birch St','jperez@email.com'),(41,'William Wilson','Emergency Department (ER)',95000,'35','123 Main St','wwilson@email.com'),(42,'Mary Carter','Cardiology',178650,'40','456 Elm St','mcarter@email.com'),(43,'James Wright','Internal Medicine',105000,'45','789 Oak St','jwright@email.com'),(44,'Karen Hill','Surgery',148750,'30','101 Maple St','khill@email.com'),(45,'Michael Young','Pediatrics',110000,'38','246 Pine St','myoung@email.com'),(46,'Jennifer Scott','Obstetrics and Gynecology',100000,'42','369 Cedar St','jscott@email.com'),(47,'David Nelson','Oncology',95000,'35','135 Walnut St','dnelson@email.com'),(48,'Jessica Adams','Neurology',210000,'40','579 Birch St','jadams@email.com'),(49,'John Baker','Radiology',90000,'37','246 Oak St','jbaker@email.com'),(50,'Mary King','Orthopedics',110000,'45','789 Elm St','mking@email.com');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `treatment_id` int NOT NULL AUTO_INCREMENT,
  `procedure_code` int NOT NULL,
  `doctor_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `policy_number` varchar(20) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`treatment_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  KEY `idx_treatment_procedure_doctor_patient` (`procedure_code`,`doctor_id`,`patient_id`),
  KEY `treatment_ibfk_4` (`policy_number`),
  CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`procedure_code`) REFERENCES `procedures` (`procedure_code`),
  CONSTRAINT `treatment_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `treatment_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `treatment_ibfk_4` FOREIGN KEY (`policy_number`) REFERENCES `insurance` (`policy_number`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (1000,500,1,100,'A1234','2024-04-26'),(1001,506,1,100,'A1234','2024-04-26'),(1002,508,12,128,'C9013','2024-04-28'),(1003,503,12,128,'C9013','2024-04-28'),(1004,501,17,120,'U8901','2024-04-18'),(1005,518,17,120,'U8901','2024-04-22'),(1006,511,6,115,'P7890','2024-04-25'),(1007,504,3,102,'C9012','2024-04-25'),(1008,513,3,102,'C9012','2024-04-01'),(1009,510,13,129,'D3456','2024-04-25'),(1010,509,13,129,'D3456','2024-04-25'),(1011,512,6,118,'S0123','2024-04-25'),(1012,511,6,118,'S0123','2024-04-25'),(1013,519,18,109,'J8901','2024-04-25'),(1014,517,3,111,'L6789','2024-04-12'),(1015,515,13,122,'W6789','2024-04-25'),(1016,507,5,127,'B5678','2024-04-18'),(1017,514,18,107,'H0123','2024-04-25'),(1018,516,14,126,'A1234','2024-04-21'),(1019,505,14,112,'M0123','2024-04-08'),(1020,504,14,118,'S0123','2024-04-08');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_nurse`
--

DROP TABLE IF EXISTS `treatment_nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_nurse` (
  `procedure_code` int NOT NULL,
  `doctor_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `nurse_id` int NOT NULL,
  `date` date NOT NULL,
  KEY `procedure_code` (`procedure_code`,`doctor_id`,`patient_id`),
  KEY `nurse_id` (`nurse_id`),
  CONSTRAINT `treatment_nurse_ibfk_1` FOREIGN KEY (`procedure_code`, `doctor_id`, `patient_id`) REFERENCES `treatment` (`procedure_code`, `doctor_id`, `patient_id`),
  CONSTRAINT `treatment_nurse_ibfk_2` FOREIGN KEY (`nurse_id`) REFERENCES `nurse` (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_nurse`
--

LOCK TABLES `treatment_nurse` WRITE;
/*!40000 ALTER TABLE `treatment_nurse` DISABLE KEYS */;
INSERT INTO `treatment_nurse` VALUES (504,3,102,40,'2024-04-25'),(510,13,129,25,'2024-04-25'),(504,3,102,40,'2024-04-25'),(511,6,115,21,'2024-04-25'),(504,3,102,40,'2024-04-25'),(518,17,120,34,'2024-04-22'),(509,13,129,39,'2024-04-25'),(515,13,122,26,'2024-04-25'),(513,3,102,44,'2024-04-01'),(511,6,115,47,'2024-04-25'),(516,14,126,43,'2024-04-21'),(506,1,100,44,'2024-04-26'),(506,1,100,29,'2024-04-26'),(503,12,128,23,'2024-04-28'),(515,13,122,21,'2024-04-25'),(517,3,111,27,'2024-04-12'),(513,3,102,22,'2024-04-01'),(508,12,128,28,'2024-04-28'),(513,3,102,37,'2024-04-01'),(509,13,129,26,'2024-04-25'),(508,12,128,26,'2024-04-28'),(519,18,109,50,'2024-04-25'),(504,3,102,40,'2024-04-25'),(511,6,115,36,'2024-04-25'),(511,6,115,30,'2024-04-25');
/*!40000 ALTER TABLE `treatment_nurse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 16:39:18
