-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: oopsdb
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `product_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('CAT_A001_1','A001','Redmi Note 12 4G','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_10','A001','Redmi Note 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A001_11','A001','Redmi Note 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A001_12','A001','Redmi Note 13 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A001_2','A001','Redmi Note 12 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_3','A001','Redmi Note 12 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_4','A001','Redmi Note 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_5','A001','Redmi Note 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_6','A001','Redmi Note 13 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_7','A001','Redmi Note 12 4G','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A001_8','A001','Redmi Note 12 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A001_9','A001','Redmi Note 12 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A002_1','A002','Redmi Note 12 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_10','A002','Redmi Note 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A002_11','A002','Redmi Note 13 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A002_12','A002','Redmi K70','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A002_2','A002','Redmi Note 12 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_3','A002','Redmi Note 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_4','A002','Redmi Note 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_5','A002','Redmi Note 13 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_6','A002','Redmi K70','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_7','A002','Redmi Note 12 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A002_8','A002','Redmi Note 12 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A002_9','A002','Redmi Note 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A003_1','A003','Redmi Note 12 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_10','A003','Redmi Note 13 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A003_11','A003','Redmi K70','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A003_12','A003','Redmi K70 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A003_2','A003','Redmi Note 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_3','A003','Redmi Note 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_4','A003','Redmi Note 13 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_5','A003','Redmi K70','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_6','A003','Redmi K70 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_7','A003','Redmi Note 12 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A003_8','A003','Redmi Note 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A003_9','A003','Redmi Note 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A004_1','A004','Redmi Note 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_10','A004','Redmi K70','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A004_11','A004','Redmi K70 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A004_12','A004','Redmi K70E','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A004_2','A004','Redmi Note 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_3','A004','Redmi Note 13 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_4','A004','Redmi K70','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_5','A004','Redmi K70 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_6','A004','Redmi K70E','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_7','A004','Redmi Note 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A004_8','A004','Redmi Note 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A004_9','A004','Redmi Note 13 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A005_1','A005','Redmi Note 12 4G','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A005_2','A005','Redmi Note 12 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A005_3','A005','Redmi Note 12 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A005_4','A005','Redmi Note 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A005_5','A005','Redmi Note 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A005_6','A005','Redmi Note 13 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A006_1','A006','Redmi Note 12 4G','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A006_2','A006','Redmi Note 12 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A006_3','A006','Redmi Note 12 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A006_4','A006','Redmi Note 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A006_5','A006','Redmi Note 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A006_6','A006','Redmi Note 13 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A007_1','A007','Redmi Note 12 4G','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A007_2','A007','Redmi Note 12 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A007_3','A007','Redmi Note 12 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A007_4','A007','Redmi Note 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A007_5','A007','Redmi Note 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A007_6','A007','Redmi Note 13 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A008_1','A008','Redmi Note 12 4G','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A008_2','A008','Redmi Note 12 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A008_3','A008','Redmi Note 12 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A008_4','A008','Redmi Note 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A008_5','A008','Redmi Note 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_A008_6','A008','Redmi Note 13 Pro+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1001_1','I1001','iPhone 11','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_10','I1001','iPhone 12 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1001_11','I1001','iPhone 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1001_12','I1001','iPhone 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1001_2','I1001','iPhone 12','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_3','I1001','iPhone 12 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_4','I1001','iPhone 12 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_5','I1001','iPhone 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_6','I1001','iPhone 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_7','I1001','iPhone 11','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1001_8','I1001','iPhone 12','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1001_9','I1001','iPhone 12 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1002_1','I1002','iPhone 12','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_10','I1002','iPhone 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1002_11','I1002','iPhone 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1002_12','I1002','iPhone 13 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1002_2','I1002','iPhone 12 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_3','I1002','iPhone 12 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_4','I1002','iPhone 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_5','I1002','iPhone 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_6','I1002','iPhone 13 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_7','I1002','iPhone 12','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1002_8','I1002','iPhone 12 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1002_9','I1002','iPhone 12 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1003_1','I1003','iPhone 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_10','I1003','iPhone 14','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1003_11','I1003','iPhone 14 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1003_12','I1003','iPhone 14 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1003_2','I1003','iPhone 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_3','I1003','iPhone 13 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_4','I1003','iPhone 14','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_5','I1003','iPhone 14 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_6','I1003','iPhone 14 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_7','I1003','iPhone 13','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1003_8','I1003','iPhone 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1003_9','I1003','iPhone 13 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1004_1','I1004','iPhone 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_10','I1004','iPhone 14 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1004_11','I1004','iPhone 14 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1004_12','I1004','iPhone 15','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1004_2','I1004','iPhone 13 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_3','I1004','iPhone 14','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_4','I1004','iPhone 14 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_5','I1004','iPhone 14 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_6','I1004','iPhone 15','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_7','I1004','iPhone 13 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1004_8','I1004','iPhone 13 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1004_9','I1004','iPhone 14','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1005_1','I1005','iPhone 14','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_10','I1005','iPhone 15','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1005_11','I1005','iPhone 15 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1005_12','I1005','iPhone 15 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1005_2','I1005','iPhone 14 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_3','I1005','iPhone 14 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_4','I1005','iPhone 15','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_5','I1005','iPhone 15 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_6','I1005','iPhone 15 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_7','I1005','iPhone 14','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1005_8','I1005','iPhone 14 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1005_9','I1005','iPhone 14 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1006_1','I1006','iPhone 14','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1006_2','I1006','iPhone 14 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1006_3','I1006','iPhone 14 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1006_4','I1006','iPhone 15','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1006_5','I1006','iPhone 15 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1006_6','I1006','iPhone 15 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1007_1','I1007','iPhone 14','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1007_2','I1007','iPhone 14 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1007_3','I1007','iPhone 14 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1007_4','I1007','iPhone 15','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1007_5','I1007','iPhone 15 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1007_6','I1007','iPhone 15 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1008_1','I1008','iPhone 14','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1008_2','I1008','iPhone 14 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1008_3','I1008','iPhone 14 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1008_4','I1008','iPhone 15','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1008_5','I1008','iPhone 15 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1008_6','I1008','iPhone 15 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1009_1','I1009','iPhone 14','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1009_2','I1009','iPhone 14 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1009_3','I1009','iPhone 14 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1009_4','I1009','iPhone 15','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1009_5','I1009','iPhone 15 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_I1009_6','I1009','iPhone 15 Pro Max','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0001_1','O0001','OPPO A55','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_10','O0001','OPPO A96','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0001_11','O0001','OPPO Reno8 T','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0001_12','O0001','OPPO Reno8 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0001_2','O0001','OPPO A57','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_3','O0001','OPPO A77s','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_4','O0001','OPPO A96','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_5','O0001','OPPO Reno8 T','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_6','O0001','OPPO Reno8 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_7','O0001','OPPO A55','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0001_8','O0001','OPPO A57','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0001_9','O0001','OPPO A77s','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0002_1','O0002','OPPO A57','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_10','O0002','OPPO Reno8 T','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0002_11','O0002','OPPO Reno8 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0002_12','O0002','OPPO Find N3','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0002_2','O0002','OPPO A77s','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_3','O0002','OPPO A96','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_4','O0002','OPPO Reno8 T','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_5','O0002','OPPO Reno8 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_6','O0002','OPPO Find N3','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_7','O0002','OPPO A57','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0002_8','O0002','OPPO A77s','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0002_9','O0002','OPPO A96','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0003_1','O0003','OPPO A77s','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_10','O0003','OPPO Reno8 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0003_11','O0003','OPPO Find N3','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0003_12','O0003','OPPO Find X6 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0003_2','O0003','OPPO A96','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_3','O0003','OPPO Reno8 T','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_4','O0003','OPPO Reno8 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_5','O0003','OPPO Find N3','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_6','O0003','OPPO Find X6 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_7','O0003','OPPO A77s','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0003_8','O0003','OPPO A96','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0003_9','O0003','OPPO Reno8 T','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0004_1','O0004','OPPO A96','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_10','O0004','OPPO Find N3','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0004_11','O0004','OPPO Find X6 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0004_12','O0004','OPPO Find X7 Ultra','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0004_2','O0004','OPPO Reno8 T','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_3','O0004','OPPO Reno8 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_4','O0004','OPPO Find N3','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_5','O0004','OPPO Find X6 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_6','O0004','OPPO Find X7 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_7','O0004','OPPO A96','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0004_8','O0004','OPPO Reno8 T','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0004_9','O0004','OPPO Reno8 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0005_1','O0005','OPPO A55','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0005_2','O0005','OPPO A57','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0005_3','O0005','OPPO A77s','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0005_4','O0005','OPPO A96','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0005_5','O0005','OPPO Reno8 T','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0005_6','O0005','OPPO Reno8 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0006_1','O0006','OPPO A57','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0006_2','O0006','OPPO A77s','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0006_3','O0006','OPPO A96','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0006_4','O0006','OPPO Reno8 T','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0006_5','O0006','OPPO Reno8 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0006_6','O0006','OPPO Find N3','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0007_1','O0007','OPPO A77s','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0007_2','O0007','OPPO A96','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0007_3','O0007','OPPO Reno8 T','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0007_4','O0007','OPPO Reno8 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0007_5','O0007','OPPO Find N3','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0007_6','O0007','OPPO Find X6 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0008_1','O0008','OPPO A96','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0008_2','O0008','OPPO Reno8 T','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0008_3','O0008','OPPO Reno8 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0008_4','O0008','OPPO Find N3','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0008_5','O0008','OPPO Find X6 Pro','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_O0008_6','O0008','OPPO Find X7 Ultra','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S001_1','S001','Galaxy S23','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_10','S001','Galaxy S24','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S001_11','S001','Galaxy S24+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S001_12','S001','Galaxy S24 Ultra','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S001_2','S001','Galaxy S23+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_3','S001','Galaxy S23 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_4','S001','Galaxy S24','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_5','S001','Galaxy S24+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_6','S001','Galaxy S24 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_7','S001','Galaxy S23','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S001_8','S001','Galaxy S23+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S001_9','S001','Galaxy S23 Ultra','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S002_1','S002','Galaxy S23+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_10','S002','Galaxy S24+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S002_11','S002','Galaxy S24 Ultra','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S002_12','S002','Galaxy A54','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S002_2','S002','Galaxy S23 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_3','S002','Galaxy S24','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_4','S002','Galaxy S24+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_5','S002','Galaxy S24 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_6','S002','Galaxy A54','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_7','S002','Galaxy S23+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S002_8','S002','Galaxy S23 Ultra','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S002_9','S002','Galaxy S24','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S003_1','S003','Galaxy S23 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_10','S003','Galaxy S24 Ultra','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S003_11','S003','Galaxy A54','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S003_12','S003','Galaxy A53','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S003_2','S003','Galaxy S24','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_3','S003','Galaxy S24+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_4','S003','Galaxy S24 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_5','S003','Galaxy A54','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_6','S003','Galaxy A53','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_7','S003','Galaxy S23 Ultra','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S003_8','S003','Galaxy S24','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S003_9','S003','Galaxy S24+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S004_1','S004','Galaxy Z Flip6','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_10','S004','Galaxy Z Fold5','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S004_11','S004','Galaxy Z Flip4','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S004_12','S004','Galaxy Z Fold4','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S004_2','S004','Galaxy Z Fold6','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_3','S004','Galaxy Z Flip5','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_4','S004','Galaxy Z Fold5','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_5','S004','Galaxy Z Flip4','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_6','S004','Galaxy Z Fold4','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_7','S004','Galaxy Z Flip6','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S004_8','S004','Galaxy Z Fold6','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S004_9','S004','Galaxy Z Flip5','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S005_1','S005','Galaxy S24','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_10','S005','Galaxy A54','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S005_11','S005','Galaxy A53','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S005_12','S005','Galaxy A34','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S005_2','S005','Galaxy S24+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_3','S005','Galaxy S24 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_4','S005','Galaxy A54','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_5','S005','Galaxy A53','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_6','S005','Galaxy A34','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_7','S005','Galaxy S24','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S005_8','S005','Galaxy S24+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S005_9','S005','Galaxy S24 Ultra','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S006_1','S006','Galaxy S24+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_10','S006','Galaxy A53','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S006_11','S006','Galaxy A34','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S006_12','S006','Galaxy A33','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S006_2','S006','Galaxy S24 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_3','S006','Galaxy A54','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_4','S006','Galaxy A53','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_5','S006','Galaxy A34','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_6','S006','Galaxy A33','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_7','S006','Galaxy S24+','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S006_8','S006','Galaxy S24 Ultra','2024-12-31 08:13:38','2024-12-31 08:13:38'),('CAT_S006_9','S006','Galaxy A54','2024-12-31 08:13:38','2024-12-31 08:13:38');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_id` int NOT NULL,
  `product_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `discount` decimal(4,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`,`detail_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES ('ORD001',1,'A001',2,95000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD001',2,'I1001',1,150000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD002',1,'A002',3,95000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD002',2,'I1002',2,150000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD003',1,'A003',1,95000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD003',2,'I1003',1,150000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD004',1,'A004',2,95000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD004',2,'I1004',1,150000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD005',1,'A005',1,185000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD005',2,'I1005',1,150000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD006',1,'A006',2,95000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD006',2,'I1006',1,150000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD007',1,'A007',1,125000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD007',2,'I1007',1,180000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD008',1,'A008',2,155000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD008',2,'I1008',1,200000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD009',1,'O0001',3,120000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD009',2,'S001',2,100000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD010',1,'O0002',1,120000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10'),('ORD010',2,'S002',1,100000.00,0.00,'2024-12-31 16:24:10','2024-12-31 16:24:10');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` tinyint NOT NULL DEFAULT '1',
  `order_date` date NOT NULL,
  `required_date` date NOT NULL,
  `shipped_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_prices` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('ORD001','USER001',3,'2024-01-01','2024-01-05','2024-01-04','2024-12-31 16:23:38','2025-01-01 12:38:00',300000.00),('ORD002','USER002',3,'2024-01-02','2024-01-06','2024-01-05','2024-12-31 16:23:38','2025-01-01 12:38:02',450000.00),('ORD003','USER003',2,'2024-01-03','2024-01-07','2024-01-06','2024-12-31 16:23:38','2025-01-01 12:38:31',200000.00),('ORD004','USER004',3,'2024-01-04','2024-01-08','2024-01-07','2024-12-31 16:23:38','2024-12-31 16:45:25',150000.00),('ORD005','USER005',3,'2024-01-05','2024-01-09','2024-01-08','2024-12-31 16:23:38','2025-01-01 12:38:09',500000.00),('ORD006','USER006',3,'2024-01-06','2024-01-10','2024-01-09','2024-12-31 16:23:38','2025-01-01 12:38:14',250000.00),('ORD007','USER007',1,'2024-01-07','2024-01-11','2024-01-10','2024-12-31 16:23:38','2024-12-31 16:23:38',350000.00),('ORD008','USER008',2,'2024-01-08','2024-01-12','2024-01-11','2024-12-31 16:23:38','2025-01-01 12:38:28',400000.00),('ORD009','USER009',1,'2024-01-09','2024-01-13','2024-01-12','2024-12-31 16:23:38','2024-12-31 16:23:38',600000.00),('ORD010','USER010',1,'2024-01-10','2024-01-14','2024-01-13','2024-12-31 16:23:38','2024-12-31 16:23:38',700000.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_brands`
--

DROP TABLE IF EXISTS `phone_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_brands` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_brands`
--

LOCK TABLES `phone_brands` WRITE;
/*!40000 ALTER TABLE `phone_brands` DISABLE KEYS */;
INSERT INTO `phone_brands` VALUES ('1','Apple','2024-12-29 15:13:43','2024-12-29 15:13:43'),('2','Oppo','2024-12-29 15:13:43','2024-12-29 15:13:43'),('3','Redmi','2024-12-30 15:50:42','2024-12-31 09:14:51'),('4','Samsung','2024-12-30 15:51:44','2024-12-30 15:51:44');
/*!40000 ALTER TABLE `phone_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_brand_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `phone_brand_id` (`phone_brand_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`phone_brand_id`) REFERENCES `phone_brands` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('A001','ốp lưng Redmi Ốp Điện Thoại tpu Vỏ điện thoại silicon thời trang phổ biến Redmi note 12 4G TSY','3',95000.00,'1. Điểm nổi bật: Vỏ mềm thời trang\r\n\r\n2. Thiết kế: Ống kính đi kèm hoàn toàn! Tăng khả năng bảo vệ máy ảnh!\r\n\r\n3. Hình: sản phẩm chụp thật, mở khuôn máy thật CASE. Vị trí chính xác của điện thoại.','A001.png','2024-12-31 06:03:04','2024-12-31 09:46:13'),('A002','Ốp silicon Phi Hành Gia Dễ Thương ','3',95000.00,'Đặc trưng: kẹo đầy màu sắc nhựa TPU mềm lưng bằng silicon Vỏ mờ, siêu mỏng và trọng lượng nhẹ, bề mặt mịn\r\nPhong cách thiết kế: sang trọng, thời trang, đẹp, dễ thương, mát mẻ','A002.png','2024-12-31 06:06:16','2024-12-31 07:32:32'),('A003','Ốp Khủng long hoạt hình màu xanh lá siêu dễ thương','3',95000.00,'Thương hiệu mới và chất lượng cao, được làm từ Silicone mềm bền.\n\nCông nghệ in hình chất lượng cao.\n\nThiết kế: Khủng long hoạt hình\n\nHình ảnh chống xước và không bao giờ phai.\n\nDễ dàng truy cập vào tất cả các chức năng của điện thoại &amp; Cổng phụ kiện.\n\nThể hiện bản thân cá nhân hóa điện thoại của bạn và làm cho nó nổi bật. Nhiều kiểu dáng và màu sắc trong kho cho bạn lựa chọn. mỗi ngày thay đổi một kiểu để phù hợp với tâm trạng khác nhau của bạn.','A003.png','2024-12-31 06:06:16','2024-12-31 07:32:32'),('A004','Ốp lưng hình cu Shin cùng người ngoài hành tinh siêu cute','3',95000.00,'Thương hiệu mới và chất lượng cao, được làm từ Silicone mềm bền.\r\n\r\n Công nghệ in hình chất lượng cao.\r\n\r\nThiết kế: Mũ người ngoài hành tinh bút chì màu Shinchan\r\n\r\nHình ảnh chống xước và không bao giờ phai.\r\n\r\nDễ dàng truy cập vào tất cả các chức năng của điện thoại và cổng phụ kiện.\r\n\r\nThể hiện bản thân cá nhân hóa điện thoại của bạn và làm cho nó nổi bật. Nhiều kiểu dáng và màu sắc trong kho cho bạn lựa chọn. mỗi ngày thay đổi một kiểu để phù hợp với tâm trạng khác nhau của bạn.','A004.png','2024-12-31 06:06:16','2024-12-31 07:33:57'),('A005','Ốp lưng da thời trang Redmi','3',185000.00,'Ốp lưng da cao cấp, họa tiết vân da tinh tế. Viền TPU mềm chống sốc','A005.png','2024-12-31 07:27:40','2024-12-31 07:32:32'),('A006','Ốp lưng silicon trong suốt Redmi','3',95000.00,'Ốp lưng silicon trong suốt chống sốc 4 góc, bảo vệ camera. Thiết kế vừa vặn, ôm sát máy','A006.png','2024-12-31 07:27:40','2024-12-31 07:32:32'),('A007','Ốp lưng nắp gập thời trang Redmi','3',125000.00,'Ốp lưng nắp gập thời trang, chống va đập, bảo vệ màn hình. Chất liệu da cao cấp','A007.png','2024-12-31 07:27:40','2024-12-31 07:32:32'),('A008','Ốp lưng chống sốc Military Redmi','3',155000.00,'Ốp lưng chống sốc chuẩn quân đội, bảo vệ toàn diện. Thiết kế nam tính, mạnh mẽ','A008.png','2024-12-31 07:27:40','2024-12-31 07:32:32'),('I1001','Ốp lưng nhựa cứng, viền dẻo, trong suốt','1',150000.00,'- Ốp lưng iPhone 11 12 Series sở hữu thiết kế trong suốt, giúp tôn lên vẻ đẹp nguyên bản của điện thoại.\r\n- Mặt lưng được làm từ nhựa cứng bền bỉ, hạn chế trầy xước hiệu quả.\r\n- Kết hợp viền dẻo, hỗ trợ người dùng tháo lắp ốp lưng Kingxbar dễ dàng.\r\n- Ốp lưng ôm vừa khít điện thoại, cho thao tác cầm nắm chắc chắn.','I1001.png','2024-12-29 15:14:16','2024-12-31 07:33:57'),('I10010','Ốp lưng Leather Case iPhone Pro','1',190000.00,'Ốp lưng da cao cấp, viền bảo vệ camera. Tích hợp MagSafe, chống sốc','I1005.png','2024-12-31 07:27:40','2024-12-31 07:27:40'),('I1002','Ốp lưng 6D cao cấp','1',150000.00,'- Chất liệu silicon cao cấp mềm dẻo, đàn hồi tốt, tháo lắp dễ dàng\r\n- Thiết kế mỏng nhẹ ôm sát máy, chống trầy xước khi va chạm\r\n- Các đường xi vàng mạ điện 6D rất sang trọng, bắt mắt\r\n- Cụm camera tinh xảo bảo vệ tối ưu hơn\r\n- Các chi tiết chuẩn xác, hoàn thiện rất tốt\r\n- 3 màu xanh, hồng, trắng thời trang','I1002.png','2024-12-31 05:44:15','2024-12-31 06:11:41'),('I1003','Ốp lưng UAG Monarch 5 lớp chống sốc','1',150000.00,'- 1 trong những dòng ốp lưng cao cấp nhất trên thị trường hiện nay\r\n- Thiết kế 5 lớp độc đáo chưa có dòng ốp nào có\r\n- Sản phẩm hàng hiệu chính hãng UAG (Mỹ)\r\n- Thuộc top những chiếc ốp lưng chống va đập mạnh mẽ nhất (vượt cả tiêu chuẩn quân đội)\r\n- Cảm giác cực chắc chắn, có các gờ chốn trượt khi cầm trên tay\r\n- Thiết kế mạnh mẽ với những đường khối đặc trưng đã làm nên thương hiệu.','I1003.png','2024-12-31 05:46:14','2024-12-31 06:11:41'),('I1004','Ốp lưng da Spigen La Manon','1',150000.00,'Thiết kế vừa vặn và ôm sát thân máy. - Dễ dàng tháo/lắp ốp vào máy.','I1004.png','2024-12-31 05:51:50','2024-12-31 06:11:41'),('I1005','Ốp lưng Apple Silicone Clear Case Trong Suốt hỗ trợ MagSafe chính hãng\r\n','1',150000.00,'- Mỏng, nhẹ và dễ cầm nắm\n- Thiết kế trong suốt không sợ ố vàng, chống xước toàn diện\n- Hỗ trợ sạc không dây nhanh hơn mà không cần tháo ốp, chống rơi rớt','I1005.png','2024-12-31 05:55:11','2024-12-31 07:33:27'),('I1006','Ốp lưng silicon trong suốt iPhone','1',150000.00,'Ốp lưng silicon trong suốt MagSafe, chống sốc 4 góc. Tương thích sạc không dây','I1006.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('I1007','Ốp lưng da Apple iPhone','1',180000.00,'Ốp lưng da chính hãng Apple, tích hợp MagSafe. Sang trọng, đẳng cấp','I1007.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('I1008','Ốp lưng Military iPhone Pro','1',200000.00,'Ốp lưng chống sốc chuẩn quân đội, bảo vệ toàn diện. Tích hợp MagSafe','I1008.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('I1009','Ốp lưng Clear Case iPhone','1',170000.00,'Ốp lưng trong suốt chống ố vàng. Viền màu thời trang, tương thích MagSafe','I1009.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('I11110','Ốp lưng tăng dame khi ném','1',99999999.00,'Ném chó chó chết.\r\nNém người người vong. \r\nVật tự vệ bất ly thân.','I11110.png','2024-12-31 16:43:52','2024-12-31 19:00:20'),('I11111','Ốp lưng tăng dame khi ném V2','1',99999999.99,'Sau sự thành công của Version1, chúng tôi đã khẩn trương ra đời V2.\r\nNgoài tăng sức tấn công ra còn tăng cường phòng ngự.\r\nKhông còn bất cứ thứ gì có thể ngăn cản lại bạn.\r\nCho dù là mưa đạn','I1111.png','2024-12-31 17:37:54','2024-12-31 17:37:54'),('O0001','Ốp lưng chống sốc thời trang trong suốt','2',120000.00,'- Thiết kế bảo vệ Camera không bị trầy xước.\r\n- Chống Sốc 4 Góc.\r\n- Bảo vệ điện thoại tuyệt đối, chiếc điện thoại luôn an toàn\r\n- Chống ố vàng, thời hạn sử dụng lâu.\r\n- Giúp máy giữ nguyên được vẻ đẹp nguyên bản.\r\n- Tăng tính thẩm mĩ cho thiết bị.','O0001.png','2024-12-31 06:10:07','2024-12-31 07:33:04'),('O0002','Ốp lưng chất liệu mịn Obzai','2',120000.00,'Bao toàn bộ điện thoại, bảo vệ điện thoại của bạn khỏi:\r\n- Dấu vân tay.\r\n- Trầy xước.\r\n- Bụi bẩn.\r\n- Trầy xước.\r\n- Hư hỏng.\r\nGiúp chiếc điện thoại xinh đẹp hơn','O0002.png','2024-12-31 06:10:07','2024-12-31 07:33:04'),('O0003','Ốp Shin siêu cấp dễ thương ','2',120000.00,'Thiết kế dựa trên phim Shin – Cậu bé bút chì.\n- Công nghệ in hình chất lượng cao.\n- Hình ảnh chống xước và không bao giờ phai.\n- Không gây cản trở khi sử dụng thiết bị. \n- Thể hiện bản thân cá nhân hóa điện thoại của bạn và làm cho nó nổi bật.\nTạo niềm vui nho nhỏ mỗi ngày cùng chiếc ốp dễ thương.','O0003.png','2024-12-31 06:10:07','2024-12-31 07:33:04'),('O0004','Ốp lưng gấu trúc cute Poma','2',120000.00,'Bao toàn bộ điện thoại, bảo vệ điện thoại của bạn khỏi:\r\n- Dấu vân tay.\r\n- Trầy xước.\r\n- Bụi bẩn.\r\n- Trầy xước.\r\n- Hư hỏng.\r\nChiếc ốp lưng không chỉ giúp bạn bảo vệ điện thoại mà còn khiến chiếc điện thoại nhàm chán trở nên rực rỡ, thu hút mọi ánh nhìn.','O0004.png','2024-12-31 06:10:07','2024-12-31 07:33:04'),('O0005','Ốp lưng silicon trong suốt Oppo','2',120000.00,'Ốp lưng silicon trong suốt, viền màu thời trang. Chống sốc 4 góc','O0005.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('O0006','Ốp lưng nắp gập Oppo','2',150000.00,'Ốp lưng nắp gập thời trang, chống va đập. Tích hợp ngăn đựng thẻ','O0006.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('O0007','Ốp lưng Military Oppo','2',180000.00,'Ốp lưng chống sốc Military grade, bảo vệ toàn diện. Thiết kế nam tính','O0007.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('O0008','Ốp lưng da Oppo Find','2',200000.00,'Ốp lưng da cao cấp, họa tiết vân da tinh tế. Viền TPU mềm chống sốc','O0008.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('S001','Ốp Lưng Sang Trọng Mềm Ốp Lưng Cho Samsung Galaxy','4',100000.00,'- Ốp lưng sang trọng giúp tôn lên đường nét của những chiếc Samsung Galaxy cao cấp. \r\n- Chất liệu silicon giúp bảo vệ tối ưu cho điện thoại nhưng vẫn giữ được trọng lượng nhẹ, giúp trải nghiệm cầm nắm thoải mái','S001.png','2024-12-31 05:56:53','2024-12-31 07:29:54'),('S0010','Ốp lưng da Galaxy Z Flip','4',190000.00,'Ốp lưng da cao cấp cho điện thoại gập, bảo vệ hoàn hảo. Thiết kế sang trọng','S0010.png','2024-12-31 07:27:40','2024-12-31 07:29:54'),('S0011','Ốp lưng Clear Standing Galaxy A','4',120000.00,'Ốp lưng trong suốt tích hợp chân chống. Chống sốc 4 góc, bảo vệ camera','S0011.png','2024-12-31 07:27:40','2024-12-31 07:29:54'),('S0012','Ốp lưng Silicon Galaxy A','4',110000.00,'Ốp lưng silicon màu pastel thời trang. Chống va đập, bảo vệ camera','S0012.png','2024-12-31 07:27:40','2024-12-31 07:29:54'),('S002','Ốp lưng trong suốt mạ từ tính sang trọng cho Samsung Galaxy','4',100000.00,'- Ốp lưng trong suốt và cứng cáp, giúp tôn lên màu sắc nguyên bản của điện thoại - Nhựa TPU cứng cáp giúp bảo vệ điện thoại khỏi những và đập và không lo sỉn màu sau thời gian dài sử dụng.','S002.png','2024-12-31 06:03:04','2024-12-31 07:30:43'),('S003','Ốp điện thoại cứng Gengar thời trang Shine Laser cho Samsung Galaxy ','4',100000.00,' - 100% thương hiệu mới, hoàn toàn phù hợp với điện thoại tình yêu của bạn.\r\n\r\n - Chống bám bụi và trầy xước, ốp lưng chống sốc hiệu quả.','S003.png','2024-12-31 06:03:04','2024-12-31 07:30:43'),('S004','Ốp lưng nắp gập Galaxy Z Flip6 Silicone Samsung Chính hãng','4',100000.00,'- Ốp lưng Samsung dùng cho Galaxy Z Flip6 được thiết kế đặc biệt để tôn lên đường nét tinh tế của điện thoại, với kiểu dáng mỏng nhẹ giúp giữ nguyên sự nhỏ gọn của thiết bị. Dù được bọc bởi một lớp bảo vệ nhưng ốp lưng vẫn đảm bảo không làm gia tăng trọng lượng đáng kể cho chiếc điện thoại của bạn, giúp bạn dễ dàng bỏ túi và mang theo mọi nơi.','S004.png','2024-12-31 06:03:04','2024-12-31 07:30:43'),('S005','Ốp điện thoại silicon bảo vệ toàn diện cho Samsung Galaxy ','4',100000.00,'- Ốp lưng Silicon cao cấp, giúp bảo vệ điện thoại trước mọi va đập, kết hợp với hoạ tiết đẹp mắt giúp làm đẹp chiếc điện thoại của bạn','S005.png','2024-12-31 06:03:04','2024-12-31 07:30:43'),('S006','Ốp điện thoại silicon hoạt hình cho Samsung Galaxy ','4',100000.00,'- Ốp lưng Silicon cao cấp, giúp bảo vệ điện thoại trước mọi va đập, kết hợp với hoạ tiết đẹp mắt giúp làm đẹp chiếc điện thoại của bạn','S006.png','2024-12-31 06:03:04','2024-12-31 07:30:43'),('S007','Ốp lưng silicon trong suốt Galaxy S','4',100000.00,'Ốp lưng silicon trong suốt, viền màu thời trang. Chống sốc 4 góc, bảo vệ camera','S007.png','2024-12-31 07:27:40','2024-12-31 07:29:54'),('S008','Ốp lưng nắp gập Galaxy S','4',130000.00,'Ốp lưng nắp gập cao cấp, chống va đập. Tích hợp ngăn đựng thẻ','S008.png','2024-12-31 07:27:40','2024-12-31 07:29:54'),('S009','Ốp lưng Military Galaxy S Ultra','4',160000.00,'Ốp lưng chống sốc Military grade, bảo vệ toàn diện. Thiết kế nam tính','S009.png','2024-12-31 07:27:40','2024-12-31 07:29:54');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `product_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `product_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES ('A001',100,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('A002',150,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('A003',200,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('A004',122,'2024-12-31 08:19:00','2024-12-31 16:44:51'),('A005',80,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('A006',90,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('A007',110,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('A008',130,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('I1001',100,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('I1002',150,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('I1003',200,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('I1004',120,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('I1005',80,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('I1006',90,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('I1007',110,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('I1008',130,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('I1009',100,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('I11111',1,'2024-12-31 17:37:54','2024-12-31 17:37:54'),('O0001',150,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('O0002',200,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('O0003',120,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('O0004',80,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('O0005',90,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('O0006',110,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('O0007',130,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('O0008',100,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S001',150,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S0010',200,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S0011',120,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S0012',80,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S002',200,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S003',120,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S004',80,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S005',90,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S006',110,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S007',130,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S008',100,'2024-12-31 08:19:00','2024-12-31 08:19:00'),('S009',150,'2024-12-31 08:19:00','2024-12-31 08:19:00');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','Admin','User','0123456789','admin@example.com','123 Admin Street','hashed_password','2024-12-31 19:43:13','2024-12-31 19:43:13','admin'),('USER001','Nguyễn','Văn Tiền','0912345678','nguyenvana@gmail.com','123 Đường Lê Lợi, Quận 1, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER002','Nhậm','Ngã Hành','0987654321','tranthib@gmail.com','456 Đường Nguyễn Huệ, Quận 1, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER003','Lê','Văn Thái','0978123456','levanc@gmail.com','789 Đường Trần Hưng Đạo, Quận 5, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER004','Võ','Văn Vô Địch','0965432187','phamthid@gmail.com','321 Đường Cách Mạng Tháng 8, Quận 3, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER005','Hoàng','Thiên Tôn','0918765432','hoangvane@gmail.com','654 Đường Lý Thường Kiệt, Quận 10, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER006','Đậu','Siêu Quần','0932145678','vuthif@gmail.com','987 Đường Nguyễn Trãi, Quận 5, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER007','Giang ','Bất Ngữ','0945678123','dangvang@gmail.com','159 Đường Lê Văn Sỹ, Quận 3, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER008','Lý','Quy Nhất','0956781234','buithih@gmail.com','753 Đường Võ Văn Tần, Quận 3, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER009','Mạnh','Tử','0967812345','ngovanii@gmail.com','852 Đường Lê Duẩn, Quận 1, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER010','Đỗ','Thị ','0978123456','dothik@gmail.com','456 Đường Nguyễn Thị Minh Khai, Quận 3, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER011','Mai','Thị Lý','0981234567','maivanl@gmail.com','789 Đường Phạm Ngọc Thạch, Quận 3, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER012','Lý','Trường Sinh','0992345678','lythim@gmail.com','123 Đường Nguyễn Đình Chiểu, Quận 3, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER013','Phan','Thị ','0913456789','hovann@gmail.com','456 Đường Lê Quý Đôn, Quận 3, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER014','Trương','Tử Dương','0924567890','truongthio@gmail.com','789 Đường Nguyễn Văn Trỗi, Quận Phú Nhuận, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user'),('USER015','Phan','Văn Vũ','0935678901','phanvanp@gmail.com','321 Đường Trường Chinh, Quận Tân Bình, TP.HCM','password123','2024-12-31 08:22:17','2024-12-31 08:29:14','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'oopsdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-01 22:47:26
