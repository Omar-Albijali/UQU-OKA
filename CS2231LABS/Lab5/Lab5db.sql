CREATE DATABASE  IF NOT EXISTS `lab5` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lab5`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: lab5
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisor` (
  `S_ID` varchar(5) NOT NULL,
  `I_ID` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`S_ID`),
  KEY `I_ID` (`I_ID`),
  CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`S_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`I_ID`) REFERENCES `instructor` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom` (
  `Building` varchar(15) NOT NULL,
  `Room_number` varchar(7) NOT NULL,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`Building`,`Room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES ('Computing','1',97),('Computing','10',50),('Computing','101',40),('Computing','102',40),('Computing','103',40),('Computing','104',50),('Computing','105',37),('Computing','106',40),('Computing','107',50),('Computing','108',40),('Computing','109',33),('Computing','11',97),('Computing','110',40),('Computing','111',40),('Computing','2',27),('Computing','3',24),('Computing','4',30),('Computing','5',50),('Computing','6',50),('Computing','7',50),('Computing','8',53),('Computing','9',50),('Computing','Lab1',24),('Computing','Lab10',25),('Computing','Lab101',25),('Computing','Lab102',21),('Computing','Lab103',20),('Computing','Lab104',21),('Computing','Lab11',25),('Computing','Lab12',13),('Computing','Lab13',21),('Computing','Lab14',31),('Computing','Lab15',24),('Computing','Lab16',24),('Computing','Lab2',21),('Computing','Lab204',12),('Computing','lab3',21),('Computing','Lab4',21),('Computing','Lab5',21),('Computing','Lab6',20),('Computing','Lab7',25),('Computing','Lab9',37);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `Course_id` varchar(8) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Dept_name` varchar(20) DEFAULT NULL,
  `Credits` int DEFAULT NULL,
  PRIMARY KEY (`Course_id`),
  KEY `Dept_name` (`Dept_name`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Dept_name`) REFERENCES `department` (`Dept_name`) ON DELETE SET NULL,
  CONSTRAINT `course_chk_1` CHECK ((`Credits` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('ARS1500','Arabic Writing',NULL,2),('BA1901','Career Preparation Skills',NULL,2),('CEN2003','Computer Networking','Computer Engineering',4),('CEN2202','Hardware Software Interface','Computer Engineering',4),('CS1101','Discrete Structure 1','Computer Science',4),('CS1211','Computer Programming 1','Computer Science',3),('CS1312','Computer Programming 2','Computer Science',3),('CS2214','Data Structure','Computer Science',3),('CS2231','Database Dundamentals','Computer Science',3),('CS2315','Algorithm Fundamentals','Computer Science',3),('CS2342','Operating Systems Fundamentals','Computer Science',4),('DS1302','Topics in Computing','Data Science',3),('DS2101','Introduction to Data Science','Data Science',3),('DS2111','Applied Statistics for Data Science','Data Science',3),('DS2212','Data Collection and Wrangling','Data Science',3),('DS2301','Research Methods in Data Science','Data Science',3),('DS2302','Advanced Database Systems','Data Science',3),('DS2313','Data Analysis 1','Data Science',3),('ELCE1201','English Language 1',NULL,4),('ELCE1202','English Language 2',NULL,4),('ELCE1203','English Language 3',NULL,4),('ICC1201','Islamic Cluture',NULL,2),('ICC2202','Islamic Culture 2',NULL,2),('MTH1105','Introduction to Calculus',NULL,4),('MTH1211','Linear Algebra',NULL,4),('MTH1501','Elementary of Statistics and Probability',NULL,4),('MTH2102','Calculus 2',NULL,4),('PHY1110','General Physics 1',NULL,4),('QR1101','Holy Quran 1',NULL,2),('QR2102','Holy Quran 2',NULL,2),('QR3103','Holy Quran 3',NULL,2),('QR4104','Holy Quran 4',NULL,2),('SE1101','Computational Thinking & Problem Solving','Software Engineering',3),('SE2102','Foundation of Software Engineering','Software Engineering',3),('SE2103','Software Engineering Ethics','Software Engineering',2),('SE2204','Requirements Engieering 1','Software Engineering',4),('SE2205','Distributed Programming Paradigms','Software Engineering',4),('SE2306','Software Design & Construction 1','Software Engineering',5),('SE2307','Requirments Engineering 2','Software Engineering',3),('SE2308','Web Engineering','Software Engineering',3),('SE2309','Project Management','Software Engineering',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dept_name` varchar(20) NOT NULL,
  `Building` varchar(15) DEFAULT NULL,
  `Budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Dept_name`),
  CONSTRAINT `department_chk_1` CHECK ((`Budget` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Computer Engineering','Computing',35000.00),('Computer Science','Computing',70000.00),('Cybersecurity','Computing',35000.00),('Data Science','Computing',35000.00),('Software Engineering','Computing',70000.00);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `ID` varchar(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Dept_name` varchar(20) DEFAULT NULL,
  `Salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Dept_name` (`Dept_name`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`Dept_name`) REFERENCES `department` (`Dept_name`) ON DELETE SET NULL,
  CONSTRAINT `instructor_chk_1` CHECK ((`Salary` > 29000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prereq` (
  `Course_id` varchar(8) NOT NULL,
  `Prereq_id` varchar(8) NOT NULL,
  PRIMARY KEY (`Course_id`,`Prereq_id`),
  KEY `Prereq_id` (`Prereq_id`),
  CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `course` (`Course_id`) ON DELETE CASCADE,
  CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`Prereq_id`) REFERENCES `course` (`Course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
INSERT INTO `prereq` VALUES ('CS1312','CS1211'),('CS2231','CS1312'),('SE2102','CS1312'),('DS2302','CS2231'),('CEN2003','CS2342'),('DS2301','DS2101'),('DS2212','DS2111'),('DS2313','DS2212'),('ELCE1202','ELCE1201'),('ELCE1203','ELCE1202'),('ICC2202','ICC1201'),('MTH1211','MTH1105'),('MTH2102','MTH1105'),('DS2111','MTH1501'),('QR2102','QR1101'),('CS1211','SE1101');
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `Course_id` varchar(8) NOT NULL,
  `Sec_id` varchar(8) NOT NULL,
  `Semester` varchar(6) NOT NULL,
  `Year` int NOT NULL,
  `Building` varchar(15) DEFAULT NULL,
  `Room_number` varchar(7) DEFAULT NULL,
  `Time_slot_id` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`Course_id`,`Sec_id`,`Semester`,`Year`),
  KEY `Building` (`Building`,`Room_number`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `course` (`Course_id`) ON DELETE CASCADE,
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`Building`, `Room_number`) REFERENCES `classroom` (`Building`, `Room_number`) ON DELETE SET NULL,
  CONSTRAINT `section_chk_1` CHECK ((`Semester` in (_utf8mb4'Fall',_utf8mb4'Winter',_utf8mb4'Spring',_utf8mb4'Summer')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ID` varchar(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Dept_name` varchar(20) DEFAULT NULL,
  `Tot_cred` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Dept_name` (`Dept_name`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Dept_name`) REFERENCES `department` (`Dept_name`) ON DELETE SET NULL,
  CONSTRAINT `student_chk_1` CHECK ((`Tot_cred` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takes` (
  `ID` varchar(5) NOT NULL,
  `Course_id` varchar(8) NOT NULL,
  `Sec_id` varchar(8) NOT NULL,
  `Semester` varchar(6) NOT NULL,
  `Year` int NOT NULL,
  `Grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`,`Course_id`,`Sec_id`,`Semester`,`Year`),
  KEY `Course_id` (`Course_id`,`Sec_id`,`Semester`,`Year`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`Course_id`, `Sec_id`, `Semester`, `Year`) REFERENCES `section` (`Course_id`, `Sec_id`, `Semester`, `Year`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaches` (
  `ID` varchar(5) NOT NULL,
  `Course_id` varchar(8) NOT NULL,
  `Sec_id` varchar(8) NOT NULL,
  `Semester` varchar(6) NOT NULL,
  `Year` int NOT NULL,
  PRIMARY KEY (`ID`,`Course_id`,`Sec_id`,`Semester`,`Year`),
  KEY `Course_id` (`Course_id`,`Sec_id`,`Semester`,`Year`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`Course_id`, `Sec_id`, `Semester`, `Year`) REFERENCES `section` (`Course_id`, `Sec_id`, `Semester`, `Year`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slot` (
  `Time_slot_id` varchar(4) NOT NULL,
  `Day` varchar(1) NOT NULL,
  `Start_hr` int NOT NULL,
  `Start_min` int NOT NULL,
  `End_hr` int DEFAULT NULL,
  `End_min` int DEFAULT NULL,
  PRIMARY KEY (`Time_slot_id`,`Day`,`Start_hr`,`Start_min`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES ('M1','M',8,0,8,50),('M1','R',8,0,8,50),('M1','S',8,0,8,50),('M1','T',8,0,8,50),('M1','W',8,0,8,50),('M10','M',19,0,19,50),('M10','R',19,0,19,50),('M10','S',19,0,19,50),('M10','T',19,0,19,50),('M10','W',19,0,19,50),('M2','M',9,0,9,50),('M2','R',9,0,9,50),('M2','S',9,0,9,50),('M2','T',9,0,9,50),('M2','W',9,0,9,50),('M3','M',10,0,10,50),('M3','R',10,0,10,50),('M3','S',10,0,10,50),('M3','T',10,0,10,50),('M3','W',10,0,10,50),('M4','M',11,0,11,50),('M4','R',11,0,11,50),('M4','S',11,0,11,50),('M4','T',11,0,11,50),('M4','W',11,0,11,50),('M5','M',13,0,13,50),('M5','R',13,0,13,50),('M5','S',13,0,13,50),('M5','T',13,0,13,50),('M5','W',13,0,13,50),('M6','M',14,0,14,50),('M6','R',14,0,14,50),('M6','S',14,0,14,50),('M6','T',14,0,14,50),('M6','W',14,0,14,50),('M7','M',16,0,16,50),('M7','R',16,0,16,50),('M7','S',16,0,16,50),('M7','T',16,0,16,50),('M7','W',16,0,16,50),('M8','M',17,0,17,50),('M8','R',17,0,17,50),('M8','S',17,0,17,50),('M8','T',17,0,17,50),('M8','W',17,0,17,50),('M9','M',18,0,18,50),('M9','R',18,0,18,50),('M9','S',18,0,18,50),('M9','T',18,0,18,50),('M9','W',18,0,18,50);
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-10 23:27:20
