-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: localhost    Database: AirportManagement
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `Airlines`
--

DROP TABLE IF EXISTS `Airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airlines` (
  `AirlineCode` varchar(10) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `ContactInfo` varchar(100) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AirlineCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airlines`
--

LOCK TABLES `Airlines` WRITE;
/*!40000 ALTER TABLE `Airlines` DISABLE KEYS */;
INSERT INTO `Airlines` VALUES ('BAS5','British Airways','contact@britishairways.com','UK'),('CAF9','Air Canada','help@aircanada.ca','Canada'),('EMR2','Emirates','info@emirates.com','UAE'),('IND7','IndiGo','service@goindigo.in','India'),('PAK1','Pakistan International Airlines','contact@pia.com','Pakistan'),('QTR3','Qatar Airways','support@qatarairways.com','Qatar'),('SIA8','Singapore Airlines','support@singaporeair.com','Singapore'),('THA0','Thai Airways','contact@thaiairways.com','Thailand'),('TKY4','Turkish Airlines','help@turkishairlines.com','Turkey'),('USA6','United Airlines','info@united.com','USA');
/*!40000 ALTER TABLE `Airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flights`
--

DROP TABLE IF EXISTS `Flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flights` (
  `FlightNumber` varchar(20) NOT NULL,
  `DepartureAirport` varchar(100) DEFAULT NULL,
  `ArrivalAirport` varchar(100) DEFAULT NULL,
  `DepartureTime` varchar(50) DEFAULT NULL,
  `ArrivalTime` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `AirlineCode` varchar(10) DEFAULT NULL,
  `SeatCount` int DEFAULT NULL,
  PRIMARY KEY (`FlightNumber`),
  KEY `AirlineCode` (`AirlineCode`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`AirlineCode`) REFERENCES `Airlines` (`AirlineCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flights`
--

LOCK TABLES `Flights` WRITE;
/*!40000 ALTER TABLE `Flights` DISABLE KEYS */;
INSERT INTO `Flights` VALUES ('FL101','LHE','DXB','2025-07-01 08:00:00','2025-07-01 12:00:00','On Time','PAK1',180),('FL102','DXB','ISB','2025-07-01 15:00:00','2025-07-01 19:00:00','On Time','EMR2',200),('FL103','ISB','DOH','2025-07-02 06:00:00','2025-07-02 09:00:00','Delayed','QTR3',150),('FL104','KHI','IST','2025-07-02 10:00:00','2025-07-02 14:30:00','Cancelled','TKY4',175),('FL105','LHE','LHR','2025-07-03 12:00:00','2025-07-03 18:00:00','On Time','BAS5',160),('FL106','LHR','JFK','2025-07-03 20:00:00','2025-07-04 04:00:00','On Time','USA6',220),('FL107','DEL','LHE','2025-07-04 07:00:00','2025-07-04 08:30:00','On Time','IND7',140),('FL108','SIN','LHE','2025-07-05 09:00:00','2025-07-05 13:30:00','Delayed','SIA8',180),('FL109','YVR','KHI','2025-07-05 22:00:00','2025-07-06 05:00:00','On Time','CAF9',160);
/*!40000 ALTER TABLE `Flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightStaff`
--

DROP TABLE IF EXISTS `FlightStaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FlightStaff` (
  `FlightNumber` varchar(20) NOT NULL,
  `EmployeeID` varchar(20) NOT NULL,
  PRIMARY KEY (`FlightNumber`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `flightstaff_ibfk_1` FOREIGN KEY (`FlightNumber`) REFERENCES `Flights` (`FlightNumber`),
  CONSTRAINT `flightstaff_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Staff` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightStaff`
--

LOCK TABLES `FlightStaff` WRITE;
/*!40000 ALTER TABLE `FlightStaff` DISABLE KEYS */;
INSERT INTO `FlightStaff` VALUES ('FL101','S001'),('FL102','S002'),('FL103','S003'),('FL104','S004'),('FL105','S005'),('FL106','S006'),('FL107','S007'),('FL108','S008'),('FL109','S009');
/*!40000 ALTER TABLE `FlightStaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passengers`
--

DROP TABLE IF EXISTS `Passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passengers` (
  `PassportNumber` varchar(20) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PassportNumber`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passengers`
--

LOCK TABLES `Passengers` WRITE;
/*!40000 ALTER TABLE `Passengers` DISABLE KEYS */;
INSERT INTO `Passengers` VALUES ('P1001','Ali Raza','ali.raza@mail.com','03001234567','Lahore'),('P1002','Sara Khan','sara.khan@mail.com','03123456789','Karachi'),('P1003','Ahmed Noor','ahmed.noor@mail.com','03219876543','Islamabad'),('P1004','Maira Ali','maira.ali@mail.com','03019873212','Lahore'),('P1005','Bilal Asif','bilal.asif@mail.com','03331234456','Multan'),('P1006','Zoya Hassan','zoya.hassan@mail.com','03006789012','Rawalpindi'),('P1007','Hamza Tariq','hamza.tariq@mail.com','03459872100','Faisalabad'),('P1008','Laiba Ahmed','laiba.ahmed@mail.com','03015678901','Quetta'),('P1009','Usman Saeed','usman.saeed@mail.com','03111222333','Sialkot'),('P1010','Fatima Rizwan','fatima.rizwan@mail.com','03224567788','Peshawar');
/*!40000 ALTER TABLE `Passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `EmployeeID` varchar(20) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `ContactInfo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES ('S001','Captain Imran','Pilot','imran@pia.com'),('S002','Zainab Ali','Flight Attendant','zainab@emirates.com'),('S003','Nashit Khan','Co-Pilot','nashit@qatarairways.com'),('S004','Areeba Shah','Cabin Crew','areeba@turkishairlines.com'),('S005','Tariq Mehmood','Ground Staff','tariq@britishairways.com'),('S006','Samina Bibi','Flight Attendant','samina@united.com'),('S007','Adeel Farooq','Security Officer','adeel@goindigo.in'),('S008','Farah Yousaf','Air Hostess','farah@singaporeair.com'),('S009','Jawad Raza','Pilot','jawad@aircanada.ca'),('S010','Hina Saeed','Flight Attendant','hina@thaiairways.com');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `TicketID` varchar(20) NOT NULL,
  `PassportNumber` varchar(20) DEFAULT NULL,
  `FlightNumber` varchar(20) DEFAULT NULL,
  `SeatNumber` varchar(10) DEFAULT NULL,
  `BookingDate` varchar(50) DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `PassportNumber` (`PassportNumber`),
  KEY `FlightNumber` (`FlightNumber`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`PassportNumber`) REFERENCES `Passengers` (`PassportNumber`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`FlightNumber`) REFERENCES `Flights` (`FlightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
INSERT INTO `Tickets` VALUES ('T101','P1001','FL101','10A','2025-06-10','Paid'),('T102','P1002','FL102','14B','2025-06-11','Pending'),('T103','P1003','FL103','5C','2025-06-12','Paid'),('T104','P1004','FL104','20D','2025-06-13','Paid'),('T105','P1005','FL105','22E','2025-06-14','Paid'),('T106','P1006','FL106','18F','2025-06-15','Pending'),('T107','P1007','FL107','7A','2025-06-16','Paid'),('T108','P1008','FL108','9B','2025-06-17','Pending'),('T109','P1009','FL109','2C','2025-06-18','Paid');
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-02 21:16:36
