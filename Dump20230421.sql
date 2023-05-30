-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: test-app
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `building_main_options`
--

DROP TABLE IF EXISTS `building_main_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building_main_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `building_id` bigint unsigned NOT NULL,
  `option_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building_main_options_building_id_foreign` (`building_id`),
  CONSTRAINT `building_main_options_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_main_options`
--

LOCK TABLES `building_main_options` WRITE;
/*!40000 ALTER TABLE `building_main_options` DISABLE KEYS */;
INSERT INTO `building_main_options` VALUES (1,42,3,NULL,NULL),(2,42,2,NULL,NULL),(3,43,7,NULL,NULL),(4,45,8,NULL,NULL),(5,46,5,NULL,NULL),(6,50,4,NULL,NULL);
/*!40000 ALTER TABLE `building_main_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building_metro`
--

DROP TABLE IF EXISTS `building_metro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building_metro` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `building_id` bigint unsigned NOT NULL,
  `metro_id` int NOT NULL,
  `minutes_to_station` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `building_metro_building_id_foreign` (`building_id`),
  CONSTRAINT `building_metro_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_metro`
--

LOCK TABLES `building_metro` WRITE;
/*!40000 ALTER TABLE `building_metro` DISABLE KEYS */;
INSERT INTO `building_metro` VALUES (1,NULL,NULL,42,1,5),(2,NULL,NULL,45,2,10),(3,NULL,NULL,47,3,15),(4,NULL,NULL,50,3,55),(5,NULL,NULL,58,2,20);
/*!40000 ALTER TABLE `building_metro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building_secondary_options`
--

DROP TABLE IF EXISTS `building_secondary_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building_secondary_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `building_id` bigint unsigned NOT NULL,
  `option_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building_secondary_options_building_id_foreign` (`building_id`),
  CONSTRAINT `building_secondary_options_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_secondary_options`
--

LOCK TABLES `building_secondary_options` WRITE;
/*!40000 ALTER TABLE `building_secondary_options` DISABLE KEYS */;
INSERT INTO `building_secondary_options` VALUES (6,42,1,NULL,NULL),(7,43,2,NULL,NULL),(8,44,2,NULL,NULL),(9,45,2,NULL,NULL),(10,60,1,NULL,NULL),(11,57,1,NULL,NULL);
/*!40000 ALTER TABLE `building_secondary_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `building_class` enum('Эконом','Комфорт','Бизнес','Элит') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildings`
--

LOCK TABLES `buildings` WRITE;
/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;
INSERT INTO `buildings` VALUES (42,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-1','Est non harum aperiam. Nesciunt ut dolore aut.','Комфорт','2023-10-09','въезд Домодедовская, 12',0),(43,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-2','Nulla odit sint aliquam eos velit omnis enim. Ut aut a libero.','Элит','2024-03-30','пл. Гагарина, 57',1),(44,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-3','Et accusantium inventore rerum. Eveniet ex et hic illo. Officia earum ut qui saepe.','Элит','2023-04-21','шоссе Чехова, 64',9),(45,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-4','Iusto cupiditate qui provident occaecati nemo provident. Voluptas dolores deleniti id nemo. Esse maiores voluptatem nesciunt ad perspiciatis.','Бизнес','2022-08-31','въезд Чехова, 89',13),(46,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-5','Omnis maxime qui quia non at id recusandae iure. Fuga rerum quia quidem soluta. Pariatur autem necessitatibus magni ea.','Элит','2023-11-07','ул. Косиора, 51',13),(47,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-6','Deserunt dolorem eaque animi omnis sequi nesciunt porro. Iure rerum optio excepturi ea dicta.','Эконом','2023-10-08','спуск Ленина, 81',4),(48,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-7','Ut quas ut fugiat suscipit. Aut et laboriosam aut ut reprehenderit voluptas totam. Ut sunt est est fuga molestiae.','Комфорт','2023-10-15','наб. Бухарестская, 50',10),(49,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-8','Sed dolorem et praesentium eos quam quidem. Impedit non in nisi maxime et quasi. Fugiat quia fuga cupiditate cumque.','Бизнес','2022-06-22','шоссе Гагарина, 24',1),(50,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-9','Recusandae debitis ut et et qui. Hic non et unde quas doloribus aperiam sed.','Комфорт','2024-08-06','пр. Ладыгина, 14',11),(51,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-10','Voluptas aspernatur iste fuga. Illo repudiandae dolor cum molestias.','Бизнес','2024-11-12','пл. Бухарестская, 18',0),(52,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-11','Iure molestias omnis maxime sunt ab aut adipisci. Rerum similique dolorem unde eos voluptas in.','Комфорт','2024-06-02','пл. Бухарестская, 88',6),(53,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-12','Iste placeat et et sequi. Odio in quis amet quia consequatur.','Бизнес','2022-10-11','наб. Космонавтов, 33',12),(54,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-13','Quia ut et ratione. Voluptas expedita doloribus magni. Porro reprehenderit sunt et voluptas deserunt.','Элит','2022-06-26','спуск Чехова, 85',14),(55,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-14','Velit non est qui quibusdam perferendis. Illo minima nisi doloremque facilis corporis unde nihil. Voluptates quae itaque qui hic.','Элит','2024-02-04','наб. Косиора, 75',15),(56,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-15','Voluptates nisi numquam qui ratione facilis unde. Fuga quis aut unde vero neque. Vel quae error quo molestiae dolores.','Элит','2025-04-08','пл. Ладыгина, 16',13),(57,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-16','Laudantium aliquid magnam rerum iure nulla. Nihil accusamus numquam aut sequi facilis praesentium. Dolorem eos voluptatem in.','Бизнес','2023-07-11','пр. Сталина, 60',0),(58,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-17','Dignissimos magni est assumenda fugiat quia. Nobis voluptas officiis qui odit fugiat a ad.','Элит','2025-03-28','пер. Балканская, 80',4),(59,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-18','Autem inventore rem rerum ut illo harum minus consequatur. Debitis non nesciunt illum officia et.','Комфорт','2023-02-04','ул. Ладыгина, 20',4),(60,'2023-04-20 13:14:34','2023-04-20 13:14:34','ЖК-19','Aut vitae impedit error pariatur porro. Aperiam sint in voluptas accusantium dolorem voluptatem unde sunt.','Элит','2023-07-11','шоссе Балканская, 54',3);
/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_options`
--

DROP TABLE IF EXISTS `main_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_options`
--

LOCK TABLES `main_options` WRITE;
/*!40000 ALTER TABLE `main_options` DISABLE KEYS */;
INSERT INTO `main_options` VALUES (2,'Благоустроенный двор',NULL,NULL),(3,'Отделка под ключ',NULL,NULL),(4,'Подземный паркинг',NULL,NULL),(5,'Кирпичный дом',NULL,NULL),(6,'Вид на реку',NULL,NULL),(7,'Лес рядом',NULL,NULL),(8,'Есть акции',NULL,NULL);
/*!40000 ALTER TABLE `main_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metro_stations`
--

DROP TABLE IF EXISTS `metro_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metro_stations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metro_stations`
--

LOCK TABLES `metro_stations` WRITE;
/*!40000 ALTER TABLE `metro_stations` DISABLE KEYS */;
INSERT INTO `metro_stations` VALUES (1,'Студенческая',NULL,NULL),(2,'Спортивная',NULL,NULL),(3,'Сокол',NULL,NULL);
/*!40000 ALTER TABLE `metro_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_04_20_172035_create_buildings_table',1),(6,'2023_04_20_173247_create_main_options_table',1),(7,'2023_04_20_173304_create_secondary_options_table',1),(8,'2023_04_20_173547_create_building_secondary_options_table',1),(9,'2023_04_20_173600_create_building_main_options_table',1),(10,'2023_04_20_174358_create_metro_stations_table',1),(11,'2023_04_20_174451_create_building_metro_table',1),(12,'2023_04_20_182308_update_building_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondary_options`
--

DROP TABLE IF EXISTS `secondary_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secondary_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondary_options`
--

LOCK TABLES `secondary_options` WRITE;
/*!40000 ALTER TABLE `secondary_options` DISABLE KEYS */;
INSERT INTO `secondary_options` VALUES (1,'Двор без машин',NULL,NULL),(2,'Панорамные окна',NULL,NULL);
/*!40000 ALTER TABLE `secondary_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-21 14:00:13
