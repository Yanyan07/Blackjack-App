-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: blackjackdb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank_val` varchar(255) NOT NULL,
  `suit` varchar(255) NOT NULL,
  `deck_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6k0or7dj9m5qhnshnk9fpg8r1` (`deck_id`),
  CONSTRAINT `FK6k0or7dj9m5qhnshnk9fpg8r1` FOREIGN KEY (`deck_id`) REFERENCES `deck` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'2','hearts',1),(2,'3','hearts',1),(3,'4','hearts',1),(4,'5','hearts',1),(5,'6','hearts',1),(6,'7','hearts',1),(7,'8','hearts',1),(8,'9','hearts',1),(9,'10','hearts',1),(10,'J','hearts',1),(11,'Q','hearts',1),(12,'K','hearts',1),(13,'A','hearts',1),(14,'2','spades',1),(15,'3','spades',1),(16,'4','spades',1),(17,'5','spades',1),(18,'6','spades',1),(19,'7','spades',1),(20,'8','spades',1),(21,'9','spades',1),(22,'10','spades',1),(23,'J','spades',1),(24,'Q','spades',1),(25,'K','spades',1),(26,'A','spades',1),(27,'2','clubs',1),(28,'3','clubs',1),(29,'4','clubs',1),(30,'5','clubs',1),(31,'6','clubs',1),(32,'7','clubs',1),(33,'8','clubs',1),(34,'9','clubs',1),(35,'10','clubs',1),(36,'J','clubs',1),(37,'Q','clubs',1),(38,'K','clubs',1),(39,'A','clubs',1),(40,'2','diamonds',1),(41,'3','diamonds',1),(42,'4','diamonds',1),(43,'5','diamonds',1),(44,'6','diamonds',1),(45,'7','diamonds',1),(46,'8','diamonds',1),(47,'9','diamonds',1),(48,'10','diamonds',1),(49,'J','diamonds',1),(50,'Q','diamonds',1),(51,'K','diamonds',1),(52,'A','diamonds',1);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_item`
--

DROP TABLE IF EXISTS `card_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `card_id` int DEFAULT NULL,
  `is_available` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcviu6f47sq5omkwcwjdfylks4` (`card_id`),
  CONSTRAINT `FKcviu6f47sq5omkwcwjdfylks4` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_item`
--

LOCK TABLES `card_item` WRITE;
/*!40000 ALTER TABLE `card_item` DISABLE KEYS */;
INSERT INTO `card_item` VALUES (1,1,_binary '\0'),(2,1,_binary ''),(3,2,_binary '\0'),(4,2,_binary ''),(5,3,_binary ''),(6,3,_binary ''),(7,4,_binary ''),(8,4,_binary '\0'),(9,5,_binary ''),(10,5,_binary ''),(11,6,_binary '\0'),(12,6,_binary ''),(13,7,_binary ''),(14,7,_binary ''),(15,8,_binary ''),(16,8,_binary ''),(17,9,_binary ''),(18,9,_binary ''),(19,10,_binary ''),(20,10,_binary ''),(21,11,_binary ''),(22,11,_binary ''),(23,12,_binary ''),(24,12,_binary ''),(25,13,_binary ''),(26,13,_binary '\0'),(27,14,_binary ''),(28,14,_binary ''),(29,15,_binary ''),(30,15,_binary ''),(31,16,_binary '\0'),(32,16,_binary ''),(33,17,_binary ''),(34,17,_binary ''),(35,18,_binary ''),(36,18,_binary ''),(37,19,_binary '\0'),(38,19,_binary ''),(39,20,_binary ''),(40,20,_binary ''),(41,21,_binary ''),(42,21,_binary ''),(43,22,_binary ''),(44,22,_binary ''),(45,23,_binary ''),(46,23,_binary ''),(47,24,_binary ''),(48,24,_binary ''),(49,25,_binary ''),(50,25,_binary '\0'),(51,26,_binary ''),(52,26,_binary ''),(53,27,_binary ''),(54,27,_binary ''),(55,28,_binary ''),(56,28,_binary ''),(57,29,_binary ''),(58,29,_binary ''),(59,30,_binary ''),(60,30,_binary ''),(61,31,_binary ''),(62,31,_binary ''),(63,32,_binary ''),(64,32,_binary ''),(65,33,_binary '\0'),(66,33,_binary ''),(67,34,_binary '\0'),(68,34,_binary ''),(69,35,_binary ''),(70,35,_binary ''),(71,36,_binary ''),(72,36,_binary ''),(73,37,_binary '\0'),(74,37,_binary ''),(75,38,_binary ''),(76,38,_binary ''),(77,39,_binary ''),(78,39,_binary ''),(79,40,_binary '\0'),(80,40,_binary ''),(81,41,_binary ''),(82,41,_binary ''),(83,42,_binary ''),(84,42,_binary ''),(85,43,_binary ''),(86,43,_binary ''),(87,44,_binary ''),(88,44,_binary '\0'),(89,45,_binary ''),(90,45,_binary ''),(91,46,_binary ''),(92,46,_binary ''),(93,47,_binary ''),(94,47,_binary ''),(95,48,_binary ''),(96,48,_binary ''),(97,49,_binary ''),(98,49,_binary ''),(99,50,_binary ''),(100,50,_binary ''),(101,51,_binary ''),(102,51,_binary ''),(103,52,_binary ''),(104,52,_binary '');
/*!40000 ALTER TABLE `card_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deck`
--

DROP TABLE IF EXISTS `deck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deck` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck`
--

LOCK TABLES `deck` WRITE;
/*!40000 ALTER TABLE `deck` DISABLE KEYS */;
INSERT INTO `deck` VALUES (1,'deck1');
/*!40000 ALTER TABLE `deck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `deck_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsodhsqqqq3yg3j71nrx9hytdn` (`deck_id`),
  CONSTRAINT `FKsodhsqqqq3yg3j71nrx9hytdn` FOREIGN KEY (`deck_id`) REFERENCES `deck` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'oscar@gmail.com','oscar123','player','oscar');
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

-- Dump completed on 2023-05-08 15:47:30
create database blackjackdb;
