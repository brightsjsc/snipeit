-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 20, 2020 at 04:40 PM
-- Server version: 10.1.45-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_demoqlts_qrcode`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessories`
--

CREATE TABLE `accessories` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accessories`
--

INSERT INTO `accessories` (`id`, `name`, `category_id`, `user_id`, `qty`, `requestable`, `created_at`, `updated_at`, `deleted_at`, `location_id`, `purchase_date`, `purchase_cost`, `order_number`, `company_id`, `min_amt`, `manufacturer_id`, `model_number`, `image`, `supplier_id`) VALUES
(1, 'Chuột máy tính', 10, 1, 10, 0, '2020-07-13 20:48:00', '2020-08-20 00:28:13', NULL, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, 'accessory-PpRYqCmcZHXKDO96jl.jpg', NULL),
(2, 'Bàn phím máy tính', 10, 1, 3, 0, '2020-07-13 20:49:30', '2020-08-20 00:27:10', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'accessory-qFh41ihb3Uh0d16wG6.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accessories_users`
--

CREATE TABLE `accessories_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accessories_users`
--

INSERT INTO `accessories_users` (`id`, `user_id`, `accessory_id`, `assigned_to`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2020-07-13 20:49:56', NULL),
(2, 1, 2, 1, '2020-07-13 20:50:04', NULL),
(3, 1, 1, 3, '2020-07-15 09:37:09', NULL),
(4, 1, 1, 2, '2020-07-15 09:37:15', NULL),
(5, 1, 2, 3, '2020-07-15 09:37:20', NULL),
(6, 1, 2, 2, '2020-07-15 09:37:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `action_logs`
--

CREATE TABLE `action_logs` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `log_meta` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `action_logs`
--

INSERT INTO `action_logs` (`id`, `user_id`, `action_type`, `target_id`, `target_type`, `location_id`, `note`, `filename`, `item_type`, `item_id`, `expected_checkin`, `accepted_id`, `created_at`, `updated_at`, `deleted_at`, `thread_id`, `company_id`, `accept_signature`, `log_meta`) VALUES
(1, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2020-07-01 21:55:13', '2020-07-01 21:55:13', NULL, NULL, NULL, NULL, NULL),
(2, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2020-07-01 21:56:38', '2020-07-01 21:56:38', NULL, NULL, NULL, NULL, NULL),
(3, 1, 'checkout', 1, 'App\\Models\\User', NULL, 'Checked out on asset creation', NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2020-07-01 21:56:38', '2020-07-01 21:56:38', NULL, NULL, NULL, NULL, NULL),
(4, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2020-07-01 22:02:30', '2020-07-01 22:02:30', NULL, NULL, NULL, NULL, NULL),
(5, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 3, NULL, NULL, '2020-07-01 23:48:38', '2020-07-01 23:48:38', NULL, NULL, NULL, NULL, NULL),
(6, 1, 'audit', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2020-07-02 03:13:58', '2020-07-02 03:13:58', NULL, NULL, NULL, NULL, NULL),
(7, 1, 'audit', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 3, NULL, NULL, '2020-07-02 03:13:58', '2020-07-02 03:13:58', NULL, NULL, NULL, NULL, NULL),
(8, 1, 'audit', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2020-07-02 03:15:56', '2020-07-02 03:15:56', NULL, NULL, NULL, NULL, NULL),
(9, 1, 'audit', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 3, NULL, NULL, '2020-07-02 03:15:56', '2020-07-02 03:15:56', NULL, NULL, NULL, NULL, NULL),
(10, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2020-07-06 03:57:53', '2020-07-06 03:57:53', NULL, NULL, NULL, NULL, '{\"purchase_cost\":{\"old\":null,\"new\":500000}}'),
(11, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(12, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(13, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 5, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(14, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 5, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(15, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 6, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(16, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 6, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(17, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 7, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(18, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 7, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(19, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 8, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(20, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 8, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(21, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 9, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(22, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 9, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(23, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 10, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(24, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 10, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(25, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 11, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(26, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 11, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(27, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 12, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(28, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 12, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(29, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(30, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(31, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(32, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(33, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 15, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(34, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 15, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(35, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 16, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(36, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 16, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(37, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 17, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(38, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 17, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(39, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 18, NULL, NULL, '2020-07-06 03:59:00', '2020-07-06 03:59:00', NULL, NULL, 1, NULL, NULL),
(40, 1, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 18, NULL, NULL, '2020-07-06 03:59:01', '2020-07-06 03:59:01', NULL, NULL, 1, NULL, NULL),
(41, 1, 'audit', NULL, NULL, NULL, 'kiểm toán vào ngày mai', NULL, 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-06 04:02:34', '2020-07-06 04:02:34', NULL, NULL, NULL, NULL, NULL),
(42, 1, 'audit', NULL, NULL, NULL, 'kiểm toán vào ngày mai', NULL, 'App\\Models\\Asset', 17, NULL, NULL, '2020-07-06 04:02:34', '2020-07-06 04:02:34', NULL, NULL, NULL, NULL, NULL),
(43, 1, 'audit', NULL, NULL, NULL, 'kiểm toán vào ngày mai', NULL, 'App\\Models\\Asset', 18, NULL, NULL, '2020-07-06 04:02:34', '2020-07-06 04:02:34', NULL, NULL, NULL, NULL, NULL),
(44, 1, 'audit', NULL, NULL, NULL, 'kiểm toán vào ngày mai', NULL, 'App\\Models\\Asset', 5, NULL, NULL, '2020-07-06 04:02:34', '2020-07-06 04:02:34', NULL, NULL, NULL, NULL, NULL),
(45, 1, 'audit', NULL, NULL, NULL, 'kiểm toán vào ngày mai', NULL, 'App\\Models\\Asset', 9, NULL, NULL, '2020-07-06 04:02:34', '2020-07-06 04:02:34', NULL, NULL, NULL, NULL, NULL),
(46, 1, 'audit', NULL, NULL, NULL, 'kiểm toán vào ngày mai', NULL, 'App\\Models\\Asset', 10, NULL, NULL, '2020-07-06 04:02:34', '2020-07-06 04:02:34', NULL, NULL, NULL, NULL, NULL),
(47, 1, 'audit', NULL, NULL, NULL, 'kiểm toán vào ngày mai', NULL, 'App\\Models\\Asset', 11, NULL, NULL, '2020-07-06 04:02:34', '2020-07-06 04:02:34', NULL, NULL, NULL, NULL, NULL),
(48, 1, 'audit', NULL, NULL, NULL, 'kiểm toán vào ngày mai', NULL, 'App\\Models\\Asset', 12, NULL, NULL, '2020-07-06 04:02:34', '2020-07-06 04:02:34', NULL, NULL, NULL, NULL, NULL),
(49, 1, 'audit', NULL, NULL, NULL, 'đã kiểm tra trước', '', 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-06 04:04:03', '2020-07-06 04:04:03', NULL, NULL, NULL, NULL, NULL),
(50, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-06 04:05:32', '2020-07-06 04:05:32', NULL, NULL, NULL, NULL, NULL),
(51, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-06 04:05:32', '2020-07-06 04:05:32', NULL, NULL, NULL, NULL, NULL),
(52, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 15, NULL, NULL, '2020-07-06 04:05:32', '2020-07-06 04:05:32', NULL, NULL, NULL, NULL, NULL),
(53, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 16, NULL, NULL, '2020-07-06 04:05:32', '2020-07-06 04:05:32', NULL, NULL, NULL, NULL, NULL),
(54, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 17, NULL, NULL, '2020-07-06 04:05:32', '2020-07-06 04:05:32', NULL, NULL, NULL, NULL, NULL),
(55, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 18, NULL, NULL, '2020-07-06 04:05:32', '2020-07-06 04:05:32', NULL, NULL, NULL, NULL, NULL),
(56, 1, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2020-07-07 00:50:47', '2020-07-07 00:50:47', NULL, NULL, NULL, NULL, NULL),
(57, 1, 'checkout', 1, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-07 02:56:31', '2020-07-07 02:56:31', NULL, NULL, NULL, NULL, NULL),
(58, 1, 'checkout', 1, 'App\\Models\\User', NULL, 'Dùng trong vòng 1 năm', NULL, 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-08 01:19:09', '2020-07-08 01:19:09', NULL, NULL, NULL, NULL, NULL),
(59, 1, 'checkout', 1, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 5, NULL, NULL, '2020-07-08 03:39:07', '2020-07-08 03:39:07', NULL, NULL, NULL, NULL, NULL),
(60, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-08 03:56:12', '2020-07-08 03:56:12', NULL, NULL, NULL, NULL, NULL),
(61, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-08 03:56:12', '2020-07-08 03:56:12', NULL, NULL, NULL, NULL, NULL),
(62, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 15, NULL, NULL, '2020-07-08 03:56:12', '2020-07-08 03:56:12', NULL, NULL, NULL, NULL, NULL),
(63, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 16, NULL, NULL, '2020-07-08 03:56:12', '2020-07-08 03:56:12', NULL, NULL, NULL, NULL, NULL),
(64, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 17, NULL, NULL, '2020-07-08 03:56:12', '2020-07-08 03:56:12', NULL, NULL, NULL, NULL, NULL),
(65, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 18, NULL, NULL, '2020-07-08 03:56:12', '2020-07-08 03:56:12', NULL, NULL, NULL, NULL, NULL),
(66, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2020-07-08 03:56:12', '2020-07-08 03:56:12', NULL, NULL, NULL, NULL, NULL),
(67, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 5, NULL, NULL, '2020-07-08 03:56:12', '2020-07-08 03:56:12', NULL, NULL, NULL, NULL, NULL),
(68, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 6, NULL, NULL, '2020-07-08 03:56:12', '2020-07-08 03:56:12', NULL, NULL, NULL, NULL, NULL),
(69, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 7, NULL, NULL, '2020-07-08 03:56:13', '2020-07-08 03:56:13', NULL, NULL, NULL, NULL, NULL),
(70, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 8, NULL, NULL, '2020-07-08 03:56:13', '2020-07-08 03:56:13', NULL, NULL, NULL, NULL, NULL),
(71, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 9, NULL, NULL, '2020-07-08 03:56:13', '2020-07-08 03:56:13', NULL, NULL, NULL, NULL, NULL),
(72, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 10, NULL, NULL, '2020-07-08 03:56:13', '2020-07-08 03:56:13', NULL, NULL, NULL, NULL, NULL),
(73, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 11, NULL, NULL, '2020-07-08 03:56:13', '2020-07-08 03:56:13', NULL, NULL, NULL, NULL, NULL),
(74, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 12, NULL, NULL, '2020-07-08 03:56:13', '2020-07-08 03:56:13', NULL, NULL, NULL, NULL, NULL),
(75, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-08 03:57:27', '2020-07-08 03:57:27', NULL, NULL, NULL, NULL, NULL),
(76, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-08 03:57:27', '2020-07-08 03:57:27', NULL, NULL, NULL, NULL, NULL),
(77, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 15, NULL, NULL, '2020-07-08 03:57:27', '2020-07-08 03:57:27', NULL, NULL, NULL, NULL, NULL),
(78, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 16, NULL, NULL, '2020-07-08 03:57:27', '2020-07-08 03:57:27', NULL, NULL, NULL, NULL, NULL),
(79, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 17, NULL, NULL, '2020-07-08 03:57:27', '2020-07-08 03:57:27', NULL, NULL, NULL, NULL, NULL),
(80, 1, 'audit', NULL, NULL, NULL, NULL, '', 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-08 03:57:38', '2020-07-08 03:57:38', NULL, NULL, NULL, NULL, NULL),
(81, 1, 'audit', NULL, NULL, NULL, NULL, '', 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-08 03:57:54', '2020-07-08 03:57:54', NULL, NULL, NULL, NULL, NULL),
(82, 1, 'audit', NULL, NULL, NULL, NULL, '', 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-08 03:58:22', '2020-07-08 03:58:22', NULL, NULL, NULL, NULL, NULL),
(83, 1, 'audit', NULL, NULL, NULL, NULL, '', 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-08 04:00:15', '2020-07-08 04:00:15', NULL, NULL, NULL, NULL, NULL),
(84, 1, 'audit', NULL, NULL, NULL, 'Cực kì ổn!!!', '', 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-08 04:04:08', '2020-07-08 04:04:08', NULL, NULL, NULL, NULL, NULL),
(85, 1, 'audit', NULL, NULL, 1, NULL, '', 'App\\Models\\Asset', 16, NULL, NULL, '2020-07-08 04:05:14', '2020-07-08 04:05:14', NULL, NULL, NULL, NULL, NULL),
(86, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-08 19:46:07', '2020-07-08 19:46:07', NULL, NULL, 1, NULL, '{\"name\":{\"old\":\"PC 1\",\"new\":\"PC 1 (Ryzen 7 3700x, RAM 16GB, 1050Ti, SSD Samsung 256GB)\"}}'),
(87, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Component', 1, NULL, NULL, '2020-07-08 19:48:50', '2020-07-08 19:48:50', NULL, NULL, NULL, NULL, NULL),
(88, 1, 'checkout', 13, 'App\\Models\\Asset', NULL, '', NULL, 'App\\Models\\Component', 1, NULL, NULL, '2020-07-08 19:49:04', '2020-07-08 19:49:04', NULL, NULL, 1, NULL, NULL),
(89, 1, 'checkin from', 13, 'App\\Models\\Asset', NULL, NULL, NULL, 'App\\Models\\Component', 1, NULL, NULL, '2020-07-08 19:49:42', '2020-07-08 19:49:42', NULL, NULL, 1, NULL, NULL),
(90, 1, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Component', 1, NULL, NULL, '2020-07-08 19:50:16', '2020-07-08 19:50:16', NULL, NULL, NULL, NULL, NULL),
(91, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-08 19:52:48', '2020-07-08 19:52:48', NULL, NULL, 1, NULL, '{\"name\":{\"old\":\"PC 1 (Ryzen 7 3700x, RAM 16GB, 1050Ti, SSD Samsung 256GB)\",\"new\":\"PC 1 (BenQ 24\\\", Ryzen 7 3700x, RAM 16GB, 1050Ti, SSD Samsung 256GB)\"}}'),
(92, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-10 03:09:11', '2020-07-10 03:09:12', NULL, NULL, 1, NULL, '[]'),
(93, 1, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2020-07-13 04:41:11', '2020-07-13 04:41:11', NULL, NULL, NULL, NULL, NULL),
(94, 1, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 3, NULL, NULL, '2020-07-13 04:41:19', '2020-07-13 04:41:19', NULL, NULL, NULL, NULL, NULL),
(95, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Consumable', 1, NULL, NULL, '2020-07-13 04:48:09', '2020-07-13 04:48:09', NULL, NULL, 1, NULL, NULL),
(96, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Consumable', 2, NULL, NULL, '2020-07-13 04:49:17', '2020-07-13 04:49:17', NULL, NULL, 1, NULL, NULL),
(97, 1, 'add seats', NULL, NULL, NULL, 'added 5 seats', NULL, 'App\\Models\\License', 1, NULL, NULL, '2020-07-13 20:40:34', '2020-07-13 20:40:34', NULL, NULL, NULL, NULL, NULL),
(98, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\License', 1, NULL, NULL, '2020-07-13 20:40:34', '2020-07-13 20:40:34', NULL, NULL, NULL, NULL, NULL),
(99, 1, 'add seats', NULL, NULL, NULL, 'added 3 seats', NULL, 'App\\Models\\License', 2, NULL, NULL, '2020-07-13 20:41:01', '2020-07-13 20:41:01', NULL, NULL, NULL, NULL, NULL),
(100, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\License', 2, NULL, NULL, '2020-07-13 20:41:01', '2020-07-13 20:41:01', NULL, NULL, NULL, NULL, NULL),
(101, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\License', 1, NULL, NULL, '2020-07-13 20:41:39', '2020-07-13 20:41:39', NULL, NULL, NULL, NULL, NULL),
(102, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Accessory', 1, NULL, NULL, '2020-07-13 20:48:00', '2020-07-13 20:48:00', NULL, NULL, 1, NULL, NULL),
(103, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Accessory', 2, NULL, NULL, '2020-07-13 20:49:30', '2020-07-13 20:49:30', NULL, NULL, 1, NULL, NULL),
(104, 1, 'checkout', 1, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Accessory', 1, NULL, NULL, '2020-07-13 20:49:56', '2020-07-13 20:49:56', NULL, NULL, NULL, NULL, NULL),
(105, 1, 'checkout', 1, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Accessory', 2, NULL, NULL, '2020-07-13 20:50:04', '2020-07-13 20:50:04', NULL, NULL, NULL, NULL, NULL),
(106, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Component', 2, NULL, NULL, '2020-07-13 20:55:03', '2020-07-13 20:55:03', NULL, NULL, 1, NULL, NULL),
(107, 1, 'checkout', 13, 'App\\Models\\Asset', NULL, '', NULL, 'App\\Models\\Component', 2, NULL, NULL, '2020-07-13 20:55:19', '2020-07-13 20:55:19', NULL, NULL, 1, NULL, NULL),
(108, 1, 'checkout', 10, 'App\\Models\\Asset', NULL, '', NULL, 'App\\Models\\Component', 2, NULL, NULL, '2020-07-13 20:55:59', '2020-07-13 20:55:59', NULL, NULL, 1, NULL, NULL),
(109, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\License', 2, NULL, NULL, '2020-07-13 21:59:20', '2020-07-13 21:59:20', NULL, NULL, NULL, NULL, NULL),
(110, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Accessory', 1, NULL, NULL, '2020-07-13 22:00:22', '2020-07-13 22:00:22', NULL, NULL, 1, NULL, NULL),
(111, 1, 'checkin from', 1, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-14 22:00:20', '2020-07-14 22:00:20', NULL, NULL, NULL, NULL, NULL),
(112, 1, 'checkout', 3, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 14, NULL, NULL, '2020-07-15 05:04:46', '2020-07-15 05:04:46', NULL, NULL, 1, NULL, NULL),
(113, 1, 'checkout', 3, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2020-07-15 05:04:55', '2020-07-15 05:04:55', NULL, NULL, 1, NULL, NULL),
(114, 1, 'checkout', 2, 'App\\Models\\User', 2, '', NULL, 'App\\Models\\Asset', 15, NULL, NULL, '2020-07-15 05:11:45', '2020-07-15 05:11:45', NULL, NULL, 1, NULL, NULL),
(115, 1, 'checkout', 2, 'App\\Models\\User', 2, '', NULL, 'App\\Models\\Asset', 6, NULL, NULL, '2020-07-15 05:12:01', '2020-07-15 05:12:01', NULL, NULL, 1, NULL, NULL),
(116, 1, 'checkout', 3, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Consumable', 2, NULL, NULL, '2020-07-15 05:15:18', '2020-07-15 05:15:18', NULL, NULL, 1, NULL, NULL),
(117, 1, 'checkout', 13, 'App\\Models\\Asset', NULL, NULL, NULL, 'App\\Models\\License', 2, NULL, NULL, '2020-07-15 09:36:08', '2020-07-15 09:36:08', NULL, NULL, 1, NULL, NULL),
(118, 1, 'checkout', 13, 'App\\Models\\Asset', NULL, NULL, NULL, 'App\\Models\\License', 1, NULL, NULL, '2020-07-15 09:36:16', '2020-07-15 09:36:16', NULL, NULL, 1, NULL, NULL),
(119, 1, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\License', 1, NULL, NULL, '2020-07-15 09:36:28', '2020-07-15 09:36:28', NULL, NULL, 1, NULL, NULL),
(120, 1, 'checkout', 3, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Accessory', 1, NULL, NULL, '2020-07-15 09:37:09', '2020-07-15 09:37:09', NULL, NULL, 1, NULL, NULL),
(121, 1, 'checkout', 2, 'App\\Models\\User', 2, '', NULL, 'App\\Models\\Accessory', 1, NULL, NULL, '2020-07-15 09:37:15', '2020-07-15 09:37:15', NULL, NULL, 1, NULL, NULL),
(122, 1, 'checkout', 3, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Accessory', 2, NULL, NULL, '2020-07-15 09:37:20', '2020-07-15 09:37:20', NULL, NULL, 1, NULL, NULL),
(123, 1, 'checkout', 2, 'App\\Models\\User', 2, '', NULL, 'App\\Models\\Accessory', 2, NULL, NULL, '2020-07-15 09:37:27', '2020-07-15 09:37:27', NULL, NULL, 1, NULL, NULL),
(124, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Accessory', 2, NULL, NULL, '2020-07-15 09:37:35', '2020-07-15 09:37:35', NULL, NULL, 1, NULL, NULL),
(125, 1, 'checkout', 6, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Consumable', 1, NULL, NULL, '2020-07-15 09:38:19', '2020-07-15 09:38:19', NULL, NULL, NULL, NULL, NULL),
(126, 1, 'checkout', 6, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Consumable', 1, NULL, NULL, '2020-07-15 09:38:30', '2020-07-15 09:38:30', NULL, NULL, NULL, NULL, NULL),
(127, 1, 'checkout', 4, 'App\\Models\\Asset', NULL, '', NULL, 'App\\Models\\Component', 2, NULL, NULL, '2020-07-15 10:04:21', '2020-07-15 10:04:21', NULL, NULL, 1, NULL, NULL),
(128, NULL, 'requested', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 16, NULL, NULL, '2020-07-15 10:33:46', '2020-07-15 10:33:46', NULL, NULL, NULL, NULL, NULL),
(129, 1, 'checkout', 5, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 16, NULL, NULL, '2020-07-15 10:34:21', '2020-07-15 10:34:21', NULL, NULL, NULL, NULL, NULL),
(130, 1, 'checkin from', 5, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 16, NULL, NULL, '2020-07-15 10:35:27', '2020-07-15 10:35:27', NULL, NULL, NULL, NULL, NULL),
(131, 1, 'checkout', 5, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 16, NULL, NULL, '2020-07-15 10:36:11', '2020-07-15 10:36:11', NULL, NULL, NULL, NULL, NULL),
(132, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-16 08:48:54', '2020-07-16 08:48:54', NULL, NULL, 1, NULL, '{\"image\":{\"old\":null,\"new\":\"oJaD1Wel6gFADLd4IbcGXLgZv.jpeg\"}}'),
(133, 1, 'uploaded', NULL, NULL, NULL, '', 'hardware-13-L4P1EcqO-2020-07-04-18-41-17-25005o1jpg-30001627.jpg', 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-16 08:49:53', '2020-07-16 08:50:34', '2020-07-16 08:50:34', NULL, 1, NULL, NULL),
(134, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-16 08:50:23', '2020-07-16 08:50:23', NULL, NULL, 1, NULL, '{\"image\":{\"old\":\"oJaD1Wel6gFADLd4IbcGXLgZv.jpeg\",\"new\":\"3Wy1zikEurqav0opPCVsppwXR.jpeg\"}}'),
(135, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-16 08:50:45', '2020-07-16 08:50:45', NULL, NULL, 1, NULL, '{\"image\":{\"old\":\"3Wy1zikEurqav0opPCVsppwXR.jpeg\",\"new\":\"\"}}'),
(136, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-20 09:07:14', '2020-07-20 09:07:14', NULL, NULL, 1, NULL, '{\"name\":{\"old\":\"PC 1 (BenQ 24\\\", Ryzen 7 3700x, RAM 16GB, 1050Ti, SSD Samsung 256GB)\",\"new\":\"PC 1 (BenQ 24\\\", R7 3700x, RAM 16GB, 1050Ti, SSD 256GB)\"}}'),
(137, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-07-20 09:09:59', '2020-07-20 09:09:59', NULL, NULL, 1, NULL, '{\"name\":{\"old\":\"PC 1 (BenQ 24\\\", R7 3700x, RAM 16GB, 1050Ti, SSD 256GB)\",\"new\":\"PC 1 \"}}'),
(138, 1, 'checkout', 4, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 8, NULL, NULL, '2020-08-03 01:09:12', '2020-08-03 01:09:12', NULL, NULL, 1, NULL, NULL),
(139, 1, 'audit', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2020-08-03 01:13:51', '2020-08-03 01:13:51', NULL, NULL, NULL, NULL, NULL),
(140, 1, 'audit', NULL, NULL, NULL, 'Đã ktra\r\n', '', 'App\\Models\\Asset', 4, NULL, NULL, '2020-08-03 01:14:47', '2020-08-03 01:14:47', NULL, NULL, NULL, NULL, NULL),
(141, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 19, NULL, NULL, '2020-08-05 01:28:25', '2020-08-05 01:28:25', NULL, NULL, 1, NULL, NULL),
(142, 1, 'checkout', 5, 'App\\Models\\User', NULL, 'Checked out on asset creation', NULL, 'App\\Models\\Asset', 19, NULL, NULL, '2020-08-05 01:28:25', '2020-08-05 01:28:25', NULL, NULL, NULL, NULL, NULL),
(143, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 19, NULL, NULL, '2020-08-05 01:30:09', '2020-08-05 01:30:09', NULL, NULL, 1, NULL, '{\"name\":{\"old\":null,\"new\":\"Iphone X VN\\/A01\"}}'),
(144, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 20, NULL, NULL, '2020-08-05 01:30:51', '2020-08-05 01:30:51', NULL, NULL, 1, NULL, NULL),
(145, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 21, NULL, NULL, '2020-08-05 01:34:16', '2020-08-05 01:34:16', NULL, NULL, NULL, NULL, NULL),
(146, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 21, NULL, NULL, '2020-08-05 01:35:04', '2020-08-05 01:35:04', NULL, NULL, NULL, NULL, '{\"asset_tag\":{\"old\":\"00021\",\"new\":\"taisan021\"}}'),
(147, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 20, NULL, NULL, '2020-08-05 01:44:41', '2020-08-05 01:44:41', NULL, NULL, 1, NULL, '{\"asset_tag\":{\"old\":\"00020\",\"new\":\"taisan020\"}}'),
(148, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 19, NULL, NULL, '2020-08-05 01:45:04', '2020-08-05 01:45:04', NULL, NULL, 1, NULL, '{\"asset_tag\":{\"old\":\"00019\",\"new\":\"taisan019\"}}'),
(149, 1, 'checkout', 5, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 20, NULL, NULL, '2020-08-05 19:52:31', '2020-08-05 19:52:31', NULL, NULL, NULL, NULL, NULL),
(150, 1, 'checkout', 6, 'App\\Models\\User', NULL, '10 tập giấy', NULL, 'App\\Models\\Consumable', 1, NULL, NULL, '2020-08-05 19:58:13', '2020-08-05 19:58:13', NULL, NULL, NULL, NULL, NULL),
(151, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Component', 3, NULL, NULL, '2020-08-05 20:09:27', '2020-08-05 20:09:27', NULL, NULL, 1, NULL, NULL),
(152, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Component', 3, NULL, NULL, '2020-08-05 20:10:04', '2020-08-05 20:10:04', NULL, NULL, 1, NULL, NULL),
(153, 1, 'checkin from', 5, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 20, NULL, NULL, '2020-08-05 20:33:56', '2020-08-05 20:33:56', NULL, NULL, NULL, NULL, NULL),
(154, 1, 'checkout', 4, 'App\\Models\\Asset', NULL, '', NULL, 'App\\Models\\Asset', 20, NULL, NULL, '2020-08-05 20:34:12', '2020-08-05 20:34:12', NULL, NULL, 1, NULL, NULL),
(155, 1, 'checkout', 4, 'App\\Models\\Asset', NULL, NULL, NULL, 'App\\Models\\License', 2, NULL, NULL, '2020-08-05 20:36:31', '2020-08-05 20:36:31', NULL, NULL, 1, NULL, NULL),
(156, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Component', 3, NULL, NULL, '2020-08-06 21:45:31', '2020-08-06 21:45:31', NULL, NULL, 1, NULL, NULL),
(157, 1, 'checkout', 4, 'App\\Models\\Asset', NULL, '', NULL, 'App\\Models\\Component', 3, NULL, NULL, '2020-08-06 21:45:42', '2020-08-06 21:45:42', NULL, NULL, 1, NULL, NULL),
(158, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 19, NULL, NULL, '2020-08-10 21:36:39', '2020-08-10 21:36:39', NULL, NULL, NULL, NULL, NULL),
(159, 1, 'audit', NULL, NULL, 1, NULL, NULL, 'App\\Models\\Asset', 20, NULL, NULL, '2020-08-10 21:36:39', '2020-08-10 21:36:39', NULL, NULL, NULL, NULL, NULL),
(160, 1, 'uploaded', NULL, NULL, NULL, '', 'hardware-13-ehPFCfYH-asset-qrcode.jpg', 'App\\Models\\Asset', 13, NULL, NULL, '2020-08-19 03:05:01', '2020-08-19 03:05:01', NULL, NULL, 1, NULL, NULL),
(161, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-08-19 03:05:46', '2020-08-19 03:05:46', NULL, NULL, 1, NULL, '{\"image\":{\"old\":\"\",\"new\":\"CN1k2fFnZNW4z60PSibGrsyge.jpeg\"}}'),
(162, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-08-19 23:54:52', '2020-08-19 23:54:52', NULL, NULL, 1, NULL, '{\"image\":{\"old\":\"CN1k2fFnZNW4z60PSibGrsyge.jpeg\",\"new\":\"\"}}'),
(163, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2020-08-20 00:13:37', '2020-08-20 00:13:37', NULL, NULL, 1, NULL, '{\"image\":{\"old\":\"\",\"new\":\"HEClbOAOiCUCZPtTW63MG9fsV.jpeg\"}}'),
(164, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2020-08-20 00:15:20', '2020-08-20 00:15:20', NULL, NULL, 1, NULL, '{\"image\":{\"old\":null,\"new\":\"DapK8HD1mYF7iYZEmU3IAgiKk.jpeg\"}}'),
(165, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 21, NULL, NULL, '2020-08-20 00:17:03', '2020-08-20 00:17:03', NULL, NULL, NULL, NULL, '{\"image\":{\"old\":null,\"new\":\"0QxrCWLd8Ow7nrb6KgW5ZKSX3.jpeg\"}}'),
(166, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2020-08-20 00:18:21', '2020-08-20 00:18:21', NULL, NULL, 1, NULL, '{\"image\":{\"old\":\"DapK8HD1mYF7iYZEmU3IAgiKk.jpeg\",\"new\":\"\"}}'),
(167, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2020-08-20 00:18:30', '2020-08-20 00:18:30', NULL, NULL, 1, NULL, '{\"image\":{\"old\":\"\",\"new\":\"dxR5OAth93zshNnDPkFZZgj3Q.jpeg\"}}'),
(168, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 19, NULL, NULL, '2020-08-20 00:20:01', '2020-08-20 00:20:01', NULL, NULL, 1, NULL, '{\"image\":{\"old\":null,\"new\":\"RmHplExmHXyuvmI1xB8FRNx1T.jpeg\"}}'),
(169, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 20, NULL, NULL, '2020-08-20 00:20:24', '2020-08-20 00:20:24', NULL, NULL, 1, NULL, '{\"image\":{\"old\":null,\"new\":\"FQFzVPSA3pIG3bUO6fyJXW7d7.jpeg\"}}'),
(170, 1, 'checkin from', 4, 'App\\Models\\Asset', NULL, '', NULL, 'App\\Models\\Asset', 20, NULL, NULL, '2020-08-20 00:20:59', '2020-08-20 00:20:59', NULL, NULL, 1, NULL, NULL),
(171, 1, 'checkout', 1, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 20, NULL, NULL, '2020-08-20 00:21:09', '2020-08-20 00:21:09', NULL, NULL, NULL, NULL, NULL),
(172, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\License', 2, NULL, NULL, '2020-08-20 00:23:30', '2020-08-20 00:23:30', NULL, NULL, NULL, NULL, NULL),
(173, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Accessory', 1, NULL, NULL, '2020-08-20 00:25:00', '2020-08-20 00:25:00', NULL, NULL, 1, NULL, NULL),
(174, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Accessory', 2, NULL, NULL, '2020-08-20 00:27:10', '2020-08-20 00:27:10', NULL, NULL, 1, NULL, NULL),
(175, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Accessory', 1, NULL, NULL, '2020-08-20 00:28:03', '2020-08-20 00:28:03', NULL, NULL, 1, NULL, NULL),
(176, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Accessory', 1, NULL, NULL, '2020-08-20 00:28:13', '2020-08-20 00:28:13', NULL, NULL, 1, NULL, NULL),
(177, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Consumable', 2, NULL, NULL, '2020-08-20 00:30:26', '2020-08-20 00:30:26', NULL, NULL, 1, NULL, NULL),
(178, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Consumable', 1, NULL, NULL, '2020-08-20 00:32:32', '2020-08-20 00:32:32', NULL, NULL, 1, NULL, NULL),
(179, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Component', 3, NULL, NULL, '2020-08-20 00:33:39', '2020-08-20 00:33:39', NULL, NULL, 1, NULL, NULL),
(180, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Component', 2, NULL, NULL, '2020-08-20 00:34:40', '2020-08-20 00:34:40', NULL, NULL, 1, NULL, NULL),
(181, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 18, NULL, NULL, '2020-08-20 00:42:52', '2020-08-20 00:42:52', NULL, NULL, 1, NULL, '{\"image\":{\"old\":null,\"new\":\"Jy26NsvRR6xSKdnlbtngkPWsi.jpeg\"},\"location_id\":{\"old\":null,\"new\":\"4\"}}'),
(182, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 17, NULL, NULL, '2020-08-20 00:43:09', '2020-08-20 00:43:09', NULL, NULL, 1, NULL, '{\"image\":{\"old\":null,\"new\":\"sEs1UhGA1a8WoAWwo9uByZtE3.jpeg\"},\"location_id\":{\"old\":null,\"new\":\"4\"}}'),
(183, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 16, NULL, NULL, '2020-08-20 00:43:20', '2020-08-20 00:43:20', NULL, NULL, 1, NULL, '{\"image\":{\"old\":null,\"new\":\"Lbqk4BSwBXEcGRHPlOOMFDgCv.jpeg\"}}'),
(184, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 15, NULL, NULL, '2020-08-20 00:43:28', '2020-08-20 00:43:28', NULL, NULL, 1, NULL, '{\"image\":{\"old\":null,\"new\":\"yQdFMqIh0FedvAFZgDYWUurJH.jpeg\"}}'),
(185, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 14, NULL, NULL, '2020-08-20 00:43:36', '2020-08-20 00:43:36', NULL, NULL, 1, NULL, '{\"image\":{\"old\":null,\"new\":\"Tf026w96NpyyKKfmpQ2ktcAis.jpeg\"}}'),
(186, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2020-08-20 00:46:36', '2020-08-20 00:46:36', NULL, NULL, 1, NULL, '{\"model_id\":{\"old\":3,\"new\":\"5\"}}'),
(187, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 12, NULL, NULL, '2020-08-20 00:48:00', '2020-08-20 00:48:00', NULL, NULL, 1, NULL, '{\"model_id\":{\"old\":5,\"new\":\"11\"},\"image\":{\"old\":null,\"new\":\"a5nRJDzvrBV0PVTteyOGWtl1G.jpeg\"}}'),
(188, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 11, NULL, NULL, '2020-08-20 00:48:10', '2020-08-20 00:48:10', NULL, NULL, 1, NULL, '{\"model_id\":{\"old\":5,\"new\":\"11\"},\"image\":{\"old\":null,\"new\":\"u2g77iIJdbvBMcEVZjiqQW13r.jpeg\"}}'),
(189, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 10, NULL, NULL, '2020-08-20 00:48:19', '2020-08-20 00:48:19', NULL, NULL, 1, NULL, '{\"model_id\":{\"old\":5,\"new\":\"11\"},\"image\":{\"old\":null,\"new\":\"Efm8NmNWSjEQgFHJgRRMA2RK2.jpeg\"}}'),
(190, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 5, NULL, NULL, '2020-08-20 00:50:30', '2020-08-20 00:50:30', NULL, NULL, 1, NULL, '{\"model_id\":{\"old\":3,\"new\":\"5\"},\"image\":{\"old\":null,\"new\":\"rtrWZfiRhBEqZm7DsOyFCNwRr.jpeg\"}}'),
(191, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 8, NULL, NULL, '2020-08-20 00:50:38', '2020-08-20 00:50:38', NULL, NULL, 1, NULL, '{\"model_id\":{\"old\":4,\"new\":\"5\"},\"image\":{\"old\":null,\"new\":\"x4DA6ee3ahwtY9gWfhqmIZ5tX.jpeg\"}}'),
(192, 1, 'checkin from', 2, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 15, NULL, NULL, '2020-08-20 02:27:58', '2020-08-20 02:27:58', NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `assigned_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_audit_date` datetime DEFAULT NULL,
  `next_audit_date` date DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `checkin_counter` int(11) NOT NULL DEFAULT '0',
  `checkout_counter` int(11) NOT NULL DEFAULT '0',
  `requests_counter` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `_snipeit_mac_address_1`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`) VALUES
(1, 'demo 1', 'dvsfbfg', 1, '222', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-07-01 21:55:13', '2020-07-13 04:41:11', 1, '2020-07-13 04:41:11', 3, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-02 10:15:56', '2021-07-02', NULL, 0, 0, 0),
(2, 'demo', 'dsff', 2, NULL, '2020-07-21', '500000.00', NULL, NULL, NULL, NULL, 1, '2020-07-01 21:56:38', '2020-07-07 00:50:47', 1, '2020-07-07 00:50:47', 4, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, '2020-07-02 04:56:38', NULL, NULL, 'App\\Models\\User', '2020-07-02 05:02:30', '2021-07-02', NULL, 0, 1, 0),
(3, 'demo2', 'demo2', 2, '21432', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-07-01 23:48:38', '2020-07-13 04:41:19', 1, '2020-07-13 04:41:19', 3, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-02 10:15:56', '2021-07-02', NULL, 0, 0, 0),
(4, 'Tên laptop 1', 'taisan001', 5, NULL, '2018-01-01', '8000000.00', NULL, 3, NULL, 'dxR5OAth93zshNnDPkFZZgj3Q.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:46:36', 1, NULL, 2, 0, 12, NULL, NULL, 0, NULL, NULL, NULL, '2020-07-15 12:04:55', NULL, 1, 'App\\Models\\User', '2020-08-03 08:14:47', '2020-08-03', NULL, 0, 1, 0),
(5, 'Tên laptop 2', 'taisan002', 5, NULL, '2018-01-01', '10000000.00', NULL, 1, NULL, 'rtrWZfiRhBEqZm7DsOyFCNwRr.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:50:30', 1, NULL, 2, 0, 12, NULL, NULL, 0, NULL, NULL, NULL, '2020-07-08 10:39:07', NULL, 1, 'App\\Models\\User', '2020-07-08 10:56:12', '2021-07-10', NULL, 0, 1, 0),
(6, 'Tên laptop 3', 'taisan003', 3, '', '2018-01-01', '13000000.00', NULL, 2, '', NULL, NULL, '2020-07-06 03:59:00', '2020-07-15 05:12:01', 1, NULL, 2, 0, 12, NULL, NULL, 0, NULL, NULL, NULL, '2020-07-15 12:12:01', NULL, 1, 'App\\Models\\User', '2020-07-08 10:56:12', '2021-07-10', 2, 0, 1, 0),
(7, 'Tên laptop 4', 'taisan004', 4, '', '2019-01-01', '15000000.00', NULL, NULL, '', NULL, NULL, '2020-07-06 03:59:00', '2020-07-08 03:56:13', 1, NULL, 2, 0, 12, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2020-07-08 10:56:13', '2021-07-10', NULL, 0, 0, 0),
(8, 'Tên laptop 5', 'taisan005', 5, NULL, '2019-01-01', '20000000.00', NULL, 4, NULL, 'x4DA6ee3ahwtY9gWfhqmIZ5tX.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:50:38', 1, NULL, 2, 0, 12, NULL, NULL, 0, NULL, NULL, NULL, '2020-08-03 08:09:12', NULL, 1, 'App\\Models\\User', '2020-07-08 10:56:13', '2021-07-10', NULL, 0, 1, 0),
(9, 'Tên laptop 6', 'taisan006', 4, '', '2019-01-01', '25000000.00', NULL, NULL, '', NULL, NULL, '2020-07-06 03:59:00', '2020-07-08 03:56:13', 1, NULL, 2, 0, 12, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2020-07-08 10:56:13', '2021-07-10', NULL, 0, 0, 0),
(10, 'Tên laptop 7', 'taisan007', 11, NULL, '2020-01-01', '30000000.00', NULL, NULL, NULL, 'Efm8NmNWSjEQgFHJgRRMA2RK2.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:48:19', 1, NULL, 3, 0, 24, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2020-07-08 10:56:13', '2021-07-10', NULL, 0, 0, 0),
(11, 'Tên laptop 8', 'taisan008', 11, NULL, '2020-01-01', '35000000.00', NULL, NULL, NULL, 'u2g77iIJdbvBMcEVZjiqQW13r.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:48:10', 1, NULL, 3, 0, 24, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2020-07-08 10:56:13', '2021-07-10', NULL, 0, 0, 0),
(12, 'Tên laptop 9', 'taisan009', 11, NULL, '2020-01-01', '40000000.00', NULL, NULL, NULL, 'a5nRJDzvrBV0PVTteyOGWtl1G.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:48:00', 1, NULL, 3, 0, 24, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2020-07-08 10:56:13', '2021-07-10', NULL, 0, 0, 0),
(13, 'PC 1 ', 'taisan010', 6, NULL, '2017-01-01', '25000000.00', NULL, 1, NULL, 'HEClbOAOiCUCZPtTW63MG9fsV.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:13:37', 1, NULL, 2, 0, 36, NULL, NULL, 0, 3, NULL, NULL, '2020-07-07 09:56:31', NULL, 1, 'App\\Models\\User', '2020-07-08 11:00:15', '2021-07-08', NULL, 0, 1, 0),
(14, 'PC 2', 'taisan011', 6, NULL, '2017-01-01', '20000000.00', NULL, 3, NULL, 'Tf026w96NpyyKKfmpQ2ktcAis.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:43:36', 1, NULL, 2, 0, 36, NULL, NULL, 0, 3, NULL, NULL, '2020-07-15 12:04:46', NULL, 1, 'App\\Models\\User', '2020-07-08 11:04:08', '2020-07-08', NULL, 1, 2, 0),
(15, 'PC 3', 'taisan012', 6, NULL, '2017-01-01', '15000000.00', NULL, NULL, NULL, 'yQdFMqIh0FedvAFZgDYWUurJH.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 02:27:58', 1, NULL, 2, 0, 36, NULL, NULL, 0, 3, NULL, NULL, NULL, NULL, 1, NULL, '2020-07-08 10:57:27', '2020-07-10', 3, 1, 1, 0),
(16, 'PC 4', 'taisan013', 7, NULL, '2017-01-01', '10000000.00', NULL, 5, NULL, 'Lbqk4BSwBXEcGRHPlOOMFDgCv.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:43:20', 1, NULL, 2, 0, 36, NULL, NULL, 1, 4, NULL, NULL, '2020-07-15 17:36:11', '2020-07-16', 1, 'App\\Models\\User', '2020-07-08 11:05:14', '2020-07-08', NULL, 1, 2, 1),
(17, 'PC 5', 'taisan014', 7, NULL, '2017-01-01', '8000000.00', NULL, NULL, NULL, 'sEs1UhGA1a8WoAWwo9uByZtE3.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:43:09', 1, NULL, 1, 0, 36, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, 1, NULL, '2020-07-08 10:57:27', '2020-07-10', 4, 0, 0, 0),
(18, 'PC 6', 'taisan015', 7, NULL, '2017-01-01', '6000000.00', NULL, NULL, NULL, 'Jy26NsvRR6xSKdnlbtngkPWsi.jpeg', NULL, '2020-07-06 03:59:00', '2020-08-20 00:42:52', 1, NULL, 1, 0, 36, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, 1, NULL, '2020-07-08 10:56:12', '2021-07-10', 4, 0, 0, 0),
(19, 'Iphone X VN/A01', 'taisan019', 9, NULL, '2019-01-01', '30000000.00', NULL, 5, NULL, 'RmHplExmHXyuvmI1xB8FRNx1T.jpeg', 1, '2020-08-05 01:28:25', '2020-08-20 00:20:01', 1, NULL, 2, 0, 12, 0, NULL, 0, NULL, NULL, NULL, '2020-08-05 08:28:25', NULL, 1, 'App\\Models\\User', '2020-08-11 04:36:39', '2020-08-11', NULL, 0, 1, 0),
(20, 'Iphone X VN/A02', 'taisan020', 9, NULL, '2019-06-01', '25000000.00', NULL, 1, NULL, 'FQFzVPSA3pIG3bUO6fyJXW7d7.jpeg', 1, '2020-08-05 01:30:51', '2020-08-20 00:21:09', 1, NULL, 2, 0, 12, 0, NULL, 0, NULL, NULL, NULL, '2020-08-20 07:21:09', NULL, 1, 'App\\Models\\User', '2020-08-11 04:36:39', '2020-08-11', NULL, 2, 3, 0),
(21, 'Samsung S10 SM-G973F/DS01', 'taisan021', 10, NULL, '2020-01-01', '15000000.00', NULL, NULL, NULL, '0QxrCWLd8Ow7nrb6KgW5ZKSX3.jpeg', 1, '2020-08-05 01:34:16', '2020-08-20 00:17:03', 1, NULL, 3, 0, 12, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `asset_logs`
--

CREATE TABLE `asset_logs` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `component_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_maintenances`
--

CREATE TABLE `asset_maintenances` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
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
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_maintenances`
--

INSERT INTO `asset_maintenances` (`id`, `asset_id`, `supplier_id`, `asset_maintenance_type`, `title`, `is_warranty`, `start_date`, `completion_date`, `asset_maintenance_time`, `notes`, `cost`, `deleted_at`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 4, 1, 'Sửa chữa', 'Thay bàn phím', 0, '2020-05-01', '2020-05-02', 1, NULL, '1000000.00', NULL, '2020-08-20 02:33:04', '2020-08-20 02:33:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `asset_uploads`
--

CREATE TABLE `asset_uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int(11) NOT NULL,
  `filenotes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `user_id`, `deleted_at`, `eula_text`, `use_default_eula`, `require_acceptance`, `category_type`, `checkin_email`, `image`) VALUES
(1, 'Bản quyền phần mềm', '2020-06-30 20:48:09', '2020-07-13 20:39:50', NULL, NULL, NULL, 0, 0, 'license', 0, NULL),
(2, 'category 1', '2020-07-01 21:50:30', '2020-07-13 20:38:26', 1, '2020-07-13 20:38:26', NULL, 0, 0, 'asset', 0, NULL),
(3, 'Laptop', '2020-07-06 03:59:00', '2020-07-06 03:59:00', 1, NULL, NULL, 0, 0, 'asset', 0, NULL),
(4, 'Case PC', '2020-07-06 03:59:00', '2020-07-06 03:59:00', 1, NULL, NULL, 0, 0, 'asset', 0, NULL),
(5, 'Màn hình', '2020-07-08 19:48:23', '2020-07-08 19:51:30', 1, '2020-07-08 19:51:30', NULL, 0, 0, 'asset', 0, NULL),
(6, 'Màn hình', '2020-07-08 19:51:38', '2020-07-08 19:51:38', 1, NULL, NULL, 0, 0, 'asset', 0, NULL),
(7, 'Vật tư tiêu hao', '2020-07-13 04:41:54', '2020-07-13 04:41:54', 1, NULL, NULL, 0, 0, 'consumable', 0, NULL),
(8, 'Phụ kiện', '2020-07-13 20:38:43', '2020-07-13 20:48:47', 1, '2020-07-13 20:48:47', NULL, 0, 0, 'component', 0, NULL),
(9, 'Phụ kiện Laptop', '2020-07-13 20:47:29', '2020-07-13 20:48:51', 1, '2020-07-13 20:48:51', NULL, 0, 0, 'component', 0, NULL),
(10, 'Phụ kiện ', '2020-07-13 20:47:49', '2020-07-13 20:49:06', NULL, NULL, NULL, 0, 0, 'accessory', 0, NULL),
(11, 'Linh kiện khác', '2020-07-13 20:50:42', '2020-07-13 20:50:42', 1, NULL, NULL, 0, 0, 'component', 0, NULL),
(12, '123', '2020-07-16 08:53:47', '2020-07-16 08:53:47', 1, NULL, NULL, 0, 0, 'accessory', 0, NULL),
(13, 'Smartphone', '2020-08-05 01:12:25', '2020-08-05 01:12:25', 1, NULL, NULL, 0, 0, 'asset', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `checkout_requests`
--

CREATE TABLE `checkout_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `requestable_id` int(11) NOT NULL,
  `requestable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checkout_requests`
--

INSERT INTO `checkout_requests` (`id`, `user_id`, `requestable_id`, `requestable_type`, `quantity`, `created_at`, `updated_at`, `canceled_at`, `fulfilled_at`, `deleted_at`) VALUES
(1, 5, 16, 'App\\Models\\Asset', 1, '2020-07-15 10:33:46', '2020-07-15 10:33:46', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Công ty Miraway', '2020-07-06 03:59:00', '2020-08-20 02:31:01', 'company-fqQVmPQyglgAkywSVB.png');

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`id`, `name`, `category_id`, `location_id`, `company_id`, `user_id`, `qty`, `order_number`, `purchase_date`, `purchase_cost`, `created_at`, `updated_at`, `deleted_at`, `min_amt`, `serial`, `image`) VALUES
(1, 'Màn hình Ben Q 24\"\"', 5, 2, NULL, 1, 1, NULL, NULL, '3000000.00', '2020-07-08 19:48:50', '2020-07-08 19:50:17', '2020-07-08 19:50:17', NULL, NULL, NULL),
(2, 'USB', 11, NULL, 1, 1, 20, NULL, NULL, NULL, '2020-07-13 20:55:03', '2020-08-20 00:34:40', NULL, NULL, NULL, 'component-KHj7tFY0KewTSTzuM2.jpg'),
(3, 'RAM 16GB', 11, 3, 1, 1, 4, NULL, NULL, '10000000.00', '2020-08-05 20:09:27', '2020-08-20 00:33:39', NULL, NULL, NULL, 'component-08vNMGoQ2eyETtcXf3.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `components_assets`
--

CREATE TABLE `components_assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `assigned_qty` int(11) DEFAULT '1',
  `component_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `components_assets`
--

INSERT INTO `components_assets` (`id`, `user_id`, `assigned_qty`, `component_id`, `asset_id`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 2, 13, '2020-07-13 20:55:19', NULL),
(3, 1, 1, 2, 10, '2020-07-13 20:55:59', NULL),
(4, 1, 1, 2, 4, '2020-07-15 10:04:21', NULL),
(5, 1, 2, 3, 4, '2020-08-06 21:45:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consumables`
--

CREATE TABLE `consumables` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `item_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consumables`
--

INSERT INTO `consumables` (`id`, `name`, `category_id`, `location_id`, `user_id`, `qty`, `requestable`, `created_at`, `updated_at`, `deleted_at`, `purchase_date`, `purchase_cost`, `order_number`, `company_id`, `min_amt`, `model_number`, `manufacturer_id`, `item_no`, `image`) VALUES
(1, 'Giấy A4', 7, NULL, 1, 10, 0, '2020-07-13 04:48:09', '2020-08-20 00:32:32', NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, NULL, 'bOypW0OoUUc4nMRuTZrwZD0MD.jpg'),
(2, 'Bình nước 19L', 7, NULL, 1, 5, 0, '2020-07-13 04:49:17', '2020-08-20 00:30:26', NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, NULL, 'rtr5xVKo1677vYYaJqceR6MVT.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `consumables_users`
--

CREATE TABLE `consumables_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consumables_users`
--

INSERT INTO `consumables_users` (`id`, `user_id`, `consumable_id`, `assigned_to`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 3, '2020-07-15 05:15:18', '2020-07-15 05:15:18'),
(2, 1, 1, 6, '2020-07-15 09:38:19', '2020-07-15 09:38:19'),
(3, 1, 1, 6, '2020-07-15 09:38:30', '2020-07-15 09:38:30'),
(4, 1, 1, 6, '2020-08-05 19:58:13', '2020-08-05 19:58:13');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `show_in_email` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `format`, `element`, `created_at`, `updated_at`, `user_id`, `field_values`, `field_encrypted`, `db_column`, `help_text`, `show_in_email`) VALUES
(1, 'MAC Address', 'regex:/^[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}$/', 'text', NULL, '2020-06-30 20:48:06', NULL, NULL, 0, '_snipeit_mac_address_1', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_fieldsets`
--

CREATE TABLE `custom_fieldsets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fieldsets`
--

INSERT INTO `custom_fieldsets` (`id`, `name`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Asset with MAC Address', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_custom_fieldset`
--

CREATE TABLE `custom_field_custom_fieldset` (
  `custom_field_id` int(11) NOT NULL,
  `custom_fieldset_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_custom_fieldset`
--

INSERT INTO `custom_field_custom_fieldset` (`custom_field_id`, `custom_fieldset_id`, `order`, `required`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `user_id`, `company_id`, `location_id`, `manager_id`, `notes`, `created_at`, `updated_at`, `deleted_at`, `image`) VALUES
(1, 'Phòng kế toán', 1, 1, NULL, NULL, NULL, '2020-07-13 20:42:26', '2020-07-13 20:42:26', NULL, NULL),
(2, 'Phòng kinh doanh', 1, 1, NULL, NULL, NULL, '2020-07-13 20:42:36', '2020-07-13 20:42:36', NULL, NULL),
(3, 'Phòng marketting', 1, 1, NULL, NULL, NULL, '2020-07-13 20:43:22', '2020-07-13 20:43:22', NULL, NULL),
(4, 'Quản lý kho', 1, 1, NULL, NULL, NULL, '2020-07-13 20:43:31', '2020-07-13 20:43:31', NULL, NULL),
(5, 'Phòng kỹ thuật', 1, 1, NULL, NULL, NULL, '2020-07-13 20:43:48', '2020-07-13 20:43:48', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `depreciations`
--

CREATE TABLE `depreciations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `months` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `depreciations`
--

INSERT INTO `depreciations` (`id`, `name`, `months`, `created_at`, `updated_at`, `user_id`) VALUES
(2, '2 năm', 24, '2020-07-08 04:15:07', '2020-08-05 01:15:01', 1),
(3, '3 năm', 36, '2020-07-08 04:15:18', '2020-08-05 01:15:10', 1),
(4, '5 năm', 60, '2020-08-05 01:14:08', '2020-08-05 01:15:18', 1),
(5, '7 năm', 84, '2020-08-05 01:15:32', '2020-08-05 01:15:32', 1),
(6, '10 năm', 120, '2020-08-05 01:15:41', '2020-08-05 01:15:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `import_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `header_row` text COLLATE utf8mb4_unicode_ci,
  `first_row` text COLLATE utf8mb4_unicode_ci,
  `field_map` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `imports`
--

INSERT INTO `imports` (`id`, `name`, `file_path`, `filesize`, `import_type`, `created_at`, `updated_at`, `header_row`, `first_row`, `field_map`) VALUES
(1, NULL, '2020-07-06-105835-qlts-test-4csv', 1816, 'asset', '2020-07-06 03:58:35', '2020-07-06 03:59:00', '[\"Full Name\",\"Email\",\"Username\",\"item Name\",\"Category\",\"Model name\",\"Manufacturer\",\"Model Number\",\"Serial number\",\"Asset Tag\",\"Location\",\"Notes\",\"Purchase Date\",\"Purchase Cost\",\"Company\",\"Status\",\"Warranty Months\",\"Supplier\"]', '[\"\",\"\",\"\",\"T\\u00ean laptop 1\",\"Laptop\",\"Laptop Dell Vostro\",\"Dell\",\"\",\"\",\"taisan001\",\"\",\"\",\"2018\\/01\\/01\",\"8000000\",\"Miraway\",\"Ready to Deploy\",\"12\",\"\"]', '{\"Full Name\":\"full_name\",\"Email\":\"email\",\"Username\":\"username\",\"item Name\":\"item_name\",\"Category\":\"category\",\"Model name\":\"asset_model\",\"Manufacturer\":\"manufacturer\",\"Model Number\":\"model_number\",\"Serial number\":\"serial\",\"Asset Tag\":\"asset_tag\",\"Location\":\"location\",\"Notes\":\"notes\",\"Purchase Date\":\"purchase_date\",\"Purchase Cost\":\"purchase_cost\",\"Company\":\"company\",\"Status\":\"status\",\"Warranty Months\":\"warranty_months\",\"Supplier\":\"supplier\"}');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`id`, `name`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `seats`, `notes`, `user_id`, `depreciation_id`, `created_at`, `updated_at`, `deleted_at`, `license_name`, `license_email`, `depreciate`, `supplier_id`, `expiration_date`, `purchase_order`, `termination_date`, `maintained`, `reassignable`, `company_id`, `manufacturer_id`, `category_id`) VALUES
(1, 'Win 10', NULL, NULL, NULL, NULL, 5, NULL, 1, NULL, '2020-07-13 20:40:34', '2020-07-13 20:41:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 1),
(2, 'Adobe Photoshop', NULL, NULL, '5000000.00', NULL, 3, NULL, 1, NULL, '2020-07-13 20:41:01', '2020-08-20 00:23:30', NULL, NULL, NULL, NULL, NULL, '2022-01-01', NULL, NULL, 0, 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `license_seats`
--

CREATE TABLE `license_seats` (
  `id` int(10) UNSIGNED NOT NULL,
  `license_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `license_seats`
--

INSERT INTO `license_seats` (`id`, `license_id`, `assigned_to`, `notes`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `asset_id`) VALUES
(1, 1, 1, NULL, 1, '2020-07-13 20:40:34', '2020-07-15 09:36:16', NULL, 13),
(2, 1, 3, NULL, 1, '2020-07-13 20:40:34', '2020-07-15 09:36:28', NULL, NULL),
(3, 1, NULL, NULL, NULL, '2020-07-13 20:40:34', '2020-07-13 20:40:34', NULL, NULL),
(4, 1, NULL, NULL, NULL, '2020-07-13 20:40:34', '2020-07-13 20:40:34', NULL, NULL),
(5, 1, NULL, NULL, NULL, '2020-07-13 20:40:34', '2020-07-13 20:40:34', NULL, NULL),
(6, 2, 1, NULL, 1, '2020-07-13 20:41:01', '2020-07-15 09:36:08', NULL, 13),
(7, 2, 3, NULL, 1, '2020-07-13 20:41:01', '2020-08-05 20:36:31', NULL, 4),
(8, 2, NULL, NULL, NULL, '2020-07-13 20:41:01', '2020-07-13 20:41:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `city`, `state`, `country`, `created_at`, `updated_at`, `user_id`, `address`, `address2`, `zip`, `deleted_at`, `parent_id`, `currency`, `ldap_ou`, `manager_id`, `image`) VALUES
(1, 'Congty 1', 'Hà nội', NULL, 'VN', '2020-07-01 22:02:28', '2020-07-01 22:02:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Kinh Doanh Mass', 'Hà Nội', NULL, 'VN', '2020-07-08 04:10:09', '2020-07-08 04:10:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Kho miền Bắc', NULL, NULL, NULL, '2020-08-05 20:23:08', '2020-08-05 20:23:08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Kho miền Nam', NULL, NULL, NULL, '2020-08-05 20:23:21', '2020-08-05 20:23:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `successful` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `username`, `remote_ip`, `user_agent`, `successful`, `created_at`, `updated_at`) VALUES
(1, 'admin', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-06-30 20:53:30', NULL),
(2, 'admin', '118.70.125.224', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-06 03:51:56', NULL),
(3, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 0, '2020-07-06 03:51:56', NULL),
(4, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 0, '2020-07-06 03:52:09', NULL),
(5, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-06 03:52:20', NULL),
(6, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-06 04:01:12', NULL),
(7, 'admin', '222.252.26.151', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-06 04:17:13', NULL),
(8, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-06 04:43:08', NULL),
(9, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-07 00:50:26', NULL),
(10, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 0, '2020-07-07 00:54:35', NULL),
(11, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-07 00:54:41', NULL),
(12, 'admin', '113.185.40.53', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-07 03:50:58', NULL),
(13, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-07 04:01:04', NULL),
(14, 'admin', '1.55.52.238', 'Mozilla/5.0 (iPad; CPU OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/76.0.3809.81 Mobile/15E148 Safari/605.1', 1, '2020-07-07 07:31:30', NULL),
(15, 'admin', '1.55.52.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-07 14:11:54', NULL),
(16, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-07 19:12:56', NULL),
(17, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-07 20:13:53', NULL),
(18, 'admin', '113.185.40.53', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-07 21:20:39', NULL),
(19, 'admin', '113.190.148.215', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15', 1, '2020-07-07 21:40:34', NULL),
(20, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-07 21:41:20', NULL),
(21, 'admin', '118.70.125.167', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-08 00:21:32', NULL),
(22, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.58', 1, '2020-07-08 00:35:46', NULL),
(23, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/87.0.152 Chrome/81.0.4044.152 Safari/537.36', 1, '2020-07-08 00:38:25', NULL),
(24, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 9; CPH1989) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-08 04:02:14', NULL),
(25, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-08 04:04:29', NULL),
(26, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.58', 1, '2020-07-08 19:42:51', NULL),
(27, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-08 19:54:41', NULL),
(28, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.58', 1, '2020-07-09 03:28:10', NULL),
(29, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.61', 1, '2020-07-09 20:41:58', NULL),
(30, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/87.0.152 Chrome/81.0.4044.152 Safari/537.36', 1, '2020-07-10 01:09:03', NULL),
(31, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', 1, '2020-07-10 02:10:07', NULL),
(32, 'Admin', '14.248.80.105', 'Mozilla/5.0 (Linux; U; Android 10; en-gb; Mi 9T Pro Build/QKQ1.190825.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.2', 0, '2020-07-10 03:08:24', NULL),
(33, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; U; Android 10; en-gb; Mi 9T Pro Build/QKQ1.190825.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.2', 1, '2020-07-10 03:08:46', NULL),
(34, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-13 00:31:17', NULL),
(35, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-13 00:32:06', NULL),
(36, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-13 00:58:01', NULL),
(37, 'Admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; ASUS_X00TD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 0, '2020-07-13 00:58:06', NULL),
(38, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-13 00:59:51', NULL),
(39, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-13 01:01:33', NULL),
(40, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; ASUS_X00TD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 0, '2020-07-13 01:01:42', NULL),
(41, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; ASUS_X00TD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-13 01:01:55', NULL),
(42, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; ASUS_X00TD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-13 01:02:42', NULL),
(43, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-13 04:38:41', NULL),
(44, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.61', 1, '2020-07-13 04:47:41', NULL),
(45, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.61', 1, '2020-07-13 04:48:45', NULL),
(46, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-13 20:32:12', NULL),
(47, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-13 20:41:11', NULL),
(48, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-13 20:45:21', NULL),
(49, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.61', 1, '2020-07-13 21:35:24', NULL),
(50, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-14 02:12:14', NULL),
(51, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.61', 1, '2020-07-14 04:37:17', NULL),
(52, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.61', 1, '2020-07-14 20:01:08', NULL),
(53, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-14 20:21:58', NULL),
(54, 'loclx', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-14 20:22:08', NULL),
(55, 'loclx', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-14 20:25:16', NULL),
(56, 'quanlykt', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-14 21:51:09', NULL),
(57, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.61', 1, '2020-07-15 09:04:54', NULL),
(58, 'loclx', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-15 09:05:22', NULL),
(59, 'quanlykt', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-15 10:33:37', NULL),
(60, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/87.0.152 Chrome/81.0.4044.152 Safari/537.36', 1, '2020-07-16 03:51:54', NULL),
(61, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.64', 1, '2020-07-16 06:43:53', NULL),
(62, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-16 07:41:11', NULL),
(63, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-16 08:47:10', NULL),
(64, 'quanlykt', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-16 08:54:45', NULL),
(65, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-16 08:56:23', NULL),
(66, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-16 08:57:07', NULL),
(67, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/87.0.152 Chrome/81.0.4044.152 Safari/537.36', 1, '2020-07-16 10:19:51', NULL),
(68, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-17 02:39:42', NULL),
(69, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-07-17 02:48:39', NULL),
(70, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.64', 1, '2020-07-17 02:49:51', NULL),
(71, 'admin', '14.248.80.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1, '2020-07-17 02:50:14', NULL),
(72, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/87.0.152 Chrome/81.0.4044.152 Safari/537.36', 1, '2020-07-17 03:13:36', NULL),
(73, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-17 03:17:43', NULL),
(74, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.64', 1, '2020-07-17 03:18:27', NULL),
(75, 'quanlykt', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-17 04:11:04', NULL),
(76, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-16 21:22:36', NULL),
(77, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 0, '2020-07-16 21:38:32', NULL),
(78, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-16 21:38:39', NULL),
(79, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.64', 0, '2020-07-16 21:39:06', NULL),
(80, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.64', 1, '2020-07-16 21:39:11', NULL),
(81, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.64', 1, '2020-07-16 21:45:49', NULL),
(82, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-16 21:46:28', NULL),
(83, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-16 21:46:46', NULL),
(84, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.64', 1, '2020-07-16 21:48:55', NULL),
(85, 'quanlykt', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-16 21:49:27', NULL),
(86, 'quanlykt', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-16 21:54:45', NULL),
(87, 'qlts', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-16 21:57:40', NULL),
(88, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36 Edg/83.0.478.64', 1, '2020-07-17 04:10:16', NULL),
(89, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-17 04:11:41', NULL),
(90, 'admin', '118.71.3.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0, '2020-07-18 18:50:54', NULL),
(91, 'admin', '118.71.3.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-18 18:51:25', NULL),
(92, 'admin', '113.23.6.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-19 00:21:57', NULL),
(93, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-19 21:10:40', NULL),
(94, 'admin', '113.23.6.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-20 09:05:50', NULL),
(95, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, '2020-07-20 19:06:31', NULL),
(96, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-28 01:29:47', NULL),
(97, 'admin', '27.67.45.60', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/87.0.152 Chrome/81.0.4044.152 Safari/537.36', 1, '2020-07-28 02:08:35', NULL),
(98, 'admin', '113.185.44.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-01 01:26:20', NULL),
(99, 'admin', '14.232.244.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-03 01:07:12', NULL),
(100, 'Admin', '113.185.46.53', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 0, '2020-08-03 01:11:44', NULL),
(101, 'admin', '113.185.46.53', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-08-03 01:13:22', NULL),
(102, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-04 03:46:48', NULL),
(103, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-05 01:11:20', NULL),
(104, 'admin1', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0, '2020-08-05 05:28:54', NULL),
(105, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0, '2020-08-05 05:29:03', NULL),
(106, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0, '2020-08-05 05:29:11', NULL),
(107, 'Admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0, '2020-08-05 05:29:42', NULL),
(108, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0, '2020-08-05 05:29:51', NULL),
(109, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0, '2020-08-05 05:30:24', NULL),
(110, 'admin', '1.53.37.126', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 0, '2020-08-05 05:30:31', NULL),
(111, 'admin1', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0, '2020-08-05 05:31:32', NULL),
(112, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-08-05 05:31:38', NULL),
(113, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-05 19:15:39', NULL),
(114, 'admin', '113.185.42.206', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-08-05 20:16:33', NULL),
(115, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-05 23:43:55', NULL),
(116, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-08-06 21:33:42', NULL),
(117, 'admin', '118.70.125.224', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 0, '2020-08-09 23:42:52', NULL),
(118, 'admin', '118.70.125.224', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 0, '2020-08-09 23:42:56', NULL),
(119, 'admin', '118.70.125.224', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-09 23:43:11', NULL),
(120, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-08-10 21:34:56', NULL),
(121, 'admin', '118.70.125.224', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-11 02:30:07', NULL),
(122, 'admin', '113.185.44.28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', 1, '2020-08-19 02:49:03', NULL),
(123, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', 1, '2020-08-19 18:38:10', NULL),
(124, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-08-19 23:54:17', NULL),
(125, 'admin', '14.248.80.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', 1, '2020-08-19 23:55:05', NULL),
(126, 'admin', '14.248.80.105', 'Mozilla/5.0 (Linux; Android 10; Mi 9T Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36', 1, '2020-08-20 04:19:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `created_at`, `updated_at`, `user_id`, `deleted_at`, `url`, `support_url`, `support_phone`, `support_email`, `image`) VALUES
(1, 'Manufacturer', '2020-07-01 21:51:04', '2020-07-01 21:51:04', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Dell', '2020-07-06 03:59:00', '2020-07-06 03:59:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'KOW computer', '2020-07-06 03:59:00', '2020-07-06 03:59:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Hanoicomputer', '2020-07-06 03:59:00', '2020-07-06 03:59:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Double A', '2020-07-13 04:44:28', '2020-07-13 04:44:28', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Lavie', '2020-07-13 04:44:37', '2020-07-13 04:44:37', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Apple', '2020-08-05 01:13:13', '2020-08-05 01:13:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Samsung', '2020-08-05 01:25:40', '2020-08-05 01:25:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Khác', '2020-08-20 00:47:24', '2020-08-20 00:47:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2012_12_06_225921_migration_cartalyst_sentry_install_users', 1),
(2, '2012_12_06_225929_migration_cartalyst_sentry_install_groups', 1),
(3, '2012_12_06_225945_migration_cartalyst_sentry_install_users_groups_pivot', 1),
(4, '2012_12_06_225988_migration_cartalyst_sentry_install_throttle', 1),
(5, '2013_03_23_193214_update_users_table', 1),
(6, '2013_11_13_075318_create_models_table', 1),
(7, '2013_11_13_075335_create_categories_table', 1),
(8, '2013_11_13_075347_create_manufacturers_table', 1),
(9, '2013_11_15_015858_add_user_id_to_categories', 1),
(10, '2013_11_15_112701_add_user_id_to_manufacturers', 1),
(11, '2013_11_15_190327_create_assets_table', 1),
(12, '2013_11_15_190357_create_licenses_table', 1),
(13, '2013_11_15_201848_add_license_name_to_licenses', 1),
(14, '2013_11_16_040323_create_depreciations_table', 1),
(15, '2013_11_16_042851_add_depreciation_id_to_models', 1),
(16, '2013_11_16_084923_add_user_id_to_models', 1),
(17, '2013_11_16_103258_create_locations_table', 1),
(18, '2013_11_16_103336_add_location_id_to_assets', 1),
(19, '2013_11_16_103407_add_checkedout_to_to_assets', 1),
(20, '2013_11_16_103425_create_history_table', 1),
(21, '2013_11_17_054359_drop_licenses_table', 1),
(22, '2013_11_17_054526_add_physical_to_assets', 1),
(23, '2013_11_17_055126_create_settings_table', 1),
(24, '2013_11_17_062634_add_license_to_assets', 1),
(25, '2013_11_18_134332_add_contacts_to_users', 1),
(26, '2013_11_18_142847_add_info_to_locations', 1),
(27, '2013_11_18_152942_remove_location_id_from_asset', 1),
(28, '2013_11_18_164423_set_nullvalues_for_user', 1),
(29, '2013_11_19_013337_create_asset_logs_table', 1),
(30, '2013_11_19_061409_edit_added_on_asset_logs_table', 1),
(31, '2013_11_19_062250_edit_location_id_asset_logs_table', 1),
(32, '2013_11_20_055822_add_soft_delete_on_assets', 1),
(33, '2013_11_20_121404_add_soft_delete_on_locations', 1),
(34, '2013_11_20_123137_add_soft_delete_on_manufacturers', 1),
(35, '2013_11_20_123725_add_soft_delete_on_categories', 1),
(36, '2013_11_20_130248_create_status_labels', 1),
(37, '2013_11_20_130830_add_status_id_on_assets_table', 1),
(38, '2013_11_20_131544_add_status_type_on_status_labels', 1),
(39, '2013_11_20_134103_add_archived_to_assets', 1),
(40, '2013_11_21_002321_add_uploads_table', 1),
(41, '2013_11_21_024531_remove_deployable_boolean_from_status_labels', 1),
(42, '2013_11_22_075308_add_option_label_to_settings_table', 1),
(43, '2013_11_22_213400_edits_to_settings_table', 1),
(44, '2013_11_25_013244_create_licenses_table', 1),
(45, '2013_11_25_031458_create_license_seats_table', 1),
(46, '2013_11_25_032022_add_type_to_actionlog_table', 1),
(47, '2013_11_25_033008_delete_bad_licenses_table', 1),
(48, '2013_11_25_033131_create_new_licenses_table', 1),
(49, '2013_11_25_033534_add_licensed_to_licenses_table', 1),
(50, '2013_11_25_101308_add_warrantee_to_assets_table', 1),
(51, '2013_11_25_104343_alter_warranty_column_on_assets', 1),
(52, '2013_11_25_150450_drop_parent_from_categories', 1),
(53, '2013_11_25_151920_add_depreciate_to_assets', 1),
(54, '2013_11_25_152903_add_depreciate_to_licenses_table', 1),
(55, '2013_11_26_211820_drop_license_from_assets_table', 1),
(56, '2013_11_27_062510_add_note_to_asset_logs_table', 1),
(57, '2013_12_01_113426_add_filename_to_asset_log', 1),
(58, '2013_12_06_094618_add_nullable_to_licenses_table', 1),
(59, '2013_12_10_084038_add_eol_on_models_table', 1),
(60, '2013_12_12_055218_add_manager_to_users_table', 1),
(61, '2014_01_28_031200_add_qr_code_to_settings_table', 1),
(62, '2014_02_13_183016_add_qr_text_to_settings_table', 1),
(63, '2014_05_24_093839_alter_default_license_depreciation_id', 1),
(64, '2014_05_27_231658_alter_default_values_licenses', 1),
(65, '2014_06_19_191508_add_asset_name_to_settings', 1),
(66, '2014_06_20_004847_make_asset_log_checkedout_to_nullable', 1),
(67, '2014_06_20_005050_make_asset_log_purchasedate_to_nullable', 1),
(68, '2014_06_24_003011_add_suppliers', 1),
(69, '2014_06_24_010742_add_supplier_id_to_asset', 1),
(70, '2014_06_24_012839_add_zip_to_supplier', 1),
(71, '2014_06_24_033908_add_url_to_supplier', 1),
(72, '2014_07_08_054116_add_employee_id_to_users', 1),
(73, '2014_07_09_134316_add_requestable_to_assets', 1),
(74, '2014_07_17_085822_add_asset_to_software', 1),
(75, '2014_07_17_161625_make_asset_id_in_logs_nullable', 1),
(76, '2014_08_12_053504_alpha_0_4_2_release', 1),
(77, '2014_08_17_083523_make_location_id_nullable', 1),
(78, '2014_10_16_200626_add_rtd_location_to_assets', 1),
(79, '2014_10_24_000417_alter_supplier_state_to_32', 1),
(80, '2014_10_24_015641_add_display_checkout_date', 1),
(81, '2014_10_28_222654_add_avatar_field_to_users_table', 1),
(82, '2014_10_29_045924_add_image_field_to_models_table', 1),
(83, '2014_11_01_214955_add_eol_display_to_settings', 1),
(84, '2014_11_04_231416_update_group_field_for_reporting', 1),
(85, '2014_11_05_212408_add_fields_to_licenses', 1),
(86, '2014_11_07_021042_add_image_to_supplier', 1),
(87, '2014_11_20_203007_add_username_to_user', 1),
(88, '2014_11_20_223947_add_auto_to_settings', 1),
(89, '2014_11_20_224421_add_prefix_to_settings', 1),
(90, '2014_11_21_104401_change_licence_type', 1),
(91, '2014_12_09_082500_add_fields_maintained_term_to_licenses', 1),
(92, '2015_02_04_155757_increase_user_field_lengths', 1),
(93, '2015_02_07_013537_add_soft_deleted_to_log', 1),
(94, '2015_02_10_040958_fix_bad_assigned_to_ids', 1),
(95, '2015_02_10_053310_migrate_data_to_new_statuses', 1),
(96, '2015_02_11_044104_migrate_make_license_assigned_null', 1),
(97, '2015_02_11_104406_migrate_create_requests_table', 1),
(98, '2015_02_12_001312_add_mac_address_to_asset', 1),
(99, '2015_02_12_024100_change_license_notes_type', 1),
(100, '2015_02_17_231020_add_localonly_to_settings', 1),
(101, '2015_02_19_222322_add_logo_and_colors_to_settings', 1),
(102, '2015_02_24_072043_add_alerts_to_settings', 1),
(103, '2015_02_25_022931_add_eula_fields', 1),
(104, '2015_02_25_204513_add_accessories_table', 1),
(105, '2015_02_26_091228_add_accessories_user_table', 1),
(106, '2015_02_26_115128_add_deleted_at_models', 1),
(107, '2015_02_26_233005_add_category_type', 1),
(108, '2015_03_01_231912_update_accepted_at_to_acceptance_id', 1),
(109, '2015_03_05_011929_add_qr_type_to_settings', 1),
(110, '2015_03_18_055327_add_note_to_user', 1),
(111, '2015_04_29_234704_add_slack_to_settings', 1),
(112, '2015_05_04_085151_add_parent_id_to_locations_table', 1),
(113, '2015_05_22_124421_add_reassignable_to_licenses', 1),
(114, '2015_06_10_003314_fix_default_for_user_notes', 1),
(115, '2015_06_10_003554_create_consumables', 1),
(116, '2015_06_15_183253_move_email_to_username', 1),
(117, '2015_06_23_070346_make_email_nullable', 1),
(118, '2015_06_26_213716_create_asset_maintenances_table', 1),
(119, '2015_07_04_212443_create_custom_fields_table', 1),
(120, '2015_07_09_014359_add_currency_to_settings_and_locations', 1),
(121, '2015_07_21_122022_add_expected_checkin_date_to_asset_logs', 1),
(122, '2015_07_24_093845_add_checkin_email_to_category_table', 1),
(123, '2015_07_25_055415_remove_email_unique_constraint', 1),
(124, '2015_07_29_230054_add_thread_id_to_asset_logs_table', 1),
(125, '2015_07_31_015430_add_accepted_to_assets', 1),
(126, '2015_09_09_195301_add_custom_css_to_settings', 1),
(127, '2015_09_21_235926_create_custom_field_custom_fieldset', 1),
(128, '2015_09_22_000104_create_custom_fieldsets', 1),
(129, '2015_09_22_003321_add_fieldset_id_to_assets', 1),
(130, '2015_09_22_003413_migrate_mac_address', 1),
(131, '2015_09_28_003314_fix_default_purchase_order', 1),
(132, '2015_10_01_024551_add_accessory_consumable_price_info', 1),
(133, '2015_10_12_192706_add_brand_to_settings', 1),
(134, '2015_10_22_003314_fix_defaults_accessories', 1),
(135, '2015_10_23_182625_add_checkout_time_and_expected_checkout_date_to_assets', 1),
(136, '2015_11_05_061015_create_companies_table', 1),
(137, '2015_11_05_061115_add_company_id_to_consumables_table', 1),
(138, '2015_11_05_183749_image', 1),
(139, '2015_11_06_092038_add_company_id_to_accessories_table', 1),
(140, '2015_11_06_100045_add_company_id_to_users_table', 1),
(141, '2015_11_06_134742_add_company_id_to_licenses_table', 1),
(142, '2015_11_08_035832_add_company_id_to_assets_table', 1),
(143, '2015_11_08_222305_add_ldap_fields_to_settings', 1),
(144, '2015_11_15_151803_add_full_multiple_companies_support_to_settings_table', 1),
(145, '2015_11_26_195528_import_ldap_settings', 1),
(146, '2015_11_30_191504_remove_fk_company_id', 1),
(147, '2015_12_21_193006_add_ldap_server_cert_ignore_to_settings_table', 1),
(148, '2015_12_30_233509_add_timestamp_and_userId_to_custom_fields', 1),
(149, '2015_12_30_233658_add_timestamp_and_userId_to_custom_fieldsets', 1),
(150, '2016_01_28_041048_add_notes_to_models', 1),
(151, '2016_02_19_070119_add_remember_token_to_users_table', 1),
(152, '2016_02_19_073625_create_password_resets_table', 1),
(153, '2016_03_02_193043_add_ldap_flag_to_users', 1),
(154, '2016_03_02_220517_update_ldap_filter_to_longer_field', 1),
(155, '2016_03_08_225351_create_components_table', 1),
(156, '2016_03_09_024038_add_min_stock_to_tables', 1),
(157, '2016_03_10_133849_add_locale_to_users', 1),
(158, '2016_03_10_135519_add_locale_to_settings', 1),
(159, '2016_03_11_185621_add_label_settings_to_settings', 1),
(160, '2016_03_22_125911_fix_custom_fields_regexes', 1),
(161, '2016_04_28_141554_add_show_to_users', 1),
(162, '2016_05_16_164733_add_model_mfg_to_consumable', 1),
(163, '2016_05_19_180351_add_alt_barcode_settings', 1),
(164, '2016_05_19_191146_add_alter_interval', 1),
(165, '2016_05_19_192226_add_inventory_threshold', 1),
(166, '2016_05_20_024859_remove_option_keys_from_settings_table', 1),
(167, '2016_05_20_143758_remove_option_value_from_settings_table', 1),
(168, '2016_06_01_140218_add_email_domain_and_format_to_settings', 1),
(169, '2016_06_22_160725_add_user_id_to_maintenances', 1),
(170, '2016_07_13_150015_add_is_ad_to_settings', 1),
(171, '2016_07_14_153609_add_ad_domain_to_settings', 1),
(172, '2016_07_22_003348_fix_custom_fields_regex_stuff', 1),
(173, '2016_07_22_054850_one_more_mac_addr_fix', 1),
(174, '2016_07_22_143045_add_port_to_ldap_settings', 1),
(175, '2016_07_22_153432_add_tls_to_ldap_settings', 1),
(176, '2016_07_27_211034_add_zerofill_to_settings', 1),
(177, '2016_08_02_124944_add_color_to_statuslabel', 1),
(178, '2016_08_04_134500_add_disallow_ldap_pw_sync_to_settings', 1),
(179, '2016_08_09_002225_add_manufacturer_to_licenses', 1),
(180, '2016_08_12_121613_add_manufacturer_to_accessories_table', 1),
(181, '2016_08_23_143353_add_new_fields_to_custom_fields', 1),
(182, '2016_08_23_145619_add_show_in_nav_to_status_labels', 1),
(183, '2016_08_30_084634_make_purchase_cost_nullable', 1),
(184, '2016_09_01_141051_add_requestable_to_asset_model', 1),
(185, '2016_09_02_001448_create_checkout_requests_table', 1),
(186, '2016_09_04_180400_create_actionlog_table', 1),
(187, '2016_09_04_182149_migrate_asset_log_to_action_log', 1),
(188, '2016_09_19_235935_fix_fieldtype_for_target_type', 1),
(189, '2016_09_23_140722_fix_modelno_in_consumables_to_string', 1),
(190, '2016_09_28_231359_add_company_to_logs', 1),
(191, '2016_10_14_130709_fix_order_number_to_varchar', 1),
(192, '2016_10_16_015024_rename_modelno_to_model_number', 1),
(193, '2016_10_16_015211_rename_consumable_modelno_to_model_number', 1),
(194, '2016_10_16_143235_rename_model_note_to_notes', 1),
(195, '2016_10_16_165052_rename_component_total_qty_to_qty', 1),
(196, '2016_10_19_145520_fix_order_number_in_components_to_string', 1),
(197, '2016_10_27_151715_add_serial_to_components', 1),
(198, '2016_10_27_213251_increase_serial_field_capacity', 1),
(199, '2016_10_29_002724_enable_2fa_fields', 1),
(200, '2016_10_29_082408_add_signature_to_acceptance', 1),
(201, '2016_11_01_030818_fix_forgotten_filename_in_action_logs', 1),
(202, '2016_11_13_020954_rename_component_serial_number_to_serial', 1),
(203, '2016_11_16_172119_increase_purchase_cost_size', 1),
(204, '2016_11_17_161317_longer_state_field_in_location', 1),
(205, '2016_11_17_193706_add_model_number_to_accessories', 1),
(206, '2016_11_24_160405_add_missing_target_type_to_logs_table', 1),
(207, '2016_12_07_173720_increase_size_of_state_in_suppliers', 1),
(208, '2016_12_19_004212_adjust_locale_length_to_10', 1),
(209, '2016_12_19_133936_extend_phone_lengths_in_supplier_and_elsewhere', 1),
(210, '2016_12_27_212631_make_asset_assigned_to_polymorphic', 1),
(211, '2017_01_09_040429_create_locations_ldap_query_field', 1),
(212, '2017_01_14_002418_create_imports_table', 1),
(213, '2017_01_25_063357_fix_utf8_custom_field_column_names', 1),
(214, '2017_03_03_154632_add_time_date_display_to_settings', 1),
(215, '2017_03_10_210807_add_fields_to_manufacturer', 1),
(216, '2017_05_08_195520_increase_size_of_field_values_in_custom_fields', 1),
(217, '2017_05_22_204422_create_departments', 1),
(218, '2017_05_22_233509_add_manager_to_locations_table', 1),
(219, '2017_06_14_122059_add_next_autoincrement_to_settings', 1),
(220, '2017_06_18_151753_add_header_and_first_row_to_importer_table', 1),
(221, '2017_07_07_191533_add_login_text', 1),
(222, '2017_07_25_130710_add_thumbsize_to_settings', 1),
(223, '2017_08_03_160105_set_asset_archived_to_zero_default', 1),
(224, '2017_08_22_180636_add_secure_password_options', 1),
(225, '2017_08_25_074822_add_auditing_tables', 1),
(226, '2017_08_25_101435_add_auditing_to_settings', 1),
(227, '2017_09_18_225619_fix_assigned_type_not_being_nulled', 1),
(228, '2017_10_03_015503_drop_foreign_keys', 1),
(229, '2017_10_10_123504_allow_nullable_depreciation_id_in_models', 1),
(230, '2017_10_17_133709_add_display_url_to_settings', 1),
(231, '2017_10_19_120002_add_custom_forgot_password_url', 1),
(232, '2017_10_19_130406_add_image_and_supplier_to_accessories', 1),
(233, '2017_10_20_234129_add_location_indices_to_assets', 1),
(234, '2017_10_25_202930_add_images_uploads_to_locations_manufacturers_etc', 1),
(235, '2017_10_27_180947_denorm_asset_locations', 1),
(236, '2017_10_27_192423_migrate_denormed_asset_locations', 1),
(237, '2017_10_30_182938_add_address_to_user', 1),
(238, '2017_11_08_025918_add_alert_menu_setting', 1),
(239, '2017_11_08_123942_labels_display_company_name', 1),
(240, '2017_12_12_010457_normalize_asset_last_audit_date', 1),
(241, '2017_12_12_033618_add_actionlog_meta', 1),
(242, '2017_12_26_170856_re_normalize_last_audit', 1),
(243, '2018_01_17_184354_add_archived_in_list_setting', 1),
(244, '2018_01_19_203121_add_dashboard_message_to_settings', 1),
(245, '2018_01_24_062633_add_footer_settings_to_settings', 1),
(246, '2018_01_24_093426_add_modellist_preferenc', 1),
(247, '2018_02_22_160436_add_remote_user_settings', 1),
(248, '2018_03_03_011032_add_theme_to_settings', 1),
(249, '2018_03_06_054937_add_default_flag_on_statuslabels', 1),
(250, '2018_03_23_212048_add_display_in_email_to_custom_fields', 1),
(251, '2018_03_24_030738_add_show_images_in_email_setting', 1),
(252, '2018_03_24_050108_add_cc_alerts', 1),
(253, '2018_03_29_053618_add_canceled_at_and_fulfilled_at_in_requests', 1),
(254, '2018_03_29_070121_add_drop_unique_requests', 1),
(255, '2018_03_29_070511_add_new_index_requestable', 1),
(256, '2018_04_02_150700_labels_display_model_name', 1),
(257, '2018_04_16_133902_create_custom_field_default_values_table', 1),
(258, '2018_05_04_073223_add_category_to_licenses', 1),
(259, '2018_05_04_075235_add_update_license_category', 1),
(260, '2018_05_08_031515_add_gdpr_privacy_footer', 1),
(261, '2018_05_14_215229_add_indexes', 1),
(262, '2018_05_14_223646_add_indexes_to_assets', 1),
(263, '2018_05_14_233638_denorm_counters_on_assets', 1),
(264, '2018_05_16_153409_add_first_counter_totals_to_assets', 1),
(265, '2018_06_21_134622_add_version_footer', 1),
(266, '2018_07_05_215440_add_unique_serial_option_to_settings', 1),
(267, '2018_07_17_005911_create_login_attempts_table', 1),
(268, '2018_07_24_154348_add_logo_to_print_assets', 1),
(269, '2019_02_14_154310_change_auto_increment_prefix_to_nullable', 1),
(270, '2019_02_16_143518_auto_increment_back_to_string', 1),
(271, '2019_02_20_234421_make_serial_nullable', 1),
(272, '2019_02_21_224703_make_fields_nullable_for_integrity', 1),
(273, '2019_06_12_184327_rename_groups_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `requestable` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `name`, `model_number`, `manufacturer_id`, `category_id`, `created_at`, `updated_at`, `depreciation_id`, `user_id`, `eol`, `image`, `deprecated_mac_address`, `deleted_at`, `fieldset_id`, `notes`, `requestable`) VALUES
(1, 'Thanhcong', 'sfbf', 1, 2, '2020-07-01 21:55:08', '2020-07-13 04:42:09', NULL, NULL, NULL, NULL, 0, '2020-07-13 04:42:09', NULL, NULL, 0),
(2, 'Bản tin pháp luật', 'sfbf', 1, 2, '2020-07-01 21:56:09', '2020-07-13 04:42:09', NULL, NULL, NULL, NULL, 0, '2020-07-13 04:42:09', NULL, NULL, 0),
(3, 'Laptop Dell Vostro', NULL, 2, 3, '2020-07-06 03:59:00', '2020-08-05 01:26:25', 4, 1, 0, NULL, 0, NULL, NULL, NULL, 0),
(4, 'Laptop Dell Inspiron', NULL, 2, 3, '2020-07-06 03:59:00', '2020-08-05 01:26:34', 4, 1, 0, NULL, 0, NULL, NULL, NULL, 0),
(5, 'Laptop Dell XPS', NULL, 2, 3, '2020-07-06 03:59:00', '2020-08-05 01:26:14', 5, 1, 0, NULL, 0, NULL, NULL, NULL, 0),
(6, 'PC High-end', NULL, 3, 4, '2020-07-06 03:59:00', '2020-08-05 01:26:45', 6, 1, 0, NULL, 0, NULL, NULL, NULL, 0),
(7, 'PC văn phòng', NULL, 4, 4, '2020-07-06 03:59:00', '2020-08-05 01:26:56', 5, 1, 0, NULL, 0, NULL, NULL, NULL, 1),
(8, 'Chuột máy tính', NULL, 2, 3, '2020-07-13 20:39:05', '2020-07-13 20:39:23', NULL, 1, 0, NULL, 0, '2020-07-13 20:39:23', NULL, NULL, 0),
(9, 'IphoneX', NULL, 7, 13, '2020-08-05 01:25:18', '2020-08-05 01:25:18', 3, 1, 0, NULL, 0, NULL, NULL, NULL, 0),
(10, 'Samsung S10', NULL, 8, 13, '2020-08-05 01:25:48', '2020-08-05 01:25:48', 3, 1, 0, NULL, 0, NULL, NULL, NULL, 0),
(11, 'Laptop cũ', NULL, 9, 3, '2020-08-20 00:47:31', '2020-08-20 00:47:31', NULL, 1, 0, NULL, 0, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `models_custom_fields`
--

CREATE TABLE `models_custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_model_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `default_value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requested_assets`
--

CREATE TABLE `requested_assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `denied_at` datetime DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `request_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `logo_print_assets` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `user_id`, `per_page`, `site_name`, `qr_code`, `qr_text`, `display_asset_name`, `display_checkout_date`, `display_eol`, `auto_increment_assets`, `auto_increment_prefix`, `load_remote`, `logo`, `header_color`, `alert_email`, `alerts_enabled`, `default_eula_text`, `barcode_type`, `slack_endpoint`, `slack_channel`, `slack_botname`, `default_currency`, `custom_css`, `brand`, `ldap_enabled`, `ldap_server`, `ldap_uname`, `ldap_pword`, `ldap_basedn`, `ldap_filter`, `ldap_username_field`, `ldap_lname_field`, `ldap_fname_field`, `ldap_auth_filter_query`, `ldap_version`, `ldap_active_flag`, `ldap_emp_num`, `ldap_email`, `full_multiple_companies_support`, `ldap_server_cert_ignore`, `locale`, `labels_per_page`, `labels_width`, `labels_height`, `labels_pmargin_left`, `labels_pmargin_right`, `labels_pmargin_top`, `labels_pmargin_bottom`, `labels_display_bgutter`, `labels_display_sgutter`, `labels_fontsize`, `labels_pagewidth`, `labels_pageheight`, `labels_display_name`, `labels_display_serial`, `labels_display_tag`, `alt_barcode`, `alt_barcode_enabled`, `alert_interval`, `alert_threshold`, `email_domain`, `email_format`, `username_format`, `is_ad`, `ad_domain`, `ldap_port`, `ldap_tls`, `zerofill_count`, `ldap_pw_sync`, `two_factor_enabled`, `require_accept_signature`, `date_display_format`, `time_display_format`, `next_auto_tag_base`, `login_note`, `thumbnail_max_h`, `pwd_secure_uncommon`, `pwd_secure_complexity`, `pwd_secure_min`, `audit_interval`, `audit_warning_days`, `show_url_in_emails`, `custom_forgot_pass_url`, `show_alerts_in_menu`, `labels_display_company_name`, `show_archived_in_list`, `dashboard_message`, `support_footer`, `footer_text`, `modellist_displays`, `login_remote_user_enabled`, `login_common_disabled`, `login_remote_user_custom_logout_url`, `skin`, `show_images_in_email`, `admin_cc_email`, `labels_display_model`, `privacy_policy_link`, `version_footer`, `unique_serial`, `logo_print_assets`) VALUES
(1, '2020-06-30 20:53:30', '2020-08-10 21:35:46', 1, 20, 'QR CODE SOLUTION - QUẢN LÝ TÀI SẢN', 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 'logo.png', '#0b75aa', 'phucnx@miraway.vn', 1, NULL, 'QRCODE', NULL, NULL, NULL, '‎', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'samaccountname', 'sn', 'givenname', 'uid=samaccountname', 3, NULL, NULL, NULL, 0, 0, 'vi', 30, '2.00000', '1.00000', '0.30000', '0.30000', '0.30000', '0.30000', '0.05000', '0.05000', 14, '4.30000', '39.00000', 0, 0, 1, 'C128', 1, 30, 5, 'miraway.vn', 'filastname', 'filastname', 0, NULL, '389', 0, 5, 1, NULL, 0, 'd/m/Y', 'H:i', 22, NULL, 50, 0, '', 6, NULL, 1, 0, NULL, 1, 0, 1, NULL, 'off', '**```Cung cấp bởi Miraway```**', 'image,category,manufacturer', 0, 0, '', 'blue', 1, 'mediatozi@gmail.com', 1, NULL, 'off', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `status_labels`
--

CREATE TABLE `status_labels` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `default_label` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_labels`
--

INSERT INTO `status_labels` (`id`, `name`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `deployable`, `pending`, `archived`, `notes`, `color`, `show_in_nav`, `default_label`) VALUES
(1, 'Đang xử lý', 1, NULL, '2020-07-16 08:09:31', NULL, 0, 1, 0, 'These assets are not yet ready to be deployed, usually because of configuration or waiting on parts.', NULL, 0, 0),
(2, 'Cho phép cấp phát', 1, NULL, '2020-07-19 21:13:33', NULL, 1, 0, 0, 'These assets are ready to deploy.', NULL, 0, 0),
(3, 'Lưu trữ', 1, NULL, '2020-07-16 08:09:18', NULL, 0, 0, 1, 'These assets are no longer in circulation or viable.', NULL, 0, 0),
(4, 'Sản phẩm khác', NULL, '2020-07-01 21:49:36', '2020-07-01 21:49:36', NULL, 1, 0, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `address`, `address2`, `city`, `state`, `country`, `phone`, `fax`, `email`, `contact`, `notes`, `created_at`, `updated_at`, `user_id`, `deleted_at`, `zip`, `url`, `image`) VALUES
(1, 'Sửa chữa laptop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-20 02:32:08', '2020-08-20 02:32:08', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `company_id` int(10) UNSIGNED DEFAULT NULL,
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
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `permissions`, `activated`, `activation_code`, `activated_at`, `last_login`, `persist_code`, `reset_password_code`, `first_name`, `last_name`, `created_at`, `updated_at`, `deleted_at`, `website`, `country`, `gravatar`, `location_id`, `phone`, `jobtitle`, `manager_id`, `employee_num`, `avatar`, `username`, `notes`, `company_id`, `remember_token`, `ldap_import`, `locale`, `show_in_list`, `two_factor_secret`, `two_factor_enrolled`, `two_factor_optin`, `department_id`, `address`, `city`, `state`, `zip`) VALUES
(1, 'thanhcong1710@gmail.com', '$2y$10$ZVchaXwEsV3iJSyeNALiGO1RaFMYtIuHxyl47PSAxBgClINjvSLay', '{\"superuser\":1}', 1, NULL, NULL, '2020-08-19 23:54:17', NULL, NULL, 'Admin', ' ', '2020-06-30 20:53:30', '2020-08-19 23:54:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, '9tq6tpg73PdaZIwj93g9lZaHjIMImFzQNVfvbWP7hlr6TdEEWsQHpAkEnJwn', 0, 'vi', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(2, 'quangnd@miraway.vn', '$2y$10$YQThBvGlaSlpnq0CJEVAd.eHwM5RZqVdJuxnEm7C6nCMx1mNIlHNi', '{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Nghiêm Đức', 'Quang', '2020-07-08 04:11:51', '2020-07-14 21:45:56', NULL, NULL, 'VN', NULL, 2, '0941118338', 'Chuyên viên Sale', 4, '00015', NULL, 'Quangnd01', NULL, 1, NULL, 0, 'vi', 1, NULL, 0, 0, 2, '14 Pháo Đài Láng', 'Hà Nội', NULL, NULL),
(3, 'loclx@miraway.vn', '$2y$10$N2IJT0Unk8.JixaIbTbj0uBIaYcW6HChPbUyUuaumw2wMzc9f0SvC', '{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"1\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, '2020-07-15 09:05:22', NULL, NULL, 'Lê Xuân Lộc', NULL, '2020-07-14 20:21:52', '2020-07-15 09:05:22', NULL, NULL, 'VN', NULL, NULL, NULL, 'Chuyên viên Kỹ thuật', 5, NULL, NULL, 'loclx', NULL, 1, 'WGpgeaDvTAaNhwLn5OcPADQ7iNoiWV4PhrntlifmTUrxgCG9lpGIKT7cQGoZ', 0, NULL, 1, NULL, 0, 0, 5, NULL, NULL, NULL, NULL),
(4, NULL, '$2y$10$Aa9omezoSp.XbPnBvXfW0.PdyMzqzmWixpYfWhGLb/37yDB3Mx.4a', '{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"1\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"1\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"1\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"1\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"1\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"1\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"1\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"1\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"1\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Quản lý Kinh doanh', NULL, '2020-07-14 21:44:57', '2020-07-14 21:50:09', NULL, NULL, NULL, NULL, NULL, NULL, 'Quản lý', NULL, NULL, NULL, 'quanlykd', NULL, 1, NULL, 0, NULL, 1, NULL, 0, 0, 2, NULL, NULL, NULL, NULL),
(5, NULL, '$2y$10$Z6.lvbUWNTeuP6pWM2jC1evDdX/QCN.GN7jezzRK54wGP07bPnXbu', '{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"1\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"1\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"1\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"1\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"1\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, '2020-07-16 21:54:45', NULL, NULL, 'Quản lý Kỹ thuật ', NULL, '2020-07-14 21:46:36', '2020-07-16 21:54:45', NULL, NULL, NULL, NULL, NULL, NULL, 'Quản lý', NULL, NULL, NULL, 'quanlykt', NULL, NULL, '5oNSyjZabfPqR8rWSAkdfQnMEkytGq2sxl06er7tXZZrc3D9aV8GAsFMx8Bt', 0, NULL, 1, NULL, 0, 0, 5, NULL, NULL, NULL, NULL),
(6, NULL, '$2y$10$jWFe80b1a6b5R7lGGNfu5uzZk3BlimHiKRknWmyRmUmle8NpNp4ti', '{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"1\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Tài khoản chung', NULL, '2020-07-14 21:48:44', '2020-07-14 21:48:57', NULL, NULL, NULL, NULL, NULL, NULL, 'Tài khoản chung', 1, NULL, NULL, 'xemtaisan', NULL, NULL, NULL, 0, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(7, '', '$2y$10$qlaE0167KOctVI2.dNR82.mOWow8Wm//ZCV6SQ/9Q5741pi4ot2Ui', '{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, NULL, NULL, NULL, 'QTLS', NULL, '2020-07-16 21:52:13', '2020-07-16 21:52:38', '2020-07-16 21:52:38', NULL, 'VN', NULL, NULL, NULL, 'Quản lý tài sản', NULL, NULL, NULL, 'qlts', NULL, 1, NULL, 0, 'vi', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(8, NULL, '$2y$10$WiZa.5njU5HrfqUKhLWayu9Dk8RSQkmcX1Qx/lZ1QPodYIl.iiUUu', '{\"superuser\":\"-1\",\"admin\":\"1\",\"import\":\"-1\",\"reports.view\":\"1\",\"assets.view\":\"1\",\"assets.create\":\"1\",\"assets.edit\":\"1\",\"assets.delete\":\"1\",\"assets.checkin\":\"1\",\"assets.checkout\":\"1\",\"assets.audit\":\"1\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"1\",\"accessories.create\":\"1\",\"accessories.edit\":\"1\",\"accessories.delete\":\"1\",\"accessories.checkout\":\"1\",\"accessories.checkin\":\"1\",\"consumables.view\":\"1\",\"consumables.create\":\"1\",\"consumables.edit\":\"1\",\"consumables.delete\":\"1\",\"consumables.checkout\":\"1\",\"licenses.view\":\"1\",\"licenses.create\":\"1\",\"licenses.edit\":\"1\",\"licenses.delete\":\"1\",\"licenses.checkout\":\"1\",\"licenses.keys\":\"1\",\"components.view\":\"1\",\"components.create\":\"1\",\"components.edit\":\"1\",\"components.delete\":\"1\",\"components.checkout\":\"1\",\"components.checkin\":\"1\",\"users.view\":\"1\",\"users.create\":\"1\",\"users.edit\":\"1\",\"users.delete\":\"1\",\"models.view\":\"1\",\"models.create\":\"1\",\"models.edit\":\"1\",\"models.delete\":\"1\",\"categories.view\":\"1\",\"categories.create\":\"1\",\"categories.edit\":\"1\",\"categories.delete\":\"1\",\"departments.view\":\"1\",\"departments.create\":\"1\",\"departments.edit\":\"1\",\"departments.delete\":\"1\",\"statuslabels.view\":\"1\",\"statuslabels.create\":\"1\",\"statuslabels.edit\":\"1\",\"statuslabels.delete\":\"1\",\"customfields.view\":\"1\",\"customfields.create\":\"1\",\"customfields.edit\":\"1\",\"customfields.delete\":\"1\",\"suppliers.view\":\"1\",\"suppliers.create\":\"1\",\"suppliers.edit\":\"1\",\"suppliers.delete\":\"1\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"1\",\"manufacturers.edit\":\"1\",\"manufacturers.delete\":\"1\",\"depreciations.view\":\"1\",\"depreciations.create\":\"1\",\"depreciations.edit\":\"1\",\"depreciations.delete\":\"1\",\"locations.view\":\"1\",\"locations.create\":\"1\",\"locations.edit\":\"1\",\"locations.delete\":\"1\",\"companies.view\":\"1\",\"companies.create\":\"1\",\"companies.edit\":\"1\",\"companies.delete\":\"1\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, '2020-07-16 21:57:41', NULL, NULL, 'Quản lý demo', NULL, '2020-07-16 21:53:37', '2020-07-16 23:50:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'qlts', NULL, 1, NULL, 0, 'en', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accessories_users`
--
ALTER TABLE `accessories_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `action_logs`
--
ALTER TABLE `action_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_logs_thread_id_index` (`thread_id`),
  ADD KEY `action_logs_target_id_target_type_index` (`target_id`,`target_type`),
  ADD KEY `action_logs_created_at_index` (`created_at`),
  ADD KEY `action_logs_item_type_item_id_action_type_index` (`item_type`,`item_id`,`action_type`),
  ADD KEY `action_logs_target_type_target_id_action_type_index` (`target_type`,`target_id`,`action_type`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_rtd_location_id_index` (`rtd_location_id`),
  ADD KEY `assets_assigned_type_assigned_to_index` (`assigned_type`,`assigned_to`),
  ADD KEY `assets_created_at_index` (`created_at`),
  ADD KEY `assets_deleted_at_status_id_index` (`deleted_at`,`status_id`),
  ADD KEY `assets_deleted_at_model_id_index` (`deleted_at`,`model_id`),
  ADD KEY `assets_deleted_at_assigned_type_assigned_to_index` (`deleted_at`,`assigned_type`,`assigned_to`),
  ADD KEY `assets_deleted_at_supplier_id_index` (`deleted_at`,`supplier_id`),
  ADD KEY `assets_deleted_at_location_id_index` (`deleted_at`,`location_id`),
  ADD KEY `assets_deleted_at_rtd_location_id_index` (`deleted_at`,`rtd_location_id`),
  ADD KEY `assets_deleted_at_asset_tag_index` (`deleted_at`,`asset_tag`),
  ADD KEY `assets_deleted_at_name_index` (`deleted_at`,`name`);

--
-- Indexes for table `asset_logs`
--
ALTER TABLE `asset_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_maintenances`
--
ALTER TABLE `asset_maintenances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_uploads`
--
ALTER TABLE `asset_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkout_requests`
--
ALTER TABLE `checkout_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkout_requests_user_id_requestable_id_requestable_type` (`user_id`,`requestable_id`,`requestable_type`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_name_unique` (`name`);

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `components_assets`
--
ALTER TABLE `components_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumables`
--
ALTER TABLE `consumables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumables_users`
--
ALTER TABLE `consumables_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fieldsets`
--
ALTER TABLE `custom_fieldsets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `depreciations`
--
ALTER TABLE `depreciations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `license_seats`
--
ALTER TABLE `license_seats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models_custom_fields`
--
ALTER TABLE `models_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requested_assets`
--
ALTER TABLE `requested_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_labels`
--
ALTER TABLE `status_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_activation_code_index` (`activation_code`),
  ADD KEY `users_reset_password_code_index` (`reset_password_code`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accessories_users`
--
ALTER TABLE `accessories_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `action_logs`
--
ALTER TABLE `action_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `asset_logs`
--
ALTER TABLE `asset_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_maintenances`
--
ALTER TABLE `asset_maintenances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `asset_uploads`
--
ALTER TABLE `asset_uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `checkout_requests`
--
ALTER TABLE `checkout_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `components`
--
ALTER TABLE `components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `components_assets`
--
ALTER TABLE `components_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `consumables`
--
ALTER TABLE `consumables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `consumables_users`
--
ALTER TABLE `consumables_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_fieldsets`
--
ALTER TABLE `custom_fieldsets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `depreciations`
--
ALTER TABLE `depreciations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `license_seats`
--
ALTER TABLE `license_seats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `models_custom_fields`
--
ALTER TABLE `models_custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requested_assets`
--
ALTER TABLE `requested_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `status_labels`
--
ALTER TABLE `status_labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
