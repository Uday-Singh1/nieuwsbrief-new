# ************************************************************
# Sequel Ace SQL dump
# Version 20051
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 11.0.2-MariaDB-1:11.0.2+maria~ubu2204)
# Database: nieuwsbrief
# Generation Time: 2023-10-05 10:29:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table news-category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news-category`;

CREATE TABLE `news-category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `naam` (`naam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `news-category` WRITE;
/*!40000 ALTER TABLE `news-category` DISABLE KEYS */;

INSERT INTO `news-category` (`id`, `naam`)
VALUES
	(2,'eten'),
	(1,'vervoer');

/*!40000 ALTER TABLE `news-category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_newsletter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_newsletter`;

CREATE TABLE `user_newsletter` (
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `user_newsletter` WRITE;
/*!40000 ALTER TABLE `user_newsletter` DISABLE KEYS */;

INSERT INTO `user_newsletter` (`user_id`, `news_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1);

/*!40000 ALTER TABLE `user_newsletter` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `date`, `active`)
VALUES
	(1,'Uday Singh','udayrisham@gmail.com','2023-10-05 08:52:46',1),
	(2,'Uday Singh','udayrisham@gmail.com','2023-10-05 08:58:46',1),
	(3,'Uday Singh','udayrisham@gmail.com','2023-10-05 08:58:49',1),
	(4,'Uday Singh','udayrisham@gmail.com','2023-10-05 10:23:49',1),
	(5,'Uday Singh','udayrisham@gmail.com','2023-10-05 10:28:07',1),
	(6,'Uday Singh','udayrisham@gmail.com','2023-10-05 10:28:13',1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
