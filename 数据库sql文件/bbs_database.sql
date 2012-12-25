/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : bbs_database

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2012-12-25 10:11:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bbs_article`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_article`;
CREATE TABLE `bbs_article` (
  `ArticleID` bigint(20) NOT NULL COMMENT '文章ID',
  `BoardId` bigint(20) NOT NULL COMMENT '版区ID',
  `BoardName` varchar(60) NOT NULL COMMENT '版区名字',
  `ReNum` int(11) NOT NULL COMMENT '回复数量',
  `ClickNum` int(11) NOT NULL COMMENT '文章点击数',
  `UserName` varchar(20) NOT NULL,
  `NickName` varchar(60) NOT NULL,
  `Title` varchar(150) NOT NULL,
  `Detail` text NOT NULL COMMENT '文章内容',
  `Sign` text NOT NULL COMMENT '文章简要说明',
  `PostTime` datetime NOT NULL,
  `IsTop` tinyint(4) NOT NULL COMMENT '是否置顶',
  PRIMARY KEY  (`ArticleID`),
  KEY `FK_Reference_1` (`UserName`),
  KEY `FK_Reference_2` (`BoardId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`BoardId`) REFERENCES `bbs_board` (`BoardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛文章数据库';

-- ----------------------------
-- Records of bbs_article
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_board`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_board`;
CREATE TABLE `bbs_board` (
  `BoardId` bigint(20) NOT NULL,
  `ParentBoardId` bigint(20) default NULL COMMENT '为空表示父板块',
  `BoardName` varchar(20) NOT NULL COMMENT '论坛名字',
  `BriefExplain` text NOT NULL COMMENT '简短描述',
  `ArticleNum` int(11) NOT NULL COMMENT '文章数量',
  `UserName` varchar(20) NOT NULL,
  PRIMARY KEY  (`BoardId`),
  KEY `FK_Reference_3` (`UserName`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛版区表';

-- ----------------------------
-- Records of bbs_board
-- ----------------------------

-- ----------------------------
-- Table structure for `bugdetail`
-- ----------------------------
DROP TABLE IF EXISTS `bugdetail`;
CREATE TABLE `bugdetail` (
  `BugID` bigint(20) NOT NULL auto_increment,
  `BugUploadedTime` datetime default NULL,
  `UserName` varchar(20) default NULL,
  `BugPicPath` varchar(150) default NULL,
  `BugOS` varchar(150) default NULL,
  `BugProgName` varchar(50) default NULL,
  `BugTag` text,
  `BugName` varchar(50) default NULL,
  `BugDes` text,
  PRIMARY KEY  (`BugID`),
  KEY `FK_Reference_4` (`UserName`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bugdetail
-- ----------------------------
INSERT INTO `bugdetail` VALUES ('22', null, 'fuxiangyun', 'filename', null, null, null, null, null);
INSERT INTO `bugdetail` VALUES ('23', null, 'fuxiangyun', 'BugPicPath', null, null, null, null, null);
INSERT INTO `bugdetail` VALUES ('24', null, 'fuxiangyun', 'BugPicPath', null, null, null, null, null);
INSERT INTO `bugdetail` VALUES ('25', null, '傅相云2号', 'BugPicPath', null, null, null, null, null);
INSERT INTO `bugdetail` VALUES ('26', null, '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', null, 'BugDes');
INSERT INTO `bugdetail` VALUES ('27', null, 'fuxiangyun', 'BugPicPath', null, null, null, null, null);
INSERT INTO `bugdetail` VALUES ('28', null, 'fuxiangyun', 'BugPicPath', null, null, null, null, null);
INSERT INTO `bugdetail` VALUES ('29', null, 'fuxiangyun', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', null, 'BugDes');
INSERT INTO `bugdetail` VALUES ('30', null, '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', null, 'BugDes');
INSERT INTO `bugdetail` VALUES ('31', null, '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', null, 'BugDes');
INSERT INTO `bugdetail` VALUES ('33', null, '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', 'BugName');
INSERT INTO `bugdetail` VALUES ('34', null, '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', 'BugName');
INSERT INTO `bugdetail` VALUES ('35', null, '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugName', 'BugDes');
INSERT INTO `bugdetail` VALUES ('36', null, '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', null, 'BugDes');
INSERT INTO `bugdetail` VALUES ('37', null, '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', null, 'BugDes');
INSERT INTO `bugdetail` VALUES ('38', null, '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', null, 'BugDes');
INSERT INTO `bugdetail` VALUES ('39', null, '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugName', 'BugDes');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `UserName` varchar(20) NOT NULL,
  `NickName` varchar(60) default NULL,
  `Password` varchar(40) default NULL,
  `Email` varchar(255) default NULL,
  `Question` varchar(255) default NULL,
  `Answer` varchar(255) default NULL,
  `RegTime` date default NULL,
  `SignDetail` text COMMENT '用户签名',
  `HavePic` tinyint(4) default NULL,
  `PicName` varchar(255) default NULL,
  PRIMARY KEY  (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录用户信息';

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'nickname', 'password', 'email', 'question', 'answer', '2012-01-01', 'a', '1', 'picname');
INSERT INTO `userinfo` VALUES ('3', 'nickname', 'password', 'email', 'question', 'answer', '2012-01-01', 'a', '1', 'picname');
INSERT INTO `userinfo` VALUES ('5', '1', '1', 'email', 'question', 'answer', '2012-01-01', 'a', '1', 'picname');
INSERT INTO `userinfo` VALUES ('6', '5', '5', null, null, null, '2012-01-01', 'a', null, null);
INSERT INTO `userinfo` VALUES ('8', '1', '1', 'email', 'question', 'answer', '2012-12-13', 'a', '1', 'picname');
INSERT INTO `userinfo` VALUES ('fuxiangyun', null, 'fuxiangyun', null, null, null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('fuxiangyun1', null, null, null, null, null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('test', '', '', null, null, null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('test2', null, null, null, null, null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('test3', null, null, null, null, null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('傅相云', '1', '1', '450306159@qq.com', 'question', 'answer', '2012-12-13', 'a', '1', 'picname');
INSERT INTO `userinfo` VALUES ('傅相云2号', '1', '1', '450306159@qq.com', 'question', 'answer', '2012-12-13', 'a', '1', 'picname');
INSERT INTO `userinfo` VALUES ('神仙', '1', '1', 'email', 'question', 'answer', '2012-01-01', 'a', '1', 'picname');

-- ----------------------------
-- Procedure structure for `LoginCheck`
-- ----------------------------
DROP PROCEDURE IF EXISTS `LoginCheck`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LoginCheck`(IN `username` varchar(20),IN `password` varchar(40),OUT `result` varchar(20))
    READS SQL DATA
BEGIN
	#Routine body goes here...
	declare v_pass varchar(40);
	select userinfo.password into v_pass from userinfo where userinfo.UserName = username;
	if v_pass = password THEN
		set result = "正确";
	ELSEIF v_pass is NULL THEN
		set result = "用户不存在";
	ELSE
		set result = "密码错误";
	end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Registeration`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Registeration`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registeration`(IN `UserName` varchar(20),IN `NickName` varchar(60),IN `Password` varchar(40),IN `Email` varchar(255),IN `Question` varchar(255),IN `Answer` varchar(255),IN `RegTime` datetime,IN `SignDetail` text,IN `HavePic` tinyint,IN `PicName` varchar(255),OUT `Result` varchar(20))
BEGIN
	#Routine body goes here...
	declare v_temp varchar(20);
	set v_temp= "";
	#select userinfo.password into v_pass from userinfo where userinfo.UserName = username;
	select userinfo.UserName into v_temp from userinfo where userinfo.Username = UserName;
	IF v_temp = "" THEN
		insert into userinfo (UserName,NickName,Password,Email,Question,Answer,RegTime,SignDetail,HavePic,PicName) 
		VALUES(UserName,NickName,Password,Email,Question,Answer,RegTime,SignDetail,HavePic,PicName);
		set Result = "成功";
	ELSE
		set Result = "用户名已存在";
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Upload_bug`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Upload_bug`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Upload_bug`(IN `UserName` varchar(20),IN `BugPicPath` varchar(150),IN `BugOS` varchar(150),IN `BugProgName` varchar(50),IN `BugTag` text,IN `BugDes` text,IN `BugName` varchar(50))
BEGIN
	#Routine body goes here...
	INSERT INTO bugdetail (UserName,BugPicPath,BugOS,BugProgName,BugTag,BugDes,BugName)
	values (UserName,BugPicPath,BugOS,BugProgName,BugTag,BugDes,BugName);
END
;;
DELIMITER ;
