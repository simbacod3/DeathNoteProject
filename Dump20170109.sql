CREATE DATABASE  IF NOT EXISTS `deathnoteschema` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `deathnoteschema`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: deathnoteschema
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table ` event_link_person`
--

DROP TABLE IF EXISTS ` event_link_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ` event_link_person` (
  `id event_link_person` int(11) NOT NULL AUTO_INCREMENT,
  `idevent` int(11) NOT NULL,
  `idperson` int(11) NOT NULL,
  PRIMARY KEY (`id event_link_person`),
  KEY `idevent_idx` (`idevent`),
  KEY `idperson_idx` (`idperson`),
  CONSTRAINT `idevent` FOREIGN KEY (`idevent`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idperson` FOREIGN KEY (`idperson`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table ` event_link_person`
--

LOCK TABLES ` event_link_person` WRITE;
/*!40000 ALTER TABLE ` event_link_person` DISABLE KEYS */;
INSERT INTO ` event_link_person` VALUES (1,2,3),(2,2,1),(3,2,2);
/*!40000 ALTER TABLE ` event_link_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `idpicture` int(11) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (29,'dnzeahu','bhfz','moli',484,'de',0,'5858'),(30,'Maxime','Gasnier','Mardxou',21,'dedeji',0,'Kool'),(31,'Hugo','HERRMANN','hugO',21,'jjiji',0,'kooli'),(32,'Maxime','Gasnier','Ok',45,'',0,'Ok');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `season` varchar(45) DEFAULT NULL,
  `synopsis` varchar(2000) DEFAULT NULL,
  `link` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `number_UNIQUE` (`number`),
  UNIQUE KEY `link_UNIQUE` (`link`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (6,1,'1','Light Yagami is a high school genius bored with life in general. Ryuk, a shinigami, is also bored, so he decides to drop his Death Note (a notebook shinigami use to kill humans) on Earth. After which, Light finds this mysterious book and decides to rid the world of all wicked people and rule a utopia as a god.','https://www.youtube.com/embed/QYGXcuVLNeg'),(7,2,'1','Light falls into the first of many of L\'s attempts to uncover him from his Kira alter ego.','https://www.youtube.com/embed/GxSWxnPSXbo'),(8,3,'1','Ryuk informs Light that he\'s being followed and asks Light if he wants to make a trade for his own Shinigami eyes. But at what cost?','https://www.youtube.com/embed/HLQTwR43Vek'),(9,4,'1','Light creates a complex plan involving the Death Note and another criminal to try and expose his follower\'s name and identity.','https://www.youtube.com/embed/yvY6NYgm4Do'),(10,5,'1','After finding the true identity of his follower, Light uses him to deal a major blow to the rest of his enemies.','https://www.youtube.com/embed/qf_pOQvPf6A'),(11,6,'1','Furthering the Kira investigation, the remaining Task Force finally meets L. Meanwhile, Light meets a mysterious woman with a connection to one of Kira\'s latest victims.','https://www.youtube.com/embed/pO5Q8wOrA7c'),(12,7,'1','Light continues his conversation with Penber\'s fiance-- an ex-FBI agent who is determined to hunt down Kira.','https://www.youtube.com/embed/VhM5Og1_UII'),(13,8,'1','Discovering that L has gone so far as to tap his room with cameras, Light comes up with a plan to throw off his suspicions.','https://www.youtube.com/embed/zxSfjGmoJ6k'),(14,9,'1','Still suspicious of Light\'s too-perfect behavior, L decides to take drastic measures and enters the same university as Light does to further investigate him.','https://www.youtube.com/embed/un2vj9ZoQrI'),(15,10,'1','L begins to profile Light through a game of tennis, followed by some questions regarding the Kira case hoping to figure out the truth about him. However, the questioning is cut short when an unexpected heart attack occurs.','https://www.youtube.com/embed/aGENAoIHNYo'),(16,11,'1','The Sakura TV station plans to air Kira\'s home-made videos. Little do they know that the videos will bring more than ratings.','https://www.youtube.com/embed/1qTx2AIv2cI'),(17,12,'1','The Task Force recruits Light and has him work with them to create a video response to the \"copy-cat Kira.\" But playing both sides of this conflict becomes more of a burden for Light than he thought as the copy-cat hints at the existence of shinigami in his response video to the Task Force.','https://www.youtube.com/embed/dwil1XrGouw'),(18,13,'1','When the Task Force receives a diary entry from the second Kira, Light volunteers to inspect Aoyama and Shibuya - the two places mentioned in the diary - in hopes of identifying the second Kira. But with the second Kira\'s shinigami eyes, it looks like she has the upper hand in finding Light first.','https://www.youtube.com/embed/oQSOmfnpEFg'),(19,14,'1','Emotions run high as Light manipulates Misa by promising his false love in return for using her to kill L, who openly admits a friendship with Light. But, as always, plans aren\'t as easy as they seem when Misa\'s shinigami, Rem, promises to kill Light if anything were to happen to Misa.','https://www.youtube.com/embed/mCm_tQ9p2uw'),(20,15,'1','Light tries using the second Kira to find out L\'s real name. However, L is well prepared for Kira\'s next move and is able to get one of the Kiras in his custody soon enough.','https://www.youtube.com/embed/kP2bg1LSazQ'),(21,16,'1','After renouncing ownership of both Death Notes, Light turns himself in to L and is imprisoned.','https://www.youtube.com/embed/c-y2r87Xvk0'),(22,17,'1','Getting nowhere fast, L thinks of a new plan to get Misa, Light, and Mr. Yagami out of confinement. Meanwhile, Rem finds a new person to play as Kira.','https://www.youtube.com/embed/bzFTRycpbFQ'),(23,18,'1','Tensions rise among the Task Force as the Kira investigation continues with the close surveillance of the Yotsuba corporation. But when the Force finds that the police are no longer supporting the case, the members are forced to choose between keeping their jobs or resigning to continue searching for Kira.','https://www.youtube.com/embed/gjWVAzVJKOQ');
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `murder` tinyint(1) DEFAULT NULL,
  `idkiller` int(11) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `pointofview` tinyint(1) DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `episode_id` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_episode_idx` (`episode_id`),
  KEY `id_picture_idx` (`picture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (2,'Light Yagami picks up the Death Note.','2003-11-28',1,1,'',NULL,1,6,'The Death Note'),(35,'Kurou Otoharada dies of a heart attack after Light Yagami writes his name in the Death Note.','2003-11-28',1,1,NULL,NULL,NULL,6,'First Try'),(36,'Takuo Shibuimaru dies from a motorcycle accident after Light Yagami writes his name in the Death Note','2003-11-28',1,1,NULL,NULL,NULL,6,'Verification of  Real Power'),(37,'Light Yagami meets the Shinigami Ryuk and announces that he\'ll become the god of the new world created with the help of the Death Note which he has already been using to kill off criminals.','2003-12-03',1,1,NULL,NULL,NULL,6,'Shinigami'),(38,'At an ICPO meeting on how to deal with the Kira killings, L announces his investigation.','2003-12-04',1,1,NULL,1,NULL,6,'Meeting on Headquarters'),(39,'On a TV broadcast, Lind L. Tailor defies Kira.','2003-12-05',1,1,'Tokyo',1,NULL,7,'L'),(40,'Light Yagami kills Lind L. Tailor using the power of the Death Note, but L has tricked him into revealing that Kira is in the Kanto region of Japan.','2003-12-05',1,1,'Tokyo',0,NULL,7,'Confrontation');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `profession` varchar(45) DEFAULT NULL,
  `story` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idperson_UNIQUE` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Maxime','God of Death','Dev','Since blahblah',21),(2,'Hugo','God of Death','Dev','Since blahblah',21),(3,'Light Yagami','Kira and main character','Investigator and student','Main character of the story.',21);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES (1,'http://salut.com');
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentId` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `yearLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'gasnier','salut ',1995),(2,'d','salut ',1995),(3,'az','salut ',1995),(7,'gasnier','salut ',1995);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-09  3:43:58
