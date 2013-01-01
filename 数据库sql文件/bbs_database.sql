CREATE DATABASE  IF NOT EXISTS `bbs_database` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bbs_database`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: bbs_database
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `bbs_activity`
--

DROP TABLE IF EXISTS `bbs_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_activity` (
  `act_name` varchar(50) NOT NULL,
  `act_detail` text,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`act_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs_activity`
--

LOCK TABLES `bbs_activity` WRITE;
/*!40000 ALTER TABLE `bbs_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbs_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `softwarebug`
--

DROP TABLE IF EXISTS `softwarebug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `softwarebug` (
  `Sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `SoftwareName` text,
  `SoftwareBugNum` bigint(12) DEFAULT NULL,
  `SoftwareDescription` text,
  `SoftwareCompany` text,
  `SoftwareImagePath` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=InnoDB AUTO_INCREMENT=10017 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softwarebug`
--

LOCK TABLES `softwarebug` WRITE;
/*!40000 ALTER TABLE `softwarebug` DISABLE KEYS */;
INSERT INTO `softwarebug` VALUES (10011,'不知道叫啥',0,NULL,NULL,NULL),(10012,'总是崩',0,NULL,NULL,NULL),(10013,'bug',0,NULL,NULL,NULL),(10014,'就这个',0,NULL,NULL,NULL),(10015,'最后一个',1,NULL,NULL,NULL),(10016,'试一试',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `softwarebug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugdetail`
--

DROP TABLE IF EXISTS `bugdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugdetail` (
  `BugID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BugUploadedTime` datetime NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `BugPicPath` varchar(150) DEFAULT NULL,
  `BugOS` varchar(150) NOT NULL,
  `BugProgName` varchar(50) NOT NULL DEFAULT '未输入',
  `BugTag` text,
  `BugDes` text,
  `BugName` varchar(50) DEFAULT '未命名',
  PRIMARY KEY (`BugID`),
  KEY `FK_Reference_4` (`UserName`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugdetail`
--

LOCK TABLES `bugdetail` WRITE;
/*!40000 ALTER TABLE `bugdetail` DISABLE KEYS */;
INSERT INTO `bugdetail` VALUES (36,'2013-01-01 14:06:35','PacoIrene','../upload/GFD.53.pdf','Windows','不知道叫啥','笨蛋','就是开不开','开不开机'),(37,'2013-01-01 14:08:08','PacoIrene','','Windows','总是崩','不稳定','每次打开5分钟之后就崩了','崩'),(38,'2013-01-01 14:09:38','PacoIrene','../upload/OGSA.docx','Android','bug','差劲','总是很差劲','跳转地方不对'),(39,'2013-01-01 14:10:35','PacoIrene','../upload/102958_楚振阳_战争简史小论文.docx','Windows','就这个','莫名','就是有问题','有问题'),(40,'2013-01-01 14:11:09','PacoIrene','','Windows','最后一个','好吧','。。。。。。。','唉'),(41,'2013-01-01 14:13:22','Jack','../upload/new.txt','Windows','试一试','其实没有','太多问题','Test'),(42,'2013-01-01 14:14:02','Jack','','Windows','最后一个','唉','写不完了','失算');
/*!40000 ALTER TABLE `bugdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `t_UserBugNum` AFTER INSERT ON `bugdetail` FOR EACH ROW begin 
	set @x = NEW.UserName;
	update userinfo set userinfo.BugNum = userinfo.BugNum+1 where UserName = @x;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `t_UserBugNum_Minus` AFTER DELETE ON `bugdetail` FOR EACH ROW begin
	set @x = OLD.UserName;
	update userinfo set userinfo.BugNum = userinfo.BugNum - 1 where UserName = @x;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `in_activity_user`
--

DROP TABLE IF EXISTS `in_activity_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `in_activity_user` (
  `act_name` varchar(50) NOT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`act_name`),
  KEY `FK_Reference_6` (`UserName`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`act_name`) REFERENCES `bbs_activity` (`act_name`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_activity_user`
--

LOCK TABLES `in_activity_user` WRITE;
/*!40000 ALTER TABLE `in_activity_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `in_activity_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `UserName` varchar(20) NOT NULL,
  `NickName` varchar(60) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Question` varchar(255) DEFAULT NULL,
  `Answer` varchar(255) DEFAULT NULL,
  `RegTime` datetime DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `LoginTImes` int(11) unsigned DEFAULT NULL,
  `SignDetail` text COMMENT '用户签名',
  `HavePic` tinyint(4) DEFAULT NULL,
  `PicName` varchar(255) DEFAULT NULL,
  `BugNum` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('Jack','Rose','9876',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),('PacoIrene','nick','12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5),('SearchBug','NoBug','12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('戴佳','小个子','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('手撕包菜','大酱汤','1234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('算法','设计','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `Rid` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(20) DEFAULT NULL,
  `ReplyTime` datetime DEFAULT NULL,
  `ReplyDetail` text,
  `ArticleID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Rid`),
  KEY `FK_Reference_8` (`UserName`),
  KEY `FK_Reference_9` (`ArticleID`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`ArticleID`) REFERENCES `bbs_article` (`ArticleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbs_board`
--

DROP TABLE IF EXISTS `bbs_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_board` (
  `BoardId` bigint(20) NOT NULL,
  `ParentBoardId` bigint(20) DEFAULT NULL COMMENT '为空表示父板块',
  `BoardName` varchar(20) NOT NULL COMMENT '论坛名字',
  `BriefExplain` text NOT NULL COMMENT '简短描述',
  `ArticleNum` int(11) NOT NULL COMMENT '文章数量',
  `UserName` varchar(20) NOT NULL,
  PRIMARY KEY (`BoardId`),
  KEY `FK_Reference_3` (`UserName`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛版区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs_board`
--

LOCK TABLES `bbs_board` WRITE;
/*!40000 ALTER TABLE `bbs_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbs_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbs_article`
--

DROP TABLE IF EXISTS `bbs_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_article` (
  `ArticleID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `ReNum` int(11) NOT NULL COMMENT '回复数量',
  `ClickNum` int(11) NOT NULL COMMENT '文章点击数',
  `UserName` varchar(20) NOT NULL,
  `Title` varchar(150) NOT NULL,
  `Detail` text NOT NULL COMMENT '文章内容',
  `PostTime` datetime NOT NULL,
  `IsTop` tinyint(4) NOT NULL COMMENT '是否置顶',
  `BugID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `FK_Reference_1` (`UserName`),
  KEY `FK_Reference_7` (`BugID`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`BugID`) REFERENCES `bugdetail` (`BugID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1028 DEFAULT CHARSET=utf8 COMMENT='论坛文章数据库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs_article`
--

LOCK TABLES `bbs_article` WRITE;
/*!40000 ALTER TABLE `bbs_article` DISABLE KEYS */;
INSERT INTO `bbs_article` VALUES (1023,0,0,'Jack','这种问题你也说','太弱了','2013-01-01 14:12:36',0,40),(1024,0,0,'Jack','我再说一遍吧','还是不行','2013-01-01 14:12:54',0,40),(1025,0,0,'Jack','很好解决的','步骤如下','2013-01-01 14:14:33',0,39),(1026,0,0,'Jack','jack','就是这样','2013-01-01 14:14:55',0,36),(1027,0,1,'Jack','你确定你点的是这个','吗','2013-01-01 14:15:23',0,38);
/*!40000 ALTER TABLE `bbs_article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-01 14:19:08
