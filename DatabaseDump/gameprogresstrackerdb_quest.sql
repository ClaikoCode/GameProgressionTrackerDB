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
-- Table structure for table `quest`
--

DROP TABLE IF EXISTS `quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest` (
  `QuestID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `Description` tinytext,
  `Objective` tinytext NOT NULL,
  `Reward` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`QuestID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest`
--

LOCK TABLES `quest` WRITE;
/*!40000 ALTER TABLE `quest` DISABLE KEYS */;
INSERT INTO `quest` VALUES (1,'Rescue the Villagers','Help save the villagers from an imminent threat','Rescue 10 villagers','500 gold'),(2,'Gather Rare Ingredients','Collect rare ingredients for a powerful potion','Gather 5 dragon scales and 3 phoenix feathers','Elixir of Strength'),(3,'Defeat the Ancient Dragon','Face off against the mighty ancient dragon and claim victory','Defeat the Ancient Dragon','Dragonbane Sword'),(4,'Retrieve the Lost Artifact','Embark on a quest to find a lost artifact of great power','Find the Lost Artifact in the Cave of Shadows','Amulet of Eternal Wisdom'),(5,'The Bandit Menace','Deal with a group of dangerous bandits terrorizing the region','Eliminate the bandit leader and his gang','1000 gold and a rare gemstone'),(6,'Clear the Haunted Mansion','Investigate and cleanse a haunted mansion plagued by malevolent spirits','Exorcise the ghosts and find the source of the haunting','Haunted Shield'),(7,'The Missing Heirloom','Locate a precious heirloom stolen from the royal family','Track down the thief and recover the heirloom','Royal Medal of Honor'),(8,'The Enchanted Forest','Explore a mystical forest filled with magical creatures','Discover the hidden grove and meet the guardian spirit','Enchanted Bow'),(9,'A Test of Bravery','Prove your courage in a series of challenging trials','Complete the trial of strength, agility, and wit','Badge of Valor'),(10,'The Mysterious Tome','Unlock the secrets of a mysterious ancient tome','Decipher the arcane symbols and perform the ritual','Forbidden Knowledge'),(11,'The Curse of the Lich','Break the curse cast upon a cursed town by a powerful lich','Find the Lich\'s phylactery and destroy it','Pendant of Undying'),(12,'The Lost Expedition','Search for a lost expedition in the treacherous mountains','Follow the trail and locate the missing adventurers','Explorer\'s Map'),(13,'The Forbidden Temple','Enter the forbidden temple and uncover its dark secrets','Navigate through traps and solve ancient riddles','Talisman of Power'),(14,'The Arena Challenge','Participate in an epic arena battle against fierce opponents','Defeat multiple waves of enemies and emerge victorious','Champion\'s Gauntlets'),(15,'The Cursed Relic','Break the curse surrounding a powerful ancient relic','Perform the ritual to cleanse the relic from darkness','Relic of Light'),(16,'The Forgotten Kingdom','Explore the ruins of an ancient kingdom lost to time','Uncover the history and treasures of the forgotten kingdom','Ancient Crown'),(17,'The Sands of Time','Travel back in time and prevent a catastrophic event','Alter the course of history and save the world','Timekeeper\'s Hourglass'),(18,'The Mystic Oracle','Seek guidance from a wise and mysterious oracle','Ask the oracle a question and receive an answer','Enlightenment Crystal'),(19,'The Ghost Ship','Investigate the haunted ghost ship roaming the seas','Banish the vengeful spirits and discover the ship\'s secrets','Ghostly Cutlass'),(20,'The Relics of Power','Find and collect ancient relics infused with immense power','Retrieve the Relic of Fire, Relic of Water, and Relic of Air','Relic Collector\'s Satchel'),(21,'The Crystal Caverns','Venture into the crystal-filled caverns and uncover their wonders','Find the Crystal Heart and harness its energy','Crystalized Staff'),(22,'The Forbidden Ritual','Prevent a dark cult from performing a forbidden ritual','Interrupt the ritual and defeat the cult leader','Seal of Sanctity'),(23,'The Lost City of Atlantis','Discover the legendary lost city hidden beneath the ocean','Unravel the mysteries of Atlantis and find its treasures','Atlantean Trident'),(24,'The Haunted Woods','Explore the eerie haunted woods and confront the malevolent spirits','Release the trapped souls and restore peace','Spiritwalker\'s Cloak'),(25,'The Elemental Trials','Master the elements in a series of elemental trials','Complete the trials of fire, water, earth, and air','Elemental Mastery Ring'),(26,'The Shadow Realm','Brave the treacherous Shadow Realm and face its dark ruler','Defeat the Shadow King and restore light to the realm','Shadowbane Dagger');
/*!40000 ALTER TABLE `quest` ENABLE KEYS */;
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
