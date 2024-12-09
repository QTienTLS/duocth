-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: duocth_development
-- ------------------------------------------------------
-- Server version	8.4.3

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (10,'Sao Phương Bắc','Công ty TNHH ĐT&PT Thiết bị y tế Sao Phương Bắc','/images/1732763027992-duocth.png','2024-11-28 10:03:48',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributors`
--

LOCK TABLES `distributors` WRITE;
/*!40000 ALTER TABLE `distributors` DISABLE KEYS */;
INSERT INTO `distributors` VALUES (1,'test','test1','2024-11-27 10:55:25','2024-11-27 11:14:38',0),(2,'Sao Phương Bắc','Công ty TNHH ĐT&PT Thiết bị y tế Sao Phương Bắc','2024-11-27 11:22:05',NULL,1);
/*!40000 ALTER TABLE `distributors` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging_types`
--

LOCK TABLES `logging_types` WRITE;
/*!40000 ALTER TABLE `logging_types` DISABLE KEYS */;
INSERT INTO `logging_types` VALUES (1,'Thêm mới mặt hàng',NULL,NULL),(2,'Xóa mặt hàng',NULL,NULL),(3,'Cập nhật mặt hàng',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,NULL,'Quản trị','/quan-tri','material-symbols:admin-panel-settings-outline-rounded','2024-11-22 10:43:13',NULL,1),(2,1,'Menu','/menu','icon-park-outline:application-menu','2024-11-22 11:38:54',NULL,1),(3,1,'Tài khoản','/tai-khoan','line-md:account','2024-11-22 14:09:49',NULL,1),(4,NULL,'Danh mục','/danh-muc','carbon:catalog','2024-11-22 14:23:15',NULL,1),(5,4,'Đơn vị','/don-vi','ph:unite-duotone','2024-11-22 14:25:04',NULL,1),(6,4,'Công ty','/cong-ty','mdi:drugs','2024-11-22 14:26:18',NULL,1),(7,4,'Nhà phân phối','/nha-phan-phoi','material-symbols:local-shipping-outline-sharp','2024-11-22 14:30:21','2024-11-27 10:16:59',1),(8,4,'Loại thuốc','/loai-thuoc','game-icons:medicines','2024-11-22 14:36:41',NULL,1),(9,NULL,'Quản lý kho','/storage','vaadin:storage','2024-11-27 14:54:34',NULL,1),(10,9,'Mặt hàng','/product','fluent-mdl2:product-variant','2024-11-27 14:59:37',NULL,1),(11,1,'Logging','/logging','mdi:spy','2024-11-28 09:08:46','2024-11-28 09:09:19',1),(12,1,'Dashboard','/dashboard','uil:chart-line','2024-11-28 10:21:52','2024-11-28 10:53:55',1);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
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
INSERT INTO `product_units` VALUES (3,1,1,4,1),(4,1,1,5,60),(5,1,1,4,10),(5,4,1,5,10),(6,1,1,4,3),(6,4,1,5,10),(7,1,1,8,20),(7,8,1,10,10),(8,1,1,5,60),(9,1,1,5,30),(10,1,1,5,60),(11,3,1,10,120),(12,1,1,11,2),(12,11,1,10,30),(13,1,1,11,2),(13,11,1,10,30),(14,1,1,1,1);
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
  `distributor_id` int unsigned NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'test','123','1732871221602-duocth.jpg','1732871221604-duocth.png',10,2,30,'2024-11-29 16:07:01',NULL,0),(4,'XMEN MAX','Bổ thận tráng dương, tăng cường sinh lý nam giới.','1732934300368-duocth.jpg','1732890184198-duocth.jpg',10,2,22,'2024-11-29 21:23:04','2024-11-30 10:19:52',1),(5,'Euro Brain','Hỗ trợ hoạt huyết, tăng cường tuần hoàn máu não','1732938243777-duocth.jpg','1732890695858-duocth.jpg',10,2,19,'2024-11-29 21:31:35','2024-11-30 10:44:03',1),(6,'Fe Pro TĐ','Bổ sung sắt','1732938220080-duocth.jpg','1732891075671-duocth.jpg',10,2,25,'2024-11-29 21:37:55','2024-11-30 10:43:40',1),(7,'Bibifuta Plus','Giúp nhuận trang','','1732891479404-duocth.jpg',10,2,20,'2024-11-29 21:44:39',NULL,1),(8,'Omega3','Bổ sung DHA, hỗ trợ phát triển não, cải thiện thị lực','','1732891644467-duocth.jpg',10,2,21,'2024-11-29 21:47:24','2024-11-30 09:53:32',1),(9,'Anlevit Mama','Bổ sung vi chất dinh dưỡng, tăng cường sức khỏe cho phụ nữ có thai','','1732891755118-duocth.jpg',10,2,25,'2024-11-29 21:49:15',NULL,1),(10,'Cà Gai Leo','Mát gan, giải độc gan','','1732891856391-duocth.jpg',10,2,6,'2024-11-29 21:50:56',NULL,1),(11,'Paravip Plus','Siro ho','','1732892204751-duocth.jpg',10,2,40,'2024-11-29 21:56:44',NULL,1),(12,'Onyx Magic - dầu gội đen thảo dược','','','1732895485996-duocth.jpg',10,2,30,'2024-11-29 22:51:26',NULL,1),(13,'Onyx Magic - dầu gội nâu thảo dược','','','1732895517888-duocth.jpg',10,2,30,'2024-11-29 22:51:57',NULL,1),(14,'test','','','',NULL,2,15,'2024-11-30 14:54:30',NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_logs`
--

LOCK TABLES `system_logs` WRITE;
/*!40000 ALTER TABLE `system_logs` DISABLE KEYS */;
INSERT INTO `system_logs` VALUES (2,1,1,'Thêm mặt hàng: test','2024-11-29 16:07:01',NULL),(3,1,2,'Xóa mặt hàng: test','2024-11-29 16:54:23',NULL),(4,1,1,'Thêm mặt hàng: XMEN MAX','2024-11-29 21:23:04',NULL),(5,1,1,'Thêm mặt hàng: Euro Brain','2024-11-29 21:31:35',NULL),(6,1,1,'Thêm mặt hàng: Fe Pro TĐ','2024-11-29 21:37:55',NULL),(7,1,1,'Thêm mặt hàng: Bibifuta Plus','2024-11-29 21:44:39',NULL),(8,1,1,'Thêm mặt hàng: Omega3','2024-11-29 21:47:24',NULL),(9,1,1,'Thêm mặt hàng: Anlevit Mama','2024-11-29 21:49:15',NULL),(10,1,1,'Thêm mặt hàng: Cà Gai Leo','2024-11-29 21:50:56',NULL),(11,1,1,'Thêm mặt hàng: Paravip Plus','2024-11-29 21:56:44',NULL),(12,1,1,'Thêm mặt hàng: Onyx Magic - dầu gội đen thảo dược','2024-11-29 22:51:26',NULL),(13,1,1,'Thêm mặt hàng: Onyx Magic - dầu gội nâu thảo dược','2024-11-29 22:51:57',NULL),(20,1,3,'Cập nhật mặt hàng: XMEN MAX1','2024-11-30 09:37:58',NULL),(21,1,3,'Cập nhật mặt hàng: XMEN MAX','2024-11-30 09:38:20',NULL),(25,1,3,'Cập nhật mặt hàng: Omega3','2024-11-30 09:53:24',NULL),(26,1,3,'Cập nhật mặt hàng: Omega31','2024-11-30 09:53:32',NULL),(30,1,3,'Cập nhật mặt hàng: XMEN MAX','2024-11-30 10:19:52',NULL),(33,1,3,'Cập nhật mặt hàng: Euro Brain','2024-11-30 10:23:01',NULL),(37,1,3,'Cập nhật mặt hàng: Euro Brain1','2024-11-30 10:28:21',NULL),(38,1,3,'Cập nhật mặt hàng: Euro Brain','2024-11-30 10:28:37',NULL),(39,1,3,'Cập nhật mặt hàng: Euro Brain','2024-11-30 10:43:08',NULL),(40,1,3,'Cập nhật mặt hàng: Fe Pro TĐ','2024-11-30 10:43:40',NULL),(41,1,3,'Cập nhật mặt hàng: Euro Brain1','2024-11-30 10:44:03',NULL),(42,1,1,'Thêm mặt hàng: test','2024-11-30 14:54:30',NULL),(43,1,2,'Xóa mặt hàng: test','2024-11-30 14:54:38',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Thuốc kê đơn',1,NULL,'vaadin:doctor','2024-11-27 14:13:51',NULL,1),(2,'Kháng sinh',2,1,'mdi:pill','2024-11-27 14:48:20',NULL,1),(3,'test1',2,1,'mdi:pill','2024-11-27 14:50:44','2024-11-27 14:52:28',0),(4,'Thuốc không kê đơn',1,NULL,'mdi:pill','2024-11-27 15:10:21',NULL,1),(5,'Thực phẩn chức năng',1,NULL,'fa-solid:leaf','2024-11-27 15:10:53',NULL,1),(6,'Bổ gan',2,5,'game-icons:liver','2024-11-27 15:11:22',NULL,1),(7,'Đường hô hấp',2,4,'mdi:pill','2024-11-27 22:28:09','2024-11-27 22:28:16',0),(8,'Đường hô hấp',2,1,'hugeicons:lungs','2024-11-27 22:28:27','2024-11-28 10:06:52',1),(9,'Huyết áp/Tim mạch',2,1,'icon-park-outline:heart','2024-11-27 22:28:49','2024-11-28 10:07:45',1),(10,'Tiểu đường/mỡ máu',2,1,'hugeicons:blood','2024-11-27 22:29:09','2024-11-28 10:08:14',1),(11,'Thuốc đặt',2,1,'mdi:pill','2024-11-27 22:29:29',NULL,1),(12,'Tiêu hóa',2,1,'healthicons:stomach','2024-11-27 22:30:16','2024-11-28 10:08:52',1),(13,'Khác',2,1,'mdi:pill','2024-11-27 22:30:37',NULL,1),(14,'Tiêu hóa',2,4,'healthicons:stomach','2024-11-27 22:31:39','2024-11-28 10:09:08',1),(15,'Đường hô hấp',2,4,'hugeicons:lungs','2024-11-27 22:31:54','2024-11-28 10:09:23',1),(16,'Thuốc bổ',2,4,'mdi:pill','2024-11-27 22:32:45',NULL,1),(17,'Dầu gió',2,4,'mdi:pill','2024-11-27 22:33:58',NULL,1),(18,'Tuýp bôi',2,4,'mdi:pill','2024-11-27 22:34:49',NULL,1),(19,'Bổ não',2,5,'hugeicons:ai-brain-01','2024-11-27 22:35:12','2024-11-28 10:16:29',1),(20,'Tiêu hóa',2,5,'healthicons:stomach','2024-11-27 22:35:30','2024-11-28 10:17:12',1),(21,'Bổ mắt',2,5,'mingcute:eye-close-line','2024-11-27 22:35:41','2024-11-28 10:18:07',1),(22,'Bổ thận',2,5,'game-icons:kidneys','2024-11-27 22:35:50','2024-11-28 10:18:30',1),(23,'Nội tiết',2,5,'mdi:gender-female','2024-11-27 22:36:03','2024-11-28 10:19:40',1),(24,'Tiểu đường',2,5,'mdi:pill','2024-11-27 22:36:34',NULL,1),(25,'Thuốc bổ tổng hợp',2,5,'mdi:pill','2024-11-27 22:36:57',NULL,1),(26,'Khác',2,5,'mdi:pill','2024-11-27 22:37:07',NULL,1),(27,'Mỹ phẩm',1,NULL,'material-symbols:spa-rounded','2024-11-27 22:37:29',NULL,1),(28,'Thiết bị y tế',1,NULL,'tabler:stethoscope','2024-11-27 22:37:39',NULL,1),(29,'Bao cao su/que thử thai',2,27,'healthicons:male-condom-24px','2024-11-27 22:38:31','2024-11-28 10:09:46',1),(30,'Dưỡng tóc',2,27,'noto:hair-pick','2024-11-27 22:38:48','2024-11-28 10:10:11',1),(31,'Sữa tắm',2,27,'hugeicons:shampoo','2024-11-27 22:39:33','2024-11-28 10:10:42',1),(32,'Kem đánh răng',2,27,'hugeicons:dental-tooth','2024-11-27 22:39:46','2024-11-28 10:11:32',1),(33,'Tuýp bôi',2,27,'icon-park-outline:facial-cleanser','2024-11-27 22:39:56','2024-11-28 10:12:32',1),(34,'Khác',2,27,'mdi:pill','2024-11-27 22:40:13',NULL,1),(35,'Khẩu trang',2,28,'covid:vaccine-protection-face-mask-1','2024-11-27 22:40:25','2024-11-28 10:13:07',1),(36,'Muối sinh lý',2,28,'tabler:salt','2024-11-27 22:40:36','2024-11-28 10:13:36',1),(37,'Bông/gạc',2,28,'ion:bandage-outline','2024-11-27 22:40:57','2024-11-28 10:14:16',1),(38,'Cồn',2,28,'healthicons:alcohol','2024-11-27 22:41:09','2024-11-28 10:15:32',1),(39,'Tăm chỉ',2,28,'mdi:pill','2024-11-27 22:41:17',NULL,1),(40,'Đường hô hấp',2,5,'hugeicons:lungs','2024-11-29 21:53:11',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
CREATE  FUNCTION `delete_company`(id int) RETURNS varchar(255) CHARSET utf8mb4
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
CREATE  FUNCTION `edit_company`( id INT, name VARCHAR(255), fullName VARCHAR(255), image VARCHAR(255) ) RETURNS int
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
CREATE  FUNCTION `get_companies`() RETURNS json
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
CREATE  FUNCTION `get_data_combo_product`() RETURNS json
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
CREATE  FUNCTION `get_menus`() RETURNS json
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
CREATE  FUNCTION `get_menu_tree`() RETURNS json
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
CREATE  FUNCTION `get_parent_menus`() RETURNS json
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
CREATE  FUNCTION `get_products`(type_id INT, name VARCHAR(255), active TINYINT, company_id INT, distributor_id INT) RETURNS json
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
CREATE  FUNCTION `get_types_tree`() RETURNS json
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
CREATE  FUNCTION `get_types_tree2`() RETURNS json
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
CREATE  FUNCTION `get_units`() RETURNS json
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
CREATE  FUNCTION `get_user_info`(user_id INT) RETURNS json
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
CREATE  PROCEDURE `add_product`(

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

    -- INSERT PRODUCT

    

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
CREATE  PROCEDURE `add_type`(

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
CREATE  PROCEDURE `add_unit`(

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
CREATE  PROCEDURE `delete_product`(

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
CREATE  PROCEDURE `system_log`(userId int, typeId int, de text)
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
CREATE  PROCEDURE `upload_product`(

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



    -- Handler xử lý lỗi

    DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN

        -- Lấy mã lỗi và thông báo

        GET DIAGNOSTICS CONDITION 1

            err_code = MYSQL_ERRNO,

            err_msg = MESSAGE_TEXT;



        -- Ghi log lỗi

        CALL system_log(1, 3, CONCAT('SQL Error (Code: ', err_code, '): ', err_msg));



        -- Rollback giao dịch

        ROLLBACK;



        -- Trả về thông báo lỗi

        SIGNAL SQLSTATE '45000'

            SET MESSAGE_TEXT = 'SQL Error: See log for details.';

    END;



    -- Bắt đầu giao dịch

    START TRANSACTION;

   

   select p.name into old_name from products p where p.id = pro_id;



    -- Xử lý giá trị hình ảnh

    IF images = '' THEN

        SELECT p.images INTO final_img FROM products p WHERE p.id = pro_id;

    END IF;



    IF description_image = '' THEN

        SELECT p.description_image INTO final_desc_img FROM products p WHERE p.id = pro_id;

    END IF;



    -- Cập nhật bảng products

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



    -- Xử lý JSON units

    IF units IS NULL OR JSON_LENGTH(units) IS NULL THEN

        SET n = 0;

    ELSE

        SET n = JSON_LENGTH(units);

       	delete from product_units where product_id = pro_id;

    END IF;



   WHILE i < n DO 

    -- Extract the unit JSON object from the array

    SET unit_json = JSON_EXTRACT(units, CONCAT('$[', i, ']'));



    -- Check if the extracted unit_json is NULL

    IF unit_json IS NOT NULL THEN

        -- Extract and unquote values from the JSON object

        SET @idFrom = JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.idFrom'));

        SET @quantityFrom = JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.quantityFrom'));

        SET @idTo = JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.idTo'));

        SET @quantityTo = JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.quantityTo'));



        -- Check if any of the required fields is NULL

        IF @idFrom IS NOT NULL AND @quantityFrom IS NOT NULL AND 

           @idTo IS NOT NULL AND @quantityTo IS NOT NULL THEN

            -- Update product_units if all required fields are present

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

            -- Signal an error if any of the required fields is missing

            SIGNAL SQLSTATE '45000'

                SET MESSAGE_TEXT = 'JSON unit object is missing required fields.';

        END IF;

    ELSE

        -- Signal an error if the unit_json is NULL

        SIGNAL SQLSTATE '45000'

            SET MESSAGE_TEXT = 'Invalid JSON structure in units.';

    END IF;



    -- Increment the index for the next iteration

    SET i = i + 1;

END WHILE;









    -- Ghi log hệ thống

    CALL system_log(1, 3, CONCAT('Cập nhật mặt hàng: ', old_name));



    -- Hoàn tất giao dịch

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

-- Dump completed on 2024-11-30 19:31:40
