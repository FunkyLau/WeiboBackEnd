CREATE DATABASE  IF NOT EXISTS `weibo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `weibo`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: weibo
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `admins_id` int(8) NOT NULL AUTO_INCREMENT,
  `admins_name` varchar(20) NOT NULL,
  `admins_pass` varchar(20) NOT NULL,
  `admins_type` varchar(10) NOT NULL,
  PRIMARY KEY (`admins_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','admin','高级管理员'),(2,'root','root','?????'),(3,'root','root','?????'),(4,'root','root','?????'),(5,'root','root','?????'),(6,'root','root','高级管理员'),(7,'root','root','高级管理员');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atusers`
--

DROP TABLE IF EXISTS `atusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atusers` (
  `atusers_id` int(8) NOT NULL AUTO_INCREMENT,
  `messages_id` int(8) NOT NULL,
  `users_id` int(8) NOT NULL,
  `atusers_time` datetime DEFAULT NULL,
  PRIMARY KEY (`atusers_id`),
  KEY `users_id_idx` (`users_id`),
  KEY `messages_id` (`messages_id`),
  CONSTRAINT `messages_id` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`messages_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atusers`
--

LOCK TABLES `atusers` WRITE;
/*!40000 ALTER TABLE `atusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `atusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `collections_id` int(8) NOT NULL AUTO_INCREMENT,
  `collections_time` timestamp(6) NULL DEFAULT NULL,
  `collections_status` int(8) NOT NULL DEFAULT '0',
  `users_id` int(8) NOT NULL,
  `messages_id` int(8) NOT NULL,
  PRIMARY KEY (`collections_id`),
  KEY `mess_id_idx` (`messages_id`),
  KEY `user_id_idx` (`users_id`),
  CONSTRAINT `mess_id` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`messages_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (1,NULL,2,18,19),(2,NULL,2,19,19),(3,NULL,2,19,21),(4,NULL,2,20,21),(5,NULL,2,18,27);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comments_id` int(8) NOT NULL AUTO_INCREMENT,
  `comments_info` varchar(200) DEFAULT NULL,
  `comments_infostatus` int(1) DEFAULT NULL,
  `comments_time` timestamp(6) NULL DEFAULT NULL,
  `messages_id` int(8) NOT NULL,
  `users_id` int(8) NOT NULL,
  PRIMARY KEY (`comments_id`),
  KEY `messid_idx` (`messages_id`),
  KEY `userid_idx` (`users_id`),
  CONSTRAINT `messid` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`messages_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usersid` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'これは本です。',1,'2015-06-02 04:37:28.023000',29,18),(2,'That\'s right!',1,'2015-06-02 04:46:53.877000',28,18),(3,'好听！',1,'2015-06-02 05:18:47.883000',27,18),(4,'对的！',1,'2015-06-09 02:17:05.863000',25,20);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `messages_id` int(8) NOT NULL AUTO_INCREMENT,
  `messages_type` varchar(20) DEFAULT NULL,
  `messages_info` varchar(400) DEFAULT NULL,
  `messages_time` timestamp(6) NULL DEFAULT NULL,
  `messages_collectnum` int(8) DEFAULT NULL,
  `messages_commentnum` int(8) DEFAULT NULL,
  `messages_transpondnum` int(8) DEFAULT NULL,
  `messages_agreenum` int(8) DEFAULT NULL,
  `messages_readnum` int(8) DEFAULT NULL,
  `messages_label` varchar(80) DEFAULT NULL,
  `users_id` int(8) NOT NULL,
  PRIMARY KEY (`messages_id`),
  KEY `usertoid_idx` (`users_id`),
  CONSTRAINT `messusersid` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (19,'原创','今天天气特别棒，适合出去野餐出游。','2015-05-23 16:01:48.269000',0,0,0,2,0,NULL,18),(20,'原创','我明天就要去北京玩啦！希望天气晴好','2015-05-27 01:47:58.049000',0,0,0,0,0,NULL,19),(21,'原创','“我希望她了解，你只爱每件事的开头。”——《广告狂人》','2015-05-27 02:00:07.241000',0,0,0,2,0,NULL,19),(22,'原创','暇な時、何をしますか。','2015-05-27 06:28:46.151000',0,0,0,0,0,NULL,20),(23,'原创','找个恐怖片看好困难','2015-05-28 12:06:54.067000',0,0,0,0,0,NULL,18),(24,'原创','我难以离开 我难以存在 我难以活得过分实实在在 我想要离开 我想要存在 我想要死去之后从头再来','2015-05-28 12:38:32.328000',0,0,0,0,0,NULL,19),(25,'原创','再拥挤的车厢，人与人之间都要留出一个手机的距离。','2015-05-28 12:47:27.945000',0,1,0,0,0,NULL,18),(26,'原创','ただいます。','2015-05-28 14:16:43.637000',0,0,0,0,0,NULL,20),(27,'原创','音乐是如此的美妙，推荐巴赫的哥德堡变奏。','2015-06-01 15:54:01.570000',0,1,0,1,0,NULL,21),(28,'原创','Keep calm and goto fail.','2015-06-01 15:59:58.337000',0,1,0,0,0,NULL,19),(29,'原创','これはなんですか。','2015-06-01 16:05:47.341000',0,1,0,0,0,NULL,20),(30,'原创','I\'ll see you on the dark side of the moon.','2015-06-01 16:11:39.674000',0,0,0,0,0,NULL,18),(31,'原创','小野さんは日本人です。','2015-06-08 19:43:44.423000',0,0,0,0,0,NULL,20),(32,'原创','今天天气很好，我们进行了毕业答辩！','2015-06-09 02:16:34.742000',0,0,0,0,0,NULL,20),(33,'原创','工作比较忙，喝杯咖啡休息休息。','2015-06-15 11:39:16.595000',0,0,0,0,0,NULL,18);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `pictures_id` int(8) NOT NULL AUTO_INCREMENT,
  `pictures_url` varchar(200) DEFAULT NULL,
  `pictures_type` varchar(20) DEFAULT NULL,
  `pictures_time` timestamp(6) NULL DEFAULT NULL,
  `users_id` int(8) NOT NULL,
  `messages_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`pictures_id`),
  KEY `picmessid_idx` (`messages_id`),
  KEY `picuserid_idx` (`users_id`),
  CONSTRAINT `picuserid` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (5,'/2015_05_23_23_49_27_1432396167496.jpg','头像','2015-05-23 15:49:27.608000',18,NULL),(6,'/2015_05_27_09_47_00_1432691220404.jpg','头像','2015-05-27 01:47:00.496000',19,NULL),(7,'/2015_06_09_10_21_00_1433816460378.jpg','头像','2015-06-09 02:21:00.866000',20,NULL),(8,'/2015_06_01_23_52_53_1433173973765.jpg','头像','2015-06-01 15:52:53.828000',21,NULL);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privateletter`
--

DROP TABLE IF EXISTS `privateletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privateletter` (
  `privateletter_id` int(8) NOT NULL AUTO_INCREMENT,
  `privateletter_info` varchar(400) DEFAULT NULL,
  `privateletter_infostatus` int(1) DEFAULT NULL,
  `privateletter_time` timestamp(6) NULL DEFAULT NULL,
  `users_sid` int(8) NOT NULL,
  `users_reid` int(8) NOT NULL,
  PRIMARY KEY (`privateletter_id`),
  KEY `priuserreid_idx` (`users_reid`),
  KEY `priuserid_idx` (`users_sid`),
  CONSTRAINT `priuserid` FOREIGN KEY (`users_sid`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `priuserrid` FOREIGN KEY (`users_reid`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privateletter`
--

LOCK TABLES `privateletter` WRITE;
/*!40000 ALTER TABLE `privateletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `privateletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation` (
  `relation_id` int(8) NOT NULL AUTO_INCREMENT,
  `relation_time` timestamp(6) NULL DEFAULT NULL,
  `relation_note` varchar(20) DEFAULT NULL,
  `relation_groupname` varchar(20) DEFAULT NULL,
  `users_id` int(8) NOT NULL,
  `users_byid` int(8) NOT NULL,
  PRIMARY KEY (`relation_id`),
  KEY `relusersbyid_idx` (`users_byid`),
  KEY `relusersid_idx` (`users_id`),
  CONSTRAINT `relusersbyid` FOREIGN KEY (`users_byid`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `relusersid` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` VALUES (1,'2015-05-27 01:47:23.077000','罗伯特','朋友',19,18),(2,'2015-05-27 05:25:47.095000','Robert','朋友',18,19),(3,'2015-05-27 06:15:09.823000','Robert','未分组',20,19),(4,'2015-05-27 06:15:53.937000','刘嘉晨','朋友',20,18),(5,'2015-05-28 12:39:04.921000','坂本龍一','朋友',19,20),(6,'2015-05-28 12:40:14.036000','坂本龍一','朋友',18,20),(7,'2015-06-01 15:54:19.872000','坂本龍一','明星名人',21,20),(8,'2015-06-01 15:55:07.970000','Robert','朋友',21,19),(9,'2015-06-01 15:57:19.226000','刘嘉晨','朋友',21,18),(10,'2015-06-01 15:58:17.008000','李如春','朋友',19,21),(11,'2015-06-01 16:06:07.856000','李如春','朋友',20,21),(12,'2015-06-01 16:12:03.635000','李如春','朋友',18,21),(13,'2015-06-09 02:23:55.429000','','同学',22,19);
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `userinfo_id` int(8) NOT NULL AUTO_INCREMENT,
  `userinfo_truename` varchar(40) DEFAULT NULL,
  `userinfo_address` varchar(120) DEFAULT NULL,
  `userinfo_sex` varchar(4) DEFAULT NULL,
  `userinfo_sexual` varchar(8) DEFAULT NULL,
  `userinfo_feeling` varchar(20) DEFAULT NULL,
  `userinfo_birthday` varchar(20) DEFAULT NULL,
  `userinfo_bloodtype` varchar(8) DEFAULT NULL,
  `userinfo_blogurl` varchar(200) DEFAULT NULL,
  `userinfo_realname` varchar(200) DEFAULT NULL,
  `userinfo_intro` varchar(400) DEFAULT NULL,
  `userinfo_email` varchar(60) DEFAULT NULL,
  `userinfo_qqnumber` varchar(30) DEFAULT NULL,
  `userinfo_messenger` varchar(60) DEFAULT NULL,
  `userinfo_profession` varchar(60) DEFAULT NULL,
  `userinfo_label` varchar(200) DEFAULT NULL,
  `users_id` int(8) NOT NULL,
  PRIMARY KEY (`userinfo_id`),
  KEY `infousersid_idx` (`users_id`),
  CONSTRAINT `infousersid` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (13,'刘嘉晨','吉林省 长春市','男','女','单身','1992-7-19','B型','boke.com','liujiachen.com','这是第三个用户','tt@qq.com','413645157','lp6567@hotmail.com','学生','这是主用户',18),(14,'罗伯特','上海市 黄浦区','男','女','恋爱中','1988-8-4','O型','http://robert.com','robert.com','这是一个外国用户',NULL,NULL,NULL,NULL,NULL,19),(15,'坂本龍一','其它 null','男','女','已婚','1952-1-17','O型','www.sina.com','RyuichiSakamoto.com','音乐家，制作人，演员','lp4545@qq.com','66655669','RyuichiSakamoto@msn.','音乐家','音楽',20),(16,'李如春','广东省 广州市','男','女','已婚','1969-5-4','AB型','http://liruchun.com','liruchun.com','音乐教授','tt@163.com','45645612','liruchun@msn.com','教授','音乐有趣',21),(17,NULL,'北京 东城区','男',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ll123@sina.com',NULL,NULL,NULL,NULL,22);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `users_id` int(8) NOT NULL AUTO_INCREMENT,
  `users_email` varchar(40) NOT NULL,
  `users_password` varchar(80) NOT NULL,
  `users_nikename` varchar(60) NOT NULL,
  `users_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `users_status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `users_email_UNIQUE` (`users_email`),
  UNIQUE KEY `users_nikename_UNIQUE` (`users_nikename`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (18,'tt@qq.com','123456','jiachenliu','2015-05-23 15:48:49.849000',0),(19,'lp6567@sina.com','123456','Robert','2015-05-27 01:37:46.161000',0),(20,'123@sina.com','123456','坂本龍一','2015-05-27 06:13:44.713000',0),(21,'tt@163.com','123456','咚咚锵','2015-06-01 15:22:23.494000',0),(22,'ll123@sina.com','123456','开心每一天','2015-06-09 02:23:06.303000',0);
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

-- Dump completed on 2015-07-03  9:32:41
