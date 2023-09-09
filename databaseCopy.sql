-- MariaDB dump 10.19  Distrib 10.8.3-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: people
-- ------------------------------------------------------
-- Server version	10.8.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tittle` varchar(50) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES
(1,'Independence Day','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','2022-07-28 18:03:40','2022-07-28 18:03:40'),
(2,'Examination Day','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ulabore et dolore magna aliqua.','2022-07-28 18:06:21','2022-07-28 18:06:21'),
(3,'Meeting Schedule','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','2022-07-28 20:44:13','2022-07-28 20:44:13'),
(4,'Array Announcement','returns an array that contains one or more associative arrays','2022-07-28 20:54:25','2022-07-28 20:54:25'),
(6,'What is Lorem Ipsum?','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to','2022-07-28 21:11:58','2022-07-28 21:11:58'),
(7,'Why do we use it?',' There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. ','2022-07-28 22:08:20','2022-07-28 22:08:20'),
(8,'Where can I get some?','  There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.   ','2022-07-28 22:10:04','2022-07-28 22:10:04'),
(9,'Where does it come from?',' Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ','2022-07-28 22:11:32','2022-07-28 22:11:32'),
(10,'Rackham',' But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete.','2022-07-29 00:26:35','2022-07-29 00:26:35'),
(11,'Descussion',' Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.','2022-07-29 00:29:30','2022-07-29 00:29:30'),
(12,'Could it be love?',' Could it be love? I know what an erection feels like, Michael. No, it\'s the opposite… like my heart is getting hard. She calls it a mayonegg. Either I zip down, or he zips up, and that is a mighty long zipper on Mother\'s','2022-07-29 01:31:54','2022-07-29 01:31:54');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) DEFAULT NULL,
  `people_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`contact_id`),
  KEY `fk_contacts_people_idx` (`people_id`),
  CONSTRAINT `fk_contacts_people` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES
(3,'09827236812',1,'2022-07-27 14:40:29','2022-07-27 22:56:26'),
(4,'09999999999',1,'2022-07-27 14:57:09','2022-07-27 22:57:39'),
(22,'09999999999',52,'2022-07-28 17:42:42','2022-07-29 01:42:42');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES
(1,'Hanna','Velazquez','2014-09-23 12:19:25','2014-11-20 12:19:32'),
(2,'Peter','Frampton','2014-11-09 12:11:46','2014-12-18 12:11:34'),
(3,'Steve','Carey','2014-09-15 12:12:25','2014-12-28 12:12:33'),
(4,'Ron','Lumis','2014-08-18 12:12:54','2014-11-12 12:13:04'),
(5,'Hugh','Motcrief','2014-08-12 12:13:29','2014-12-24 12:13:37'),
(6,'Bob','Renter','2014-09-15 12:13:59','2014-12-15 12:14:06'),
(7,'Janet','Lemur','2014-11-10 12:14:37','2014-12-17 12:14:45'),
(8,'George','Barret','2014-09-15 12:15:08','2014-11-19 12:15:15'),
(9,'Leyla','Korg','2014-09-14 12:15:38','2014-10-24 12:15:47'),
(10,'John','Morris','2014-09-15 12:16:23','2014-12-23 12:16:29'),
(11,'Robert','Palmer','2014-10-01 12:11:07','2014-12-15 12:11:19'),
(52,'Christian','Araña','2022-07-29 01:42:42','2022-07-29 01:42:42');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(4,'Christian','Araña','09999999999','b53b221e1038003fc8056d45ef480d8d','528d1e1df45a7ab5de663ff9e260b18b65d35b03f80c','2022-07-29 18:48:50','2022-07-30 08:01:09'),
(5,'San Pedro','Ungol','09123456789','79c1df5a70cc8c19bd599510dbd4818a','739dfc9a731c0e39ccc56b21ef796d50abfeffea0c67','2022-07-29 20:20:15','2022-07-30 04:20:15'),
(6,'Pedro','Penduko','09876543210','c53f5cbad61256c5b5185b1446c2923f','e9a14e53d3d934f6f9bb0635ac9d0d1f0a2c768aa4f4','2022-07-29 20:49:31','2022-07-30 07:22:18'),
(7,'Jose','Mari','09676247836','dbec83523c2a046700a5d1ba765fad44','52a36a86b143a5bc7dc0bdced16b1c68f620b40fbd91','2022-07-30 00:00:29','2022-07-30 08:00:29');
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

-- Dump completed on 2022-08-02  8:19:14
