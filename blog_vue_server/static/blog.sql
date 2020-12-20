-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.8-MariaDB - MariaDB package
-- Server OS:                    Linux
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for blog
CREATE DATABASE IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `blog`;

-- Dumping structure for table blog.blog
DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `views` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blog.blog: ~8 rows (approximately)
DELETE FROM `blog`;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` (`id`, `content`, `create_time`, `category`, `title`, `create_user`, `views`) VALUES
	(9, 'yayya\njava\n\nthis is a blog test', '2020-12-20 17:21:37', 'java', 'hello java', 'hello', 0),
	(10, 'c++\n\nhahaha', '2020-12-20 17:22:05', 'c++', 'hello  c++', 'hello', 0),
	(11, 'python \nxxxxx', '2020-12-20 17:23:51', 'python', 'xixi  python', 'hello', 0),
	(12, 'javascript', '2020-12-20 17:24:15', 'javascript', 'jjjjs  demo', 'hello', 0),
	(13, 'd', '2020-12-20 17:24:36', 'python', 'dddddddddddddddd', 'hello', 0),
	(14, 'shibingss', '2020-12-20 17:24:55', 'vue', 'eeeeeeeeeeeeess', 'hello', 0),
	(15, 'ddddddddddddd', '2020-12-20 17:25:19', 'python', 'debadeabde', 'hello', 0),
	(16, 'bbbbbsdsa', '2020-12-20 17:25:37', 'javascript', 'bbiiiiiiiiiiii', 'hello', 1);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;

-- Dumping structure for table blog.blog_image
DROP TABLE IF EXISTS `blog_image`;
CREATE TABLE IF NOT EXISTS `blog_image` (
  `id` int(32) DEFAULT NULL,
  `blog_id` int(50) DEFAULT NULL,
  `imageurl` varchar(200) DEFAULT NULL,
  KEY `id_key` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blog.blog_image: ~0 rows (approximately)
DELETE FROM `blog_image`;
/*!40000 ALTER TABLE `blog_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_image` ENABLE KEYS */;

-- Dumping structure for table blog.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `last_login_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blog.user: ~2 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `create_time`, `last_login_time`) VALUES
	(1, 'hello', '64a54ccc98a99c68357a6187e74df475', '2020-12-19 19:19:52', NULL),
	(2, 'study', '64a54ccc98a99c68357a6187e74df475', '2020-12-20 19:30:23', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
