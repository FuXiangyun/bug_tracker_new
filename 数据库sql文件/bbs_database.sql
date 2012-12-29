/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : bbs_database

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2012-12-29 19:54:38
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
  `ArticleID` bigint(20) NOT NULL auto_increment COMMENT '文章ID',
  `ReNum` int(11) NOT NULL COMMENT '回复数量',
  `ClickNum` int(11) NOT NULL COMMENT '文章点击数',
  `UserName` varchar(20) NOT NULL,
  `Title` varchar(150) NOT NULL,
  `Detail` text NOT NULL COMMENT '文章内容',
  `PostTime` datetime NOT NULL,
  `IsTop` tinyint(4) NOT NULL COMMENT '是否置顶',
  `BugID` bigint(20) default NULL,
  PRIMARY KEY  (`ArticleID`),
  KEY `FK_Reference_1` (`UserName`),
  KEY `FK_Reference_7` (`BugID`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`BugID`) REFERENCES `bugdetail` (`BugID`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`)
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
  `BugProgName` text NOT NULL,
  `BugTag` text,
  `BugDes` text,
  `BugName` varchar(50) default NULL,
  `Sid` bigint(20) default NULL COMMENT '软件名',
  PRIMARY KEY  (`BugID`),
  KEY `FK_Reference_4` (`UserName`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bugdetail
-- ----------------------------
INSERT INTO `bugdetail` VALUES ('30', '0000-00-00 00:00:00', '傅相云2号', 'BugPicPath', 'BugOS', '360', 'BugTag', 'BugDes', null, '1');
INSERT INTO `bugdetail` VALUES ('31', '0000-00-00 00:00:00', '傅相云2号', 'BugPicPath', 'BugOS', '360', 'BugTag', 'BugDes', null, '1');
INSERT INTO `bugdetail` VALUES ('34', '0000-00-00 00:00:00', '傅相云2号', 'BugPicPath', 'BugOS', 'Oracle', 'BugTag', 'BugDes', null, '2');
INSERT INTO `bugdetail` VALUES ('35', '0000-00-00 00:00:00', '傅相云2号', 'BugPicPath', 'BugOS', 'Oracle', 'BugTag', 'BugDes', null, '2');
INSERT INTO `bugdetail` VALUES ('38', '0000-00-00 00:00:00', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('39', '0000-00-00 00:00:00', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('40', '2012-12-28 11:42:15', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('41', '2012-01-01 00:00:00', '傅相云2号', 'BugPicPath', 'BugOS', '360', 'BugTag', 'BugDes', null, '1');
INSERT INTO `bugdetail` VALUES ('45', '2012-12-28 11:44:44', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('46', '2012-12-28 11:44:44', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('47', '2012-12-28 11:44:44', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('48', '2012-12-28 11:44:44', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('49', '2012-12-28 11:44:44', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('50', '2012-12-28 11:48:02', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('51', '2012-12-28 11:48:44', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('52', '2012-12-28 11:49:04', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');
INSERT INTO `bugdetail` VALUES ('53', '2012-12-28 11:49:32', '傅相云2号', 'BugPicPath', 'BugOS', 'BugProgName', 'BugTag', 'BugDes', null, '3');

-- ----------------------------
-- Table structure for `in_activity_user`
-- ----------------------------
DROP TABLE IF EXISTS `in_activity_user`;
CREATE TABLE `in_activity_user` (
  `act_name` varchar(50) NOT NULL,
  `UserName` varchar(20) default NULL,
  PRIMARY KEY  (`act_name`),
  KEY `FK_Reference_6` (`UserName`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`act_name`) REFERENCES `bbs_activity` (`act_name`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of in_activity_user
-- ----------------------------

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `Rid` bigint(20) NOT NULL auto_increment,
  `UserName` varchar(20) default NULL,
  `ArticleID` bigint(20) default NULL COMMENT '文章ID',
  `ReplyTime` datetime default NULL,
  `ReplyDetail` text,
  PRIMARY KEY  (`Rid`),
  KEY `FK_Reference_8` (`UserName`),
  KEY `FK_Reference_9` (`ArticleID`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`ArticleID`) REFERENCES `bbs_article` (`ArticleID`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`UserName`) REFERENCES `userinfo` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for `softwarebug`
-- ----------------------------
DROP TABLE IF EXISTS `softwarebug`;
CREATE TABLE `softwarebug` (
  `Sid` bigint(20) NOT NULL auto_increment,
  `SoftwareName` text,
  `SoftwareBugNum` bigint(12) NOT NULL default '0',
  `SoftwareDescription` text,
  `SoftwareCompany` text,
  `SoftwarePicPath` varchar(128) default NULL,
  PRIMARY KEY  (`Sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of softwarebug
-- ----------------------------
INSERT INTO `softwarebug` VALUES ('1', '360', '3', null, null, null);
INSERT INTO `softwarebug` VALUES ('2', 'Oracle', '2', null, null, null);
INSERT INTO `softwarebug` VALUES ('3', 'BugProgName', '12', null, null, null);

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
INSERT INTO `userinfo` VALUES ('', '1', '1', '450306159@qq.com', 'question', 'answer', '2012-12-27 00:00:00', null, null, 'a', '1', 'picname', '0');
INSERT INTO `userinfo` VALUES ('1', '1', '1', null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `userinfo` VALUES ('傅相云1号', '1', '1', 'email', 'question', 'answer', '2012-01-01 00:00:00', null, null, 'a', '1', 'picname', '0');
INSERT INTO `userinfo` VALUES ('傅相云2号', '1', '1', 'email', 'question', 'answer', '2012-01-01 00:00:00', null, null, 'a', '1', 'picname', '17');
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Upload_bug`(IN `UserName` varchar(20),IN `BugPicPath` varchar(150),IN `BugOS` varchar(150),IN `BugProgName` varchar(50),IN `BugTag` text,IN `BugDes` text,IN `BugUploadedTime` datetime)
BEGIN
	#Routine body goes here...
	declare t_name text;
	declare t_sid bigint;

	SELECT softwarebug.SoftwareName,softwarebug.Sid into t_name,t_sid from softwarebug where softwarebug.SoftwareName = BugProgName;
	#查询是否已经存在此软件
	if t_name is null THEN
		#softwarebug表中不存在此软件，添加此软件，并+1
		insert into softwarebug (SoftwareName,SoftwareBugNum) VALUES (BugProgName,0);
		#添加软件
		select LAST_INSERT_ID() into t_sid;	
		#update 
	ELSE
	#softwarebug表中已存在此软件，将此软件的Bug数+1
		update softwarebug set softwarebug.SoftwareBugNum = softwarebug.SoftwareBugNum+1 where Sid = t_sid;
	#将软件对应的Bug数+1
	end if;
	INSERT INTO bugdetail (UserName,BugPicPath,BugOS,BugProgName,BugTag,BugDes,Sid,BugUploadedTime)
		values (UserName,BugPicPath,BugOS,BugProgName,BugTag,BugDes,t_sid,BugUploadedTime);
	#将Bug插入BugDetail
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_UserBugNum`;
DELIMITER ;;
CREATE TRIGGER `t_UserBugNum` AFTER INSERT ON `bugdetail` FOR EACH ROW begin 
	set @username_ = NEW.UserName;
	update userinfo set userinfo.BugNum = userinfo.BugNum+1 where UserName = @username_;#用户提交Bug数加1
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_UserBugNum_Minus`;
DELIMITER ;;
CREATE TRIGGER `t_UserBugNum_Minus` AFTER DELETE ON `bugdetail` FOR EACH ROW begin
	set @x = OLD.UserName;
	set @t_sid = OLD.Sid;
	update userinfo set userinfo.BugNum = userinfo.BugNum - 1 where UserName = @x;
	update softwarebug set SoftwareBugNum = SoftwareBugNum - 1 where Sid = @t_sid;
end
;;
DELIMITER ;
