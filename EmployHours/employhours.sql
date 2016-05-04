/*
Navicat MySQL Data Transfer

Source Server         : my
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : employhours

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2016-05-05 02:11:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_config`;
CREATE TABLE `tb_config` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `delflag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `key` varchar(20) DEFAULT NULL COMMENT '配置索引',
  `value` varchar(1000) DEFAULT NULL COMMENT '配置值',
  `remarks` varchar(100) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_config
-- ----------------------------
INSERT INTO `tb_config` VALUES ('1', '0', 'IMG_SAVEPATH', 'F:/img', '上传图片保存根路径');
INSERT INTO `tb_config` VALUES ('4', '0', 'PAGESIZE', '5', '页面容量');
INSERT INTO `tb_config` VALUES ('5', '0', 'AUTH_CONF', '0:sys;1:admin;2:front;', '权限配置');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `delflag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `name` varchar(100) DEFAULT NULL,
  `empno` varchar(50) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `idno` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `birth` varchar(40) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `dep` varchar(50) DEFAULT NULL,
  `roles` varchar(5) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('13', '0', 'CDAISY', '090888', '男', '13987654321', 'sadasd', '2016-05-05', '13987654321', 'xs', '3', '090888', '123');
