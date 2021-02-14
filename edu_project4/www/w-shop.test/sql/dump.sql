-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: webdevkin
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL,
  `user` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$uWEWei5BFR5/2sWVo9Rjp.0bHdO3l8Nofq4WE5arMj2VMxkupgzoG'),(2,'developer','$2y$10$RomPT15GCJDwqr5p5gmtQ.1x.SAb2FMu1V//wBQ2nqAcvp7nVU4/C');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Apple'),(2,'Samsung'),(3,'Acer'),(4,'Lenovo'),(5,'Asus'),(6,'Gigabyte'),(25,'Xiaomi');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ноутбуки'),(2,'Смартфоны'),(3,'Видеокарты');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `dt_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details` (
  `order_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `good` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1260;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good` varchar(255) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `brand_id` int(10) unsigned NOT NULL,
  `price` int(11) unsigned NOT NULL,
  `rating` int(11) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_goods_brands_id` (`brand_id`),
  KEY `FK_goods_categories_id` (`category_id`),
  CONSTRAINT `FK_goods_brands_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_goods_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'Ноутбук Apple MacBook Air',1,1,60000,8,'apple_macbook_air.jpg'),(2,'Ноутбук Apple MacBook Pro',1,1,70000,9,'apple_macbook_pro.jpg'),(3,'Ноутбук Lenovo IdeaPad',1,4,17000,5,'lenovo_idea_pad.jpg'),(4,'Ноутбук Lenovo G5030',1,4,16000,7,'lenovo_g5030.jpg'),(5,'Ноутбук Acer Aspire',1,3,21000,8,'acer_aspire.jpg'),(6,'Смартфон Samsung Galaxy A7',2,2,30000,9,'samsung_galaxy_a7.jpg'),(7,'Смартфон Samsung Galaxy A5',2,2,17000,8,'samsung_galaxy_a5.jpg'),(8,'Смартфон Apple iPhone SE',2,1,38000,10,'apple_iphone_se.jpg'),(9,'Смартфон Asus Zenfone Laser',2,5,12000,6,'asus_zenfone_laser.jpg'),(10,'Смартфон Lenovo A5000',2,4,11000,3,'lenovo_a5000.jpg'),(11,'Смартфон Lenovo P90',2,4,16000,5,'lenovo_p90.jpg'),(12,'Видеокарта ASUS',3,5,2500,8,'asus_video.jpg'),(13,'Видеокарта GIGABYTE GT-740',3,6,6000,9,'gigabyte_video_gt740.jpg'),(14,'Видеокарта GIGABYTE GTX-960',3,6,14000,10,'gigabyte_video_gtx960.jpg');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_props`
--

DROP TABLE IF EXISTS `goods_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_props` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(10) unsigned NOT NULL,
  `prop` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_props`
--

LOCK TABLES `goods_props` WRITE;
/*!40000 ALTER TABLE `goods_props` DISABLE KEYS */;
INSERT INTO `goods_props` VALUES (1,1,'Процессор','Intel Core i5'),(2,1,'Объем памяти','4 Гб'),(3,1,'Размер экрана','13 дюймов'),(4,2,'Процессор','Intel Core i7'),(6,2,'Размер экрана','13 дюймов'),(7,3,'Размер экрана','14 дюймов'),(8,4,'Процессор','Intel Pentium 4'),(9,5,'Процессор','Intel Core i7'),(10,5,'Наличие wi-fi','да'),(11,6,'Диагональ экрана','5 дюймов'),(12,6,'GPS','да'),(13,7,'Диагональ экрана','4 дюйма'),(14,7,'GPS','нет'),(15,8,'Диагональ экрана','4 дюйма');
/*!40000 ALTER TABLE `goods_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dt_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-25 14:52:50
