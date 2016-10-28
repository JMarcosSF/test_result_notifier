-- MySQL dump 10.13  Distrib 5.7.14, for osx10.11 (x86_64)
--
-- Host: localhost    Database: test_result_notifier
-- ------------------------------------------------------
-- Server version	5.7.14

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
INSERT INTO `DATABASECHANGELOG` VALUES ('00000000000001','jhipster','classpath:config/liquibase/changelog/00000000000000_initial_schema.xml','2016-10-23 16:01:01',1,'EXECUTED','7:c962f621df488c2419ca7d991c18f12c','createTable, createIndex (x2), createTable (x2), addPrimaryKey, createTable, addForeignKeyConstraint (x3), loadData, dropDefaultValue, loadData (x2), createTable (x2), addPrimaryKey, createIndex (x2), addForeignKeyConstraint','',NULL,'3.4.2',NULL,NULL),('20161026222217-1','jhipster','classpath:config/liquibase/changelog/20161026222217_added_entity_Course.xml','2016-10-26 17:37:20',2,'EXECUTED','7:d7eb460ba383309a8b21cef244631f69','createTable (x2), addPrimaryKey','',NULL,'3.4.2',NULL,NULL),('20161026222521-1','jhipster','classpath:config/liquibase/changelog/20161026222521_added_entity_ExamResult.xml','2016-10-26 17:37:20',3,'EXECUTED','7:95ca5e321e65b2516f0ca623fc20d953','createTable (x2), addPrimaryKey, createTable, addPrimaryKey','',NULL,'3.4.2',NULL,NULL),('20161026222618-1','jhipster','classpath:config/liquibase/changelog/20161026222618_added_entity_Exam.xml','2016-10-26 17:37:20',4,'EXECUTED','7:44a5aed9f0444853f30ab3868eb2e473','createTable','',NULL,'3.4.2',NULL,NULL),('20161026222729-1','jhipster','classpath:config/liquibase/changelog/20161026222729_added_entity_Question.xml','2016-10-26 17:37:20',5,'EXECUTED','7:a8d36f4b5357d6c56c7023cea1c76734','createTable','',NULL,'3.4.2',NULL,NULL),('20161026222835-1','jhipster','classpath:config/liquibase/changelog/20161026222835_added_entity_Answer.xml','2016-10-26 17:37:20',6,'EXECUTED','7:dea7e75b8be89fe638663fc0fb7e0571','createTable','',NULL,'3.4.2',NULL,NULL),('20161026222217-2','jhipster','classpath:config/liquibase/changelog/20161026222217_added_entity_constraints_Course.xml','2016-10-26 17:37:20',7,'EXECUTED','7:c4ce018289a917f97942b29fc3768e4a','addForeignKeyConstraint (x3)','',NULL,'3.4.2',NULL,NULL),('20161026222521-2','jhipster','classpath:config/liquibase/changelog/20161026222521_added_entity_constraints_ExamResult.xml','2016-10-26 17:37:20',8,'EXECUTED','7:40857baf6a563c349f1be5e893e5aa12','addForeignKeyConstraint (x7)','',NULL,'3.4.2',NULL,NULL),('20161026222618-2','jhipster','classpath:config/liquibase/changelog/20161026222618_added_entity_constraints_Exam.xml','2016-10-26 17:37:20',9,'EXECUTED','7:20e33de9f24d21d695fcfcb4066a4fe7','addForeignKeyConstraint','',NULL,'3.4.2',NULL,NULL),('20161026222729-2','jhipster','classpath:config/liquibase/changelog/20161026222729_added_entity_constraints_Question.xml','2016-10-26 17:37:20',10,'EXECUTED','7:1b9f39ddbb79a3db9c215b6f4449db3d','addForeignKeyConstraint','',NULL,'3.4.2',NULL,NULL),('20161026222835-2','jhipster','classpath:config/liquibase/changelog/20161026222835_added_entity_constraints_Answer.xml','2016-10-26 17:37:20',11,'EXECUTED','7:c1b8fffd630ad5379dbbb061159dcf88','addForeignKeyConstraint','',NULL,'3.4.2',NULL,NULL);
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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `is_correct` bit(1) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_answer_question_id` (`question_id`),
  CONSTRAINT `fk_answer_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,'2','',1),(2,'13','\0',1),(3,'54','\0',1),(4,'undefined','',2),(5,'1','\0',2),(6,'9','',3),(7,'12','\0',3),(8,'43','\0',3),(9,'A dessert','\0',4),(10,'The ratio of the Circumference  to the Diameter  of a Circle.','',4),(11,'2','',5),(12,'4','\0',5),(13,'René Descartes','',10),(14,'Tupac Shakur','\0',10),(15,'Dale Carnegie','',9),(16,'Eric Bishoff','\0',9),(17,'Lady Chatterley\'s Lover (by D H Lawrence)','',8),(18,'The Anarchist\'s Cookbook','\0',8),(19,'Lord Alfred Tennyson (1809-92)','',7),(20,'Sir Maxwell Helmsley','\0',7),(21,'Novella','',6),(22,'Eureka','\0',6),(23,'George Washington','',11),(24,'John Adams','\0',11),(25,'13','',12),(26,'11','\0',12),(27,'7','\0',12),(28,'The Revolutionary War','\0',13),(29,'The American Civil War','',13),(30,'Ulysses S. Grant','\0',14),(31,'Andrew Jackson','\0',14),(32,'Abraham Lincoln','',14),(33,'William McKinley','\0',15),(34,'Grover Cleveland','',15),(35,'Action of ultraviolet light from the sun on atmospheric oxygen.','\0',16),(36,'Action of solar radiations particularly cosmic rays on carbon dioxide present in the atmosphere','\0',16),(37,'Collision between fast neutrons and nitrogen nuclei present in the atmosphere','',16),(38,'Work done in rolling a stone is less than in lifting it.','',17),(39,'Work done in lifting the stone is equal to rolling it','\0',17),(40,'Diffusion of ink through the blotting','\0',18),(41,'capillary action phenomenon','',18),(42,'Viscosity of ink.','\0',18),(43,'The level of the liquid in the two vessels are at the same height','',19),(44,'The densities of the liquid in the two vessels are equal','\0',19),(45,'Hysteresis loss alone.','\0',20),(46,'Intense sunlight at noon.','\0',20),(47,'Both the heating effect of current and hysteresis loss.','',20),(48,'Deuterium','\0',25),(49,'Protium','',25),(50,'Hydrogen only has one isotope!','\0',25),(51,'Chlorine','',24),(52,'Krypton','\0',24),(53,'Helium','\0',24),(54,'Argon','\0',24),(55,'Neutral','\0',23),(56,'Strong Acid','\0',23),(57,'Slightly Acidic','',23),(58,'Milk does not have a pH','\0',23),(59,'Slightly Basic','\0',23),(60,'Samarium','\0',22),(61,'Tin','\0',22),(62,'Seaborgium','\0',22),(63,'Arsenic','\0',22),(64,'Antimony','',22),(65,'250 grams','',21),(66,'500 grams','\0',21),(67,'practically none','\0',21);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `teacher_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_course_teacher_id` (`teacher_id`),
  CONSTRAINT `fk_course_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Mathemathics',5),(2,'Literature',6),(3,'U.S. History',7),(4,'Physics',8),(5,'Chemistry',9);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_student`
--

DROP TABLE IF EXISTS `course_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_student` (
  `students_id` bigint(20) NOT NULL,
  `courses_id` bigint(20) NOT NULL,
  PRIMARY KEY (`courses_id`,`students_id`),
  KEY `fk_course_student_students_id` (`students_id`),
  CONSTRAINT `fk_course_student_courses_id` FOREIGN KEY (`courses_id`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_course_student_students_id` FOREIGN KEY (`students_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_student`
--

LOCK TABLES `course_student` WRITE;
/*!40000 ALTER TABLE `course_student` DISABLE KEYS */;
INSERT INTO `course_student` VALUES (10,1),(10,3),(11,1),(11,4),(12,1),(12,3),(13,1),(13,4),(14,1),(14,3),(15,1),(15,4),(16,1),(16,3),(17,1),(17,4),(18,1),(18,3),(19,1),(19,4),(20,3),(20,5),(21,4),(21,5),(22,3),(22,5),(23,4),(23,5),(24,2),(24,3),(24,5),(25,2),(25,4),(25,5),(26,2),(26,3),(26,5),(27,4),(27,5),(28,2),(28,3),(28,5),(29,2),(29,4),(29,5),(30,2),(31,2),(32,2),(33,2),(34,2);
/*!40000 ALTER TABLE `course_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_exam_course_id` (`course_id`),
  CONSTRAINT `fk_exam_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'Math Exam 1',1),(2,'Literature Exam 1',2),(3,'U.S. History Exam 1',3),(4,'Physics Exam 1',4),(5,'Chemistry Exam 1',5);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_result`
--

DROP TABLE IF EXISTS `exam_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `exam_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_exam_result_student_id` (`student_id`),
  KEY `fk_exam_result_course_id` (`course_id`),
  KEY `fk_exam_result_exam_id` (`exam_id`),
  CONSTRAINT `fk_exam_result_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_exam_result_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `fk_exam_result_student_id` FOREIGN KEY (`student_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result`
--

LOCK TABLES `exam_result` WRITE;
/*!40000 ALTER TABLE `exam_result` DISABLE KEYS */;
INSERT INTO `exam_result` VALUES (1,13,1,1),(2,16,1,1),(3,18,1,1),(4,32,2,2);
/*!40000 ALTER TABLE `exam_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_result_answer`
--

DROP TABLE IF EXISTS `exam_result_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_result_answer` (
  `answers_id` bigint(20) NOT NULL,
  `exam_results_id` bigint(20) NOT NULL,
  PRIMARY KEY (`exam_results_id`,`answers_id`),
  KEY `fk_exam_result_answer_answers_id` (`answers_id`),
  CONSTRAINT `fk_exam_result_answer_answers_id` FOREIGN KEY (`answers_id`) REFERENCES `answer` (`id`),
  CONSTRAINT `fk_exam_result_answer_exam_results_id` FOREIGN KEY (`exam_results_id`) REFERENCES `exam_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result_answer`
--

LOCK TABLES `exam_result_answer` WRITE;
/*!40000 ALTER TABLE `exam_result_answer` DISABLE KEYS */;
INSERT INTO `exam_result_answer` VALUES (1,1),(1,2),(1,3),(4,1),(4,2),(4,3),(6,1),(6,2),(7,3),(9,3),(10,1),(10,2),(11,1),(11,2),(12,3),(14,4),(15,4),(17,4),(19,4),(21,4);
/*!40000 ALTER TABLE `exam_result_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_result_question`
--

DROP TABLE IF EXISTS `exam_result_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_result_question` (
  `questions_id` bigint(20) NOT NULL,
  `exam_results_id` bigint(20) NOT NULL,
  PRIMARY KEY (`exam_results_id`,`questions_id`),
  KEY `fk_exam_result_question_questions_id` (`questions_id`),
  CONSTRAINT `fk_exam_result_question_exam_results_id` FOREIGN KEY (`exam_results_id`) REFERENCES `exam_result` (`id`),
  CONSTRAINT `fk_exam_result_question_questions_id` FOREIGN KEY (`questions_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result_question`
--

LOCK TABLES `exam_result_question` WRITE;
/*!40000 ALTER TABLE `exam_result_question` DISABLE KEYS */;
INSERT INTO `exam_result_question` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(6,4),(7,4),(8,4),(9,4),(10,4);
/*!40000 ALTER TABLE `exam_result_question` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_audit_event`
--

LOCK TABLES `jhi_persistent_audit_event` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_audit_event` DISABLE KEYS */;
INSERT INTO `jhi_persistent_audit_event` VALUES (1,'admin','2016-10-23 23:06:15','AUTHENTICATION_SUCCESS'),(2,'null','2016-10-27 00:43:32','AUTHENTICATION_FAILURE'),(3,'admin','2016-10-27 00:44:27','AUTHENTICATION_SUCCESS'),(4,'null','2016-10-27 00:44:28','AUTHENTICATION_FAILURE'),(5,'admin','2016-10-27 00:44:43','AUTHENTICATION_SUCCESS'),(6,'null','2016-10-27 00:44:44','AUTHENTICATION_FAILURE'),(7,'admin','2016-10-27 00:44:54','AUTHENTICATION_SUCCESS'),(8,'null','2016-10-27 00:44:55','AUTHENTICATION_FAILURE'),(9,'null','2016-10-27 00:45:13','AUTHENTICATION_FAILURE'),(10,'null','2016-10-27 00:45:42','AUTHENTICATION_FAILURE'),(11,'admin','2016-10-27 00:45:42','AUTHENTICATION_SUCCESS'),(12,'null','2016-10-27 00:45:46','AUTHENTICATION_FAILURE'),(13,'admin','2016-10-27 00:46:09','AUTHENTICATION_SUCCESS'),(14,'null','2016-10-27 00:46:10','AUTHENTICATION_FAILURE'),(15,'admin','2016-10-27 00:46:38','AUTHENTICATION_SUCCESS'),(16,'null','2016-10-27 00:46:39','AUTHENTICATION_FAILURE'),(17,'admin','2016-10-27 00:47:11','AUTHENTICATION_SUCCESS'),(18,'mpacquiao@gmail.com','2016-10-27 03:40:40','AUTHENTICATION_FAILURE'),(19,'mpacquiao@gmail.com','2016-10-27 03:40:48','AUTHENTICATION_FAILURE'),(20,'mpacquiao@gmail.com','2016-10-27 03:46:36','AUTHENTICATION_SUCCESS'),(21,'mpacquiao@gmail.com','2016-10-27 04:01:54','AUTHENTICATION_SUCCESS'),(22,'mpacquiao@gmail.com','2016-10-27 05:45:48','AUTHENTICATION_SUCCESS'),(23,'mpacquiao@gmail.com','2016-10-27 06:00:10','AUTHENTICATION_SUCCESS'),(24,'admin','2016-10-27 06:00:19','AUTHENTICATION_SUCCESS'),(25,'mpacquiao@gmail.com','2016-10-27 06:03:37','AUTHENTICATION_SUCCESS'),(26,'admin','2016-10-27 07:31:25','AUTHENTICATION_SUCCESS'),(27,'mpacquiao@gmail.com','2016-10-27 07:33:09','AUTHENTICATION_SUCCESS'),(28,'admin','2016-10-27 07:34:15','AUTHENTICATION_SUCCESS'),(29,'kperry@email.com','2016-10-27 08:01:47','AUTHENTICATION_SUCCESS'),(30,'kperry@email.com','2016-10-27 08:04:48','AUTHENTICATION_SUCCESS'),(31,'mpacquiao@gmail.com','2016-10-27 08:15:20','AUTHENTICATION_SUCCESS'),(32,'mpacquiao@gmail.com','2016-10-27 09:48:57','AUTHENTICATION_SUCCESS'),(33,'mpacquiao@gmail.com','2016-10-27 10:00:46','AUTHENTICATION_SUCCESS'),(34,'kperry@email.com','2016-10-27 10:02:09','AUTHENTICATION_FAILURE'),(35,'kperry@email.com','2016-10-27 10:02:18','AUTHENTICATION_SUCCESS'),(36,'mpacquiao@gmail.com','2016-10-27 20:46:19','AUTHENTICATION_SUCCESS'),(37,'kperry@email.com','2016-10-27 21:00:19','AUTHENTICATION_SUCCESS');
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
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (1,'remoteAddress','0:0:0:0:0:0:0:1'),(1,'sessionId','zAectfmTiH-_rp-kHssb1RuyL6o_zlO5Pbr0ItpW'),(2,'message','Bad credentials'),(2,'remoteAddress','127.0.0.1'),(2,'sessionId','kbb5lnbG-knkp_5eT8Meq-t-NcUaPxvCKbBBxM2C'),(2,'type','org.springframework.security.authentication.BadCredentialsException'),(3,'remoteAddress','127.0.0.1'),(3,'sessionId','uO80V98XldCtsm9Q-3dCJlUEONICBx1lhHZhmqKk'),(4,'message','Bad credentials'),(4,'remoteAddress','127.0.0.1'),(4,'sessionId','uO80V98XldCtsm9Q-3dCJlUEONICBx1lhHZhmqKk'),(4,'type','org.springframework.security.authentication.BadCredentialsException'),(5,'remoteAddress','127.0.0.1'),(5,'sessionId','sWnM1LhtzmCVsXe5x0xceo5RtBPPPDx_56D2Abf-'),(6,'message','Bad credentials'),(6,'remoteAddress','127.0.0.1'),(6,'sessionId','IjQMgYcegXxju3GUd1qL0DswDUZKbB1AO2CtIKTG'),(6,'type','org.springframework.security.authentication.BadCredentialsException'),(7,'remoteAddress','127.0.0.1'),(7,'sessionId','Jns_HsmAiE6mRVyO-2OXGb3tcXFuZhGde4TQ_tKK'),(8,'message','Bad credentials'),(8,'remoteAddress','127.0.0.1'),(8,'sessionId','CUDL7Pzy0HRp9Ha7jfTh2b09LU8qKDP4mNtH6Zyc'),(8,'type','org.springframework.security.authentication.BadCredentialsException'),(9,'message','Bad credentials'),(9,'remoteAddress','127.0.0.1'),(9,'sessionId','HrKPQp-lxrI1AUXtrl47FibuxsEnJbjgqvv9WvnV'),(9,'type','org.springframework.security.authentication.BadCredentialsException'),(10,'message','Bad credentials'),(10,'remoteAddress','127.0.0.1'),(10,'sessionId','Rz0bEbUzfZTxAhob6OLai-J2hqZRtPQwhSIysNtn'),(10,'type','org.springframework.security.authentication.BadCredentialsException'),(11,'remoteAddress','127.0.0.1'),(11,'sessionId','Rz0bEbUzfZTxAhob6OLai-J2hqZRtPQwhSIysNtn'),(12,'message','Bad credentials'),(12,'remoteAddress','127.0.0.1'),(12,'sessionId','WFx0BzTMn5nbUImTZ0HF9wkjOkwTwKQtCiBkz2T8'),(12,'type','org.springframework.security.authentication.BadCredentialsException'),(13,'remoteAddress','127.0.0.1'),(13,'sessionId','y3_4ozm8FGY06zVjcRbidVJBNh5I6QsfKOtbDVfR'),(14,'message','Bad credentials'),(14,'remoteAddress','127.0.0.1'),(14,'sessionId','S50yCN_Na3VN6hP1m6TPJVPh1L8K-4ABKd1QsDqy'),(14,'type','org.springframework.security.authentication.BadCredentialsException'),(15,'remoteAddress','127.0.0.1'),(15,'sessionId','UwKc_WmfS10NF4gCdsIvce99BLnLClTPrCKqGOJw'),(16,'message','Bad credentials'),(16,'remoteAddress','127.0.0.1'),(16,'sessionId','0H7D9AGb-I2pCiP5mh0XeBEaZ7jYUnuphKD-yb8q'),(16,'type','org.springframework.security.authentication.BadCredentialsException'),(17,'remoteAddress','0:0:0:0:0:0:0:1'),(17,'sessionId','01kXY8vCOdF8FIlfO0atVIqm5Qd-oILZX8H6vgep'),(18,'message','Bad credentials'),(18,'remoteAddress','0:0:0:0:0:0:0:1'),(18,'sessionId','xLcu68sN9XZr7ArVo4hI0i1ZDbDGDPp3xNjNvPs5'),(18,'type','org.springframework.security.authentication.BadCredentialsException'),(19,'message','Bad credentials'),(19,'remoteAddress','0:0:0:0:0:0:0:1'),(19,'sessionId','vgAeKQEbqWTToO407BkTiYL7RkiESB9jqZOt4qls'),(19,'type','org.springframework.security.authentication.BadCredentialsException'),(20,'remoteAddress','0:0:0:0:0:0:0:1'),(20,'sessionId','hF5amS8ON4EyRbhPFovggZFPBjtahWkYyq6gJEe_'),(21,'remoteAddress','0:0:0:0:0:0:0:1'),(21,'sessionId','YhpOlLud0fz_zW16xD-xw0YzptIyXi3PQPhyXu-y'),(22,'remoteAddress','0:0:0:0:0:0:0:1'),(22,'sessionId','4W4B-wK6kV3cn1rQ2Wdmf0zf7Dm3OR5Mp67jNxhN'),(23,'remoteAddress','127.0.0.1'),(23,'sessionId','Q-7iB-z5vKRvjB5lTubdYqE6zzOcb7wrCdR8oYVl'),(24,'remoteAddress','127.0.0.1'),(24,'sessionId','6nRqnkIwCrPOHymx0llB1Ptz2MZfSOATGQo0Ae62'),(25,'remoteAddress','127.0.0.1'),(25,'sessionId','DCg_bsfyUZu914OFPLEK2Jw_noMRLdcBbFyPkCMh'),(26,'remoteAddress','127.0.0.1'),(26,'sessionId','SIFRSAsbDrZxD4mcRFu8PGtfllzDApao68KjZahP'),(27,'remoteAddress','127.0.0.1'),(27,'sessionId','-snUbGSSv2YXakb0tAdjjv6hXgAVNUEPt-DkAWGu'),(28,'remoteAddress','127.0.0.1'),(28,'sessionId','EYddra8Q5zNhNQ5vIjSxKSMeZnP5X6kF7GVciDLg'),(29,'remoteAddress','0:0:0:0:0:0:0:1'),(29,'sessionId','MtLK5JYuh_d4sqeDJhP2GxEzhBjH4mSNt23jttcp'),(30,'remoteAddress','127.0.0.1'),(30,'sessionId','gdKuqOEmZJei0hyAQiuP4N5vhPTpQ3NmRD0QjSD4'),(31,'remoteAddress','127.0.0.1'),(31,'sessionId','17V4QoFT4OG5ha-byh9nwAj-FrKutXwXwCqx_KF1'),(32,'remoteAddress','192.168.1.105'),(32,'sessionId','a5xFOEb3wRoruKO-BuJwtFKO-7EZ-aTR_M3ahcEG'),(33,'remoteAddress','192.168.1.105'),(33,'sessionId','8YwTGJKlzyVKjYNSEy67cqbwq0IFL5PWU44cFlTq'),(34,'message','Bad credentials'),(34,'remoteAddress','192.168.1.105'),(34,'sessionId','tEbeU5kkFCgRs38sJmsWdpP7UQR1MLi4KucoxFYq'),(34,'type','org.springframework.security.authentication.BadCredentialsException'),(35,'remoteAddress','192.168.1.105'),(35,'sessionId','sdXgvg8hL2AeV4om1fUqWY0JtzMwYnVrKVlXhUoL'),(36,'remoteAddress','0:0:0:0:0:0:0:1'),(36,'sessionId','JT5os1nfZMALZM_8Doyw_XHYEI47iNvlrdmEYZN8'),(37,'remoteAddress','127.0.0.1'),(37,'sessionId','19qgsDCEVUxxahcwNGgqrgMJTceknzgR2zad-bla');
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
INSERT INTO `jhi_persistent_token` VALUES ('1O7oxXhJYXi77RPBNCsrhg==',3,'garSuRFXRCPhPOzZkdppAA==','2016-10-26','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'),('4AfNStXWcf57vknKKsT7ow==',3,'MaDHtodWcfyCTeVll33QjQ==','2016-10-26','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'),('4DkKm2RGrZiy8+jJk3yjLw==',6,'WufjNarasmOIR7YECgE6hw==','2016-10-27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'),('cYbyNU4zYpLPr+2i7e7DmQ==',3,'zB3wuuUAO3E3hVnihMcM+w==','2016-10-26','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'),('fSfvh4tfGj3Ly5Jp3U7e/g==',3,'A0aR6aA/nUP2XZ5M9J1ckg==','2016-10-26','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'),('JzUMoU039aT2TKDEd9y4Ow==',3,'8nt6Q3yS2HOFAcpZ7X2udg==','2016-10-26','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'),('mBbVzng2yLOVIkkmhWiC1g==',3,'Xwo/1vwgInZGBNqQRcvYtw==','2016-10-23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'),('T1WyB+FkvVd79vWsJIH0JA==',3,'d4nC4NeuHO6v6gppPcTK7w==','2016-10-26','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'),('XpSpI1WySIux+rO00boxCQ==',5,'2x8eZZvmwfUKGQBPdT9/Sw==','2016-10-26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
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
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `idx_user_login` (`login`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user`
--

LOCK TABLES `jhi_user` WRITE;
/*!40000 ALTER TABLE `jhi_user` DISABLE KEYS */;
INSERT INTO `jhi_user` VALUES (1,'system','$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG','System','System','system@localhost','','en',NULL,NULL,'system','2016-10-23 23:01:01',NULL,'system',NULL),(2,'anonymoususer','$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO','Anonymous','User','anonymous@localhost','','en',NULL,NULL,'system','2016-10-23 23:01:01',NULL,'system',NULL),(3,'admin','$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC','Administrator','Administrator','admin@localhost','','en',NULL,NULL,'system','2016-10-23 23:01:01',NULL,'system',NULL),(4,'user','$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K','User','User','user@localhost','','en',NULL,NULL,'system','2016-10-23 23:01:01',NULL,'system',NULL),(5,'mpacquiao@gmail.com','$2a$10$O8oj5RWKQAaNHngAqAUtm.utwgvQy..e0/lG8qEanW9HLLiqhpLL.','Manny','Pacquiao','mpacquiao@gmail.com','','en',NULL,NULL,'admin','2016-10-23 23:07:27',NULL,'anonymousUser','2016-10-27 03:46:27'),(6,'kperry@email.com','$2a$10$uslQaLZasVAqkiSBY06OPOdGoaS1WM/u0BzZj7H5ZyVhrMzSmsNt.','Katy','Perry','kperry@email.com','','en',NULL,NULL,'admin','2016-10-23 23:07:50',NULL,'anonymousUser','2016-10-27 08:01:33'),(7,'blee@email.com','$2a$10$AEw13HelV1cgi997dj727uuhGwJSWNPj898hOsc7SaQFNKiFwOrcS','Bruce','Lee','blee@email.com','','en',NULL,'81252543041415034526','admin','2016-10-23 23:08:10','2016-10-23 23:08:10','admin','2016-10-23 23:08:10'),(8,'lskywalker@email.com','$2a$10$stGfdgbWUECZ80p.cfkeQu0HZ7n/FNzpiNxa8Yb9SsF/TDMXlICza','Luke','Skywalker','lskywalker@email.com','','en',NULL,'44514378244567100822','admin','2016-10-23 23:10:01','2016-10-23 23:10:01','admin','2016-10-23 23:10:01'),(9,'tstark@email.com','$2a$10$htDh.guiQVttGcMr/n4dXuN7NzRQNxTG78GiyDg7NBeQh70lthG.i','Tony','Stark','tstark@email.com','','en',NULL,'47781629431260478705','admin','2016-10-23 23:10:26','2016-10-23 23:10:26','admin','2016-10-23 23:10:26'),(10,'jlouie@email.com','$2a$10$LpnTKTmqmk8vfuPLPBa.Eul3nt0RUfp2LYk0D/uqbHxcgMQ.p3tNy','Joe','Louie','jlouie@email.com','','en',NULL,'67088095640957213661','admin','2016-10-23 23:11:06','2016-10-23 23:11:06','admin','2016-10-23 23:11:06'),(11,'mstenson','$2a$10$TR/gTUynPLbKszLjOheaPO5tCxIeTKxpuFEltIXGjadiIGKJ6Uj9S','Mary','Stenson','mstenson@email.com','','en',NULL,'73855615028266256107','admin','2016-10-23 23:11:44','2016-10-23 23:11:44','admin','2016-10-23 23:11:44'),(12,'aclark@email.com','$2a$10$t1loBiCQUohbc0hVufGhGuT/zpwHQNaw7i69M5LNIwV8C4cCBDXau','Amanda','Clark','aclark@email.com','','en',NULL,'90879689302503360378','admin','2016-10-23 23:12:01','2016-10-23 23:12:01','admin','2016-10-23 23:12:01'),(13,'pchandra@email.com','$2a$10$VHq9kiOQqOe44YyYqyx8MOBze7GF55uqASfVzoQv5MkCo2/sjOnoC','Priyanka','Chandra','pchandra@email.com','','en',NULL,'35300517527741531001','admin','2016-10-23 23:12:27','2016-10-23 23:12:27','admin','2016-10-23 23:12:27'),(14,'gkingston@email.com','$2a$10$d9ziMAiUYIHQGBPbnB41Wu8aEm1QI9ZlWZTarG71zMGXMw8csHHIq','George','Kingston','gkingston@email.com','','en',NULL,'39200359982856717423','admin','2016-10-23 23:13:05','2016-10-23 23:13:05','admin','2016-10-23 23:13:05'),(15,'dlahat@email.com','$2a$10$Shn6Km6XlwagblbEipTPTuAtS/RxFBgRyfh5QVZZfN2oC7oiS/o5y','Diane','Lahat','dlahat@email.com','','en',NULL,'52578410418072573177','admin','2016-10-23 23:13:48','2016-10-23 23:13:48','admin','2016-10-23 23:13:48'),(16,'tyamada@email.com','$2a$10$DAi.UPtJmjsMt5UeXLnQuOmDZDQb0QK6tYoUdFHu/ShTCOhQ9yNBu','Takehiro','Yamada','tyamada@email.com','','en',NULL,'58584217163234290113','admin','2016-10-23 23:14:32','2016-10-23 23:14:32','admin','2016-10-23 23:14:32'),(17,'ljillings@email.com','$2a$10$ZqOJ4nxYnIJPeSmGXWL20u75YI4XITnSmKu3bwMdsCsM1hqVgeMRC','Lou','Jillings','ljillings@email.com','','en',NULL,'86761596745542298736','admin','2016-10-23 23:15:06','2016-10-23 23:15:06','admin','2016-10-23 23:15:06'),(18,'irosenthal@email.com','$2a$10$08FgnvTodPI.xUu/exQHtua8v96lSldXQMrY/DenIfCCE.d3WvhKu','Ian','Rosenthal','irosenthal@email.com','','en',NULL,'94907655042900406444','admin','2016-10-23 23:15:54','2016-10-23 23:15:54','admin','2016-10-23 23:15:54'),(19,'jclay@email.com','$2a$10$3Zh15xTQGQopLVNirmKvYeW34/VgEoaShLHoyME5kQeVZaEMYDJ82','Jamie','Clay','jclay@email.com','','en',NULL,'15358200272080637905','admin','2016-10-23 23:16:17','2016-10-23 23:16:17','admin','2016-10-23 23:16:17'),(20,'eguererro@email.com','$2a$10$50yPmIdDVUC5P/8KpVT9Y.cHsWkxYEp9qXkf0LjjZqbQjxta5J4OK','Erica','Guererro','eguererro@email.com','','en',NULL,'07555326816131602693','admin','2016-10-27 09:08:51','2016-10-23 23:16:43','admin','2016-10-23 23:16:43'),(21,'vpetrovsky@email.com','$2a$10$IQIrI9FBkawSvGasAdIS7uoSjv5yhiQN32w3vc1HcDdZp32vwjDE.','Vladimir','Petrovsky','vpetrovsky@email.com','','en',NULL,'54684694084823123562','admin','2016-10-23 23:17:38','2016-10-23 23:17:38','admin','2016-10-23 23:17:38'),(22,'lcallings@email.com','$2a$10$GlxUiemNnODAHUfAsE8pQumspyj3fpIdTC1mTpvBaHAvsYRDYOMBC','Lisa','Callings','lcallings@email.com','','en',NULL,'17882551021969325904','admin','2016-10-23 23:18:21','2016-10-23 23:18:21','admin','2016-10-23 23:18:21'),(23,'jkim@email.com','$2a$10$DWImN2hT4l33kHlIFXt05.43YYcPZe6Fa0Mgb8rNS58bpj9DyVvTO','Jeff','Kim','jkim@email.com','','en',NULL,'33740710024395995789','admin','2016-10-23 23:20:23','2016-10-23 23:20:23','admin','2016-10-23 23:20:23'),(24,'ykim@email.com','$2a$10$p09oU1qiY2nZyLWMY4OTc.POIOCjBybi12NqUOMw5jK54knQdpXQe','Yoon','Kim','ykim@email.com','','en',NULL,'41611075698062082888','admin','2016-10-23 23:20:53','2016-10-23 23:20:53','admin','2016-10-23 23:20:53'),(25,'skishima@email.com','$2a$10$FHVszUwW13fabR0LSNebRe9DbczW.CWEy1tYQMQzqSD2FmtOU.brG','Saki','Kishima','skishima@email.com','','en',NULL,'36839879722804398132','admin','2016-10-23 23:21:21','2016-10-23 23:21:21','admin','2016-10-23 23:21:21'),(26,'aagarwal@email.com','$2a$10$QQNALBy9m3UeYWYaBNXeRulTVWz7aOHzDF.n/NtKJW2wTM8WwLEB2','Aditi','Agarwal','aagarwal@email.com','','en',NULL,'04312178380233597082','admin','2016-10-27 09:08:51','2016-10-23 23:23:56','admin','2016-10-23 23:23:56'),(27,'trollins@email.com','$2a$10$Ohr/UXMXG6DUvI2okc3QteXMK7SkzyoOE7kbR8Hduv9eyrEa16zra','Tim','Rollins','trollins@email.com','','en',NULL,'35662430058080039868','admin','2016-10-23 23:24:19','2016-10-23 23:24:19','admin','2016-10-23 23:24:19'),(28,'hchan@email.com','$2a$10$Xxfx3YW2jrADnpYq0qb/u.0oOrvigPy0cLWaYa6g.YVgx/n45tjS2','Heather','Chan','hchan@email.com','','en',NULL,'52425121491999360567','admin','2016-10-23 23:24:39','2016-10-23 23:24:39','admin','2016-10-23 23:24:39'),(29,'jdaniels@email.com','$2a$10$P2qBK1MbEAt6YhGkrgBVX.vMm/xP4Ed6u5A0x.OzmThXANBwk8PXG','Joe','Daniels','jdaniels@email.com','','en',NULL,'21154704810173177528','admin','2016-10-23 23:25:17','2016-10-23 23:25:17','admin','2016-10-23 23:25:17'),(30,'bflorence@email.com','$2a$10$aX7yXdUOpFGMG7vlxHf9rOJ6o2ovmy2mN65pN/ew6h8HmU3D9ofWe','Britany','Florence','bflorence@email.com','','en',NULL,'34282748278437511134','admin','2016-10-23 23:26:20','2016-10-23 23:26:20','admin','2016-10-23 23:26:20'),(31,'hgoh@email.com','$2a$10$GhG9fkswebxtyHCDG/P6QeZOKhRsFpSwWr0WsW/XlIbNMGGJlYY1a','Henson','Goh','hgoh@email.com','','en',NULL,'84324841158842243773','admin','2016-10-27 09:08:51','2016-10-23 23:27:02','admin','2016-10-23 23:27:02'),(32,'jlien@email.com','$2a$10$BTuWH0vhPQdGH68jD.NtJO/3PXJVaSlwSBdWbOOrnrSOm3YHwbiJS','Jenny','Lien','jlien@email.com','','en',NULL,'75399527577016443944','admin','2016-10-23 23:27:36','2016-10-23 23:27:36','admin','2016-10-23 23:27:36'),(33,'lfogarty@email.com','$2a$10$rLBjIavFSBodnVWAeSDxPu/LMVWMjaEgWeo2TC0qPdvftJ9rjj7gK','Lucy','Fogarty','lfogarty@email.com','','en',NULL,'16047692753899506400','admin','2016-10-23 23:28:22','2016-10-23 23:28:22','admin','2016-10-23 23:28:22'),(34,'ywatanabe@email.com','$2a$10$C4TNogSmglSDgRXjcBF0m.RH8zdNdoN6PcC8BPo3SdaQ6CHwOVvbC','Yusuke','Watanabe','ywatanabe@email.com','','en',NULL,'87001313587676629722','admin','2016-10-23 23:29:12','2016-10-23 23:29:12','admin','2016-10-23 23:29:12'),(35,'dmartin@email.com','$2a$10$.nzHRztIHBY/EoACT4Ca2.7YJ5O2gQXe54THVW.TPg/s242tIOy0m','Diane','Martin','dmartin@email.com','','en',NULL,NULL,'admin','2016-10-27 09:46:39',NULL,'admin','2016-10-27 09:47:45');
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
INSERT INTO `jhi_user_authority` VALUES (1,'ROLE_ADMIN'),(3,'ROLE_ADMIN'),(10,'ROLE_STUDENT'),(11,'ROLE_STUDENT'),(12,'ROLE_STUDENT'),(13,'ROLE_STUDENT'),(14,'ROLE_STUDENT'),(15,'ROLE_STUDENT'),(16,'ROLE_STUDENT'),(17,'ROLE_STUDENT'),(18,'ROLE_STUDENT'),(19,'ROLE_STUDENT'),(20,'ROLE_STUDENT'),(21,'ROLE_STUDENT'),(22,'ROLE_STUDENT'),(23,'ROLE_STUDENT'),(24,'ROLE_STUDENT'),(25,'ROLE_STUDENT'),(26,'ROLE_STUDENT'),(27,'ROLE_STUDENT'),(28,'ROLE_STUDENT'),(29,'ROLE_STUDENT'),(30,'ROLE_STUDENT'),(31,'ROLE_STUDENT'),(32,'ROLE_STUDENT'),(33,'ROLE_STUDENT'),(34,'ROLE_STUDENT'),(35,'ROLE_STUDENT'),(5,'ROLE_TEACHER'),(6,'ROLE_TEACHER'),(7,'ROLE_TEACHER'),(8,'ROLE_TEACHER'),(9,'ROLE_TEACHER'),(1,'ROLE_USER'),(3,'ROLE_USER'),(4,'ROLE_USER'),(5,'ROLE_USER'),(6,'ROLE_USER'),(7,'ROLE_USER'),(8,'ROLE_USER'),(9,'ROLE_USER'),(10,'ROLE_USER'),(11,'ROLE_USER'),(12,'ROLE_USER'),(13,'ROLE_USER'),(14,'ROLE_USER'),(15,'ROLE_USER'),(16,'ROLE_USER'),(17,'ROLE_USER'),(18,'ROLE_USER'),(19,'ROLE_USER'),(20,'ROLE_USER'),(21,'ROLE_USER'),(22,'ROLE_USER'),(23,'ROLE_USER'),(24,'ROLE_USER'),(25,'ROLE_USER'),(26,'ROLE_USER'),(27,'ROLE_USER'),(28,'ROLE_USER'),(29,'ROLE_USER'),(30,'ROLE_USER'),(31,'ROLE_USER'),(32,'ROLE_USER'),(33,'ROLE_USER'),(34,'ROLE_USER'),(35,'ROLE_USER');
/*!40000 ALTER TABLE `jhi_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `exam_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_exam_id` (`exam_id`),
  CONSTRAINT `fk_question_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'1 + 1',1),(2,'12 / 0',1),(3,'3 * 3',1),(4,'What is pi?',1),(5,'4 / 2',1),(6,'What word, extended from a more popular term, refers to a fictional book of between 20,000 and 50,000 words?',2),(7,'Who wrote the famous 1855 poem The Charge of the Light Brigade?',2),(8,'In 1960 the UK publishing ban was lifted on what 1928 book?',2),(9,'Who wrote the seminal 1936 self-help book How to Win Friends and Influence People?',2),(10,'Who wrote the maxim \'Cogito, ergo sum\' (I think, therefore I am)?',2),(11,'Who was the first President of the United States?',3),(12,'How many colonies was the United States originally?',3),(13,'What war was fought on American soil from 1861 to 1865?',3),(14,'Who was the 16th president of the US?',3),(15,'Who was the only president to serve two separate terms in office?',3),(16,'Radiocarbon is produced in the atmosphere as a result of:',4),(17,'It is easier to roll a stone up a sloping road than to lift it vertical upwards because:',4),(18,'The absorption of ink by blotting paper involves:',4),(19,'Siphon will fail to work if:',4),(20,'Large transformers, when used for some time, become very hot and are cooled by circulating oil. The heating of the transformer is due to:',4),(21,'One of the essential minerals in the human body is salt. How much salt (NaCl) is in the average adult human body?',5),(22,'The symbol Sb stands for stibnum or stibnite. What is the modern name of this element?',5),(23,'Water-based liquids can be described as acidic, neutral, or basic, with respect to pH. Which of these describes milk?',5),(24,'Noble gases are inert because they have completed outer electron shells. Which of these elements isn\'t a noble gas?',5),(25,'What is the most common isotope of hydrogen?',5);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-27 21:35:06
