-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 103.82.20.69    Database: duocth_development
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (10,'Sao Phương Bắc','Công ty TNHH ĐT&PT Thiết bị y tế Sao Phương Bắc','/images/1732763027992-duocth.png','2024-11-28 10:03:48',NULL),(11,'Phúc Trường Pharma','Công ty cổ phần Dược phẩm và thiết bị y tế Phúc Trường','','2024-11-30 19:53:44',NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributors`
--

DROP TABLE IF EXISTS `distributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributors`
--

LOCK TABLES `distributors` WRITE;
/*!40000 ALTER TABLE `distributors` DISABLE KEYS */;
INSERT INTO `distributors` VALUES (1,'test','test1','2024-11-27 10:55:25','2024-11-27 11:14:38',0),(2,'Sao Phương Bắc','Công ty TNHH ĐT&PT Thiết bị y tế Sao Phương Bắc','2024-11-27 11:22:05',NULL,1),(3,'trình dược Kiên','trình dược Kiên','2024-11-30 19:54:16',NULL,1),(4,'chợ Hapu','chợ Hapu','2024-11-30 20:48:26',NULL,1),(5,'Hoa Lâm','Công ty Hoa Lâm','2024-12-02 19:32:05',NULL,1),(6,'Nhà thuốc Nam Phương','Nhà thuốc Nam Phương','2024-12-03 19:50:38',NULL,1),(7,'Trình dược Trung','Trình dược Trung','2024-12-06 15:40:01',NULL,1),(8,'trình dược Hưng','trình dược Hưng','2024-12-10 20:50:36',NULL,1);
/*!40000 ALTER TABLE `distributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_histories`
--

DROP TABLE IF EXISTS `import_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `distributor_id` int unsigned NOT NULL,
  `unit_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `import_price` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `distributor_id` (`distributor_id`),
  KEY `import_histories_unit_id_foreign` (`unit_id`),
  CONSTRAINT `import_histories_distributor_id_foreign` FOREIGN KEY (`distributor_id`) REFERENCES `distributors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `import_histories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `import_histories_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_histories`
--

LOCK TABLES `import_histories` WRITE;
/*!40000 ALTER TABLE `import_histories` DISABLE KEYS */;
INSERT INTO `import_histories` VALUES (5,5,2,1,5,300000,'2024-12-10 20:49:04',NULL),(6,10,2,1,5,300000,'2024-12-10 20:49:04',NULL),(7,7,2,1,5,250000,'2024-12-10 20:49:04',NULL),(8,9,2,1,5,325000,'2024-12-10 20:49:04',NULL),(9,4,2,1,5,500000,'2024-12-10 20:49:04',NULL),(10,6,2,1,5,175000,'2024-12-10 20:49:04',NULL),(11,11,2,3,20,500000,'2024-12-10 20:49:04',NULL),(12,8,2,1,5,225000,'2024-12-10 20:49:04',NULL),(13,13,2,1,5,150000,'2024-12-10 20:49:04',NULL),(14,12,2,1,20,300000,'2024-12-10 20:49:04',NULL),(15,203,2,1,5,175000,'2024-12-10 20:49:04',NULL),(23,151,8,1,10,912000,'2024-12-10 20:55:40',NULL),(24,150,8,1,10,816000,'2024-12-10 20:55:40',NULL),(25,153,8,1,3,250000,'2024-12-10 20:55:40',NULL),(26,152,8,1,4,440000,'2024-12-10 20:55:40',NULL),(27,157,8,1,6,435000,'2024-12-10 20:55:40',NULL),(28,156,8,1,4,450000,'2024-12-10 20:55:40',NULL),(29,154,8,1,8,210000,'2024-12-10 20:55:40',NULL),(30,155,8,1,2,1,'2024-12-10 20:55:40',NULL),(31,22,8,1,5,445000,'2024-12-10 21:04:51',NULL),(32,21,8,1,5,590000,'2024-12-10 21:04:51',NULL),(33,15,8,1,5,625000,'2024-12-10 21:04:51',NULL),(34,16,8,1,5,625000,'2024-12-10 21:04:51',NULL),(35,24,8,1,5,445000,'2024-12-10 21:04:51',NULL),(36,31,8,1,5,425000,'2024-12-10 21:04:51',NULL),(37,35,8,1,10,360000,'2024-12-10 21:04:51',NULL),(38,34,8,1,5,350000,'2024-12-10 21:04:51',NULL),(39,29,8,1,5,400000,'2024-12-10 21:04:51',NULL),(40,30,8,1,5,445000,'2024-12-10 21:04:51',NULL),(41,27,8,1,5,390000,'2024-12-10 21:04:51',NULL),(42,23,8,1,3,267000,'2024-12-10 21:04:51',NULL),(43,33,8,1,3,189000,'2024-12-10 21:04:51',NULL),(44,25,8,1,3,234000,'2024-12-10 21:04:51',NULL),(45,26,8,1,5,350000,'2024-12-10 21:04:51',NULL),(46,17,8,1,10,320000,'2024-12-10 21:04:51',NULL),(47,20,8,1,3,285000,'2024-12-10 21:04:51',NULL),(48,19,8,1,5,1,'2024-12-10 21:04:51',NULL),(49,18,8,1,1,1,'2024-12-10 21:04:51',NULL),(50,28,8,1,4,1,'2024-12-10 21:04:51',NULL),(51,32,8,1,2,1,'2024-12-10 21:04:51',NULL),(52,170,7,1,5,600000,'2024-12-10 21:16:40',NULL),(53,171,7,1,5,250000,'2024-12-10 21:16:40',NULL),(54,173,7,1,5,400000,'2024-12-10 21:16:40',NULL),(55,169,7,1,5,425000,'2024-12-10 21:16:40',NULL),(56,164,7,1,5,350000,'2024-12-10 21:16:40',NULL),(57,165,7,1,5,300000,'2024-12-10 21:16:40',NULL),(58,167,7,1,5,295000,'2024-12-10 21:16:40',NULL),(59,166,7,1,5,250000,'2024-12-10 21:16:40',NULL),(60,163,7,1,6,900000,'2024-12-10 21:16:40',NULL),(61,168,7,1,3,777000,'2024-12-10 21:16:40',NULL),(62,172,7,1,5,210000,'2024-12-10 21:16:40',NULL),(63,162,7,1,7,770000,'2024-12-10 21:16:40',NULL),(64,158,7,1,5,200000,'2024-12-10 21:16:40',NULL),(65,205,7,1,3,204000,'2024-12-10 21:16:40',NULL),(66,204,7,1,9,1,'2024-12-10 21:16:40',NULL);
/*!40000 ALTER TABLE `import_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knex_migrations`
--

DROP TABLE IF EXISTS `knex_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knex_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knex_migrations`
--

LOCK TABLES `knex_migrations` WRITE;
/*!40000 ALTER TABLE `knex_migrations` DISABLE KEYS */;
INSERT INTO `knex_migrations` VALUES (1,'20241108085941_create_tables.js',1,'2024-11-08 09:09:55');
/*!40000 ALTER TABLE `knex_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knex_migrations_lock`
--

DROP TABLE IF EXISTS `knex_migrations_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knex_migrations_lock` (
  `index` int unsigned NOT NULL AUTO_INCREMENT,
  `is_locked` int DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knex_migrations_lock`
--

LOCK TABLES `knex_migrations_lock` WRITE;
/*!40000 ALTER TABLE `knex_migrations_lock` DISABLE KEYS */;
INSERT INTO `knex_migrations_lock` VALUES (1,0);
/*!40000 ALTER TABLE `knex_migrations_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging_types`
--

DROP TABLE IF EXISTS `logging_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logging_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging_types`
--

LOCK TABLES `logging_types` WRITE;
/*!40000 ALTER TABLE `logging_types` DISABLE KEYS */;
INSERT INTO `logging_types` VALUES (1,'Thêm mới mặt hàng',NULL,NULL),(2,'Xóa mặt hàng',NULL,NULL),(3,'Cập nhật mặt hàng',NULL,NULL),(4,'Nhập hàng',NULL,NULL);
/*!40000 ALTER TABLE `logging_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `p_id` int unsigned DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `menus_p_id_foreign` (`p_id`),
  CONSTRAINT `menus_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,NULL,'Quản trị','/quan-tri','material-symbols:admin-panel-settings-outline-rounded','2024-11-22 10:43:13',NULL,1),(2,1,'Menu','/menu','icon-park-outline:application-menu','2024-11-22 11:38:54',NULL,1),(3,1,'Tài khoản','/tai-khoan','line-md:account','2024-11-22 14:09:49',NULL,1),(4,NULL,'Danh mục','/danh-muc','carbon:catalog','2024-11-22 14:23:15',NULL,1),(5,4,'Đơn vị','/don-vi','ph:unite-duotone','2024-11-22 14:25:04',NULL,1),(6,4,'Công ty','/cong-ty','mdi:drugs','2024-11-22 14:26:18',NULL,1),(7,4,'Nhà phân phối','/nha-phan-phoi','material-symbols:local-shipping-outline-sharp','2024-11-22 14:30:21','2024-11-27 10:16:59',1),(8,4,'Loại thuốc','/loai-thuoc','game-icons:medicines','2024-11-22 14:36:41',NULL,1),(9,NULL,'Quản lý kho','/storage','vaadin:storage','2024-11-27 14:54:34',NULL,1),(10,9,'Mặt hàng','/product','fluent-mdl2:product-variant','2024-11-27 14:59:37',NULL,1),(11,1,'Logging','/logging','mdi:spy','2024-11-28 09:08:46','2024-11-28 09:09:19',1),(12,1,'Dashboard','/dashboard','uil:chart-line','2024-11-28 10:21:52','2024-11-28 10:53:55',1),(13,9,'Nhập hàng','/import','la:shipping-fast','2024-12-03 11:22:55',NULL,1),(14,9,'Dự trù','/plan','fluent-mdl2:product-list','2024-12-03 11:29:11',NULL,1),(15,9,'Kho hàng','/index','vaadin:storage','2024-12-10 16:17:13',NULL,1);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `unit_id` int unsigned NOT NULL,
  `price` bigint unsigned NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `using_from` datetime DEFAULT NULL,
  `stop_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `price_unit_id_foreign` (`unit_id`),
  CONSTRAINT `price_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `price_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_units`
--

DROP TABLE IF EXISTS `product_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_units` (
  `product_id` int unsigned NOT NULL,
  `unit_from_id` int unsigned NOT NULL,
  `quantity_from` int unsigned NOT NULL,
  `unit_to_id` int unsigned NOT NULL,
  `quantity_to` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`unit_from_id`,`unit_to_id`),
  KEY `product_units_unit_from_id_foreign` (`unit_from_id`),
  KEY `product_units_unit_to_id_foreign` (`unit_to_id`),
  CONSTRAINT `product_units_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_units_unit_from_id_foreign` FOREIGN KEY (`unit_from_id`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_units_unit_to_id_foreign` FOREIGN KEY (`unit_to_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_units`
--

LOCK TABLES `product_units` WRITE;
/*!40000 ALTER TABLE `product_units` DISABLE KEYS */;
INSERT INTO `product_units` VALUES (3,1,1,4,1),(4,1,1,5,60),(5,1,1,4,10),(5,4,1,5,10),(6,1,1,4,3),(6,4,1,5,10),(7,1,1,8,20),(7,8,1,10,10),(8,1,1,5,60),(9,1,1,5,30),(10,1,1,5,60),(11,3,1,10,120),(12,1,1,11,2),(12,11,1,10,30),(13,1,1,11,2),(13,11,1,10,30),(14,1,1,1,1),(15,1,1,5,60),(16,1,1,5,60),(17,1,1,5,30),(18,1,1,8,20),(18,8,1,10,10),(19,1,1,8,20),(19,8,1,10,10),(20,1,1,5,30),(21,1,1,7,2),(21,7,1,5,30),(22,1,1,5,60),(23,1,1,5,30),(24,1,1,5,30),(25,1,1,5,30),(26,1,1,8,20),(26,8,1,10,10),(27,1,1,5,30),(28,1,1,8,20),(28,8,1,10,10),(29,1,1,5,60),(30,1,1,5,100),(31,1,1,4,6),(31,4,1,5,10),(32,1,1,5,60),(33,1,1,8,20),(33,8,1,10,10),(34,1,1,8,20),(34,8,1,10,10),(35,1,1,10,125),(36,1,1,11,10),(37,1,1,11,10),(38,11,1,11,1),(39,1,1,4,10),(39,4,1,5,10),(40,1,1,4,10),(40,4,1,5,10),(41,1,1,11,10),(42,1,1,4,5),(42,4,1,5,10),(43,1,1,4,5),(43,4,1,5,12),(44,1,1,5,60),(45,1,1,4,10),(45,4,1,5,10),(46,1,1,4,5),(46,4,1,5,20),(47,1,1,11,20),(47,11,1,10,15),(48,1,1,5,120),(49,1,1,5,20),(50,1,1,4,2),(50,4,1,5,10),(51,1,1,4,3),(51,4,1,5,10),(52,1,1,4,20),(52,4,1,5,5),(53,1,1,4,20),(53,4,1,5,5),(54,1,1,7,1),(55,1,1,7,1),(56,1,1,7,1),(57,1,1,7,1),(58,1,1,7,1),(59,1,1,7,1),(60,1,1,7,1),(60,7,1,5,80),(61,1,1,4,2),(61,4,1,5,12),(62,1,1,11,24),(63,1,1,9,6),(64,1,1,11,12),(65,1,1,5,10),(66,1,1,5,30),(67,1,1,4,2),(67,4,1,5,15),(68,1,1,4,2),(68,4,1,5,15),(69,1,1,4,5),(69,4,1,5,10),(70,1,1,4,2),(70,4,1,5,30),(71,1,1,4,10),(71,4,1,5,10),(72,1,1,4,10),(72,4,1,5,10),(73,1,1,4,10),(73,4,1,5,10),(74,1,1,4,2),(74,4,1,5,7),(75,1,1,4,2),(75,4,1,5,7),(76,1,1,4,10),(76,4,1,5,10),(77,1,1,4,10),(77,4,1,5,10),(78,1,1,4,10),(78,4,1,5,10),(79,1,1,4,1),(79,4,1,5,1),(80,1,1,4,3),(80,4,1,5,10),(81,1,1,4,20),(81,4,1,5,20),(82,1,1,4,3),(82,4,1,5,10),(83,1,1,4,2),(83,4,1,5,10),(84,1,1,4,10),(84,4,1,5,10),(85,1,1,4,2),(85,4,1,5,15),(86,1,1,8,1),(87,1,1,8,1),(88,1,1,4,3),(88,4,1,5,10),(89,1,1,5,4),(90,1,1,4,7),(90,4,1,5,5),(91,1,1,4,5),(91,4,1,5,5),(92,1,1,6,1),(93,1,1,4,10),(93,4,1,5,10),(94,1,1,6,1),(95,1,1,7,12),(96,9,1,7,14),(97,1,1,7,14),(98,1,1,7,14),(99,1,1,3,1),(100,1,1,3,1),(101,1,1,4,10),(101,4,1,5,10),(102,1,1,4,10),(102,4,1,5,10),(103,1,1,4,10),(103,4,1,5,10),(104,1,1,5,30),(105,1,1,5,500),(106,1,1,5,80),(107,1,1,6,1),(108,1,1,4,10),(108,4,1,5,10),(109,1,1,4,5),(109,4,1,5,10),(110,1,1,4,10),(110,4,1,5,10),(111,1,1,4,25),(111,4,1,5,4),(112,1,1,4,25),(112,4,1,5,4),(113,11,1,1,1),(114,3,1,10,500),(115,3,1,10,500),(116,3,1,10,500),(117,3,1,10,500),(118,1,1,7,12),(119,1,1,3,12),(120,1,1,7,1),(121,1,1,3,1),(122,3,1,10,100),(123,3,1,10,17),(124,1,1,4,3),(124,4,1,5,10),(125,3,1,10,20),(126,3,1,10,20),(127,1,1,11,10),(128,1,1,11,20),(129,1,1,11,24),(130,1,1,11,20),(131,1,1,4,10),(131,4,1,5,10),(132,1,1,8,20),(133,1,1,4,10),(133,4,1,5,10),(134,1,1,4,15),(134,4,1,5,12),(135,1,1,3,1),(136,1,1,1,1),(137,3,1,10,750),(138,3,1,10,250),(139,1,1,4,10),(139,4,1,5,10),(140,1,1,7,1),(141,1,1,7,1),(142,1,1,3,1),(143,1,1,4,10),(143,4,1,5,12),(144,1,1,4,10),(144,4,1,5,12),(145,1,1,4,15),(145,4,1,5,12),(146,1,1,4,15),(146,4,1,5,12),(147,1,1,4,10),(147,4,1,5,10),(148,1,1,11,3),(149,1,1,5,30),(150,1,1,8,20),(151,1,1,5,30),(152,1,1,5,30),(153,1,1,8,20),(154,1,1,11,20),(155,1,1,5,2),(156,1,1,11,30),(157,1,1,11,30),(158,1,1,1,1),(159,1,1,1,1),(160,1,1,7,1),(161,1,1,11,1),(162,1,1,5,60),(163,1,1,7,2),(164,1,1,8,20),(165,1,1,4,3),(166,1,1,5,100),(167,1,1,8,20),(168,1,1,7,1),(169,1,1,7,1),(170,1,1,7,1),(171,1,1,11,20),(172,1,1,8,20),(173,1,1,7,1),(174,1,1,6,1),(175,1,1,5,1),(176,1,1,1,1),(177,1,1,1,1),(178,1,1,11,12),(179,1,1,7,1),(180,1,1,7,1),(181,1,1,7,1),(182,1,1,11,20),(183,1,1,7,1),(184,1,1,7,1),(185,1,1,7,1),(186,1,1,11,3),(187,1,1,11,10),(188,1,1,11,20),(189,1,1,6,1),(190,1,1,7,1),(191,1,1,7,1),(192,1,1,7,1),(193,1,1,6,1),(194,1,1,4,10),(195,1,1,11,10),(196,1,1,11,10),(197,1,1,7,1),(198,1,1,8,20),(199,1,1,11,40),(200,1,1,5,50),(201,1,1,11,1),(202,1,1,7,1),(203,1,1,8,20),(204,1,1,4,3),(205,1,1,11,30);
/*!40000 ALTER TABLE `product_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `images` text,
  `description_image` text,
  `company_id` int unsigned DEFAULT NULL,
  `distributor_id` int unsigned DEFAULT NULL,
  `type_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `products_company_id_foreign` (`company_id`),
  KEY `products_distributor_id_foreign` (`distributor_id`),
  KEY `products_type_id_foreign` (`type_id`),
  CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_distributor_id_foreign` FOREIGN KEY (`distributor_id`) REFERENCES `distributors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'test','123','1732871221602-duocth.jpg','1732871221604-duocth.png',10,2,30,'2024-11-29 16:07:01',NULL,0),(4,'XMEN MAX','Bổ thận tráng dương, tăng cường sinh lý nam giới.','1732934300368-duocth.jpg','1732890184198-duocth.jpg',10,2,22,'2024-11-29 21:23:04','2024-11-30 10:19:52',1),(5,'Euro Brain','Hỗ trợ hoạt huyết, tăng cường tuần hoàn máu não','1732938243777-duocth.jpg','1732890695858-duocth.jpg',10,2,19,'2024-11-29 21:31:35','2024-11-30 10:44:03',1),(6,'Fe Pro TĐ','Bổ sung sắt','1732938220080-duocth.jpg','1732891075671-duocth.jpg',10,2,25,'2024-11-29 21:37:55','2024-11-30 10:43:40',1),(7,'Bibifuta Plus','Giúp nhuận trang','','1732891479404-duocth.jpg',10,2,20,'2024-11-29 21:44:39',NULL,1),(8,'Omega3','Bổ sung DHA, hỗ trợ phát triển não, cải thiện thị lực','','1732891644467-duocth.jpg',10,2,21,'2024-11-29 21:47:24','2024-11-30 09:53:32',1),(9,'Anlevit Mama','Bổ sung vi chất dinh dưỡng, tăng cường sức khỏe cho phụ nữ có thai','','1732891755118-duocth.jpg',10,2,25,'2024-11-29 21:49:15',NULL,1),(10,'Cà Gai Leo','Mát gan, giải độc gan','','1732891856391-duocth.jpg',10,2,6,'2024-11-29 21:50:56',NULL,1),(11,'Paravip Plus','Siro ho','','1732892204751-duocth.jpg',10,2,40,'2024-11-29 21:56:44',NULL,1),(12,'Onyx Magic - dầu gội đen thảo dược','','','1732895485996-duocth.jpg',10,2,30,'2024-11-29 22:51:26',NULL,1),(13,'Onyx Magic - dầu gội nâu thảo dược','','','1732895517888-duocth.jpg',10,2,30,'2024-11-29 22:51:57',NULL,1),(14,'test','','','',NULL,2,15,'2024-11-30 14:54:30',NULL,0),(15,'Vai gáy TP','Giảm đau mỏi khớp xương, chân tay, vai, gáy','','1732971514899-duocth.jpg',11,3,41,'2024-11-30 19:58:02',NULL,1),(16,'Glucosamin Extra','Hỗ trợ giảm triệu chứng đau khớp, khô khớp do viêm khớp, thoái hóa khớp','','1732971657978-duocth.jpg',11,3,41,'2024-11-30 20:00:25',NULL,1),(17,'Viên ngậm bổ phế STUX-TP','hỗ trợ bổ phế, giảm ho, giảm đờm, giảm đau rát họng','','1732971774641-duocth.jpg',11,3,40,'2024-11-30 20:02:22',NULL,1),(18,'ZinC - TP','bổ sung kẽm và vitamin C','','1732971891369-duocth.jpg',11,3,25,'2024-11-30 20:04:18',NULL,1),(19,'Sáng mắt Eyes Kid','hỗ trợ tăng cường thị lực','','1732971984220-duocth.jpg',11,3,21,'2024-11-30 20:05:51',NULL,1),(20,'BOTIMA - Bổ tim','hỗ trợ giảm mỡ máu','','1732972252202-duocth.jpg',11,3,42,'2024-11-30 20:10:19',NULL,1),(21,'Silymazin TP - Linh chi xanh','Giải độc gan, mát gan, tăng cường chức năng gan','','1732972380475-duocth.jpg',11,3,6,'2024-11-30 20:12:27',NULL,1),(22,'Bổ gan TP','Hỗ trợ giảm triệu chứng: mề đay, mẩn ngứa, vàng da, mệt mỏi do chức năng gan kém','','1732972475608-duocth.jpg',11,3,6,'2024-11-30 20:14:03',NULL,1),(23,'Bổ thận Mãnh Vương','Hàu biển - Ba kích - nấm Ngọc Cẩu','','1732972556258-duocth.jpg',11,3,22,'2024-11-30 20:15:23',NULL,1),(24,'Viên dưỡng não Brain Extra','Dùng cho người rối loạn tiền đình, mất ngủ','','1732972650524-duocth.jpg',11,3,19,'2024-11-30 20:16:58',NULL,1),(25,'Viên tiểu đêm - Bổ thận vương','Giúp bổ thận, hỗ trợ giảm triệu chứng đi tiểu nhiều lần, tiểu đêm do thận kém','','1732972787880-duocth.jpg',11,3,22,'2024-11-30 20:19:15',NULL,1),(26,'Ăn ngon SumoKid - TP','Hỗ trợ ăn ngon, tăng cường sức khỏe, nâng cao sức đề kháng','','1732972893235-duocth.jpg',11,3,25,'2024-11-30 20:21:00',NULL,1),(27,'Bổ huyết điều kinh - TP','Giúp bổ huyết, hỗ trợ điều hòa kinh nguyệt. Cải thiện tình trạng kinh nguyệt không đều, đau bụng khi hành kinh','','1732973429725-duocth.jpg',11,3,23,'2024-11-30 20:29:57',NULL,1),(28,'Liver Kid MAX','Hỗ trợ thanh nhiệt, mát gan, giảm triệu chứng rôm sảy, mẩn ngứa, mề đay','','1732973636992-duocth.jpg',11,3,6,'2024-11-30 20:33:24',NULL,1),(29,'Omega 369 (60 viên)','Hỗ trợ cho thị lực, não bộ','','1732973808075-duocth.jpg',11,3,21,'2024-11-30 20:36:15',NULL,1),(30,'Omega 369 (100 viên)','Hỗ trợ cho thị lực, não bộ','','1732973850178-duocth.jpg',11,3,21,'2024-11-30 20:36:57',NULL,1),(31,'Đông trùng linh chi - TP','hỗ trợ ăn ngon, nâng cao sức đề kháng, giúp giảm mệt mỏi','','1732973949982-duocth.jpg',11,3,25,'2024-11-30 20:38:37',NULL,1),(32,'Nutri Vita','Hỗ trợ tăng cường sức khỏe, nâng cao sức đề kháng, giúp giảm mệt mỏi','','1732974049603-duocth.jpg',11,3,25,'2024-11-30 20:40:17',NULL,1),(33,'Calci Healthy - TP','Bổ sung canxi cho cơ thể','','1732974275165-duocth.jpg',11,3,25,'2024-11-30 20:44:02',NULL,1),(34,'Thymomodulin - TP','Hỗ trợ tăng cường sức khỏe, nâng cao sức đề kháng','','1732974342229-duocth.jpg',11,3,25,'2024-11-30 20:45:09',NULL,1),(35,'Rockaho - TP','Hỗ trợ giảm ho, giảm đờm','','1732974385993-duocth.jpg',11,3,40,'2024-11-30 20:45:53',NULL,1),(36,'Bao cao su - True love (Gai)','','','1732974644434-duocth.jpg',NULL,4,29,'2024-11-30 20:50:11',NULL,1),(37,'Bao cao su - True love (Trơn)','','','1732974671539-duocth.jpg',NULL,4,29,'2024-11-30 20:50:39',NULL,1),(38,'Bông y tế An Lành','Bông y tế ','','1733142871412-duocth.jpg',NULL,5,37,'2024-12-02 19:33:55',NULL,1),(39,'Lodextrin','Ho cảm cúm','','1733143027638-duocth.jpg',10,5,8,'2024-12-02 19:36:32',NULL,1),(40,'Hagizin','Dự phòng chứng đau nửa đầu','','1733143149884-duocth.jpg',NULL,5,13,'2024-12-02 19:38:34',NULL,1),(41,'ADKold - New','Giảm triệu chứng ngạt mũi, dị ứng','','1733143555797-duocth.jpg',NULL,5,8,'2024-12-02 19:45:20',NULL,1),(42,'Boganic','Bỏ gan','','1733143723993-duocth.jpg',NULL,5,43,'2024-12-02 19:48:08',NULL,1),(43,'Đại tràng Tâm Bình','Dùng cho người bị viêm đại tràng cấp và mãn tính, người bị rối loạn tiêu hóa','','1733143878613-duocth.jpg',NULL,5,20,'2024-12-02 19:50:43',NULL,1),(44,'Viêm khớp Tâm Bình','','','1733144014373-duocth.jpg',NULL,5,41,'2024-12-02 19:52:58',NULL,1),(45,'Cefadroxil','','','1733144152329-duocth.jpg',NULL,5,2,'2024-12-02 19:55:16',NULL,1),(46,'Hoạt huyết dưỡng não - Traphaco','','','1733144315532-duocth.jpg',NULL,5,44,'2024-12-02 19:57:59',NULL,1),(47,'Yumangel','','','1733144435610-duocth.jpg',NULL,5,14,'2024-12-02 20:00:00',NULL,1),(48,'Khương Thảo Đan','','','1733144535042-duocth.jpg',NULL,5,41,'2024-12-02 20:01:39',NULL,1),(49,'Vương Bảo','Tiền liệt tuyến','','1733144654012-duocth.jpg',NULL,5,26,'2024-12-02 20:03:38',NULL,1),(50,'Bảo Khí Khang','','','1733144768858-duocth.jpg',NULL,5,40,'2024-12-02 20:05:33',NULL,1),(51,'Ích Thận Vương','','','1733144851584-duocth.jpg',NULL,5,22,'2024-12-02 20:06:56',NULL,1),(52,'Viên ngậm ho bổ phế Bảo Thanh - (không đường)','','','1733145029625-duocth.jpg',NULL,5,15,'2024-12-02 20:08:53','2024-12-02 20:09:54',1),(53,'Viên ngậm ho bổ phế Bảo Thanh - (có đường)','','','1733145133521-duocth.jpg',NULL,5,15,'2024-12-02 20:11:37',NULL,1),(54,'Dầu gội dược liệu Nguyên Xuân - Bồng bềnh','','','1733145234965-duocth.jpg',NULL,5,30,'2024-12-02 20:13:19',NULL,1),(55,'Dầu gội dược liệu Nguyên Xuân đỏ','','','1733145318017-duocth.jpg',NULL,5,30,'2024-12-02 20:14:42',NULL,1),(56,'Dầu gội dược liệu Nguyên Xuân xanh','','','1733145372154-duocth.jpg',NULL,5,30,'2024-12-02 20:15:36',NULL,1),(57,'Bổ phế Nam Hà - có đường','','','1733145498061-duocth.jpg',NULL,5,40,'2024-12-02 20:17:42',NULL,1),(58,'Bổ phế Nam Hà - không đường','','','1733145561767-duocth.jpg',NULL,5,40,'2024-12-02 20:18:46',NULL,1),(59,'Thuốc ho bổ phế Bảo Thanh','','','1733145679217-duocth.jpg',NULL,5,15,'2024-12-02 20:20:43',NULL,1),(60,'Vương Bảo - lọ','','','1733145784532-duocth.jpg',NULL,5,26,'2024-12-02 20:22:28',NULL,1),(61,'Viên ngậm bổ phế Nam Hà','','','1733145879555-duocth.jpg',NULL,5,40,'2024-12-02 20:24:04',NULL,1),(62,'Gaviscon','','','1733145990074-duocth.jpg',NULL,5,14,'2024-12-02 20:25:54',NULL,1),(63,'Băng y tế - to','','','1733146104481-duocth.jpg',NULL,5,37,'2024-12-02 20:27:48',NULL,1),(64,'Băng y tế - bé','','','1733146156874-duocth.jpg',NULL,5,37,'2024-12-02 20:28:41',NULL,1),(65,'AgiMycob','','','1733146263539-duocth.jpg',NULL,5,11,'2024-12-02 20:30:27',NULL,1),(66,'Sâm nhung bổ thận Tw3','','','1733146385794-duocth.jpg',NULL,5,45,'2024-12-02 20:32:30',NULL,1),(67,'Glucophage - 1000mg','','','1733146519240-duocth.jpg',NULL,5,10,'2024-12-02 20:34:13','2024-12-02 20:34:43',1),(68,'Glucophage - 750mg','','','1733146589595-duocth.jpg',NULL,5,10,'2024-12-02 20:35:54',NULL,1),(69,'Glucophage - 500mg','','','1733146669495-duocth.jpg',NULL,5,10,'2024-12-02 20:37:13',NULL,1),(70,'Diamicron MR','','','1733146763893-duocth.jpg',NULL,5,10,'2024-12-02 20:38:48',NULL,1),(71,'Ciprofloxacin 500mg','','','1733146884694-duocth.jpg',NULL,5,2,'2024-12-02 20:40:49',NULL,1),(72,'Amoxicilin 500mg','','','1733146973861-duocth.jpg',NULL,5,2,'2024-12-02 20:42:18',NULL,1),(73,'Ampicilin 500mg','','','1733147067488-duocth.jpg',NULL,5,2,'2024-12-02 20:43:51',NULL,1),(74,'Augmentin - 1g','','','1733147258043-duocth.jpg',NULL,5,2,'2024-12-02 20:47:02',NULL,1),(75,'Augmentin - 625mg','','','1733147290387-duocth.jpg',NULL,5,2,'2024-12-02 20:47:34',NULL,1),(76,'Penicilin V Kali','','','1733147372526-duocth.jpg',NULL,5,2,'2024-12-02 20:48:56',NULL,1),(77,'Viên Xuyên Hương','','','1733147451312-duocth.jpg',NULL,5,26,'2024-12-02 20:50:15',NULL,1),(78,'Amlodipin 5mg','','','1733147544082-duocth.jpg',NULL,5,9,'2024-12-02 20:51:48',NULL,1),(79,'Tránh thai khẩn cấp - Mifestad 10','','','1733147649494-duocth.jpg',NULL,5,13,'2024-12-02 20:53:33',NULL,1),(80,'Stadovas 5 CAP','','','1733147747305-duocth.jpg',NULL,5,9,'2024-12-02 20:55:11',NULL,1),(81,'Cotrimoxazol 480 mg','','','1733147829323-duocth.jpg',NULL,5,2,'2024-12-02 20:56:33',NULL,1),(82,'Hoạt huyết Nhất Nhất','','','1733148003764-duocth.jpg',NULL,5,44,'2024-12-02 20:59:28',NULL,1),(83,'xương khớp Nhất Nhất','','','1733148094217-duocth.jpg',NULL,5,46,'2024-12-02 21:00:58',NULL,1),(84,'Flamipio','','','1733148189039-duocth.jpg',NULL,5,12,'2024-12-02 21:02:33',NULL,1),(85,'Alpha Choay','','','1733148289146-duocth.jpg',NULL,5,13,'2024-12-02 21:04:13',NULL,1),(86,'Nhiệt kế thủy ngân','','','1733148437242-duocth.jpg',NULL,5,47,'2024-12-02 21:06:41',NULL,1),(87,'Nhiệt kế điện tử','','','1733148515912-duocth.jpg',NULL,5,47,'2024-12-02 21:08:00',NULL,1),(88,'Tanganil 500mg','Chóng mặt','','1733148645414-duocth.jpg',NULL,5,48,'2024-12-02 21:10:09',NULL,1),(89,'Siloflam 100mg','Kích dục','','1733148768515-duocth.jpg',NULL,5,13,'2024-12-02 21:12:12',NULL,1),(90,'Acyclovir 400mg','','','1733148879303-duocth.jpg',NULL,5,8,'2024-12-02 21:14:03',NULL,1),(91,'Acyclovir 200mg','','','1733149016372-duocth.jpg',NULL,5,8,'2024-12-02 21:16:20',NULL,1),(92,'Que thử thai - Quick 3','','','1733149115591-duocth.jpg',NULL,5,29,'2024-12-02 21:18:00',NULL,1),(93,'Đề kháng phòng phong','','','1733149244713-duocth.jpg',NULL,5,25,'2024-12-02 21:20:09',NULL,1),(94,'Kem Gót sen','','','1733149396648-duocth.jpg',NULL,5,33,'2024-12-02 21:22:41',NULL,1),(95,'Que thử thai - Quick TANA','','','1733149499480-duocth.jpg',NULL,5,29,'2024-12-02 21:24:23',NULL,1),(96,'Nước oxy già','','','1733149604126-duocth.jpg',NULL,5,38,'2024-12-02 21:26:08','2024-12-09 16:02:07',1),(97,'Cồn 70 độ','','','1733149624596-duocth.jpg',NULL,5,38,'2024-12-02 21:26:29',NULL,1),(98,'Cồn 90 độ','','','1733149643212-duocth.jpg',NULL,5,38,'2024-12-02 21:26:47',NULL,1),(99,'Dầu gội Thái Dương 3 - xanh','','','1733149729213-duocth.jpg',NULL,5,30,'2024-12-02 21:28:13',NULL,1),(100,'Dầu gội Thái Dương 3 - đỏ','','','1733149777442-duocth.jpg',NULL,5,30,'2024-12-02 21:29:01',NULL,1),(101,'Omicet','','','1733149879199-duocth.jpg',NULL,5,8,'2024-12-02 21:30:43',NULL,1),(102,'Cetirizine STELLA 10mg','','','1733149966592-duocth.jpg',NULL,5,8,'2024-12-02 21:32:11',NULL,1),(103,'Notilumnata','Chống nôn','','1733150068763-duocth.jpg',NULL,5,12,'2024-12-02 21:33:53',NULL,1),(104,'Coversyl 5mg','Huyết áp','','1733150139335-duocth.jpg',NULL,5,9,'2024-12-02 21:35:03',NULL,1),(105,'Becberin to','','','1733150222621-duocth.jpg',NULL,5,20,'2024-12-02 21:36:27',NULL,1),(106,'Becberin bé','','','1733150270631-duocth.jpg',NULL,5,20,'2024-12-02 21:37:15',NULL,1),(107,'Kem đánh răng Ngọc Châu','','','1733150318951-duocth.jpg',NULL,5,32,'2024-12-02 21:38:03',NULL,1),(108,'Serapid Flunarizine - 5mg','','','1733230415636-duocth.jpg',NULL,6,49,'2024-12-03 19:53:35',NULL,1),(109,'Cebraton','','','1733230533446-duocth.jpg',NULL,6,44,'2024-12-03 19:55:33',NULL,1),(110,'Piracetam 400mg','','','1733230595752-duocth.jpg',NULL,6,49,'2024-12-03 19:56:35',NULL,1),(111,'Tiffy','','','1733230718026-duocth.jpg',NULL,6,15,'2024-12-03 19:58:38',NULL,1),(112,'Decolgen - Gây buồn ngủ','','','1733230805556-duocth.jpg',NULL,6,15,'2024-12-03 20:00:05',NULL,1),(113,'Cao Sao vàng - bé','','','1733230880847-duocth.jpg',NULL,6,17,'2024-12-03 20:01:20',NULL,1),(114,'Nước súc miệng TB','','','1733230972667-duocth.jpg',NULL,6,48,'2024-12-03 20:02:52',NULL,1),(115,'Nước súc miệng TB - Trắng','','','1733231068401-duocth.jpg',NULL,6,48,'2024-12-03 20:04:28',NULL,1),(116,'Nước súc miệng Thái Dương','','','1733231193952-duocth.jpg',NULL,6,48,'2024-12-03 20:06:33',NULL,1),(117,'Nước súc miệng Valentine','','','1733231251017-duocth.jpg',NULL,6,48,'2024-12-03 20:07:31',NULL,1),(118,'Cao Sao vàng - to','','','1733231332830-duocth.jpg',NULL,6,17,'2024-12-03 20:08:52',NULL,1),(119,'Dầu gió Thiên Thảo','','','1733231410853-duocth.jpg',NULL,6,17,'2024-12-03 20:10:10',NULL,1),(120,'TobraDex','','','1733231517794-duocth.jpg',NULL,6,50,'2024-12-03 20:11:57',NULL,1),(121,'Siro Methorphan','','','1733231761605-duocth.jpg',NULL,6,40,'2024-12-03 20:16:01','2024-12-03 21:00:38',1),(122,'Povidon IOD 10%','','','1733231897536-duocth.jpg',NULL,6,51,'2024-12-03 20:18:17',NULL,1),(123,'Xanh methylen','','','1733231958278-duocth.jpg',NULL,6,51,'2024-12-03 20:19:18',NULL,1),(124,'NENI800','','','1733232049631-duocth.jpg',NULL,6,49,'2024-12-03 20:20:49',NULL,1),(125,'Povidon IOD 10% - nhỏ','','','1733232156040-duocth.jpg',NULL,6,51,'2024-12-03 20:22:36',NULL,1),(126,'ASA','','','1733232235390-duocth.jpg',NULL,6,51,'2024-12-03 20:23:55',NULL,1),(127,'SALONSIP','','','1733232346482-duocth.jpg',NULL,6,37,'2024-12-03 20:25:46',NULL,1),(128,'SALONPAS','','','1733232436350-duocth.jpg',NULL,6,37,'2024-12-03 20:27:16',NULL,1),(129,'Hapacol 150','','','1733232566383-duocth.jpg',NULL,6,15,'2024-12-03 20:29:26',NULL,1),(130,'Cao dán YAGUCHI','','','1733232704412-duocth.jpg',NULL,6,37,'2024-12-03 20:31:44',NULL,1),(131,'Rumenadol','','','1733232769959-duocth.jpg',NULL,6,8,'2024-12-03 20:32:49',NULL,1),(132,'Enterogermina - Pháp','','','1733232850958-duocth.jpg',NULL,6,14,'2024-12-03 20:34:10',NULL,1),(133,'Coldacmin','','','1733232909276-duocth.jpg',NULL,6,15,'2024-12-03 20:35:09',NULL,1),(134,'Phazandol Extra','','','1733232979619-duocth.jpg',NULL,6,44,'2024-12-03 20:36:19',NULL,1),(135,'Dầu gừng Thái Dương - nhỏ','','','1733233096890-duocth.jpg',NULL,6,17,'2024-12-03 20:38:16',NULL,1),(136,'Dầu gừng Thái Dương - to','','','1733233143133-duocth.jpg',NULL,6,17,'2024-12-03 20:39:03',NULL,1),(137,'Nước súc miệng Listerine - to','','','1733233288208-duocth.jpg',NULL,6,48,'2024-12-03 20:41:28',NULL,1),(138,'Nước súc miệng Listerine - nhỏ','','','1733233335850-duocth.jpg',NULL,6,48,'2024-12-03 20:42:15',NULL,1),(139,'Cefuroxim 500mg','','','1733233455665-duocth.jpg',NULL,6,2,'2024-12-03 20:44:15',NULL,1),(140,'V.Rohto Vitamin','','','1733233629901-duocth.jpg',NULL,6,52,'2024-12-03 20:47:09',NULL,1),(141,'V.Rohto','','','1733233725308-duocth.jpg',NULL,6,52,'2024-12-03 20:48:45',NULL,1),(142,'Prospan','','','1733233775094-duocth.jpg',NULL,6,15,'2024-12-03 20:49:35',NULL,1),(143,'Phazandol','','','1733233993635-duocth.jpg',NULL,6,44,'2024-12-03 20:53:13',NULL,1),(144,'Panadol','','','1733234101820-duocth.jpg',NULL,6,44,'2024-12-03 20:55:01',NULL,1),(145,'Panadol Extra','','','1733234226255-duocth.jpg',NULL,6,44,'2024-12-03 20:57:06',NULL,1),(146,'Panadol Cảm cúm','','','1733234321465-duocth.jpg',NULL,6,44,'2024-12-03 20:58:41',NULL,1),(147,'Thuốc ho Methorphan','','','1733234384825-duocth.jpg',NULL,6,8,'2024-12-03 20:59:44',NULL,1),(148,'Nhuộm tóc Hán Phương','','','1733234568697-duocth.jpg',NULL,6,30,'2024-12-03 21:02:48',NULL,1),(149,'Viên bổ máu Fe Folic','','','',NULL,4,25,'2024-12-06 15:41:49',NULL,1),(150,'CanxiPro extra','Hõ trợ giảm nguy cơ còi xương ở trẻ và loãng xương ở người lớn','','1733490999167-duocth.jpg',NULL,4,41,'2024-12-06 20:16:39',NULL,1),(151,'Collagen Peptid+','','','1733491050499-duocth.jpg',NULL,4,23,'2024-12-06 20:17:30',NULL,1),(152,'Max Gan','','','1733491088122-duocth.jpg',NULL,4,6,'2024-12-06 20:18:08',NULL,1),(153,'Biozim Pro','','','1733491151537-duocth.jpg',NULL,4,20,'2024-12-06 20:19:11',NULL,1),(154,'Nilcox','','','1733491202956-duocth.jpg',NULL,4,15,'2024-12-06 20:20:02',NULL,1),(155,'MelyGra','Kích dục','','1733491243452-duocth.jpg',NULL,4,13,'2024-12-06 20:20:43',NULL,1),(156,'Bolabio','','','1733491314640-duocth.jpg',NULL,4,14,'2024-12-06 20:21:54',NULL,1),(157,'Gelactive','','','1733491366969-duocth.jpg',NULL,4,14,'2024-12-06 20:22:46',NULL,1),(158,'Đông trùng sâm nhung hồi sức','','','1733491481236-duocth.jpg',NULL,4,25,'2024-12-06 20:24:41',NULL,1),(159,'Dung dịch vệ sinh','','','1733626968524-duocth.jpg',NULL,4,23,'2024-12-08 10:02:48',NULL,1),(160,'Thuốc nhỏ mắt, mũi Natri Colrid 0.9%','','','1733627611022-duocth.jpg',NULL,NULL,51,'2024-12-08 10:12:46',NULL,1),(161,'Thuốc xịt mũi Xylogen','','','1733627662186-duocth.jpg',NULL,NULL,51,'2024-12-08 10:13:37',NULL,1),(162,'L-Ornithine 450','','','1733628201052-duocth.jpg',NULL,NULL,6,'2024-12-08 10:22:36',NULL,1),(163,'Đông trùng ĐB Hoàng Liên','','','1733628251166-duocth.jpg',NULL,NULL,25,'2024-12-08 10:24:11',NULL,1),(164,'SPO Probiotic','','','1733628299427-duocth.jpg',NULL,NULL,20,'2024-12-08 10:24:59',NULL,1),(165,'Đại tràng MB','','','1733628334695-duocth.jpg',NULL,NULL,20,'2024-12-08 10:25:34',NULL,1),(166,'Đông trùng tỏi đen TBP','','','1733628438842-duocth.jpg',NULL,NULL,25,'2024-12-08 10:27:18',NULL,1),(167,'Canxixikkao','','','1733628505992-duocth.jpg',NULL,NULL,41,'2024-12-08 10:28:25',NULL,1),(168,'Sắc Hồng Xuân','','','1733839812257-duocth.jpg',NULL,NULL,23,'2024-12-08 10:31:14','2024-12-10 21:10:12',1),(169,'Vitamin E đỏ','','','1733628724756-duocth.jpg',NULL,NULL,23,'2024-12-08 10:32:04',NULL,1),(170,'XJoint','','','1733628768345-duocth.jpg',NULL,NULL,41,'2024-12-08 10:32:48',NULL,1),(171,'Stomach','','','1733628796694-duocth.jpg',NULL,NULL,20,'2024-12-08 10:33:16',NULL,1),(172,'Thanh nhiệt mát gan','','','1733628845333-duocth.jpg',NULL,NULL,6,'2024-12-08 10:34:05',NULL,1),(173,'Aquamin tảo biển','','','1733628867703-duocth.jpg',NULL,NULL,41,'2024-12-08 10:34:27',NULL,1),(174,'Jasunny Cream','','','1733629078950-duocth.jpg',NULL,NULL,18,'2024-12-08 10:37:58',NULL,1),(175,'Cabendaz','','','1733629104231-duocth.jpg',NULL,NULL,14,'2024-12-08 10:38:24',NULL,1),(176,'Que thử thai HCG','','','1733629154082-duocth.jpg',NULL,NULL,29,'2024-12-08 10:39:14',NULL,1),(177,'Bao cao su Goldentime','','','1733629201863-duocth.jpg',NULL,NULL,29,'2024-12-08 10:40:01',NULL,1),(178,'Bao cao su Zero ','','','1733629255237-duocth.jpg',NULL,NULL,29,'2024-12-08 10:40:55',NULL,1),(179,'Naphazolin 0.05%','','','1733629363878-duocth.jpg',NULL,NULL,15,'2024-12-08 10:42:43',NULL,1),(180,'Tobradico','','','1733629395347-duocth.jpg',NULL,NULL,52,'2024-12-08 10:43:15',NULL,1),(181,'Kem nẻ Nice Cream','','','1733629453952-duocth.jpg',NULL,NULL,33,'2024-12-08 10:44:13',NULL,1),(182,'Giải rượu VN16','','','1733629504656-duocth.jpg',NULL,NULL,26,'2024-12-08 10:45:04',NULL,1),(183,'Goues Aviphar','','','1733629576956-duocth.jpg',NULL,NULL,41,'2024-12-08 10:46:16',NULL,1),(184,'Siro Bách Thảo','','','1733629620691-duocth.jpg',NULL,NULL,40,'2024-12-08 10:47:00',NULL,1),(185,'Aviphar TĐ','','','1733629783046-duocth.jpg',NULL,NULL,24,'2024-12-08 10:49:43',NULL,1),(186,'Bao cao su Lusex - nhỏ','','','1733629834107-duocth.jpg',NULL,NULL,29,'2024-12-08 10:50:34',NULL,1),(187,'Bao cao su Lusex - to','','','1733629867954-duocth.jpg',NULL,NULL,29,'2024-12-08 10:50:51','2024-12-08 10:51:07',1),(188,'Alumag - S','','','1733629937383-duocth.jpg',NULL,NULL,14,'2024-12-08 10:52:17',NULL,1),(189,'Multi Pluss++','','','1733630022051-duocth.jpg',NULL,NULL,53,'2024-12-08 10:53:42',NULL,1),(190,'Ryo Aquamin','','','1733630212768-duocth.jpg',NULL,NULL,41,'2024-12-08 10:56:08',NULL,1),(191,'Bổ thận - Tiểu đêm','','','1733630266058-duocth.jpg',NULL,NULL,22,'2024-12-08 10:57:01',NULL,1),(192,'Dung dịch vệ sinh mũi Seanex-Dc','','','1733630371763-duocth.jpg',NULL,NULL,15,'2024-12-08 10:58:47',NULL,1),(193,'Kem bôi da BongMakup','','','1733630449676-duocth.jpg',NULL,NULL,18,'2024-12-08 11:00:05',NULL,1),(194,'Samtrum 40mg','','','1733630494560-duocth.jpg',NULL,NULL,12,'2024-12-08 11:00:50',NULL,1),(195,'Saporo đỏ','','','1733630566629-duocth.jpg',NULL,NULL,29,'2024-12-08 11:02:02',NULL,1),(196,'Saporo xanh','','','1733630585830-duocth.jpg',NULL,NULL,29,'2024-12-08 11:02:21',NULL,1),(197,'Eye Plus Aviphar','','','1733630660196-duocth.jpg',NULL,NULL,21,'2024-12-08 11:03:35',NULL,1),(198,'Alphakid Gold','','','1733630782709-duocth.jpg',NULL,NULL,6,'2024-12-08 11:05:38',NULL,1),(199,'Phong thấp Thiên Đức - túi','','','1733630917195-duocth.jpg',NULL,NULL,41,'2024-12-08 11:06:54','2024-12-08 11:07:52',1),(200,'Phong thấp Thiên Đức - viên','','','1733630907635-duocth.jpg',NULL,NULL,41,'2024-12-08 11:07:43',NULL,1),(201,'Kẹo Calci - DHA','','','1733630954061-duocth.jpg',NULL,NULL,26,'2024-12-08 11:08:29',NULL,1),(202,'Povidon IOD','','','1733631115006-duocth.jpg',NULL,NULL,38,'2024-12-08 11:11:10',NULL,1),(203,'Bogakid','','','1733838502532-duocth.jpg',NULL,NULL,6,'2024-12-10 20:48:22',NULL,1),(204,'Horica','','','1733840110297-duocth.png',NULL,NULL,40,'2024-12-10 21:15:10',NULL,1),(205,'LactoGold','','','1733840146880-duocth.jpg',NULL,NULL,20,'2024-12-10 21:15:46',NULL,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator',NULL,NULL),(2,'user','User',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `unit_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `storage_unit_id_foreign` (`unit_id`),
  CONSTRAINT `storage_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `storage_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (9,5,1,5,'2024-12-10 20:49:04',NULL),(10,10,1,5,'2024-12-10 20:49:04',NULL),(11,7,1,5,'2024-12-10 20:49:04',NULL),(12,9,1,5,'2024-12-10 20:49:04',NULL),(13,4,1,5,'2024-12-10 20:49:04',NULL),(14,6,1,5,'2024-12-10 20:49:04',NULL),(15,11,3,20,'2024-12-10 20:49:04',NULL),(16,8,1,5,'2024-12-10 20:49:04',NULL),(17,13,1,5,'2024-12-10 20:49:04',NULL),(18,12,1,20,'2024-12-10 20:49:04',NULL),(19,203,1,5,'2024-12-10 20:49:04',NULL),(27,151,1,10,'2024-12-10 20:55:40',NULL),(28,150,1,10,'2024-12-10 20:55:40',NULL),(29,153,1,3,'2024-12-10 20:55:40',NULL),(30,152,1,4,'2024-12-10 20:55:40',NULL),(31,157,1,6,'2024-12-10 20:55:40',NULL),(32,156,1,4,'2024-12-10 20:55:40',NULL),(33,154,1,8,'2024-12-10 20:55:40',NULL),(34,155,1,2,'2024-12-10 20:55:40',NULL),(35,22,1,5,'2024-12-10 21:04:51',NULL),(36,21,1,5,'2024-12-10 21:04:51',NULL),(37,15,1,5,'2024-12-10 21:04:51',NULL),(38,16,1,5,'2024-12-10 21:04:51',NULL),(39,24,1,5,'2024-12-10 21:04:51',NULL),(40,31,1,5,'2024-12-10 21:04:51',NULL),(41,35,1,10,'2024-12-10 21:04:51',NULL),(42,34,1,5,'2024-12-10 21:04:51',NULL),(43,29,1,5,'2024-12-10 21:04:51',NULL),(44,30,1,5,'2024-12-10 21:04:51',NULL),(45,27,1,5,'2024-12-10 21:04:51',NULL),(46,23,1,3,'2024-12-10 21:04:51',NULL),(47,33,1,3,'2024-12-10 21:04:51',NULL),(48,25,1,3,'2024-12-10 21:04:51',NULL),(49,26,1,5,'2024-12-10 21:04:51',NULL),(50,17,1,10,'2024-12-10 21:04:51',NULL),(51,20,1,3,'2024-12-10 21:04:51',NULL),(52,19,1,5,'2024-12-10 21:04:51',NULL),(53,18,1,1,'2024-12-10 21:04:51',NULL),(54,28,1,4,'2024-12-10 21:04:51',NULL),(55,32,1,2,'2024-12-10 21:04:51',NULL),(56,170,1,5,'2024-12-10 21:16:40',NULL),(57,171,1,5,'2024-12-10 21:16:40',NULL),(58,173,1,5,'2024-12-10 21:16:40',NULL),(59,169,1,5,'2024-12-10 21:16:40',NULL),(60,164,1,5,'2024-12-10 21:16:40',NULL),(61,165,1,5,'2024-12-10 21:16:40',NULL),(62,167,1,5,'2024-12-10 21:16:40',NULL),(63,166,1,5,'2024-12-10 21:16:40',NULL),(64,163,1,6,'2024-12-10 21:16:40',NULL),(65,168,1,3,'2024-12-10 21:16:40',NULL),(66,172,1,5,'2024-12-10 21:16:40',NULL),(67,162,1,7,'2024-12-10 21:16:40',NULL),(68,158,1,5,'2024-12-10 21:16:40',NULL),(69,205,1,3,'2024-12-10 21:16:40',NULL),(70,204,1,9,'2024-12-10 21:16:40',NULL);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_logs`
--

DROP TABLE IF EXISTS `system_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `logging_type_id` int unsigned NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_logs_logging_type_id_foreign` (`logging_type_id`),
  KEY `system_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `system_logs_logging_type_id_foreign` FOREIGN KEY (`logging_type_id`) REFERENCES `logging_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `system_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_logs`
--

LOCK TABLES `system_logs` WRITE;
/*!40000 ALTER TABLE `system_logs` DISABLE KEYS */;
INSERT INTO `system_logs` VALUES (2,1,1,'Thêm mặt hàng: test','2024-11-29 16:07:01',NULL),(3,1,2,'Xóa mặt hàng: test','2024-11-29 16:54:23',NULL),(4,1,1,'Thêm mặt hàng: XMEN MAX','2024-11-29 21:23:04',NULL),(5,1,1,'Thêm mặt hàng: Euro Brain','2024-11-29 21:31:35',NULL),(6,1,1,'Thêm mặt hàng: Fe Pro TĐ','2024-11-29 21:37:55',NULL),(7,1,1,'Thêm mặt hàng: Bibifuta Plus','2024-11-29 21:44:39',NULL),(8,1,1,'Thêm mặt hàng: Omega3','2024-11-29 21:47:24',NULL),(9,1,1,'Thêm mặt hàng: Anlevit Mama','2024-11-29 21:49:15',NULL),(10,1,1,'Thêm mặt hàng: Cà Gai Leo','2024-11-29 21:50:56',NULL),(11,1,1,'Thêm mặt hàng: Paravip Plus','2024-11-29 21:56:44',NULL),(12,1,1,'Thêm mặt hàng: Onyx Magic - dầu gội đen thảo dược','2024-11-29 22:51:26',NULL),(13,1,1,'Thêm mặt hàng: Onyx Magic - dầu gội nâu thảo dược','2024-11-29 22:51:57',NULL),(20,1,3,'Cập nhật mặt hàng: XMEN MAX1','2024-11-30 09:37:58',NULL),(21,1,3,'Cập nhật mặt hàng: XMEN MAX','2024-11-30 09:38:20',NULL),(25,1,3,'Cập nhật mặt hàng: Omega3','2024-11-30 09:53:24',NULL),(26,1,3,'Cập nhật mặt hàng: Omega31','2024-11-30 09:53:32',NULL),(30,1,3,'Cập nhật mặt hàng: XMEN MAX','2024-11-30 10:19:52',NULL),(33,1,3,'Cập nhật mặt hàng: Euro Brain','2024-11-30 10:23:01',NULL),(37,1,3,'Cập nhật mặt hàng: Euro Brain1','2024-11-30 10:28:21',NULL),(38,1,3,'Cập nhật mặt hàng: Euro Brain','2024-11-30 10:28:37',NULL),(39,1,3,'Cập nhật mặt hàng: Euro Brain','2024-11-30 10:43:08',NULL),(40,1,3,'Cập nhật mặt hàng: Fe Pro TĐ','2024-11-30 10:43:40',NULL),(41,1,3,'Cập nhật mặt hàng: Euro Brain1','2024-11-30 10:44:03',NULL),(42,1,1,'Thêm mặt hàng: test','2024-11-30 14:54:30',NULL),(43,1,2,'Xóa mặt hàng: test','2024-11-30 14:54:38',NULL),(44,1,1,'Thêm mặt hàng: Vai gáy TP','2024-11-30 19:58:02',NULL),(45,1,1,'Thêm mặt hàng: Glucosamin Extra','2024-11-30 20:00:25',NULL),(46,1,1,'Thêm mặt hàng: Viên ngậm bổ phế STUX-TP','2024-11-30 20:02:22',NULL),(47,1,1,'Thêm mặt hàng: ZinC - TP','2024-11-30 20:04:18',NULL),(48,1,1,'Thêm mặt hàng: Sáng mắt Eyes Kid','2024-11-30 20:05:51',NULL),(49,1,1,'Thêm mặt hàng: BOTIMA - Bổ tim','2024-11-30 20:10:19',NULL),(50,1,1,'Thêm mặt hàng: Silymazin TP - Linh chi xanh','2024-11-30 20:12:27',NULL),(51,1,1,'Thêm mặt hàng: Bổ gan TP','2024-11-30 20:14:03',NULL),(52,1,1,'Thêm mặt hàng: Bổ thận Mãnh Vương','2024-11-30 20:15:23',NULL),(53,1,1,'Thêm mặt hàng: Viên dưỡng não Brain Extra','2024-11-30 20:16:58',NULL),(54,1,1,'Thêm mặt hàng: Viên tiểu đêm - Bổ thận vương','2024-11-30 20:19:15',NULL),(55,1,1,'Thêm mặt hàng: Ăn ngon SumoKid - TP','2024-11-30 20:21:00',NULL),(56,1,1,'Thêm mặt hàng: Bổ huyết điều kinh - TP','2024-11-30 20:29:57',NULL),(57,1,1,'Thêm mặt hàng: Liver Kid MAX','2024-11-30 20:33:24',NULL),(58,1,1,'Thêm mặt hàng: Omega 369 (60 viên)','2024-11-30 20:36:15',NULL),(59,1,1,'Thêm mặt hàng: Omega 369 (100 viên)','2024-11-30 20:36:57',NULL),(60,1,1,'Thêm mặt hàng: Đông trùng linh chi - TP','2024-11-30 20:38:37',NULL),(61,1,1,'Thêm mặt hàng: Nutri Vita','2024-11-30 20:40:17',NULL),(62,1,1,'Thêm mặt hàng: Calci Healthy - TP','2024-11-30 20:44:02',NULL),(63,1,1,'Thêm mặt hàng: Thymomodulin - TP','2024-11-30 20:45:09',NULL),(64,1,1,'Thêm mặt hàng: Rockaho - TP','2024-11-30 20:45:53',NULL),(65,1,1,'Thêm mặt hàng: Bao cao su - True love (Gai)','2024-11-30 20:50:11',NULL),(66,1,1,'Thêm mặt hàng: Bao cao su - True love (Trơn)','2024-11-30 20:50:39',NULL),(67,1,1,'Thêm mặt hàng: Bông y tế An Lành','2024-12-02 19:33:55',NULL),(68,1,1,'Thêm mặt hàng: Lodextrin','2024-12-02 19:36:32',NULL),(69,1,1,'Thêm mặt hàng: Hagizin','2024-12-02 19:38:34',NULL),(70,1,1,'Thêm mặt hàng: ADKold - New','2024-12-02 19:45:20',NULL),(71,1,1,'Thêm mặt hàng: Boganic','2024-12-02 19:48:08',NULL),(72,1,1,'Thêm mặt hàng: Đại tràng Tâm Bình','2024-12-02 19:50:43',NULL),(73,1,1,'Thêm mặt hàng: Viêm khớp Tâm Bình','2024-12-02 19:52:58',NULL),(74,1,1,'Thêm mặt hàng: Cefadroxil','2024-12-02 19:55:16',NULL),(75,1,1,'Thêm mặt hàng: Hoạt huyết dưỡng não - Traphaco','2024-12-02 19:57:59',NULL),(76,1,1,'Thêm mặt hàng: Yumangel','2024-12-02 20:00:00',NULL),(77,1,1,'Thêm mặt hàng: Khương Thảo Đan','2024-12-02 20:01:39',NULL),(78,1,1,'Thêm mặt hàng: Vương Bảo','2024-12-02 20:03:38',NULL),(79,1,1,'Thêm mặt hàng: Bảo Khí Khang','2024-12-02 20:05:33',NULL),(80,1,1,'Thêm mặt hàng: Ích Thận Vương','2024-12-02 20:06:56',NULL),(81,1,1,'Thêm mặt hàng: Viên ngậm ho bổ phế Bảo Thanh','2024-12-02 20:08:53',NULL),(82,1,3,'Cập nhật mặt hàng: Viên ngậm ho bổ phế Bảo Thanh','2024-12-02 20:09:54',NULL),(83,1,1,'Thêm mặt hàng: Viên ngậm ho bổ phế Bảo Thanh - (có đường)','2024-12-02 20:11:37',NULL),(84,1,1,'Thêm mặt hàng: Dầu gội dược liệu Nguyên Xuân - Bồng bềnh','2024-12-02 20:13:19',NULL),(85,1,1,'Thêm mặt hàng: Dầu gội dược liệu Nguyên Xuân đỏ','2024-12-02 20:14:42',NULL),(86,1,1,'Thêm mặt hàng: Dầu gội dược liệu Nguyên Xuân xanh','2024-12-02 20:15:36',NULL),(87,1,1,'Thêm mặt hàng: Bổ phế Nam Hà - có đường','2024-12-02 20:17:42',NULL),(88,1,1,'Thêm mặt hàng: Bổ phế Nam Hà - không đường','2024-12-02 20:18:46',NULL),(89,1,1,'Thêm mặt hàng: Thuốc ho bổ phế Bảo Thanh','2024-12-02 20:20:43',NULL),(90,1,1,'Thêm mặt hàng: Vương Bảo - lọ','2024-12-02 20:22:28',NULL),(91,1,1,'Thêm mặt hàng: Viên ngậm bổ phế Nam Hà','2024-12-02 20:24:04',NULL),(92,1,1,'Thêm mặt hàng: Gaviscon','2024-12-02 20:25:54',NULL),(93,1,1,'Thêm mặt hàng: Băng y tế - to','2024-12-02 20:27:48',NULL),(94,1,1,'Thêm mặt hàng: Băng y tế - bé','2024-12-02 20:28:41',NULL),(95,1,1,'Thêm mặt hàng: AgiMycob','2024-12-02 20:30:27',NULL),(96,1,1,'Thêm mặt hàng: Sâm nhung bổ thận Tw3','2024-12-02 20:32:30',NULL),(97,1,1,'Thêm mặt hàng: Glucophage','2024-12-02 20:34:13',NULL),(98,1,3,'Cập nhật mặt hàng: Glucophage','2024-12-02 20:34:43',NULL),(99,1,1,'Thêm mặt hàng: Glucophage - 750mg','2024-12-02 20:35:54',NULL),(100,1,1,'Thêm mặt hàng: Glucophage - 500mg','2024-12-02 20:37:13',NULL),(101,1,1,'Thêm mặt hàng: Diamicron MR','2024-12-02 20:38:48',NULL),(102,1,1,'Thêm mặt hàng: Ciprofloxacin 500mg','2024-12-02 20:40:49',NULL),(103,1,1,'Thêm mặt hàng: Amoxicilin 500mg','2024-12-02 20:42:18',NULL),(104,1,1,'Thêm mặt hàng: Ampicilin 500mg','2024-12-02 20:43:51',NULL),(105,1,1,'Thêm mặt hàng: Augmentin - 1g','2024-12-02 20:47:02',NULL),(106,1,1,'Thêm mặt hàng: Augmentin - 625mg','2024-12-02 20:47:34',NULL),(107,1,1,'Thêm mặt hàng: Penicilin V Kali','2024-12-02 20:48:56',NULL),(108,1,1,'Thêm mặt hàng: Viên Xuyên Hương','2024-12-02 20:50:15',NULL),(109,1,1,'Thêm mặt hàng: Amlodipin 5mg','2024-12-02 20:51:48',NULL),(110,1,1,'Thêm mặt hàng: Tránh thai khẩn cấp - Mifestad 10','2024-12-02 20:53:33',NULL),(111,1,1,'Thêm mặt hàng: Stadovas 5 CAP','2024-12-02 20:55:11',NULL),(112,1,1,'Thêm mặt hàng: Cotrimoxazol 480 mg','2024-12-02 20:56:33',NULL),(113,1,1,'Thêm mặt hàng: Hoạt huyết Nhất Nhất','2024-12-02 20:59:28',NULL),(114,1,1,'Thêm mặt hàng: xương khớp Nhất Nhất','2024-12-02 21:00:58',NULL),(115,1,1,'Thêm mặt hàng: Flamipio','2024-12-02 21:02:33',NULL),(116,1,1,'Thêm mặt hàng: Alpha Choay','2024-12-02 21:04:13',NULL),(117,1,1,'Thêm mặt hàng: Nhiệt kế thủy ngân','2024-12-02 21:06:41',NULL),(118,1,1,'Thêm mặt hàng: Nhiệt kế điện tử','2024-12-02 21:08:00',NULL),(119,1,1,'Thêm mặt hàng: Tanganil 500mg','2024-12-02 21:10:09',NULL),(120,1,1,'Thêm mặt hàng: Siloflam 100mg','2024-12-02 21:12:12',NULL),(121,1,1,'Thêm mặt hàng: Acyclovir 400mg','2024-12-02 21:14:03',NULL),(122,1,1,'Thêm mặt hàng: Acyclovir 200mg','2024-12-02 21:16:20',NULL),(123,1,1,'Thêm mặt hàng: Que thử thai - Quick 3','2024-12-02 21:18:00',NULL),(124,1,1,'Thêm mặt hàng: Đề kháng phòng phong','2024-12-02 21:20:09',NULL),(125,1,1,'Thêm mặt hàng: Kem Gót sen','2024-12-02 21:22:41',NULL),(126,1,1,'Thêm mặt hàng: Que thử thai - Quick TANA','2024-12-02 21:24:23',NULL),(127,1,1,'Thêm mặt hàng: Nước oxy già','2024-12-02 21:26:08',NULL),(128,1,1,'Thêm mặt hàng: Cồn 70 độ','2024-12-02 21:26:29',NULL),(129,1,1,'Thêm mặt hàng: Cồn 90 độ','2024-12-02 21:26:47',NULL),(130,1,1,'Thêm mặt hàng: Dầu gội Thái Dương 3 - xanh','2024-12-02 21:28:13',NULL),(131,1,1,'Thêm mặt hàng: Dầu gội Thái Dương 3 - đỏ','2024-12-02 21:29:01',NULL),(132,1,1,'Thêm mặt hàng: Omicet','2024-12-02 21:30:43',NULL),(133,1,1,'Thêm mặt hàng: Cetirizine STELLA 10mg','2024-12-02 21:32:11',NULL),(134,1,1,'Thêm mặt hàng: Notilumnata','2024-12-02 21:33:53',NULL),(135,1,1,'Thêm mặt hàng: Coversyl 5mg','2024-12-02 21:35:03',NULL),(136,1,1,'Thêm mặt hàng: Becberin to','2024-12-02 21:36:27',NULL),(137,1,1,'Thêm mặt hàng: Becberin bé','2024-12-02 21:37:15',NULL),(138,1,1,'Thêm mặt hàng: Kem đánh răng Ngọc Châu','2024-12-02 21:38:03',NULL),(139,1,1,'Thêm mặt hàng: Serapid Flunarizine - 5mg','2024-12-03 19:53:35',NULL),(140,1,1,'Thêm mặt hàng: Cebraton','2024-12-03 19:55:33',NULL),(141,1,1,'Thêm mặt hàng: Piracetam 400mg','2024-12-03 19:56:35',NULL),(142,1,1,'Thêm mặt hàng: Tiffy','2024-12-03 19:58:38',NULL),(143,1,1,'Thêm mặt hàng: Decolgen - Gây buồn ngủ','2024-12-03 20:00:05',NULL),(144,1,1,'Thêm mặt hàng: Cao Sao vàng - bé','2024-12-03 20:01:20',NULL),(145,1,1,'Thêm mặt hàng: Nước súc miệng TB','2024-12-03 20:02:52',NULL),(146,1,1,'Thêm mặt hàng: Nước súc miệng TB - Trắng','2024-12-03 20:04:28',NULL),(147,1,1,'Thêm mặt hàng: Nước súc miệng Thái Dương','2024-12-03 20:06:33',NULL),(148,1,1,'Thêm mặt hàng: Nước súc miệng Valentine','2024-12-03 20:07:31',NULL),(149,1,1,'Thêm mặt hàng: Cao Sao vàng - to','2024-12-03 20:08:52',NULL),(150,1,1,'Thêm mặt hàng: Dầu gió Thiên Thảo','2024-12-03 20:10:10',NULL),(151,1,1,'Thêm mặt hàng: TobraDex','2024-12-03 20:11:57',NULL),(152,1,1,'Thêm mặt hàng: Methorphan','2024-12-03 20:16:01',NULL),(153,1,1,'Thêm mặt hàng: Povidon IOD 10%','2024-12-03 20:18:17',NULL),(154,1,1,'Thêm mặt hàng: Xanh methylen','2024-12-03 20:19:18',NULL),(155,1,1,'Thêm mặt hàng: NENI800','2024-12-03 20:20:49',NULL),(156,1,1,'Thêm mặt hàng: Povidon IOD 10% - nhỏ','2024-12-03 20:22:36',NULL),(157,1,1,'Thêm mặt hàng: ASA','2024-12-03 20:23:55',NULL),(158,1,1,'Thêm mặt hàng: SALONSIP','2024-12-03 20:25:46',NULL),(159,1,1,'Thêm mặt hàng: SALONPAS','2024-12-03 20:27:16',NULL),(160,1,1,'Thêm mặt hàng: Hapacol 150','2024-12-03 20:29:26',NULL),(161,1,1,'Thêm mặt hàng: Cao dán YAGUCHI','2024-12-03 20:31:44',NULL),(162,1,1,'Thêm mặt hàng: Rumenadol','2024-12-03 20:32:49',NULL),(163,1,1,'Thêm mặt hàng: Enterogermina - Pháp','2024-12-03 20:34:10',NULL),(164,1,1,'Thêm mặt hàng: Coldacmin','2024-12-03 20:35:09',NULL),(165,1,1,'Thêm mặt hàng: Phazandol Extra','2024-12-03 20:36:19',NULL),(166,1,1,'Thêm mặt hàng: Dầu gừng Thái Dương - nhỏ','2024-12-03 20:38:16',NULL),(167,1,1,'Thêm mặt hàng: Dầu gừng Thái Dương - to','2024-12-03 20:39:03',NULL),(168,1,1,'Thêm mặt hàng: Nước súc miệng Listerine - to','2024-12-03 20:41:28',NULL),(169,1,1,'Thêm mặt hàng: Nước súc miệng Listerine - nhỏ','2024-12-03 20:42:15',NULL),(170,1,1,'Thêm mặt hàng: Cefuroxim 500mg','2024-12-03 20:44:15',NULL),(171,1,1,'Thêm mặt hàng: V.Rohto Vitamin','2024-12-03 20:47:09',NULL),(172,1,1,'Thêm mặt hàng: V.Rohto','2024-12-03 20:48:45',NULL),(173,1,1,'Thêm mặt hàng: Prospan','2024-12-03 20:49:35',NULL),(174,1,1,'Thêm mặt hàng: Phazandol','2024-12-03 20:53:13',NULL),(175,1,1,'Thêm mặt hàng: Panadol','2024-12-03 20:55:01',NULL),(176,1,1,'Thêm mặt hàng: Panadol Extra','2024-12-03 20:57:06',NULL),(177,1,1,'Thêm mặt hàng: Panadol Cảm cúm','2024-12-03 20:58:41',NULL),(178,1,1,'Thêm mặt hàng: Thuốc ho Methorphan','2024-12-03 20:59:44',NULL),(179,1,3,'Cập nhật mặt hàng: Methorphan','2024-12-03 21:00:38',NULL),(180,1,1,'Thêm mặt hàng: Nhuộm tóc Hán Phương','2024-12-03 21:02:48',NULL),(181,1,1,'Thêm mặt hàng: Viên bổ máu Fe Folic','2024-12-06 15:41:49',NULL),(182,1,1,'Thêm mặt hàng: CanxiPro extra','2024-12-06 20:16:39',NULL),(183,1,1,'Thêm mặt hàng: Collagen Peptid+','2024-12-06 20:17:30',NULL),(184,1,1,'Thêm mặt hàng: Max Gan','2024-12-06 20:18:08',NULL),(185,1,1,'Thêm mặt hàng: Biozim Pro','2024-12-06 20:19:11',NULL),(186,1,1,'Thêm mặt hàng: Nilcox','2024-12-06 20:20:02',NULL),(187,1,1,'Thêm mặt hàng: MelyGra','2024-12-06 20:20:43',NULL),(188,1,1,'Thêm mặt hàng: Bolabio','2024-12-06 20:21:54',NULL),(189,1,1,'Thêm mặt hàng: Gelactive','2024-12-06 20:22:46',NULL),(190,1,1,'Thêm mặt hàng: Đông trùng sâm nhung hồi sức','2024-12-06 20:24:41',NULL),(191,1,1,'Thêm mặt hàng: Dung dịch vệ sinh','2024-12-08 10:02:48',NULL),(192,1,1,'Thêm mặt hàng: Thuốc nhỏ mắt, mũi Natri Colrid 0.9%','2024-12-08 10:12:46',NULL),(193,1,1,'Thêm mặt hàng: Thuốc xịt mũi Xylogen','2024-12-08 10:13:37',NULL),(194,1,1,'Thêm mặt hàng: L-Ornithine 450','2024-12-08 10:22:36',NULL),(195,1,1,'Thêm mặt hàng: Đông trùng ĐB Hoàng Liên','2024-12-08 10:24:11',NULL),(196,1,1,'Thêm mặt hàng: SPO Probiotic','2024-12-08 10:24:59',NULL),(197,1,1,'Thêm mặt hàng: Đại tràng MB','2024-12-08 10:25:34',NULL),(198,1,1,'Thêm mặt hàng: Đông trùng tỏi đen TBP','2024-12-08 10:27:18',NULL),(199,1,1,'Thêm mặt hàng: Canxixikkao','2024-12-08 10:28:25',NULL),(200,1,1,'Thêm mặt hàng: Sắc Hồng Xuân','2024-12-08 10:31:14',NULL),(201,1,1,'Thêm mặt hàng: Vitamin E đỏ','2024-12-08 10:32:04',NULL),(202,1,1,'Thêm mặt hàng: XJoint','2024-12-08 10:32:48',NULL),(203,1,1,'Thêm mặt hàng: Stomach','2024-12-08 10:33:16',NULL),(204,1,1,'Thêm mặt hàng: Thanh nhiệt mát gan','2024-12-08 10:34:05',NULL),(205,1,1,'Thêm mặt hàng: Aquamin tảo biển','2024-12-08 10:34:27',NULL),(206,1,1,'Thêm mặt hàng: Jasunny Cream','2024-12-08 10:37:58',NULL),(207,1,1,'Thêm mặt hàng: Cabendaz','2024-12-08 10:38:24',NULL),(208,1,1,'Thêm mặt hàng: Que thử thai HCG','2024-12-08 10:39:14',NULL),(209,1,1,'Thêm mặt hàng: Bao cao su Goldentime','2024-12-08 10:40:01',NULL),(210,1,1,'Thêm mặt hàng: Bao cao su Zero ','2024-12-08 10:40:55',NULL),(211,1,1,'Thêm mặt hàng: Naphazolin 0.05%','2024-12-08 10:42:43',NULL),(212,1,1,'Thêm mặt hàng: Tobradico','2024-12-08 10:43:15',NULL),(213,1,1,'Thêm mặt hàng: Kem nẻ Nice Cream','2024-12-08 10:44:13',NULL),(214,1,1,'Thêm mặt hàng: Giải rượu VN16','2024-12-08 10:45:04',NULL),(215,1,1,'Thêm mặt hàng: Goues Aviphar','2024-12-08 10:46:16',NULL),(216,1,1,'Thêm mặt hàng: Siro Bách Thảo','2024-12-08 10:47:00',NULL),(217,1,1,'Thêm mặt hàng: Aviphar TĐ','2024-12-08 10:49:43',NULL),(218,1,1,'Thêm mặt hàng: Bao cao su Lusex - nhỏ','2024-12-08 10:50:34',NULL),(219,1,1,'Thêm mặt hàng: Bao cao su Lusex - to','2024-12-08 10:50:51',NULL),(220,1,3,'Cập nhật mặt hàng: Bao cao su Lusex - to','2024-12-08 10:51:07',NULL),(221,1,1,'Thêm mặt hàng: Alumag - S','2024-12-08 10:52:17',NULL),(222,1,1,'Thêm mặt hàng: Multi Pluss++','2024-12-08 10:53:42',NULL),(223,1,1,'Thêm mặt hàng: Ryo Aquamin','2024-12-08 10:56:08',NULL),(224,1,1,'Thêm mặt hàng: Bổ thận - Tiểu đêm','2024-12-08 10:57:01',NULL),(225,1,1,'Thêm mặt hàng: Dung dịch vệ sinh mũi Seanex-Dc','2024-12-08 10:58:47',NULL),(226,1,1,'Thêm mặt hàng: Kem bôi da BongMakup','2024-12-08 11:00:05',NULL),(227,1,1,'Thêm mặt hàng: Samtrum 40mg','2024-12-08 11:00:50',NULL),(228,1,1,'Thêm mặt hàng: Saporo đỏ','2024-12-08 11:02:02',NULL),(229,1,1,'Thêm mặt hàng: Saporo xanh','2024-12-08 11:02:21',NULL),(230,1,1,'Thêm mặt hàng: Eye Plus Aviphar','2024-12-08 11:03:35',NULL),(231,1,1,'Thêm mặt hàng: Alphakid Gold','2024-12-08 11:05:38',NULL),(232,1,1,'Thêm mặt hàng: Phong thấp Thiên Đức','2024-12-08 11:06:54',NULL),(233,1,3,'Cập nhật mặt hàng: Phong thấp Thiên Đức','2024-12-08 11:07:13',NULL),(234,1,1,'Thêm mặt hàng: Phong thấp Thiên Đức - viên','2024-12-08 11:07:43',NULL),(235,1,3,'Cập nhật mặt hàng: Phong thấp Thiên Đức - viên hoàn','2024-12-08 11:07:52',NULL),(236,1,1,'Thêm mặt hàng: Kẹo Calci - DHA','2024-12-08 11:08:29',NULL),(237,1,1,'Thêm mặt hàng: Povidon IOD','2024-12-08 11:11:10',NULL),(238,1,3,'Cập nhật mặt hàng: Nước oxy già','2024-12-09 16:02:07',NULL),(244,1,4,'Nhập hàng từ nhà phân phối 2 với tổng giá trị 900000','2024-12-10 15:50:59',NULL),(245,1,4,'Nhập hàng từ nhà phân phối 2 với tổng giá trị 200000','2024-12-10 15:55:03',NULL),(246,1,1,'Thêm mặt hàng: Bogakid','2024-12-10 20:48:22',NULL),(247,1,4,'Nhập hàng từ nhà phân phối 2 với tổng giá trị 3200000','2024-12-10 20:49:04',NULL),(248,1,4,'Nhập hàng từ nhà phân phối 8 với tổng giá trị 3513001','2024-12-10 20:55:40',NULL),(249,1,4,'Nhập hàng từ nhà phân phối 8 với tổng giá trị 6745004','2024-12-10 21:04:51',NULL),(250,1,3,'Cập nhật mặt hàng: Sắc Hồng Xuân','2024-12-10 21:10:12',NULL),(251,1,1,'Thêm mặt hàng: Horica','2024-12-10 21:15:10',NULL),(252,1,1,'Thêm mặt hàng: LactoGold','2024-12-10 21:15:46',NULL),(253,1,4,'Nhập hàng từ nhà phân phối 7 với tổng giá trị 5931001','2024-12-10 21:16:40',NULL);
/*!40000 ALTER TABLE `system_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `level` int unsigned NOT NULL,
  `p_id` int unsigned DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '"mdi:pill"',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `types_p_id_foreign` (`p_id`),
  CONSTRAINT `types_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Thuốc kê đơn',1,NULL,'vaadin:doctor','2024-11-27 14:13:51',NULL,1),(2,'Kháng sinh',2,1,'mdi:pill','2024-11-27 14:48:20',NULL,1),(3,'test1',2,1,'mdi:pill','2024-11-27 14:50:44','2024-11-27 14:52:28',0),(4,'Thuốc không kê đơn',1,NULL,'mdi:pill','2024-11-27 15:10:21',NULL,1),(5,'Thực phẩn chức năng',1,NULL,'fa-solid:leaf','2024-11-27 15:10:53',NULL,1),(6,'Bổ gan',2,5,'game-icons:liver','2024-11-27 15:11:22',NULL,1),(7,'Đường hô hấp',2,4,'mdi:pill','2024-11-27 22:28:09','2024-11-27 22:28:16',0),(8,'Đường hô hấp',2,1,'hugeicons:lungs','2024-11-27 22:28:27','2024-11-28 10:06:52',1),(9,'Huyết áp/Tim mạch',2,1,'icon-park-outline:heart','2024-11-27 22:28:49','2024-11-28 10:07:45',1),(10,'Tiểu đường/mỡ máu',2,1,'hugeicons:blood','2024-11-27 22:29:09','2024-11-28 10:08:14',1),(11,'Thuốc đặt',2,1,'mdi:pill','2024-11-27 22:29:29',NULL,1),(12,'Tiêu hóa',2,1,'healthicons:stomach','2024-11-27 22:30:16','2024-11-28 10:08:52',1),(13,'Khác',2,1,'mdi:pill','2024-11-27 22:30:37',NULL,1),(14,'Tiêu hóa',2,4,'healthicons:stomach','2024-11-27 22:31:39','2024-11-28 10:09:08',1),(15,'Đường hô hấp',2,4,'hugeicons:lungs','2024-11-27 22:31:54','2024-11-28 10:09:23',1),(16,'Thuốc bổ',2,4,'mdi:pill','2024-11-27 22:32:45',NULL,1),(17,'Dầu gió',2,4,'mdi:pill','2024-11-27 22:33:58',NULL,1),(18,'Tuýp bôi',2,4,'mdi:pill','2024-11-27 22:34:49',NULL,1),(19,'Bổ não',2,5,'hugeicons:ai-brain-01','2024-11-27 22:35:12','2024-11-28 10:16:29',1),(20,'Tiêu hóa',2,5,'healthicons:stomach','2024-11-27 22:35:30','2024-11-28 10:17:12',1),(21,'Bổ mắt',2,5,'mingcute:eye-close-line','2024-11-27 22:35:41','2024-12-03 20:46:00',1),(22,'Bổ thận',2,5,'game-icons:kidneys','2024-11-27 22:35:50','2024-11-28 10:18:30',1),(23,'Nội tiết',2,5,'mdi:gender-female','2024-11-27 22:36:03','2024-11-28 10:19:40',1),(24,'Tiểu đường',2,5,'mdi:pill','2024-11-27 22:36:34',NULL,1),(25,'Thuốc bổ tổng hợp',2,5,'mdi:pill','2024-11-27 22:36:57',NULL,1),(26,'Khác',2,5,'mdi:pill','2024-11-27 22:37:07',NULL,1),(27,'Mỹ phẩm',1,NULL,'material-symbols:spa-rounded','2024-11-27 22:37:29',NULL,1),(28,'Thiết bị y tế',1,NULL,'tabler:stethoscope','2024-11-27 22:37:39',NULL,1),(29,'Bao cao su/que thử thai',2,27,'healthicons:male-condom-24px','2024-11-27 22:38:31','2024-11-28 10:09:46',1),(30,'Dưỡng tóc',2,27,'mingcute:hair-2-fill','2024-11-27 22:38:48','2024-12-03 16:59:38',1),(31,'Sữa tắm',2,27,'hugeicons:shampoo','2024-11-27 22:39:33','2024-11-28 10:10:42',1),(32,'Kem đánh răng',2,27,'hugeicons:dental-tooth','2024-11-27 22:39:46','2024-11-28 10:11:32',1),(33,'Tuýp bôi',2,27,'icon-park-outline:facial-cleanser','2024-11-27 22:39:56','2024-11-28 10:12:32',1),(34,'Khác',2,27,'mdi:pill','2024-11-27 22:40:13',NULL,1),(35,'Khẩu trang',2,28,'covid:vaccine-protection-face-mask-1','2024-11-27 22:40:25','2024-11-28 10:13:07',1),(36,'Muối sinh lý',2,28,'tabler:salt','2024-11-27 22:40:36','2024-11-28 10:13:36',1),(37,'Bông/gạc',2,28,'ion:bandage-outline','2024-11-27 22:40:57','2024-11-28 10:14:16',1),(38,'Cồn',2,28,'healthicons:alcohol','2024-11-27 22:41:09','2024-11-28 10:15:32',1),(39,'Tăm chỉ',2,28,'mdi:pill','2024-11-27 22:41:17',NULL,1),(40,'Đường hô hấp',2,5,'hugeicons:lungs','2024-11-29 21:53:11',NULL,1),(41,'Xương khớp',2,5,'lucide:bone','2024-11-30 19:56:55',NULL,1),(42,'Huyết áp/ Tim mạch',2,5,'icon-park-outline:heart','2024-11-30 20:08:46',NULL,1),(43,'Bổ gan',2,4,'game-icons:liver','2024-12-02 19:47:20',NULL,1),(44,'Thần kinh/não',2,4,'hugeicons:ai-brain-01','2024-12-02 19:57:06',NULL,1),(45,'Bổ thận',2,4,'game-icons:kidneys','2024-12-02 20:31:09',NULL,1),(46,'Xương khớp',2,4,'lucide:bone','2024-12-02 20:59:54',NULL,1),(47,'Nhiệt kế',2,28,'fluent:temperature-24-filled','2024-12-02 21:05:51',NULL,1),(48,'Khác',2,4,'mdi:pill','2024-12-02 21:09:22',NULL,1),(49,'Thần kinh/Não',2,1,'hugeicons:ai-brain-01','2024-12-03 19:51:23',NULL,1),(50,'Mắt',2,1,'mingcute:eye-close-line','2024-12-03 20:10:59',NULL,1),(51,'Sát khuẩn',2,4,'covid:personal-hygiene-hand-sanitizer-spray-virus-block','2024-12-03 20:17:14',NULL,1),(52,'Mắt',2,4,'mingcute:eye-close-line','2024-12-03 20:46:10',NULL,1),(53,'Sủi',2,5,'icon-park-outline:orange-one','2024-12-08 10:53:11',NULL,1);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'Hộp','2024-11-23 02:40:22','2024-11-23 12:31:50',1),(3,'Chai','2024-11-23 03:07:51','2024-11-23 11:11:38',1),(4,'Vỉ','2024-11-23 03:09:03',NULL,1),(5,'Viên','2024-11-23 03:10:43',NULL,1),(6,'Tuýp','2024-11-23 12:33:35',NULL,1),(7,'Lọ','2024-11-23 12:33:46',NULL,1),(8,'Ống','2024-11-23 12:33:59',NULL,1),(9,'Bịch','2024-11-25 18:16:39',NULL,1),(10,'ml','2024-11-29 21:40:24',NULL,1),(11,'Gói','2024-11-29 22:50:31',NULL,1);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$argon2id$v=19$m=65536,t=2,p=1$BQ6KxBbrqMh/Bq/iQxvjRkb47sl36mDJVQaMvYyeqv4$ysm0tPpPawozFoxeVueFXwdfXVimjVZM2zFRacKjx8M',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'duocth_development'
--
/*!50003 DROP FUNCTION IF EXISTS `delete_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `delete_company`(id int) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

	DECLARE comp INT;

	DECLARE oldImage VARCHAR(255);

	select COUNT(*) into comp

	from companies c 

	WHERE c.id = id;

	

	if comp > 0 then

	SELECT c.image INTO oldImage FROM companies c WHERE c.id = id;

	DELETE from companies 

	WHERE id = id;

end if;

return oldImage;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `edit_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `edit_company`( id INT, name VARCHAR(255), fullName VARCHAR(255), image VARCHAR(255) ) RETURNS int
    DETERMINISTIC
BEGIN 

	IF image IS NULL 

THEN 

UPDATE companies SET name = name, 

full_name = fullName, 

updated_at = NOW() 

WHERE id = id; 

ELSE 

UPDATE companies 

SET name = name, 

full_name = fullName, 

image = image, 

updated_at = NOW() 

WHERE id = id;

END IF; 

RETURN ROW_COUNT();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_companies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_companies`() RETURNS json
    DETERMINISTIC
BEGIN

    DECLARE companies JSON;

    SELECT JSON_ARRAYAGG(

        JSON_OBJECT(

            'id', m.id,

            'name', m.name,

            'fullName', m.full_name,

            'image', m.image

        )

    ) INTO companies

    FROM companies m;



    RETURN companies;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_data_combo_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_data_combo_product`() RETURNS json
    DETERMINISTIC
begin

	DECLARE r JSON; 

	DECLARE parent_types JSON; 

	DECLARE types JSON; 

	DECLARE companies JSON; 

	DECLARE distributors JSON;

	DECLARE units JSON;

	select json_arrayagg(

		json_object(

			'id', t.id,

			'text', t.name

		) 

	) into parent_types 

	from types t where t.p_id is null and t.active = 1;

	select json_arrayagg(

		json_object(

			'id', t.id,

			'text', t.name,

			'p_id', t.p_id

		) 

	) into types 

	from types t where t.p_id is not null and t.active = 1;

	select json_arrayagg(

		json_object(

			'id', c.id,

			'text', c.name

		) 

	) into companies

	from companies c;

	select json_arrayagg(

		json_object(

			'id', d.id,

			'text', d.name

		) 

	) into distributors

	from distributors d where d.active = 1;

select json_arrayagg(

		json_object(

			'id', d.id,

			'text', d.name

		) 

	) into units

	from units d where d.active = 1;

	select json_object(

		'parent_types', parent_types,

		'types', types,

		'companies', companies,

		'distributors', distributors,

		'units', units	

	) into r;

	return r;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_menus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_menus`() RETURNS json
    DETERMINISTIC
BEGIN

    DECLARE menus JSON;

    SELECT JSON_ARRAYAGG(

        JSON_OBJECT(

            'id', m.id,

            'p_id', m.p_id,
            'p_name', a.name,

            'name', m.name,

            'url', m.url,

            'icon', m.icon

        )

    ) INTO menus

    FROM menus m left join menus a on a.id = m.p_id

    WHERE m.active = 1;



    RETURN menus;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_menu_tree` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_menu_tree`() RETURNS json
    DETERMINISTIC
BEGIN 

    DECLARE menu_tree JSON;

    SELECT JSON_ARRAYAGG(

        JSON_OBJECT(

            'id', m.id,

            'p_id', m.p_id,

            'name', m.name,

            'url', m.url,

            'icon', m.icon,

            'children', (

              SELECT JSON_ARRAYAGG(

                JSON_OBJECT(

                    'id', m1.id,

                    'p_id', m1.p_id,

                    'name', m1.name,

                    'url', concat(m.url,m1.url) ,

                    'icon', m1.icon

                )

              )

              FROM menus m1

              WHERE m1.p_id = m.id AND m1.active = 1

            ) 

        )

    ) INTO menu_tree

    FROM menus m

    WHERE m.p_id is null AND m.active = 1;



    RETURN menu_tree;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_parent_menus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_parent_menus`() RETURNS json
    READS SQL DATA
    DETERMINISTIC
BEGIN

    DECLARE menus JSON;

    SELECT JSON_ARRAYAGG(

        JSON_OBJECT(

            'id', m.id,

            'name', m.name

        )

    ) INTO menus

    FROM menus m

    WHERE m.active = 1 AND m.p_id IS NULL;

    

    RETURN menus;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_products`(type_id INT, name VARCHAR(255), active TINYINT, company_id INT, distributor_id INT) RETURNS json
    DETERMINISTIC
begin

	declare r json;

	

	select json_arrayagg(

		json_object(

			'id', p.id,

			'name', p.name,

			'company_id', p.company_id,

			'company_name', c.name,

			'description', p.description,

			'img', p.images,

			'img_desc', p.description_image,

			'type_id',p.type_id,
			'p_type_id', (
				select a.p_id from types a where a.id = p.type_id
			),

			'distributor_id', p.distributor_id,

			'distributor_name', d.name,

			'units', (

				select json_arrayagg(

					json_object(

						'idFrom', u.unit_from_id,

						'quantityFrom', u.quantity_from,

						'idTo', u.unit_to_id,

						'quantityTo', u.quantity_to

					)

				) from product_units u where u.product_id = p.id

			)

		) 

	) into r 

	from products p

	left join companies c on c.id = p.company_id

	left join distributors d on d.id = p.distributor_id

	where p.active = active and (p.type_id = type_id or type_id is null) and (p.name LIKE CONCAT('%', name, '%') OR name = '') and (p.company_id = company_id or company_id is null)

	and (p.distributor_id = distributor_id or distributor_id is null);

	return r;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_product_import` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_product_import`(product_id INT) RETURNS json
    DETERMINISTIC
BEGIN
  DECLARE r JSON;
  
  SELECT JSON_OBJECT(
    'units', JSON_ARRAYAGG(
      JSON_OBJECT(
        'id', u.id,
        'name', u.name,
        'to_id', u1.id,
        'to_name',u1.name
      )
    ),
    'quantity_by_unit', JSON_ARRAYAGG(
      JSON_OBJECT(
        'from_id', pu.unit_from_id,
        'to_id', pu.unit_to_id,
        'from_name', u.name,
        'to_name', u1.name,
        'base_quantity', COALESCE(s.quantity, 0),
        'conversion_factor', pu.quantity_to / pu.quantity_from
      )
    ),
    'product_name', ANY_VALUE(p.name),
    'id', ANY_VALUE(p.id),
    'image', ANY_VALUE(p.description_image),
    'description', ANY_VALUE(p.description)
  ) INTO r
  FROM products p
  JOIN product_units pu ON p.id = pu.product_id
  JOIN units u ON pu.unit_from_id = u.id
  JOIN units u1 ON pu.unit_to_id = u1.id
  LEFT JOIN storage s ON s.product_id = pu.product_id AND s.unit_id = pu.unit_from_id
  WHERE p.id = product_id;

  RETURN r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_storage_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_storage_products`(
  page_num INT,
  page_size INT
) RETURNS json
    DETERMINISTIC
BEGIN
  DECLARE r JSON;
  DECLARE total INT;
  DECLARE offset INT;

  -- Tính offset cho phân trang
  SET offset = (page_num - 1) * page_size;

  -- Đếm tổng số sản phẩm active duy nhất
  SELECT COUNT(DISTINCT s.product_id) 
  INTO total 
  FROM storage s 
  JOIN products p ON s.product_id = p.id 
  WHERE p.active = 1;

  -- Lấy thông tin sản phẩm theo trang và kích thước trang
  SELECT JSON_OBJECT(
    'total', total,
    'data', (
      SELECT CONCAT(
        '[', GROUP_CONCAT(
          JSON_OBJECT(
            'product_id', s.product_id,
            'product_name', p.name,
            'image', p.description_image
          )
        ), ']'
      )
      FROM (
        SELECT s.product_id, p.name, p.description_image
        FROM storage s
        JOIN products p ON s.product_id = p.id
        WHERE p.active = 1
        GROUP BY s.product_id
        LIMIT offset, page_size
      ) AS subquery
    )
  ) INTO r;

  RETURN r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_types_tree` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_types_tree`() RETURNS json
    DETERMINISTIC
begin

	declare type_tree JSON;

	

	select json_arrayagg(

		json_object(

			'id', t.id,

			'name', t.name,

			'icon', t.icon,

			'level', t.level,

			'p_name', (

				select name

				from types t2

				where t2.id = t.p_id

			),

			'p_id', t.p_id

		) 

	)

	into type_tree

	from types t

	where t.active = 1 and t.level = 2;

return type_tree;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_types_tree2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_types_tree2`() RETURNS json
    DETERMINISTIC
BEGIN DECLARE types_tree JSON;



SELECT

  JSON_ARRAYAGG(

    JSON_OBJECT(

      'id',

      t.id,

      'name',

      t.name,

      'icon',

      t.icon,

      'children',

      (

        SELECT

          JSON_ARRAYAGG(JSON_OBJECT(

            'id', b.id,

            'name', b.name,

            'icon', b.icon,

            'quantity', (

              SELECT

                COUNT(*)

              FROM

                products p

              WHERE

                p.type_id = b.id and p.active = 1

            )

          ))

        FROM types b

        WHERE b.p_id = t.id and active = 1

      )

    ) 

  ) INTO types_tree

  FROM types t

  WHERE t.p_id IS NULL;

  RETURN types_tree;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_units` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_units`() RETURNS json
    DETERMINISTIC
BEGIN 

    DECLARE units JSON;

    SELECT JSON_ARRAYAGG(

        JSON_OBJECT(

            'id', u.id,

            'name', u.name

        )

    ) INTO units

    FROM units u where u.active = 1;

    RETURN units;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_user_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_user_info`(user_id INT) RETURNS json
    DETERMINISTIC
BEGIN

    DECLARE user_info JSON;

    SELECT JSON_OBJECT(

        'id', u.id,

        'username', u.username,

        'role', r.name

    ) INTO user_info

    FROM users u

    JOIN user_roles ur ON u.id = ur.user_id

    JOIN roles r ON ur.role_id = r.id

    WHERE u.id = user_id;



    RETURN user_info;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product`(

  IN name VARCHAR(255),

  IN description TEXT,

  IN images TEXT,

  IN description_image TEXT,

  IN company_id INT,

  IN distributor_id INT,

  IN type_id INT,

  IN units TEXT

)
begin

	DECLARE product_id INT;

    DECLARE i INT DEFAULT 0;

    DECLARE n INT DEFAULT JSON_LENGTH(units);

    DECLARE unit_json JSON;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION

  BEGIN

    ROLLBACK;

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred, please try again later';

  END;

 	

  START TRANSACTION;

    

    

    INSERT INTO products(

      name,

      description,

      images,

      description_image,

      company_id,

      distributor_id,

      type_id,

      created_at

    )

    VALUES(

      name,

      description,

      images,

      description_image,

      company_id,

      distributor_id,

      type_id,

      NOW()

    );

    SET product_id = LAST_INSERT_ID();



    WHILE i < n DO 

      SET unit_json = JSON_EXTRACT(units, CONCAT('$[', i, ']'));

      INSERT INTO product_units(

        product_id,

        unit_from_id,

        quantity_from,

        unit_to_id,

        quantity_to

      )

      VALUES(

        product_id,

        JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.idFrom')),

        JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.quantityFrom')),

        JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.idTo')),

        JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.quantityTo'))

      );

      SET i = i + 1;

    END WHILE;

   CALL system_log(1, 1, CONCAT('Thêm mặt hàng: ', name));

  COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_type`(

    IN name VARCHAR(255),

    IN level INT,

    IN p_id INT,

    IN icon VARCHAR(255)

)
BEGIN

    DECLARE check_name INT;

   	declare final_icon varchar(255);

   	if icon is null or icon = '' then 

   		set final_icon = 'mdi:pill';

   	else 

   		set final_icon = icon;

   	end if;



    

    SELECT COUNT(*) INTO check_name

    FROM types t 

    WHERE active = 1 AND t.name = name;



    









        

        INSERT INTO types (name, level, p_id, icon, created_at)

        VALUES (name, level, p_id, final_icon, NOW());



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_unit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_unit`(

    IN name VARCHAR(255) 

)
BEGIN

    INSERT INTO units(name, created_at) 

    VALUES(name, NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_product`(

	in id int

)
begin

	declare product_name varchar(255);

		 DECLARE EXIT HANDLER FOR SQLEXCEPTION

  BEGIN

    ROLLBACK;

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred, please try again later';

  END;

 start transaction;

	select p.name into product_name from products p where p.id = id;

	update products p set active = 0 where p.id = id;

	

	call system_log(1,2,concat('Xóa mặt hàng: ',product_name));

	commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `import_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `import_product`(
  IN product_id INT,
  IN distributor_id INT,
  IN unit_id INT,
  IN quantity INT,
  IN import_price BIGINT
)
BEGIN
  DECLARE product_exist INT;
  DECLARE storage_id INT;
  DECLARE storage_quantity INT;
  SELECT COUNT(*) FROM products WHERE id = product_id AND active = 1 INTO product_exist;
  IF product_exist = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mặt hàng không tồn tại hoặc đã bị xóa';
  END IF;
  INSERT INTO import_histories(
    product_id,
    distributor_id,
    unit_id,
    quantity,
    import_price,
    created_at
  ) VALUES(
    product_id,
    distributor_id,
    unit_id,
    quantity,
    import_price,
    NOW()
  );

  -- Check if product exist in storage
  SELECT id, quantity FROM storage s WHERE s.product_id = product_id AND s.unit_id = unit_id INTO storage_id, storage_quantity;
  IF storage_id IS NULL THEN
    INSERT INTO storage(
      product_id,
      unit_id,
      quantity,
      created_at
    ) VALUES(
      product_id,
      unit_id,
      quantity,
      NOW()
    );
  ELSE
    UPDATE storage SET quantity = storage_quantity + quantity WHERE id = storage_id;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `import_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `import_products`(
  IN distributor_id INT,
  IN import_products TEXT
)
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE n INT DEFAULT JSON_LENGTH(import_products);
  DECLARE product_json JSON;
  DECLARE total_price BIGINT DEFAULT 0;


  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred, please try again later';
  END;

  START TRANSACTION;
    WHILE i < n DO
      SET product_json = JSON_EXTRACT(import_products, CONCAT('$[', i, ']'));
      CALL import_product(
        JSON_UNQUOTE(JSON_EXTRACT(product_json, '$.product_id')),
        distributor_id,
        JSON_UNQUOTE(JSON_EXTRACT(product_json, '$.unit')),
        JSON_UNQUOTE(JSON_EXTRACT(product_json, '$.quantity')),
        JSON_UNQUOTE(JSON_EXTRACT(product_json, '$.price'))
      );
      SET total_price = total_price + JSON_UNQUOTE(JSON_EXTRACT(product_json, '$.price'));
      SET i = i + 1;
    END WHILE;
    CALL system_log(1, 4, CONCAT('Nhập hàng từ nhà phân phối ', distributor_id, ' với tổng giá trị ', total_price));
   commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `system_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `system_log`(userId int, typeId int, de text)
    DETERMINISTIC
BEGIN 

    INSERT INTO system_logs(user_id, logging_type_id, description, created_at) VALUES(userId, typeId, de, NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upload_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `upload_product`(

    IN pro_id INT,

    IN name VARCHAR(255),

    IN description TEXT,

    IN images TEXT,

    IN description_image TEXT,

    IN company_id INT,

    IN distributor_id INT,

    IN type_id INT,

    IN units TEXT

)
BEGIN

    DECLARE i INT DEFAULT 0;

    DECLARE n INT;

    DECLARE unit_json JSON;

    DECLARE final_img TEXT DEFAULT images;

    DECLARE final_desc_img TEXT DEFAULT description_image;

    DECLARE err_msg TEXT;

    DECLARE err_code INT;

   declare old_name varchar(255);



    

    DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN

        

        GET DIAGNOSTICS CONDITION 1

            err_code = MYSQL_ERRNO,

            err_msg = MESSAGE_TEXT;



        

        CALL system_log(1, 3, CONCAT('SQL Error (Code: ', err_code, '): ', err_msg));



        

        ROLLBACK;



        

        SIGNAL SQLSTATE '45000'

            SET MESSAGE_TEXT = 'SQL Error: See log for details.';

    END;



    

    START TRANSACTION;

   

   select p.name into old_name from products p where p.id = pro_id;



    

    IF images = '' THEN

        SELECT p.images INTO final_img FROM products p WHERE p.id = pro_id;

    END IF;



    IF description_image = '' THEN

        SELECT p.description_image INTO final_desc_img FROM products p WHERE p.id = pro_id;

    END IF;



    

    UPDATE products 

    SET name = name,

        description = description,

        images = final_img,

        description_image = final_desc_img,

        company_id = company_id,

        distributor_id = distributor_id,

        type_id = type_id,

        updated_at = NOW()

    WHERE id = pro_id;



    

    IF units IS NULL OR JSON_LENGTH(units) IS NULL THEN

        SET n = 0;

    ELSE

        SET n = JSON_LENGTH(units);

       	delete from product_units where product_id = pro_id;

    END IF;



   WHILE i < n DO 

    

    SET unit_json = JSON_EXTRACT(units, CONCAT('$[', i, ']'));



    

    IF unit_json IS NOT NULL THEN

        

        SET @idFrom = JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.idFrom'));

        SET @quantityFrom = JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.quantityFrom'));

        SET @idTo = JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.idTo'));

        SET @quantityTo = JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.quantityTo'));



        

        IF @idFrom IS NOT NULL AND @quantityFrom IS NOT NULL AND 

           @idTo IS NOT NULL AND @quantityTo IS NOT NULL THEN

            

            INSERT INTO product_units(

        product_id,

        unit_from_id,

        quantity_from,

        unit_to_id,

        quantity_to

      )

      VALUES(

      pro_id,

      @idFrom,

      @quantityFrom,

      @idTo,

      @quantityTo

      );

        ELSE

            

            SIGNAL SQLSTATE '45000'

                SET MESSAGE_TEXT = 'JSON unit object is missing required fields.';

        END IF;

    ELSE

        

        SIGNAL SQLSTATE '45000'

            SET MESSAGE_TEXT = 'Invalid JSON structure in units.';

    END IF;



    

    SET i = i + 1;

END WHILE;









    

    CALL system_log(1, 3, CONCAT('Cập nhật mặt hàng: ', old_name));



    

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11  8:13:45
