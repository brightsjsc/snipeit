/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : snipeit

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 25/08/2020 09:35:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for log_send_mail
-- ----------------------------
DROP TABLE IF EXISTS `log_send_mail`;
CREATE TABLE `log_send_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `data_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_id` (`data_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE users ADD audit_warning_days_1_notification tinyint(2) DEFAULT 0;
ALTER TABLE users ADD audit_warning_days_1_email tinyint(2) DEFAULT 0;
ALTER TABLE users ADD audit_warning_days_1 int(11);
ALTER TABLE users ADD audit_warning_days_2_notification tinyint(2) DEFAULT 0;
ALTER TABLE users ADD audit_warning_days_2_email tinyint(2) DEFAULT 0;
ALTER TABLE users ADD audit_warning_days_2 int(11);
ALTER TABLE users ADD audit_warning_days_3_notification tinyint(2) DEFAULT 0;
ALTER TABLE users ADD audit_warning_days_3_email tinyint(2) DEFAULT 0;
ALTER TABLE users ADD audit_warning_days_3 int(11);
