-- MySQL dump 10.13  Distrib 5.7.14, for osx10.11 (x86_64)
--
-- Host: localhost    Database: test_result_notifier
-- ------------------------------------------------------
-- Server version 5.7.14

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
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('00000000000001','jhipster','classpath:config/liquibase/changelog/00000000000000_initial_schema.xml','2016-10-23 16:01:01',1,'EXECUTED','7:c962f621df488c2419ca7d991c18f12c','createTable, createIndex (x2), createTable (x2), addPrimaryKey, createTable, addForeignKeyConstraint (x3), loadData, dropDefaultValue, loadData (x2), createTable (x2), addPrimaryKey, createIndex (x2), addForeignKeyConstraint','',NULL,'3.4.2',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_authority`
--

DROP TABLE IF EXISTS `jhi_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_authority`
--

LOCK TABLES `jhi_authority` WRITE;
/*!40000 ALTER TABLE `jhi_authority` DISABLE KEYS */;
INSERT INTO `jhi_authority` VALUES ('ROLE_ADMIN'),('ROLE_STUDENT'),('ROLE_TEACHER'),('ROLE_USER');
/*!40000 ALTER TABLE `jhi_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_persistent_audit_event`
--

DROP TABLE IF EXISTS `jhi_persistent_audit_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_persistent_audit_event` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_audit_event`
--

LOCK TABLES `jhi_persistent_audit_event` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_audit_event` DISABLE KEYS */;
INSERT INTO `jhi_persistent_audit_event` VALUES (1,'admin','2016-10-23 23:06:15','AUTHENTICATION_SUCCESS');
/*!40000 ALTER TABLE `jhi_persistent_audit_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_persistent_audit_evt_data`
--

DROP TABLE IF EXISTS `jhi_persistent_audit_evt_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_persistent_audit_evt_data` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_audit_evt_data`
--

LOCK TABLES `jhi_persistent_audit_evt_data` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` DISABLE KEYS */;
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (1,'remoteAddress','0:0:0:0:0:0:0:1'),(1,'sessionId','zAectfmTiH-_rp-kHssb1RuyL6o_zlO5Pbr0ItpW');
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_persistent_token`
--

DROP TABLE IF EXISTS `jhi_persistent_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_persistent_token` (
  `series` varchar(76) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `token_value` varchar(76) NOT NULL,
  `token_date` date DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`series`),
  KEY `fk_user_persistent_token` (`user_id`),
  CONSTRAINT `fk_user_persistent_token` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_token`
--

LOCK TABLES `jhi_persistent_token` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_token` DISABLE KEYS */;
INSERT INTO `jhi_persistent_token` VALUES ('mBbVzng2yLOVIkkmhWiC1g==',3,'Xwo/1vwgInZGBNqQRcvYtw==','2016-10-23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
/*!40000 ALTER TABLE `jhi_persistent_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_user`
--

DROP TABLE IF EXISTS `jhi_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(5) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `idx_user_login` (`login`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user`
--

LOCK TABLES `jhi_user` WRITE;
/*!40000 ALTER TABLE `jhi_user` DISABLE KEYS */;
INSERT INTO `jhi_user` VALUES (1,'system','$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG','System','System','system@localhost','','en',NULL,NULL,'system','2016-10-23 23:01:01',NULL,'system',NULL),(2,'anonymoususer','$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO','Anonymous','User','anonymous@localhost','','en',NULL,NULL,'system','2016-10-23 23:01:01',NULL,'system',NULL),(3,'admin','$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC','Administrator','Administrator','admin@localhost','','en',NULL,NULL,'system','2016-10-23 23:01:01',NULL,'system',NULL),(4,'user','$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K','User','User','user@localhost','','en',NULL,NULL,'system','2016-10-23 23:01:01',NULL,'system',NULL),(5,'mpacquiao@gmail.com','$2a$10$Gc4SZf7/.yFAo1QLvTE1PesOXMTt7VGopaqjsDHE5S3qUO.lqhbTe','Manny','Pacquiao','mpacquiao@gmail.com','','en',NULL,'75407074887062776217','admin','2016-10-23 23:07:27','2016-10-23 23:07:27','admin','2016-10-23 23:07:27'),(6,'kperry@email.com','$2a$10$LTPuIMxeBP81QezCaCfQe.6iy4lP3P27Zx8D3.YF5RXTtAMw26vx2','Katy','Perry','kperry@email.com','','en',NULL,'91729051328211151020','admin','2016-10-23 23:07:50','2016-10-23 23:07:50','admin','2016-10-23 23:07:50'),(7,'blee@email.com','$2a$10$AEw13HelV1cgi997dj727uuhGwJSWNPj898hOsc7SaQFNKiFwOrcS','Bruce','Lee','blee@email.com','','en',NULL,'81252543041415034526','admin','2016-10-23 23:08:10','2016-10-23 23:08:10','admin','2016-10-23 23:08:10'),(8,'lskywalker@email.com','$2a$10$stGfdgbWUECZ80p.cfkeQu0HZ7n/FNzpiNxa8Yb9SsF/TDMXlICza','Luke','Skywalker','lskywalker@email.com','','en',NULL,'44514378244567100822','admin','2016-10-23 23:10:01','2016-10-23 23:10:01','admin','2016-10-23 23:10:01'),(9,'tstark@email.com','$2a$10$htDh.guiQVttGcMr/n4dXuN7NzRQNxTG78GiyDg7NBeQh70lthG.i','Tony','Stark','tstark@email.com','','en',NULL,'47781629431260478705','admin','2016-10-23 23:10:26','2016-10-23 23:10:26','admin','2016-10-23 23:10:26'),(10,'jlouie@email.com','$2a$10$LpnTKTmqmk8vfuPLPBa.Eul3nt0RUfp2LYk0D/uqbHxcgMQ.p3tNy','Joe','Louie','jlouie@email.com','','en',NULL,'67088095640957213661','admin','2016-10-23 23:11:06','2016-10-23 23:11:06','admin','2016-10-23 23:11:06'),(11,'mstenson','$2a$10$TR/gTUynPLbKszLjOheaPO5tCxIeTKxpuFEltIXGjadiIGKJ6Uj9S','Mary','Stenson','mstenson@email.com','','en',NULL,'73855615028266256107','admin','2016-10-23 23:11:44','2016-10-23 23:11:44','admin','2016-10-23 23:11:44'),(12,'aclark@email.com','$2a$10$t1loBiCQUohbc0hVufGhGuT/zpwHQNaw7i69M5LNIwV8C4cCBDXau','Amanda','Clark','aclark@email.com','','en',NULL,'90879689302503360378','admin','2016-10-23 23:12:01','2016-10-23 23:12:01','admin','2016-10-23 23:12:01'),(13,'pchandra@email.com','$2a$10$VHq9kiOQqOe44YyYqyx8MOBze7GF55uqASfVzoQv5MkCo2/sjOnoC','Priyanka','Chandra','pchandra@email.com','','en',NULL,'35300517527741531001','admin','2016-10-23 23:12:27','2016-10-23 23:12:27','admin','2016-10-23 23:12:27'),(14,'gkingston@email.com','$2a$10$d9ziMAiUYIHQGBPbnB41Wu8aEm1QI9ZlWZTarG71zMGXMw8csHHIq','George','Kingston','gkingston@email.com','','en',NULL,'39200359982856717423','admin','2016-10-23 23:13:05','2016-10-23 23:13:05','admin','2016-10-23 23:13:05'),(15,'dlahat@email.com','$2a$10$Shn6Km6XlwagblbEipTPTuAtS/RxFBgRyfh5QVZZfN2oC7oiS/o5y','Diane','Lahat','dlahat@email.com','','en',NULL,'52578410418072573177','admin','2016-10-23 23:13:48','2016-10-23 23:13:48','admin','2016-10-23 23:13:48'),(16,'tyamada@email.com','$2a$10$DAi.UPtJmjsMt5UeXLnQuOmDZDQb0QK6tYoUdFHu/ShTCOhQ9yNBu','Takehiro','Yamada','tyamada@email.com','','en',NULL,'58584217163234290113','admin','2016-10-23 23:14:32','2016-10-23 23:14:32','admin','2016-10-23 23:14:32'),(17,'ljillings@email.com','$2a$10$ZqOJ4nxYnIJPeSmGXWL20u75YI4XITnSmKu3bwMdsCsM1hqVgeMRC','Lou','Jillings','ljillings@email.com','','en',NULL,'86761596745542298736','admin','2016-10-23 23:15:06','2016-10-23 23:15:06','admin','2016-10-23 23:15:06'),(18,'irosenthal@email.com','$2a$10$08FgnvTodPI.xUu/exQHtua8v96lSldXQMrY/DenIfCCE.d3WvhKu','Ian','Rosenthal','irosenthal@email.com','','en',NULL,'94907655042900406444','admin','2016-10-23 23:15:54','2016-10-23 23:15:54','admin','2016-10-23 23:15:54'),(19,'jclay@email.com','$2a$10$3Zh15xTQGQopLVNirmKvYeW34/VgEoaShLHoyME5kQeVZaEMYDJ82','Jamie','Clay','jclay@email.com','','en',NULL,'15358200272080637905','admin','2016-10-23 23:16:17','2016-10-23 23:16:17','admin','2016-10-23 23:16:17'),(20,'eguererro','$2a$10$50yPmIdDVUC5P/8KpVT9Y.cHsWkxYEp9qXkf0LjjZqbQjxta5J4OK','Erica','Guererro','eguererro@email.com','','en',NULL,'07555326816131602693','admin','2016-10-23 23:16:43','2016-10-23 23:16:43','admin','2016-10-23 23:16:43'),(21,'vpetrovsky@email.com','$2a$10$IQIrI9FBkawSvGasAdIS7uoSjv5yhiQN32w3vc1HcDdZp32vwjDE.','Vladimir','Petrovsky','vpetrovsky@email.com','','en',NULL,'54684694084823123562','admin','2016-10-23 23:17:38','2016-10-23 23:17:38','admin','2016-10-23 23:17:38'),(22,'lcallings@email.com','$2a$10$GlxUiemNnODAHUfAsE8pQumspyj3fpIdTC1mTpvBaHAvsYRDYOMBC','Lisa','Callings','lcallings@email.com','','en',NULL,'17882551021969325904','admin','2016-10-23 23:18:21','2016-10-23 23:18:21','admin','2016-10-23 23:18:21'),(23,'jkim@email.com','$2a$10$DWImN2hT4l33kHlIFXt05.43YYcPZe6Fa0Mgb8rNS58bpj9DyVvTO','Jeff','Kim','jkim@email.com','','en',NULL,'33740710024395995789','admin','2016-10-23 23:20:23','2016-10-23 23:20:23','admin','2016-10-23 23:20:23'),(24,'ykim@email.com','$2a$10$p09oU1qiY2nZyLWMY4OTc.POIOCjBybi12NqUOMw5jK54knQdpXQe','Yoon','Kim','ykim@email.com','','en',NULL,'41611075698062082888','admin','2016-10-23 23:20:53','2016-10-23 23:20:53','admin','2016-10-23 23:20:53'),(25,'skishima@email.com','$2a$10$FHVszUwW13fabR0LSNebRe9DbczW.CWEy1tYQMQzqSD2FmtOU.brG','Saki','Kishima','skishima@email.com','','en',NULL,'36839879722804398132','admin','2016-10-23 23:21:21','2016-10-23 23:21:21','admin','2016-10-23 23:21:21'),(26,'aagarwal','$2a$10$QQNALBy9m3UeYWYaBNXeRulTVWz7aOHzDF.n/NtKJW2wTM8WwLEB2','Aditi','Agarwal','aagarwal@email.com','','en',NULL,'04312178380233597082','admin','2016-10-23 23:23:56','2016-10-23 23:23:56','admin','2016-10-23 23:23:56'),(27,'trollins@email.com','$2a$10$Ohr/UXMXG6DUvI2okc3QteXMK7SkzyoOE7kbR8Hduv9eyrEa16zra','Tim','Rollins','trollins@email.com','','en',NULL,'35662430058080039868','admin','2016-10-23 23:24:19','2016-10-23 23:24:19','admin','2016-10-23 23:24:19'),(28,'hchan@email.com','$2a$10$Xxfx3YW2jrADnpYq0qb/u.0oOrvigPy0cLWaYa6g.YVgx/n45tjS2','Heather','Chan','hchan@email.com','','en',NULL,'52425121491999360567','admin','2016-10-23 23:24:39','2016-10-23 23:24:39','admin','2016-10-23 23:24:39'),(29,'jdaniels@email.com','$2a$10$P2qBK1MbEAt6YhGkrgBVX.vMm/xP4Ed6u5A0x.OzmThXANBwk8PXG','Joe','Daniels','jdaniels@email.com','','en',NULL,'21154704810173177528','admin','2016-10-23 23:25:17','2016-10-23 23:25:17','admin','2016-10-23 23:25:17'),(30,'bflorence@email.com','$2a$10$aX7yXdUOpFGMG7vlxHf9rOJ6o2ovmy2mN65pN/ew6h8HmU3D9ofWe','Britany','Florence','bflorence@email.com','','en',NULL,'34282748278437511134','admin','2016-10-23 23:26:20','2016-10-23 23:26:20','admin','2016-10-23 23:26:20'),(31,'hgoh','$2a$10$GhG9fkswebxtyHCDG/P6QeZOKhRsFpSwWr0WsW/XlIbNMGGJlYY1a','Henson','Goh','hgoh@email.com','','en',NULL,'84324841158842243773','admin','2016-10-23 23:27:02','2016-10-23 23:27:02','admin','2016-10-23 23:27:02'),(32,'jlien@email.com','$2a$10$BTuWH0vhPQdGH68jD.NtJO/3PXJVaSlwSBdWbOOrnrSOm3YHwbiJS','Jenny','Lien','jlien@email.com','','en',NULL,'75399527577016443944','admin','2016-10-23 23:27:36','2016-10-23 23:27:36','admin','2016-10-23 23:27:36'),(33,'lfogarty@email.com','$2a$10$rLBjIavFSBodnVWAeSDxPu/LMVWMjaEgWeo2TC0qPdvftJ9rjj7gK','Lucy','Fogarty','lfogarty@email.com','','en',NULL,'16047692753899506400','admin','2016-10-23 23:28:22','2016-10-23 23:28:22','admin','2016-10-23 23:28:22'),(34,'ywatanabe@email.com','$2a$10$C4TNogSmglSDgRXjcBF0m.RH8zdNdoN6PcC8BPo3SdaQ6CHwOVvbC','Yusuke','Watanabe','ywatanabe@email.com','','en',NULL,'87001313587676629722','admin','2016-10-23 23:29:12','2016-10-23 23:29:12','admin','2016-10-23 23:29:12');
/*!40000 ALTER TABLE `jhi_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_user_authority`
--

DROP TABLE IF EXISTS `jhi_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user_authority`
--

LOCK TABLES `jhi_user_authority` WRITE;
/*!40000 ALTER TABLE `jhi_user_authority` DISABLE KEYS */;
INSERT INTO `jhi_user_authority` VALUES (1,'ROLE_ADMIN'),(3,'ROLE_ADMIN'),(10,'ROLE_STUDENT'),(11,'ROLE_STUDENT'),(12,'ROLE_STUDENT'),(13,'ROLE_STUDENT'),(14,'ROLE_STUDENT'),(15,'ROLE_STUDENT'),(16,'ROLE_STUDENT'),(17,'ROLE_STUDENT'),(18,'ROLE_STUDENT'),(19,'ROLE_STUDENT'),(20,'ROLE_STUDENT'),(21,'ROLE_STUDENT'),(22,'ROLE_STUDENT'),(23,'ROLE_STUDENT'),(24,'ROLE_STUDENT'),(25,'ROLE_STUDENT'),(26,'ROLE_STUDENT'),(27,'ROLE_STUDENT'),(28,'ROLE_STUDENT'),(29,'ROLE_STUDENT'),(30,'ROLE_STUDENT'),(31,'ROLE_STUDENT'),(32,'ROLE_STUDENT'),(33,'ROLE_STUDENT'),(34,'ROLE_STUDENT'),(5,'ROLE_TEACHER'),(6,'ROLE_TEACHER'),(7,'ROLE_TEACHER'),(8,'ROLE_TEACHER'),(9,'ROLE_TEACHER'),(1,'ROLE_USER'),(3,'ROLE_USER'),(4,'ROLE_USER'),(5,'ROLE_USER'),(6,'ROLE_USER'),(7,'ROLE_USER'),(8,'ROLE_USER'),(9,'ROLE_USER'),(10,'ROLE_USER'),(11,'ROLE_USER'),(12,'ROLE_USER'),(13,'ROLE_USER'),(14,'ROLE_USER'),(15,'ROLE_USER'),(16,'ROLE_USER'),(17,'ROLE_USER'),(18,'ROLE_USER'),(19,'ROLE_USER'),(20,'ROLE_USER'),(21,'ROLE_USER'),(22,'ROLE_USER'),(23,'ROLE_USER'),(24,'ROLE_USER'),(25,'ROLE_USER'),(26,'ROLE_USER'),(27,'ROLE_USER'),(28,'ROLE_USER'),(29,'ROLE_USER'),(30,'ROLE_USER'),(31,'ROLE_USER'),(32,'ROLE_USER'),(33,'ROLE_USER'),(34,'ROLE_USER');
/*!40000 ALTER TABLE `jhi_user_authority` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-23 16:35:19
