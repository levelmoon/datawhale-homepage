# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20016
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 8.0.27)
# 数据库: datawhale
# 生成时间: 2021-12-05 14:52:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# 转储表 activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activity`;

CREATE TABLE `activity` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '活动名称',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '活动描述',
  `registration_link` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '报名链接',
  `registration_end_time` timestamp NULL DEFAULT NULL COMMENT '报名截止时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='活动表';

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;

INSERT INTO `activity` (`id`, `name`, `description`, `registration_link`, `registration_end_time`, `create_time`, `modify_time`)
VALUES
	(1,'活动1','快来参加吧','http://www.shadowingszy.top','2021-12-07 00:00:00','2021-12-05 00:00:00','2021-12-05 17:14:36'),
	(2,'活动2','快来参加吧','http://www.shadowingszy.top','2021-12-10 00:00:00','2021-12-05 01:00:00','2021-12-05 17:14:55'),
	(3,'活动3','快来参加吧','http://www.shadowingszy.top','2021-12-13 00:00:00','2021-12-05 01:00:00','2021-12-05 17:16:55'),
	(4,'活动4','快来参加吧','http://www.shadowingszy.top','2021-11-10 00:00:00','2021-11-05 01:00:00','2021-12-05 17:17:02'),
	(5,'活动5','快来参加吧','http://www.shadowingszy.top','2021-12-15 00:00:00','2021-11-05 01:00:00','2021-12-05 17:17:33');

/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `image_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '轮播图片链接',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '轮播图描述',
  `status` int DEFAULT NULL COMMENT '轮播图状态，10可用，20不可用',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='轮播图内容表';

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;

INSERT INTO `banner` (`id`, `image_url`, `description`, `status`, `create_time`, `modify_time`)
VALUES
	(1,'http://www.shadowingszy.top/homepage/assets/images/image1.jpg','测试banner1',10,'2021-12-05 00:00:00','2021-12-05 18:34:14'),
	(2,'http://www.shadowingszy.top/homepage/assets/images/image2.jpg','测试banner2',10,'2021-12-05 00:00:00','2021-12-05 18:34:19');

/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 knowledge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `knowledge`;

CREATE TABLE `knowledge` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '知识体系id',
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '知识体系名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '知识体系内容，json格式',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='知识体系表';



# 转储表 learn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `learn`;

CREATE TABLE `learn` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '学习id',
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学习名称',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学习描述',
  `image_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学习封面图',
  `like` int DEFAULT NULL COMMENT '学习点赞数',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学习表';

LOCK TABLES `learn` WRITE;
/*!40000 ALTER TABLE `learn` DISABLE KEYS */;

INSERT INTO `learn` (`id`, `name`, `description`, `image_url`, `like`, `create_time`, `modify_time`)
VALUES
	(1,'南瓜书','我是描述我是描述','http://www.shadowingszy.top/homepage/assets/images/image1.jpg',50,'2021-12-05 00:00:00','2021-12-05 19:08:34'),
	(2,'机器学习入门','我是描述我是描述','http://www.shadowingszy.top/homepage/assets/images/image2.jpg',20,'2021-12-05 00:00:00','2021-12-05 19:09:17'),
	(3,'校招面经','我是描述我是描述','http://www.shadowingszy.top/homepage/assets/images/image3.jpg',10,'2021-12-05 00:00:00','2021-12-05 19:08:54');

/*!40000 ALTER TABLE `learn` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 learn_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `learn_detail`;

CREATE TABLE `learn_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '学习章节id',
  `learn_id` int DEFAULT NULL COMMENT '学习id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '章节标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '章节内容，md5格式',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学习章节内容表';



# 转储表 learn_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `learn_tag`;

CREATE TABLE `learn_tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `learn_id` int DEFAULT NULL COMMENT '学习id',
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标签名称',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学习标签表';

LOCK TABLES `learn_tag` WRITE;
/*!40000 ALTER TABLE `learn_tag` DISABLE KEYS */;

INSERT INTO `learn_tag` (`id`, `learn_id`, `name`, `create_time`, `modify_time`)
VALUES
	(1,1,'python','2021-12-05 00:00:00','2021-12-05 19:11:05'),
	(2,1,'机器学习','2021-12-05 00:00:00','2021-12-05 19:11:09'),
	(3,2,'人工智能','2021-12-05 00:00:00','2021-12-05 19:11:12'),
	(4,3,'校园招聘','2021-12-05 00:00:00','2021-12-05 19:11:16'),
	(5,3,'面试','2021-12-05 00:00:00','2021-12-05 19:10:57');

/*!40000 ALTER TABLE `learn_tag` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 learn_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `learn_video`;

CREATE TABLE `learn_video` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '学习视频id',
  `learn_id` int DEFAULT NULL COMMENT '学习id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '视频标题',
  `video_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '视频url',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学习视频表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
