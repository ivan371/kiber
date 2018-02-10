-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: test1
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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add team',7,'add_team'),(20,'Can change team',7,'change_team'),(21,'Can delete team',7,'delete_team'),(22,'Can add user team',8,'add_userteam'),(23,'Can change user team',8,'change_userteam'),(24,'Can delete user team',8,'delete_userteam'),(25,'Can add game',9,'add_game'),(26,'Can change game',9,'change_game'),(27,'Can delete game',9,'delete_game'),(28,'Can add game team',10,'add_gameteam'),(29,'Can change game team',10,'change_gameteam'),(30,'Can delete game team',10,'delete_gameteam'),(31,'Can add turn',11,'add_turn'),(32,'Can change turn',11,'change_turn'),(33,'Can delete turn',11,'delete_turn'),(34,'Can add match',12,'add_match'),(35,'Can change match',12,'change_match'),(36,'Can delete match',12,'delete_match'),(37,'Can add application',13,'add_application'),(38,'Can change application',13,'change_application'),(39,'Can delete application',13,'delete_application'),(40,'Can add access token',14,'add_accesstoken'),(41,'Can change access token',14,'change_accesstoken'),(42,'Can delete access token',14,'delete_accesstoken'),(43,'Can add grant',15,'add_grant'),(44,'Can change grant',15,'change_grant'),(45,'Can delete grant',15,'delete_grant'),(46,'Can add refresh token',16,'add_refreshtoken'),(47,'Can change refresh token',16,'change_refreshtoken'),(48,'Can delete refresh token',16,'delete_refreshtoken');
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
) ENGINE=InnoDB AUTO_INCREMENT=811455102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$sHsBWmjILcl4$hY7W84oIiZNc2vfyF9vuN1XKVayXkySQqLYlXls+ByY=','2018-02-09 16:33:06.902054',1,'admin','','','admin@admin.ru',1,1,'2018-02-08 11:44:59.348453'),(811454201,'pbkdf2_sha256$100000$J9dQ99VClwr6$2/nqxQkCcJZrkRBl8yMxwOd4j1stlr0pEn61ZjI44Ds=',NULL,0,'user0','ivan0','ivanov0','ivan@ivan0.ru',0,1,'2018-02-08 11:45:42.028847'),(811454241,'pbkdf2_sha256$100000$pMFi33d8W0li$i0wrBGm8XzZb9WffykS+dH7JdS6266j5NNOHIgUy6eQ=',NULL,0,'user4','ivan4','ivanov4','ivan@ivan4.ru',0,1,'2018-02-08 11:45:42.405694'),(811454261,'pbkdf2_sha256$100000$yXrfSeizG3TQ$G+mcCI/mG7Hq5emVIsHc4cH16LBmyh1c5HxQc8glc1M=',NULL,0,'user6','ivan6','ivanov6','ivan@ivan6.ru',0,1,'2018-02-08 11:45:42.612978'),(811454301,'pbkdf2_sha256$100000$iN5BLMNPoIzS$Rshag8dt4pZJkD8dJZwNJHIYYXtF/oUGP0o0zY0FH3Y=',NULL,0,'user10','ivan10','ivanov10','ivan@ivan10.ru',0,1,'2018-02-08 11:45:42.957509'),(811454311,'pbkdf2_sha256$100000$1RFAHraBf0Z8$nJQcym1NulxRnaE/7OI3HufFSl68XI63uecbWmwYsWw=',NULL,0,'user12','ivan12','ivanov12','ivan@ivan12.ru',0,1,'2018-02-08 11:45:43.122192'),(811454331,'pbkdf2_sha256$100000$vC0VuJRu4x3R$5QNVouqrdPzKUrT9k92voyJEvR2UUieGZ1LeImaLYXk=',NULL,0,'user14','ivan14','ivanov14','ivan@ivan14.ru',0,1,'2018-02-08 11:45:43.290331'),(811454341,'pbkdf2_sha256$100000$BKSCxaUg9JFF$lZ4QDGLOzTTIBwfaq2p/yf+RkcOrs3DJokgJiWk/KXQ=',NULL,0,'user15','ivan15','ivanov15','ivan@ivan15.ru',0,1,'2018-02-08 11:45:43.374630'),(811454351,'pbkdf2_sha256$100000$sXFSYU8Ib3ge$CLNHZKby5LGnAEgg+WaCVJgOCMHaltATYoIDl3xjCbU=',NULL,0,'user16','ivan16','ivanov16','ivan@ivan16.ru',0,1,'2018-02-08 11:45:43.457562'),(811454361,'pbkdf2_sha256$100000$Q9Zt0xaV7khb$d1AChnOVJw0fS6Ylq3KErVsUwG7htzVDwZv2wixdJLk=',NULL,0,'user17','ivan17','ivanov17','ivan@ivan17.ru',0,1,'2018-02-08 11:45:43.543564'),(811454441,'pbkdf2_sha256$100000$TINPS9WSk1gn$GAr9SuxvRZPYFZxb/Wyv5VKamIxEXA+770bk8sXrK1Y=',NULL,0,'user26','ivan26','ivanov26','ivan@ivan26.ru',0,1,'2018-02-08 11:45:44.347857'),(811454451,'pbkdf2_sha256$100000$ZdoXbcm4y4XD$KTz11suT+1wZmO8rUb5WgWxeuCmKqIm8PJoF0YlVBsE=',NULL,0,'user27','ivan27','ivanov27','ivan@ivan27.ru',0,1,'2018-02-08 11:45:44.460621'),(811454481,'pbkdf2_sha256$100000$d7wShgj9xNKd$ps+KSKrExQ24HCgwdy5WHTwRoSCKC+UCsKGHJUbMjxI=',NULL,0,'user30','ivan30','ivanov30','ivan@ivan30.ru',0,1,'2018-02-08 11:45:44.743578'),(811454491,'pbkdf2_sha256$100000$1bXASmfEUFhd$zrsO0OQdQj2SCPx2L3+uoBh1ozeKrKOfmI0SSZprsa4=',NULL,0,'user31','ivan31','ivanov31','ivan@ivan31.ru',0,1,'2018-02-08 11:45:44.835183'),(811454511,'pbkdf2_sha256$100000$HZcg65C3CSyy$jz5rMAS0OnVDubZO5H11YKEHdW9AzzV65B7TJSCLz9I=',NULL,0,'user34','ivan34','ivanov34','ivan@ivan34.ru',0,1,'2018-02-08 11:45:45.093717'),(811454551,'pbkdf2_sha256$100000$9dVk5YQWgBe7$N5/HJYnnWg9DEgo9zty2sLHWUIq3vFZAxZgJlkxDSUA=',NULL,0,'user38','ivan38','ivanov38','ivan@ivan38.ru',0,1,'2018-02-08 11:45:45.461347'),(811454571,'pbkdf2_sha256$100000$pjq5En2gUasG$H6qinUZUplIQmYG0Du9FnpSCnOwmY5rv6jHc/uJ+lWk=',NULL,0,'user40','ivan40','ivanov40','ivan@ivan40.ru',0,1,'2018-02-08 11:45:45.669721'),(811454601,'pbkdf2_sha256$100000$mn08gnP7omyX$izIvh0dZphMU0YBVs3lUVC6ABi+ccmfnKyruGHCfOmw=',NULL,0,'user44','ivan44','ivanov44','ivan@ivan44.ru',0,1,'2018-02-08 11:45:46.025952'),(811454611,'pbkdf2_sha256$100000$1OsvCmFOVk80$Y6cjgkbc2Zfg7o3UyGEqTUrNRyTS57NY3pEXSs6zmYA=',NULL,0,'user45','ivan45','ivanov45','ivan@ivan45.ru',0,1,'2018-02-08 11:45:46.109956'),(811454631,'pbkdf2_sha256$100000$ViOU3ZjALyGh$7lEao1/oWKQ15hN4cKPgumIf+pz5y7d+TM2Ie9285QU=',NULL,0,'user47','ivan47','ivanov47','ivan@ivan47.ru',0,1,'2018-02-08 11:45:46.281682'),(811454661,'pbkdf2_sha256$100000$cNLM1Fqo22B1$MY6s4KsE7Pvg70xtURutCsxJFQd6uXQInCvNHW8NCBs=',NULL,0,'user51','ivan51','ivanov51','ivan@ivan51.ru',0,1,'2018-02-08 11:45:46.629951'),(811454681,'pbkdf2_sha256$100000$QpXhFyRbhRGP$VVXNsuDKNBQJ6TN4fekg5sv9pOY1P//2qYZOtfu8k9k=',NULL,0,'user53','ivan53','ivanov53','ivan@ivan53.ru',0,1,'2018-02-08 11:45:46.803812'),(811454691,'pbkdf2_sha256$100000$BSl5pd65tL7J$bRQafMe27MBZWwt2TE2sO6keXEj+YI2rZod+PIqbW98=',NULL,0,'user54','ivan54','ivanov54','ivan@ivan54.ru',0,1,'2018-02-08 11:45:46.890654'),(811454701,'pbkdf2_sha256$100000$3aI6ryxkjXep$299yRwU9t5x5B1EQ0yTArGP7duelhlIsUYqrIX9MmFY=',NULL,0,'user55','ivan55','ivanov55','ivan@ivan55.ru',0,1,'2018-02-08 11:45:46.974878'),(811454721,'pbkdf2_sha256$100000$eB5tcIEu95uz$WMZaPNaIeUfzb7Fst31X+790DTVP3E1vFlBvVr19De4=',NULL,0,'user57','ivan57','ivanov57','ivan@ivan57.ru',0,1,'2018-02-08 11:45:47.163515'),(811454731,'pbkdf2_sha256$100000$bQdqjHgclWe2$mfmnuZYj6fcWhE1BRN9pLTaQXqEspMShoJsA3W+ZBEo=',NULL,0,'user59','ivan59','ivanov59','ivan@ivan59.ru',0,1,'2018-02-08 11:45:47.330973'),(811454751,'pbkdf2_sha256$100000$fceh9Ya9uCJe$TFq4lLwN3RIzqnG4F7I1/6/b+ST3ip2uWueH3LnuDkc=',NULL,0,'user61','ivan61','ivanov61','ivan@ivan61.ru',0,1,'2018-02-08 11:45:47.515607'),(811454761,'pbkdf2_sha256$100000$FR0od4C2WtwR$uYILp1yTPJ+ds5kx9VqOIPUIeLz2gAgdIFZLDF1nfXc=',NULL,0,'user62','ivan62','ivanov62','ivan@ivan62.ru',0,1,'2018-02-08 11:45:47.598408'),(811454771,'pbkdf2_sha256$100000$vQmLfgnnvcFw$ioikRG7e64N0GZzFd297nhoAi3c3G1pUYOv75KGRZhk=',NULL,0,'user63','ivan63','ivanov63','ivan@ivan63.ru',0,1,'2018-02-08 11:45:47.677468'),(811454781,'pbkdf2_sha256$100000$EudcznyMoH9B$KS8bV3HN81kZNUUfsgh5nxWRc2ltkgwo4N3WodtXcnQ=',NULL,0,'user64','ivan64','ivanov64','ivan@ivan64.ru',0,1,'2018-02-08 11:45:47.766775'),(811454801,'pbkdf2_sha256$100000$fjiZPi2u0eEg$ioBlhs2tIFuz2GeeexsBYcKUs4H+D89KllOGxVCXSCA=',NULL,0,'user67','ivan67','ivanov67','ivan@ivan67.ru',0,1,'2018-02-08 11:45:48.022326'),(811454811,'pbkdf2_sha256$100000$6L9VSoWDDCtX$UCN+N2mlb3/stl4eCWfVc3GCGLGSaMU25kpif7tClqU=',NULL,0,'user68','ivan68','ivanov68','ivan@ivan68.ru',0,1,'2018-02-08 11:45:48.103058'),(811454831,'pbkdf2_sha256$100000$0C6fCME5eGAy$6oMtNoj3+smMavyx9aFQxR5Tb3KXhr+4XTMHhoUNISM=',NULL,0,'user70','ivan70','ivanov70','ivan@ivan70.ru',0,1,'2018-02-08 11:45:48.313205'),(811454841,'pbkdf2_sha256$100000$EPVW9mwxE0Xl$ZFgCYpejT09viv52xXtl00+dJk6M4hQiG/hXVwla14E=',NULL,0,'user71','ivan71','ivanov71','ivan@ivan71.ru',0,1,'2018-02-08 11:45:48.404226'),(811454871,'pbkdf2_sha256$100000$t4MDGQTDYn4M$m6ctYWn+GjtCyETEm5qWTYuwH8JjMH+IubT2pSaQOqE=',NULL,0,'user74','ivan74','ivanov74','ivan@ivan74.ru',0,1,'2018-02-08 11:45:48.691452'),(811454881,'pbkdf2_sha256$100000$xRsPBs47IiPw$LmmqXDwOhbM8DND4Z4PnMKWutLPfuBIWkmE5pe8UMcM=',NULL,0,'user75','ivan75','ivanov75','ivan@ivan75.ru',0,1,'2018-02-08 11:45:48.782904'),(811454891,'pbkdf2_sha256$100000$kLD7VQ1Ohl55$xlyZiT/EB8p60e7lMdEXFIyU3LvL09yQfWEm2WTYwxg=',NULL,0,'user76','ivan76','ivanov76','ivan@ivan76.ru',0,1,'2018-02-08 11:45:48.870343'),(811454901,'pbkdf2_sha256$100000$NB3CggY32MQK$YFRu9Jmv1f3+8AySOiJ1kz1NeG8ZJd3Z1cp4GoZ7/Jk=',NULL,0,'user77','ivan77','ivanov77','ivan@ivan77.ru',0,1,'2018-02-08 11:45:48.961151'),(811454921,'pbkdf2_sha256$100000$BaarwIVfsXcd$kcdsp2ob4c3Mn2iBQKjrSvbsfdUKPFFzkoU1CGmori0=',NULL,0,'user80','ivan80','ivanov80','ivan@ivan80.ru',0,1,'2018-02-08 11:45:49.223911'),(811454931,'pbkdf2_sha256$100000$8ncThvUeJybW$zWyk65jwpWn4Js9YAeJOhHldUEd+8pJvmg4m0fGvfNQ=',NULL,0,'user81','ivan81','ivanov81','ivan@ivan81.ru',0,1,'2018-02-08 11:45:49.307617'),(811454941,'pbkdf2_sha256$100000$fLN5JnbXdOXz$zLXv5yZlZgIhz+4K5Nz5xdjBeAyCmXomPKsCWjJdJFY=',NULL,0,'user82','ivan82','ivanov82','ivan@ivan82.ru',0,1,'2018-02-08 11:45:49.404048'),(811454951,'pbkdf2_sha256$100000$Tkn30zI1Vlg3$KXwBBckOjOrJHraYxN0iQd9gKAhSITC7aPtCZMUAxCY=',NULL,0,'user83','ivan83','ivanov83','ivan@ivan83.ru',0,1,'2018-02-08 11:45:49.489326'),(811454961,'pbkdf2_sha256$100000$O6PyAmtR1wPP$LQJLs+pFnZis1s+b5vVta6SJWcjTtbg+GyOZ2wo+dmU=',NULL,0,'user84','ivan84','ivanov84','ivan@ivan84.ru',0,1,'2018-02-08 11:45:49.575470'),(811454981,'pbkdf2_sha256$100000$zmB39akLdIFI$1AJF1oM0ZT/axMH9YkgnzhwHPTkfyp9JMHnSjqUr/4c=',NULL,0,'user87','ivan87','ivanov87','ivan@ivan87.ru',0,1,'2018-02-08 11:45:49.824141'),(811454991,'pbkdf2_sha256$100000$QI72etLYW9mq$wYhZoqFhwioQE9hNewFqLPL+SKRbvZrJ+xFdOrkF+Ec=',NULL,0,'user88','ivan88','ivanov88','ivan@ivan88.ru',0,1,'2018-02-08 11:45:49.908431'),(811455001,'pbkdf2_sha256$100000$OeOsfnHHjHLh$T3OmOASx4fC/34zSAj4cPxByiysH663LLcN15Gn9eO8=',NULL,0,'user89','ivan89','ivanov89','ivan@ivan89.ru',0,1,'2018-02-08 11:45:49.991209'),(811455011,'pbkdf2_sha256$100000$Njca3I14p1tS$UvJdXUU25gakuFEwQ5DVYXVESLrZiwSt6CXTWfc4Mzw=',NULL,0,'user90','ivan90','ivanov90','ivan@ivan90.ru',0,1,'2018-02-08 11:45:50.087605'),(811455021,'pbkdf2_sha256$100000$3OJ8rb4Ym6ag$qclmDgm6Or7bMfyCzCT5TlKeDJK4uxNPurJovfwAlXE=',NULL,0,'user91','ivan91','ivanov91','ivan@ivan91.ru',0,1,'2018-02-08 11:45:50.179867'),(811455041,'pbkdf2_sha256$100000$59fL22nefxVr$rGlJ7Rw/kYsICfVybwtRt7xp/UNRq0mAsclLmkkfjTA=',NULL,0,'user93','ivan93','ivanov93','ivan@ivan93.ru',0,1,'2018-02-08 11:45:50.360122'),(811455051,'pbkdf2_sha256$100000$Ii9lMpdC29FG$on07RNPNYVO5SnuBgDhcpoIQ8V1vraRahsRQUz3J1ic=',NULL,0,'user94','ivan94','ivanov94','ivan@ivan94.ru',0,1,'2018-02-08 11:45:50.444423'),(811455071,'pbkdf2_sha256$100000$boD3bQDwugO2$+FSZs2igj+vRp69xY/kP6/yC6buvYGw0PdSFfsfQkI4=',NULL,0,'user96','ivan96','ivanov96','ivan@ivan96.ru',0,1,'2018-02-08 11:45:50.655621'),(811455081,'pbkdf2_sha256$100000$Xek0T1BkJYbX$rymyUJo4A/x7eiqQAR89J4E5mk07F2/lh8rFQH509H8=',NULL,0,'user97','ivan97','ivanov97','ivan@ivan97.ru',0,1,'2018-02-08 11:45:50.741329'),(811455091,'pbkdf2_sha256$100000$NoncqibzH8qz$V0jDco+GwizxfUanuqGPNyRpK4Z/SeBW6mTuhWEcpi4=',NULL,0,'user98','ivan98','ivanov98','ivan@ivan98.ru',0,1,'2018-02-08 11:45:50.836482'),(811455101,'pbkdf2_sha256$100000$yIVaGfVP181m$db/APejJT5Mf+/dT6j7BBY7jlAKEU2oJgzCuLbuCqzQ=',NULL,0,'user99','ivan99','ivanov99','ivan@ivan99.ru',0,1,'2018-02-08 11:45:50.933865');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-02-09 16:34:02.063074','811454201','user0',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',2,1);
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(4,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(9,'game','game'),(10,'game','gameteam'),(12,'match','match'),(14,'oauth2_provider','accesstoken'),(13,'oauth2_provider','application'),(15,'oauth2_provider','grant'),(16,'oauth2_provider','refreshtoken'),(6,'sessions','session'),(7,'team','team'),(8,'team','userteam'),(11,'turn','turn');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-08 11:43:50.551590'),(2,'auth','0001_initial','2018-02-08 11:43:52.574267'),(3,'admin','0001_initial','2018-02-08 11:43:53.150826'),(4,'admin','0002_logentry_remove_auto_add','2018-02-08 11:43:53.167460'),(5,'contenttypes','0002_remove_content_type_name','2018-02-08 11:43:53.507749'),(6,'auth','0002_alter_permission_name_max_length','2018-02-08 11:43:53.553072'),(7,'auth','0003_alter_user_email_max_length','2018-02-08 11:43:53.588795'),(8,'auth','0004_alter_user_username_opts','2018-02-08 11:43:53.602196'),(9,'auth','0005_alter_user_last_login_null','2018-02-08 11:43:53.730615'),(10,'auth','0006_require_contenttypes_0002','2018-02-08 11:43:53.737964'),(11,'auth','0007_alter_validators_add_error_messages','2018-02-08 11:43:53.751305'),(12,'auth','0008_alter_user_username_max_length','2018-02-08 11:43:53.989550'),(13,'auth','0009_alter_user_last_name_max_length','2018-02-08 11:43:54.026628'),(14,'turn','0001_initial','2018-02-08 11:43:54.090864'),(15,'match','0001_initial','2018-02-08 11:43:54.321783'),(16,'team','0001_initial','2018-02-08 11:43:54.397760'),(17,'team','0002_userteam','2018-02-08 11:43:54.890720'),(18,'team','0003_team_admin','2018-02-08 11:43:55.178133'),(19,'game','0001_initial','2018-02-08 11:43:56.005288'),(20,'game','0002_auto_20180125_1634','2018-02-08 11:43:56.159981'),(21,'game','0003_game_match','2018-02-08 11:43:56.737330'),(22,'game','0004_auto_20180128_1332','2018-02-08 11:43:57.114133'),(23,'game','0005_game_date','2018-02-08 11:43:57.361706'),(24,'game','0006_auto_20180131_0910','2018-02-08 11:43:58.253059'),(25,'game','0007_remove_game_winner','2018-02-08 11:43:58.429826'),(26,'match','0002_auto_20180128_1757','2018-02-08 11:43:58.692809'),(27,'match','0003_match_date','2018-02-08 11:43:58.841233'),(28,'match','0004_auto_20180128_2039','2018-02-08 11:43:59.011618'),(29,'match','0005_auto_20180131_0910','2018-02-08 11:43:59.207097'),(30,'oauth2_provider','0001_initial','2018-02-08 11:44:00.853518'),(31,'oauth2_provider','0002_08_updates','2018-02-08 11:44:01.499362'),(32,'oauth2_provider','0003_auto_20160316_1503','2018-02-08 11:44:01.826808'),(33,'oauth2_provider','0004_auto_20160525_1623','2018-02-08 11:44:02.084436'),(34,'oauth2_provider','0005_auto_20170514_1141','2018-02-08 11:44:06.820927'),(35,'sessions','0001_initial','2018-02-08 11:44:06.947540'),(36,'team','0004_auto_20180125_1803','2018-02-08 11:44:07.429394'),(37,'team','0005_remove_team_games','2018-02-08 11:44:07.571611'),(38,'team','0006_auto_20180125_1806','2018-02-08 11:44:07.870829'),(39,'team','0007_userteam_name','2018-02-08 11:44:08.106960'),(40,'team','0008_auto_20180127_0913','2018-02-08 11:44:08.165070'),(41,'team','0009_remove_userteam_name','2018-02-08 11:44:08.293466'),(42,'team','0010_auto_20180128_2034','2018-02-08 11:44:08.455062'),(43,'team','0011_auto_20180131_0848','2018-02-08 11:44:08.672634'),(44,'team','0012_auto_20180131_0902','2018-02-08 11:44:09.058029'),(45,'team','0013_remove_team_admin','2018-02-08 11:44:09.194142');
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
INSERT INTO `django_session` VALUES ('i3pikdoexdpxhik5e5kbfzn5v46bgjx1','ZWI5MmNlZjM1OTc1YzJlYTIyYTg2YWFhMmQwN2VlNmE2N2MxM2ZiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzFkYTExNzA0MWFkYzYwZTU3Y2ZmYjIzMjYxOWZiMmViODYwOGFjMiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-02-23 16:34:02.377352');
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
) ENGINE=InnoDB AUTO_INCREMENT=811455282 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_game`
--

LOCK TABLES `game_game` WRITE;
/*!40000 ALTER TABLE `game_game` DISABLE KEYS */;
INSERT INTO `game_game` VALUES (811455101,'game___2',1,'2018-02-08'),(811455111,'game___6',1,'2018-02-08'),(811455121,'game___12',2,'2018-02-08'),(811455131,'game___19',2,'2018-02-08'),(811455141,'game___24',3,'2018-02-08'),(811455151,'game___28',3,'2018-02-08'),(811455171,'game___37',4,'2018-02-08'),(811455181,'game___46',5,'2018-02-08'),(811455191,'game___51',6,'2018-02-08'),(811455201,'game___55',6,'2018-02-08'),(811455211,'game___60',7,'2018-02-08'),(811455221,'game___67',7,'2018-02-08'),(811455231,'game___71',8,'2018-02-08'),(811455241,'game___78',8,'2018-02-08'),(811455251,'game___83',9,'2018-02-08'),(811455261,'game___88',9,'2018-02-08'),(811455271,'game___92',10,'2018-02-08'),(811455281,'game___97',10,'2018-02-08');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_gameteam`
--

LOCK TABLES `game_gameteam` WRITE;
/*!40000 ALTER TABLE `game_gameteam` DISABLE KEYS */;
INSERT INTO `game_gameteam` VALUES (1,811455101,1,0),(2,811455101,1,0),(3,811455111,1,0),(4,811455111,1,0),(5,811455121,1,0),(6,811455121,2,0),(7,811455131,2,0),(8,811455131,2,0),(9,811455131,2,0),(10,811455131,2,0),(11,811455131,2,0),(12,811455131,2,0),(13,811455141,3,0),(14,811455141,3,0),(15,811455151,3,0),(16,811455151,3,0),(17,811455151,3,0),(18,811455171,4,0),(19,811455171,4,0),(20,811455181,5,0),(21,811455181,5,0),(22,811455181,5,0),(23,811455181,5,0),(24,811455181,5,0),(25,811455191,5,0),(26,811455191,5,0),(27,811455191,6,0),(28,811455191,6,0),(29,811455201,6,0),(30,811455201,6,0),(31,811455211,6,0),(32,811455211,6,0),(33,811455211,7,0),(34,811455221,7,0),(35,811455221,7,0),(36,811455231,7,0),(37,811455231,8,0),(38,811455241,8,0),(39,811455241,8,0),(40,811455241,8,0),(41,811455251,9,0),(42,811455251,9,0),(43,811455251,9,0),(44,811455261,9,0),(45,811455261,9,0),(46,811455261,9,0),(47,811455261,9,0),(48,811455271,10,0),(49,811455271,10,0),(50,811455271,10,0),(51,811455281,10,0),(52,811455281,10,0),(53,811455281,10,0);
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
INSERT INTO `team_team` VALUES (1,'team_0','game.png',100),(2,'team_1','game.png',100),(3,'team_2','game.png',100),(4,'team_3','game.png',100),(5,'team_4','game.png',100),(6,'team_5','game.png',100),(7,'team_6','game.png',100),(8,'team_7','game.png',100),(9,'team_8','game.png',100),(10,'team_9','game.png',100);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_userteam`
--

LOCK TABLES `team_userteam` WRITE;
/*!40000 ALTER TABLE `team_userteam` DISABLE KEYS */;
INSERT INTO `team_userteam` VALUES (1,1,811454201),(2,1,811454241),(3,1,811454261),(4,2,811454301),(5,2,811454311),(6,2,811454331),(7,2,811454341),(8,2,811454351),(9,2,811454361),(10,3,811454441),(11,3,811454451),(12,4,811454481),(13,4,811454491),(14,4,811454511),(15,4,811454551),(16,5,811454571),(17,5,811454601),(18,5,811454611),(19,5,811454631),(20,6,811454661),(21,6,811454681),(22,6,811454691),(23,6,811454701),(24,6,811454721),(25,6,811454731),(26,6,811454731),(27,7,811454751),(28,7,811454751),(29,7,811454761),(30,7,811454771),(31,7,811454781),(32,7,811454801),(33,7,811454811),(34,8,811454831),(35,8,811454841),(36,8,811454871),(37,8,811454881),(38,8,811454891),(39,8,811454901),(40,9,811454921),(41,9,811454931),(42,9,811454941),(43,9,811454951),(44,9,811454961),(45,9,811454981),(46,9,811454991),(47,9,811455001),(48,10,811455011),(49,10,811455021),(50,10,811455041),(51,10,811455051),(52,10,811455071),(53,10,811455081),(54,10,811455091),(55,10,811455101);
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

-- Dump completed on 2018-02-10 11:02:19
