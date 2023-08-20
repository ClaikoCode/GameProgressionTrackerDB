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
-- Table structure for table `npc`
--

DROP TABLE IF EXISTS `npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc` (
  `NPCID` int NOT NULL AUTO_INCREMENT,
  `Name` tinytext NOT NULL,
  `Role` varchar(32) NOT NULL,
  `Dialogue` tinytext,
  `Location` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`NPCID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npc`
--

LOCK TABLES `npc` WRITE;
/*!40000 ALTER TABLE `npc` DISABLE KEYS */;
INSERT INTO `npc` VALUES (1,'Elder Alistair','Village Elder','Welcome, adventurer! What brings you to our humble village?','Village Square'),(2,'Captain Valeria','Military Commander','Halt! State your business or prepare to face the consequences.','Barracks'),(3,'Master Alaric','Master Blacksmith','Need a weapon forged? I can create a masterpiece for you.','Blacksmith\'s Forge'),(4,'Sage Aurelia','Wise Scholar','Ah, another seeker of knowledge. What do you wish to learn?','Library'),(5,'Trader Gavin','Merchant','Step right up! I have the finest wares in all the land.','Marketplace'),(6,'Priestess Seraphina','Spiritual Guide','May the divine light guide your path, my child.','Temple of Light'),(7,'Thief Roderick','Skilled Rogue','Looking for some \'acquisitions\'? I might have what you need.','Shady Alley'),(8,'Magus Merlin','Master Sorcerer','Greetings, young one. Are you ready to harness the power of magic?','Tower of Arcane Arts'),(9,'Tavernkeeper Rosalind','Innkeeper','Welcome to the Dancing Dragon Inn. What can I get you?','Tavern'),(10,'Guardian Kael','Protector of the Forest','Only those with pure intentions may enter the sacred grove.','Enchanted Forest'),(11,'Pirate Captain Morgan','Swashbuckling Captain','Ahoy, matey! Care to join me crew on a grand adventure?','Pirate Cove'),(12,'Scribe Isabella','Record Keeper','I document the history of our land. What tale shall I write today?','Royal Archives'),(13,'Seer Cassandra','Mystic Seer','I foresee great challenges ahead. Seek my guidance if you dare.','Gypsy Camp'),(14,'Druidess Elara','Nature Guardian','The spirits of the forest whisper their secrets to me. Listen closely.','Sacred Grove'),(15,'Bard Sebastian','Melodious Minstrel','Ah, the power of music! Let me serenade you with a tale of heroes.','Town Square'),(16,'Engineer Cyrus','Inventive Tinkerer','Inventions and contraptions aplenty! Care to see my latest creation?','Workshop'),(17,'Fisherman Finn','Master Angler','Aye, there be fish aplenty in these waters. Care to try your luck?','Fishing Dock'),(18,'Herbalist Gwendolyn','Herb Expert','Nature provides many remedies. Let me concoct something for you.','Herbal Garden'),(19,'Miner Donovan','Seasoned Miner','Deep within the earth, treasures untold await those who dare.','Mining Caverns'),(20,'Chef Lillian','Culinary Master','Hungry, are we? I\'ll prepare a feast fit for a king.','Gourmet Kitchen'),(21,'Sellsword Roland','Mercenary','If the coin is right, I\'ll take on any task. What\'s your offer?','Mercenary Guild'),(22,'Oracle Desmond','Mysterious Oracle','Step into the light, traveler, and seek the answers you desire.','Oracle\'s Chamber'),(23,'Inventor Phineas','Mad Inventor','I\'m on the verge of a breakthrough! Care to assist me in my experiments?','Laboratory'),(24,'Gardener Olivia','Green Thumb Enthusiast','The beauty of nature can be found even in the tiniest of gardens.','Botanical Gardens'),(25,'Jester Jocelyn','Jolly Jester','Hehe! Care to share a laugh or two? Laughter is the best medicine.','Courtyard');
/*!40000 ALTER TABLE `npc` ENABLE KEYS */;
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
