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
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progress` (
  `ProgressID` int NOT NULL AUTO_INCREMENT,
  `TotalPlaytimeHours` int DEFAULT '0',
  `LevelsCompleted` int NOT NULL,
  `InGameItemsCollected` int NOT NULL,
  `ExperiencePointsEarned` int DEFAULT NULL,
  `GoldEarned` int DEFAULT NULL,
  `PlayerID` int DEFAULT NULL,
  PRIMARY KEY (`ProgressID`),
  KEY `PlayerID` (`PlayerID`),
  CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (1,7,15,30,5000,10000,1),(2,6,8,20,3000,8000,2),(3,10,20,40,8000,15000,3),(4,9,12,25,4000,9000,4),(5,4,10,18,3500,7500,5),(6,14,18,35,7000,12000,6),(7,11,14,28,4500,9500,7),(8,5,7,15,2500,6000,8),(9,12,16,32,5500,11000,9),(10,13,11,22,3800,8500,10),(11,8,19,38,7500,13000,11),(12,9,13,26,4200,10000,12),(13,6,9,16,3000,7000,13),(14,11,17,34,6500,11500,14),(15,4,6,12,2000,5500,15),(16,19,21,42,8500,16000,16),(17,14,14,29,4700,10000,17),(18,3,8,17,3200,7500,18),(19,11,18,36,7000,13000,19),(20,8,12,23,4200,9500,20),(21,2,10,19,3500,8000,21),(22,11,16,33,6000,11000,22),(23,5,7,14,2500,6000,23),(24,11,20,39,8000,15000,24),(25,8,13,27,4500,9500,25);
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_playtime_after_progress_update` AFTER UPDATE ON `progress` FOR EACH ROW BEGIN
    IF NEW.TotalPlaytimeHours != OLD.TotalPlaytimeHours THEN
        UPDATE Player
        SET TotalPlaytimeHours = TotalPlaytimeHours + (NEW.TotalPlaytimeHours - OLD.TotalPlaytimeHours)
        WHERE PlayerID = NEW.PlayerID;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-20 14:25:36
