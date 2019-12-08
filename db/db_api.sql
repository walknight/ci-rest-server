-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `keys`;
CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `key_for` varchar(10) DEFAULT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `keys` (`id`, `key`, `level`, `key_for`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1,	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	1,	'web',	1,	0,	NULL,	'0000-00-00 00:00:00');

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
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

INSERT INTO `logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
(1,	'api/users',	'get',	'a:8:{s:7:\"api_key\";s:40:\"0sgcws48wks0gokgco0w00g48k4kgwgs448wo84g\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"7c1cf1dc-a184-4d75-99b3-8e01c946f4db\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}',	'',	'::1',	1575785343,	1575790000,	'0',	403),
(2,	'api/users',	'get',	'a:8:{s:7:\"api_key\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"7994fea2-c384-4c7f-bafe-8114d90d94e8\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575785522,	1575790000,	'1',	200),
(3,	'api/auth/register',	'get',	'a:9:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------032671395742634114043711\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"8ca18fd6-2398-4a99-b980-80ab53b723f9\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"434\";s:10:\"Connection\";s:10:\"keep-alive\";}',	'',	'::1',	1575791648,	1575790000,	'0',	403),
(4,	'api/auth/register',	'get',	'a:9:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------226889497885829482895031\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"8acc8655-bda9-4c59-bc40-965a040ae5d0\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"434\";s:10:\"Connection\";s:10:\"keep-alive\";}',	'',	'::1',	1575791666,	1575790000,	'0',	403),
(5,	'api/auth/register',	'post',	'a:12:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------634431348359780048360051\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"704d5a1c-bb65-433f-be05-f997ec36feee\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"434\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:6:\"123456\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575791766,	1575790000,	'1',	200),
(6,	'api/auth/register',	'post',	'a:12:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------642107373192218396414536\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d2f166c3-7245-40d2-b061-6f1a77e22666\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"434\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:6:\"123456\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575795288,	1575800000,	'1',	0),
(7,	'api/auth/register',	'post',	'a:12:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------532172192694972078326255\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"a5a24f8c-0ccc-4ea6-b349-8b4a80ff194d\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"434\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:6:\"123456\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575795309,	1575800000,	'1',	0),
(8,	'api/auth/register',	'post',	'a:12:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------392752526938645844190528\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"70c63a6c-a394-4038-89c2-de7c2995a7fa\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"434\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:6:\"123456\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575795666,	1575800000,	'1',	0),
(9,	'api/auth/register',	'post',	'a:12:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------118166180991599720983490\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"3b1a1805-686d-4557-a60d-1152c1c33150\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"434\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:6:\"123456\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575795737,	1575800000,	'1',	0),
(10,	'api/auth/register',	'post',	'a:12:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------542841045875517889252842\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"68d4e001-749e-42d1-bf2c-19cecf54f423\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"434\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:6:\"123456\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575795885,	1575800000,	'1',	406),
(11,	'api/auth/register',	'post',	'a:13:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------695462349650424396464283\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e3ec494a-49e7-47a7-bad1-5d70eb203774\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"556\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:6:\"123456\";s:5:\"email\";s:18:\"testing@google.com\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575795959,	1575800000,	'1',	406),
(12,	'api/auth/register',	'post',	'a:13:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------005370208200396885796594\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"795c9108-2ea7-4fd3-909e-9950b513cd5d\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"558\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:8:\"12345678\";s:5:\"email\";s:18:\"testing@google.com\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575795965,	1575800000,	'1',	200),
(13,	'api/auth/register',	'post',	'a:13:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------973086419209453384774268\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"1f17a61f-3095-4494-8c41-3754aac9d153\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"556\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:6:\"123456\";s:5:\"email\";s:18:\"testing@google.com\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575795984,	1575800000,	'1',	406),
(14,	'api/auth/register',	'post',	'a:13:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------506677185640272577981229\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"f97faa29-fa69-44a9-8b5c-53b3607fc6fd\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"558\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:8:\"12345678\";s:5:\"email\";s:18:\"testing@google.com\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575796653,	1575800000,	'1',	200),
(15,	'api/auth/register',	'post',	'a:13:{s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------354205154169855043574401\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"28f38d2f-9bbb-4e72-8617-d81ef2358019\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:3:\"558\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:8:\"12345678\";s:5:\"email\";s:18:\"testing@google.com\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575797846,	1575800000,	'1',	200),
(16,	'api/auth/verify_otp',	'post',	'a:11:{s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"8071ef01-f8b7-4e11-b6af-b91349ef33e3\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:2:\"61\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:3:\"otp\";s:6:\"izh1Ox\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575798009,	1575800000,	'1',	400),
(17,	'api/auth/verify_otp',	'post',	'a:11:{s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"4cfa32ad-a1d0-4982-94e4-5caae17b6212\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:2:\"61\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:3:\"otp\";s:6:\"izh1Ox\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575798038,	1575800000,	'1',	200),
(18,	'api/auth/verify_otp',	'post',	'a:11:{s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"330f353c-cab7-4b8a-a0ad-d5a090abe2c5\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:2:\"61\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:3:\"otp\";s:6:\"izh1Ox\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575798083,	1575800000,	'1',	200),
(19,	'api/auth/login',	'post',	'a:12:{s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"bfc6a911-bcd9-41c1-97ac-e98d9f0105b0\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:2:\"88\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:8:\"12345678\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575799513,	1575800000,	'1',	200),
(20,	'api/auth/login',	'post',	'a:12:{s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.20.1\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"ffd75e5a-69e2-4504-9b71-2425ef4d7e88\";s:4:\"Host\";s:9:\"localhost\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:14:\"Content-Length\";s:2:\"88\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"api_token\";s:40:\"wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o\";s:8:\"username\";s:10:\"darkwalker\";s:8:\"password\";s:8:\"12345678\";}',	'wggc8k0k84kkgksgw08w08c4wcs8ssckg08go88o',	'::1',	1575799560,	1575800000,	'1',	200);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `register_key` varchar(100) NOT NULL,
  `reset_key` varchar(100) NOT NULL,
  `api_key` varchar(250) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(20) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `username`, `password`, `email`, `register_key`, `reset_key`, `api_key`, `user_type`, `created_at`, `create_by`, `update_at`, `update_by`, `is_active`) VALUES
(1,	'darkwalker',	'$2y$10$zY0kmXHB1Kt5rkj5.3X3mOpmDvILByIkKog5o27e0Ro8EvL00G/x2',	'testing@google.com',	'',	'',	'044g48sgg8c8w88ookgkkocsw4ooc8ss8c4co0w80okw4gsg80gk0ko0k440w008',	2,	'2019-12-08 16:37:26',	'API',	'2019-12-08 09:41:23',	'API',	1);

-- 2019-12-08 10:14:07
