/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : bbs_database

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2012-12-27 18:31:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bbs_activity`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_activity`;
CREATE TABLE `bbs_activity` (
  `act_name` varchar(50) NOT NULL,
  `act_detail` text,
  `begin_time` datetime default NULL,
  `end_time` datetime default NULL,
  PRIMARY KEY  (`act_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_activity
-- ----------------------------

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
  `BugID` bigint(20) default NULL,
  PRIMARY KEY  (`ArticleID`),
  KEY `FK_Reference_1` (`UserName`),
  KEY `FK_Reference_2` (`BoardId`),
  KEY `FK_Reference_7` (`BugID`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`BugID`) REFERENCES `bugdetail` (`BugID`),
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
  `BugUploadedTime` datetime NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `BugPicPath` varchar(150) NOT NULL,
  `BugOS` varchar(150) NOT NULL,
  `BugProgName` varchar(50) NOT NULL,
  `BugTag` text,
  `BugDes` text,
  `BugName` varchar(50) default NULL,
  PRIMARY KEY  (`BugID`),
  KEY `FK_Reference_4` (`UserName`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bugdetail
-- ----------------------------
INSERT INTO `bugdetail` VALUES ('9', '0000-00-00 00:00:00', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null);
INSERT INTO `bugdetail` VALUES ('10', '0000-00-00 00:00:00', '傅相云1号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null);
INSERT INTO `bugdetail` VALUES ('11', '0000-00-00 00:00:00', '傅相云1号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null);

-- ----------------------------
-- Table structure for `in_activity_user`
-- ----------------------------
DROP TABLE IF EXISTS `in_activity_user`;
CREATE TABLE `in_activity_user` (
  `act_name` varchar(50) NOT NULL,
  `UserName` varchar(20) default NULL,
  PRIMARY KEY  (`act_name`),
  KEY `FK_Reference_6` (`UserName`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`act_name`) REFERENCES `bbs_activity` (`act_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of in_activity_user
-- ----------------------------

-- ----------------------------
-- Table structure for `softwarebug`
-- ----------------------------
DROP TABLE IF EXISTS `softwarebug`;
CREATE TABLE `softwarebug` (
  `Sid` bigint(20) NOT NULL auto_increment,
  `SoftwareName` text,
  `SoftwareBugNum` bigint(12) default NULL,
  `SoftwareDescription` text,
  `SoftwareCompany` text,
  PRIMARY KEY  (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of softwarebug
-- ----------------------------

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `UserName` varchar(20) NOT NULL,
  `NickName` varchar(60) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Email` varchar(255) default NULL,
  `Question` varchar(255) default NULL,
  `Answer` varchar(255) default NULL,
  `RegTime` datetime default NULL,
  `LoginTime` datetime default NULL,
  `LoginTImes` int(11) unsigned default NULL,
  `SignDetail` text COMMENT '用户签名',
  `HavePic` tinyint(4) default NULL,
  `PicName` varchar(255) default NULL,
  `BugNum` int(11) unsigned default '0',
  PRIMARY KEY  (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录用户信息';

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('傅相云1号', '1', '1', 'email', 'question', 'answer', '2012-01-01 00:00:00', null, null, 'a', '1', 'picname', '2');
INSERT INTO `userinfo` VALUES ('傅相云2号', '1', '1', 'email', 'question', 'answer', '2012-01-01 00:00:00', null, null, 'a', '1', 'picname', '1');
INSERT INTO `userinfo` VALUES ('神仙', '1', '1', 'email', 'question', 'answer', '2012-01-01 00:00:00', null, null, 'a', '1', 'picname', '0');

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
		set result = "ok";
	ELSEIF v_pass is NULL THEN
		set result = "username wrong";
	ELSE
		set result = "password wrong";
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
		set Result = "success";
	ELSE
		set Result = "exist";
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Upload_bug`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Upload_bug`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Upload_bug`(IN `UserName` varchar(20),IN `BugPicPath` varchar(150),IN `BugOS` varchar(150),IN `BugProgName` varchar(50),IN `BugTag` text,IN `BugDes` text)
BEGIN
	#Routine body goes here...
	INSERT INTO bugdetail (UserName,BugPicPath,BugOS,BugProgName,BugTag,BugDes)
	values (UserName,BugPicPath,BugOS,BugProgName,BugTag,BugDes);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_UserBugNum`;
DELIMITER ;;
CREATE TRIGGER `t_UserBugNum` AFTER INSERT ON `bugdetail` FOR EACH ROW begin 
	set @x = NEW.UserName;
	update userinfo set userinfo.BugNum = userinfo.BugNum+1 where UserName = @x;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_UserBugNum_Minus`;
DELIMITER ;;
CREATE TRIGGER `t_UserBugNum_Minus` AFTER DELETE ON `bugdetail` FOR EACH ROW begin
	set @x = OLD.UserName;
	update userinfo set userinfo.BugNum = userinfo.BugNum - 1 where UserName = @x;
end
;;
DELIMITER ;
