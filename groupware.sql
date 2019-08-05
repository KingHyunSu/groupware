CREATE DATABASE  IF NOT EXISTS `manager` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `manager`;
-- MySQL dump 10.17  Distrib 10.3.17-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: manager
-- ------------------------------------------------------
-- Server version	10.3.17-MariaDB-1:10.3.17+maria~bionic

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dep_no` int(11) unsigned NOT NULL,
  `dep_name` varchar(11) NOT NULL,
  PRIMARY KEY (`dep_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `deptno` varchar(11) NOT NULL,
  `deptname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`deptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES ('1','총무'),('10','개발2팀'),('11','개발3팀'),('2','회계'),('3','인사'),('4','영업본부'),('5','영업1팀'),('6','영업2팀'),('7','디자인'),('8','IT'),('9','개발1팀');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `pw` varchar(300) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `authority` varchar(11) DEFAULT 'anonymous',
  `enabled` tinyint(1) DEFAULT NULL,
  `ok` varchar(10) DEFAULT NULL,
  `dept` varchar(11) DEFAULT NULL,
  `rank` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`num`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'user1','$2a$10$lH7fpt35Pxxo8Q/kjWRig.wHo5B63CLamDZB847oKKE1A.17ma43W','서팔광','ROLE_USER',NULL,NULL,'9','1'),(2,'user2','$2a$10$bJIoYkRcofmQV93GeO5FHeDmF7q/QWItcnT11VHsupQo4FgUDsptq','황지필','ROLE_USER',NULL,NULL,'9','2'),(3,'user3','$2a$10$vtTFm5MY8M5CtcRBwX3KQu/OvawtCBlHc.Y762q4NuQzvdvssHDhm','김일제','ROLE_USER',NULL,NULL,'9','3'),(4,'user4','$2a$10$iu1VUQG.UqWtaHeDuuI/5uGPUrRuOOxBQA3PdWFJUuOfnJSlOFxIK','곽마권','ROLE_USER',NULL,NULL,'9','4'),(5,'user5','$2a$10$Jy817g6v/.EVTSYE8QT4oO9iV3SsEOn8VQLocVYqwwyyz4BSWCHnW','마풍권','ROLE_USER',NULL,NULL,'9','5'),(6,'user6','$2a$10$wHEx3j7rQhGv4i/BqxghT.9siyOW/hSGnnovd.5w5x5XZb7/3bC0C','김덕협','ROLE_USER',NULL,NULL,'9','6'),(7,'user7','$2a$10$ARJaE5IGP5.S3QQmlcyHO.doRMhpTkMfopmjMkdt0r8/EBnbZq5D2','나대물','ROLE_USER',NULL,NULL,'1','2'),(8,'user8','$2a$10$kzrPetvbwZGiTTdJqyl9bOLQjbo4gLd3bHNl8uLXBC0BSKtTkpUey','유덕창','ROLE_USER',NULL,NULL,'1','4'),(11,'admin','$2a$10$60Kbhsrov8LCTRcc/J8aauDDg0IZaIEpVAwKoVK8gHzkflfUQNal2','김현수','ROLE_ADMIN',NULL,NULL,'9','1'),(12,'user9','$2a$10$vZ6x3EDLjyz1suV.tqXjCOdBErGc4DjId/6mGPZrb7Jq5a4Loe8KO','김나물','ROLE_USER',NULL,NULL,'10','2');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `writer` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'test','<p>test</p>',NULL,NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `rankno` varchar(11) NOT NULL,
  `rankname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rankno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES ('1','이사'),('2','부장'),('3','과장'),('4','대리'),('5','주임'),('6','사원');
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `startDate` varchar(11) DEFAULT NULL,
  `endDate` varchar(11) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,NULL,'일정 추가 테스트입니다.','2019-07-24','2019-07-24','테스트 일정입니다.'),(2,NULL,'test','2019-07-24','2019-07-27','test'),(3,NULL,'ttrtt','2019-07-24','2019-07-24','ttt'),(4,NULL,'tt','2019-07-30','2019-07-31','tt'),(5,NULL,'test','2019-08-01','2019-08-01','test'),(6,NULL,'test','2019-08-01','2019-08-01','test'),(7,'user1','test','2019-08-01','2019-08-01','test');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign`
--

DROP TABLE IF EXISTS `sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `writer` varchar(10) DEFAULT NULL,
  `date` varchar(11) DEFAULT NULL,
  `deptname` varchar(20) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `signCheck` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign`
--

LOCK TABLES `sign` WRITE;
/*!40000 ALTER TABLE `sign` DISABLE KEYS */;
INSERT INTO `sign` VALUES (1,'test','test','서팔광','2019-08-01','개발1팀','user1','0'),(2,'test','test','황지필','2019-08-01','개발1팀','user2','0');
/*!40000 ALTER TABLE `sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signpath`
--

DROP TABLE IF EXISTS `signpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signpath` (
  `num` int(11) DEFAULT NULL,
  `signName` varchar(10) DEFAULT NULL,
  `signDept` varchar(11) DEFAULT NULL,
  `signRank` varchar(11) DEFAULT NULL,
  `sign` varchar(2) DEFAULT NULL,
  `signDate` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signpath`
--

LOCK TABLES `signpath` WRITE;
/*!40000 ALTER TABLE `signpath` DISABLE KEYS */;
INSERT INTO `signpath` VALUES (1,'김일제','개발1팀','과장','1','2019-08-01'),(1,'곽마권','개발1팀','대리','1','2019-08-01'),(1,'마풍권','개발1팀','주임','0',''),(2,'서팔광','개발1팀','이사','1','2019-08-01'),(2,'김일제','개발1팀','과장','0',NULL),(2,'마풍권','개발1팀','주임','0',NULL),(2,'김덕협','개발1팀','사원','0',NULL);
/*!40000 ALTER TABLE `signpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signvalue`
--

DROP TABLE IF EXISTS `signvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signvalue` (
  `signno` varchar(11) NOT NULL,
  `signname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`signno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signvalue`
--

LOCK TABLES `signvalue` WRITE;
/*!40000 ALTER TABLE `signvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `signvalue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-05 18:39:47
