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

 Date: 02/07/2020 17:34:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accessories
-- ----------------------------
DROP TABLE IF EXISTS `accessories`;
CREATE TABLE `accessories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `requestable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for accessories_users
-- ----------------------------
DROP TABLE IF EXISTS `accessories_users`;
CREATE TABLE `accessories_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for action_logs
-- ----------------------------
DROP TABLE IF EXISTS `action_logs`;
CREATE TABLE `action_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `filename` text COLLATE utf8mb4_unicode_ci,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `expected_checkin` date DEFAULT NULL,
  `accepted_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `accept_signature` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_meta` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `action_logs_thread_id_index` (`thread_id`),
  KEY `action_logs_target_id_target_type_index` (`target_id`,`target_type`),
  KEY `action_logs_created_at_index` (`created_at`),
  KEY `action_logs_item_type_item_id_action_type_index` (`item_type`,`item_id`,`action_type`),
  KEY `action_logs_target_type_target_id_action_type_index` (`target_type`,`target_id`,`action_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of action_logs
-- ----------------------------
BEGIN;
INSERT INTO `action_logs` VALUES (1, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2020-07-02 04:55:13', '2020-07-02 04:55:13', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` VALUES (2, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2020-07-02 04:56:38', '2020-07-02 04:56:38', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` VALUES (3, 1, 'checkout', 1, 'App\\Models\\User', NULL, 'Checked out on asset creation', NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2020-07-02 04:56:38', '2020-07-02 04:56:38', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` VALUES (4, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2020-07-02 05:02:30', '2020-07-02 05:02:30', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` VALUES (5, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 3, NULL, NULL, '2020-07-02 06:48:38', '2020-07-02 06:48:38', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` VALUES (6, 1, 'audit', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2020-07-02 10:13:58', '2020-07-02 10:13:58', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` VALUES (7, 1, 'audit', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 3, NULL, NULL, '2020-07-02 10:13:58', '2020-07-02 10:13:58', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` VALUES (8, 1, 'audit', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2020-07-02 10:15:56', '2020-07-02 10:15:56', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` VALUES (9, 1, 'audit', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 3, NULL, NULL, '2020-07-02 10:15:56', '2020-07-02 10:15:56', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for asset_logs
-- ----------------------------
DROP TABLE IF EXISTS `asset_logs`;
CREATE TABLE `asset_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int(11) NOT NULL,
  `checkedout_to` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `filename` text COLLATE utf8mb4_unicode_ci,
  `requested_at` datetime DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `accepted_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `expected_checkin` date DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for asset_maintenances
-- ----------------------------
DROP TABLE IF EXISTS `asset_maintenances`;
CREATE TABLE `asset_maintenances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `asset_maintenance_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_warranty` tinyint(1) NOT NULL,
  `start_date` date NOT NULL,
  `completion_date` date DEFAULT NULL,
  `asset_maintenance_time` int(11) DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `cost` decimal(20,2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for asset_uploads
-- ----------------------------
DROP TABLE IF EXISTS `asset_uploads`;
CREATE TABLE `asset_uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int(11) NOT NULL,
  `filenotes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for assets
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `serial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `physical` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `warranty_months` int(11) DEFAULT NULL,
  `depreciate` tinyint(1) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `requestable` tinyint(4) NOT NULL DEFAULT '0',
  `rtd_location_id` int(11) DEFAULT NULL,
  `_snipeit_mac_address_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_checkout` datetime DEFAULT NULL,
  `expected_checkin` date DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `assigned_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_audit_date` datetime DEFAULT NULL,
  `next_audit_date` date DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `checkin_counter` int(11) NOT NULL DEFAULT '0',
  `checkout_counter` int(11) NOT NULL DEFAULT '0',
  `requests_counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_rtd_location_id_index` (`rtd_location_id`),
  KEY `assets_assigned_type_assigned_to_index` (`assigned_type`,`assigned_to`),
  KEY `assets_created_at_index` (`created_at`),
  KEY `assets_deleted_at_status_id_index` (`deleted_at`,`status_id`),
  KEY `assets_deleted_at_model_id_index` (`deleted_at`,`model_id`),
  KEY `assets_deleted_at_assigned_type_assigned_to_index` (`deleted_at`,`assigned_type`,`assigned_to`),
  KEY `assets_deleted_at_supplier_id_index` (`deleted_at`,`supplier_id`),
  KEY `assets_deleted_at_location_id_index` (`deleted_at`,`location_id`),
  KEY `assets_deleted_at_rtd_location_id_index` (`deleted_at`,`rtd_location_id`),
  KEY `assets_deleted_at_asset_tag_index` (`deleted_at`,`asset_tag`),
  KEY `assets_deleted_at_name_index` (`deleted_at`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of assets
-- ----------------------------
BEGIN;
INSERT INTO `assets` VALUES (1, 'demo 1', 'dvsfbfg', 1, '222', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-07-02 04:55:13', '2020-07-02 10:15:56', 1, NULL, 3, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-02 10:15:56', '2021-07-02', NULL, 0, 0, 0);
INSERT INTO `assets` VALUES (2, 'demo', 'dsff', 2, NULL, '2020-07-21', NULL, NULL, 1, NULL, NULL, 1, '2020-07-02 04:56:38', '2020-07-02 05:02:30', 1, NULL, 4, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, '2020-07-02 04:56:38', NULL, NULL, 'App\\Models\\User', '2020-07-02 05:02:30', '2021-07-02', NULL, 0, 1, 0);
INSERT INTO `assets` VALUES (3, 'demo2', 'demo2', 2, '21432', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-07-02 06:48:38', '2020-07-02 10:15:56', 1, NULL, 3, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-02 10:15:56', '2021-07-02', NULL, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `eula_text` longtext COLLATE utf8mb4_unicode_ci,
  `use_default_eula` tinyint(1) NOT NULL DEFAULT '0',
  `require_acceptance` tinyint(1) NOT NULL DEFAULT '0',
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'asset',
  `checkin_email` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (1, 'Misc Software', '2020-07-01 03:48:09', '2020-07-01 03:48:09', NULL, NULL, NULL, 0, 0, 'license', 0, NULL);
INSERT INTO `categories` VALUES (2, 'category 1', '2020-07-02 04:50:30', '2020-07-02 04:50:30', 1, NULL, NULL, 0, 0, 'asset', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for checkout_requests
-- ----------------------------
DROP TABLE IF EXISTS `checkout_requests`;
CREATE TABLE `checkout_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `requestable_id` int(11) NOT NULL,
  `requestable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_requests_user_id_requestable_id_requestable_type` (`user_id`,`requestable_id`,`requestable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for components
-- ----------------------------
DROP TABLE IF EXISTS `components`;
CREATE TABLE `components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `serial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for components_assets
-- ----------------------------
DROP TABLE IF EXISTS `components_assets`;
CREATE TABLE `components_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `assigned_qty` int(11) DEFAULT '1',
  `component_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for consumables
-- ----------------------------
DROP TABLE IF EXISTS `consumables`;
CREATE TABLE `consumables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `requestable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `item_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for consumables_users
-- ----------------------------
DROP TABLE IF EXISTS `consumables_users`;
CREATE TABLE `consumables_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for custom_field_custom_fieldset
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_custom_fieldset`;
CREATE TABLE `custom_field_custom_fieldset` (
  `custom_field_id` int(11) NOT NULL,
  `custom_fieldset_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of custom_field_custom_fieldset
-- ----------------------------
BEGIN;
INSERT INTO `custom_field_custom_fieldset` VALUES (1, 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for custom_fields
-- ----------------------------
DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `field_values` text COLLATE utf8mb4_unicode_ci,
  `field_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `db_column` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help_text` text COLLATE utf8mb4_unicode_ci,
  `show_in_email` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of custom_fields
-- ----------------------------
BEGIN;
INSERT INTO `custom_fields` VALUES (1, 'MAC Address', 'regex:/^[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}$/', 'text', NULL, '2020-07-01 03:48:06', NULL, NULL, 0, '_snipeit_mac_address_1', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for custom_fieldsets
-- ----------------------------
DROP TABLE IF EXISTS `custom_fieldsets`;
CREATE TABLE `custom_fieldsets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of custom_fieldsets
-- ----------------------------
BEGIN;
INSERT INTO `custom_fieldsets` VALUES (1, 'Asset with MAC Address', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for depreciations
-- ----------------------------
DROP TABLE IF EXISTS `depreciations`;
CREATE TABLE `depreciations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `months` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for imports
-- ----------------------------
DROP TABLE IF EXISTS `imports`;
CREATE TABLE `imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `import_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `header_row` text COLLATE utf8mb4_unicode_ci,
  `first_row` text COLLATE utf8mb4_unicode_ci,
  `field_map` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for license_seats
-- ----------------------------
DROP TABLE IF EXISTS `license_seats`;
CREATE TABLE `license_seats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `license_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for licenses
-- ----------------------------
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seats` int(11) NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `depreciation_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `license_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depreciate` tinyint(1) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `purchase_order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `maintained` tinyint(1) DEFAULT NULL,
  `reassignable` tinyint(1) NOT NULL DEFAULT '1',
  `company_id` int(10) unsigned DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_ou` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of locations
-- ----------------------------
BEGIN;
INSERT INTO `locations` VALUES (1, 'Congty 1', 'Hà nội', NULL, 'VN', '2020-07-02 05:02:28', '2020-07-02 05:02:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `successful` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of login_attempts
-- ----------------------------
BEGIN;
INSERT INTO `login_attempts` VALUES (1, 'admin', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-01 03:53:30', NULL);
COMMIT;

-- ----------------------------
-- Table structure for manufacturers
-- ----------------------------
DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of manufacturers
-- ----------------------------
BEGIN;
INSERT INTO `manufacturers` VALUES (1, 'Manufacturer', '2020-07-02 04:51:04', '2020-07-02 04:51:04', 1, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2012_12_06_225921_migration_cartalyst_sentry_install_users', 1);
INSERT INTO `migrations` VALUES (2, '2012_12_06_225929_migration_cartalyst_sentry_install_groups', 1);
INSERT INTO `migrations` VALUES (3, '2012_12_06_225945_migration_cartalyst_sentry_install_users_groups_pivot', 1);
INSERT INTO `migrations` VALUES (4, '2012_12_06_225988_migration_cartalyst_sentry_install_throttle', 1);
INSERT INTO `migrations` VALUES (5, '2013_03_23_193214_update_users_table', 1);
INSERT INTO `migrations` VALUES (6, '2013_11_13_075318_create_models_table', 1);
INSERT INTO `migrations` VALUES (7, '2013_11_13_075335_create_categories_table', 1);
INSERT INTO `migrations` VALUES (8, '2013_11_13_075347_create_manufacturers_table', 1);
INSERT INTO `migrations` VALUES (9, '2013_11_15_015858_add_user_id_to_categories', 1);
INSERT INTO `migrations` VALUES (10, '2013_11_15_112701_add_user_id_to_manufacturers', 1);
INSERT INTO `migrations` VALUES (11, '2013_11_15_190327_create_assets_table', 1);
INSERT INTO `migrations` VALUES (12, '2013_11_15_190357_create_licenses_table', 1);
INSERT INTO `migrations` VALUES (13, '2013_11_15_201848_add_license_name_to_licenses', 1);
INSERT INTO `migrations` VALUES (14, '2013_11_16_040323_create_depreciations_table', 1);
INSERT INTO `migrations` VALUES (15, '2013_11_16_042851_add_depreciation_id_to_models', 1);
INSERT INTO `migrations` VALUES (16, '2013_11_16_084923_add_user_id_to_models', 1);
INSERT INTO `migrations` VALUES (17, '2013_11_16_103258_create_locations_table', 1);
INSERT INTO `migrations` VALUES (18, '2013_11_16_103336_add_location_id_to_assets', 1);
INSERT INTO `migrations` VALUES (19, '2013_11_16_103407_add_checkedout_to_to_assets', 1);
INSERT INTO `migrations` VALUES (20, '2013_11_16_103425_create_history_table', 1);
INSERT INTO `migrations` VALUES (21, '2013_11_17_054359_drop_licenses_table', 1);
INSERT INTO `migrations` VALUES (22, '2013_11_17_054526_add_physical_to_assets', 1);
INSERT INTO `migrations` VALUES (23, '2013_11_17_055126_create_settings_table', 1);
INSERT INTO `migrations` VALUES (24, '2013_11_17_062634_add_license_to_assets', 1);
INSERT INTO `migrations` VALUES (25, '2013_11_18_134332_add_contacts_to_users', 1);
INSERT INTO `migrations` VALUES (26, '2013_11_18_142847_add_info_to_locations', 1);
INSERT INTO `migrations` VALUES (27, '2013_11_18_152942_remove_location_id_from_asset', 1);
INSERT INTO `migrations` VALUES (28, '2013_11_18_164423_set_nullvalues_for_user', 1);
INSERT INTO `migrations` VALUES (29, '2013_11_19_013337_create_asset_logs_table', 1);
INSERT INTO `migrations` VALUES (30, '2013_11_19_061409_edit_added_on_asset_logs_table', 1);
INSERT INTO `migrations` VALUES (31, '2013_11_19_062250_edit_location_id_asset_logs_table', 1);
INSERT INTO `migrations` VALUES (32, '2013_11_20_055822_add_soft_delete_on_assets', 1);
INSERT INTO `migrations` VALUES (33, '2013_11_20_121404_add_soft_delete_on_locations', 1);
INSERT INTO `migrations` VALUES (34, '2013_11_20_123137_add_soft_delete_on_manufacturers', 1);
INSERT INTO `migrations` VALUES (35, '2013_11_20_123725_add_soft_delete_on_categories', 1);
INSERT INTO `migrations` VALUES (36, '2013_11_20_130248_create_status_labels', 1);
INSERT INTO `migrations` VALUES (37, '2013_11_20_130830_add_status_id_on_assets_table', 1);
INSERT INTO `migrations` VALUES (38, '2013_11_20_131544_add_status_type_on_status_labels', 1);
INSERT INTO `migrations` VALUES (39, '2013_11_20_134103_add_archived_to_assets', 1);
INSERT INTO `migrations` VALUES (40, '2013_11_21_002321_add_uploads_table', 1);
INSERT INTO `migrations` VALUES (41, '2013_11_21_024531_remove_deployable_boolean_from_status_labels', 1);
INSERT INTO `migrations` VALUES (42, '2013_11_22_075308_add_option_label_to_settings_table', 1);
INSERT INTO `migrations` VALUES (43, '2013_11_22_213400_edits_to_settings_table', 1);
INSERT INTO `migrations` VALUES (44, '2013_11_25_013244_create_licenses_table', 1);
INSERT INTO `migrations` VALUES (45, '2013_11_25_031458_create_license_seats_table', 1);
INSERT INTO `migrations` VALUES (46, '2013_11_25_032022_add_type_to_actionlog_table', 1);
INSERT INTO `migrations` VALUES (47, '2013_11_25_033008_delete_bad_licenses_table', 1);
INSERT INTO `migrations` VALUES (48, '2013_11_25_033131_create_new_licenses_table', 1);
INSERT INTO `migrations` VALUES (49, '2013_11_25_033534_add_licensed_to_licenses_table', 1);
INSERT INTO `migrations` VALUES (50, '2013_11_25_101308_add_warrantee_to_assets_table', 1);
INSERT INTO `migrations` VALUES (51, '2013_11_25_104343_alter_warranty_column_on_assets', 1);
INSERT INTO `migrations` VALUES (52, '2013_11_25_150450_drop_parent_from_categories', 1);
INSERT INTO `migrations` VALUES (53, '2013_11_25_151920_add_depreciate_to_assets', 1);
INSERT INTO `migrations` VALUES (54, '2013_11_25_152903_add_depreciate_to_licenses_table', 1);
INSERT INTO `migrations` VALUES (55, '2013_11_26_211820_drop_license_from_assets_table', 1);
INSERT INTO `migrations` VALUES (56, '2013_11_27_062510_add_note_to_asset_logs_table', 1);
INSERT INTO `migrations` VALUES (57, '2013_12_01_113426_add_filename_to_asset_log', 1);
INSERT INTO `migrations` VALUES (58, '2013_12_06_094618_add_nullable_to_licenses_table', 1);
INSERT INTO `migrations` VALUES (59, '2013_12_10_084038_add_eol_on_models_table', 1);
INSERT INTO `migrations` VALUES (60, '2013_12_12_055218_add_manager_to_users_table', 1);
INSERT INTO `migrations` VALUES (61, '2014_01_28_031200_add_qr_code_to_settings_table', 1);
INSERT INTO `migrations` VALUES (62, '2014_02_13_183016_add_qr_text_to_settings_table', 1);
INSERT INTO `migrations` VALUES (63, '2014_05_24_093839_alter_default_license_depreciation_id', 1);
INSERT INTO `migrations` VALUES (64, '2014_05_27_231658_alter_default_values_licenses', 1);
INSERT INTO `migrations` VALUES (65, '2014_06_19_191508_add_asset_name_to_settings', 1);
INSERT INTO `migrations` VALUES (66, '2014_06_20_004847_make_asset_log_checkedout_to_nullable', 1);
INSERT INTO `migrations` VALUES (67, '2014_06_20_005050_make_asset_log_purchasedate_to_nullable', 1);
INSERT INTO `migrations` VALUES (68, '2014_06_24_003011_add_suppliers', 1);
INSERT INTO `migrations` VALUES (69, '2014_06_24_010742_add_supplier_id_to_asset', 1);
INSERT INTO `migrations` VALUES (70, '2014_06_24_012839_add_zip_to_supplier', 1);
INSERT INTO `migrations` VALUES (71, '2014_06_24_033908_add_url_to_supplier', 1);
INSERT INTO `migrations` VALUES (72, '2014_07_08_054116_add_employee_id_to_users', 1);
INSERT INTO `migrations` VALUES (73, '2014_07_09_134316_add_requestable_to_assets', 1);
INSERT INTO `migrations` VALUES (74, '2014_07_17_085822_add_asset_to_software', 1);
INSERT INTO `migrations` VALUES (75, '2014_07_17_161625_make_asset_id_in_logs_nullable', 1);
INSERT INTO `migrations` VALUES (76, '2014_08_12_053504_alpha_0_4_2_release', 1);
INSERT INTO `migrations` VALUES (77, '2014_08_17_083523_make_location_id_nullable', 1);
INSERT INTO `migrations` VALUES (78, '2014_10_16_200626_add_rtd_location_to_assets', 1);
INSERT INTO `migrations` VALUES (79, '2014_10_24_000417_alter_supplier_state_to_32', 1);
INSERT INTO `migrations` VALUES (80, '2014_10_24_015641_add_display_checkout_date', 1);
INSERT INTO `migrations` VALUES (81, '2014_10_28_222654_add_avatar_field_to_users_table', 1);
INSERT INTO `migrations` VALUES (82, '2014_10_29_045924_add_image_field_to_models_table', 1);
INSERT INTO `migrations` VALUES (83, '2014_11_01_214955_add_eol_display_to_settings', 1);
INSERT INTO `migrations` VALUES (84, '2014_11_04_231416_update_group_field_for_reporting', 1);
INSERT INTO `migrations` VALUES (85, '2014_11_05_212408_add_fields_to_licenses', 1);
INSERT INTO `migrations` VALUES (86, '2014_11_07_021042_add_image_to_supplier', 1);
INSERT INTO `migrations` VALUES (87, '2014_11_20_203007_add_username_to_user', 1);
INSERT INTO `migrations` VALUES (88, '2014_11_20_223947_add_auto_to_settings', 1);
INSERT INTO `migrations` VALUES (89, '2014_11_20_224421_add_prefix_to_settings', 1);
INSERT INTO `migrations` VALUES (90, '2014_11_21_104401_change_licence_type', 1);
INSERT INTO `migrations` VALUES (91, '2014_12_09_082500_add_fields_maintained_term_to_licenses', 1);
INSERT INTO `migrations` VALUES (92, '2015_02_04_155757_increase_user_field_lengths', 1);
INSERT INTO `migrations` VALUES (93, '2015_02_07_013537_add_soft_deleted_to_log', 1);
INSERT INTO `migrations` VALUES (94, '2015_02_10_040958_fix_bad_assigned_to_ids', 1);
INSERT INTO `migrations` VALUES (95, '2015_02_10_053310_migrate_data_to_new_statuses', 1);
INSERT INTO `migrations` VALUES (96, '2015_02_11_044104_migrate_make_license_assigned_null', 1);
INSERT INTO `migrations` VALUES (97, '2015_02_11_104406_migrate_create_requests_table', 1);
INSERT INTO `migrations` VALUES (98, '2015_02_12_001312_add_mac_address_to_asset', 1);
INSERT INTO `migrations` VALUES (99, '2015_02_12_024100_change_license_notes_type', 1);
INSERT INTO `migrations` VALUES (100, '2015_02_17_231020_add_localonly_to_settings', 1);
INSERT INTO `migrations` VALUES (101, '2015_02_19_222322_add_logo_and_colors_to_settings', 1);
INSERT INTO `migrations` VALUES (102, '2015_02_24_072043_add_alerts_to_settings', 1);
INSERT INTO `migrations` VALUES (103, '2015_02_25_022931_add_eula_fields', 1);
INSERT INTO `migrations` VALUES (104, '2015_02_25_204513_add_accessories_table', 1);
INSERT INTO `migrations` VALUES (105, '2015_02_26_091228_add_accessories_user_table', 1);
INSERT INTO `migrations` VALUES (106, '2015_02_26_115128_add_deleted_at_models', 1);
INSERT INTO `migrations` VALUES (107, '2015_02_26_233005_add_category_type', 1);
INSERT INTO `migrations` VALUES (108, '2015_03_01_231912_update_accepted_at_to_acceptance_id', 1);
INSERT INTO `migrations` VALUES (109, '2015_03_05_011929_add_qr_type_to_settings', 1);
INSERT INTO `migrations` VALUES (110, '2015_03_18_055327_add_note_to_user', 1);
INSERT INTO `migrations` VALUES (111, '2015_04_29_234704_add_slack_to_settings', 1);
INSERT INTO `migrations` VALUES (112, '2015_05_04_085151_add_parent_id_to_locations_table', 1);
INSERT INTO `migrations` VALUES (113, '2015_05_22_124421_add_reassignable_to_licenses', 1);
INSERT INTO `migrations` VALUES (114, '2015_06_10_003314_fix_default_for_user_notes', 1);
INSERT INTO `migrations` VALUES (115, '2015_06_10_003554_create_consumables', 1);
INSERT INTO `migrations` VALUES (116, '2015_06_15_183253_move_email_to_username', 1);
INSERT INTO `migrations` VALUES (117, '2015_06_23_070346_make_email_nullable', 1);
INSERT INTO `migrations` VALUES (118, '2015_06_26_213716_create_asset_maintenances_table', 1);
INSERT INTO `migrations` VALUES (119, '2015_07_04_212443_create_custom_fields_table', 1);
INSERT INTO `migrations` VALUES (120, '2015_07_09_014359_add_currency_to_settings_and_locations', 1);
INSERT INTO `migrations` VALUES (121, '2015_07_21_122022_add_expected_checkin_date_to_asset_logs', 1);
INSERT INTO `migrations` VALUES (122, '2015_07_24_093845_add_checkin_email_to_category_table', 1);
INSERT INTO `migrations` VALUES (123, '2015_07_25_055415_remove_email_unique_constraint', 1);
INSERT INTO `migrations` VALUES (124, '2015_07_29_230054_add_thread_id_to_asset_logs_table', 1);
INSERT INTO `migrations` VALUES (125, '2015_07_31_015430_add_accepted_to_assets', 1);
INSERT INTO `migrations` VALUES (126, '2015_09_09_195301_add_custom_css_to_settings', 1);
INSERT INTO `migrations` VALUES (127, '2015_09_21_235926_create_custom_field_custom_fieldset', 1);
INSERT INTO `migrations` VALUES (128, '2015_09_22_000104_create_custom_fieldsets', 1);
INSERT INTO `migrations` VALUES (129, '2015_09_22_003321_add_fieldset_id_to_assets', 1);
INSERT INTO `migrations` VALUES (130, '2015_09_22_003413_migrate_mac_address', 1);
INSERT INTO `migrations` VALUES (131, '2015_09_28_003314_fix_default_purchase_order', 1);
INSERT INTO `migrations` VALUES (132, '2015_10_01_024551_add_accessory_consumable_price_info', 1);
INSERT INTO `migrations` VALUES (133, '2015_10_12_192706_add_brand_to_settings', 1);
INSERT INTO `migrations` VALUES (134, '2015_10_22_003314_fix_defaults_accessories', 1);
INSERT INTO `migrations` VALUES (135, '2015_10_23_182625_add_checkout_time_and_expected_checkout_date_to_assets', 1);
INSERT INTO `migrations` VALUES (136, '2015_11_05_061015_create_companies_table', 1);
INSERT INTO `migrations` VALUES (137, '2015_11_05_061115_add_company_id_to_consumables_table', 1);
INSERT INTO `migrations` VALUES (138, '2015_11_05_183749_image', 1);
INSERT INTO `migrations` VALUES (139, '2015_11_06_092038_add_company_id_to_accessories_table', 1);
INSERT INTO `migrations` VALUES (140, '2015_11_06_100045_add_company_id_to_users_table', 1);
INSERT INTO `migrations` VALUES (141, '2015_11_06_134742_add_company_id_to_licenses_table', 1);
INSERT INTO `migrations` VALUES (142, '2015_11_08_035832_add_company_id_to_assets_table', 1);
INSERT INTO `migrations` VALUES (143, '2015_11_08_222305_add_ldap_fields_to_settings', 1);
INSERT INTO `migrations` VALUES (144, '2015_11_15_151803_add_full_multiple_companies_support_to_settings_table', 1);
INSERT INTO `migrations` VALUES (145, '2015_11_26_195528_import_ldap_settings', 1);
INSERT INTO `migrations` VALUES (146, '2015_11_30_191504_remove_fk_company_id', 1);
INSERT INTO `migrations` VALUES (147, '2015_12_21_193006_add_ldap_server_cert_ignore_to_settings_table', 1);
INSERT INTO `migrations` VALUES (148, '2015_12_30_233509_add_timestamp_and_userId_to_custom_fields', 1);
INSERT INTO `migrations` VALUES (149, '2015_12_30_233658_add_timestamp_and_userId_to_custom_fieldsets', 1);
INSERT INTO `migrations` VALUES (150, '2016_01_28_041048_add_notes_to_models', 1);
INSERT INTO `migrations` VALUES (151, '2016_02_19_070119_add_remember_token_to_users_table', 1);
INSERT INTO `migrations` VALUES (152, '2016_02_19_073625_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (153, '2016_03_02_193043_add_ldap_flag_to_users', 1);
INSERT INTO `migrations` VALUES (154, '2016_03_02_220517_update_ldap_filter_to_longer_field', 1);
INSERT INTO `migrations` VALUES (155, '2016_03_08_225351_create_components_table', 1);
INSERT INTO `migrations` VALUES (156, '2016_03_09_024038_add_min_stock_to_tables', 1);
INSERT INTO `migrations` VALUES (157, '2016_03_10_133849_add_locale_to_users', 1);
INSERT INTO `migrations` VALUES (158, '2016_03_10_135519_add_locale_to_settings', 1);
INSERT INTO `migrations` VALUES (159, '2016_03_11_185621_add_label_settings_to_settings', 1);
INSERT INTO `migrations` VALUES (160, '2016_03_22_125911_fix_custom_fields_regexes', 1);
INSERT INTO `migrations` VALUES (161, '2016_04_28_141554_add_show_to_users', 1);
INSERT INTO `migrations` VALUES (162, '2016_05_16_164733_add_model_mfg_to_consumable', 1);
INSERT INTO `migrations` VALUES (163, '2016_05_19_180351_add_alt_barcode_settings', 1);
INSERT INTO `migrations` VALUES (164, '2016_05_19_191146_add_alter_interval', 1);
INSERT INTO `migrations` VALUES (165, '2016_05_19_192226_add_inventory_threshold', 1);
INSERT INTO `migrations` VALUES (166, '2016_05_20_024859_remove_option_keys_from_settings_table', 1);
INSERT INTO `migrations` VALUES (167, '2016_05_20_143758_remove_option_value_from_settings_table', 1);
INSERT INTO `migrations` VALUES (168, '2016_06_01_140218_add_email_domain_and_format_to_settings', 1);
INSERT INTO `migrations` VALUES (169, '2016_06_22_160725_add_user_id_to_maintenances', 1);
INSERT INTO `migrations` VALUES (170, '2016_07_13_150015_add_is_ad_to_settings', 1);
INSERT INTO `migrations` VALUES (171, '2016_07_14_153609_add_ad_domain_to_settings', 1);
INSERT INTO `migrations` VALUES (172, '2016_07_22_003348_fix_custom_fields_regex_stuff', 1);
INSERT INTO `migrations` VALUES (173, '2016_07_22_054850_one_more_mac_addr_fix', 1);
INSERT INTO `migrations` VALUES (174, '2016_07_22_143045_add_port_to_ldap_settings', 1);
INSERT INTO `migrations` VALUES (175, '2016_07_22_153432_add_tls_to_ldap_settings', 1);
INSERT INTO `migrations` VALUES (176, '2016_07_27_211034_add_zerofill_to_settings', 1);
INSERT INTO `migrations` VALUES (177, '2016_08_02_124944_add_color_to_statuslabel', 1);
INSERT INTO `migrations` VALUES (178, '2016_08_04_134500_add_disallow_ldap_pw_sync_to_settings', 1);
INSERT INTO `migrations` VALUES (179, '2016_08_09_002225_add_manufacturer_to_licenses', 1);
INSERT INTO `migrations` VALUES (180, '2016_08_12_121613_add_manufacturer_to_accessories_table', 1);
INSERT INTO `migrations` VALUES (181, '2016_08_23_143353_add_new_fields_to_custom_fields', 1);
INSERT INTO `migrations` VALUES (182, '2016_08_23_145619_add_show_in_nav_to_status_labels', 1);
INSERT INTO `migrations` VALUES (183, '2016_08_30_084634_make_purchase_cost_nullable', 1);
INSERT INTO `migrations` VALUES (184, '2016_09_01_141051_add_requestable_to_asset_model', 1);
INSERT INTO `migrations` VALUES (185, '2016_09_02_001448_create_checkout_requests_table', 1);
INSERT INTO `migrations` VALUES (186, '2016_09_04_180400_create_actionlog_table', 1);
INSERT INTO `migrations` VALUES (187, '2016_09_04_182149_migrate_asset_log_to_action_log', 1);
INSERT INTO `migrations` VALUES (188, '2016_09_19_235935_fix_fieldtype_for_target_type', 1);
INSERT INTO `migrations` VALUES (189, '2016_09_23_140722_fix_modelno_in_consumables_to_string', 1);
INSERT INTO `migrations` VALUES (190, '2016_09_28_231359_add_company_to_logs', 1);
INSERT INTO `migrations` VALUES (191, '2016_10_14_130709_fix_order_number_to_varchar', 1);
INSERT INTO `migrations` VALUES (192, '2016_10_16_015024_rename_modelno_to_model_number', 1);
INSERT INTO `migrations` VALUES (193, '2016_10_16_015211_rename_consumable_modelno_to_model_number', 1);
INSERT INTO `migrations` VALUES (194, '2016_10_16_143235_rename_model_note_to_notes', 1);
INSERT INTO `migrations` VALUES (195, '2016_10_16_165052_rename_component_total_qty_to_qty', 1);
INSERT INTO `migrations` VALUES (196, '2016_10_19_145520_fix_order_number_in_components_to_string', 1);
INSERT INTO `migrations` VALUES (197, '2016_10_27_151715_add_serial_to_components', 1);
INSERT INTO `migrations` VALUES (198, '2016_10_27_213251_increase_serial_field_capacity', 1);
INSERT INTO `migrations` VALUES (199, '2016_10_29_002724_enable_2fa_fields', 1);
INSERT INTO `migrations` VALUES (200, '2016_10_29_082408_add_signature_to_acceptance', 1);
INSERT INTO `migrations` VALUES (201, '2016_11_01_030818_fix_forgotten_filename_in_action_logs', 1);
INSERT INTO `migrations` VALUES (202, '2016_11_13_020954_rename_component_serial_number_to_serial', 1);
INSERT INTO `migrations` VALUES (203, '2016_11_16_172119_increase_purchase_cost_size', 1);
INSERT INTO `migrations` VALUES (204, '2016_11_17_161317_longer_state_field_in_location', 1);
INSERT INTO `migrations` VALUES (205, '2016_11_17_193706_add_model_number_to_accessories', 1);
INSERT INTO `migrations` VALUES (206, '2016_11_24_160405_add_missing_target_type_to_logs_table', 1);
INSERT INTO `migrations` VALUES (207, '2016_12_07_173720_increase_size_of_state_in_suppliers', 1);
INSERT INTO `migrations` VALUES (208, '2016_12_19_004212_adjust_locale_length_to_10', 1);
INSERT INTO `migrations` VALUES (209, '2016_12_19_133936_extend_phone_lengths_in_supplier_and_elsewhere', 1);
INSERT INTO `migrations` VALUES (210, '2016_12_27_212631_make_asset_assigned_to_polymorphic', 1);
INSERT INTO `migrations` VALUES (211, '2017_01_09_040429_create_locations_ldap_query_field', 1);
INSERT INTO `migrations` VALUES (212, '2017_01_14_002418_create_imports_table', 1);
INSERT INTO `migrations` VALUES (213, '2017_01_25_063357_fix_utf8_custom_field_column_names', 1);
INSERT INTO `migrations` VALUES (214, '2017_03_03_154632_add_time_date_display_to_settings', 1);
INSERT INTO `migrations` VALUES (215, '2017_03_10_210807_add_fields_to_manufacturer', 1);
INSERT INTO `migrations` VALUES (216, '2017_05_08_195520_increase_size_of_field_values_in_custom_fields', 1);
INSERT INTO `migrations` VALUES (217, '2017_05_22_204422_create_departments', 1);
INSERT INTO `migrations` VALUES (218, '2017_05_22_233509_add_manager_to_locations_table', 1);
INSERT INTO `migrations` VALUES (219, '2017_06_14_122059_add_next_autoincrement_to_settings', 1);
INSERT INTO `migrations` VALUES (220, '2017_06_18_151753_add_header_and_first_row_to_importer_table', 1);
INSERT INTO `migrations` VALUES (221, '2017_07_07_191533_add_login_text', 1);
INSERT INTO `migrations` VALUES (222, '2017_07_25_130710_add_thumbsize_to_settings', 1);
INSERT INTO `migrations` VALUES (223, '2017_08_03_160105_set_asset_archived_to_zero_default', 1);
INSERT INTO `migrations` VALUES (224, '2017_08_22_180636_add_secure_password_options', 1);
INSERT INTO `migrations` VALUES (225, '2017_08_25_074822_add_auditing_tables', 1);
INSERT INTO `migrations` VALUES (226, '2017_08_25_101435_add_auditing_to_settings', 1);
INSERT INTO `migrations` VALUES (227, '2017_09_18_225619_fix_assigned_type_not_being_nulled', 1);
INSERT INTO `migrations` VALUES (228, '2017_10_03_015503_drop_foreign_keys', 1);
INSERT INTO `migrations` VALUES (229, '2017_10_10_123504_allow_nullable_depreciation_id_in_models', 1);
INSERT INTO `migrations` VALUES (230, '2017_10_17_133709_add_display_url_to_settings', 1);
INSERT INTO `migrations` VALUES (231, '2017_10_19_120002_add_custom_forgot_password_url', 1);
INSERT INTO `migrations` VALUES (232, '2017_10_19_130406_add_image_and_supplier_to_accessories', 1);
INSERT INTO `migrations` VALUES (233, '2017_10_20_234129_add_location_indices_to_assets', 1);
INSERT INTO `migrations` VALUES (234, '2017_10_25_202930_add_images_uploads_to_locations_manufacturers_etc', 1);
INSERT INTO `migrations` VALUES (235, '2017_10_27_180947_denorm_asset_locations', 1);
INSERT INTO `migrations` VALUES (236, '2017_10_27_192423_migrate_denormed_asset_locations', 1);
INSERT INTO `migrations` VALUES (237, '2017_10_30_182938_add_address_to_user', 1);
INSERT INTO `migrations` VALUES (238, '2017_11_08_025918_add_alert_menu_setting', 1);
INSERT INTO `migrations` VALUES (239, '2017_11_08_123942_labels_display_company_name', 1);
INSERT INTO `migrations` VALUES (240, '2017_12_12_010457_normalize_asset_last_audit_date', 1);
INSERT INTO `migrations` VALUES (241, '2017_12_12_033618_add_actionlog_meta', 1);
INSERT INTO `migrations` VALUES (242, '2017_12_26_170856_re_normalize_last_audit', 1);
INSERT INTO `migrations` VALUES (243, '2018_01_17_184354_add_archived_in_list_setting', 1);
INSERT INTO `migrations` VALUES (244, '2018_01_19_203121_add_dashboard_message_to_settings', 1);
INSERT INTO `migrations` VALUES (245, '2018_01_24_062633_add_footer_settings_to_settings', 1);
INSERT INTO `migrations` VALUES (246, '2018_01_24_093426_add_modellist_preferenc', 1);
INSERT INTO `migrations` VALUES (247, '2018_02_22_160436_add_remote_user_settings', 1);
INSERT INTO `migrations` VALUES (248, '2018_03_03_011032_add_theme_to_settings', 1);
INSERT INTO `migrations` VALUES (249, '2018_03_06_054937_add_default_flag_on_statuslabels', 1);
INSERT INTO `migrations` VALUES (250, '2018_03_23_212048_add_display_in_email_to_custom_fields', 1);
INSERT INTO `migrations` VALUES (251, '2018_03_24_030738_add_show_images_in_email_setting', 1);
INSERT INTO `migrations` VALUES (252, '2018_03_24_050108_add_cc_alerts', 1);
INSERT INTO `migrations` VALUES (253, '2018_03_29_053618_add_canceled_at_and_fulfilled_at_in_requests', 1);
INSERT INTO `migrations` VALUES (254, '2018_03_29_070121_add_drop_unique_requests', 1);
INSERT INTO `migrations` VALUES (255, '2018_03_29_070511_add_new_index_requestable', 1);
INSERT INTO `migrations` VALUES (256, '2018_04_02_150700_labels_display_model_name', 1);
INSERT INTO `migrations` VALUES (257, '2018_04_16_133902_create_custom_field_default_values_table', 1);
INSERT INTO `migrations` VALUES (258, '2018_05_04_073223_add_category_to_licenses', 1);
INSERT INTO `migrations` VALUES (259, '2018_05_04_075235_add_update_license_category', 1);
INSERT INTO `migrations` VALUES (260, '2018_05_08_031515_add_gdpr_privacy_footer', 1);
INSERT INTO `migrations` VALUES (261, '2018_05_14_215229_add_indexes', 1);
INSERT INTO `migrations` VALUES (262, '2018_05_14_223646_add_indexes_to_assets', 1);
INSERT INTO `migrations` VALUES (263, '2018_05_14_233638_denorm_counters_on_assets', 1);
INSERT INTO `migrations` VALUES (264, '2018_05_16_153409_add_first_counter_totals_to_assets', 1);
INSERT INTO `migrations` VALUES (265, '2018_06_21_134622_add_version_footer', 1);
INSERT INTO `migrations` VALUES (266, '2018_07_05_215440_add_unique_serial_option_to_settings', 1);
INSERT INTO `migrations` VALUES (267, '2018_07_17_005911_create_login_attempts_table', 1);
INSERT INTO `migrations` VALUES (268, '2018_07_24_154348_add_logo_to_print_assets', 1);
INSERT INTO `migrations` VALUES (269, '2019_02_14_154310_change_auto_increment_prefix_to_nullable', 1);
INSERT INTO `migrations` VALUES (270, '2019_02_16_143518_auto_increment_back_to_string', 1);
INSERT INTO `migrations` VALUES (271, '2019_02_20_234421_make_serial_nullable', 1);
INSERT INTO `migrations` VALUES (272, '2019_02_21_224703_make_fields_nullable_for_integrity', 1);
INSERT INTO `migrations` VALUES (273, '2019_06_12_184327_rename_groups_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for models
-- ----------------------------
DROP TABLE IF EXISTS `models`;
CREATE TABLE `models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `depreciation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `eol` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_mac_address` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fieldset_id` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `requestable` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of models
-- ----------------------------
BEGIN;
INSERT INTO `models` VALUES (1, 'Thanhcong', 'sfbf', 1, 2, '2020-07-02 04:55:08', '2020-07-02 04:55:08', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0);
INSERT INTO `models` VALUES (2, 'Bản tin pháp luật', 'sfbf', 1, 2, '2020-07-02 04:56:09', '2020-07-02 04:56:09', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for models_custom_fields
-- ----------------------------
DROP TABLE IF EXISTS `models_custom_fields`;
CREATE TABLE `models_custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_model_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `default_value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for permission_groups
-- ----------------------------
DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for requested_assets
-- ----------------------------
DROP TABLE IF EXISTS `requested_assets`;
CREATE TABLE `requested_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `denied_at` datetime DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for requests
-- ----------------------------
DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `request_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `per_page` int(11) NOT NULL DEFAULT '20',
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Snipe IT Asset Management',
  `qr_code` int(11) DEFAULT NULL,
  `qr_text` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_asset_name` int(11) DEFAULT NULL,
  `display_checkout_date` int(11) DEFAULT NULL,
  `display_eol` int(11) DEFAULT NULL,
  `auto_increment_assets` int(11) NOT NULL DEFAULT '0',
  `auto_increment_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `load_remote` tinyint(1) NOT NULL DEFAULT '1',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alerts_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `default_eula_text` longtext COLLATE utf8mb4_unicode_ci,
  `barcode_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'QRCODE',
  `slack_endpoint` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_botname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_css` text COLLATE utf8mb4_unicode_ci,
  `brand` tinyint(4) NOT NULL DEFAULT '1',
  `ldap_enabled` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_server` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_uname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_pword` longtext COLLATE utf8mb4_unicode_ci,
  `ldap_basedn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_filter` text COLLATE utf8mb4_unicode_ci,
  `ldap_username_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'samaccountname',
  `ldap_lname_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'sn',
  `ldap_fname_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'givenname',
  `ldap_auth_filter_query` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'uid=samaccountname',
  `ldap_version` int(11) DEFAULT '3',
  `ldap_active_flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_emp_num` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_multiple_companies_support` tinyint(1) NOT NULL DEFAULT '0',
  `ldap_server_cert_ignore` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `labels_per_page` tinyint(4) NOT NULL DEFAULT '30',
  `labels_width` decimal(6,5) NOT NULL DEFAULT '2.62500',
  `labels_height` decimal(6,5) NOT NULL DEFAULT '1.00000',
  `labels_pmargin_left` decimal(6,5) NOT NULL DEFAULT '0.21975',
  `labels_pmargin_right` decimal(6,5) NOT NULL DEFAULT '0.21975',
  `labels_pmargin_top` decimal(6,5) NOT NULL DEFAULT '0.50000',
  `labels_pmargin_bottom` decimal(6,5) NOT NULL DEFAULT '0.50000',
  `labels_display_bgutter` decimal(6,5) NOT NULL DEFAULT '0.07000',
  `labels_display_sgutter` decimal(6,5) NOT NULL DEFAULT '0.05000',
  `labels_fontsize` tinyint(4) NOT NULL DEFAULT '9',
  `labels_pagewidth` decimal(7,5) NOT NULL DEFAULT '8.50000',
  `labels_pageheight` decimal(7,5) NOT NULL DEFAULT '11.00000',
  `labels_display_name` tinyint(4) NOT NULL DEFAULT '0',
  `labels_display_serial` tinyint(4) NOT NULL DEFAULT '1',
  `labels_display_tag` tinyint(4) NOT NULL DEFAULT '1',
  `alt_barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `alt_barcode_enabled` tinyint(1) DEFAULT '1',
  `alert_interval` int(11) DEFAULT '30',
  `alert_threshold` int(11) DEFAULT '5',
  `email_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'filastname',
  `username_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'filastname',
  `is_ad` tinyint(1) NOT NULL DEFAULT '0',
  `ad_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_port` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '389',
  `ldap_tls` tinyint(1) NOT NULL DEFAULT '0',
  `zerofill_count` int(11) NOT NULL DEFAULT '5',
  `ldap_pw_sync` tinyint(1) NOT NULL DEFAULT '1',
  `two_factor_enabled` tinyint(4) DEFAULT NULL,
  `require_accept_signature` tinyint(1) NOT NULL DEFAULT '0',
  `date_display_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y-m-d',
  `time_display_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'h:i A',
  `next_auto_tag_base` bigint(20) NOT NULL DEFAULT '1',
  `login_note` text COLLATE utf8mb4_unicode_ci,
  `thumbnail_max_h` int(11) DEFAULT '50',
  `pwd_secure_uncommon` tinyint(1) NOT NULL DEFAULT '0',
  `pwd_secure_complexity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwd_secure_min` int(11) NOT NULL DEFAULT '8',
  `audit_interval` int(11) DEFAULT NULL,
  `audit_warning_days` int(11) DEFAULT NULL,
  `show_url_in_emails` tinyint(1) NOT NULL DEFAULT '0',
  `custom_forgot_pass_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_alerts_in_menu` tinyint(1) NOT NULL DEFAULT '1',
  `labels_display_company_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_archived_in_list` tinyint(1) NOT NULL DEFAULT '0',
  `dashboard_message` text COLLATE utf8mb4_unicode_ci,
  `support_footer` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `modellist_displays` char(191) COLLATE utf8mb4_unicode_ci DEFAULT 'image,category,manufacturer,model_number',
  `login_remote_user_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `login_common_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `login_remote_user_custom_logout_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `skin` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_images_in_email` tinyint(1) NOT NULL DEFAULT '1',
  `admin_cc_email` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labels_display_model` tinyint(1) NOT NULL DEFAULT '0',
  `privacy_policy_link` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_footer` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `unique_serial` tinyint(1) NOT NULL DEFAULT '0',
  `logo_print_assets` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
BEGIN;
INSERT INTO `settings` VALUES (1, '2020-07-01 03:53:30', '2020-07-02 06:48:38', 1, 20, 'ERP', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 'thanhcong1710@gmail.com', 1, NULL, 'QRCODE', NULL, NULL, NULL, 'VND', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'samaccountname', 'sn', 'givenname', 'uid=samaccountname', 3, NULL, NULL, NULL, 0, 0, 'vi', 30, 2.62500, 1.00000, 0.21975, 0.21975, 0.50000, 0.50000, 0.07000, 0.05000, 9, 8.50000, 11.00000, 0, 1, 1, 'C128', 1, 30, 5, 'h4r.vn', 'filastname', 'filastname', 0, NULL, '389', 0, 5, 1, NULL, 0, 'Y-m-d', 'h:i A', 4, NULL, 50, 0, NULL, 10, NULL, NULL, 0, NULL, 1, 0, 0, NULL, 'on', NULL, 'image,category,manufacturer,model_number', 0, 0, '', NULL, 1, NULL, 0, NULL, 'on', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for status_labels
-- ----------------------------
DROP TABLE IF EXISTS `status_labels`;
CREATE TABLE `status_labels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deployable` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `default_label` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of status_labels
-- ----------------------------
BEGIN;
INSERT INTO `status_labels` VALUES (1, 'Pending', 1, NULL, NULL, NULL, 0, 1, 0, 'These assets are not yet ready to be deployed, usually because of configuration or waiting on parts.', NULL, 0, 0);
INSERT INTO `status_labels` VALUES (2, 'Ready to Deploy', 1, NULL, NULL, NULL, 1, 0, 0, 'These assets are ready to deploy.', NULL, 0, 0);
INSERT INTO `status_labels` VALUES (3, 'Archived', 1, NULL, NULL, NULL, 0, 0, 1, 'These assets are no longer in circulation or viable.', NULL, 0, 0);
INSERT INTO `status_labels` VALUES (4, 'Sản phẩm khác', NULL, '2020-07-02 04:49:36', '2020-07-02 04:49:36', NULL, 1, 0, 0, NULL, NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for throttle
-- ----------------------------
DROP TABLE IF EXISTS `throttle`;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gravatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `employee_num` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `company_id` int(10) unsigned DEFAULT NULL,
  `remember_token` text COLLATE utf8mb4_unicode_ci,
  `ldap_import` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `show_in_list` tinyint(1) NOT NULL DEFAULT '1',
  `two_factor_secret` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_enrolled` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_optin` tinyint(1) NOT NULL DEFAULT '0',
  `department_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'thanhcong1710@gmail.com', '$2y$10$ZVchaXwEsV3iJSyeNALiGO1RaFMYtIuHxyl47PSAxBgClINjvSLay', '{\"superuser\":1}', 1, NULL, NULL, NULL, NULL, NULL, 'Cong', 'LT', '2020-07-01 03:53:30', '2020-07-01 03:53:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, 'viJoGbOGYWGFgKawWqJJMsZo5TeIKlvTkEIMzOrBTnoYsKWB1H9inXifyKpC', 0, 'en', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
