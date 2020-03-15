# noinspection LossyEncodingForFile

CREATE DATABASE  IF NOT EXISTS `avia` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `avia`;
-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: avia
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flight` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `date_depart` bigint(20) NOT NULL,
  `date_come` bigint(20) NOT NULL,
  `aircraft_id` bigint(20) NOT NULL,
  `city_from_id` bigint(20) NOT NULL,
  `city_to_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number_UNIQUE` (`code`),
  KEY `fk_aircraft_idx` (`aircraft_id`),
  KEY `fk_city_idx` (`city_from_id`),
  KEY `fk_city_to_idx` (`city_to_id`),
  CONSTRAINT `fk_aircraft` FOREIGN KEY (`aircraft_id`) REFERENCES `spr_aircraft` (`id`),
  CONSTRAINT `fk_city_from` FOREIGN KEY (`city_from_id`) REFERENCES `spr_city` (`id`),
  CONSTRAINT `fk_city_to` FOREIGN KEY (`city_to_id`) REFERENCES `spr_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'TUV-234',1328191800000,1328202600000,1,1,2),(2,'ITO-67',1328472000000,1328652900000,2,3,2);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `passenger` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `given_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) NOT NULL,
  `document_number` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Given name','Miidle name','Family','AG2131','test@mail.ru','234-2342-34'),(2,'Given name2','Miidle name2','Family2','AG342','test2@mail.ru','111-2342-34');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flight_id` bigint(20) NOT NULL,
  `passenger_id` bigint(20) NOT NULL,
  `place_id` bigint(20) NOT NULL,
  `add_info` varchar(100) DEFAULT NULL,
  `reserve_datetime` bigint(20) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'уникальный номер после покупки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  UNIQUE KEY `idx_reserve` (`flight_id`,`passenger_id`),
  KEY `fk_passenger_idx` (`passenger_id`),
  KEY `fk_place_idx` (`place_id`),
  CONSTRAINT `fk_flight` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`),
  CONSTRAINT `fk_passenger` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `fk_place` FOREIGN KEY (`place_id`) REFERENCES `spr_place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spr_aircraft`
--

DROP TABLE IF EXISTS `spr_aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `spr_aircraft` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_company_idx` (`company_id`),
  CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `spr_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spr_aircraft`
--

LOCK TABLES `spr_aircraft` WRITE;
/*!40000 ALTER TABLE `spr_aircraft` DISABLE KEYS */;
INSERT INTO `spr_aircraft` VALUES (1,'Fokker 100',1,NULL),(2,'Airbus 360',1,NULL),(3,'Boeing 747',2,NULL);
/*!40000 ALTER TABLE `spr_aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spr_aircraft_place`
--

DROP TABLE IF EXISTS `spr_aircraft_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `spr_aircraft_place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aircraft_id` bigint(20) NOT NULL,
  `place_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_aircraft_id_idx` (`aircraft_id`),
  KEY `fk_place_id_idx` (`place_id`),
  CONSTRAINT `fk_aircraft_id` FOREIGN KEY (`aircraft_id`) REFERENCES `spr_aircraft` (`id`),
  CONSTRAINT `fk_place_id` FOREIGN KEY (`place_id`) REFERENCES `spr_place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='таблица связывает самолет и его места (связь "много ко многим")';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spr_aircraft_place`
--

LOCK TABLES `spr_aircraft_place` WRITE;
/*!40000 ALTER TABLE `spr_aircraft_place` DISABLE KEYS */;
INSERT INTO `spr_aircraft_place` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,2,1),(22,2,2),(23,2,3),(24,2,4),(25,2,5),(26,2,6),(27,2,7),(28,2,8),(29,2,9),(30,2,10),(31,2,11),(32,2,12),(33,2,13),(34,2,14),(35,2,15),(36,2,16),(37,2,17),(38,2,18),(39,2,19);
/*!40000 ALTER TABLE `spr_aircraft_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spr_city`
--

DROP TABLE IF EXISTS `spr_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `spr_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `country_id` varchar(45) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `UNIQUE1` (`name`,`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spr_city`
--

LOCK TABLES `spr_city` WRITE;
/*!40000 ALTER TABLE `spr_city` DISABLE KEYS */;
INSERT INTO `spr_city` VALUES (1,'Москва','1','MOS',NULL),(2,'Нью-Йорк','3','NY',NULL),(3,'Киев','2','KI',NULL),(6,'Вашингтон','3','WS',NULL),(7,'Самара','1','SM',NULL);
/*!40000 ALTER TABLE `spr_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spr_classes`
--

DROP TABLE IF EXISTS `spr_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `spr_classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spr_classes`
--

LOCK TABLES `spr_classes` WRITE;
/*!40000 ALTER TABLE `spr_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spr_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spr_company`
--

DROP TABLE IF EXISTS `spr_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `spr_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spr_company`
--

LOCK TABLES `spr_company` WRITE;
/*!40000 ALTER TABLE `spr_company` DISABLE KEYS */;
INSERT INTO `spr_company` VALUES (1,'America Airlines',NULL),(2,'Аэрофлот',NULL);
/*!40000 ALTER TABLE `spr_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spr_country`
--

DROP TABLE IF EXISTS `spr_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `spr_country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'сокращенный код страны',
  `flag` blob,
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spr_country`
--

LOCK TABLES `spr_country` WRITE;
/*!40000 ALTER TABLE `spr_country` DISABLE KEYS */;
INSERT INTO `spr_country` VALUES (1,'Россия','RUS',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0?�j\0\0\0	pHYs\0\0�\0\0��\��e\0\0\0tIME\��k�G\0\0\0tEXtAuthor\0��\�H\0\0\0tEXtDescription\0	!#\0\0\0\ntEXtCopyright\0�\�:\0\0\0tEXtCreation time\05�	\0\0\0	tEXtSoftware\0]p�:\0\0\0tEXtDisclaimer\0����\0\0\0tEXtWarning\0�\�\0\0\0tEXtSource\0���\�\0\0\0tEXtComment\0�̖�\0\0\0tEXtTitle\0�\�\�\'\0\0\�IDATH�Ŕ?nQƿof,�M�9��`.\0A��D49@\n�\�\nt܀�2}ڈD�d\�}\��9�\�8q\�<i��\�\��f\�|;�\�篦\�\�;3s\0\��$�<�\�f�1\Z�\'�\�\�\�%s5��\0����aD�\��\��zp��텶>�X`�S=\���(\�8>Ni0X$w���m�p[\�\�u3�,+��Jqtd\�ﻹ;\�j�Ym\�\0�\Zv�te�\\U./\�\0)[\rʛsf\�6�C�q\�*\0`�k\�UՆ\�G�\�\0��D�5�܇ެޤ������榇�^\�;�%Il)87�,�-¸\�[�\��o���\�J�m+\�z\r\�T\�C����/��\�OL\0\�\��~Ԝ\\~������/�\�\�͖�l\�\�{�%<C�`\"X�րo��\Z�\��$�\"\�<0`\�\��\Z�s\�P\02\0	��?a���\�C�j^]��J\�S\"\���\Z;�\�\�\�&�U\�z2\�P����{�\�\�O-\�\\\�\�\�\�\�-4�|AK��_\�\�\�I������3&��\0\0\0\0IEND�B`�',NULL),(2,'Украина','UKR',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0���|\0\0\0	pHYs\0\0\r\�\0\0\r\�B(�x\0\0\0tIME\�9�i,\�\0\0\0tEXtAuthor\0��\�H\0\0\0tEXtDescription\0	!#\0\0\0\ntEXtCopyright\0�\�:\0\0\0tEXtCreation time\05�	\0\0\0	tEXtSoftware\0]p�:\0\0\0tEXtDisclaimer\0����\0\0\0tEXtWarning\0�\�\0\0\0tEXtSource\0���\�\0\0\0tEXtComment\0�̖�\0\0\0tEXtTitle\0�\�\�\'\0\0\03IDATH�c�*=�a\0\0\�@X:j�ţS��Y,\Z�\�-�F-�x\�b�\0\0��\�jyԞ\0\0\0\0IEND�B`�',NULL),(3,'США','USA',_binary '�\��\�\0JFIF\0\0,,\0\0��\0LEAD Technologies Inc. V1.01\0�\�\0�\0			\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\n\n\r\n\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r�\��\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\0\0\0\0�\�\0\0\0?\0�\�;H�ɍC\��V<\�<�O�����<$�j\rW\�\��\��\0�}��;��\���\0�\��R\�\�5H�\�i\�\�\�\�b�\�\�\�ۑj\ZB\��C\�#\��\�3��\�\�\�\���\�\��l{y_?\�?u\�y�e�)R���\�\��\�z�\���\�\�&��5�\�w\��?\�=��\0�7�DS[\�\�4>��u\�h\���t��\�m�;�\0\�ȧ��\�\�Qm��\0/�Ώ��c\��n\�?{͟v|���_�����\0�o\�˲>O�2��\��\0�?�����Z\�H�[\�8�\"��H�支�\�\�cw�\����l�$\�W:��r�J\���I\��gM\r,<�\�USF�j`1R��me�\�t\�}���\��ӿ��\�\�\��\0G�\�G�0��l\���\�\��\0Y��\�\�\r<��Q����p���o�6\�\�x\���\���i?�.��\0\�+��\�?�\n>\��.��\0�\0�U�� �\0��\��|���[�s�G�\0A����\0��\0ª\���\�}s�\0>ZO�����9���\0���ˇ��\0\��\0\�Uo�Hd�<�a��iC\�[���(�ȉe�K����*��\0\��\�',NULL);
/*!40000 ALTER TABLE `spr_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spr_flight_class`
--

DROP TABLE IF EXISTS `spr_flight_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `spr_flight_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spr_flight_class`
--

LOCK TABLES `spr_flight_class` WRITE;
/*!40000 ALTER TABLE `spr_flight_class` DISABLE KEYS */;
INSERT INTO `spr_flight_class` VALUES (1,'Эконом','Без выбора меню'),(2,'Бизнес','Обед на выбор, больше места');
/*!40000 ALTER TABLE `spr_flight_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spr_place`
--

DROP TABLE IF EXISTS `spr_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `spr_place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seat_letter` char(1) NOT NULL,
  `seat_number` int(100) NOT NULL,
  `flight_class_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_uniq1` (`seat_letter`,`seat_number`,`flight_class_id`),
  KEY `fk_flight_class_idx` (`flight_class_id`),
  CONSTRAINT `fk_flight_class` FOREIGN KEY (`flight_class_id`) REFERENCES `spr_flight_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spr_place`
--

LOCK TABLES `spr_place` WRITE;
/*!40000 ALTER TABLE `spr_place` DISABLE KEYS */;
INSERT INTO `spr_place` VALUES (1,'A',1,1),(21,'A',1,2),(2,'A',2,1),(22,'A',2,2),(3,'A',3,1),(23,'A',3,2),(4,'A',4,1),(24,'A',4,2),(5,'B',1,1),(6,'B',2,1),(7,'B',3,1),(8,'B',4,1),(9,'C',1,1),(10,'C',2,1),(11,'C',3,1),(12,'C',4,1),(13,'D',1,1),(14,'D',2,1),(15,'D',3,1),(16,'D',4,1),(17,'E',1,1),(18,'E',2,1),(19,'E',3,1),(20,'E',4,1);
/*!40000 ALTER TABLE `spr_place` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-29 15:39:10
