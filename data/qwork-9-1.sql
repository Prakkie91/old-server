-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 02, 2017 at 03:36 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qwork`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_groups`
--

CREATE TABLE `admin_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_groups`
--

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES
(1, 'webmaster', 'Webmaster'),
(2, 'admin', 'Administrator'),
(3, 'manager', 'Manager'),
(4, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_attempts`
--

CREATE TABLE `admin_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES
(1, '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, NULL, NULL, NULL, NULL, NULL, 1451900190, 1502455636, 1, 'Webmaster', ''),
(2, '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, NULL, 1451900228, 1496453429, 1, 'Admin', ''),
(3, '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, 1451900430, 1465489585, 1, 'Manager', ''),
(4, '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, 1451900439, 1465489590, 1, 'Staff', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_users_groups`
--

CREATE TABLE `admin_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_users_groups`
--

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `api_access`
--

CREATE TABLE `api_access` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, 'anonymous', 1, 1, 0, NULL, 1463388382);

-- --------------------------------------------------------

--
-- Table structure for table `api_limits`
--

CREATE TABLE `api_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `jorders`
--

CREATE TABLE `jorders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(256) NOT NULL,
  `sales_person` varchar(256) NOT NULL,
  `job_type` varchar(256) NOT NULL,
  `design_number` varchar(256) NOT NULL,
  `artwork` varchar(256) NOT NULL,
  `details` varchar(256) NOT NULL,
  `receipt_number` varchar(256) NOT NULL,
  `collection_date` varchar(256) NOT NULL,
  `total_number_of_items` varchar(256) NOT NULL,
  `created_on` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jorders`
--

INSERT INTO `jorders` (`id`, `customer_name`, `sales_person`, `job_type`, `design_number`, `artwork`, `details`, `receipt_number`, `collection_date`, `total_number_of_items`, `created_on`) VALUES
(1, '321', 'sdfsdf', 'werwer', 'sdfw3', 'dfsdf', 'sdf', 'sdfsdf', 'wer', 'sdfs', 0),
(2, '321', 'sdfsdf', 'werwer', 'sdfw3', 'dfsdf', 'sdf', 'sdfsdf', 'wer', 'sdfs', 0),
(3, 'sdf', 'sdf', 'Job_A', '234', 'wet', 're', '234', '2007-08-20', 'werewr', 0),
(4, 'sdf', 'sdf', 'Job_A', '234', 'sdf', 'sdf', '34', '2012-08-20', '234', 1503249167),
(5, 'sdfsdf', 'sdfsdf', 'Job_C', '234234', 'sdfsdf', 'sdfsdf', '234234', '2017-08-01', '23', 1503306119),
(6, 'sdfsdf', 'sdfsdf', 'Job_C', '234234', 'sdfsdf', 'sdfsdf', '234234', '2017-08-01', '23', 1503306148),
(7, 'sdfsdf', 'sdfsdf', 'Job_C', '234234', 'sdfsdf', 'sdfsdf', '234234', '2017-08-01', '23', 1503306151),
(8, '321', 'sdfsdf', 'werwer', 'sdfw3', 'dfsdf', 'sdf', 'sdfsdf', 'wer', 'sdfs', 1503310222);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_ids` varchar(256) NOT NULL,
  `message` varchar(256) NOT NULL,
  `n_sent` tinyint(4) NOT NULL DEFAULT '0',
  `n_read` tinyint(4) NOT NULL DEFAULT '0',
  `type` enum('message','cutting_time','remove','review','join','left') NOT NULL DEFAULT 'message',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES
(1213, 45, '47', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-29 17:16:46'),
(1214, 45, '47', 'Please leave your review', 1, 0, 'review', 510, '2017-08-29 17:16:01'),
(1215, 364, '45', ' has joined your queue in position 1', 1, 0, 'join', 0, '2017-08-29 19:42:16'),
(1216, 45, '364', 'Please leave your review', 1, 0, 'review', 511, '2017-08-29 19:42:46'),
(1217, 364, '45', ' has joined your queue in position 4', 1, 0, 'join', 0, '2017-08-30 07:41:46'),
(1218, 45, '376', 'Please leave your review', 1, 0, 'review', 512, '2017-08-30 07:42:46'),
(1219, 45, '377', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 07:43:01'),
(1220, 45, '378', 'You are now 2nd in the queue. Estimation: 21 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 07:43:16'),
(1221, 45, '364', 'You are now 3rd in the queue. Estimation: 42 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 07:43:31'),
(1222, 45, '377', 'Please leave your review', 1, 0, 'review', 513, '2017-08-30 07:43:46'),
(1223, 45, '378', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 07:44:01'),
(1224, 45, '364', 'You are now 2nd in the queue. Estimation: 21 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 07:44:16'),
(1225, 45, '378', 'Please leave your review', 1, 0, 'review', 514, '2017-08-30 07:44:31'),
(1226, 45, '364', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 07:44:46'),
(1227, 45, '364', 'Please leave your review', 1, 0, 'review', 515, '2017-08-30 07:45:01'),
(1228, 234, '45', 'Jonny Hopkins has joined your queue in position 1', 1, 0, 'join', 0, '2017-08-30 11:04:31'),
(1229, 45, '234', 'Please leave your review', 1, 0, 'review', 516, '2017-08-30 11:05:01'),
(1230, 234, '45', 'Jonny Hopkins has joined your queue in position 4', 1, 0, 'join', 0, '2017-08-30 11:08:46'),
(1231, 45, '380', 'Please leave your review', 1, 0, 'review', 517, '2017-08-30 11:09:31'),
(1232, 45, '381', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 11:09:46'),
(1233, 45, '382', 'You are now 2nd in the queue. Estimation: 21 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 11:10:01'),
(1234, 45, '234', 'You are now 3rd in the queue. Estimation: 42 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 11:10:16'),
(1235, 45, '381', 'Please leave your review', 1, 0, 'review', 518, '2017-08-30 11:11:01'),
(1236, 45, '382', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 11:11:16'),
(1237, 45, '234', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 11:11:31'),
(1238, 45, '382', 'Please leave your review', 1, 0, 'review', 519, '2017-08-30 11:15:01'),
(1239, 45, '234', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 11:15:16'),
(1240, 45, '234', 'Please leave your review', 1, 0, 'review', 520, '2017-08-30 11:18:16'),
(1241, 234, '45', 'Jonny Hopkins has joined your queue in position 3', 1, 0, 'join', 0, '2017-08-30 11:20:01'),
(1242, 45, '383', 'Please leave your review', 1, 0, 'review', 521, '2017-08-30 11:21:01'),
(1243, 45, '384', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 11:21:16'),
(1244, 45, '234', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 11:21:31'),
(1245, 45, '384', 'Please leave your review', 1, 0, 'review', 522, '2017-08-30 11:22:16'),
(1246, 45, '234', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 11:22:31'),
(1247, 386, '282', 'jayjay.24@hotmail.com has joined your queue in position 1', 1, 0, 'join', 0, '2017-08-30 14:40:01'),
(1248, 363, '45', 'Qwork Barber app has joined your queue in position 2', 1, 0, 'join', 0, '2017-08-30 14:54:31'),
(1249, 45, '234', 'Please leave your review', 1, 0, 'review', 523, '2017-08-30 14:56:16'),
(1250, 45, '363', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 14:56:31'),
(1251, 45, '387', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 14:56:46'),
(1252, 45, '363', 'Please leave your review', 1, 0, 'review', 525, '2017-08-30 15:02:01'),
(1253, 45, '387', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 15:02:16'),
(1254, 45, '388', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 15:02:31'),
(1255, 363, '45', 'Qwork Barber app has joined your queue in position 4', 1, 0, 'join', 0, '2017-08-30 15:04:46'),
(1256, 45, '387', 'Please leave your review', 1, 0, 'review', 526, '2017-08-30 15:05:31'),
(1257, 45, '388', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 15:05:46'),
(1258, 45, '389', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 15:06:01'),
(1259, 45, '363', 'You are now 3rd in the queue. Estimation: 40 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 15:06:16'),
(1260, 45, '388', 'Please leave your review', 1, 0, 'review', 527, '2017-08-30 15:06:31'),
(1261, 45, '389', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 15:06:46'),
(1262, 45, '363', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', 1, 0, 'cutting_time', 0, '2017-08-30 15:07:01'),
(1263, 45, '389', 'Please leave your review', 1, 0, 'review', 528, '2017-08-30 15:08:01'),
(1264, 45, '363', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-30 15:08:16'),
(1265, 86, '45', 'Jack Garvin has joined your queue in position 2', 1, 0, 'join', 0, '2017-08-30 21:04:46'),
(1266, 45, '363', 'Please leave your review', 1, 0, 'review', 529, '2017-08-31 08:38:46'),
(1267, 45, '86', 'Your turn, enjoy your haircut!', 1, 0, 'cutting_time', 0, '2017-08-31 08:39:01'),
(1268, 45, '86', 'Hey', 1, 0, 'message', 0, '2017-08-31 14:15:01');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `barber_id` int(11) NOT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(256) NOT NULL,
  `reason` varchar(256) NOT NULL,
  `status` enum('waiting','start','end','removed') NOT NULL DEFAULT 'waiting',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `barber_id`, `start_time`, `end_time`, `rating`, `comment`, `reason`, `status`, `created_on`) VALUES
(1, 47, 45, 1497675300, 1497677000, 5, '', '', 'end', '2017-06-17 12:51:43'),
(2, 76, 45, 1497683555, 1497683561, 4, '', '', 'end', '2017-06-17 07:12:41'),
(3, 77, 45, 1497684159, 1497684165, 5, '', '', 'end', '2017-06-17 07:22:45'),
(4, 78, 45, 1497675300, 1497675307, 0, '', 'sdfsdf', 'removed', '2017-06-17 07:23:11'),
(29, 47, 45, 1497684199, 1497685000, 5, '', 'sdfsdfsdfdsf', 'end', '2017-06-19 13:16:52'),
(30, 47, 45, NULL, NULL, 0, '', '', 'removed', '2017-06-17 08:20:20'),
(31, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-17 13:54:41'),
(32, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 09:04:33'),
(33, 76, 45, NULL, 1497898363, 0, '', 'sdfsdfsdf', 'removed', '2017-06-19 18:57:26'),
(34, 78, 45, 1497934253, 1497934267, 0, '', '', 'end', '2017-06-20 04:51:07'),
(35, 90, 45, 1497948026, 1497948042, 0, '', 'werwerwerew', 'end', '2017-06-20 08:40:42'),
(36, 91, 45, 1497933822, 1497933848, 0, '', '', 'end', '2017-06-20 04:44:08'),
(37, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 09:04:41'),
(38, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 09:15:20'),
(39, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 09:41:35'),
(40, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 13:14:38'),
(41, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 18:33:14'),
(42, 86, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 18:32:01'),
(43, 86, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 18:32:08'),
(44, 86, 88, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 18:32:12'),
(45, 47, 45, 1497948295, 1497948300, 0, '', '', 'end', '2017-06-20 08:45:00'),
(46, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 18:51:03'),
(47, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 18:51:26'),
(48, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 18:51:29'),
(49, 86, 45, 1497948494, 1497948502, 4, '', '', 'end', '2017-06-22 10:23:06'),
(50, 86, 88, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-19 20:26:39'),
(51, 86, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-21 12:00:33'),
(52, 86, 88, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-20 17:52:19'),
(53, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-20 14:05:12'),
(54, 86, 45, 1497967539, 1497967582, 5, '', '', 'end', '2017-06-20 14:06:22'),
(56, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-20 16:36:22'),
(57, 76, 45, 1497976902, 1497976917, 0, '', '', 'end', '2017-06-20 16:41:57'),
(58, 77, 45, 1497976962, 1497976971, 0, '', '', 'end', '2017-06-20 16:42:51'),
(59, 78, 45, NULL, NULL, 0, '', 'by barber', 'removed', '2017-06-20 16:53:37'),
(60, 90, 45, 1497986287, NULL, 0, '', '1497989000', 'end', '2017-06-20 19:20:57'),
(61, 47, 45, NULL, NULL, 0, '', 'asdasdas', 'removed', '2017-06-20 17:24:40'),
(62, 78, 45, 1497985104, 1497985146, 0, '', '', 'end', '2017-06-20 18:59:06'),
(63, 47, 45, 1497985653, 1497985982, 1, '', '', 'end', '2017-06-20 20:13:51'),
(64, 47, 45, 1497986460, 1497986481, 0, '', '', 'end', '2017-06-20 19:21:21'),
(65, 47, 45, 1497986560, 1497986576, 0, '', '', 'end', '2017-06-20 19:22:56'),
(66, 47, 45, 1497986721, 1497986742, 5, '', '', 'end', '2017-06-20 20:13:30'),
(67, 47, 45, 1497987346, 1497987353, 3, '', '', 'end', '2017-06-20 20:13:34'),
(68, 47, 45, 1497988593, 1497988600, 2, '', '', 'end', '2017-06-20 20:13:45'),
(69, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-20 20:02:02'),
(70, 47, 45, 1497988946, 1497988952, 0, '', '', 'end', '2017-06-20 20:02:32'),
(71, 47, 45, 1497989202, 1497989208, 0, '', '', 'end', '2017-06-20 20:06:48'),
(72, 47, 45, 1497989524, 1497989528, 4, '', '', 'end', '2017-06-20 20:12:36'),
(73, 47, 45, 1498008983, 1498055889, 3, '', '', 'end', '2017-06-23 03:14:01'),
(74, 76, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-22 16:30:25'),
(75, 77, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-21 12:59:59'),
(76, 90, 45, 1498233251, 1498233254, 0, '', '', 'end', '2017-06-23 15:54:14'),
(77, 77, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-21 13:04:59'),
(78, 77, 45, 1498162186, 1498162190, 0, '', '', 'end', '2017-06-22 20:09:50'),
(81, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-21 15:18:29'),
(83, 47, 45, 1498058871, 1498058879, 4, '', '', 'end', '2017-06-23 02:51:17'),
(84, 102, 45, 1498233258, 1498233262, 0, '', '', 'end', '2017-06-23 15:54:22'),
(85, 103, 45, 1498233265, 1498233269, 0, '', '', 'end', '2017-06-23 15:54:29'),
(86, 86, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-21 15:39:00'),
(87, 86, 46, 1498059622, 1498059641, 5, '', '', 'end', '2017-06-21 15:40:59'),
(88, 47, 46, 1498059879, 1498059885, 3, '', '', 'end', '2017-06-21 15:44:45'),
(89, 86, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-21 15:45:43'),
(90, 47, 46, 1498060129, 1498060136, 3, '', '', 'end', '2017-06-23 03:16:01'),
(91, 78, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-22 13:29:36'),
(92, 86, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-22 12:19:29'),
(93, 47, 45, 1498064301, 1498148993, 5, '', '', 'end', '2017-06-23 02:50:39'),
(94, 86, 45, NULL, NULL, 0, '', 'twat', 'removed', '2017-06-22 20:10:03'),
(95, 78, 46, 1499867163, 1499867267, 0, '', '', 'end', '2017-07-12 13:47:47'),
(96, 86, 45, 1498165788, 1498165795, 5, '', '', 'end', '2017-06-22 21:09:55'),
(97, 104, 45, 1498233272, 1498233275, 0, '', '', 'end', '2017-06-23 15:54:35'),
(98, 86, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-23 08:44:05'),
(99, 47, 80, 1498184167, 1498184184, 4, '', '', 'end', '2017-06-23 02:18:26'),
(100, 47, 45, 1498233282, 1498233285, 4, '', '', 'end', '2017-06-23 15:54:45'),
(101, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-23 11:13:20'),
(102, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-23 11:13:26'),
(103, 86, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-23 17:56:04'),
(104, 105, 53, 1498227849, 1498227855, 0, '', '', 'end', '2017-06-23 14:24:15'),
(105, 108, 45, 1498233288, 1498233292, 0, '', '', 'end', '2017-06-23 15:54:52'),
(106, 109, 45, 1498240523, 1498240529, 0, '', '', 'end', '2017-06-23 17:55:29'),
(107, 110, 45, NULL, NULL, 0, '', 'I\'m running late ', 'removed', '2017-06-23 17:55:45'),
(108, 86, 45, 1498240641, 1498258026, 4, '', '', 'end', '2017-06-23 22:47:06'),
(109, 86, 88, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-25 10:25:16'),
(110, 111, 45, 1498258375, 1498258378, 0, '', '', 'end', '2017-06-23 22:52:58'),
(111, 112, 45, NULL, NULL, 0, '', 'you\'re late', 'removed', '2017-06-23 22:53:12'),
(112, 113, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-24 14:19:36'),
(113, 114, 79, NULL, NULL, 0, '', '', 'waiting', '2017-06-24 14:23:00'),
(114, 116, 45, 1498381755, 1498381764, 0, '', '', 'end', '2017-06-25 09:09:24'),
(115, 117, 45, 1498381795, 1498381798, 0, '', '', 'end', '2017-06-25 09:09:58'),
(116, 118, 45, 1498381818, 1498381824, 0, '', '', 'end', '2017-06-25 09:10:24'),
(117, 115, 45, NULL, NULL, 0, '', 'hey ', 'removed', '2017-06-25 09:11:15'),
(118, 115, 45, 1498382004, 1498382273, 5, '', '', 'end', '2017-06-25 09:17:53'),
(119, 119, 45, 1498392486, 1498392489, 0, '', '', 'end', '2017-06-25 12:08:09'),
(120, 120, 45, 1498396164, 1498396167, 0, '', '', 'end', '2017-06-25 13:09:27'),
(121, 121, 45, 1498577459, 1498577462, 0, '', '', 'end', '2017-06-27 15:31:02'),
(122, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-25 10:25:47'),
(124, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-25 13:08:35'),
(125, 122, 45, 1498577465, 1498577468, 0, '', '', 'end', '2017-06-27 15:31:08'),
(126, 86, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-25 13:08:47'),
(127, 86, 88, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-26 08:50:11'),
(128, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-25 15:45:37'),
(129, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-25 15:48:55'),
(130, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-11 16:14:35'),
(131, 86, 88, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-26 18:34:22'),
(132, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-27 15:14:32'),
(133, 128, 45, 1498577471, 1498577474, 0, '', '', 'end', '2017-06-27 15:31:14'),
(134, 129, 45, 1498577486, 1498603561, 0, '', '', 'end', '2017-06-27 22:46:01'),
(135, 134, 45, 1498766542, 1498766546, 0, '', '', 'end', '2017-06-29 20:02:26'),
(136, 135, 45, 1498766925, 1498766929, 0, '', '', 'end', '2017-06-29 20:08:49'),
(137, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-27 22:44:21'),
(138, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-28 13:36:54'),
(139, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-29 20:01:42'),
(140, 86, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-29 20:03:58'),
(141, 141, 45, 1498767623, 1498767627, 0, '', '', 'end', '2017-06-29 20:20:27'),
(142, 86, 45, 1498767774, 1498767777, 5, '', '', 'end', '2017-06-29 20:22:57'),
(143, 142, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-29 20:15:47'),
(144, 143, 88, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-29 20:18:58'),
(145, 143, 45, NULL, NULL, 0, '', 'you\'re a twat ', 'removed', '2017-06-29 20:23:05'),
(146, 144, 45, 1498772570, 1498772573, 0, '', '', 'end', '2017-06-29 21:42:53'),
(147, 143, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-29 20:35:00'),
(148, 145, 45, 1498774844, 1498774848, 0, '', '', 'end', '2017-06-29 22:20:48'),
(149, 146, 45, 1498774952, 1498774956, 0, '', '', 'end', '2017-06-29 22:22:36'),
(150, 147, 45, 1498776624, 1498776627, 0, '', '', 'end', '2017-06-29 22:50:27'),
(151, 143, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-29 20:35:59'),
(152, 143, 45, 1498811281, 1498811285, 0, '', '', 'end', '2017-06-30 08:28:05'),
(153, 148, 45, 1498913633, 1498913636, 0, '', '', 'end', '2017-07-01 12:53:56'),
(154, 149, 45, 1498917704, 1498917715, 0, '', '', 'end', '2017-07-01 14:01:55'),
(155, 143, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-30 19:10:03'),
(156, 142, 45, 1498919824, 1498919828, 5, '', '', 'end', '2017-07-01 14:37:08'),
(157, 143, 45, 1498919862, 1498919865, 0, '', '', 'end', '2017-07-01 14:37:45'),
(158, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-06-30 21:07:43'),
(159, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-01 04:46:03'),
(160, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-01 13:59:24'),
(161, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-01 14:35:27'),
(162, 150, 45, 1498935910, 1498935913, 0, '', '', 'end', '2017-07-01 19:05:13'),
(163, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-01 14:35:51'),
(164, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-01 19:04:20'),
(165, 151, 45, 1499077953, 1499077957, 0, '', '', 'end', '2017-07-03 10:32:37'),
(166, 86, 88, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-03 13:36:34'),
(167, 142, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-02 14:33:13'),
(168, 142, 45, NULL, NULL, 0, '', 'W3lcOmE To YoUR T4pE', 'removed', '2017-07-03 10:34:18'),
(169, 142, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-03 10:36:14'),
(170, 142, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-03 21:12:42'),
(171, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-05 11:57:12'),
(172, 143, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-03 20:03:01'),
(173, 154, 45, 1499256899, 1499256903, 0, '', '', 'end', '2017-07-05 12:15:03'),
(174, 142, 45, 1499257098, 1499257102, 0, '', '', 'end', '2017-07-05 12:18:22'),
(175, 164, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-05 08:49:45'),
(176, 164, 45, 1499257348, 1499257351, 5, '', '', 'end', '2017-07-05 12:22:31'),
(177, 167, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-05 10:21:32'),
(178, 167, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-05 10:25:22'),
(179, 169, 79, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-05 12:13:06'),
(180, 86, 45, 1499257456, 1499257459, 5, '', '', 'end', '2017-07-05 12:24:19'),
(181, 169, 45, 1499257474, 1499257477, 1, '', '', 'end', '2017-07-05 12:24:37'),
(182, 170, 45, 1499259106, 1499259109, 0, '', '', 'end', '2017-07-05 12:51:49'),
(183, 142, 45, 1499261709, 1499261712, 0, '', '', 'end', '2017-07-05 13:35:12'),
(184, 172, 45, 1499268617, 1499268619, 0, '', '', 'end', '2017-07-05 15:30:19'),
(185, 169, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-05 12:54:14'),
(186, 169, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-05 12:54:16'),
(187, 169, 45, 1499340181, 1499340184, 0, '', '', 'end', '2017-07-06 11:23:04'),
(188, 86, 175, 1499278013, 1499278016, 4, '', '', 'end', '2017-07-05 18:06:56'),
(189, 86, 175, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-06 14:22:48'),
(190, 86, 45, 1499436520, 1499436522, 5, '', '', 'end', '2017-07-07 14:08:42'),
(191, 201, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-06 21:06:30'),
(192, 209, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-07 14:09:58'),
(193, 210, 45, 1499436698, 1499436703, 0, '', '', 'end', '2017-07-07 14:11:43'),
(194, 211, 45, 1499436776, 1499436779, 0, '', '', 'end', '2017-07-07 14:12:59'),
(195, 209, 45, 1499541301, 1499541314, 0, '', '', 'end', '2017-07-08 19:15:14'),
(196, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-08 00:13:51'),
(197, 91, 45, NULL, NULL, 0, '', 'dfsdfds', 'removed', '2017-07-08 19:15:24'),
(198, 213, 45, 1499573813, 1499697485, 0, '', '', 'end', '2017-07-10 14:38:05'),
(199, 91, 45, 1499697716, 1499697742, 0, '', '', 'end', '2017-07-10 14:42:22'),
(201, 216, 215, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-09 20:41:27'),
(202, 216, 215, NULL, NULL, 0, '', '', 'waiting', '2017-07-09 20:43:19'),
(203, 169, 45, 1499697846, 1499697850, 3, '', '', 'end', '2017-07-10 14:44:10'),
(204, 217, 45, 1499698065, 1499698068, 0, '', '', 'end', '2017-07-10 14:47:48'),
(205, 218, 45, 1499698078, 1499698107, 0, '', '', 'end', '2017-07-10 14:48:27'),
(206, 219, 45, 1499698141, 1499698144, 0, '', '', 'end', '2017-07-10 14:49:04'),
(207, 169, 45, 1499708373, 1499708376, 0, '', '', 'end', '2017-07-10 17:39:36'),
(208, 220, 45, 1499708404, 1499708412, 0, '', '', 'end', '2017-07-10 17:40:12'),
(209, 222, 45, 1499708501, 1499708504, 0, '', '', 'end', '2017-07-10 17:41:44'),
(210, 221, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-10 17:40:59'),
(211, 223, 45, 1499709186, 1499709188, 0, '', '', 'end', '2017-07-10 17:53:08'),
(212, 224, 45, 1499764453, 1499764463, 0, '', '', 'end', '2017-07-11 09:14:23'),
(213, 221, 45, 1499779392, 1499779395, 0, '', '', 'end', '2017-07-11 13:23:15'),
(214, 225, 45, 1499780369, 1499780372, 0, '', '', 'end', '2017-07-11 13:39:32'),
(215, 226, 45, 1499785686, 1499785689, 0, '', '', 'end', '2017-07-11 15:08:09'),
(216, 227, 45, 1499789695, 1499789697, 0, '', '', 'end', '2017-07-11 16:14:57'),
(217, 228, 45, 1499807045, 1499807048, 0, '', '', 'end', '2017-07-11 21:04:08'),
(218, 230, 45, 1499856292, 1499856296, 0, '', '', 'end', '2017-07-12 10:44:56'),
(219, 86, 45, 1499870722, 1499870725, 5, '', '', 'end', '2017-07-12 14:45:25'),
(220, 231, 95, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-11 15:35:51'),
(221, 231, 45, 1500027378, 1500027381, 0, '', '', 'end', '2017-07-14 10:16:21'),
(222, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-11 17:59:51'),
(223, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-11 17:59:55'),
(224, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-12 06:45:16'),
(225, 47, 46, 1499867273, 1499867884, 4, '', '', 'end', '2017-07-12 13:58:04'),
(226, 47, 46, 1499868223, 1499868364, 4, '', '', 'end', '2017-07-12 14:06:04'),
(227, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-12 20:15:42'),
(228, 171, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-14 10:17:07'),
(229, 234, 45, 1500471268, 1500471271, 0, '', '', 'end', '2017-07-19 13:34:31'),
(230, 235, 45, 1500883778, 1500883786, 0, '', '', 'end', '2017-07-24 08:09:46'),
(231, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-12 20:17:57'),
(232, 86, 175, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-13 13:16:18'),
(233, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-14 06:04:20'),
(234, 47, 175, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-14 06:09:17'),
(235, 47, 236, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-14 06:38:56'),
(236, 47, 236, 1500014629, 1500014651, 5, '', '', 'end', '2017-07-14 06:44:11'),
(237, 237, 236, 1500022694, 1500022705, 0, '', '', 'end', '2017-07-14 08:58:25'),
(238, 238, 236, 1500022713, 1500022719, 0, '', '', 'end', '2017-07-14 08:58:39'),
(239, 47, 236, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-14 06:46:37'),
(240, 47, 236, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-14 06:51:22'),
(241, 230, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-14 07:57:40'),
(242, 47, 236, NULL, NULL, 0, '', 'you smell bad ', 'removed', '2017-07-14 08:58:51'),
(243, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-17 03:38:34'),
(244, 201, 175, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-14 14:03:03'),
(245, 201, 175, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-14 14:03:36'),
(246, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-16 15:05:55'),
(247, 86, 236, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-17 19:02:36'),
(248, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-17 07:43:16'),
(249, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-22 04:38:10'),
(250, 239, 46, NULL, NULL, 0, '', 'dfsdf', 'removed', '2017-07-31 16:27:51'),
(251, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-21 21:07:29'),
(252, 242, 45, NULL, NULL, 0, '', 'Not arrived', 'removed', '2017-07-24 08:19:12'),
(253, 201, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-19 14:25:45'),
(254, 245, 45, 1500884357, 1500884362, 0, '', '', 'end', '2017-07-24 08:19:22'),
(255, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-21 21:07:30'),
(256, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-21 21:07:30'),
(257, 86, 45, 1500907671, 1500907693, 5, '', '', 'end', '2017-07-24 14:48:13'),
(258, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-22 04:38:47'),
(259, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-22 04:40:11'),
(260, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-22 04:42:45'),
(261, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 08:08:01'),
(262, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 15:08:18'),
(263, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 14:49:08'),
(264, 86, 45, NULL, NULL, 0, '', 'not arrived', 'removed', '2017-07-24 18:31:07'),
(265, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 15:10:56'),
(266, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 15:11:36'),
(267, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 15:45:52'),
(268, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 15:47:32'),
(269, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 16:11:52'),
(270, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 16:11:56'),
(271, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 16:22:29'),
(272, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 16:31:25'),
(273, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 16:34:26'),
(274, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 18:04:35'),
(275, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-24 18:23:40'),
(276, 47, 45, 1501070177, 1501070180, 0, '', '', 'end', '2017-07-26 11:56:20'),
(277, 86, 45, 1501070184, 1501070187, 5, '', '', 'end', '2017-07-26 11:56:27'),
(278, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-26 12:08:26'),
(279, 76, 45, NULL, NULL, 0, '', 'did not turn up ', 'removed', '2017-07-26 16:27:58'),
(280, 47, 45, 1501086513, 1501086516, 0, '', '', 'end', '2017-07-26 16:28:36'),
(281, 86, 45, 1501087613, 1501087616, 0, '', '', 'end', '2017-07-26 16:46:56'),
(282, 201, 45, 1501087619, 1501087623, 5, '', '', 'end', '2017-07-26 16:47:03'),
(283, 142, 45, 1501087625, 1501087628, 3, '', '', 'end', '2017-07-26 16:47:08'),
(284, 142, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-26 16:49:21'),
(285, 142, 45, 1501188072, 1501188075, 4, '', '', 'end', '2017-07-27 20:41:15'),
(286, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-26 22:26:48'),
(287, 201, 45, 1501188142, 1501188145, 0, '', '', 'end', '2017-07-27 20:42:25'),
(288, 86, 45, 1501188187, 1501188190, 5, '', '', 'end', '2017-07-27 20:43:10'),
(289, 247, 45, 1501188249, 1501188252, 0, '', '', 'end', '2017-07-27 20:44:12'),
(290, 233, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-27 20:40:33'),
(291, 233, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-27 20:44:09'),
(292, 233, 45, 1501188355, 1501188361, 0, '', '', 'end', '2017-07-27 20:46:01'),
(293, 233, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-27 20:47:11'),
(294, 248, 45, 1501188525, 1501188527, 0, '', '', 'end', '2017-07-27 20:48:47'),
(295, 249, 45, 1501188582, 1501188586, 0, '', '', 'end', '2017-07-27 20:49:46'),
(296, 233, 45, 1501188593, 1501188596, 0, '', '', 'end', '2017-07-27 20:49:56'),
(297, 250, 45, 1501188976, 1501188981, 0, '', '', 'end', '2017-07-27 20:56:21'),
(298, 251, 45, 1501192110, 1501192113, 0, '', '', 'end', '2017-07-27 21:48:33'),
(299, 250, 45, 1501192117, 1501192120, 0, '', '', 'end', '2017-07-27 21:48:40'),
(300, 252, 45, 1501354737, 1501354742, 0, '', '', 'end', '2017-07-29 18:59:02'),
(301, 253, 45, NULL, NULL, 0, '', 'Not arrived', 'removed', '2017-07-31 12:38:23'),
(302, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-29 19:03:43'),
(303, 254, 45, 1501508878, 1501508881, 0, '', '', 'end', '2017-07-31 13:48:01'),
(304, 250, 45, 1501508974, 1501508977, 0, '', '', 'end', '2017-07-31 13:49:37'),
(305, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-31 15:37:40'),
(306, 255, 45, NULL, NULL, 0, '', 'ryfgh', 'removed', '2017-08-01 02:20:54'),
(307, 256, 45, 1501605306, 1501605309, 0, '', '', 'end', '2017-08-01 16:35:09'),
(308, 250, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-31 15:17:45'),
(309, 250, 45, 1501657051, 1501657053, 5, '', '', 'end', '2017-08-02 06:57:33'),
(310, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-31 15:48:19'),
(311, 47, 45, 1501517527, 1501517529, 0, '', '', 'end', '2017-07-31 16:12:09'),
(312, 86, 45, 1501657197, 1501657200, 0, '', '', 'end', '2017-08-02 07:00:00'),
(313, 76, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-31 16:31:51'),
(314, 76, 46, 1501519023, 1501519032, 4, '', '', 'end', '2017-07-31 16:37:12'),
(315, 257, 46, NULL, NULL, 0, '', '！！', 'removed', '2017-07-31 17:35:16'),
(316, 76, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-07-31 16:50:01'),
(317, 76, 46, NULL, NULL, 0, '', ' not arrived', 'removed', '2017-07-31 17:37:22'),
(318, 76, 46, NULL, NULL, 0, '', 'ufzhfz', 'removed', '2017-07-31 18:02:17'),
(319, 76, 46, NULL, NULL, 0, '', 'fttyy', 'removed', '2017-07-31 18:21:07'),
(320, 76, 46, NULL, NULL, 0, '', '456', 'removed', '2017-07-31 18:22:40'),
(321, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 07:53:20'),
(322, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 09:55:17'),
(323, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 09:57:00'),
(324, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 09:58:17'),
(325, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 10:00:22'),
(326, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 10:04:22'),
(327, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 10:07:01'),
(328, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 12:55:46'),
(329, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 12:57:37'),
(330, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 12:59:40'),
(331, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-01 13:04:38'),
(332, 47, 46, 1501592922, 1501592983, 0, '', '', 'end', '2017-08-01 13:09:43'),
(333, 47, 46, 1501593168, 1501593173, 4, '', '', 'end', '2017-08-01 13:12:53'),
(334, 47, 46, 1501593271, 1501593278, 5, '', '', 'end', '2017-08-01 13:14:38'),
(335, 47, 46, 1501593579, 1501593587, 4, '', '', 'end', '2017-08-01 13:19:47'),
(336, 261, 45, 1501657816, 1501657819, 0, '', '', 'end', '2017-08-02 07:10:19'),
(337, 262, 45, 1501657821, 1501657825, 5, '', '', 'end', '2017-08-02 07:10:25'),
(338, 263, 45, 1501657827, 1501657830, 5, '', '', 'end', '2017-08-02 07:10:30'),
(339, 263, 45, 1501658501, 1501658505, 5, '', '', 'end', '2017-08-02 07:21:45'),
(340, 264, 236, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-02 10:46:48'),
(341, 264, 45, 1501676758, 1501676760, 5, '', '', 'end', '2017-08-02 12:26:00'),
(342, 264, 45, 1501676862, 1501676865, 1, '', '', 'end', '2017-08-02 12:27:45'),
(343, 265, 45, 1501676972, 1501676974, 0, '', '', 'end', '2017-08-02 12:29:34'),
(344, 266, 45, 1501677041, 1501677044, 0, '', '', 'end', '2017-08-02 12:30:44'),
(345, 264, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-02 12:29:16'),
(346, 264, 45, 1501677145, 1501677147, 5, '', '', 'end', '2017-08-02 12:32:27'),
(347, 267, 45, 1501677243, 1501677245, 0, '', '', 'end', '2017-08-02 12:34:05'),
(348, 268, 45, 1501677249, 1501677252, 0, '', '', 'end', '2017-08-02 12:34:12'),
(349, 264, 45, 1501677255, 1501677258, 1, '', '', 'end', '2017-08-02 12:34:18'),
(350, 269, 45, 1501681493, 1501681532, 0, '', '', 'end', '2017-08-02 13:45:32'),
(351, 270, 45, 1501681863, 1501681872, 0, '', '', 'end', '2017-08-02 13:51:12'),
(352, 271, 45, 1501682017, 1501682229, 0, '', '', 'end', '2017-08-02 13:57:09'),
(353, 264, 45, 1501682433, 1501682462, 0, '', '', 'end', '2017-08-02 14:01:02'),
(354, 47, 45, 1501685535, 1501686258, 5, '', '', 'end', '2017-08-02 15:04:18'),
(355, 86, 45, 1501693579, 1501693581, 0, '', '', 'end', '2017-08-02 17:06:21'),
(356, 272, 45, 1501693769, 1501693772, 0, '', '', 'end', '2017-08-02 17:09:32'),
(357, 273, 45, 1501694066, 1501694068, 0, '', '', 'end', '2017-08-02 17:14:28'),
(358, 263, 45, 1501694070, 1501694072, 5, '', '', 'end', '2017-08-02 17:14:32'),
(359, 274, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-02 17:37:17'),
(360, 275, 45, 1501695513, 1501695516, 0, '', '', 'end', '2017-08-02 17:38:36'),
(361, 276, 45, 1501695520, 1501695522, 0, '', '', 'end', '2017-08-02 17:38:42'),
(362, 274, 45, 1501695483, 1501695485, 4, '', '', 'end', '2017-08-02 17:38:05'),
(363, 274, 45, 1501697816, 1501697818, 5, '', '', 'end', '2017-08-02 18:16:58'),
(364, 278, 45, 1501860396, 1501860432, 0, '', '', 'end', '2017-08-04 15:27:12'),
(365, 279, 45, NULL, NULL, 0, '', 'hh', 'removed', '2017-08-04 15:27:33'),
(366, 280, 45, NULL, NULL, 0, '', 'hhh', 'removed', '2017-08-04 15:27:41'),
(367, 283, 282, 1501701201, 1501701205, 0, '', '', 'end', '2017-08-02 19:13:25'),
(368, 86, 282, 1501701310, 1501701421, 5, '', '', 'end', '2017-08-02 19:17:01'),
(369, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-02 20:42:50'),
(370, 47, 45, 1501860464, 1501860558, 4, '', '', 'end', '2017-08-11 07:54:25'),
(371, 287, 286, 1501707672, 1501707735, 0, '', '', 'end', '2017-08-02 21:02:15'),
(372, 288, 286, NULL, NULL, 0, '', 'you\'re late\n', 'removed', '2017-08-02 21:03:28'),
(373, 86, 45, 1501925275, 1501925277, 0, '', '', 'end', '2017-08-05 09:27:57'),
(374, 290, 45, 1501925408, 1501925411, 0, '', '', 'end', '2017-08-05 09:30:11'),
(375, 291, 45, 1501925997, 1501926000, 0, '', '', 'end', '2017-08-05 09:40:00'),
(376, 47, 45, 1501926019, 1501926023, 4, '', '', 'end', '2017-08-11 07:48:44'),
(377, 292, 45, 1501926038, 1501926040, 4, '', '', 'end', '2017-08-05 09:40:40'),
(378, 293, 45, 1501926348, 1501926350, 0, '', '', 'end', '2017-08-05 09:45:50'),
(379, 294, 45, 1501926497, 1501926499, 0, '', '', 'end', '2017-08-05 09:48:19'),
(380, 295, 45, 1501926507, 1501926510, 0, '', '', 'end', '2017-08-05 09:48:30'),
(381, 292, 45, 1501926702, 1501926708, 5, '', '', 'end', '2017-08-05 09:51:48'),
(382, 47, 45, 1501926762, 1501926765, 3, '', '', 'end', '2017-08-05 09:52:45'),
(383, 292, 45, 1501926778, 1501926781, 4, '', '', 'end', '2017-08-05 09:53:01'),
(384, 86, 45, NULL, NULL, 0, '', 'no', 'removed', '2017-08-05 09:55:59'),
(385, 47, 45, 1501927250, 1501927252, 4, '', '', 'end', '2017-08-05 10:00:52'),
(386, 86, 45, 1501927995, 1501928008, 0, '', '', 'end', '2017-08-05 10:13:28'),
(387, 292, 45, 1501964015, 1501964035, 5, '', '', 'end', '2017-08-05 20:13:55'),
(388, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-05 20:06:42'),
(389, 300, 45, 1501966233, 1501966236, 0, '', '', 'end', '2017-08-05 20:50:36'),
(390, 301, 45, 1501966238, 1501966240, 0, '', '', 'end', '2017-08-05 20:50:40'),
(391, 86, 45, 1501966242, 1501966247, 4, '', '', 'end', '2017-08-05 20:50:47'),
(392, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-06 11:57:00'),
(393, 86, 45, 1502022324, 1502022579, 2, '', '', 'end', '2017-08-06 12:29:39'),
(394, 86, 45, 1502035825, 1502035828, 3, '', '', 'end', '2017-08-06 16:10:28'),
(395, 302, 45, 1502035894, 1502035896, 0, '', '', 'end', '2017-08-06 16:11:36'),
(396, 303, 45, 1502035968, 1502035977, 0, '', '', 'end', '2017-08-06 16:12:57'),
(397, 304, 45, 1502036019, 1502036021, 0, '', '', 'end', '2017-08-06 16:13:41'),
(398, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-06 16:11:06'),
(399, 86, 45, 1502036106, 1502036108, 0, '', '', 'end', '2017-08-06 16:15:08'),
(400, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-06 16:22:26'),
(401, 47, 45, NULL, NULL, 0, '', 'removed', 'removed', '2017-08-06 16:27:11'),
(402, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-06 16:33:01'),
(403, 47, 45, 1502228738, 1502228741, 5, '', '', 'end', '2017-08-10 18:00:34'),
(404, 305, 45, 1502445675, 1502445676, 0, '', '', 'end', '2017-08-11 10:01:16'),
(405, 306, 45, 1502445680, 1502445682, 0, '', '', 'end', '2017-08-11 10:01:22'),
(406, 86, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-09 10:59:53'),
(407, 307, 45, 1502445685, 1502445690, 0, '', '', 'end', '2017-08-11 10:01:30'),
(408, 308, 45, 1502445694, 1502445697, 0, '', '', 'end', '2017-08-11 10:01:37'),
(409, 309, 45, 1502445701, 1502445703, 0, '', '', 'end', '2017-08-11 10:01:43'),
(410, 310, 45, 1502445709, 1502445710, 0, '', '', 'end', '2017-08-11 10:01:50'),
(411, 86, 45, 1502445714, 1502445721, 4, 'pretty good cut ', '', 'end', '2017-08-11 10:02:01'),
(412, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-10 16:48:05'),
(413, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-10 16:50:53'),
(414, 311, 45, 1502465949, 1502465952, 0, '', '', 'end', '2017-08-11 15:39:12'),
(415, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-11 06:59:41'),
(416, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-11 07:03:34'),
(417, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-11 07:09:14'),
(418, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-11 15:04:05'),
(419, 86, 175, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-11 13:51:32'),
(420, 47, 236, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-11 15:06:33'),
(421, 330, 45, 1502465955, 1502465958, 0, '', '', 'end', '2017-08-11 15:39:18'),
(422, 331, 45, 1502465961, 1502465964, 0, '', '', 'end', '2017-08-11 15:39:24'),
(423, 332, 45, 1502465970, 1502465973, 0, '', '', 'end', '2017-08-11 15:39:33'),
(424, 47, 45, 1502465976, 1502465979, 0, '', '', 'end', '2017-08-11 15:39:39'),
(425, 261, 45, 1502466370, 1502466373, 5, 'Great app! really helpful and sped my hair cut process up greatly!!!!????????????', '', 'end', '2017-08-11 15:46:13'),
(426, 333, 45, 1502466827, 1502466832, 0, '', '', 'end', '2017-08-11 15:53:52'),
(427, 334, 45, 1502466913, 1502466915, 0, '', '', 'end', '2017-08-11 15:55:15'),
(428, 335, 45, 1502466918, 1502466920, 0, '', '', 'end', '2017-08-11 15:55:20'),
(429, 261, 45, 1502466923, 1502466926, 0, '', '', 'end', '2017-08-11 15:55:26'),
(430, 86, 175, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-14 07:49:48'),
(431, 336, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-11 16:39:56'),
(432, 336, 45, NULL, NULL, 0, '', 'not today ', 'removed', '2017-08-11 16:40:45'),
(433, 336, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-11 16:41:04'),
(434, 336, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-11 16:49:57'),
(435, 336, 45, 1502470214, 1502470221, 5, '', '', 'end', '2017-08-11 16:50:21'),
(436, 337, 45, 1502487558, 1502487560, 0, '', '', 'end', '2017-08-11 21:39:20'),
(437, 264, 236, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-12 15:08:56'),
(438, 339, 45, 1502555384, 1502555387, 0, '', '', 'end', '2017-08-12 16:29:47'),
(439, 340, 45, 1502555403, 1502555406, 0, '', '', 'end', '2017-08-12 16:30:06'),
(440, 341, 45, 1502555408, 1502555411, 0, '', '', 'end', '2017-08-12 16:30:11'),
(441, 342, 45, 1502555414, 1502555416, 0, '', '', 'end', '2017-08-12 16:30:16'),
(442, 234, 45, 1502555464, 1502555467, 5, 'Great cut. Really good half fade', '', 'end', '2017-08-12 16:31:07'),
(443, 343, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-14 12:58:00'),
(444, 264, 45, 1502715696, 1502715699, 0, '', '', 'end', '2017-08-14 13:01:39'),
(445, 343, 45, 1502716070, 1502716074, 5, '', '', 'end', '2017-08-14 13:07:54'),
(446, 264, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-14 13:09:28'),
(447, 264, 45, 1502716197, 1502716200, 0, '', '', 'end', '2017-08-14 13:10:00'),
(448, 344, 45, 1502716582, 1502716585, 0, '', '', 'end', '2017-08-14 13:16:25'),
(449, 345, 45, 1502716588, 1502716591, 0, '', '', 'end', '2017-08-14 13:16:31'),
(450, 346, 45, 1502716594, 1502716596, 0, '', '', 'end', '2017-08-14 13:16:36'),
(451, 343, 45, 1502716599, 1502716602, 0, '', '', 'end', '2017-08-14 13:16:42'),
(452, 264, 45, 1502716604, 1502716607, 5, '', '', 'end', '2017-08-14 13:16:47'),
(453, 348, 282, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-14 20:11:38'),
(454, 348, 45, 1502741739, 1502741785, 0, '', '', 'end', '2017-08-14 20:16:25'),
(455, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-15 10:39:58'),
(456, 76, 45, 1502801932, 1502801935, 0, '', '', 'end', '2017-08-15 12:58:55'),
(457, 47, 45, 1502807840, 1502807843, 0, '', '', 'end', '2017-08-15 14:37:23'),
(458, 78, 45, 1502868677, 1502868679, 0, '', '', 'end', '2017-08-16 07:31:19'),
(459, 234, 45, 1502868682, 1502868685, 0, '', '', 'end', '2017-08-16 07:31:25'),
(460, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-15 15:40:07'),
(461, 47, 45, 1502868690, 1502868694, 5, 'good', '', 'end', '2017-08-16 07:31:34'),
(462, 250, 236, NULL, NULL, 0, '', '', 'waiting', '2017-08-15 21:36:03'),
(463, 264, 45, 1502868698, 1502868702, 0, '', '', 'end', '2017-08-16 07:31:42'),
(464, 47, 45, 1502869310, 1502869312, 5, 'Best cut ever', '', 'end', '2017-08-16 07:41:52'),
(465, 352, 45, 1502869554, 1502869560, 0, '', '', 'end', '2017-08-16 07:46:00'),
(466, 353, 45, NULL, NULL, 0, '', 'gdg', 'removed', '2017-08-16 07:46:46'),
(467, 354, 45, 1502870364, 1502870366, 0, '', '', 'end', '2017-08-16 07:59:26'),
(468, 355, 45, 1502870804, 1502870807, 0, '', '', 'end', '2017-08-16 08:06:47'),
(469, 86, 45, 1502870811, 1502870818, 5, 'he\'s always on his phone ', '', 'end', '2017-08-16 08:06:58'),
(470, 86, 45, NULL, NULL, 0, '', 'because I can \n\n', 'removed', '2017-08-16 08:11:13'),
(471, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-16 08:12:49'),
(472, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-16 08:14:25'),
(473, 86, 45, 1502871294, 1502871297, 5, 'good', '', 'end', '2017-08-16 08:14:57'),
(474, 356, 45, 1502871470, 1502871473, 0, '', '', 'end', '2017-08-16 08:17:53'),
(475, 86, 45, 1502871476, 1502871479, 5, '', '', 'end', '2017-08-16 08:17:59'),
(476, 234, 45, 1502883533, 1502883537, 0, '', '', 'end', '2017-08-16 11:38:57'),
(477, 234, 45, 1502883959, 1502883962, 5, 'Great Cut', '', 'end', '2017-08-16 11:46:02'),
(478, 357, 45, 1502884274, 1502884276, 0, '', '', 'end', '2017-08-16 11:51:16'),
(479, 358, 45, 1502884279, 1502884282, 0, '', '', 'end', '2017-08-16 11:51:22'),
(480, 359, 45, 1502884285, 1502884287, 0, '', '', 'end', '2017-08-16 11:51:27'),
(481, 234, 45, 1502977522, 1502977525, 0, '', '', 'end', '2017-08-17 13:45:25'),
(482, 47, 46, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-16 15:21:16'),
(483, 86, 175, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-16 20:46:28'),
(484, 86, 175, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-16 22:05:44'),
(485, 86, 45, 1502977572, 1502977575, 0, '', '', 'end', '2017-08-17 13:46:15'),
(486, 262, 45, 1502977616, 1502977619, 0, '', '', 'end', '2017-08-17 13:46:59'),
(487, 362, 236, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-17 13:45:30'),
(488, 362, 45, 1502977767, 1502977769, 3, 'not a bad shop, could use a good tidy', '', 'end', '2017-08-17 13:49:29'),
(489, 86, 45, 1503311332, 1503311335, 0, '', '', 'end', '2017-08-21 10:28:55'),
(490, 362, 45, 1503311522, 1503311525, 5, 'delightful haircut', '', 'end', '2017-08-21 10:32:05'),
(491, 86, 236, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-22 21:58:13'),
(492, 264, 45, 1503490083, 1503490085, 0, '', '', 'end', '2017-08-23 12:08:05'),
(493, 365, 45, 1503490781, 1503490783, 0, '', '', 'end', '2017-08-23 12:19:43'),
(494, 366, 45, 1503499281, 1503499283, 0, '', '', 'end', '2017-08-23 14:41:23'),
(495, 264, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-23 15:12:25'),
(496, 367, 45, NULL, NULL, 0, '', 'yeh', 'removed', '2017-08-23 15:25:36'),
(497, 264, 45, 1503592038, 1503592041, 5, '', '', 'end', '2017-08-24 16:27:21'),
(498, 369, 45, 1503873388, 1503873393, 0, '', '', 'end', '2017-08-27 22:36:33'),
(499, 370, 45, 1504022440, 1504022443, 0, '', '', 'end', '2017-08-29 16:00:43'),
(500, 371, 45, 1504022452, 1504022455, 0, '', '', 'end', '2017-08-29 16:00:55'),
(501, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-27 21:55:32'),
(502, 234, 45, 1504022765, 1504022768, 0, '', '', 'end', '2017-08-29 16:06:08'),
(503, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-27 22:01:21'),
(504, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-27 22:10:14'),
(505, 86, 79, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-27 22:24:34'),
(506, 373, 45, 1504022771, 1504022773, 0, '', '', 'end', '2017-08-29 16:06:13'),
(507, 86, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-28 00:04:29'),
(508, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-29 16:01:42'),
(509, 47, 45, NULL, NULL, 0, '', 'leave by customer himself', 'removed', '2017-08-29 16:02:53'),
(510, 47, 45, 1504022776, 1504022779, 4, '', '', 'end', '2017-08-29 16:06:19'),
(511, 364, 45, 1504035752, 1504035755, 5, '', '', 'end', '2017-08-29 19:42:35'),
(512, 376, 45, 1504078954, 1504078957, 0, '', '', 'end', '2017-08-30 07:42:37'),
(513, 377, 45, 1504078969, 1504078972, 0, '', '', 'end', '2017-08-30 07:42:52'),
(514, 378, 45, 1504078989, 1504078991, 0, '', '', 'end', '2017-08-30 07:43:11'),
(515, 364, 45, 1504078996, 1504078999, 5, '', '', 'end', '2017-08-30 07:43:19'),
(516, 234, 45, 1504091090, 1504091093, 5, 'wonderful cut ', '', 'end', '2017-08-30 11:04:53'),
(517, 380, 45, 1504091363, 1504091365, 0, '', '', 'end', '2017-08-30 11:09:25'),
(518, 381, 45, 1504091448, 1504091451, 0, '', '', 'end', '2017-08-30 11:10:51'),
(519, 382, 45, 1504091686, 1504091689, 0, '', '', 'end', '2017-08-30 11:14:49'),
(520, 234, 45, 1504091881, 1504091885, 5, 'he\'s a weirdo', '', 'end', '2017-08-30 11:18:05'),
(521, 383, 45, 1504092055, 1504092058, 0, '', '', 'end', '2017-08-30 11:20:58'),
(522, 384, 45, 1504092121, 1504092124, 0, '', '', 'end', '2017-08-30 11:22:04'),
(523, 234, 45, 1504104961, 1504104964, 0, '', '', 'end', '2017-08-30 14:56:04'),
(524, 386, 282, NULL, NULL, 0, '', '', 'waiting', '2017-08-30 14:39:59'),
(525, 363, 45, 1504105316, 1504105318, 4, 'lovely little trim', '', 'end', '2017-08-30 15:01:58'),
(526, 387, 45, 1504105518, 1504105521, 0, '', '', 'end', '2017-08-30 15:05:21'),
(527, 388, 45, 1504105543, 1504105547, 0, '', '', 'end', '2017-08-30 15:05:47'),
(528, 389, 45, 1504105675, 1504105677, 0, '', '', 'end', '2017-08-30 15:07:57'),
(529, 363, 45, 1504168712, 1504168715, 4, '', '', 'end', '2017-08-31 08:38:35'),
(530, 86, 45, NULL, NULL, 0, '', '', 'waiting', '2017-08-30 21:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `one_id` varchar(256) NOT NULL,
  `one_id_android` varchar(256) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birthday` varchar(256) DEFAULT NULL,
  `gender` enum('Male','Famale','','') DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fb_id` varchar(128) NOT NULL,
  `tw_id` varchar(128) NOT NULL,
  `g_id` varchar(128) NOT NULL,
  `photo` varchar(256) NOT NULL,
  `user_type` enum('barber_shop','barber','customer','') NOT NULL DEFAULT 'customer',
  `is_guest` enum('real','guest','') NOT NULL DEFAULT 'real',
  `included_shop_id` int(11) DEFAULT NULL,
  `online_status` enum('online','offline','','') NOT NULL DEFAULT 'online',
  `fb_profile_link` varchar(256) NOT NULL,
  `instagram_profile_link` varchar(256) NOT NULL,
  `twt_profile_link` varchar(256) NOT NULL,
  `address` varchar(256) NOT NULL,
  `lati` varchar(256) NOT NULL,
  `lang` varchar(256) NOT NULL,
  `work_time_start` varchar(16) NOT NULL,
  `work_time_end` varchar(16) NOT NULL,
  `sat_time_start` varchar(16) NOT NULL,
  `sat_time_end` varchar(16) NOT NULL,
  `sun_time_start` varchar(16) NOT NULL,
  `sun_time_end` varchar(16) NOT NULL,
  `description` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `one_id`, `one_id_android`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `birthday`, `gender`, `company`, `phone`, `fb_id`, `tw_id`, `g_id`, `photo`, `user_type`, `is_guest`, `included_shop_id`, `online_status`, `fb_profile_link`, `instagram_profile_link`, `twt_profile_link`, `address`, `lati`, `lang`, `work_time_start`, `work_time_end`, `sat_time_start`, `sat_time_end`, `sun_time_start`, `sun_time_end`, `description`) VALUES
(41, '', '', '104.238.51.74', 'babaz ', '$2y$08$bUsnd0XyB/y9qxXzrTZFiO961IPb12wOxabKBp.qfVq4wvaPHaocC', NULL, 'barbershop@email.com', NULL, NULL, NULL, NULL, 1496200892, 1502696633, 1, NULL, NULL, '02/06/2003', 'Male', NULL, '232342322', '', '', '', 'assets/uploads/profile_photo/photo_0.06294000_1502696692.jpg', 'barber_shop', 'real', NULL, 'online', '', 'https://instagram.com', 'https://twitter.com', '260 Shi Fu Da LuJinLang ShangQuan, Shenhe Qu, Shenyang Shi, Liaoning Sheng중국110000', '41.812582', '123.435720', '05:48 PM', '06:00 PM', '10:00 AM', '05:00 PM', '10:00 AM', '04:00 PM', 'fgvguuvu  torch'),
(42, '', 'cff3e862-8e15-4695-845b-fee162f6e6ce', '104.238.51.74', 'Barbershop1', '$2y$08$FoL.OCT/G1vT90by7j7hrO23G15s2FPxRqlIInljsgtp0KZkcblYa', NULL, 'barbershop1@email.com', NULL, NULL, NULL, NULL, 1496201961, 1502111254, 1, NULL, NULL, NULL, NULL, NULL, '12346579', '', '', '', 'assets/uploads/profile_photo/photo_0.10498200_1496202115.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', 'Шифу Лу, Shenyang, Liaoning, China', '41.802701', '123.424283', '09:00 AM', '06:00 PM', '10:00 AM', '05:00 PM', '10:00 AM', '04:00 PM', 'Description barbershop1'),
(44, '', '', '104.238.51.74', 'Barbershop3', '$2y$08$WRtJuTTrrEBjtZ77M4mPVuj3SX5LVpQNublFl4yhCaiUbTbuZvL6.', NULL, 'barbershop3@email.com', NULL, NULL, NULL, NULL, 1496204041, 1496230773, 1, NULL, NULL, NULL, NULL, NULL, '123456789', '', '', '', 'assets/uploads/profile_photo/photo_0.34459800_1496204255.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', 'Jinlang Shangquan, Shenhe, Shenyang, China, 110013', '41.822820', '123.457502', '09:00 AM', '06:00 PM', '10:00 AM', '05:00 PM', '10:00 AM', '04:00 PM', 'Description barbershop3'),
(45, 'fa80ccf3-3647-4e11-a2d7-6a44ae6c7e72', '', '104.238.51.33', 'Michael garvin ', '$2y$08$hrWka4P8bPwbkZIsuG9mUO3ACop1B.gPV2R4AP8Fh0evAhMsQN0oa', NULL, 'barber@email.com', NULL, NULL, NULL, NULL, 1496230949, 1504168707, 1, NULL, NULL, '31/05/1998', 'Male', NULL, '07960037894', '', '', '', 'assets/uploads/profile_photo/photo_0.83774700_1504188918.jpg', 'barber', 'real', 87, 'online', 'https://facebook.com/jack.garvin?ref=bookmarks', 'http://instagram.com/jonnyhopkinss', '', '', '', '', '', '', '', '', '', '', 'Experienced barber, friendly and always happy to help you get the perfect cut '),
(46, '', '', '104.238.51.33', 'Barber1', '$2y$08$8ZmCEC32zXHumxpMVfdtwOfgeioqBvAellMgRMT0ERO7ZPqAG6db.', NULL, 'barber1@email.com', NULL, NULL, NULL, NULL, 1496235919, 1501594036, 1, NULL, NULL, '31/05/1998', 'Male', NULL, '12345', '', '', '', 'assets/uploads/profile_photo/photo_0.90066400_1498124802.jpg', 'barber', 'real', 41, 'online', 'https://Facebook.com', 'https://instagram.com', 'https://twitter.com', '', '', '', '', '', '', '', '', '', 'Description Barber1'),
(47, '', '16122033-9bf3-4897-a2dd-07cfa1d0a158', '104.238.51.33', 'Customer', '$2y$08$TfBRny760ovA8R8NcvoNeeiFuXoL3pqr6REZ51WI7cPok.1Hjg.Om', NULL, 'customer@email.com', NULL, NULL, NULL, NULL, 1496236077, 1504022359, 1, NULL, NULL, '24/08/2000', 'Male', NULL, '12321231', '', '', '', 'assets/uploads/profile_photo/photo_0.46531700_1502740058.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(48, '', '', '104.238.51.33', 'Barbershop4', '$2y$08$rwVO8Yc.qEEZr/2AbdZGVOKK0S5fCRwL0mE4gCFz4wFMWORcmTUH.', NULL, 'barbershop4@email.com', NULL, NULL, NULL, NULL, 1496236154, NULL, 1, NULL, NULL, NULL, NULL, NULL, '123', '', '', '', 'assets/uploads/profile_photo/photo_0.56838700_1496236228.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', '1000 Stockton St, San Francisco, CA  94108, United States', '37.785834', '-122.406417', '09:00 AM', '06:00 PM', '10:00 AM', '05:00 PM', '10:00 AM', '04:00 PM', 'Description barbershop4'),
(49, '', '', '104.238.51.33', 'Barbershop5', '$2y$08$dNnXEXjJs.99j.y8kHBtI.Fn2WtTP3xxFMoptHCePvVEhg7wmyUDK', NULL, 'barbershop5@email.com', NULL, NULL, NULL, NULL, 1496237196, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13456', '', '', '', 'assets/uploads/profile_photo/photo_0.71863200_1496237338.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', '长江北街, Shenyang, Liaoning, China', '41.867286', '123.399692', '09:00 AM', '06:00 PM', '10:00 AM', '06:00 PM', '10:00 AM', '05:00 PM', 'Description barbershop5'),
(50, '', '', '104.238.51.33', 'Barbershop6', '$2y$08$2NTbHA6iOfNjUjLUMRdDNeo.QFwnjjzwi0KBthEXTqocoP39Ddi16', NULL, 'barbershop6@email.com', NULL, NULL, NULL, NULL, 1496237676, 1498184138, 1, NULL, NULL, NULL, NULL, NULL, '321654', '', '', '', 'assets/uploads/profile_photo/photo_0.23283500_1496237789.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', 'Zhonggang System Interchange, Cingshuei District, Taichung City 436, Taiwan', '24.306280', '120.612681', '09:00 AM', '06:00 PM', '10:00 AM', '05:00 PM', '10:00 AM', '04:00 PM', 'Description barbershop6'),
(51, '', '', '104.238.51.33', 'Barbershop2', '$2y$08$LkWZkgy/q0d2YbgCsFfzK.GvkaHSfOex3MJee2f7dJmMppwJDI55G', NULL, 'barbershop2@email.com', NULL, NULL, NULL, NULL, 1496239848, 1499393120, 1, NULL, NULL, NULL, NULL, NULL, '1323231', '', '', '', 'assets/uploads/profile_photo/photo_0.70135400_1496239927.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', '1000 Stockton St, San Francisco, CA  94108, United States', '37.785834', '-122.406417', '09:00 AM', '06:00 PM', '10:00 AM', '05:00 PM', '10:00 AM', '04:00 PM', 'Description barber2- Love is love is love! In 2012, we followed our passion for retail to do something that had never been done before. Five years later, we’ve reinvented ourselves over (and over) again. 33 stories, hundreds of events, thousands of partner'),
(52, '', '16122033-9bf3-4897-a2dd-07cfa1d0a158', '104.238.51.196', 'Barber2', '$2y$08$kVZ5OZuntrvfrnmx34LYdeZmQWV1OzRLMx9BvPNsniZWbfLA9YrFe', NULL, 'barber2@email.com', NULL, NULL, NULL, NULL, 1496289937, 1501572421, 1, NULL, NULL, '31/05/1997', 'Male', NULL, '1321', '', '', '', 'assets/uploads/profile_photo/photo_0.77030300_1499446504.jpg', 'barber', 'real', 41, 'offline', 'added', 'sdfsdf', 'sdfsdf', '', '', '', '', '', '', '', '', '', 'Description Barber2'),
(53, '', '', '104.238.51.196', 'Barber3', '$2y$08$s3hMsuJt8dbCT1RT8HcJoOw0VOU5jggaljvf7aG.KGw4d1/dRuZhu', NULL, 'barber3@email.com', NULL, NULL, NULL, NULL, 1496290034, 1498227824, 1, NULL, NULL, '09/01/1992', 'Famale', NULL, '32132', '', '', '', 'assets/uploads/profile_photo/photo_0.55747800_1496290075.jpg', 'barber', 'real', 0, 'online', '', '', '', '', '', '', '', '', '', '', '', '', 'Description barber3'),
(54, '', '', '104.238.51.196', 'Barber4', '$2y$08$oSqUU5RgxfdF8EdrnmTWpeXNFbgLs7iO0TE9aZHL/bc/VR/3ajVIa', NULL, 'barber4@email.com', NULL, NULL, NULL, NULL, 1496290119, NULL, 1, NULL, NULL, '31/01/1984', 'Male', NULL, '654654', '', '', '', 'assets/uploads/profile_photo/photo_0.38701600_1496290154.jpg', 'barber', 'real', 0, 'offline', '', '', '', '', '', '', '', '', '', '', '', '', 'Description barber4'),
(55, '', '', '45.56.158.195', 'Barbershop7', '$2y$08$MCc1o3LA2qGcrIdSYRUtreYg3AIUlq0Qx6.hZKN98X77IFJQiggZC', NULL, 'barbershop7@email.com', NULL, NULL, NULL, NULL, 1496388248, NULL, 1, NULL, NULL, NULL, NULL, NULL, '13213213', '', '', '', 'assets/uploads/profile_photo/photo_0.08928400_1496388370.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', '100 Ebbtide Ave, Sausalito, CA  94965, United States', '37.869678', '-122.505885', '09:00 AM', '06:00 PM', '10:00 AM', '05:00 PM', '10:00 AM', '04:00 PM', 'Description barbershop7'),
(74, '', '', '', 'Yang yang511', '', NULL, 'yangyang88511@gmail.com', NULL, 'WMTZALpz7fxsPsFjhPt5ju318da02390e875ca55', 1500948595, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, '234232342423423', '', '', '103915154814154276435', 'assets/uploads/profile_photo/photo_0.95011100_1496628859.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', '268 E 10th St, New York, NY 10009, USA', '40.728301', '-73.983477', '09:00 AM', '06:00 PM', '10:00 AM', '05:00 PM', '10:00 AM', '04:00 PM', '234234234234234234dzscfxzcxzczxczxczxczxczxczxczxczxczxczxc'),
(76, '', '', '104.238.51.208', 'customer1', '$2y$08$ZDtEQ3kFnjqHPqYJsdG8D.bdB0MpmuFLTJZEcnME1ZaGhIovkWDj6', NULL, 'customer1@email.com', NULL, NULL, NULL, NULL, 1496653821, 1502793611, 1, NULL, NULL, '05/06/2000', 'Male', NULL, '24242452', '', '', '', 'assets/uploads/profile_photo/photo_0.94730300_1496653955.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(77, '', '', '104.238.51.208', 'customer2', '$2y$08$ujQGrbPm197NpMs/jJ95k.m3lPzB927uYo9UpUu2NJ5gqUF9/x84a', NULL, 'customer2@email.com', NULL, NULL, NULL, NULL, 1496653932, 1498049408, 1, NULL, NULL, '04/05/2000', 'Famale', NULL, '417417', '', '', '', 'assets/uploads/profile_photo/photo_0.94730300_1496653955.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(78, '', '', '104.238.51.208', 'customer3', '$2y$08$ac.QmwNZWYJNSaBBNWufE.gvst9C82D/O1TowkjebTVY9OWXOqcNe', NULL, 'customer3@email.com', NULL, NULL, NULL, NULL, 1496654143, 1502793752, 1, NULL, NULL, '05/06/1989', 'Famale', NULL, '234234234', '', '', '', 'assets/uploads/profile_photo/photo_0.28131100_1496654191.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(79, '', '', '104.238.51.203', 'Barber5', '$2y$08$bAkxCbOE0BRdHXUfGYs4YudT.RbVtX.9O3HrIDEni3bfj1kRd525a', NULL, 'barber5@email.com', NULL, NULL, NULL, NULL, 1496733217, 1498314098, 1, NULL, NULL, '06/06/1995', 'Male', NULL, '234231213', '', '', '', 'assets/uploads/profile_photo/photo_0.60611400_1498314159.jpg', 'barber', 'real', 74, 'online', 'https://Facebook.com', 'https://instagram.com', 'https://twitter.com', '', '', '', '', '', '', '', '', '', 'Description barber5'),
(80, '', '', '104.238.51.203', 'Barber6', '$2y$08$tWWn9ceDMbFMaPur34L1O.BTPNGy4rQQPXb2C5Q.5tCO7IoSeTpSm', NULL, 'barber6@email.com', NULL, NULL, NULL, NULL, 1496734065, 1498184160, 1, NULL, NULL, '06/06/1997', 'Famale', NULL, '234234', '', '', '', 'assets/uploads/profile_photo/photo_0.53349800_1496734106.jpg', 'barber', 'real', 0, 'online', '', '', '', '', '', '', '', '', '', '', '', '', 'Description barber6 sdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfdsfsdfsdfsdfsdfsdfds'),
(83, '', '', '104.238.51.203', 'Barber7', '$2y$08$mwqlzNgAkL0tlhk0UOXF6uMPCIsSVaP/XexK4v9W.a0DcVKPPK4A6', NULL, 'barber7@email.com', NULL, NULL, NULL, NULL, 1496738446, NULL, 1, NULL, NULL, '06/06/2000', 'Famale', NULL, '2342343', '', '', '', 'assets/uploads/profile_photo/photo_0.38494100_1496738494.jpg', 'barber', 'real', 0, 'offline', '', '', '', '', '', '', '', '', '', '', '', '', 'Description barber7 sdlkfasdfkj;asdkfjlskdf;lsdkfjlskdfj;adding;ksdjf;ldksfj;lsdkfj;lskdfj;lskdfj;landfill;lskadjf;siddha;lash;flash;flkjsd;Flonase;lfkjsd'),
(84, '', '', '', 'Jin', '', NULL, 'jin_s@outlook.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '07/07/2001', 'Male', NULL, '123', '1780310195631916', '', '', 'assets/uploads/profile_photo/photo_0.13956000_1499441346.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(85, '', '', '221.121.151.228', 'Barbershop9', '$2y$08$qKKdu2FW/d893nN25w2ep.yavHhN/YTogmWakqOOEPvuWKXMoxU8q', NULL, 'barbershop9@email.com', NULL, NULL, NULL, NULL, 1496893811, 1496909285, 1, NULL, NULL, NULL, NULL, NULL, '213123123', '', '', '', 'assets/uploads/profile_photo/photo_0.05022000_1496893966.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', 'Australia Ave, Sydney Olympic Park NSW 2127, Australia', '41.785834', '123.406417', '09:00 AM', '06:00 PM', '10:00 AM', '05:00 PM', '11:00 AM', '04:00 PM', 'Description barbershop9 sdfsdfsdfsd sdfsdf sdfsdfsf sdfsdfsf sdfwewesdf e wed sdfsdfsf sdf sdf sdf sdf said FDA fsdfsdf sdfsdf sdf. sdfsd f'),
(86, '', '', '', 'Jack Garvin', '', NULL, 'jackgrvn@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '04/02/1994', 'Male', NULL, '07960037894', '10212361451647009', '', '', 'assets/uploads/profile_photo/photo_0.51407000_1499098699.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(87, '', '', '', 'Great Cutzzz', '', NULL, 'jackgrvn@googlemail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, '049605554', '', '', '108569671161539273988', 'assets/uploads/profile_photo/photo_0.14657800_1501068013.jpg', 'barber_shop', 'real', NULL, 'online', 'Facebook', 'insta', 'tweet', '98 Cliff Lane, Ipswich, IP3 0PJ, England', '52.044838', '1.168369', '09:00 am', '05:00 pm', '10:00 am', '04:00 pm', '12:00 am', '01:00 am', 'A wonderful shop, operating in Stratford for 4 years. Friendly environment and drink upon arrival '),
(88, '', '', '85.255.236.27', 'jackgarvin', '$2y$08$y0ENZOtcSNUAgqiVdE3cMuB6SaQgCOwYw1bUi8cFWEUkglqUPXfa6', NULL, 'jack@email.com', NULL, NULL, NULL, NULL, 1496929427, NULL, 1, NULL, NULL, '04/02/1994', 'Male', NULL, '07960037894', '', '', '', 'assets/uploads/profile_photo/photo_0.51758300_1496929462.jpg', 'barber', 'real', 0, 'online', '', '', '', '', '', '', '', '', '', '', '', '', 'a good barber '),
(89, '', '', '85.255.236.27', 'Jeremy Beaumont', '$2y$08$VjUUsrn.C261P2ZmwMd.8O/PlR7P5U8IKMf.CyEnXk5Y6iv7UQ1GC', NULL, 'barbershop18@email.com', NULL, NULL, NULL, NULL, 1496937353, NULL, 1, NULL, NULL, NULL, NULL, NULL, '079650046845', '', '', '', 'assets/uploads/profile_photo/photo_0.06816900_1496937418.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', 'London SE1, UK', '51.509958', '-0.059960', '10:00 am', '06:00 pm', '08:00 am', '02:00 pm', '04:00 pm', '05:00 pm', 'lovely place'),
(90, '', '', '104.238.51.90', 'Customer4', '$2y$08$EofXZ57f.SC90rx11RssCeS35HOQldqSFFwshRrbnUS1/VavFSuEi', NULL, 'customer4@email.com', NULL, NULL, NULL, NULL, 1496941433, 1498031521, 1, NULL, NULL, '08/06/2001', 'Male', NULL, '2342342', '', '', '', 'assets/uploads/profile_photo/photo_0.26962900_1496941463.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(91, 'b3140e1a-82f8-4cc6-866c-9cc9c92c21af', '', '104.238.51.90', 'Customer5', '$2y$08$nTuThdERH04P.6Uu2L.MgebSSkrUpV0dL4gE7fbR0cBUszHL4ZKZ.', NULL, 'customer5@email.com', NULL, NULL, NULL, NULL, 1496941709, 1499508129, 1, NULL, NULL, '08/06/1998', 'Male', NULL, '222', '', '', '', 'assets/uploads/profile_photo/photo_0.87984600_1496941831.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(92, '', '', '85.255.236.27', 'Jeremy ', '$2y$08$kXWSiXZzpVIbXanAhydbL.qWhErE96KNnEKOuooh9g.uzZbFfCO.O', NULL, 'jeremy@mail.com', NULL, NULL, NULL, NULL, 1496945578, 1496996678, 1, NULL, NULL, '05/06/2017', 'Male', NULL, '07960034894', '', '', '', 'assets/uploads/profile_photo/photo_0.63345900_1496945638.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(93, '', '', '104.238.51.16', 'Barber8', '$2y$08$hCqG3Cuf.a6aTLp0Dpp1lOyAxE8yAMP/MaKurbZbVUoub.xyhwL2C', NULL, 'barber8@email.com', NULL, NULL, NULL, NULL, 1497534264, NULL, 1, NULL, NULL, '15/06/1993', 'Male', NULL, '234234234', '', '', '', 'assets/uploads/profile_photo/photo_0.70203700_1497534363.jpg', 'barber', 'real', 55, 'online', '', '', '', '', '', '', '', '', '', '', '', '', 'Description Barber8 sfsdfsdfsdfsdfsdf sdf sdfsdf sdf sdfsdfsdfsdf'),
(94, '', '', '104.238.51.16', 'Barbershop8', '$2y$08$gfodOvnhPKS.3N0wka4uu.ca7B2Jh5rqbyP1NV453l5GTuf.bd23q', NULL, 'barbershop8@email.com', NULL, NULL, NULL, NULL, 1497534512, NULL, 1, NULL, NULL, NULL, NULL, NULL, '234234', '', '', '', 'assets/uploads/profile_photo/photo_0.02008500_1497534601.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', '十一纬路, Shenyang, Liaoning, China', '41.792211', '123.432850', '09:00 AM', '06:00 PM', '10:00 AM', '05:00 PM', '10:00 AM', '04:00 PM', 'sdfsdfsdfsdf'),
(95, '', '', '104.238.51.16', 'Barber9', '$2y$08$gMJmKpyiBPFwsvLF8uxsvOOQx.a/sMORLOSVKOAP5H1cEolimzPkW', NULL, 'barber9@email.com', NULL, NULL, NULL, NULL, 1497536462, 1497537556, 1, NULL, NULL, '15/06/1993', 'Male', NULL, '234234', '', '', '', 'assets/uploads/profile_photo/photo_0.48409400_1497537593.jpg', 'barber', 'real', 87, 'online', 'https://Facebook.com', 'https://instagram.com', 'https://twitter.com', '', '', '', '', '', '', '', '', '', 'sdfsdfdsf'),
(96, '', '', '104.238.51.16', 'Barbershop10', '$2y$08$Jy.sbD24L1P06JtVkP9OE.ko13VVLH1fzwx06IilJSpbPnDohZ69S', NULL, 'barbershop10@email.com', NULL, NULL, NULL, NULL, 1497537642, 1497537893, 1, NULL, NULL, NULL, NULL, NULL, '234234', '', '', '', 'assets/uploads/profile_photo/photo_0.59284000_1497537783.jpg', 'barber_shop', 'real', NULL, 'online', 'sdfsdfsdf', 'sdfsdfdsf', 'sdfsdfsdf dad', 'Namadgi National Park, Tennent ACT 2620, Australia', '-35.569145', '148.876772', '05:11 AM', '05:11 PM', '09:52 AM', '05:55 PM', '09:11 AM', '05:39 PM', 'Description barbershop10 sdfsdf sdfsdfsdf add sdfsdfsdfsdf asdf asdf asdf sad faded asdf add sadfsdfsd feast asdfsadf asdf asdf'),
(97, '', '', '85.255.235.103', '', '$2y$08$Qoy5Gpb2sJdABxmlkF6XMOZaXqsaUi.eNuw87zaS1PTQm6/jvn59G', NULL, 'jack@gmail.com', NULL, NULL, NULL, NULL, 1497640493, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'barber', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(99, '', '', '', 'guest1', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(100, '', '', '', 'guest2', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(101, '', '', '', 'guest3', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(102, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(103, '', '', '', 'jamea', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(104, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(105, '', '', '', 'guest5', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(107, '', '16122033-9bf3-4897-a2dd-07cfa1d0a158', '125.227.221.26', 'yang', '$2y$08$IOlVxicN0wD3oL9T3U.Dd.DSfaHjNaQbes7lxGh3OSgcIY8lO0kY2', NULL, 'yangyang511@outlook.com', NULL, NULL, NULL, NULL, 1498233133, 1501580245, 1, NULL, NULL, '23/06/1996', 'Male', NULL, '23423', '', '', '', 'assets/uploads/profile_photo/photo_0.45359900_1498233243.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(108, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(109, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(110, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(111, '', '', '', 'James ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(112, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(113, '', '', '60.249.34.38', 'customer10', '$2y$08$9QcteUQIBvLCWPeVwo4CUuGMGhMPDwlRrB2p1df7P2AsRrDIpQCP.', NULL, 'customer10@email.com', NULL, NULL, NULL, NULL, 1498313534, 1498313971, 1, NULL, NULL, '24/06/2003', 'Male', NULL, '1234556', '', '', '', 'assets/uploads/profile_photo/photo_0.75580700_1498313572.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(114, '', '', '', 'guest10', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(115, 'ad5e5f39-ff63-46e9-b5af-71514a9d01b2', '', '', 'Rajivan Somasunderam', '', NULL, 'rajivan.s6@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '31/10/1993', 'Male', NULL, '07917051331', '', '', '103128760668069245031', 'assets/uploads/profile_photo/photo_0.68588700_1498372584.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(116, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(117, '', '', '', 'john', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(118, '', '', '', 'barb', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(119, '', '', '', 'jsck', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(120, '', '', '', 'baber', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(121, '', '', '', 'lunch', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(122, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(123, '', '', '109.156.177.52', 'SuperCuts', '$2y$08$aEl2dsoL/6JPvL5HPumrSO/23tmSGc1GCM1KdMRcrIeR7vjxN4cMy', NULL, 'j.garvin@email.com', NULL, NULL, NULL, NULL, 1498418540, NULL, 1, NULL, NULL, NULL, NULL, NULL, '07960037894', '', '', '', 'assets/uploads/profile_photo/photo_0.73262100_1498423834.jpg', 'barber_shop', 'real', NULL, 'online', 'Facebook/link', 'insta', 'tweet', 'St. Paul\'s Cathedral, London, EC4M, England', '51.513845', '-0.098351', '09:00 am', '05:00 pm', '10:00 am', '05:00 pm', '07:00 am', '08:00 am', 'Nice barbers, walk in and grab a seat with a nice beverage '),
(128, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(129, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(134, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(135, '', '', '', 'barbe', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(141, '', '', '', 'sarah', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(142, '41553942-a9f0-4058-9c54-fc6fce26f205', '', '', 'Sean Wilson', '', NULL, 'coolboisean@hotmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '14/08/1994', 'Male', NULL, '07792771394', '10155496204474686', '', '', 'assets/uploads/profile_photo/photo_0.51056500_1498766696.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(143, '2f79748f-10f3-4efe-9fd4-44bd631cb604', '', '', 'Jack Egan', '', NULL, 'jack.egan93@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '02/09/1993', 'Male', NULL, '07889395933', '10155341195521677', '', '', 'assets/uploads/profile_photo/photo_0.84540700_1502542798.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(144, '', '', '', 'barber', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(145, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(146, '', '', '', 'georgia', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(147, '', '', '', 'Sarah ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(148, '', '', '', 'jaxk', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(149, '', '', '', 'Patrick Foley', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(150, '', '', '', 'james ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(151, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(152, '', '', '', NULL, '', NULL, 'flyflyerson4@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '648737848655655', '', '', '', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(153, '', '', '104.238.46.56', '', '$2y$08$UTkhojWAdsEidRdNEMDA7eMX76g482sD/OUunXiSfvOcz4cOl3RM6', NULL, 'owner@email.com', NULL, NULL, NULL, NULL, 1499143177, 1499781697, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'barber_shop', 'real', NULL, 'online', '', '', '', 'St. Paul\'s Cathedral, London, EC4M, England', '51.513845', '-0.098351', '09:00 am', '05:00 pm', '10:00 am', '05:00 pm', '07:00 am', '08:00 am', ''),
(154, '', '', '85.255.236.17', 'James Kelly', '$2y$08$KNBZmnZXytJci9g7KbF8DeT1RX1l8SJ8jhk39fEQo2WYisHdEtV6.', NULL, 'jackgarvin@email.com', NULL, NULL, NULL, NULL, 1499173324, NULL, 1, NULL, NULL, '04/08/2016', 'Male', NULL, '07960037894', '', '', '', 'assets/uploads/profile_photo/photo_0.66409600_1499173354.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(155, '', '', '125.227.85.142', '', '$2y$08$ax0VqgTfQuZ6OpBx8zZrw.oU6ZMqg85/ghqG0bbWnyfjTgc0SMLcC', NULL, 'customer11@email.com', NULL, NULL, NULL, NULL, 1499186272, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(164, '', '', '121.222.126.14', 'WingsNDat', '$2y$08$xXBVtFWlkimaP4CdghWHMu9EDReehWTONjxUnoaRRgUUVtaT9DB0i', NULL, 'eli.winger@raywhite.com', NULL, NULL, NULL, NULL, 1499243180, NULL, 1, NULL, NULL, '13/08/1994', 'Male', NULL, '0439909699', '', '', '', 'assets/uploads/profile_photo/photo_0.28697500_1499243217.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(165, '', '', '', 'Todd Black', '', NULL, 'retodd33@hotmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '27/07/1986', 'Male', NULL, '07888877787', '10155499124059634', '', '', 'assets/uploads/profile_photo/photo_0.17228600_1499243798.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(166, 'b6de0287-1e47-4c71-87f1-32490888d00a', '', '5.64.20.131', 'sjuddin94', '$2y$08$GxQyvBhb1Kj81O6umfYZkerOt.R3Cs/JVKWEFvXU/IY5FJu8yasAy', NULL, 'sara-uddin@hotmail.com', NULL, NULL, NULL, NULL, 1499246400, NULL, 1, NULL, NULL, '12/12/1994', 'Famale', NULL, '07908885341', '', '', '', 'assets/uploads/profile_photo/photo_0.32286500_1499246517.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(169, 'bbbee523-6c41-4563-a369-2f9d9948fb04', '', '174.115.132.38', 'cliffs', '$2y$08$SQnTnbNRh7aejS/lKiq5mu4Ex/FJtdOH5PrFu4IeG12Ic8PzYGMQ.', NULL, 'stephencliff50@gmail.com', NULL, NULL, NULL, NULL, 1499253469, 1499697654, 1, NULL, NULL, '16/04/1961', 'Male', NULL, '6478914884', '', '', '', 'assets/uploads/profile_photo/photo_0.56567100_1499253756.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(170, '', '', '', 'jimmy', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(171, 'd4673506-06d9-4c04-bea7-4b7ef5ee210a', '', '', 'Kai Madhusudan', '', NULL, 'kailash1993@hotmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '01/11/1993', 'Male', NULL, '07969065964', '10155624125991155', '', '', 'assets/uploads/profile_photo/photo_0.56841200_1499258865.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(172, '', '', '', 'Tommy Hopkins', '', NULL, 'thomasgeorgeuk@hotmail.co.uk', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '07/07/1992', 'Male', NULL, '07799847802', '10155343521606977', '', '', 'assets/uploads/profile_photo/photo_0.36466700_1499258964.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(173, '', '', '213.120.251.74', '', '$2y$08$Bw3apF6rmGEU.N5RX0tnUuPxyjrFJYq1PWrKeujNnM//7BVU8TEuO', NULL, 'm.garvin@gardiner.com', NULL, NULL, NULL, NULL, 1499263408, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'barber_shop', 'real', NULL, 'online', '', '', '', 'St. Paul\'s Cathedral, London, EC4M, England', '51.513845', '-0.098351', '09:00 am', '05:00 pm', '10:00 am', '05:00 pm', '07:00 am', '08:00 am', ''),
(174, '', '', '', NULL, '', NULL, 'g.lillian.gray@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10206755301480760', '', '', '', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(175, '', '', '', 'Sarah Bird', '', NULL, 'sarahb_94x@hotmail.co.uk', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '25/07/1994', 'Famale', NULL, '079665852584', '10155623108810992', '', '', 'assets/uploads/profile_photo/photo_0.85887900_1499278109.jpg', 'barber', 'real', 89, 'offline', 'Facebook/', 'instagram.com/sarahbird ', 'twitter', '', '', '', '', '', '', '', '', '', 'Hello'),
(200, '', '', '118.163.176.125', '', '$2y$08$lEvx..x4Pls1vy8TpFzcHOzcxe2j79up9SuNm5lHjBJExYVNmW2su', NULL, 'barber111@email.com', NULL, NULL, NULL, NULL, 1499356081, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'barber', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(201, 'd88aaae6-cbe4-47ef-978a-e1d942a13c20', '', '', 'Patrick Foley', '', NULL, 'patrickfoley1994@hotmail.co.uk', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '10/06/1994', 'Male', NULL, '07580294827', '1412740538819396', '', '', 'assets/uploads/profile_photo/photo_0.37338000_1499370196.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(202, '75856dfb-11ad-4dc9-b08e-a5de99bc51a7', '', '', 'Jake Burgess', '', NULL, 'jakecburgess@outlook.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '09/08/1994', 'Male', NULL, '07587184973', '10155552642444588', '', '', 'assets/uploads/profile_photo/photo_0.79985400_1499374217.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(209, '503bbda9-3ff0-4a21-92c2-e23dd1ce0195', '', '', 'Sophie Elliott', '', NULL, 'soph.elliott@hotmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '11/06/1993', 'Male', NULL, '07971193963', '10150901448284970', '', '', 'assets/uploads/profile_photo/photo_0.32006300_1499436401.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(210, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(211, '', '', '', 'garvin', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(212, '', '16122033-9bf3-4897-a2dd-07cfa1d0a158', '', 'Surya Goud', '', NULL, 'suryagoud419@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '07/07/2000', 'Male', NULL, '5555', '1555479427829628', '', '', 'assets/uploads/profile_photo/photo_0.13287400_1499438201.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(213, '4fe79f75-5e89-42b1-8665-07f93a3c3014', '', '', 'Siobhan Jordan', '', NULL, 'toctick@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '15/02/1993', 'Famale', NULL, '07517452594', '10156868208007925', '', '', 'assets/uploads/profile_photo/photo_0.02895400_1499517898.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(214, 'b17d134f-c1c0-41a2-a810-79b506b45d0a', '', '82.132.241.207', 'kay_cream', '$2y$08$BnnKbaK3/sKNuWLrgkNdtO0cCpkAUuIO4T.wKQesg5rKObLJfZfxO', NULL, 'kay_cream@yahoo.com', NULL, NULL, NULL, NULL, 1499616119, NULL, 1, NULL, NULL, '16/07/1985', 'Famale', NULL, '07923043756', '', '', '', 'assets/uploads/profile_photo/photo_0.52190000_1499616195.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(215, 'd22b01fe-7700-4c84-95c9-36f6bb29cf37', '', '', 'Siobhan Morris', '', NULL, 'paws129@msn.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '08/12/2019', 'Famale', NULL, '07971664545', '10155329517720943', '', '', 'assets/uploads/profile_photo/photo_0.59786200_1499632417.jpg', 'barber', 'real', 41, 'online', 't', 't', 'g', '', '', '', '', '', '', '', '', '', 'feel good hairdressing '),
(216, '', '', '94.192.15.53', 'molive', '$2y$08$05yo1J7klC0mTgeSWiqZnu6zlYOwwy4sYzx2E1dDts3JNykRNYbOe', NULL, 'molive_@hotmail.co.uk', NULL, NULL, NULL, NULL, 1499632338, NULL, 1, NULL, NULL, '04/06/1990', 'Male', NULL, '07799833355', '', '', '', 'assets/uploads/profile_photo/photo_0.64511600_1499632363.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(217, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(218, '', '', '', 'bon', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(219, '', '', '', 'tia', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(220, '', '', '', 'boby', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(221, '', '', '', 'Grace Titmarsh', '', NULL, 'grace.titmarsh@hotmail.co.uk', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '25/09/1994', 'Famale', NULL, '07875564724', '10159056746270192', '', '', 'assets/uploads/profile_photo/photo_0.80394000_1499708070.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(222, '', '', '', 'Michael', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(223, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(224, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(225, '', '', '', 'guest3', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(226, '', '', '', 'guest7', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(227, '', '', '', 'guest00', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(228, '', '', '', 'getsdf', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(229, '', '', '61.216.161.190', '', '$2y$08$K1SvjLyOjdEQv6GcjQ9UteneT7VPVyWK0xxrNrm/3AE0OjOA3n8JG', NULL, 'barbershop35@email.com', NULL, NULL, NULL, NULL, 1499741222, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'barber_shop', 'real', NULL, 'online', '', '', '', 'St. Paul\'s Cathedral, London, EC4M, England', '51.513845', '-0.098351', '09:00 am', '05:00 pm', '10:00 am', '05:00 pm', '07:00 am', '08:00 am', ''),
(230, 'fbdd5ab5-b004-45dc-ae43-3eee099b341d', '', '', 'Jake Miller', '', NULL, 'millzy_9@hotmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '02/04/1990', 'Male', NULL, '07577749312', '10155326535395218', '', '', 'assets/uploads/profile_photo/photo_0.22025400_1499780213.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(231, '90a29af7-1931-4253-8a24-298bc6cad244', '', '', 'Gillian Ni Cheallaigh', '', NULL, 'gkelly3993@hotmail.co.uk', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '03/09/1993', 'Famale', NULL, '07477603356', '10209183319532292', '', '', 'assets/uploads/profile_photo/photo_0.58483200_1499787294.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(233, '835831f8-6ae8-44af-8cb2-99e7bb34035d', '', '217.39.7.254', 'johngarvin1@hotmail.com', '$2y$08$ttE485lCy2OkxK2VZAwfbuwrCGvgri080qsT39kiwGgafK7hGWDCO', NULL, 'johngarvin1@hotmail.com', NULL, NULL, NULL, NULL, 1499859558, NULL, 1, NULL, NULL, '16/01/1962', 'Male', NULL, '07557204161', '', '', '', 'assets/uploads/profile_photo/photo_0.49645100_1499860114.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(234, '', '11bfcba4-7eaa-427c-8abd-ec888ef3c937', '', 'Jonny Hopkins', '$2y$08$EKLiyxv75Xec0Lh2R1sWTO7RcNQpa3XvDtEUmSNTN1AbH2FWQzi0C', NULL, 'jonnyhopkins@hotmail.co.uk', NULL, NULL, NULL, NULL, 0, 1502883544, 1, NULL, NULL, '05/03/1994', 'Male', NULL, '07588564567', '10213919362204980', '', '', 'assets/uploads/profile_photo/photo_0.42431000_1499878122.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(235, '', '', '', 'guest', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(236, '', '', '', 'Michael Garvin', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '14/07/2017', 'Male', NULL, '07912556687', '', '1603775185', '', 'assets/uploads/profile_photo/photo_0.60168900_1500014100.jpg', 'barber', 'real', 89, 'offline', 'gg', 'df', 'xf', '', '', '', '', '', '', '', '', '', 'yeah yeah yeah'),
(237, '', '', '', 'chcx', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(238, '', '', '', 'hjccjd', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(239, '', '', '61.219.114.123', 'Customer50', '$2y$08$2BpmbuwKUiPrK1sKVSkltu/M2/zoqnkQ5kprQvIH1.N52HI9gft46', NULL, 'customer50@email.com', NULL, NULL, NULL, NULL, 1500301806, NULL, 1, NULL, NULL, '17/07/1991', 'Male', NULL, '234234234', '', '', '', 'assets/uploads/profile_photo/photo_0.21650300_1500301849.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(240, '14f08615-38a6-4cfe-ab19-ca6ca4009824', '', '85.255.233.135', 'jzensen', '$2y$08$n3T0FA5nD7PcAnr09P.78eRvFWzjgDxz0ssl7fVSkHlSSXB/L01FO', NULL, 'jzensentan@gmail.com', NULL, NULL, NULL, NULL, 1500307119, NULL, 1, NULL, NULL, '20/10/1993', 'Male', NULL, '07917041696', '', '', '', 'assets/uploads/profile_photo/photo_0.36440100_1500307142.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(241, 'd7142b05-082f-4c0b-8be1-1568a8b63e36', '', '', 'Ben Alalouff', '', NULL, 'alaloufffb@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '06/01/1994', 'Male', NULL, '07536092769', '10155122719894262', '', '', 'assets/uploads/profile_photo/photo_0.13854500_1500371211.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(242, '', '', '', 'Charlie Beeson', '', NULL, 'charliebeeson1@hotmail.co.uk', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '01/01/1994', 'Male', NULL, '07917094480', '10213621703846559', '', '', 'assets/uploads/profile_photo/photo_0.40246200_1500405319.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(244, '', '', '', 'John Brown', '', NULL, 'brownrestaurantgroup@yahoo.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '21/07/1983', 'Male', NULL, '5617978327', '10213624203464104', '', '', 'assets/uploads/profile_photo/photo_0.37788800_1500575157.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(245, '', '', '', 'testuser', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(246, '', '', '86.130.220.12', 'jackgarvin', '$2y$08$JqGdcADI.jru1jSCzCZNJe.u5ZjfwYk99bHIvTWQpCkjZlQvjaYH.', NULL, 'jackgarvin1994@icloud.com', NULL, NULL, NULL, NULL, 1501067740, 1501068646, 1, NULL, NULL, '04/02/1994', 'Male', NULL, '07960037894', '', '', '', 'assets/uploads/profile_photo/photo_0.86128300_1501067817.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(247, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(248, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(249, '', '', '', 'jane', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(250, '835831f8-6ae8-44af-8cb2-99e7bb34035d', '', '', 'John Garvin', '', NULL, 'johngarvin1@hotmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '16/01/1962', 'Male', NULL, '07557204161', '1538396856225000', '', '', 'assets/uploads/profile_photo/photo_0.04700400_1501192643.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(251, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(252, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(253, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(254, '', '', '', 'Jordan ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(255, '', '', '', 'guest_user11', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(256, '', '', '', 'guest ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(257, '', '', '', 'sdfds', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(261, '', 'cf83c52b-606b-41fc-a16e-9ca827804641', '213.205.198.200', 'Olly', '$2y$08$.hQUcsCN3/Q/4WlanCL9fuCfEHram5chpplkKALsA2hdoCKmRIz6.', NULL, 'oliver.cuttingis@hotmail', NULL, NULL, NULL, NULL, 1501605112, NULL, 1, NULL, NULL, '16/09/2017', 'Male', NULL, '07817376821', '', '', '', 'assets/uploads/profile_photo/photo_0.61687600_1501605253.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(262, '', '', '151.227.204.209', 'Jez Beaumont', '$2y$08$rONflC6fbYti7obdRB5xVePhY35k4jbEMGgt38Cp/L2Z54l/n6nn.', NULL, 'jayjay.24@hotmail.com', NULL, NULL, NULL, NULL, 1501614266, 1501615488, 1, NULL, NULL, '02/10/1993', 'Male', NULL, '07758616731', '', '', '', 'assets/uploads/profile_photo/photo_0.75862700_1501699749.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(263, '', 'b3cc9f33-13fd-46c4-a799-020bf268ddc8', '90.220.195.232', 'georgiahump', '$2y$08$FeQUB8wS6N/e8yO7L3bggOEdsIA2uniYaMfFhqrx0Ic8Y3oH7mkcW', NULL, 'georgia.garvin@gmail.com', NULL, 'TMfO2GvXwOGFnwGShbywsOdb64f72a7d1ab880a8', 1501923741, NULL, 1501621079, NULL, 1, NULL, NULL, '14/06/1991', 'Famale', NULL, '07766954719', '', '', '', 'assets/uploads/profile_photo/photo_0.90720600_1501621110.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(264, '', '8144a904-ae49-42e0-abeb-5e3144730c82', '94.197.120.35', 'm.garvin', '$2y$08$inm9MffMaRT1nQnEPZT4.u4RVXXFkxAYuYaKtGGE3S1FWYh3xSQv6', NULL, 'michaelgarvin@hotmail.co.uk', NULL, NULL, NULL, NULL, 1501670621, 1503491216, 1, NULL, NULL, '02/08/2017', 'Male', NULL, '07912556687', '', '', '', 'assets/uploads/profile_photo/photo_0.96805300_1502783969.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(265, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(266, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(267, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `users` (`id`, `one_id`, `one_id_android`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `birthday`, `gender`, `company`, `phone`, `fb_id`, `tw_id`, `g_id`, `photo`, `user_type`, `is_guest`, `included_shop_id`, `online_status`, `fb_profile_link`, `instagram_profile_link`, `twt_profile_link`, `address`, `lati`, `lang`, `work_time_start`, `work_time_end`, `sat_time_start`, `sat_time_end`, `sun_time_start`, `sun_time_end`, `description`) VALUES
(268, '', '', '', 'jamws', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(269, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(270, '', '', '', 'alfie', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(271, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(272, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(273, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(274, '', '3056cc60-392c-463f-b5dc-c1ee53a01dc0', '77.99.216.221', 'ChrisMacca92', '$2y$08$.IfhkDFNSpdwgAT8/dQq0.dX.6ZcfbdGDm26BbhzNCMvyEDuy/b1C', NULL, 'chris.mcallister@outlook.com', NULL, NULL, NULL, NULL, 1501694340, NULL, 1, NULL, NULL, '31/12/1992', 'Male', NULL, '075009617971', '', '', '', 'assets/uploads/profile_photo/photo_0.21463300_1501695315.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(275, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(276, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(277, '', '', '176.250.47.166', 'Curly Kie\'s', '$2y$08$QdVETEaFSucPabtCyS3.OuogotM97HdCsmxJuYeyojbeAZ6k7Kdl.', NULL, 'kie.humphreys@gmail.com', NULL, NULL, NULL, NULL, 1501699347, NULL, 1, NULL, NULL, NULL, NULL, NULL, '996', '', '', '', 'assets/uploads/profile_photo/photo_0.96278200_1501699608.jpg', 'barber_shop', 'real', NULL, 'online', '@curlykies', 'hdi', 'ff', '142 Fore HamletIpswichIP3 8AF영국', '52.05073849999999', '1.1684332', '07:42 PM', '10:42 PM', '02:42 AM', '09:42 PM', '00:42 PM', '10:42 PM', 'way cool'),
(278, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(279, '', '', '', 'james ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(280, '', '', '', 'adam ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(281, '', 'b3cc9f33-13fd-46c4-a799-020bf268ddc8', '176.250.47.166', '', '$2y$08$eFRQCF4emag4Xdro3s5zoe8FErIY86tMqoMAxeOUgQjCShyB3RrSK', NULL, 'georguia.jdi.@jf', NULL, NULL, NULL, NULL, 1501699834, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'barber', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(282, '', '', '176.250.47.166', 'curly Kie\'s', '$2y$08$4BAd19aYkUvYBzsFzh0XHeNOFtrJJC4cnZghlEqcem.lUQYSFa3Ey', NULL, 'georhn', NULL, NULL, NULL, NULL, 1501699866, NULL, 1, NULL, NULL, '19/08/2017', 'Famale', NULL, '996', '', '', '', 'assets/uploads/profile_photo/photo_0.68542800_1501701145.jpg', 'barber', 'real', 41, 'online', 'g', 'y', 'j', '', '', '', '', '', '', '', '', '', 'rockin\''),
(283, '', '', '', 'Michael', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(284, '', '8144a904-ae49-42e0-abeb-5e3144730c82', '188.29.164.53', '', '$2y$08$p/4F5tFclmdeGzm8aXsjq.RuL0I3gGBugMvqZv16MmxAXKphCj9CK', NULL, 'michael_garvin@hotmail.co.uj', NULL, NULL, NULL, NULL, 1501707069, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'barber', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(285, '', '8144a904-ae49-42e0-abeb-5e3144730c82', '188.29.164.53', '', '$2y$08$SX.uSwq/g.RR6akXr3RQR.3W/0shtKlVWZ.R2OZ9JnapjqQmGrlMy', NULL, 'michaelgarvin@hotmail.co.uj', NULL, NULL, NULL, NULL, 1501707110, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'barber', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(286, '', '8144a904-ae49-42e0-abeb-5e3144730c82', '188.29.164.53', '', '$2y$08$cg4Dx5y1OIMgCdHObHver.RSbHxlkw0cqsTKSd.hb58vwRPDJBuFu', NULL, 'michaelgarvin', NULL, NULL, NULL, NULL, 1501707292, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'barber', 'real', NULL, 'offline', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(287, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(288, '', '', '', '2', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(289, '', '', '124.92.206.68', 'aaa', '$2y$08$P2vZuMd5GkZV8rqedKa.sOArwY0Mg6RXM2klOrG1gqLEW9lxWOTmq', NULL, 'aaa@email.com', NULL, NULL, NULL, NULL, 1501858852, 1501859617, 1, NULL, NULL, '04/08/2017', 'Famale', NULL, '1222', '', '', '', 'assets/uploads/profile_photo/photo_0.76676900_1501858910.jpg', 'barber', 'real', 0, 'online', '', '', '', '', '', '', '', '', '', '', '', '', 'dgg'),
(290, '', '', '', 'gghjghj', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(291, '', '', '', 'gdfgdf', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(292, '', 'b3cc9f33-13fd-46c4-a799-020bf268ddc8', '86.179.37.220', 'Jacky\n', '$2y$08$eUL7WyllXiptLP1v6I7RUOsdhfR6GBKYhe1sjRxCMZYyPgqF5U7y6', NULL, 'jacky@email.com', NULL, NULL, NULL, NULL, 1501925841, 1501927861, 1, NULL, NULL, '04/02/1994', 'Male', NULL, '07960037894', '', '', '', 'assets/uploads/profile_photo/photo_0.47902200_1501925900.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(293, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(294, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(295, '', '', '', 'andy', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(296, '', 'b3cc9f33-13fd-46c4-a799-020bf268ddc8', '176.248.78.9', 'gg', '$2y$08$d9MrTF5WcvOo5ya1YjJCaOgLr8XKhOCEi/lSsbc.rmJpmrkZekML2', NULL, 'gei', NULL, NULL, NULL, NULL, 1501962966, NULL, 1, NULL, NULL, '19/08/1994', 'Male', NULL, '369', '', '', '', 'assets/uploads/profile_photo/photo_0.44093200_1501962985.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(297, '', 'b3cc9f33-13fd-46c4-a799-020bf268ddc8', '176.248.78.9', 'gg', '$2y$08$4NrameYaPgzCT4RU1Os15O6FZqj2Tbtt/yeW4eE1RL7Av1d8NohQe', NULL, 'ge', NULL, NULL, NULL, NULL, 1501963137, NULL, 1, NULL, NULL, '02/08/2017', 'Male', NULL, '999', '', '', '', 'assets/uploads/profile_photo/photo_0.16164400_1501963157.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(298, '', 'b3cc9f33-13fd-46c4-a799-020bf268ddc8', '176.248.78.9', '', '$2y$08$aYRmStbqMNwR7g/2XXA50.X/EcLDJD9jJuY3hayL1rlM9fMmzQr3G', NULL, 'ge66', NULL, NULL, NULL, NULL, 1501963588, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'barber_shop', 'real', NULL, 'online', '', '', '', 'St. Paul\'s Cathedral, London, EC4M, England', '51.513845', '-0.098351', '09:00 am', '05:00 pm', '10:00 am', '05:00 pm', '07:00 am', '08:00 am', ''),
(299, '', 'b3cc9f33-13fd-46c4-a799-020bf268ddc8', '176.248.78.9', 'ggs', '$2y$08$kmW.fSyf7kuaMgJB56WEc.r4aftzm1MooZ/10pIjcKp0xtY/8AsMG', NULL, 'georgia', NULL, NULL, NULL, NULL, 1501963611, NULL, 1, NULL, NULL, NULL, NULL, NULL, '800', '', '', '', 'assets/uploads/profile_photo/photo_0.13305500_1501963741.jpg', 'barber_shop', 'real', NULL, 'online', 'c', 'c', 'c', 'Cervantes 202-300S2124CFD Villa Gobernador GalvezSanta Fe아르헨티나', '-33.0066516', '-60.6176951', '00:06 PM', '07:06 PM', '09:07 PM', '10:07 PM', '08:06 AM', '03:06 PM', 'h'),
(300, '', '', '', 'kie', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(301, '', '', '', 'bob', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(302, '', '', '', 'bob', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(303, '', '', '', 'geoff', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(304, '', '', '', 'alf', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(305, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(306, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(307, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(308, '', '', '', 'aaldie', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(309, '', '', '', 'josh ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(310, '', '', '', 'slfov', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(311, '', '', '', 'sfsdf', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(330, '', '', '', 'hyt', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(331, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(332, '', '', '', 'jamie', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(333, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(334, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(335, '', '', '', 'john', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(336, '3fbe002d-95bc-4640-b268-bbe9db3e76ef', '', '', 'KieranClements', '', NULL, 'kieran.clements@btopenworld.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '20/11/1993', 'Male', NULL, '07796925440', '', '339224272', '', 'assets/uploads/profile_photo/photo_0.55490600_1502469543.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(337, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(338, '', '', '90.213.142.107', 'g', '$2y$08$p13fRn0eu7d0zFPUHbGCC.bXLIxlr39baQpMS9EtAy0KMBIX4Ey5y', NULL, 'g', NULL, NULL, NULL, NULL, 1502487644, NULL, 1, NULL, NULL, '11/08/2017', 'Famale', NULL, '5', '', '', '', 'assets/uploads/profile_photo/photo_0.85955700_1502487659.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(339, '', '', '', 'James ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(340, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(341, '', '', '', 'louis', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(342, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(343, '', '', '62.232.183.194', 'Georgia', '$2y$08$AOAJtvERHtBWivZDHjrDaONipgM64iPJ6vMSaX9rYLb6O3ZlHxKly', NULL, 'georgia.humphreys@mail.com', NULL, NULL, NULL, NULL, 1502715211, NULL, 1, NULL, NULL, '30/08/2017', 'Famale', NULL, '07766954719', '', '', '', 'assets/uploads/profile_photo/photo_0.72438700_1502715231.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(344, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(345, '', '', '', 'bob ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(346, '', '', '', 'jimmy', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(347, '', 'b3cc9f33-13fd-46c4-a799-020bf268ddc8', '94.0.56.80', 'Cavendish cutz', '$2y$08$Mdb0LhkSpqs/awbgkd3e3.Ls4YZZB7l1YQ4LC1iXl7DPLKJ45hNdq', NULL, 'georgia-garvin@birketts.co.uk', NULL, NULL, NULL, NULL, 1502738976, 1502742233, 1, NULL, NULL, NULL, NULL, NULL, '316523', '', '', '', 'assets/uploads/profile_photo/photo_0.10457600_1502739960.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', '59-63 Cavendish StreetIpswichIP3 8AX영국', '52.0516547', '1.1708176', '01:29 AM', '10:29 PM', '02:29 AM', '11:29 PM', '01:29 AM', '10:29 PM', ''),
(348, '', 'b1458dc8-f443-4c3b-93dc-e9c4c97a6257', '94.0.56.80', 'k1eph', '$2y$08$kYFOZW/Dslwg7oc3XnLvsOXGslG53H34v/c7qKAQtV20BhYGm.McW', NULL, 'kie@clandb.co.uk', NULL, NULL, NULL, NULL, 1502740686, NULL, 1, NULL, NULL, '04/11/1983', 'Male', NULL, '07968280333', '', '', '', 'assets/uploads/profile_photo/photo_0.63006800_1502741159.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(349, '3ba2f33c-8356-4b98-8a5e-cd6136675174', '', '', 'Matt Foley', '', NULL, 'mattfoley@live.co.uk', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '20/11/1993', 'Male', NULL, '07853350949', '10209808642600489', '', '', 'assets/uploads/profile_photo/photo_0.84970800_1502780970.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(352, '', '', '', 'bob', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(353, '', '', '', 'bobob', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(354, '', '', '', 'boboboob', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(355, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(356, '', '', '', 'jeff', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(357, '', '', '', 'ali', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(358, '', '', '', 'clements', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(359, '', '', '', 'ALI', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(361, '', '', '', 'mingtai hua', '', NULL, 'mingtai.511@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '16/08/2017', 'Male', NULL, '5455564', '', '', '114579745932512661517', 'assets/uploads/profile_photo/photo_0.31674800_1502888387.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(362, '', '', '', 'Jeremy Alexander', '', NULL, 'jayjay.24@hotmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '02/10/1993', 'Male', NULL, '07758616731', '1756656417696399', '', '', 'assets/uploads/profile_photo/photo_0.60335400_1503311122.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(363, '', '', '', 'Qwork Barber app', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '14/08/1949', 'Male', NULL, '07777123456', '', '884831435147882496', '', 'assets/uploads/profile_photo/photo_0.13413700_1504104760.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(364, '', 'b3cc9f33-13fd-46c4-a799-020bf268ddc8', '', NULL, '', NULL, 'georgia.garvin@googlemail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '109971490208946274520', '', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(365, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(366, '', '', '', 'georgia', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(367, '', '', '', 'barber ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(368, 'bd3fe09d-2818-4997-947d-f134d5df54cf', '', '', 'John Paul', '', NULL, 'johnarpaul@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '12/10/1998', 'Male', NULL, '0834409106', '487147998308948', '', '', 'assets/uploads/profile_photo/photo_0.44428400_1503501714.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(369, '', '', '', 'James', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(370, '', '', '', 'bob ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(371, '', '', '', 'kieran ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(372, '', '', '', 'Jonny Hopkins', '', NULL, 'JonnyHopkins@hotmail.co.uk', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '05/03/1994', 'Male', NULL, '07588564567', '', '287367476', '', 'assets/uploads/profile_photo/photo_0.50081600_1503591214.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(373, '', '', '', 'ben', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(375, '', '16122033-9bf3-4897-a2dd-07cfa1d0a158', '', NULL, '', NULL, 'qworkhelp@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '113815553880242295590', '', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(376, '', '', '', 'james', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(377, '', '', '', 'John ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(378, '', '', '', 'barb', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(379, '', '', '', 'Jonathan Hopkins', '', NULL, 'jonnyhopkins594@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '05/03/1994', 'Male', NULL, '07588564567', '', '', '108619386204484127181', 'assets/uploads/profile_photo/photo_0.37819700_1504090998.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(380, '', '', '', 'james ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(381, '', '', '', 'John ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(382, '', '', '', 'pete', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(383, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(384, '', '', '', 'John ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(385, 'e88857c7-946e-4523-b794-a4ad876e808b', '', '', 'xtreem mobile', '', NULL, 'xtreemmobile2@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, '9413545237', '', '', '109301406620117177206', 'assets/uploads/profile_photo/photo_0.81943600_1504102713.jpg', 'barber_shop', 'real', NULL, 'online', '', '', '', 'Jaipur, Rajasthan, India', '27.020672', '75.941191', '10:00 AM', '11:00 PM', '11:00 AM', '11:00 PM', '11:00 AM', '11:00 PM', 'describe '),
(386, '', '', '', 'jayjay.24@hotmail.com', '', NULL, 'jayjay.24@hotmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, '02/10/1993', 'Male', NULL, '07758616731', '', '', '101041735685871596387', 'assets/uploads/profile_photo/photo_0.60173900_1504103889.jpg', 'customer', 'real', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(387, '', '', '', 'jack', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(388, '', '', '', 'jack ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(389, '', '', '', 'Alfonso ', '', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'customer', 'guest', NULL, 'online', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 10, 1),
(6, 12, 1),
(7, 13, 1),
(8, 14, 1),
(9, 16, 1),
(10, 17, 1),
(11, 18, 1),
(12, 19, 1),
(13, 20, 1),
(14, 21, 1),
(15, 22, 1),
(16, 23, 1),
(17, 24, 1),
(18, 25, 1),
(19, 26, 1),
(20, 27, 1),
(21, 28, 1),
(22, 29, 1),
(23, 30, 1),
(24, 31, 1),
(25, 32, 1),
(26, 33, 1),
(27, 34, 1),
(28, 35, 1),
(29, 36, 1),
(30, 37, 1),
(31, 38, 1),
(32, 39, 1),
(33, 40, 1),
(34, 41, 1),
(35, 42, 1),
(36, 43, 1),
(37, 44, 1),
(38, 45, 1),
(39, 46, 1),
(40, 47, 1),
(41, 48, 1),
(42, 49, 1),
(43, 50, 1),
(44, 51, 1),
(45, 52, 1),
(46, 53, 1),
(47, 54, 1),
(48, 55, 1),
(49, 56, 1),
(50, 76, 1),
(51, 77, 1),
(52, 78, 1),
(53, 79, 1),
(54, 80, 1),
(55, 81, 1),
(56, 82, 1),
(57, 83, 1),
(58, 85, 1),
(59, 88, 1),
(60, 89, 1),
(61, 90, 1),
(62, 91, 1),
(63, 92, 1),
(64, 93, 1),
(65, 94, 1),
(66, 95, 1),
(67, 96, 1),
(68, 97, 1),
(69, 106, 1),
(70, 107, 1),
(71, 113, 1),
(72, 123, 1),
(73, 124, 1),
(74, 153, 1),
(75, 154, 1),
(76, 155, 1),
(77, 162, 1),
(78, 163, 1),
(79, 164, 1),
(80, 166, 1),
(81, 167, 1),
(82, 168, 1),
(83, 169, 1),
(84, 173, 1),
(85, 176, 1),
(86, 177, 1),
(87, 178, 1),
(88, 179, 1),
(89, 180, 1),
(90, 181, 1),
(91, 182, 1),
(92, 183, 1),
(93, 184, 1),
(94, 185, 1),
(95, 186, 1),
(96, 187, 1),
(97, 200, 1),
(98, 214, 1),
(99, 216, 1),
(100, 229, 1),
(101, 233, 1),
(102, 239, 1),
(103, 240, 1),
(104, 246, 1),
(105, 258, 1),
(106, 259, 1),
(107, 260, 1),
(108, 261, 1),
(109, 262, 1),
(110, 263, 1),
(111, 264, 1),
(112, 274, 1),
(113, 277, 1),
(114, 281, 1),
(115, 282, 1),
(116, 284, 1),
(117, 285, 1),
(118, 286, 1),
(119, 289, 1),
(120, 292, 1),
(121, 296, 1),
(122, 297, 1),
(123, 298, 1),
(124, 299, 1),
(125, 312, 1),
(126, 313, 1),
(127, 314, 1),
(128, 315, 1),
(129, 316, 1),
(130, 317, 1),
(131, 318, 1),
(132, 319, 1),
(133, 320, 1),
(134, 321, 1),
(135, 322, 1),
(136, 323, 1),
(137, 324, 1),
(138, 325, 1),
(139, 326, 1),
(140, 327, 1),
(141, 328, 1),
(142, 329, 1),
(143, 338, 1),
(144, 343, 1),
(145, 347, 1),
(146, 348, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_groups`
--
ALTER TABLE `admin_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_users_groups`
--
ALTER TABLE `admin_users_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_access`
--
ALTER TABLE `api_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_limits`
--
ALTER TABLE `api_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jorders`
--
ALTER TABLE `jorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_groups`
--
ALTER TABLE `admin_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `admin_users_groups`
--
ALTER TABLE `admin_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `api_access`
--
ALTER TABLE `api_access`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `api_limits`
--
ALTER TABLE `api_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jorders`
--
ALTER TABLE `jorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1269;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=531;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=390;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
