-- MySQL dump 10.17  Distrib 10.3.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: manager
-- ------------------------------------------------------
-- Server version	10.3.18-MariaDB-1:10.3.18+maria~bionic

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
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `dept_no` int(3) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(20) NOT NULL,
  PRIMARY KEY (`dept_no`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'총무'),(2,'회계'),(3,'인사'),(4,'영업본부'),(5,'영업1팀'),(6,'영업2팀'),(7,'디자인'),(8,'IT'),(9,'개발1팀'),(10,'개발2팀'),(11,'개발3팀');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(20) NOT NULL,
  `pw` varchar(300) NOT NULL,
  `name` varchar(15) NOT NULL,
  `authority` varchar(11) DEFAULT 'anonymous',
  `enabled` tinyint(1) DEFAULT NULL,
  `dept_no` int(3) NOT NULL,
  `rank_no` int(3) NOT NULL,
  `photo` varchar(300) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_no` (`dept_no`),
  KEY `rank_no` (`rank_no`),
  CONSTRAINT `dept_fk` FOREIGN KEY (`dept_no`) REFERENCES `dept` (`dept_no`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `rank_fk` FOREIGN KEY (`rank_no`) REFERENCES `rank` (`rank_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','$2a$10$aZvfk.JthOyHGMYG2Vn0SuwjF5DmCg1MhQweuVTyEGLHtBHG1bshO','김현수','ROLE_ADMIN',NULL,9,1,'1576236243769-김현수 취업.jpg','kailking611@gmail.com','010-4122-7704'),('user1','$2a$10$.5WaW54XHo5EDTmhUPOVbecmEVo0rwm1fj9zj9JxdwuLrskWqwU2q','김민수','ROLE_USER',NULL,9,2,'1576239190504-bb.gif','kailkling611@gamil.com','010-4122-7704'),('user10','$2a$10$3fR/riWh6pB9O45RMNpeheESJLxrTYdzai9JdFRaP.RQX40TJMXOu','마풍강','ROLE_USER',NULL,7,3,'1576239666788-wwq.gif','kailking611@gmail.com','010-4122-7704'),('user2','$2a$10$5CLcgYXjHolq1S6izyuYuOujxC0LlbDToXCDLVQ9.a4wt.CalZ07.','김찬수','ROLE_USER',NULL,9,3,'1576239165884-aa.gif','kailking611@gmail.com','010-4122-7704'),('user3','$2a$10$AwX6XBcH4l1D7EAm21zbxe80JlAXeyZkAgoBZvHW94ufwmW2it7s2','박광수','ROLE_USER',NULL,9,6,'1576239079131-d.gif','kailking611@gmail.com','010-4122-7704'),('user4','$2a$10$5oyzp9jdZrZBFlUmGQsAyegwKsu3CLso85fZ0W/bkF/3ACW5tGQua','이덕수','ROLE_USER',NULL,10,2,'1576239291824-d.gif','kailking611@gmail.com','010-4122-7704'),('user5','$2a$10$vaxxrCZiKRRJaBuZhb475O/iIy46aHH6tIfiaLc5Qvj5pomGxVnKu','안소영','ROLE_USER',NULL,11,2,'1576239368791-abc.gif','kailking611@gmail.com','010-4122-7704'),('user6','$2a$10$qsIzolHUWgmyccxQ2mrcKuSYL6y78HM/Pexw4lst1SAjWUuhJWi.u','김득열','ROLE_USER',NULL,5,3,'1576239434589-bcd.gif','kailking611@gmail.com','010-4122-7704'),('user7','$2a$10$g2KPTjziEjmU2/NaQF5W7udxik5yBMfnyCUxWVKemZzpqXbDHnOj.','김재홍','ROLE_USER',NULL,6,4,'1576239491188-fde.gif','kailking611@gmail.com','010-4122-7704'),('user8','$2a$10$.PAiE3fPf/8.XTe/hiKMyuEOsE.D12By2OMiysNhe/qy2k3uVD7c6','서팔광','ROLE_USER',NULL,1,2,'1576239567582-ww.gif','kailking611@gmail.com','010-4122-7704'),('user9','$2a$10$SxVCmK1U3xSz960GdlSiHOoXd5fKyvtPyGsBr0UxX0BR3KsyQ.kPW','마석대','ROLE_USER',NULL,2,2,'1576239610800-we.gif','kailking611@gmail.com','010-4122-7704');
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
  `title` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `id` varchar(20) NOT NULL,
  `filename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `notice_member_fk_idx` (`id`),
  CONSTRAINT `notice_member_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (3,'귀한시간 내서 사이트에 방문해주셔서 감사합니다.','<p>사이트에 방문해주셔서 감사합니다.&nbsp;</p>','2019-12-13','admin',NULL),(4,'그룹웨어 프로젝트 포트폴리오는 https://drive.google.com/open?id=12wIIdwZigjS214LxRolUHbhMXU4KdjtBLt7_5AjViw8 에 있습니다.','<p><span id=\"docs-internal-guid-e35dea13-7fff-215e-6be3-737d0695689b\"></span></p><p dir=\"ltr\" style=\"line-height:1.2;text-indent: -100pt;text-align: justify;margin-top:0pt;margin-bottom:0pt;padding:0pt 0pt 0pt 100pt;\"><font color=\"#800080\" face=\"Gulim\"><span style=\"font-size: 13.3333px; white-space: pre-wrap;\">프로젝트 포트폴리오  URL (구글 프레젠테이션):</span></font></p><p dir=\"ltr\" style=\"line-height:1.2;text-indent: -100pt;text-align: justify;margin-top:0pt;margin-bottom:0pt;padding:0pt 0pt 0pt 100pt;\"><font color=\"#800080\" face=\"Gulim\"><span style=\"font-size: 13.3333px; white-space: pre-wrap;\"><u><br></u></span></font></p><p dir=\"ltr\" style=\"line-height:1.2;text-indent: -100pt;text-align: justify;margin-top:0pt;margin-bottom:0pt;padding:0pt 0pt 0pt 100pt;\"><span style=\"text-decoration: underline; font-size: 10pt; font-family: Gulim; color: rgb(128, 0, 128); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;\">h<a href=\"https://drive.google.com/open?id=12wIIdwZigjS214LxRolUHbhMXU4KdjtBLt7_5AjViw8\" style=\"text-decoration:none;\">ttps://drive.google.com/open?id=12wIIdwZigjS214LxRolUHbhMXU4KdjtBLt7_5AjViw8</a></span></p><p dir=\"ltr\" style=\"line-height:1.2;text-indent: -100pt;text-align: justify;margin-top:0pt;margin-bottom:0pt;padding:0pt 0pt 0pt 100pt;\">&nbsp;</p><p dir=\"ltr\" style=\"line-height:1.2;text-indent: -100pt;text-align: justify;margin-top:0pt;margin-bottom:0pt;padding:0pt 0pt 0pt 100pt;\">이 사이트의 포트폴리오 입니다.</p>','2019-12-13','admin',NULL),(5,'그룹웨어 프로젝트 소스는 https://github.com/KingHyunSu/groupware 에 있습니다.','<p>프로젝트 소스 URL(GitHub) :</p><p>&nbsp;</p><p><span id=\"docs-internal-guid-0d82c1c9-7fff-aefb-a237-af884a2e9f46\"></span></p><p dir=\"ltr\" style=\"line-height:1.2;text-align: justify;margin-top:0pt;margin-bottom:0pt;\"><span style=\"text-decoration: underline; font-size: 10pt; font-family: Gulim; color: rgb(0, 0, 255); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;\">h<a href=\"https://github.com/KingHyunSu/groupware\" style=\"text-decoration:none;\">ttps://github.com/KingHyunSu/groupware</a></span></p><p dir=\"ltr\" style=\"line-height:1.2;text-align: justify;margin-top:0pt;margin-bottom:0pt;\">&nbsp;</p><p dir=\"ltr\" style=\"line-height:1.2;text-align: justify;margin-top:0pt;margin-bottom:0pt;\">이 사이트의 소스 코드입니다.</p>','2019-12-13','admin',NULL),(6,'IoT 드론 제어 프로젝트 포트폴리오는 https://10study.tistory.com/37 에 있습니다. ','<p>한국소프트웨어산업협회에서 팀 프로젝트로 진행한 드론을 활용한 IoT 고급엔지니어 양성 과정에서</p><p>&nbsp;</p><p>팀 프로젝트로 진행한 우편물을 드론으로 원격 제어로 배송하는 프로젝트 포트폴리오입니다.</p><p>&nbsp;</p><p>포트폴리오 URL(개인 블로그) :&nbsp;</p><p>&nbsp;</p><p><a href=\"https://10study.tistory.com/37\">https://10study.tistory.com/37</a>&nbsp;</p>','2019-12-13','admin',NULL),(7,'IoT 드론 제어 프로젝트 원격 제어 시연 동영상은 https://10study.tistory.com/36 에 있습니다.','<p>우편물 드론 배송 시스템 프로그램은 MQTT Broker와 드론 안의 제어 프로그램이 연동이 되어야 구동이 되는데,</p><p>&nbsp;</p><p>클라이언트의 요청이 없어도 드론안의 제어 프로그램과 웹 서버가 초 단위로 데이터가 실시간으로 주고받기 때문에,</p><p>&nbsp;</p><p>AWS 과금 청구의 무서움 때문에 아직 배포하지 못하고 있습니다.</p><p>&nbsp;</p><p>대신, 프로젝트 시연 동영상으로 대체하겠습니다.</p><p>&nbsp;</p><p>프로젝트 시연 동영상 URL(개인 블로그) :&nbsp;</p><p>&nbsp;</p><p><a href=\"https://10study.tistory.com/36\">https://10study.tistory.com/36</a>&nbsp;</p>','2019-12-13','admin',NULL),(8,'IoT 드론 제어 프로젝트 웹 소스는 https://github.com/KingHyunSu/FinalWebProject 에 있습니다.','<p>프로젝트 소스 URL(Github) :</p><p>&nbsp;</p><p><span id=\"docs-internal-guid-bd9ac454-7fff-dace-1f95-e3e69d9de65f\"><a href=\"https://github.com/KingHyunSu/FinalWebProject\" style=\"text-decoration-line: none;\"><span style=\"font-size: 10pt; font-family: Gulim; color: rgb(0, 0, 255); font-variant-numeric: normal; font-variant-east-asian: normal; text-decoration-line: underline; text-decoration-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;\">https://github.com/KingHyunSu/FinalWebProject</span></a></span>&nbsp;</p>','2019-12-13','admin',NULL),(9,'IoT 드론 제어 프로젝트 드론 제어 소스는 https://github.com/lms0577/DroneProject 에 있습니다.','<p>드론 제어(GCS) 소스 URL(Github) :</p><p>&nbsp;</p><p><span id=\"docs-internal-guid-732f4733-7fff-ecde-299a-95a9e600e920\"><a href=\"https://github.com/lms0577/DroneProject\" style=\"text-decoration-line: none;\"><span style=\"font-size: 10pt; font-family: Gulim; color: rgb(0, 0, 255); font-variant-numeric: normal; font-variant-east-asian: normal; text-decoration-line: underline; text-decoration-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;\">https://github.com/lms0577/DroneProject</span></a></span>&nbsp;</p>','2019-12-13','admin',NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `rank_no` int(3) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(20) NOT NULL,
  PRIMARY KEY (`rank_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES (1,'이사'),(2,'부장'),(3,'과장'),(4,'대리'),(5,'주임'),(6,'사원');
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
  `subject` varchar(50) NOT NULL,
  `startDate` varchar(20) NOT NULL,
  `endDate` varchar(20) NOT NULL,
  `memo` varchar(500) NOT NULL,
  `id` varchar(20) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `schedule_member_fk_idx` (`id`),
  CONSTRAINT `schedule_member_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (4,'자바 공부하기','2019-12-13','2019-12-21','파이팅','user1'),(5,'공부 공부 공부!!','2019-12-25','2019-12-13','공부','admin'),(6,'공부하기','2019-12-13','2019-12-17','공부하기','admin');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign`
--

DROP TABLE IF EXISTS `sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign` (
  `sign_no` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `state_no` int(3) DEFAULT NULL,
  `id` varchar(20) NOT NULL,
  PRIMARY KEY (`sign_no`),
  KEY `member_state_no_fk_idx` (`state_no`),
  KEY `member_sign_member_fk_idx` (`id`),
  CONSTRAINT `sign_member_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sign_state_fk` FOREIGN KEY (`state_no`) REFERENCES `state` (`state_no`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign`
--

LOCK TABLES `sign` WRITE;
/*!40000 ALTER TABLE `sign` DISABLE KEYS */;
INSERT INTO `sign` VALUES (18,'화장지 구입 결제 바랍니다.','화장실에 휴지가 없어요.','2019-12-13',2,'user1'),(19,'사내 안마의자 구입 관련 결제 바랍니다.','어깨가 너무 아파요.','2019-12-13',1,'user1'),(20,'퇴근 시켜주십시오.','ㅈㄱㄴ','2019-12-13',1,'user2'),(21,'마치고 pc방 가실래요?','밤샘 ㄱ','2019-12-13',1,'user2'),(22,'퇴사하겠습니다.','ㅈㄱㄴ','2019-12-13',1,'user2');
/*!40000 ALTER TABLE `sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign_path`
--

DROP TABLE IF EXISTS `sign_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_path` (
  `sign_no` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `date` date DEFAULT NULL,
  `state_no` int(3) NOT NULL,
  `rank_no` int(3) NOT NULL,
  `dept_no` int(3) NOT NULL,
  `id` varchar(20) NOT NULL,
  KEY `state_fk` (`state_no`),
  KEY `fk_sign_path_rank1_idx` (`rank_no`),
  KEY `fk_sign_path_dept1_idx` (`dept_no`),
  CONSTRAINT `sign_path_dept_fk` FOREIGN KEY (`dept_no`) REFERENCES `dept` (`dept_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sign_path_rank_fk` FOREIGN KEY (`rank_no`) REFERENCES `rank` (`rank_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sign_path_state_fk` FOREIGN KEY (`state_no`) REFERENCES `state` (`state_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_path`
--

LOCK TABLES `sign_path` WRITE;
/*!40000 ALTER TABLE `sign_path` DISABLE KEYS */;
INSERT INTO `sign_path` VALUES (18,'김현수','2019-12-13',2,1,9,'admin'),(18,'김찬수','2019-12-13',2,3,9,'user2'),(19,'마석대',NULL,1,2,2,'user9'),(19,'서팔광',NULL,1,2,1,'user8'),(20,'김현수',NULL,1,1,9,'user1'),(20,'김민수',NULL,1,2,9,'admin'),(20,'박광수',NULL,1,6,9,'admin'),(21,'이덕수',NULL,1,2,10,'user4'),(21,'안소영',NULL,1,2,11,'user5'),(22,'마풍강',NULL,1,3,7,'user10'),(22,'이덕수',NULL,1,2,10,'user4'),(22,'김현수',NULL,1,1,9,'admin'),(22,'안소영',NULL,1,2,11,'user5');
/*!40000 ALTER TABLE `sign_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_no` int(3) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(20) NOT NULL,
  PRIMARY KEY (`state_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'결재 대기'),(2,'결재');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-13 22:20:33
