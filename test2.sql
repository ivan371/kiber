-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: test2
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add team',7,'add_team'),(20,'Can change team',7,'change_team'),(21,'Can delete team',7,'delete_team'),(22,'Can add user team',8,'add_userteam'),(23,'Can change user team',8,'change_userteam'),(24,'Can delete user team',8,'delete_userteam'),(25,'Can add game team',9,'add_gameteam'),(26,'Can change game team',9,'change_gameteam'),(27,'Can delete game team',9,'delete_gameteam'),(28,'Can add game',10,'add_game'),(29,'Can change game',10,'change_game'),(30,'Can delete game',10,'delete_game'),(31,'Can add turn',11,'add_turn'),(32,'Can change turn',11,'change_turn'),(33,'Can delete turn',11,'delete_turn'),(34,'Can add match',12,'add_match'),(35,'Can change match',12,'change_match'),(36,'Can delete match',12,'delete_match'),(37,'Can add refresh token',13,'add_refreshtoken'),(38,'Can change refresh token',13,'change_refreshtoken'),(39,'Can delete refresh token',13,'delete_refreshtoken'),(40,'Can add grant',14,'add_grant'),(41,'Can change grant',14,'change_grant'),(42,'Can delete grant',14,'delete_grant'),(43,'Can add access token',15,'add_accesstoken'),(44,'Can change access token',15,'change_accesstoken'),(45,'Can delete access token',15,'delete_accesstoken'),(46,'Can add application',16,'add_application'),(47,'Can change application',16,'change_application'),(48,'Can delete application',16,'delete_application');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=811455063 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$sMCfqPvWwtC4$ttg1/A44n022SW62ZwhguPsTGR/WMu5QM4VyV6pCYQU=',NULL,1,'admin','','','admin@dmin.ru',1,1,'2018-02-08 11:45:16.639493'),(811454212,'pbkdf2_sha256$100000$ljO1AEuHQq59$cymVwpyIwUft/hVESUOp+tW1zO9mlkwsRdQ6ok8tCT0=',NULL,0,'user1','ivan1','ivanov1','ivan@ivan1.ru',0,1,'2018-02-08 11:45:42.121074'),(811454222,'pbkdf2_sha256$100000$fX5L4bwiFfBj$JNJ6pUVrQvXgGRKEd5X45hRaEqJGAi5ER8mDT4hCxRA=',NULL,0,'user2','ivan2','ivanov2','ivan@ivan2.ru',0,1,'2018-02-08 11:45:42.213519'),(811454232,'pbkdf2_sha256$100000$OA2KjVqDyGKJ$hEx90aS4BD7ihk+kfGC0khhIfHzjM/0NuOgpRWEnGgY=',NULL,0,'user3','ivan3','ivanov3','ivan@ivan3.ru',0,1,'2018-02-08 11:45:42.309542'),(811454252,'pbkdf2_sha256$100000$mZxcv33X7bVK$1TJXDsx5erTViHsjjeshiYrMtDx8tSSgRqybXSll0lc=',NULL,0,'user5','ivan5','ivanov5','ivan@ivan5.ru',0,1,'2018-02-08 11:45:42.507090'),(811454272,'pbkdf2_sha256$100000$QJhQZs7VQPvL$Z5QuKzGizxjBuIfTmqMH3BnjrlurVyoGkHB5eZzrI9c=',NULL,0,'user7','ivan7','ivanov7','ivan@ivan7.ru',0,1,'2018-02-08 11:45:42.696097'),(811454282,'pbkdf2_sha256$100000$UyBBNuAJ1M6t$VTKGjqZiNHCtbweZr/rzt7fDwVc0nQQAE+hspek4fZs=',NULL,0,'user8','ivan8','ivanov8','ivan@ivan8.ru',0,1,'2018-02-08 11:45:42.778983'),(811454292,'pbkdf2_sha256$100000$d6OkC8PtMVgc$X9B0a+NOCJ7DIcT8lsBDUoYYAUCtiE+wTJ7ZuDgGfJc=',NULL,0,'user9','ivan9','ivanov9','ivan@ivan9.ru',0,1,'2018-02-08 11:45:42.863246'),(811454312,'pbkdf2_sha256$100000$nTZQqfOZIT0v$vWzrDhK7olR9fA0YGOlfjWBRpwHFpuTeaOk4yJf/WIM=',NULL,0,'user11','ivan11','ivanov11','ivan@ivan11.ru',0,1,'2018-02-08 11:45:43.041128'),(811454322,'pbkdf2_sha256$100000$MfP5ygc521i1$RQ5SKvAy0vaExAW4COYPiT7rGdQ5KkTzfGdp3BHu50I=',NULL,0,'user13','ivan13','ivanov13','ivan@ivan13.ru',0,1,'2018-02-08 11:45:43.205371'),(811454372,'pbkdf2_sha256$100000$eLtkJIKS8CzP$MKUbAtK8KK5rjeVV70I53XHQw21ppsSTkY5JkHnkYZ8=',NULL,0,'user19','ivan19','ivanov19','ivan@ivan19.ru',0,1,'2018-02-08 11:45:43.722221'),(811454382,'pbkdf2_sha256$100000$tnx5tRZQHIOl$4FDB/yZ8ALkhMtrbjFXGOcq45xtr0eZ0LqTX4iIyi10=',NULL,0,'user20','ivan20','ivanov20','ivan@ivan20.ru',0,1,'2018-02-08 11:45:43.819251'),(811454392,'pbkdf2_sha256$100000$VWQW6VYAx4t3$GZjXLL1yUX+fOg1i9eTNpaawv8jiBEKk9HCjpfS3ii0=',NULL,0,'user21','ivan21','ivanov21','ivan@ivan21.ru',0,1,'2018-02-08 11:45:43.906990'),(811454402,'pbkdf2_sha256$100000$qxrMGe9f8NMS$jYJXFXLwVfCWXgrYe+v3emVghUPdmbCeuxAqvlSpdhc=',NULL,0,'user22','ivan22','ivanov22','ivan@ivan22.ru',0,1,'2018-02-08 11:45:44.006769'),(811454412,'pbkdf2_sha256$100000$eIjHntdLoPlX$FOJwucOhKT8C8zjDD2YTjXS5lTWKMt9WWaYghXd3FoI=',NULL,0,'user23','ivan23','ivanov23','ivan@ivan23.ru',0,1,'2018-02-08 11:45:44.088340'),(811454422,'pbkdf2_sha256$100000$WAHdZNLt0q1D$lurs2Q+AWOLHXK4kE+iMOp7LTKeno0BybFVk1CCJJ8w=',NULL,0,'user24','ivan24','ivanov24','ivan@ivan24.ru',0,1,'2018-02-08 11:45:44.172519'),(811454432,'pbkdf2_sha256$100000$IIv5AYEWFBGw$FL+E8ZqyjuzrtuWlmc5S6R3Nw5L/TZYtnfkyqkGA8KM=',NULL,0,'user25','ivan25','ivanov25','ivan@ivan25.ru',0,1,'2018-02-08 11:45:44.263152'),(811454462,'pbkdf2_sha256$100000$tWxnpxwmKw7x$3pwv+DFEOn6LGqvNZ9VWErvj9rah/Ehpapyw13AOQW8=',NULL,0,'user28','ivan28','ivanov28','ivan@ivan28.ru',0,1,'2018-02-08 11:45:44.554276'),(811454472,'pbkdf2_sha256$100000$HesCfLinDm56$HxFL6NtJnwAl1+io2od2FftQawXiCUcx9RrA+3yfHZY=',NULL,0,'user29','ivan29','ivanov29','ivan@ivan29.ru',0,1,'2018-02-08 11:45:44.637829'),(811454502,'pbkdf2_sha256$100000$cdyLfqFgcTPt$fr7+QddsZ4ngfVvnNsS9nyc6h68+SK2lyugLfjk6Ils=',NULL,0,'user33','ivan33','ivanov33','ivan@ivan33.ru',0,1,'2018-02-08 11:45:45.013974'),(811454522,'pbkdf2_sha256$100000$GNtAZrCylrJk$ZXjiR4GMXNr4QSLJL+cjQVXJVax2Io0eVvGvUI78Mik=',NULL,0,'user35','ivan35','ivanov35','ivan@ivan35.ru',0,1,'2018-02-08 11:45:45.184104'),(811454532,'pbkdf2_sha256$100000$n3gCp32Se9wE$n6fe+8nqi8hU2d/cm5yuM5sjbhdRli7FqbivIYsC78o=',NULL,0,'user36','ivan36','ivanov36','ivan@ivan36.ru',0,1,'2018-02-08 11:45:45.270499'),(811454542,'pbkdf2_sha256$100000$mGRmOGxD20lj$o0EzdZ8PzuulrKwH23XV8O0VvmwiL0iz2gHAySMQKGc=',NULL,0,'user37','ivan37','ivanov37','ivan@ivan37.ru',0,1,'2018-02-08 11:45:45.363494'),(811454562,'pbkdf2_sha256$100000$734pp1vO5RHG$l1slAvu1NcDozE90xRqHepNwhU+fvUlw3btSoTH2hSY=',NULL,0,'user39','ivan39','ivanov39','ivan@ivan39.ru',0,1,'2018-02-08 11:45:45.566012'),(811454582,'pbkdf2_sha256$100000$xD0QIlkwnBXs$qM48JATGk0UAph+ge0KjjojoZTVLPv3Q8/p8rH3amTE=',NULL,0,'user41','ivan41','ivanov41','ivan@ivan41.ru',0,1,'2018-02-08 11:45:45.752777'),(811454592,'pbkdf2_sha256$100000$B8k6lX8a0TxB$Plqh6Qoqc+miaeUC6ky+C29Ilc6RrI+V93tWM5AlSzM=',NULL,0,'user42','ivan42','ivanov42','ivan@ivan42.ru',0,1,'2018-02-08 11:45:45.855410'),(811454602,'pbkdf2_sha256$100000$azmHQcC1J05O$c0WA8ekpO72BYl6wurttanPK1fXtp5RKxPNN/Qv94N8=',NULL,0,'user43','ivan43','ivanov43','ivan@ivan43.ru',0,1,'2018-02-08 11:45:45.946139'),(811454622,'pbkdf2_sha256$100000$5lpAxhhqJqMq$Xbs9CTsQEQdEJO8hhO96EaqvC2/J0E/HnUPNYcOLwVo=',NULL,0,'user46','ivan46','ivanov46','ivan@ivan46.ru',0,1,'2018-02-08 11:45:46.191580'),(811454642,'pbkdf2_sha256$100000$jW0ER138iZpY$SeIpUtKeslbqVqwbBvkF9Zuzxd7ocMyHFRIkmMd8+hs=',NULL,0,'user48','ivan48','ivanov48','ivan@ivan48.ru',0,1,'2018-02-08 11:45:46.363043'),(811454652,'pbkdf2_sha256$100000$HRCh6pqUj4mq$gV/7sYUxwQP/G+hq1Zch22HOkjETQZmcaWYq86t6tP4=',NULL,0,'user49','ivan49','ivanov49','ivan@ivan49.ru',0,1,'2018-02-08 11:45:46.445203'),(811454662,'pbkdf2_sha256$100000$bZ0EJ3zvILlo$uyfp5qP+qmCLHnr2Q0a2g7pgdZmJhKwCXXfh13irjj4=',NULL,0,'user50','ivan50','ivanov50','ivan@ivan50.ru',0,1,'2018-02-08 11:45:46.545896'),(811454672,'pbkdf2_sha256$100000$4dZOw8SmcTaO$Nweb39Cp9eBOrgT66GonaPJA24G39Th/l7TzjOf6xfo=',NULL,0,'user52','ivan52','ivanov52','ivan@ivan52.ru',0,1,'2018-02-08 11:45:46.714320'),(811454712,'pbkdf2_sha256$100000$MSZuBmFqzFXS$SRS3kP8NV6g5n3OzM5/XgOUD9Ibz6al66F72FW7I/D4=',NULL,0,'user56','ivan56','ivanov56','ivan@ivan56.ru',0,1,'2018-02-08 11:45:47.070337'),(811454792,'pbkdf2_sha256$100000$J7J493F0tkKt$PPaOlhPgcTUKyqPejKWybOcxq9X8YzrAhYK9zArqGgM=',NULL,0,'user66','ivan66','ivanov66','ivan@ivan66.ru',0,1,'2018-02-08 11:45:47.934589'),(811454822,'pbkdf2_sha256$100000$2IM4MO85GY8x$egIJFWxWzE+mCqR//S8IvsSArpHKlJ6i5dQiPZMs3xc=',NULL,0,'user69','ivan69','ivanov69','ivan@ivan69.ru',0,1,'2018-02-08 11:45:48.196337'),(811454852,'pbkdf2_sha256$100000$2J0y3AZatuXz$HuE8g3mmh8cDLb2yoFVuSNWJ5XMw66jGME0aQ8wVAi8=',NULL,0,'user72','ivan72','ivanov72','ivan@ivan72.ru',0,1,'2018-02-08 11:45:48.503025'),(811454862,'pbkdf2_sha256$100000$gRlma0jF0jpj$x/rGKTvPbvcY4xqFuDzBN5D0sCzjcodqP99DfZKuc+U=',NULL,0,'user73','ivan73','ivanov73','ivan@ivan73.ru',0,1,'2018-02-08 11:45:48.601937'),(811454912,'pbkdf2_sha256$100000$sYqv3M2SDGE2$FP8PjLLJGBlRFSqGzxnYHE7C2hbBp/pmpP7lwDsSkq4=',NULL,0,'user79','ivan79','ivanov79','ivan@ivan79.ru',0,1,'2018-02-08 11:45:49.120967'),(811454972,'pbkdf2_sha256$100000$sIg2894oFZre$0X5mqcXZ5fdnbKoCq2Kr8jjAtsuanki4Q1U+i97ac2E=',NULL,0,'user85','ivan85','ivanov85','ivan@ivan85.ru',0,1,'2018-02-08 11:45:49.658949'),(811454982,'pbkdf2_sha256$100000$DYtm49sWIJoz$J43K9V3d4tc2GdmepKIT6RV5eB40qMM46yxsDKU2Tc0=',NULL,0,'user86','ivan86','ivanov86','ivan@ivan86.ru',0,1,'2018-02-08 11:45:49.740817'),(811455032,'pbkdf2_sha256$100000$kzzbND18GA2N$wbKopLuwlXXo1dDlQtXDHsiSJYBoQ295M0sJuaeMrhs=',NULL,0,'user92','ivan92','ivanov92','ivan@ivan92.ru',0,1,'2018-02-08 11:45:50.273824'),(811455062,'pbkdf2_sha256$100000$x9XaVu6x2Dos$G2qN02Z6soCR03xOoQnWfPO9eqtkKvZQWEX0IHXYJRQ=',NULL,0,'user95','ivan95','ivanov95','ivan@ivan95.ru',0,1,'2018-02-08 11:45:50.542632');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(4,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(10,'game','game'),(9,'game','gameteam'),(12,'match','match'),(15,'oauth2_provider','accesstoken'),(16,'oauth2_provider','application'),(14,'oauth2_provider','grant'),(13,'oauth2_provider','refreshtoken'),(6,'sessions','session'),(7,'team','team'),(8,'team','userteam'),(11,'turn','turn');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-08 11:44:13.227283'),(2,'auth','0001_initial','2018-02-08 11:44:15.059514'),(3,'admin','0001_initial','2018-02-08 11:44:15.448872'),(4,'admin','0002_logentry_remove_auto_add','2018-02-08 11:44:15.464210'),(5,'contenttypes','0002_remove_content_type_name','2018-02-08 11:44:15.744166'),(6,'auth','0002_alter_permission_name_max_length','2018-02-08 11:44:15.778626'),(7,'auth','0003_alter_user_email_max_length','2018-02-08 11:44:15.827681'),(8,'auth','0004_alter_user_username_opts','2018-02-08 11:44:15.848835'),(9,'auth','0005_alter_user_last_login_null','2018-02-08 11:44:16.024870'),(10,'auth','0006_require_contenttypes_0002','2018-02-08 11:44:16.034488'),(11,'auth','0007_alter_validators_add_error_messages','2018-02-08 11:44:16.061155'),(12,'auth','0008_alter_user_username_max_length','2018-02-08 11:44:16.331493'),(13,'auth','0009_alter_user_last_name_max_length','2018-02-08 11:44:16.402475'),(14,'turn','0001_initial','2018-02-08 11:44:16.514707'),(15,'match','0001_initial','2018-02-08 11:44:16.781506'),(16,'team','0001_initial','2018-02-08 11:44:16.855129'),(17,'team','0002_userteam','2018-02-08 11:44:17.592677'),(18,'team','0003_team_admin','2018-02-08 11:44:18.106058'),(19,'game','0001_initial','2018-02-08 11:44:19.374257'),(20,'game','0002_auto_20180125_1634','2018-02-08 11:44:19.629136'),(21,'game','0003_game_match','2018-02-08 11:44:19.986338'),(22,'game','0004_auto_20180128_1332','2018-02-08 11:44:20.387087'),(23,'game','0005_game_date','2018-02-08 11:44:20.625997'),(24,'game','0006_auto_20180131_0910','2018-02-08 11:44:21.741256'),(25,'game','0007_remove_game_winner','2018-02-08 11:44:21.915636'),(26,'match','0002_auto_20180128_1757','2018-02-08 11:44:22.264219'),(27,'match','0003_match_date','2018-02-08 11:44:22.423618'),(28,'match','0004_auto_20180128_2039','2018-02-08 11:44:22.580401'),(29,'match','0005_auto_20180131_0910','2018-02-08 11:44:22.751050'),(30,'oauth2_provider','0001_initial','2018-02-08 11:44:24.829095'),(31,'oauth2_provider','0002_08_updates','2018-02-08 11:44:25.784681'),(32,'oauth2_provider','0003_auto_20160316_1503','2018-02-08 11:44:26.300143'),(33,'oauth2_provider','0004_auto_20160525_1623','2018-02-08 11:44:26.611836'),(34,'oauth2_provider','0005_auto_20170514_1141','2018-02-08 11:44:32.181833'),(35,'sessions','0001_initial','2018-02-08 11:44:32.414507'),(36,'team','0004_auto_20180125_1803','2018-02-08 11:44:33.008253'),(37,'team','0005_remove_team_games','2018-02-08 11:44:33.149111'),(38,'team','0006_auto_20180125_1806','2018-02-08 11:44:33.479297'),(39,'team','0007_userteam_name','2018-02-08 11:44:33.667094'),(40,'team','0008_auto_20180127_0913','2018-02-08 11:44:33.724712'),(41,'team','0009_remove_userteam_name','2018-02-08 11:44:33.866274'),(42,'team','0010_auto_20180128_2034','2018-02-08 11:44:34.036968'),(43,'team','0011_auto_20180131_0848','2018-02-08 11:44:34.208823'),(44,'team','0012_auto_20180131_0902','2018-02-08 11:44:34.559631'),(45,'team','0013_remove_team_admin','2018-02-08 11:44:34.701393');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_game`
--

DROP TABLE IF EXISTS `game_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `match_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `game_game_name_9bfcf583_uniq` (`name`),
  KEY `game_game_match_id_ddebc692_fk_match_match_id` (`match_id`),
  CONSTRAINT `game_game_match_id_ddebc692_fk_match_match_id` FOREIGN KEY (`match_id`) REFERENCES `match_match` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=811455283 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_game`
--

LOCK TABLES `game_game` WRITE;
/*!40000 ALTER TABLE `game_game` DISABLE KEYS */;
INSERT INTO `game_game` VALUES (811455102,'game___1',1,'2018-02-08'),(811455112,'game___8',1,'2018-02-08'),(811455122,'game___13',2,'2018-02-08'),(811455142,'game___23',3,'2018-02-08'),(811455152,'game___29',3,'2018-02-08'),(811455162,'game___34',4,'2018-02-08'),(811455172,'game___39',4,'2018-02-08'),(811455182,'game___41',5,'2018-02-08'),(811455192,'game___48',5,'2018-02-08'),(811455202,'game___57',6,'2018-02-08'),(811455212,'game___61',7,'2018-02-08'),(811455222,'game___68',7,'2018-02-08'),(811455232,'game___739',8,'2018-02-08'),(811455242,'game___79',8,'2018-02-08'),(811455252,'game___80',9,'2018-02-08'),(811455262,'game___86',9,'2018-02-08'),(811455272,'game___89',9,'2018-02-08'),(811455282,'game___99',10,'2018-02-08');
/*!40000 ALTER TABLE `game_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_gameteam`
--

DROP TABLE IF EXISTS `game_gameteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_gameteam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `is_winner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_gameteam_game_id_4516f87e_fk_game_game_id` (`game_id`),
  KEY `game_gameteam_team_id_a47e2c57_fk_team_team_id` (`team_id`),
  CONSTRAINT `game_gameteam_game_id_4516f87e_fk_game_game_id` FOREIGN KEY (`game_id`) REFERENCES `game_game` (`id`),
  CONSTRAINT `game_gameteam_team_id_a47e2c57_fk_team_team_id` FOREIGN KEY (`team_id`) REFERENCES `team_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_gameteam`
--

LOCK TABLES `game_gameteam` WRITE;
/*!40000 ALTER TABLE `game_gameteam` DISABLE KEYS */;
INSERT INTO `game_gameteam` VALUES (1,811455102,1,0),(2,811455112,1,0),(3,811455112,1,0),(4,811455112,1,0),(5,811455112,1,0),(6,811455122,2,0),(7,811455122,2,0),(8,811455122,2,0),(9,811455142,3,0),(10,811455142,3,0),(11,811455142,3,0),(12,811455152,3,0),(13,811455152,3,0),(14,811455162,4,0),(15,811455162,4,0),(16,811455162,4,0),(17,811455162,4,0),(18,811455162,4,0),(19,811455172,4,0),(20,811455172,4,0),(21,811455172,4,0),(22,811455182,5,0),(23,811455182,5,0),(24,811455192,5,0),(25,811455202,6,0),(26,811455202,6,0),(27,811455202,6,0),(28,811455202,6,0),(29,811455212,7,0),(30,811455222,7,0),(31,811455222,7,0),(32,811455222,7,0),(33,811455222,7,0),(34,811455222,7,0),(35,811455232,8,0),(36,811455232,8,0),(37,811455232,8,0),(38,811455242,8,0),(39,811455242,8,0),(40,811455242,8,0),(41,811455252,9,0),(42,811455262,9,0),(43,811455272,9,0),(44,811455282,10,0),(45,811455282,10,0),(46,811455282,10,0),(47,811455282,10,0);
/*!40000 ALTER TABLE `game_gameteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_match`
--

DROP TABLE IF EXISTS `match_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `turn_id` int(11) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `games` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_match_turn_id_07a7f48b_fk_turn_turn_id` (`turn_id`),
  CONSTRAINT `match_match_turn_id_07a7f48b_fk_turn_turn_id` FOREIGN KEY (`turn_id`) REFERENCES `turn_turn` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_match`
--

LOCK TABLES `match_match` WRITE;
/*!40000 ALTER TABLE `match_match` DISABLE KEYS */;
INSERT INTO `match_match` VALUES (1,'match0',1,'match.png',0,'2018-02-08'),(2,'match1',1,'match.png',0,'2018-02-08'),(3,'match2',1,'match.png',0,'2018-02-08'),(4,'match3',1,'match.png',0,'2018-02-08'),(5,'match4',1,'match.png',0,'2018-02-08'),(6,'match5',1,'match.png',0,'2018-02-08'),(7,'match6',1,'match.png',0,'2018-02-08'),(8,'match7',1,'match.png',0,'2018-02-08'),(9,'match8',1,'match.png',0,'2018-02-08'),(10,'match9',1,'match.png',0,'2018-02-08');
/*!40000 ALTER TABLE `match_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_accesstoken_token_8af090f8_uniq` (`token`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` (`user_id`),
  KEY `oauth2_provider_accesstoken_application_id_b22886e1_fk` (`application_id`),
  CONSTRAINT `oauth2_provider_accesstoken_application_id_b22886e1_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  KEY `oauth2_provider_application_user_id_79829054_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_grant_code_49ab4ddf_uniq` (`code`),
  KEY `oauth2_provider_grant_application_id_81923564_fk` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_grant_application_id_81923564_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `access_token_id` bigint(20) NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_d090daa4_uniq` (`token`),
  KEY `oauth2_provider_refreshtoken_application_id_2d1c311b_fk` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refreshtoken_access_token_id_775e84e8_fk` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_application_id_2d1c311b_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_team`
--

DROP TABLE IF EXISTS `team_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `games` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_team`
--

LOCK TABLES `team_team` WRITE;
/*!40000 ALTER TABLE `team_team` DISABLE KEYS */;
INSERT INTO `team_team` VALUES (1,'team_0','game.png',100),(2,'team_1','game.png',100),(3,'team_2','game.png',100),(4,'team_3','game.png',100),(5,'team_4','game.png',100),(6,'team_5','game.png',100),(7,'team_6','game.png',100),(8,'team_7','game.png',100),(9,'team_8','game.png',100),(10,'team_91k','game.png',100);
/*!40000 ALTER TABLE `team_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_userteam`
--

DROP TABLE IF EXISTS `team_userteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_userteam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_userteam_team_id_51d3b844_fk_team_team_id` (`team_id`),
  KEY `team_userteam_user_id_42506799_fk_auth_user_id` (`user_id`),
  CONSTRAINT `team_userteam_team_id_51d3b844_fk_team_team_id` FOREIGN KEY (`team_id`) REFERENCES `team_team` (`id`),
  CONSTRAINT `team_userteam_user_id_42506799_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_userteam`
--

LOCK TABLES `team_userteam` WRITE;
/*!40000 ALTER TABLE `team_userteam` DISABLE KEYS */;
INSERT INTO `team_userteam` VALUES (1,1,811454212),(2,1,811454222),(3,1,811454232),(4,1,811454252),(5,1,811454272),(6,1,811454282),(7,1,811454292),(8,2,811454312),(9,2,811454322),(10,2,811454372),(11,2,811454372),(12,3,811454382),(13,3,811454392),(14,3,811454402),(15,3,811454412),(16,3,811454422),(17,3,811454432),(18,3,811454462),(19,3,811454472),(20,4,811454502),(21,4,811454502),(22,4,811454522),(23,4,811454532),(24,4,811454542),(25,4,811454562),(26,5,811454582),(27,5,811454592),(28,5,811454602),(29,5,811454622),(30,5,811454642),(31,5,811454652),(32,6,811454662),(33,6,811454672),(34,6,811454712),(35,7,811454792),(36,7,811454792),(37,7,811454822),(38,8,811454852),(39,8,811454862),(40,8,811454912),(41,8,811454912),(42,9,811454972),(43,9,811454982),(44,10,811455032),(45,10,811455062);
/*!40000 ALTER TABLE `team_userteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turn_turn`
--

DROP TABLE IF EXISTS `turn_turn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turn_turn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turn_turn`
--

LOCK TABLES `turn_turn` WRITE;
/*!40000 ALTER TABLE `turn_turn` DISABLE KEYS */;
INSERT INTO `turn_turn` VALUES (1,'turn0');
/*!40000 ALTER TABLE `turn_turn` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-10 11:03:02
