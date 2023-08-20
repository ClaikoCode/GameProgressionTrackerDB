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
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement` (
  `AchievementID` int NOT NULL AUTO_INCREMENT,
  `Name` tinytext NOT NULL,
  `Description` tinytext,
  PRIMARY KEY (`AchievementID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
INSERT INTO `achievement` VALUES (1,'First Blood','Defeat your first enemy'),(2,'Treasure Hunter','Find and collect 10 hidden treasures'),(3,'Master of the Sword','Defeat 100 enemies with a sword'),(4,'Legendary Explorer','Visit every location in the game'),(5,'Champion of the Arena','Become the champion of the arena tournament'),(6,'Friend of the Forest','Earn the trust of the woodland creatures'),(7,'Potion Master','Brew and consume 50 different potions'),(8,'Master Alchemist','Successfully craft 100 different alchemical recipes'),(9,'Guardian of Justice','Complete 50 quests that promote justice'),(10,'Legendary Crafter','Craft a legendary item'),(11,'Wealthy Adventurer','Accumulate a fortune of 1,000,000 gold'),(12,'Bane of Monsters','Defeat 500 monsters of various types'),(13,'Savior of the Kingdom','Complete the main storyline and save the kingdom'),(14,'Master Fisherman','Catch and collect 50 different fish species'),(15,'Legendary Mount','Acquire and ride a legendary mount'),(16,'Master of Elements','Master all four elements: fire, water, earth, and air'),(17,'Hero of the People','Complete 100 quests that help the common folk'),(18,'Archaeologist','Discover and uncover 10 ancient artifacts'),(19,'Wise Scholar','Read and study 100 different books'),(20,'Epic Bard','Perform in 50 different taverns and receive applause'),(21,'Shadow Assassin','Eliminate 100 enemies silently without being detected'),(22,'Keeper of Balance','Resolve conflicts between factions and restore harmony'),(23,'Collector\'s Obsession','Collect 500 unique in-game items'),(24,'Legendary Spellcaster','Master all schools of magic'),(25,'Heroic Sacrifice','Make a noble sacrifice to save others');
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
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
