-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: gameprogresstrackerdb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `PlayerID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(64) NOT NULL,
  `RegisterDate` date NOT NULL,
  `TotalPlaytimeHours` int DEFAULT '0',
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'John Doe','2023-02-01',9),(2,'Jane Smith','2023-03-15',11),(3,'Michael Johnson','2023-01-25',6),(4,'Emily Wilson','2023-02-10',8),(5,'Daniel Brown','2023-01-30',12),(6,'Olivia Davis','2023-02-05',10),(7,'James Miller','2023-02-20',19),(8,'Sophia Martinez','2023-02-28',10),(9,'William Anderson','2023-03-05',7),(10,'Ava Taylor','2023-02-15',3),(11,'Liam Thomas','2023-01-23',13),(12,'Isabella White','2023-03-01',2),(13,'Benjamin Clark','2023-03-10',4),(14,'Mia Rodriguez','2023-02-08',11),(15,'Henry Lewis','2023-03-18',14),(16,'Charlotte Turner','2023-02-12',6),(17,'Alexander Walker','2023-03-03',9),(18,'Amelia Hall','2023-02-25',7),(19,'Daniel Green','2023-03-08',8),(20,'Sophia Adams','2023-02-18',5),(21,'Ethan King','2023-01-27',10),(22,'Olivia Evans','2023-02-23',12),(23,'Mason Murphy','2023-03-13',6),(24,'Ava Scott','2023-02-06',9),(25,'Jacob Lee','2023-03-16',4),(28,'Ken','2023-08-19',0);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-20 14:25:36
