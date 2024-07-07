-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: eventhive
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `eventId` int NOT NULL,
  `eventName` varchar(100) DEFAULT NULL,
  `eventOrganization` varchar(100) DEFAULT NULL,
  `eventLocation` varchar(50) DEFAULT NULL,
  `eventDistrict` varchar(50) DEFAULT NULL,
  `eventCategory` varchar(30) DEFAULT NULL,
  `eventStartTime` time DEFAULT NULL,
  `eventEndTime` time DEFAULT NULL,
  `eventStartDate` date DEFAULT NULL,
  `eventEndDate` date DEFAULT NULL,
  `eventType` varchar(10) DEFAULT NULL,
  `eventPayments` varchar(4) DEFAULT NULL,
  `vipPackagePrice` double DEFAULT NULL,
  `premiumPackagePrice` double DEFAULT NULL,
  `standardPackagePrice` double DEFAULT NULL,
  `eventRefundAvailable` varchar(5) DEFAULT NULL,
  `eventVisibility` varchar(10) DEFAULT NULL,
  `maxParticipants` int DEFAULT NULL,
  `eventDescription` varchar(1000) DEFAULT NULL,
  `eventImage` varchar(200) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`eventId`),
  KEY `fk_events_users` (`userId`),
  CONSTRAINT `fk_events_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (2,'LA MAKALO KAY','Nut and Bolt Productions','BMICH - Mihilaka Medura','Colombo','Comedy Shows','19:00:00','21:00:00','2023-11-11','2023-11-11','physical','paid',5000,3500,2000,'yes','public',1500,'Nut and Bolt Productions Proudly Presents \"LA MAKALO KAY\" on the 11th of November 2023 at BMICH - Mihilaka Medura.  This is a Solo sinhala standup comedy show of Hasalaka Thushara.','Screenshot 2023-10-28 100348.png',5),(3,'KHALIFA LIVE IN AMU MUSIC CONCERT','Ceylon Besteventz (pvt) ltd','Co-op Theater Hall Madampe','Kurunegala','Musical Event','18:30:00','23:30:00','2023-10-29','2023-10-29','physical','paid',3000,2500,1000,'yes','public',1500,'Ceylon Besteventz (pvt) ltd Proudly Present \"KHALIFA LIVE IN AMU MUSIC CONCERT\" on 29th of Octomber 2023 at the Co-op Theater Hall Madampe | Solo Musical Performance Sanjeewa Lonliyes.','Screenshot 2023-10-28 102353.png',1),(4,'WAYO AT THE LAKE 5TH EDITION','SEVEN STAR EVENTS','Cinnamon Lakeside - Tennis Court Outdoor Premises','Colombo','Musical Event','19:00:00','23:30:00','2023-11-17','2023-11-17','physical','paid',40000,30000,10000,'yes','public',500,'SEVEN STAR EVENTS Proudly Presents \"WAYO AT THE LAKE - 5TH EDITION\" on the 17th of November 2023 At Cinnamon Lakeside - Tennis Court Outdoor Premises FT : Senaka | Umaria | Bachi | Sanka | Music By Wayo| Food & Beverage Available at the premises.','Screenshot 2023-10-28 123748.png',5),(5,'DREAMZ OF SHIHAN KANDY','Hot chocolate (pvt) Ltd','Sahas Uyana - Kandy','Kandy','Musical Event','19:00:00','19:00:00','2023-11-11','2023-11-11','physical','paid',10000,7500,5000,'yes','public',1000,'In the vibrant tapestry of Sri Lanka\'s music industry, one figure stands out - Shihan Mihiranga. With an extraordinary voice, he has woven his melodies into our cultural identity. The \"Dreamz of Shihan Mihiranga\" concert celebrates his artistry, humility, and his connection to people\'s dreams. Shihan, born with a musical gift and emotive voice, rose from humble beginnings to make his mark in Sri Lankan music. His journey reflects the power of dreams and determination. Amidst fame, his humility shines, resonating with admirers who see their aspirations mirrored in him.','Screenshot 2023-10-28 125110.png',5),(7,'LEGENDS AT THE EDGE','We Do Events','Waters Edge Grand Lawn','Colombo','Musical Event','17:00:00','22:30:00','2023-11-18','2023-11-18','physical','paid',4500,4500,4500,'yes','public',1000,'�LEGENDS� AT THE EDGE, concert will feature the foremost legends of the Sri Lankan youth music, Kasun Kalhara, Indrachapa Liyanage, Nadeeka Guruge and Nadeeka Jayawardana with creative music arrangements by Naadha.','Screenshot 2023-10-28 134049.png',1),(8,'RELLA 2','C Events','Holy Cross College Auditorium Gampaha','Gampaha','Musical Event','18:30:00','23:30:00','2023-12-16','2023-12-16','physical','paid',5000,3500,2500,'yes','public',1500,'C Events Proudly Presents \"RELLA 2\" on the 16th of December 2023 At Holycross College Auditorium Gampaha FT : Jaya Sri | Nadeemal | Adithya | Centigradz | Music By The Wave.','Screenshot 2023-10-28 133213.png',1);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiries`
--

DROP TABLE IF EXISTS `inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiries` (
  `inquiryId` int NOT NULL,
  `userId` int DEFAULT NULL,
  `inquiryTitle` varchar(100) DEFAULT NULL,
  `inquiryBody` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`inquiryId`),
  KEY `fk_inquiries_users` (`userId`),
  CONSTRAINT `fk_inquiries_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiries`
--

LOCK TABLES `inquiries` WRITE;
/*!40000 ALTER TABLE `inquiries` DISABLE KEYS */;
INSERT INTO `inquiries` VALUES (1,1,'Event Details are not updated','I updated my event details. But details are not updated in the details page.'),(2,1,'Reset Password','I want to reset my password. But my password is not updated.'),(3,5,'Customer Care is not working','Your customer care number is not working.'),(4,5,'Events have deleted.','Some of my events have deleted automatically. I need to recover them immediately.'),(5,6,'Ticket count is not updating','Ticket count of my events are not updating when user booked tickets.');
/*!40000 ALTER TABLE `inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticketId` int NOT NULL,
  `userId` int DEFAULT NULL,
  `eventId` int DEFAULT NULL,
  `noOfTickets` int DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  `paymentType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ticketId`),
  KEY `fk_tickets_users` (`userId`),
  KEY `fk_tickets_events` (`eventId`),
  CONSTRAINT `fk_tickets_events` FOREIGN KEY (`eventId`) REFERENCES `events` (`eventId`) ON DELETE CASCADE,
  CONSTRAINT `fk_tickets_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,1,2,3,10500,'atevent'),(2,6,2,1,5000,'card'),(3,6,4,2,60000,'atevent'),(4,6,3,3,7500,'atevent'),(5,6,5,1,5000,'atevent'),(6,6,8,5,12500,'atevent'),(7,7,2,4,20000,'atevent');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userPassword` varchar(50) DEFAULT NULL,
  `userRole` varchar(15) DEFAULT 'user',
  PRIMARY KEY (`userId`),
  CONSTRAINT `check_userEmail` CHECK ((`userEmail` like _utf8mb4'%@%.%')),
  CONSTRAINT `check_userPassword` CHECK ((length(`userPassword`) >= 8))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Pathum','pathumnish18@gmail.com','Pathum18','user'),(3,'Kusal','kusalmendis13@gmail.com','Mendis13','admin'),(4,'Sadeera','sadeera23@gmail.com','Sadeera23','admin'),(5,'Charith','charith72@gmail.com','Charith72','sysadmin'),(6,'Dilshan','dilshanmadhushanka98@gmail.com','Dilshan98','user'),(7,'Maheesh','maheeshtheekshana61@gmail.com','Maheesh61','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-28 14:17:21
