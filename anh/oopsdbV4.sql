
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

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('CAT_A001_1','A001','Redmi Note 12 4G','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_2','A001','Redmi Note 12 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_3','A001','Redmi Note 12 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_4','A001','Redmi Note 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_5','A001','Redmi Note 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A001_6','A001','Redmi Note 13 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_1','A002','Redmi Note 12 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_2','A002','Redmi Note 12 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_3','A002','Redmi Note 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_4','A002','Redmi Note 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_5','A002','Redmi Note 13 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A002_6','A002','Redmi K70','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_1','A003','Redmi Note 12 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_2','A003','Redmi Note 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_3','A003','Redmi Note 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_4','A003','Redmi Note 13 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_5','A003','Redmi K70','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A003_6','A003','Redmi K70 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_1','A004','Redmi Note 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_2','A004','Redmi Note 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_3','A004','Redmi Note 13 Pro+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_4','A004','Redmi K70','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_5','A004','Redmi K70 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_A004_6','A004','Redmi K70E','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_1','I1001','iPhone 11','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_2','I1001','iPhone 12','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_3','I1001','iPhone 12 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_4','I1001','iPhone 12 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_5','I1001','iPhone 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1001_6','I1001','iPhone 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_1','I1002','iPhone 12','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_2','I1002','iPhone 12 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_3','I1002','iPhone 12 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_4','I1002','iPhone 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_5','I1002','iPhone 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1002_6','I1002','iPhone 13 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_1','I1003','iPhone 13','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_2','I1003','iPhone 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_3','I1003','iPhone 13 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_4','I1003','iPhone 14','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_5','I1003','iPhone 14 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1003_6','I1003','iPhone 14 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_1','I1004','iPhone 13 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_2','I1004','iPhone 13 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_3','I1004','iPhone 14','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_4','I1004','iPhone 14 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_5','I1004','iPhone 14 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1004_6','I1004','iPhone 15','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_1','I1005','iPhone 14','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_2','I1005','iPhone 14 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_3','I1005','iPhone 14 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_4','I1005','iPhone 15','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_5','I1005','iPhone 15 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_I1005_6','I1005','iPhone 15 Pro Max','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_1','O0001','OPPO A55','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_2','O0001','OPPO A57','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_3','O0001','OPPO A77s','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_4','O0001','OPPO A96','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_5','O0001','OPPO Reno8 T','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0001_6','O0001','OPPO Reno8 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_1','O0002','OPPO A57','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_2','O0002','OPPO A77s','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_3','O0002','OPPO A96','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_4','O0002','OPPO Reno8 T','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_5','O0002','OPPO Reno8 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0002_6','O0002','OPPO Find N3','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_1','O0003','OPPO A77s','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_2','O0003','OPPO A96','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_3','O0003','OPPO Reno8 T','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_4','O0003','OPPO Reno8 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_5','O0003','OPPO Find N3','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0003_6','O0003','OPPO Find X6 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_1','O0004','OPPO A96','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_2','O0004','OPPO Reno8 T','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_3','O0004','OPPO Reno8 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_4','O0004','OPPO Find N3','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_5','O0004','OPPO Find X6 Pro','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_O0004_6','O0004','OPPO Find X7 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_1','S001','Galaxy S23','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_2','S001','Galaxy S23+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_3','S001','Galaxy S23 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_4','S001','Galaxy S24','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_5','S001','Galaxy S24+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S001_6','S001','Galaxy S24 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_1','S002','Galaxy S23+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_2','S002','Galaxy S23 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_3','S002','Galaxy S24','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_4','S002','Galaxy S24+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_5','S002','Galaxy S24 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S002_6','S002','Galaxy A54','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_1','S003','Galaxy S23 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_2','S003','Galaxy S24','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_3','S003','Galaxy S24+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_4','S003','Galaxy S24 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_5','S003','Galaxy A54','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S003_6','S003','Galaxy A53','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_1','S004','Galaxy Z Flip6','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_2','S004','Galaxy Z Fold6','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_3','S004','Galaxy Z Flip5','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_4','S004','Galaxy Z Fold5','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_5','S004','Galaxy Z Flip4','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S004_6','S004','Galaxy Z Fold4','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_1','S005','Galaxy S24','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_2','S005','Galaxy S24+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_3','S005','Galaxy S24 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_4','S005','Galaxy A54','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_5','S005','Galaxy A53','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S005_6','S005','Galaxy A34','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_1','S006','Galaxy S24+','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_2','S006','Galaxy S24 Ultra','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_3','S006','Galaxy A54','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_4','S006','Galaxy A53','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_5','S006','Galaxy A34','2024-12-31 06:51:43','2024-12-31 06:51:43'),('CAT_S006_6','S006','Galaxy A33','2024-12-31 06:51:43','2024-12-31 06:51:43');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `phone_brands` WRITE;
/*!40000 ALTER TABLE `phone_brands` DISABLE KEYS */;
INSERT INTO `phone_brands` VALUES ('1','Apple','2024-12-29 15:13:43','2024-12-29 15:13:43'),('2','Oppo','2024-12-29 15:13:43','2024-12-29 15:13:43'),('3','Redmi','2024-12-30 15:50:42','2024-12-30 15:50:42'),('4','Samsung','2024-12-30 15:51:44','2024-12-30 15:51:44');
/*!40000 ALTER TABLE `phone_brands` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('A001','ốp lưng Redmi note 12 4G Ốp Điện Thoại tpu Vỏ điện thoại silicon thời trang phổ biến Redmi note 12 4G TSY','3',95000.00,'1. Điểm nổi bật: Vỏ mềm thời trang\r\n\r\n2. Thiết kế: Ống kính đi kèm hoàn toàn! Tăng khả năng bảo vệ máy ảnh!\r\n\r\n3. Hình: sản phẩm chụp thật, mở khuôn máy thật CASE. Vị trí chính xác của điện thoại.','A001.png','2024-12-31 06:03:04','2024-12-31 07:32:32'),('A002','Ốp silicon Phi Hành Gia Dễ Thương ','3',95000.00,'Đặc trưng: kẹo đầy màu sắc nhựa TPU mềm lưng bằng silicon Vỏ mờ, siêu mỏng và trọng lượng nhẹ, bề mặt mịn\r\nPhong cách thiết kế: sang trọng, thời trang, đẹp, dễ thương, mát mẻ','A002.png','2024-12-31 06:06:16','2024-12-31 07:32:32'),('A003','Ốp Khủng long hoạt hình màu xanh lá siêu dễ thương','3',95000.00,'Thương hiệu mới và chất lượng cao, được làm từ Silicone mềm bền.\n\nCông nghệ in hình chất lượng cao.\n\nThiết kế: Khủng long hoạt hình\n\nHình ảnh chống xước và không bao giờ phai.\n\nDễ dàng truy cập vào tất cả các chức năng của điện thoại &amp; Cổng phụ kiện.\n\nThể hiện bản thân cá nhân hóa điện thoại của bạn và làm cho nó nổi bật. Nhiều kiểu dáng và màu sắc trong kho cho bạn lựa chọn. mỗi ngày thay đổi một kiểu để phù hợp với tâm trạng khác nhau của bạn.','A003.png','2024-12-31 06:06:16','2024-12-31 07:32:32'),('A004','Ốp lưng hình cu Shin cùng người ngoài hành tinh siêu cute','3',95000.00,'Thương hiệu mới và chất lượng cao, được làm từ Silicone mềm bền.\r\n\r\n Công nghệ in hình chất lượng cao.\r\n\r\nThiết kế: Mũ người ngoài hành tinh bút chì màu Shinchan\r\n\r\nHình ảnh chống xước và không bao giờ phai.\r\n\r\nDễ dàng truy cập vào tất cả các chức năng của điện thoại và cổng phụ kiện.\r\n\r\nThể hiện bản thân cá nhân hóa điện thoại của bạn và làm cho nó nổi bật. Nhiều kiểu dáng và màu sắc trong kho cho bạn lựa chọn. mỗi ngày thay đổi một kiểu để phù hợp với tâm trạng khác nhau của bạn.','A004.png','2024-12-31 06:06:16','2024-12-31 07:33:57'),('A005','Ốp lưng da thời trang Redmi','3',185000.00,'Ốp lưng da cao cấp, họa tiết vân da tinh tế. Viền TPU mềm chống sốc','A005.png','2024-12-31 07:27:40','2024-12-31 07:32:32'),('A006','Ốp lưng silicon trong suốt Redmi','3',95000.00,'Ốp lưng silicon trong suốt chống sốc 4 góc, bảo vệ camera. Thiết kế vừa vặn, ôm sát máy','A006.png','2024-12-31 07:27:40','2024-12-31 07:32:32'),('A007','Ốp lưng nắp gập thời trang Redmi','3',125000.00,'Ốp lưng nắp gập thời trang, chống va đập, bảo vệ màn hình. Chất liệu da cao cấp','A007.png','2024-12-31 07:27:40','2024-12-31 07:32:32'),('A008','Ốp lưng chống sốc Military Redmi','3',155000.00,'Ốp lưng chống sốc chuẩn quân đội, bảo vệ toàn diện. Thiết kế nam tính, mạnh mẽ','A008.png','2024-12-31 07:27:40','2024-12-31 07:32:32'),('I1001','Ốp lưng nhựa cứng, viền dẻo, trong suốt','1',150000.00,'- Ốp lưng iPhone 11 12 Series sở hữu thiết kế trong suốt, giúp tôn lên vẻ đẹp nguyên bản của điện thoại.\r\n- Mặt lưng được làm từ nhựa cứng bền bỉ, hạn chế trầy xước hiệu quả.\r\n- Kết hợp viền dẻo, hỗ trợ người dùng tháo lắp ốp lưng Kingxbar dễ dàng.\r\n- Ốp lưng ôm vừa khít điện thoại, cho thao tác cầm nắm chắc chắn.','I1001.png','2024-12-29 15:14:16','2024-12-31 07:33:57'),('I10010','Ốp lưng Leather Case iPhone Pro','1',190000.00,'Ốp lưng da cao cấp, viền bảo vệ camera. Tích hợp MagSafe, chống sốc','I1005.png','2024-12-31 07:27:40','2024-12-31 07:27:40'),('I1002','Ốp lưng 6D cao cấp','1',150000.00,'- Chất liệu silicon cao cấp mềm dẻo, đàn hồi tốt, tháo lắp dễ dàng\r\n- Thiết kế mỏng nhẹ ôm sát máy, chống trầy xước khi va chạm\r\n- Các đường xi vàng mạ điện 6D rất sang trọng, bắt mắt\r\n- Cụm camera tinh xảo bảo vệ tối ưu hơn\r\n- Các chi tiết chuẩn xác, hoàn thiện rất tốt\r\n- 3 màu xanh, hồng, trắng thời trang','I1002.png','2024-12-31 05:44:15','2024-12-31 06:11:41'),('I1003','Ốp lưng UAG Monarch 5 lớp chống sốc','1',150000.00,'- 1 trong những dòng ốp lưng cao cấp nhất trên thị trường hiện nay\r\n- Thiết kế 5 lớp độc đáo chưa có dòng ốp nào có\r\n- Sản phẩm hàng hiệu chính hãng UAG (Mỹ)\r\n- Thuộc top những chiếc ốp lưng chống va đập mạnh mẽ nhất (vượt cả tiêu chuẩn quân đội)\r\n- Cảm giác cực chắc chắn, có các gờ chốn trượt khi cầm trên tay\r\n- Thiết kế mạnh mẽ với những đường khối đặc trưng đã làm nên thương hiệu.','I1003.png','2024-12-31 05:46:14','2024-12-31 06:11:41'),('I1004','Ốp lưng da Spigen La Manon','1',150000.00,'Thiết kế vừa vặn và ôm sát thân máy. - Dễ dàng tháo/lắp ốp vào máy.','I1004.png','2024-12-31 05:51:50','2024-12-31 06:11:41'),('I1005','Ốp lưng Apple Silicone Clear Case Trong Suốt hỗ trợ MagSafe chính hãng\r\n','1',150000.00,'- Mỏng, nhẹ và dễ cầm nắm\n- Thiết kế trong suốt không sợ ố vàng, chống xước toàn diện\n- Hỗ trợ sạc không dây nhanh hơn mà không cần tháo ốp, chống rơi rớt','I1005.png','2024-12-31 05:55:11','2024-12-31 07:33:27'),('I1006','Ốp lưng silicon trong suốt iPhone','1',150000.00,'Ốp lưng silicon trong suốt MagSafe, chống sốc 4 góc. Tương thích sạc không dây','I1006.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('I1007','Ốp lưng da Apple iPhone','1',180000.00,'Ốp lưng da chính hãng Apple, tích hợp MagSafe. Sang trọng, đẳng cấp','I1007.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('I1008','Ốp lưng Military iPhone Pro','1',200000.00,'Ốp lưng chống sốc chuẩn quân đội, bảo vệ toàn diện. Tích hợp MagSafe','I1008.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('I1009','Ốp lưng Clear Case iPhone','1',170000.00,'Ốp lưng trong suốt chống ố vàng. Viền màu thời trang, tương thích MagSafe','I1009.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('O0001','Ốp lưng chống sốc thời trang trong suốt','2',120000.00,'- Thiết kế bảo vệ Camera không bị trầy xước.\r\n- Chống Sốc 4 Góc.\r\n- Bảo vệ điện thoại tuyệt đối, chiếc điện thoại luôn an toàn\r\n- Chống ố vàng, thời hạn sử dụng lâu.\r\n- Giúp máy giữ nguyên được vẻ đẹp nguyên bản.\r\n- Tăng tính thẩm mĩ cho thiết bị.','O0001.png','2024-12-31 06:10:07','2024-12-31 07:33:04'),('O0002','Ốp lưng chất liệu mịn Obzai','2',120000.00,'Bao toàn bộ điện thoại, bảo vệ điện thoại của bạn khỏi:\r\n- Dấu vân tay.\r\n- Trầy xước.\r\n- Bụi bẩn.\r\n- Trầy xước.\r\n- Hư hỏng.\r\nGiúp chiếc điện thoại xinh đẹp hơn','O0002.png','2024-12-31 06:10:07','2024-12-31 07:33:04'),('O0003','Ốp Shin siêu cấp dễ thương ','2',120000.00,'Thiết kế dựa trên phim Shin – Cậu bé bút chì.\n- Công nghệ in hình chất lượng cao.\n- Hình ảnh chống xước và không bao giờ phai.\n- Không gây cản trở khi sử dụng thiết bị. \n- Thể hiện bản thân cá nhân hóa điện thoại của bạn và làm cho nó nổi bật.\nTạo niềm vui nho nhỏ mỗi ngày cùng chiếc ốp dễ thương.','O0003.png','2024-12-31 06:10:07','2024-12-31 07:33:04'),('O0004','Ốp lưng gấu trúc cute Poma','2',120000.00,'Bao toàn bộ điện thoại, bảo vệ điện thoại của bạn khỏi:\r\n- Dấu vân tay.\r\n- Trầy xước.\r\n- Bụi bẩn.\r\n- Trầy xước.\r\n- Hư hỏng.\r\nChiếc ốp lưng không chỉ giúp bạn bảo vệ điện thoại mà còn khiến chiếc điện thoại nhàm chán trở nên rực rỡ, thu hút mọi ánh nhìn.','O0004.png','2024-12-31 06:10:07','2024-12-31 07:33:04'),('O0005','Ốp lưng silicon trong suốt Oppo','2',120000.00,'Ốp lưng silicon trong suốt, viền màu thời trang. Chống sốc 4 góc','O0005.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('O0006','Ốp lưng nắp gập Oppo','2',150000.00,'Ốp lưng nắp gập thời trang, chống va đập. Tích hợp ngăn đựng thẻ','O0006.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('O0007','Ốp lưng Military Oppo','2',180000.00,'Ốp lưng chống sốc Military grade, bảo vệ toàn diện. Thiết kế nam tính','O0007.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('O0008','Ốp lưng da Oppo Find','2',200000.00,'Ốp lưng da cao cấp, họa tiết vân da tinh tế. Viền TPU mềm chống sốc','O0008.png','2024-12-31 07:27:40','2024-12-31 07:31:39'),('S001','Ốp Lưng Sang Trọng Mềm Ốp Lưng Cho Samsung Galaxy','4',100000.00,'- Ốp lưng sang trọng giúp tôn lên đường nét của những chiếc Samsung Galaxy cao cấp. \r\n- Chất liệu silicon giúp bảo vệ tối ưu cho điện thoại nhưng vẫn giữ được trọng lượng nhẹ, giúp trải nghiệm cầm nắm thoải mái','S001.png','2024-12-31 05:56:53','2024-12-31 07:29:54'),('S0010','Ốp lưng da Galaxy Z Flip','4',190000.00,'Ốp lưng da cao cấp cho điện thoại gập, bảo vệ hoàn hảo. Thiết kế sang trọng','S0010.png','2024-12-31 07:27:40','2024-12-31 07:29:54'),('S0011','Ốp lưng Clear Standing Galaxy A','4',120000.00,'Ốp lưng trong suốt tích hợp chân chống. Chống sốc 4 góc, bảo vệ camera','S0011.png','2024-12-31 07:27:40','2024-12-31 07:29:54'),('S0012','Ốp lưng Silicon Galaxy A','4',110000.00,'Ốp lưng silicon màu pastel thời trang. Chống va đập, bảo vệ camera','S0012.png','2024-12-31 07:27:40','2024-12-31 07:29:54'),('S002','Ốp lưng trong suốt mạ từ tính sang trọng cho Samsung Galaxy','4',100000.00,'- Ốp lưng trong suốt và cứng cáp, giúp tôn lên màu sắc nguyên bản của điện thoại - Nhựa TPU cứng cáp giúp bảo vệ điện thoại khỏi những và đập và không lo sỉn màu sau thời gian dài sử dụng.','S002.png','2024-12-31 06:03:04','2024-12-31 07:30:43'),('S003','Ốp điện thoại cứng Gengar thời trang Shine Laser cho Samsung Galaxy ','4',100000.00,' - 100% thương hiệu mới, hoàn toàn phù hợp với điện thoại tình yêu của bạn.\r\n\r\n - Chống bám bụi và trầy xước, ốp lưng chống sốc hiệu quả.','S003.png','2024-12-31 06:03:04','2024-12-31 07:30:43'),('S004','Ốp lưng nắp gập Galaxy Z Flip6 Silicone Samsung Chính hãng','4',100000.00,'- Ốp lưng Samsung dùng cho Galaxy Z Flip6 được thiết kế đặc biệt để tôn lên đường nét tinh tế của điện thoại, với kiểu dáng mỏng nhẹ giúp giữ nguyên sự nhỏ gọn của thiết bị. Dù được bọc bởi một lớp bảo vệ nhưng ốp lưng vẫn đảm bảo không làm gia tăng trọng lượng đáng kể cho chiếc điện thoại của bạn, giúp bạn dễ dàng bỏ túi và mang theo mọi nơi.','S004.png','2024-12-31 06:03:04','2024-12-31 07:30:43'),('S005','Ốp điện thoại silicon bảo vệ toàn diện cho Samsung Galaxy ','4',100000.00,'- Ốp lưng Silicon cao cấp, giúp bảo vệ điện thoại trước mọi va đập, kết hợp với hoạ tiết đẹp mắt giúp làm đẹp chiếc điện thoại của bạn','S005.png','2024-12-31 06:03:04','2024-12-31 07:30:43'),('S006','Ốp điện thoại silicon hoạt hình cho Samsung Galaxy ','4',100000.00,'- Ốp lưng Silicon cao cấp, giúp bảo vệ điện thoại trước mọi va đập, kết hợp với hoạ tiết đẹp mắt giúp làm đẹp chiếc điện thoại của bạn','S006.png','2024-12-31 06:03:04','2024-12-31 07:30:43'),('S007','Ốp lưng silicon trong suốt Galaxy S','4',100000.00,'Ốp lưng silicon trong suốt, viền màu thời trang. Chống sốc 4 góc, bảo vệ camera','S007.png','2024-12-31 07:27:40','2024-12-31 07:29:54'),('S008','Ốp lưng nắp gập Galaxy S','4',130000.00,'Ốp lưng nắp gập cao cấp, chống va đập. Tích hợp ngăn đựng thẻ','S008.png','2024-12-31 07:27:40','2024-12-31 07:29:54'),('S009','Ốp lưng Military Galaxy S Ultra','4',160000.00,'Ốp lưng chống sốc Military grade, bảo vệ toàn diện. Thiết kế nam tính','S009.png','2024-12-31 07:27:40','2024-12-31 07:29:54');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


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


LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
-- Dumping routines for database 'oopsdb'
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-31 14:35:38
