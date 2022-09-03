-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'facilis',1),(2,'est',2),(3,'nam',3),(4,'non',4),(5,'labore',5),(6,'dolor',6),(7,'eum',7),(8,'blanditiis',8),(9,'reprehenderit',9),(10,'ipsum',10),(11,'iste',11),(12,'officia',12),(13,'et',13),(14,'ea',14),(15,'eius',15),(16,'laudantium',16),(17,'aliquid',17),(18,'amet',18),(19,'non',19),(20,'non',20);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,1,'approved','1985-11-27 10:36:19','1980-06-04 16:45:25'),(2,2,'declined','2018-07-20 05:10:18','1997-12-11 21:25:19'),(3,3,'unfriended','2021-03-22 08:08:09','1998-08-31 03:39:27'),(4,4,'requested','1976-03-21 02:53:58','2004-10-22 14:47:56'),(5,5,'requested','1977-06-15 10:13:21','1983-02-08 09:00:31'),(6,6,'unfriended','1991-04-04 22:36:40','2010-05-14 20:36:34'),(7,7,'requested','2015-02-18 01:43:05','2021-11-28 10:37:34'),(8,8,'requested','2016-05-07 04:37:00','1971-08-17 12:40:36'),(9,9,'requested','1980-04-14 17:43:49','1977-03-22 10:15:21'),(10,10,'approved','1977-12-29 08:37:42','1981-06-27 23:31:31'),(11,11,'unfriended','2003-10-02 09:09:06','1979-08-04 15:24:38'),(12,12,'requested','1989-06-25 09:21:35','1997-12-04 15:06:26'),(13,13,'approved','1994-04-29 20:45:56','2021-12-05 04:17:34'),(14,14,'approved','2008-04-02 17:35:29','2000-11-15 11:09:43'),(15,15,'declined','2002-03-25 04:13:24','2013-06-09 07:44:34'),(16,16,'declined','1991-09-29 23:15:33','1976-05-09 08:37:34'),(17,17,'declined','2014-06-12 15:49:00','2012-04-20 08:27:28'),(18,18,'requested','1984-10-18 22:02:53','2018-12-09 11:37:02'),(19,19,'declined','1971-09-29 22:17:52','1976-10-21 07:21:31'),(20,20,'declined','2010-06-29 20:24:23','1997-10-07 00:38:32');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'2018-09-11 04:51:07'),(2,2,2,'1983-01-05 20:47:01'),(3,3,3,'1993-09-22 17:15:39'),(4,4,4,'2003-11-07 01:43:50'),(5,5,5,'1976-04-29 20:24:48'),(6,6,6,'2014-07-30 11:50:20'),(7,7,7,'1990-11-16 09:49:49'),(8,8,8,'1988-03-09 08:37:42'),(9,9,9,'1992-08-27 00:32:30'),(10,10,10,'2004-12-26 07:50:29'),(11,11,11,'1978-03-29 19:33:39'),(12,12,12,'1993-05-02 20:59:46'),(13,13,13,'2012-01-06 05:25:28'),(14,14,14,'1971-05-03 01:39:34');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Eos totam illo voluptas enim perferendis sed. Voluptatibus amet cum numquam molestias. Sit mollitia et tempore quis.','dolor',44592521,NULL,'2021-05-10 22:49:44','1989-10-16 04:35:24'),(2,2,2,'Reiciendis saepe aut explicabo dignissimos. Dolor rerum blanditiis qui molestias delectus sunt.','sint',7,NULL,'2008-05-27 23:28:17','2008-02-04 01:14:18'),(3,3,3,'Ullam veniam eligendi praesentium alias est maiores aliquid. Dolor vel magnam qui distinctio sequi. Dicta reiciendis rem reprehenderit maxime. Atque dolore perferendis repellat omnis possimus.','nemo',0,NULL,'2019-02-11 19:35:18','2011-09-28 01:55:01'),(4,4,4,'Id aspernatur sequi est molestias sed iste magnam. Ea qui amet voluptatem reiciendis. Magni magni ut ut suscipit.','ut',34871255,NULL,'2002-05-07 20:05:08','1993-08-12 17:23:24'),(5,1,5,'Necessitatibus dolorem voluptatum adipisci eligendi inventore. Ad ut laudantium aperiam et et. Quidem et nihil doloremque nihil.','ipsum',38418,NULL,'1999-08-10 14:45:56','1991-10-26 21:57:42'),(6,2,6,'Soluta vitae iure facilis magni dolor corporis laboriosam. Dolorum aut repellat veritatis sed voluptas numquam voluptatum et. Fugit nihil omnis molestias perspiciatis.','error',54404,NULL,'1982-01-25 01:46:56','1974-02-16 16:21:18'),(7,3,7,'Ullam sed nisi reiciendis sunt molestiae sequi. Quae consequatur aperiam est cupiditate error. Tenetur dolores qui magni id cupiditate. Earum placeat consequatur fugiat doloremque aperiam rerum eligendi.','qui',5701,NULL,'1994-06-04 07:32:39','1996-11-26 10:11:09'),(8,4,8,'Vitae reprehenderit quia et consequatur. Voluptatem cum minus et alias ea et aperiam. Veritatis eum numquam commodi nobis.','natus',0,NULL,'2020-07-20 08:00:42','1972-11-29 02:51:39'),(9,1,9,'In totam nihil aspernatur exercitationem libero quibusdam perspiciatis. Ad voluptatem fugit eos. Dicta sed aliquid ex expedita voluptates.','animi',86932976,NULL,'1979-09-23 05:38:38','1971-11-29 01:45:17'),(10,2,10,'Tenetur fugiat sit aut tempore repellendus. Magnam occaecati deleniti officia molestiae necessitatibus sed voluptatum.','qui',64396,NULL,'2016-10-01 22:14:11','2010-07-10 21:34:43'),(11,3,11,'Provident nam occaecati sunt autem quas. Quasi sunt suscipit blanditiis doloremque. Reiciendis qui aperiam maxime delectus debitis.','nihil',10899746,NULL,'1981-04-27 09:02:26','2001-10-30 17:56:39'),(12,4,12,'Sapiente voluptatem esse est distinctio ut. Quis fugiat quae odit. Non illo ut ut sed omnis aliquam aut. Itaque commodi deserunt magnam necessitatibus voluptatem.','omnis',0,NULL,'2016-07-10 02:47:51','1990-12-14 10:59:49'),(13,1,13,'Praesentium libero maxime consequuntur qui nobis et. Qui et dolor illum et aliquid excepturi. Non tempora dolorum aut.','repellat',0,NULL,'1972-05-29 23:21:52','2011-11-01 17:28:42'),(14,2,14,'Saepe quos maiores et quo. Sit nobis hic occaecati ipsam et accusamus. Distinctio corrupti rem et. Autem sit quia odio perspiciatis qui dolorem.','et',51760,NULL,'2002-08-15 08:39:59','1972-09-18 10:58:42'),(15,3,15,'A autem sunt dolorem deleniti modi architecto et. Repudiandae omnis est sequi. Ex eos velit provident aliquid. Voluptatem soluta inventore nulla voluptas aliquid non similique. Quisquam velit et earum dolores facere expedita.','et',3,NULL,'2018-11-15 23:21:51','1975-07-02 11:51:08'),(16,4,16,'Et non reiciendis distinctio. Omnis praesentium iure voluptas et possimus ipsa nobis. Est nostrum nisi ratione quo. Laborum vel voluptate odio molestias non qui minus accusamus. Quibusdam et quis aliquid unde et quae.','blanditiis',4,NULL,'1989-01-17 14:02:51','1995-08-22 12:13:52'),(17,1,17,'Quia sunt quas quaerat sit explicabo. Corrupti neque illo quod sint temporibus. Velit similique omnis et qui ea. Eligendi ea quia architecto hic consequatur sed.','perferendis',737074,NULL,'2004-11-17 17:18:27','2015-12-22 12:19:18'),(18,2,18,'Beatae modi error sapiente aut voluptate nisi voluptate. Qui ut tenetur cumque voluptate odio incidunt at vitae. Error similique laborum animi quis.','perferendis',51745686,NULL,'2021-01-07 02:13:34','1974-02-19 15:56:35'),(19,3,19,'Numquam similique non a minima a ipsum. Quia modi nam molestiae iure veniam culpa. Magni repellendus consequatur vel debitis. Ea sint ullam corrupti nobis quo.','a',259066,NULL,'1984-06-02 07:46:20','2011-05-02 04:32:28'),(20,4,20,'Numquam voluptatem distinctio aut vel eum est consectetur. Modi corrupti aut rerum voluptatem omnis cupiditate. Nam reprehenderit ratione dolorem quibusdam porro exercitationem. Qui quaerat corporis error corrupti et.','et',848842,NULL,'2010-09-06 01:01:14','2014-06-06 17:04:23');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'pariatur','1981-04-08 20:47:15','2010-03-02 02:48:33'),(2,'quas','2016-08-18 02:10:17','1993-02-09 19:55:48'),(3,'temporibus','2020-10-12 03:39:53','1997-11-10 04:13:25'),(4,'cupiditate','1993-06-09 00:59:40','1977-11-03 16:51:22');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,10,12,'Qui placeat explicabo odio. Ipsum cum similique ab dolor minus quae. Eveniet rerum tempora quam sapiente omnis tenetur. Ullam cum culpa sed id repellat eos libero voluptas.','1981-06-13 15:50:24'),(2,6,14,'Iure reiciendis totam quis corrupti illum rerum. Minus veniam quos ut velit voluptates ex. Modi atque impedit itaque qui fugiat qui tenetur.','1992-05-22 14:12:06'),(3,4,13,'Rerum culpa maxime ut et numquam. Natus enim non est voluptas. Ipsa quas qui officia esse.','1997-11-19 03:18:11'),(4,9,20,'Est id rerum eum ut blanditiis. Eveniet repellendus placeat minus. Provident aperiam dolorem quaerat.','2017-01-17 03:21:31'),(5,2,20,'Soluta dolor harum ea et tempora eligendi qui consequuntur. Incidunt aperiam libero doloremque in quo ea ipsam. Velit non aspernatur nobis repudiandae quia.','1993-05-20 08:27:50'),(6,1,20,'Voluptatum et eos consequuntur doloribus ullam saepe et. Sit labore et necessitatibus aut expedita. Placeat dolor atque minus eum autem ipsum excepturi. Impedit sed corrupti vero earum autem.','2016-12-20 12:47:31'),(7,5,15,'Reprehenderit atque unde suscipit expedita fuga omnis. Ut minus illum aliquam accusamus neque dolore qui. Voluptas in est ipsa ipsa aut eos quae fugiat.','1992-07-18 22:48:58'),(8,8,16,'Quas in qui aliquid dolor aspernatur odio. Consequatur unde voluptatem exercitationem quis omnis maiores.','1984-08-31 23:19:53'),(9,6,11,'Sunt unde id totam. Et mollitia sint quis et. Aspernatur deserunt sint sequi enim quod quod. Error placeat quis facilis cupiditate molestiae eligendi. Architecto rerum vel maxime optio occaecati.','2010-09-23 20:40:32'),(10,3,18,'Molestiae accusamus blanditiis est eligendi labore. Ea eum quibusdam sequi id ducimus eius. Deserunt consequatur necessitatibus voluptate libero.','2008-05-31 10:22:47'),(11,2,18,'Minima cumque necessitatibus quasi dolores nemo molestiae. Aut maiores nobis voluptatibus reiciendis consequuntur soluta enim.','2005-07-11 07:49:26'),(12,1,17,'Cumque eos voluptatem ut rerum sit quibusdam voluptatem. Vitae ut dolores commodi iusto rerum possimus et incidunt. Eaque est repudiandae repudiandae dolorum molestiae praesentium labore.','1991-03-20 09:15:15'),(13,6,18,'Exercitationem vitae beatae velit assumenda quia blanditiis in. Corporis aspernatur eos rem similique atque. Exercitationem consequatur alias accusamus earum. Eveniet est maxime dolore.','1975-05-19 17:48:32'),(14,10,20,'Voluptatem odit sunt ad accusantium saepe atque. Eius aut sit ab animi ut quidem. Quas aut laboriosam ut doloribus.','2012-02-23 00:05:24'),(15,4,14,'Quasi quis alias est quam amet laboriosam. Itaque sint minus nihil aliquid. Libero nihil perferendis a nisi.','1970-02-22 03:40:31'),(16,5,11,'Numquam voluptates possimus nam et dolorem quia. A qui libero harum assumenda animi. Nesciunt qui qui qui a eius hic deserunt minima. Deserunt fuga ipsa delectus incidunt rem quibusdam.','1970-06-06 10:51:00'),(17,3,16,'Eveniet beatae aut vero tenetur. Enim et harum aut aut voluptatum sapiente fugiat vitae. Modi in quia a sapiente sint. Quae rerum perferendis nisi. Possimus quae sed reiciendis ducimus atque dolores.','1996-10-31 19:22:08'),(18,8,16,'Officia consequatur et doloremque quaerat omnis. Dolor qui reprehenderit magnam aut est tempore cupiditate. Doloribus nisi occaecati similique quia iure. Quia dolorem veniam molestiae eum ducimus excepturi neque.','2007-07-29 19:22:34'),(19,9,15,'Ab distinctio omnis autem dolorem explicabo aspernatur sint in. Itaque aliquam nesciunt et sed. At doloribus totam rerum cumque cumque. Et porro beatae ut possimus laboriosam consequatur officiis.','2019-09-22 05:59:03'),(20,3,19,'Ut laborum consequatur necessitatibus animi aut reiciendis. Odio enim culpa quaerat laboriosam. Sed sed rerum pariatur vitae ex deserunt.','1974-11-24 21:59:41');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `money_transactions`
--

DROP TABLE IF EXISTS `money_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `money_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `walet_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `money_transaction` bigint(20) NOT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`walet_id`,`money_transaction`,`updated_at`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `money_transactions_ibfk_1` FOREIGN KEY (`walet_id`) REFERENCES `walets` (`walet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_transactions`
--

LOCK TABLES `money_transactions` WRITE;
/*!40000 ALTER TABLE `money_transactions` DISABLE KEYS */;
INSERT INTO `money_transactions` VALUES (1,'Aliquid sequi.',41,'1977-05-30 11:42:29','1985-10-12 10:06:44'),(2,'Aut et deleniti.',59,'1981-01-27 22:03:35','2006-03-29 18:49:13'),(3,'Aut pariatur.',63,'1984-08-16 17:27:07','1974-09-04 20:42:23'),(4,'Consectetur.',53,'1973-01-14 01:46:32','1976-10-15 18:41:22'),(5,'Consequatur rerum.',79,'1979-11-07 08:07:03','1970-10-31 04:30:25'),(6,'Deleniti maiores.',73,'2005-01-07 08:28:24','2014-08-25 16:49:17'),(7,'Ducimus excepturi.',26,'2010-01-11 00:09:17','1999-05-02 17:06:06'),(8,'Est doloribus ipsa.',39,'1971-02-05 01:12:45','1971-11-08 15:22:08'),(9,'Et rerum sint vitae.',93,'1980-07-20 10:52:39','1974-06-09 08:21:55'),(10,'Facere perferendis.',42,'1980-05-12 22:11:43','1983-10-08 05:59:17'),(11,'Id debitis maxime.',35,'2003-04-10 10:06:28','1986-09-07 11:47:15'),(12,'Maiores doloribus.',87,'2020-03-13 04:10:59','2014-10-22 15:32:16'),(13,'Quia suscipit.',89,'2010-08-27 10:16:35','1992-11-23 21:25:35'),(14,'Quisquam id nostrum.',60,'1992-08-20 13:32:25','2015-10-31 09:33:07'),(15,'Sapiente sed.',77,'2022-02-05 09:53:28','1988-09-20 11:14:17'),(16,'Sequi et sit.',10,'1994-06-23 14:33:32','2019-08-02 01:15:53'),(17,'Sint libero qui.',36,'2015-08-07 12:11:53','1978-07-10 08:56:04'),(18,'Ullam veniam sed.',48,'1988-01-08 21:41:32','2018-01-01 12:05:33'),(19,'Veritatis.',32,'2017-07-31 19:13:42','1991-02-14 05:30:13'),(20,'Vero distinctio.',50,'2012-12-16 19:58:17','1972-08-30 06:53:20');
/*!40000 ALTER TABLE `money_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'nisi',1),(2,'aut',2),(3,'dolore',3),(4,'accusantium',4),(5,'est',5),(6,'odio',6),(7,'quae',7),(8,'dicta',8),(9,'et',9),(10,'ullam',10);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,1,11),(12,2,12),(13,3,13),(14,4,14),(15,5,15);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','2011-09-24',1,'1977-03-22 04:35:59',NULL),(2,'f','1991-02-07',2,'1986-11-06 07:29:05',NULL),(3,'m','2012-05-21',3,'2004-02-22 07:57:09',NULL),(4,'f','1985-03-18',4,'2012-05-07 22:45:04',NULL),(5,'m','2007-06-01',5,'2010-03-30 07:06:06',NULL),(6,'f','1993-04-10',6,'2005-05-10 03:02:58',NULL),(7,'f','1992-05-16',7,'1974-04-11 07:33:02',NULL),(8,'f','1996-05-12',8,'1986-10-22 05:09:01',NULL),(9,'m','2017-11-06',9,'1990-12-27 04:31:55',NULL),(10,'m','1993-01-26',10,'1971-03-17 19:03:14',NULL),(11,'m','2006-10-20',11,'2008-08-22 11:26:32',NULL),(12,'m','1980-11-23',12,'1983-08-02 07:31:43',NULL),(13,'m','2018-03-19',13,'2020-06-22 08:37:32',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stickers`
--

DROP TABLE IF EXISTS `stickers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stickers` (
  `sticker_pack_creator` bigint(20) unsigned NOT NULL,
  `name_pack` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_sticker` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_sticker` tinyblob DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`name_pack`,`name_sticker`),
  KEY `sticker_pack_creator` (`sticker_pack_creator`),
  KEY `name_pack` (`name_pack`),
  CONSTRAINT `stickers_ibfk_1` FOREIGN KEY (`sticker_pack_creator`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stickers`
--

LOCK TABLES `stickers` WRITE;
/*!40000 ALTER TABLE `stickers` DISABLE KEYS */;
/*!40000 ALTER TABLE `stickers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Antonette','McGlynn','kflatley@example.org','ab96e0ea0635ec0664d55b43430bb233d7d0deec',375336945281),(2,'Agustina','Legros','bernadette84@example.org','8c0331f4e397da51a2707c95b8cb52c7aa50e431',375339668698),(3,'Hailie','Berge','coty.welch@example.org','34498b6d82b238cc442588a8234e85a4ae77bfca',375338708505),(4,'Neoma','Sauer','skyla28@example.org','ec03886e52fa0195340a5ae2bc3a5e3a4a06c43d',375335381579),(5,'Arthur','Hane','wilford.medhurst@example.org','a8506b31a4c3eadda23e85707ea70b04fbcac8e4',375336568066),(6,'Gerry','Fisher','kuvalis.leonor@example.org','21bb90438dced03e0b15a3403740351804bfe099',375336626818),(7,'Carlotta','Davis','stehr.frieda@example.org','05f5ef337dbee3745f2ba24d5916cfc1af70b0b2',375334367687),(8,'Micheal','Koss','ffay@example.com','6fe34ebe8b68fae4eca3b1e4975077916396f2fe',375337655495),(9,'Winifred','Weimann','mack.fay@example.net','1202b2f81eea820643d284f34524fd9caa49f3ed',375333217361),(10,'Laurianne','Ondricka','walsh.josiah@example.org','f2aacc0906373cded038371444eeeff284df9a06',375337965529),(11,'Lavinia','Nikolaus','anika.johnston@example.net','259457ca95a7dbbccc07d84f43192caf408b1a86',375335110567),(12,'Gabriel','Reichert','alvera.schroeder@example.org','58deae50b24eafab3601d3249ee9c826ff56607e',375339317200),(13,'Ricardo','Langosh','ardith.satterfield@example.net','1928ea6b7f8f4f9a381336877250cb01f7fc25bd',375336659595),(14,'Bradford','Russel','xsatterfield@example.com','5e36dc479f57bbedfea15559429548a0c3bbbf14',375336317309),(15,'Zack','Predovic','hildegard63@example.org','e70552cc948a0026e4cef7ffeb61432b6f4cba90',375333698224),(16,'Stella','Harvey','leopold.effertz@example.net','530b14e5d3306f63561ac3baa2424e059b57335d',375338471858),(17,'Greg','Runolfsdottir','casandra.gerlach@example.com','2c78fdf07d45155a76f3c7b9fa5971725f97be0f',375333688903),(18,'Enos','Nicolas','dparisian@example.net','ebeda80948bd4fb73596db34d709341e3cdf1f3f',375334077838),(19,'Lennie','Mann','olson.wilfred@example.org','af56e637ef9927dce001f93a91044d7285231eed',375334858170),(20,'Easter','Franecki','rmcclure@example.net','e24a7fef55a91cc170764c81afec8c37ce0cbf0e',375335168705);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `walets`
--

DROP TABLE IF EXISTS `walets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `walets` (
  `walet_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_coin` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`walet_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `walets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `walets`
--

LOCK TABLES `walets` WRITE;
/*!40000 ALTER TABLE `walets` DISABLE KEYS */;
INSERT INTO `walets` VALUES ('Aliquid sequi.',99411,7),('Aut et deleniti.',25283,14),('Aut pariatur.',32343,3),('Consectetur.',76421,9),('Consequatur rerum.',67419,12),('Deleniti maiores.',16816,20),('Ducimus excepturi.',13528,10),('Est doloribus ipsa.',87288,8),('Et rerum sint vitae.',90805,15),('Facere perferendis.',89191,13),('Id debitis maxime.',55386,11),('Maiores doloribus.',94928,16),('Quia suscipit.',24540,2),('Quisquam id nostrum.',72596,5),('Sapiente sed.',73949,19),('Sequi et sit.',9360,17),('Sint libero qui.',68205,4),('Ullam veniam sed.',48600,18),('Veritatis.',20981,1),('Vero distinctio.',9641,6);
/*!40000 ALTER TABLE `walets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-21 16:26:02
