#
# TABLE STRUCTURE FOR: ad_regions
#

DROP TABLE IF EXISTS `ad_regions`;

CREATE TABLE `ad_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_region` varchar(256) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `radius` varchar(256) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

INSERT INTO `ad_regions` (`id`, `ad_region`, `lat`, `lng`, `radius`, `order_id`) VALUES ('53', 'Mong Kok', '22.3203648', '114.169773', '2', '85');
INSERT INTO `ad_regions` (`id`, `ad_region`, `lat`, `lng`, `radius`, `order_id`) VALUES ('54', 'Washington', '38.9071923', '-77.0368707', '1', '86');
INSERT INTO `ad_regions` (`id`, `ad_region`, `lat`, `lng`, `radius`, `order_id`) VALUES ('55', 'New York Avenue Northwest', '38.9031763', '-77.021256', '2', '86');
INSERT INTO `ad_regions` (`id`, `ad_region`, `lat`, `lng`, `radius`, `order_id`) VALUES ('56', 'San Antonio', '29.4241219', '-98.4936282', '10', '86');
INSERT INTO `ad_regions` (`id`, `ad_region`, `lat`, `lng`, `radius`, `order_id`) VALUES ('57', 'Mong Kok', '22.3203648', '114.169773', '1', '87');
INSERT INTO `ad_regions` (`id`, `ad_region`, `lat`, `lng`, `radius`, `order_id`) VALUES ('58', 'Tsim Sha Tsui East', '22.2998509', '114.1788626', '0.5', '88');
INSERT INTO `ad_regions` (`id`, `ad_region`, `lat`, `lng`, `radius`, `order_id`) VALUES ('59', 'Holiday Inn Golden Mile Hong Kong', '22.2967628', '114.1727412', '5', '88');


#
# TABLE STRUCTURE FOR: ad_types
#

DROP TABLE IF EXISTS `ad_types`;

CREATE TABLE `ad_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `ad_types` (`id`, `type`) VALUES ('1', 'Full Body');
INSERT INTO `ad_types` (`id`, `type`) VALUES ('2', '2 Sided');
INSERT INTO `ad_types` (`id`, `type`) VALUES ('3', 'Back Door');


#
# TABLE STRUCTURE FOR: admin_groups
#

DROP TABLE IF EXISTS `admin_groups`;

CREATE TABLE `admin_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('1', 'webmaster', 'Webmaster');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('2', 'admin', 'Administrator');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('3', 'manager', 'Manager');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('4', 'staff', 'Staff');


#
# TABLE STRUCTURE FOR: admin_login_attempts
#

DROP TABLE IF EXISTS `admin_login_attempts`;

CREATE TABLE `admin_login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: admin_users
#

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('1', '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, NULL, NULL, NULL, NULL, 'DCqdqpnHBVvqthg2A/9VyO', '1451900190', '1528862191', '1', 'Webmaster', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('2', '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, NULL, '1451900228', '1496453429', '1', 'Admin', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('3', '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, '1451900430', '1465489585', '1', 'Manager', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('4', '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, '1451900439', '1465489590', '1', 'Staff', '');


#
# TABLE STRUCTURE FOR: admin_users_groups
#

DROP TABLE IF EXISTS `admin_users_groups`;

CREATE TABLE `admin_users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('2', '2', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('3', '3', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('4', '4', '4');


#
# TABLE STRUCTURE FOR: api_access
#

DROP TABLE IF EXISTS `api_access`;

CREATE TABLE `api_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: api_keys
#

DROP TABLE IF EXISTS `api_keys`;

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES ('1', '0', 'anonymous', '1', '1', '0', NULL, '1463388382');


#
# TABLE STRUCTURE FOR: api_limits
#

DROP TABLE IF EXISTS `api_limits`;

CREATE TABLE `api_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: api_logs
#

DROP TABLE IF EXISTS `api_logs`;

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: car_types
#

DROP TABLE IF EXISTS `car_types`;

CREATE TABLE `car_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `car_types` (`id`, `type`) VALUES ('1', 'Van');
INSERT INTO `car_types` (`id`, `type`) VALUES ('2', '5.5 ton Truck');
INSERT INTO `car_types` (`id`, `type`) VALUES ('3', '9 ton Truck');
INSERT INTO `car_types` (`id`, `type`) VALUES ('4', 'Tour Bus');
INSERT INTO `car_types` (`id`, `type`) VALUES ('5', 'Private Car');


#
# TABLE STRUCTURE FOR: groups
#

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `groups` (`id`, `name`, `description`) VALUES ('1', 'members', 'General User');


#
# TABLE STRUCTURE FOR: login_attempts
#

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: notifications
#

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_ids` varchar(256) NOT NULL,
  `message` varchar(256) NOT NULL,
  `n_sent` tinyint(4) NOT NULL DEFAULT '0',
  `n_read` tinyint(4) NOT NULL DEFAULT '0',
  `type` enum('message','cutting_time','remove','review','join','left') NOT NULL DEFAULT 'message',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1269 DEFAULT CHARSET=utf8;

INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1213', '45', '47', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 01:16:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1214', '45', '47', 'Please leave your review', '1', '0', 'review', '510', '2017-08-30 01:16:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1215', '364', '45', ' has joined your queue in position 1', '1', '0', 'join', '0', '2017-08-30 03:42:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1216', '45', '364', 'Please leave your review', '1', '0', 'review', '511', '2017-08-30 03:42:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1217', '364', '45', ' has joined your queue in position 4', '1', '0', 'join', '0', '2017-08-30 15:41:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1218', '45', '376', 'Please leave your review', '1', '0', 'review', '512', '2017-08-30 15:42:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1219', '45', '377', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 15:43:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1220', '45', '378', 'You are now 2nd in the queue. Estimation: 21 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 15:43:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1221', '45', '364', 'You are now 3rd in the queue. Estimation: 42 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 15:43:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1222', '45', '377', 'Please leave your review', '1', '0', 'review', '513', '2017-08-30 15:43:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1223', '45', '378', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 15:44:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1224', '45', '364', 'You are now 2nd in the queue. Estimation: 21 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 15:44:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1225', '45', '378', 'Please leave your review', '1', '0', 'review', '514', '2017-08-30 15:44:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1226', '45', '364', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 15:44:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1227', '45', '364', 'Please leave your review', '1', '0', 'review', '515', '2017-08-30 15:45:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1228', '234', '45', 'Jonny Hopkins has joined your queue in position 1', '1', '0', 'join', '0', '2017-08-30 19:04:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1229', '45', '234', 'Please leave your review', '1', '0', 'review', '516', '2017-08-30 19:05:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1230', '234', '45', 'Jonny Hopkins has joined your queue in position 4', '1', '0', 'join', '0', '2017-08-30 19:08:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1231', '45', '380', 'Please leave your review', '1', '0', 'review', '517', '2017-08-30 19:09:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1232', '45', '381', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 19:09:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1233', '45', '382', 'You are now 2nd in the queue. Estimation: 21 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 19:10:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1234', '45', '234', 'You are now 3rd in the queue. Estimation: 42 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 19:10:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1235', '45', '381', 'Please leave your review', '1', '0', 'review', '518', '2017-08-30 19:11:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1236', '45', '382', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 19:11:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1237', '45', '234', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 19:11:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1238', '45', '382', 'Please leave your review', '1', '0', 'review', '519', '2017-08-30 19:15:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1239', '45', '234', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 19:15:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1240', '45', '234', 'Please leave your review', '1', '0', 'review', '520', '2017-08-30 19:18:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1241', '234', '45', 'Jonny Hopkins has joined your queue in position 3', '1', '0', 'join', '0', '2017-08-30 19:20:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1242', '45', '383', 'Please leave your review', '1', '0', 'review', '521', '2017-08-30 19:21:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1243', '45', '384', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 19:21:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1244', '45', '234', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 19:21:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1245', '45', '384', 'Please leave your review', '1', '0', 'review', '522', '2017-08-30 19:22:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1246', '45', '234', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 19:22:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1247', '386', '282', 'jayjay.24@hotmail.com has joined your queue in position 1', '1', '0', 'join', '0', '2017-08-30 22:40:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1248', '363', '45', 'Qwork Barber app has joined your queue in position 2', '1', '0', 'join', '0', '2017-08-30 22:54:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1249', '45', '234', 'Please leave your review', '1', '0', 'review', '523', '2017-08-30 22:56:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1250', '45', '363', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 22:56:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1251', '45', '387', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 22:56:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1252', '45', '363', 'Please leave your review', '1', '0', 'review', '525', '2017-08-30 23:02:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1253', '45', '387', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 23:02:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1254', '45', '388', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 23:02:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1255', '363', '45', 'Qwork Barber app has joined your queue in position 4', '1', '0', 'join', '0', '2017-08-30 23:04:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1256', '45', '387', 'Please leave your review', '1', '0', 'review', '526', '2017-08-30 23:05:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1257', '45', '388', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 23:05:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1258', '45', '389', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 23:06:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1259', '45', '363', 'You are now 3rd in the queue. Estimation: 40 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 23:06:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1260', '45', '388', 'Please leave your review', '1', '0', 'review', '527', '2017-08-30 23:06:31');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1261', '45', '389', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 23:06:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1262', '45', '363', 'You are now 2nd in the queue. Estimation: 20 minutes until haricut!', '1', '0', 'cutting_time', '0', '2017-08-30 23:07:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1263', '45', '389', 'Please leave your review', '1', '0', 'review', '528', '2017-08-30 23:08:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1264', '45', '363', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-30 23:08:16');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1265', '86', '45', 'Jack Garvin has joined your queue in position 2', '1', '0', 'join', '0', '2017-08-31 05:04:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1266', '45', '363', 'Please leave your review', '1', '0', 'review', '529', '2017-08-31 16:38:46');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1267', '45', '86', 'Your turn, enjoy your haircut!', '1', '0', 'cutting_time', '0', '2017-08-31 16:39:01');
INSERT INTO `notifications` (`id`, `sender_id`, `receiver_ids`, `message`, `n_sent`, `n_read`, `type`, `order_id`, `created_on`) VALUES ('1268', '45', '86', 'Hey', '1', '0', 'message', '0', '2017-08-31 22:15:01');


#
# TABLE STRUCTURE FOR: orders
#

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_ids` varchar(256) NOT NULL,
  `car_type_id` int(11) DEFAULT NULL,
  `ad_theme` varchar(256) NOT NULL,
  `ad_type_id` int(11) NOT NULL,
  `ad_size` varchar(256) NOT NULL,
  `ad_period` varchar(256) NOT NULL,
  `ad_start` varchar(256) NOT NULL,
  `ad_end` varchar(256) NOT NULL,
  `order_days` int(11) NOT NULL,
  `order_months` float NOT NULL,
  `total_amount` float NOT NULL,
  `amount` int(11) NOT NULL,
  `status` enum('pending','accepted','completed','deleted') NOT NULL DEFAULT 'pending',
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

INSERT INTO `orders` (`order_id`, `ad_ids`, `car_type_id`, `ad_theme`, `ad_type_id`, `ad_size`, `ad_period`, `ad_start`, `ad_end`, `order_days`, `order_months`, `total_amount`, `amount`, `status`, `user_id`, `created_at`) VALUES ('85', '53', '2', 'Banking', '3', '20 x6', '06/06/2018 - 07/19/2018', '06/06/2018', '07/19/2018', '43', '1.43333', '143', '100', 'accepted', '6', '2018-06-06 12:29:54');
INSERT INTO `orders` (`order_id`, `ad_ids`, `car_type_id`, `ad_theme`, `ad_type_id`, `ad_size`, `ad_period`, `ad_start`, `ad_end`, `order_days`, `order_months`, `total_amount`, `amount`, `status`, `user_id`, `created_at`) VALUES ('86', '54,55,56', '4', 'Restaurant', '2', '2 x 3', '06/06/2018 - 08/10/2018', '06/06/2018', '08/10/2018', '65', '2.16667', '2166', '1000', 'pending', '0', '2018-06-06 12:31:53');
INSERT INTO `orders` (`order_id`, `ad_ids`, `car_type_id`, `ad_theme`, `ad_type_id`, `ad_size`, `ad_period`, `ad_start`, `ad_end`, `order_days`, `order_months`, `total_amount`, `amount`, `status`, `user_id`, `created_at`) VALUES ('87', '57', '1', 'food', '1', '12 x 4', '06/06/2018 - 07/19/2018', '06/06/2018', '07/19/2018', '43', '1.43333', '1433', '1000', 'accepted', '5', '2018-06-06 14:09:11');
INSERT INTO `orders` (`order_id`, `ad_ids`, `car_type_id`, `ad_theme`, `ad_type_id`, `ad_size`, `ad_period`, `ad_start`, `ad_end`, `order_days`, `order_months`, `total_amount`, `amount`, `status`, `user_id`, `created_at`) VALUES ('88', '58,59', '2', 'Campagin', '1', '3 x 3', '06/06/2018 - 07/21/2018', '06/06/2018', '07/21/2018', '45', '1.5', '2250', '1500', 'pending', '0', '2018-06-06 22:44:29');


#
# TABLE STRUCTURE FOR: records
#

DROP TABLE IF EXISTS `records`;

CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `lat` varchar(256) NOT NULL,
  `lng` varchar(256) NOT NULL,
  `speed` float NOT NULL,
  `distance` double NOT NULL,
  `status` enum('valid','invalid') NOT NULL DEFAULT 'valid',
  `created_at` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=977 DEFAULT CHARSET=utf8;

INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('437', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348905', '2018-06-07 13:21:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('438', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348905', '2018-06-07 13:21:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('439', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348906', '2018-06-07 13:21:46');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('440', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528348909', '2018-06-07 13:21:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('441', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348909', '2018-06-07 13:21:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('442', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348910', '2018-06-07 13:21:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('443', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348914', '2018-06-07 13:21:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('444', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528348916', '2018-06-07 13:21:56');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('445', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348916', '2018-06-07 13:21:56');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('446', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528348919', '2018-06-07 13:21:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('447', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348920', '2018-06-07 13:22:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('448', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348920', '2018-06-07 13:22:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('449', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348924', '2018-06-07 13:22:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('450', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348924', '2018-06-07 13:22:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('451', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348925', '2018-06-07 13:22:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('452', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348929', '2018-06-07 13:22:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('453', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348930', '2018-06-07 13:22:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('454', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348930', '2018-06-07 13:22:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('455', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348934', '2018-06-07 13:22:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('456', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348934', '2018-06-07 13:22:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('457', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348935', '2018-06-07 13:22:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('458', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348939', '2018-06-07 13:22:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('459', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348939', '2018-06-07 13:22:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('460', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348940', '2018-06-07 13:22:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('461', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348944', '2018-06-07 13:22:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('462', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348944', '2018-06-07 13:22:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('463', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348945', '2018-06-07 13:22:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('464', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348949', '2018-06-07 13:22:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('465', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348950', '2018-06-07 13:22:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('466', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348951', '2018-06-07 13:22:31');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('467', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528348954', '2018-06-07 13:22:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('468', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348954', '2018-06-07 13:22:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('469', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348955', '2018-06-07 13:22:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('470', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348959', '2018-06-07 13:22:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('471', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348959', '2018-06-07 13:22:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('472', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528348961', '2018-06-07 13:22:41');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('473', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348965', '2018-06-07 13:22:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('474', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348965', '2018-06-07 13:22:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('475', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348966', '2018-06-07 13:22:46');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('476', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528348969', '2018-06-07 13:22:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('477', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348969', '2018-06-07 13:22:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('478', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348970', '2018-06-07 13:22:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('479', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348974', '2018-06-07 13:22:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('480', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348975', '2018-06-07 13:22:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('481', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348976', '2018-06-07 13:22:56');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('482', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528348979', '2018-06-07 13:22:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('483', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348979', '2018-06-07 13:22:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('484', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348980', '2018-06-07 13:23:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('485', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348984', '2018-06-07 13:23:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('486', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348984', '2018-06-07 13:23:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('487', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528348986', '2018-06-07 13:23:06');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('488', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528348989', '2018-06-07 13:23:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('489', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528348990', '2018-06-07 13:23:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('490', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348990', '2018-06-07 13:23:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('491', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528348994', '2018-06-07 13:23:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('492', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528348994', '2018-06-07 13:23:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('493', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528348996', '2018-06-07 13:23:16');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('494', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528348999', '2018-06-07 13:23:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('495', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349000', '2018-06-07 13:23:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('496', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349001', '2018-06-07 13:23:21');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('497', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349004', '2018-06-07 13:23:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('498', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349005', '2018-06-07 13:23:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('499', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349005', '2018-06-07 13:23:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('500', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349009', '2018-06-07 13:23:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('501', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349009', '2018-06-07 13:23:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('502', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349010', '2018-06-07 13:23:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('503', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349014', '2018-06-07 13:23:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('504', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349015', '2018-06-07 13:23:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('505', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349015', '2018-06-07 13:23:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('506', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349019', '2018-06-07 13:23:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('507', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349019', '2018-06-07 13:23:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('508', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349020', '2018-06-07 13:23:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('509', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349024', '2018-06-07 13:23:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('510', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349025', '2018-06-07 13:23:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('511', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349025', '2018-06-07 13:23:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('512', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349029', '2018-06-07 13:23:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('513', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349029', '2018-06-07 13:23:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('514', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349030', '2018-06-07 13:23:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('515', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349034', '2018-06-07 13:23:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('516', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349035', '2018-06-07 13:23:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('517', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349035', '2018-06-07 13:23:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('518', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349039', '2018-06-07 13:23:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('519', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349039', '2018-06-07 13:23:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('520', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349040', '2018-06-07 13:24:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('521', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349044', '2018-06-07 13:24:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('522', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349044', '2018-06-07 13:24:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('523', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349045', '2018-06-07 13:24:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('524', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349049', '2018-06-07 13:24:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('525', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349050', '2018-06-07 13:24:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('526', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349050', '2018-06-07 13:24:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('527', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349054', '2018-06-07 13:24:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('528', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349054', '2018-06-07 13:24:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('529', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349055', '2018-06-07 13:24:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('530', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349059', '2018-06-07 13:24:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('531', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349059', '2018-06-07 13:24:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('532', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349061', '2018-06-07 13:24:21');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('533', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349064', '2018-06-07 13:24:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('534', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349065', '2018-06-07 13:24:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('535', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349065', '2018-06-07 13:24:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('536', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349069', '2018-06-07 13:24:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('537', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349069', '2018-06-07 13:24:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('538', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349070', '2018-06-07 13:24:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('539', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349074', '2018-06-07 13:24:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('540', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349074', '2018-06-07 13:24:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('541', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349076', '2018-06-07 13:24:36');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('542', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349079', '2018-06-07 13:24:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('543', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349080', '2018-06-07 13:24:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('544', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349081', '2018-06-07 13:24:41');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('545', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349084', '2018-06-07 13:24:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('546', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349085', '2018-06-07 13:24:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('547', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349085', '2018-06-07 13:24:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('548', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349089', '2018-06-07 13:24:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('549', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349089', '2018-06-07 13:24:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('550', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349091', '2018-06-07 13:24:51');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('551', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349094', '2018-06-07 13:24:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('552', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349094', '2018-06-07 13:24:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('553', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349095', '2018-06-07 13:24:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('554', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349099', '2018-06-07 13:24:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('555', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349100', '2018-06-07 13:25:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('556', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349100', '2018-06-07 13:25:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('557', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349104', '2018-06-07 13:25:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('558', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349104', '2018-06-07 13:25:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('559', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349105', '2018-06-07 13:25:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('560', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349109', '2018-06-07 13:25:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('561', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349109', '2018-06-07 13:25:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('562', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349110', '2018-06-07 13:25:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('563', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349114', '2018-06-07 13:25:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('564', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349114', '2018-06-07 13:25:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('565', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349115', '2018-06-07 13:25:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('566', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349119', '2018-06-07 13:25:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('567', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349120', '2018-06-07 13:25:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('568', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349121', '2018-06-07 13:25:21');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('569', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349124', '2018-06-07 13:25:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('570', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349124', '2018-06-07 13:25:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('571', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349125', '2018-06-07 13:25:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('572', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349129', '2018-06-07 13:25:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('573', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349129', '2018-06-07 13:25:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('574', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349130', '2018-06-07 13:25:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('575', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349134', '2018-06-07 13:25:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('576', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349134', '2018-06-07 13:25:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('577', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349135', '2018-06-07 13:25:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('578', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349139', '2018-06-07 13:25:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('579', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349139', '2018-06-07 13:25:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('580', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349140', '2018-06-07 13:25:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('581', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349144', '2018-06-07 13:25:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('582', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349144', '2018-06-07 13:25:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('583', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349145', '2018-06-07 13:25:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('584', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349149', '2018-06-07 13:25:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('585', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349149', '2018-06-07 13:25:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('586', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349150', '2018-06-07 13:25:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('587', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349154', '2018-06-07 13:25:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('588', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349154', '2018-06-07 13:25:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('589', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349155', '2018-06-07 13:25:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('590', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349159', '2018-06-07 13:25:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('591', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349159', '2018-06-07 13:25:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('592', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349161', '2018-06-07 13:26:01');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('593', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349164', '2018-06-07 13:26:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('594', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349164', '2018-06-07 13:26:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('595', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349165', '2018-06-07 13:26:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('596', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349169', '2018-06-07 13:26:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('597', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349169', '2018-06-07 13:26:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('598', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349170', '2018-06-07 13:26:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('599', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349174', '2018-06-07 13:26:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('600', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349174', '2018-06-07 13:26:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('601', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349176', '2018-06-07 13:26:16');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('602', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349179', '2018-06-07 13:26:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('603', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349180', '2018-06-07 13:26:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('604', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349180', '2018-06-07 13:26:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('605', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349184', '2018-06-07 13:26:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('606', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349184', '2018-06-07 13:26:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('607', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349185', '2018-06-07 13:26:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('608', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349189', '2018-06-07 13:26:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('609', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349190', '2018-06-07 13:26:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('610', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349190', '2018-06-07 13:26:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('611', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349194', '2018-06-07 13:26:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('612', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349195', '2018-06-07 13:26:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('613', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349196', '2018-06-07 13:26:36');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('614', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349199', '2018-06-07 13:26:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('615', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349200', '2018-06-07 13:26:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('616', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349200', '2018-06-07 13:26:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('617', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349204', '2018-06-07 13:26:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('618', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349204', '2018-06-07 13:26:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('619', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349206', '2018-06-07 13:26:46');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('620', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349209', '2018-06-07 13:26:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('621', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349210', '2018-06-07 13:26:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('622', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349210', '2018-06-07 13:26:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('623', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349214', '2018-06-07 13:26:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('624', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349215', '2018-06-07 13:26:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('625', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349216', '2018-06-07 13:26:56');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('626', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349219', '2018-06-07 13:26:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('627', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349220', '2018-06-07 13:27:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('628', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349220', '2018-06-07 13:27:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('629', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349224', '2018-06-07 13:27:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('630', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349225', '2018-06-07 13:27:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('631', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349225', '2018-06-07 13:27:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('632', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349229', '2018-06-07 13:27:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('633', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349230', '2018-06-07 13:27:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('634', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349230', '2018-06-07 13:27:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('635', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349234', '2018-06-07 13:27:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('636', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349235', '2018-06-07 13:27:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('637', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349235', '2018-06-07 13:27:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('638', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349239', '2018-06-07 13:27:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('639', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349240', '2018-06-07 13:27:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('640', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349240', '2018-06-07 13:27:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('641', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349244', '2018-06-07 13:27:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('642', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349245', '2018-06-07 13:27:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('643', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349245', '2018-06-07 13:27:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('644', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349249', '2018-06-07 13:27:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('645', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349250', '2018-06-07 13:27:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('646', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349250', '2018-06-07 13:27:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('647', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349254', '2018-06-07 13:27:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('648', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349255', '2018-06-07 13:27:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('649', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349255', '2018-06-07 13:27:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('650', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349259', '2018-06-07 13:27:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('651', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349260', '2018-06-07 13:27:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('652', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349260', '2018-06-07 13:27:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('653', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349264', '2018-06-07 13:27:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('654', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349265', '2018-06-07 13:27:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('655', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349265', '2018-06-07 13:27:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('656', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349269', '2018-06-07 13:27:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('657', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349270', '2018-06-07 13:27:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('658', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349271', '2018-06-07 13:27:51');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('659', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349274', '2018-06-07 13:27:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('660', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349275', '2018-06-07 13:27:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('661', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349275', '2018-06-07 13:27:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('662', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349279', '2018-06-07 13:27:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('663', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349280', '2018-06-07 13:28:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('664', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349280', '2018-06-07 13:28:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('665', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349284', '2018-06-07 13:28:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('666', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349285', '2018-06-07 13:28:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('667', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349285', '2018-06-07 13:28:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('668', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349289', '2018-06-07 13:28:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('669', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349290', '2018-06-07 13:28:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('670', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349290', '2018-06-07 13:28:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('671', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349294', '2018-06-07 13:28:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('672', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349295', '2018-06-07 13:28:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('673', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349295', '2018-06-07 13:28:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('674', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349299', '2018-06-07 13:28:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('675', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349300', '2018-06-07 13:28:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('676', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349300', '2018-06-07 13:28:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('677', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349304', '2018-06-07 13:28:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('678', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349305', '2018-06-07 13:28:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('679', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349305', '2018-06-07 13:28:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('680', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349309', '2018-06-07 13:28:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('681', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349310', '2018-06-07 13:28:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('682', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349311', '2018-06-07 13:28:31');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('683', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349314', '2018-06-07 13:28:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('684', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349315', '2018-06-07 13:28:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('685', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349315', '2018-06-07 13:28:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('686', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349319', '2018-06-07 13:28:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('687', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349320', '2018-06-07 13:28:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('688', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349321', '2018-06-07 13:28:41');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('689', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349324', '2018-06-07 13:28:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('690', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349325', '2018-06-07 13:28:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('691', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349326', '2018-06-07 13:28:46');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('692', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349329', '2018-06-07 13:28:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('693', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349330', '2018-06-07 13:28:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('694', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349330', '2018-06-07 13:28:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('695', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349334', '2018-06-07 13:28:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('696', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349335', '2018-06-07 13:28:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('697', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349336', '2018-06-07 13:28:56');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('698', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349339', '2018-06-07 13:28:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('699', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349340', '2018-06-07 13:29:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('700', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349341', '2018-06-07 13:29:01');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('701', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349344', '2018-06-07 13:29:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('702', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349345', '2018-06-07 13:29:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('703', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349346', '2018-06-07 13:29:06');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('704', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349349', '2018-06-07 13:29:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('705', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349350', '2018-06-07 13:29:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('706', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349350', '2018-06-07 13:29:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('707', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349354', '2018-06-07 13:29:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('708', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349355', '2018-06-07 13:29:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('709', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349355', '2018-06-07 13:29:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('710', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349359', '2018-06-07 13:29:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('711', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349360', '2018-06-07 13:29:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('712', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349360', '2018-06-07 13:29:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('713', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349364', '2018-06-07 13:29:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('714', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349365', '2018-06-07 13:29:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('715', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349365', '2018-06-07 13:29:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('716', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349369', '2018-06-07 13:29:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('717', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349370', '2018-06-07 13:29:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('718', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349371', '2018-06-07 13:29:31');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('719', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349374', '2018-06-07 13:29:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('720', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349375', '2018-06-07 13:29:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('721', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349376', '2018-06-07 13:29:36');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('722', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349379', '2018-06-07 13:29:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('723', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349380', '2018-06-07 13:29:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('724', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349380', '2018-06-07 13:29:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('725', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349384', '2018-06-07 13:29:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('726', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349385', '2018-06-07 13:29:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('727', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349386', '2018-06-07 13:29:46');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('728', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349389', '2018-06-07 13:29:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('729', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349390', '2018-06-07 13:29:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('730', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349391', '2018-06-07 13:29:51');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('731', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349394', '2018-06-07 13:29:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('732', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349395', '2018-06-07 13:29:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('733', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349395', '2018-06-07 13:29:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('734', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349399', '2018-06-07 13:29:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('735', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349400', '2018-06-07 13:30:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('736', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349401', '2018-06-07 13:30:01');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('737', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349404', '2018-06-07 13:30:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('738', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349405', '2018-06-07 13:30:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('739', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349405', '2018-06-07 13:30:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('740', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349409', '2018-06-07 13:30:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('741', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349410', '2018-06-07 13:30:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('742', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349410', '2018-06-07 13:30:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('743', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349414', '2018-06-07 13:30:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('744', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349415', '2018-06-07 13:30:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('745', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349416', '2018-06-07 13:30:16');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('746', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349419', '2018-06-07 13:30:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('747', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349420', '2018-06-07 13:30:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('748', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349420', '2018-06-07 13:30:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('749', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349424', '2018-06-07 13:30:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('750', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349425', '2018-06-07 13:30:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('751', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349425', '2018-06-07 13:30:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('752', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349429', '2018-06-07 13:30:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('753', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349430', '2018-06-07 13:30:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('754', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349431', '2018-06-07 13:30:31');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('755', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349434', '2018-06-07 13:30:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('756', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349435', '2018-06-07 13:30:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('757', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349435', '2018-06-07 13:30:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('758', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349439', '2018-06-07 13:30:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('759', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349440', '2018-06-07 13:30:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('760', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349440', '2018-06-07 13:30:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('761', '5', '87', '33.985805', '-118.25411166666666', '20', '100', 'valid', '1528349445', '2018-06-07 13:30:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('762', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349445', '2018-06-07 13:30:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('763', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349446', '2018-06-07 13:30:46');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('764', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349449', '2018-06-07 13:30:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('765', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349450', '2018-06-07 13:30:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('766', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349450', '2018-06-07 13:30:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('767', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349454', '2018-06-07 13:30:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('768', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349455', '2018-06-07 13:30:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('769', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349455', '2018-06-07 13:30:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('770', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349459', '2018-06-07 13:30:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('771', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349460', '2018-06-07 13:31:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('772', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349460', '2018-06-07 13:31:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('773', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349464', '2018-06-07 13:31:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('774', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349465', '2018-06-07 13:31:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('775', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349465', '2018-06-07 13:31:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('776', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349469', '2018-06-07 13:31:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('777', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349470', '2018-06-07 13:31:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('778', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349472', '2018-06-07 13:31:12');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('779', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349474', '2018-06-07 13:31:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('780', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349475', '2018-06-07 13:31:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('781', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349475', '2018-06-07 13:31:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('782', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349479', '2018-06-07 13:31:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('783', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349480', '2018-06-07 13:31:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('784', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349481', '2018-06-07 13:31:21');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('785', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349484', '2018-06-07 13:31:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('786', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349485', '2018-06-07 13:31:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('787', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349485', '2018-06-07 13:31:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('788', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349489', '2018-06-07 13:31:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('789', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349490', '2018-06-07 13:31:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('790', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349491', '2018-06-07 13:31:31');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('791', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349494', '2018-06-07 13:31:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('792', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349495', '2018-06-07 13:31:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('793', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349496', '2018-06-07 13:31:36');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('794', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349499', '2018-06-07 13:31:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('795', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349500', '2018-06-07 13:31:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('796', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349501', '2018-06-07 13:31:41');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('797', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349505', '2018-06-07 13:31:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('798', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349505', '2018-06-07 13:31:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('799', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349506', '2018-06-07 13:31:46');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('800', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349509', '2018-06-07 13:31:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('801', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349510', '2018-06-07 13:31:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('802', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349511', '2018-06-07 13:31:51');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('803', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349514', '2018-06-07 13:31:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('804', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349515', '2018-06-07 13:31:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('805', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349516', '2018-06-07 13:31:56');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('806', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349519', '2018-06-07 13:31:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('807', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349520', '2018-06-07 13:32:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('808', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349522', '2018-06-07 13:32:02');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('809', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349525', '2018-06-07 13:32:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('810', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349525', '2018-06-07 13:32:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('811', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349526', '2018-06-07 13:32:06');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('812', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349530', '2018-06-07 13:32:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('813', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349530', '2018-06-07 13:32:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('814', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349530', '2018-06-07 13:32:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('815', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349534', '2018-06-07 13:32:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('816', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349534', '2018-06-07 13:32:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('817', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349535', '2018-06-07 13:32:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('818', '5', '87', '33.985805', '-118.25411166666666', '20', '120', 'valid', '1528349541', '2018-06-07 13:32:21');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('819', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349541', '2018-06-07 13:32:21');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('820', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349542', '2018-06-07 13:32:22');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('821', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349545', '2018-06-07 13:32:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('822', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349545', '2018-06-07 13:32:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('823', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349545', '2018-06-07 13:32:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('824', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349549', '2018-06-07 13:32:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('825', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349550', '2018-06-07 13:32:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('826', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349551', '2018-06-07 13:32:31');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('827', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349554', '2018-06-07 13:32:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('828', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349554', '2018-06-07 13:32:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('829', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349555', '2018-06-07 13:32:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('830', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349559', '2018-06-07 13:32:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('831', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349560', '2018-06-07 13:32:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('832', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349561', '2018-06-07 13:32:41');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('833', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349564', '2018-06-07 13:32:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('834', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349565', '2018-06-07 13:32:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('835', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349565', '2018-06-07 13:32:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('836', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349569', '2018-06-07 13:32:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('837', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349570', '2018-06-07 13:32:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('838', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349571', '2018-06-07 13:32:51');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('839', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349574', '2018-06-07 13:32:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('840', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349575', '2018-06-07 13:32:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('841', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349575', '2018-06-07 13:32:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('842', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349579', '2018-06-07 13:32:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('843', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349580', '2018-06-07 13:33:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('844', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349580', '2018-06-07 13:33:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('845', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349584', '2018-06-07 13:33:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('846', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349585', '2018-06-07 13:33:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('847', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349586', '2018-06-07 13:33:06');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('848', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349589', '2018-06-07 13:33:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('849', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349590', '2018-06-07 13:33:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('850', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349590', '2018-06-07 13:33:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('851', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349594', '2018-06-07 13:33:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('852', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349595', '2018-06-07 13:33:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('853', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349596', '2018-06-07 13:33:16');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('854', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349599', '2018-06-07 13:33:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('855', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349600', '2018-06-07 13:33:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('856', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349600', '2018-06-07 13:33:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('857', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349604', '2018-06-07 13:33:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('858', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349605', '2018-06-07 13:33:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('859', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349606', '2018-06-07 13:33:26');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('860', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349609', '2018-06-07 13:33:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('861', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349610', '2018-06-07 13:33:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('862', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349610', '2018-06-07 13:33:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('863', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349614', '2018-06-07 13:33:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('864', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349615', '2018-06-07 13:33:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('865', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349616', '2018-06-07 13:33:36');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('866', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349619', '2018-06-07 13:33:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('867', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349620', '2018-06-07 13:33:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('868', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349621', '2018-06-07 13:33:41');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('869', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349625', '2018-06-07 13:33:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('870', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349625', '2018-06-07 13:33:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('871', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349625', '2018-06-07 13:33:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('872', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349629', '2018-06-07 13:33:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('873', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349630', '2018-06-07 13:33:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('874', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349631', '2018-06-07 13:33:51');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('875', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349634', '2018-06-07 13:33:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('876', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349635', '2018-06-07 13:33:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('877', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349637', '2018-06-07 13:33:57');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('878', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349639', '2018-06-07 13:33:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('879', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349640', '2018-06-07 13:34:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('880', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349640', '2018-06-07 13:34:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('881', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349644', '2018-06-07 13:34:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('882', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349644', '2018-06-07 13:34:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('883', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349646', '2018-06-07 13:34:06');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('884', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349649', '2018-06-07 13:34:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('885', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349650', '2018-06-07 13:34:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('886', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349650', '2018-06-07 13:34:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('887', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349654', '2018-06-07 13:34:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('888', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349655', '2018-06-07 13:34:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('889', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349657', '2018-06-07 13:34:17');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('890', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349659', '2018-06-07 13:34:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('891', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349660', '2018-06-07 13:34:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('892', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349660', '2018-06-07 13:34:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('893', '5', '87', '33.985805', '-118.25411166666666', '20', '100', 'valid', '1528349665', '2018-06-07 13:34:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('894', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349665', '2018-06-07 13:34:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('895', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349666', '2018-06-07 13:34:26');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('896', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349669', '2018-06-07 13:34:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('897', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349670', '2018-06-07 13:34:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('898', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349671', '2018-06-07 13:34:31');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('899', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349674', '2018-06-07 13:34:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('900', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349675', '2018-06-07 13:34:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('901', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349676', '2018-06-07 13:34:36');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('902', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349679', '2018-06-07 13:34:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('903', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349680', '2018-06-07 13:34:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('904', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349681', '2018-06-07 13:34:41');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('905', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349684', '2018-06-07 13:34:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('906', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349685', '2018-06-07 13:34:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('907', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349686', '2018-06-07 13:34:46');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('908', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349689', '2018-06-07 13:34:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('909', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349690', '2018-06-07 13:34:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('910', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349690', '2018-06-07 13:34:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('911', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349694', '2018-06-07 13:34:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('912', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349695', '2018-06-07 13:34:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('913', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349697', '2018-06-07 13:34:57');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('914', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349699', '2018-06-07 13:34:59');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('915', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349700', '2018-06-07 13:35:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('916', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349700', '2018-06-07 13:35:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('917', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349704', '2018-06-07 13:35:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('918', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349705', '2018-06-07 13:35:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('919', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349706', '2018-06-07 13:35:06');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('920', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349709', '2018-06-07 13:35:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('921', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349710', '2018-06-07 13:35:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('922', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349710', '2018-06-07 13:35:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('923', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349714', '2018-06-07 13:35:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('924', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349715', '2018-06-07 13:35:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('925', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349715', '2018-06-07 13:35:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('926', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349719', '2018-06-07 13:35:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('927', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349720', '2018-06-07 13:35:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('928', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349720', '2018-06-07 13:35:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('929', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349724', '2018-06-07 13:35:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('930', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349725', '2018-06-07 13:35:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('931', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349726', '2018-06-07 13:35:26');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('932', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349729', '2018-06-07 13:35:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('933', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349730', '2018-06-07 13:35:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('934', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349730', '2018-06-07 13:35:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('935', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349734', '2018-06-07 13:35:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('936', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349735', '2018-06-07 13:35:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('937', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349735', '2018-06-07 13:35:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('938', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349739', '2018-06-07 13:35:39');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('939', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349740', '2018-06-07 13:35:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('940', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349740', '2018-06-07 13:35:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('941', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349744', '2018-06-07 13:35:44');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('942', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349745', '2018-06-07 13:35:45');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('943', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349746', '2018-06-07 13:35:46');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('944', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349749', '2018-06-07 13:35:49');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('945', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349750', '2018-06-07 13:35:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('946', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349750', '2018-06-07 13:35:50');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('947', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349754', '2018-06-07 13:35:54');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('948', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349755', '2018-06-07 13:35:55');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('949', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349756', '2018-06-07 13:35:56');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('950', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349760', '2018-06-07 13:36:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('951', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349760', '2018-06-07 13:36:00');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('952', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349761', '2018-06-07 13:36:01');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('953', '5', '87', '33.985805', '-118.25411166666666', '20', '60', 'valid', '1528349764', '2018-06-07 13:36:04');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('954', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349765', '2018-06-07 13:36:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('955', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349765', '2018-06-07 13:36:05');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('956', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349769', '2018-06-07 13:36:09');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('957', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349770', '2018-06-07 13:36:10');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('958', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349772', '2018-06-07 13:36:12');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('959', '5', '87', '33.985805', '-118.25411166666666', '20', '40', 'valid', '1528349774', '2018-06-07 13:36:14');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('960', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349775', '2018-06-07 13:36:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('961', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349775', '2018-06-07 13:36:15');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('962', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349779', '2018-06-07 13:36:19');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('963', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349780', '2018-06-07 13:36:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('964', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349780', '2018-06-07 13:36:20');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('965', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349784', '2018-06-07 13:36:24');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('966', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349785', '2018-06-07 13:36:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('967', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349785', '2018-06-07 13:36:25');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('968', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349789', '2018-06-07 13:36:29');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('969', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349790', '2018-06-07 13:36:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('970', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349790', '2018-06-07 13:36:30');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('971', '5', '87', '33.985805', '-118.25411166666666', '20', '80', 'valid', '1528349794', '2018-06-07 13:36:34');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('972', '5', '87', '33.985805', '-118.25411166666666', '20', '20', 'valid', '1528349795', '2018-06-07 13:36:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('973', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349795', '2018-06-07 13:36:35');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('974', '5', '87', '33.985805', '-118.25411166666666', '20', '100', 'valid', '1528349800', '2018-06-07 13:36:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('975', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349800', '2018-06-07 13:36:40');
INSERT INTO `records` (`id`, `user_id`, `order_id`, `lat`, `lng`, `speed`, `distance`, `status`, `created_at`, `time`) VALUES ('976', '5', '87', '33.985805', '-118.25411166666666', '20', '0', 'valid', '1528349800', '2018-06-07 13:36:40');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `one_id_ios` varchar(256) NOT NULL,
  `one_id_android` varchar(256) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birthday` varchar(256) DEFAULT NULL,
  `driving_license_number` varchar(256) NOT NULL,
  `driving_license_expiry_date` varchar(256) NOT NULL,
  `driving_license_class` varchar(256) NOT NULL,
  `car_type_id` int(11) NOT NULL,
  `vehicle_plate_number` varchar(256) NOT NULL,
  `plate_number_expiry_date` varchar(256) NOT NULL,
  `photo_vehicle` varchar(256) NOT NULL,
  `photo_plate_number` varchar(256) NOT NULL,
  `gender` enum('Male','Famale','','') DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fb_id` varchar(128) NOT NULL,
  `tw_id` varchar(128) NOT NULL,
  `g_id` varchar(128) NOT NULL,
  `photo` varchar(256) NOT NULL,
  `user_type` enum('driver') NOT NULL DEFAULT 'driver',
  `lat` varchar(256) NOT NULL,
  `lng` varchar(256) NOT NULL,
  `speed` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `one_id_ios`, `one_id_android`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `birthday`, `driving_license_number`, `driving_license_expiry_date`, `driving_license_class`, `car_type_id`, `vehicle_plate_number`, `plate_number_expiry_date`, `photo_vehicle`, `photo_plate_number`, `gender`, `company`, `phone`, `fb_id`, `tw_id`, `g_id`, `photo`, `user_type`, `lat`, `lng`, `speed`) VALUES ('5', '', '', '127.0.0.1', 'zhe wang', '$2y$08$DDjxxrYFuss8xr2aONSbzO3UMcRq6X/CBExVryah9jwAVdUbJXDVC', NULL, 'test@email.com', NULL, NULL, NULL, NULL, '1527880137', '1528348568', '1', 'zhe', 'wang', '4/06/1995', 'driving license number', '2/05/2020', 'class', '1', 'num123456', '2/05/2020', 'photo_vehicle0.06250700_1527880137.jpg', 'photo_plate_number0.07201900_1527880137.jpg', NULL, NULL, '1111111', '', '', '', '', 'driver', '22.319394', '114.17046200000004', '0');
INSERT INTO `users` (`id`, `one_id_ios`, `one_id_android`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `birthday`, `driving_license_number`, `driving_license_expiry_date`, `driving_license_class`, `car_type_id`, `vehicle_plate_number`, `plate_number_expiry_date`, `photo_vehicle`, `photo_plate_number`, `gender`, `company`, `phone`, `fb_id`, `tw_id`, `g_id`, `photo`, `user_type`, `lat`, `lng`, `speed`) VALUES ('6', '', '', '127.0.0.1', 'zhe Jin', '$2y$08$yOcyozjQH/YKKQjeUrtwQO9wGTCLmP2HvLHhlEaXVxBEptV7aFCUa', NULL, 'test1@email.com', NULL, NULL, NULL, NULL, '1527880173', NULL, '1', 'zhe', 'Jin', '2/05/2000', 'driving license number', '2/05/2020', 'class', '1', 'num123456', '2/05/2020', 'photo_vehicle0.99919400_1527880172.jpg', 'photo_plate_number0.00414200_1527880173.jpg', NULL, NULL, '123123123', '', '', '', '', 'driver', '', '', '');
INSERT INTO `users` (`id`, `one_id_ios`, `one_id_android`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `birthday`, `driving_license_number`, `driving_license_expiry_date`, `driving_license_class`, `car_type_id`, `vehicle_plate_number`, `plate_number_expiry_date`, `photo_vehicle`, `photo_plate_number`, `gender`, `company`, `phone`, `fb_id`, `tw_id`, `g_id`, `photo`, `user_type`, `lat`, `lng`, `speed`) VALUES ('7', '', '', '127.0.0.1', 'zhe Jin', '$2y$08$QnkGau/dwScjgBduBhuJquNufKiQYnOAXP7/IGwI03G6bvOLLp6ry', NULL, 'test2@email.com', NULL, NULL, NULL, NULL, '1527880221', NULL, '1', 'zhe', 'Jin', '2/05/2000', 'driving license number', '2/05/2020', 'class', '1', 'num123456', '2/05/2020', 'photo_vehicle0.09189500_1527880221.jpg', 'photo_plate_number0.09787600_1527880221.jpg', NULL, NULL, '123123123', '', '', '', '', 'driver', '', '', '');
INSERT INTO `users` (`id`, `one_id_ios`, `one_id_android`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `birthday`, `driving_license_number`, `driving_license_expiry_date`, `driving_license_class`, `car_type_id`, `vehicle_plate_number`, `plate_number_expiry_date`, `photo_vehicle`, `photo_plate_number`, `gender`, `company`, `phone`, `fb_id`, `tw_id`, `g_id`, `photo`, `user_type`, `lat`, `lng`, `speed`) VALUES ('21', '', '', '45.56.155.206', 'xiaoming Jin', '$2y$08$JeDtbGheNGQ0J3tKM1Qddu/wx33iL2JULaJf2BzsLzVRHGHsear6i', NULL, 'as1@email.com', NULL, NULL, NULL, NULL, '1528119944', NULL, '1', 'xiaoming', 'Jin', '2/05/2000', 'driving license number', '2/05/2020', 'class', '1', 'num123456', '2/05/2020', 'photo_vehicle0.63799800_1528119944.jpg', 'photo_plate_number0.63804000_1528119944.jpg', NULL, NULL, '123123123', '', '', '', '', 'driver', '', '', '');
INSERT INTO `users` (`id`, `one_id_ios`, `one_id_android`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `birthday`, `driving_license_number`, `driving_license_expiry_date`, `driving_license_class`, `car_type_id`, `vehicle_plate_number`, `plate_number_expiry_date`, `photo_vehicle`, `photo_plate_number`, `gender`, `company`, `phone`, `fb_id`, `tw_id`, `g_id`, `photo`, `user_type`, `lat`, `lng`, `speed`) VALUES ('22', '', '', '45.56.155.206', 'xiaoming Jin', '$2y$08$PQap8tUGWd.nf6I/b41qsuF8b7VTRhzM.9p3k9YLaIOBbBeAxxbSG', NULL, 'as2@email.com', NULL, NULL, NULL, NULL, '1528120078', NULL, '1', 'xiaoming', 'Jin', '2/05/2000', 'driving license number', '2/05/2020', 'class', '1', 'num123456', '2/05/2020', 'photo_vehicle0.63644000_1528120078.jpg', 'photo_plate_number0.63648200_1528120078.jpg', NULL, NULL, '123123123', '', '', '', '', 'driver', '', '', '');
INSERT INTO `users` (`id`, `one_id_ios`, `one_id_android`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `birthday`, `driving_license_number`, `driving_license_expiry_date`, `driving_license_class`, `car_type_id`, `vehicle_plate_number`, `plate_number_expiry_date`, `photo_vehicle`, `photo_plate_number`, `gender`, `company`, `phone`, `fb_id`, `tw_id`, `g_id`, `photo`, `user_type`, `lat`, `lng`, `speed`) VALUES ('23', '', '', '104.237.86.125', 'de xing', '$2y$08$Xff52LtmpqI1/TO9cGIsOumd/G5SP3LA/Xzs1QbQhBKId0HjSo8ky', NULL, 'r@email.com', NULL, NULL, NULL, NULL, '1528123262', NULL, '1', 'de', 'xing', '2/05/1988', '123', '4/06/2019', 'qru', '3', '468', '4/06/2020', 'photo_vehicle0.02928800_1528123262.jpg', 'photo_plate_number0.02932700_1528123262.jpg', NULL, NULL, '159400', '', '', '', '', 'driver', '', '', '');


#
# TABLE STRUCTURE FOR: users_groups
#

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('2', '2', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('3', '3', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('4', '4', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('5', '10', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('6', '12', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('7', '13', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('8', '14', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('9', '16', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('10', '17', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('11', '18', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('12', '19', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('13', '20', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('14', '21', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('15', '22', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('16', '23', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('17', '24', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('18', '25', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('19', '26', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('20', '27', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('21', '28', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('22', '29', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('23', '30', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('24', '31', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('25', '32', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('26', '33', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('27', '34', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('28', '35', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('29', '36', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('30', '37', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('31', '38', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('32', '39', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('33', '40', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('34', '41', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('35', '42', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('36', '43', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('37', '44', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('38', '45', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('39', '46', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('40', '47', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('41', '48', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('42', '49', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('43', '50', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('44', '51', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('45', '52', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('46', '53', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('47', '54', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('48', '55', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('49', '56', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('50', '76', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('51', '77', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('52', '78', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('53', '79', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('54', '80', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('55', '81', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('56', '82', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('57', '83', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('58', '85', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('59', '88', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('60', '89', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('61', '90', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('62', '91', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('63', '92', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('64', '93', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('65', '94', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('66', '95', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('67', '96', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('68', '97', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('69', '106', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('70', '107', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('71', '113', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('72', '123', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('73', '124', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('74', '153', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('75', '154', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('76', '155', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('77', '162', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('78', '163', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('79', '164', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('80', '166', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('81', '167', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('82', '168', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('83', '169', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('84', '173', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('85', '176', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('86', '177', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('87', '178', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('88', '179', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('89', '180', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('90', '181', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('91', '182', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('92', '183', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('93', '184', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('94', '185', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('95', '186', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('96', '187', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('97', '200', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('98', '214', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('99', '216', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('100', '229', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('101', '233', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('102', '239', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('103', '240', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('104', '246', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('105', '258', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('106', '259', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('107', '260', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('108', '261', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('109', '262', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('110', '263', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('111', '264', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('112', '274', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('113', '277', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('114', '281', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('115', '282', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('116', '284', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('117', '285', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('118', '286', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('119', '289', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('120', '292', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('121', '296', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('122', '297', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('123', '298', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('124', '299', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('125', '312', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('126', '313', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('127', '314', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('128', '315', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('129', '316', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('130', '317', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('131', '318', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('132', '319', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('133', '320', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('134', '321', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('135', '322', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('136', '323', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('137', '324', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('138', '325', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('139', '326', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('140', '327', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('141', '328', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('142', '329', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('143', '338', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('144', '343', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('145', '347', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('146', '348', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('147', '1', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('148', '2', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('149', '3', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('150', '4', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('151', '5', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('152', '6', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('153', '7', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('154', '8', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('155', '9', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('156', '10', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('157', '11', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('158', '12', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('159', '13', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('160', '14', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('161', '15', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('162', '16', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('163', '17', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('164', '18', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('165', '19', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('166', '20', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('167', '21', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('168', '22', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('169', '23', '1');


