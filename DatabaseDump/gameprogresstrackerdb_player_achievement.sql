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
-- Table structure for table `player_achievement`
--

DROP TABLE IF EXISTS `player_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_achievement` (
  `PlayerID` int NOT NULL,
  `AchievementID` int NOT NULL,
  `AchievementDate` date DEFAULT (curdate()),
  PRIMARY KEY (`PlayerID`,`AchievementID`),
  KEY `AchievementID` (`AchievementID`),
  CONSTRAINT `player_achievement_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `player_achievement_ibfk_2` FOREIGN KEY (`AchievementID`) REFERENCES `achievement` (`AchievementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_achievement`
--

LOCK TABLES `player_achievement` WRITE;
/*!40000 ALTER TABLE `player_achievement` DISABLE KEYS */;
INSERT INTO `player_achievement` VALUES (1,1,'2023-02-10'),(1,3,'2023-02-18'),(1,13,'2023-04-12'),(2,2,'2023-03-28'),(2,4,'2023-04-02'),(2,17,'2023-04-15'),(3,5,'2023-02-25'),(3,7,'2023-03-05'),(4,6,'2023-03-08'),(4,9,'2023-03-20'),(5,8,'2023-02-15'),(5,10,'2023-02-28'),(6,11,'2023-03-12'),(6,13,'2023-03-18'),(7,12,'2023-02-22'),(7,14,'2023-03-02'),(8,15,'2023-03-14'),(8,16,'2023-03-25'),(9,17,'2023-03-05'),(9,19,'2023-03-12'),(10,18,'2023-02-28'),(10,20,'2023-03-08'),(11,21,'2023-03-18'),(11,23,'2023-03-24'),(12,22,'2023-03-02'),(12,24,'2023-03-10'),(13,2,'2023-03-25'),(13,25,'2023-03-18'),(14,3,'2023-03-28'),(14,5,'2023-04-02'),(15,4,'2023-03-05'),(15,6,'2023-03-12'),(16,7,'2023-03-18'),(16,9,'2023-03-26'),(17,8,'2023-03-10'),(17,10,'2023-03-20'),(18,11,'2023-03-24'),(18,13,'2023-04-01'),(19,12,'2023-03-12'),(19,14,'2023-03-22'),(20,15,'2023-03-26'),(20,16,'2023-04-02'),(21,17,'2023-03-14'),(21,19,'2023-03-24'),(22,18,'2023-03-10'),(22,20,'2023-03-20'),(23,21,'2023-03-28'),(23,23,'2023-04-05'),(24,22,'2023-03-12'),(24,24,'2023-03-22'),(25,2,'2023-04-05'),(25,25,'2023-03-26');
/*!40000 ALTER TABLE `player_achievement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-20 14:25:37
