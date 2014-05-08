/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : bbudb

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-05-08 20:11:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(30) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'add user', '1');
INSERT INTO `permission` VALUES ('2', 'delete user', '1');
INSERT INTO `permission` VALUES ('3', 'reset password', '1');
INSERT INTO `permission` VALUES ('4', 'add post', '2');
INSERT INTO `permission` VALUES ('5', 'delete post', '2');
INSERT INTO `permission` VALUES ('6', 'edit post', '2');
INSERT INTO `permission` VALUES ('7', 'enable post', '2');
INSERT INTO `permission` VALUES ('8', 'disable post', '2');
INSERT INTO `permission` VALUES ('9', 'enable user', '1');
INSERT INTO `permission` VALUES ('10', 'disable user', '1');
INSERT INTO `permission` VALUES ('11', 'upload ebook', '3');
INSERT INTO `permission` VALUES ('12', 'delete ebook', '3');
INSERT INTO `permission` VALUES ('13', 'enable ebook', '3');
INSERT INTO `permission` VALUES ('14', 'disable ebook', '3');
INSERT INTO `permission` VALUES ('15', 'view info', '4');

-- ----------------------------
-- Table structure for priviledge
-- ----------------------------
DROP TABLE IF EXISTS `priviledge`;
CREATE TABLE `priviledge` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `priviledge_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`),
  CONSTRAINT `priviledge_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of priviledge
-- ----------------------------
INSERT INTO `priviledge` VALUES ('1', '1', '1');
INSERT INTO `priviledge` VALUES ('2', '1', '2');
INSERT INTO `priviledge` VALUES ('3', '1', '3');
INSERT INTO `priviledge` VALUES ('4', '1', '9');
INSERT INTO `priviledge` VALUES ('5', '1', '10');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', null, '2014-05-08 19:04:34');

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(30) NOT NULL,
  PRIMARY KEY (`group_id`),
  CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `permission` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', 'admin');
INSERT INTO `user_group` VALUES ('2', 'staff');
INSERT INTO `user_group` VALUES ('3', 'teacher');
INSERT INTO `user_group` VALUES ('4', 'student');
