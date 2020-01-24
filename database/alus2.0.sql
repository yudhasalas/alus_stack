/*
Navicat MySQL Data Transfer

Source Server         : Localhost PHP 7
Source Server Version : 100137
Source Host           : localhost:3307
Source Database       : alus2.0

Target Server Type    : MYSQL
Target Server Version : 100137
File Encoding         : 65001

Date: 2020-01-24 10:09:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for alus_g
-- ----------------------------
DROP TABLE IF EXISTS `alus_g`;
CREATE TABLE `alus_g` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alus_g
-- ----------------------------
INSERT INTO `alus_g` VALUES ('1', 'admin', 'testaa');

-- ----------------------------
-- Table structure for alus_gd
-- ----------------------------
DROP TABLE IF EXISTS `alus_gd`;
CREATE TABLE `alus_gd` (
  `agd_id` int(11) NOT NULL AUTO_INCREMENT,
  `ag_id` int(11) DEFAULT NULL,
  `enabled` int(1) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `table_is_filter` int(1) DEFAULT NULL,
  `table_where` varchar(50) DEFAULT NULL,
  `table_filter` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`agd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of alus_gd
-- ----------------------------
INSERT INTO `alus_gd` VALUES ('1', '1', '1', 'Test Maul', null, null, '+1++2++3++5++7+');
INSERT INTO `alus_gd` VALUES ('2', '2', '1', 'tesst', null, null, '+24+');
INSERT INTO `alus_gd` VALUES ('4', '14', '1', 'teest', null, null, '+1+');
INSERT INTO `alus_gd` VALUES ('5', '15', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('6', '28', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('7', '17', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('8', '16', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('9', '27', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('10', '30', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('11', '29', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('12', '21', '1', 'Ma', null, null, '+2++10+');
INSERT INTO `alus_gd` VALUES ('13', '20', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('14', '22', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('15', '31', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('17', '24', '1', 'teest', null, null, '+49++50++51+');
INSERT INTO `alus_gd` VALUES ('18', '25', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('19', '26', '1', 'teest', null, null, '+5+');
INSERT INTO `alus_gd` VALUES ('20', '18', '1', 'teest', null, null, '+3+');
INSERT INTO `alus_gd` VALUES ('21', '23', '1', 'teest', null, null, '+234+');
INSERT INTO `alus_gd` VALUES ('22', '33', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('23', '34', '1', 'teest', null, null, null);
INSERT INTO `alus_gd` VALUES ('25', '88', '1', 'Tables', null, null, '+1++5++49++50+');
INSERT INTO `alus_gd` VALUES ('26', '89', '1', 'Tables', null, null, '+5+');
INSERT INTO `alus_gd` VALUES ('27', '86', '1', 'maulanaaaaa', null, null, '+1+');

-- ----------------------------
-- Table structure for alus_la
-- ----------------------------
DROP TABLE IF EXISTS `alus_la`;
CREATE TABLE `alus_la` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alus_la
-- ----------------------------

-- ----------------------------
-- Table structure for alus_mg
-- ----------------------------
DROP TABLE IF EXISTS `alus_mg`;
CREATE TABLE `alus_mg` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_parent` int(11) NOT NULL,
  `menu_nama` varchar(255) NOT NULL,
  `menu_uri` varchar(255) NOT NULL,
  `menu_target` varchar(255) DEFAULT NULL,
  `menu_icon` varchar(25) DEFAULT NULL,
  `order_num` int(5) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alus_mg
-- ----------------------------
INSERT INTO `alus_mg` VALUES ('11', '30', 'Menus', 'menus', '', 'fa fa-bars fa-fw', '1');
INSERT INTO `alus_mg` VALUES ('12', '30', 'Group', 'group', '', 'fa fa-book fa-fw', '2');
INSERT INTO `alus_mg` VALUES ('13', '30', 'User', 'users', '', 'fa fa-book fa-fw', '3');
INSERT INTO `alus_mg` VALUES ('30', '0', 'Master', '#', '', 'fa fa-bars fa-fw', '1');

-- ----------------------------
-- Table structure for alus_mga
-- ----------------------------
DROP TABLE IF EXISTS `alus_mga`;
CREATE TABLE `alus_mga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` mediumint(8) unsigned NOT NULL,
  `id_menu` int(11) NOT NULL,
  `can_view` int(1) DEFAULT NULL,
  `can_edit` int(1) NOT NULL DEFAULT '0',
  `can_add` int(1) NOT NULL DEFAULT '0',
  `can_delete` int(1) NOT NULL DEFAULT '0',
  `psv` datetime DEFAULT NULL,
  `pev` datetime DEFAULT NULL,
  `psed` datetime DEFAULT NULL,
  `peed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_groups_deleted` (`id_group`) USING BTREE,
  KEY `fk_menu_deleted` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=3844 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alus_mga
-- ----------------------------
INSERT INTO `alus_mga` VALUES ('3796', '1', '30', '1', '0', '0', '0', '2016-09-06 10:55:00', '2016-09-06 10:55:00', '2016-08-08 12:06:00', '2016-08-09 13:50:00');
INSERT INTO `alus_mga` VALUES ('3797', '1', '12', '1', '1', '1', '1', '2016-09-06 10:55:00', '2016-09-06 10:55:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00');
INSERT INTO `alus_mga` VALUES ('3798', '1', '13', '1', '1', '1', '1', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00');
INSERT INTO `alus_mga` VALUES ('3801', '1', '58', '1', '0', '0', '0', '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `alus_mga` VALUES ('3803', '1', '66', '1', '0', '0', '0', '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `alus_mga` VALUES ('3804', '1', '68', '1', '0', '0', '0', '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `alus_mga` VALUES ('3807', '1', '70', '1', '0', '0', '0', '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `alus_mga` VALUES ('3817', '1', '75', '1', '1', '1', '1', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00');
INSERT INTO `alus_mga` VALUES ('3843', '1', '11', '1', '1', '1', '1', null, null, null, null);

-- ----------------------------
-- Table structure for alus_u
-- ----------------------------
DROP TABLE IF EXISTS `alus_u`;
CREATE TABLE `alus_u` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `abc` varchar(100) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `ghi` varchar(255) NOT NULL,
  `def` varchar(255) DEFAULT NULL,
  `mno` varchar(40) DEFAULT NULL,
  `jkl` varchar(40) DEFAULT NULL,
  `stu` int(11) unsigned DEFAULT NULL,
  `pqr` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `ht` int(1) DEFAULT '0',
  `picture` varchar(255) DEFAULT NULL,
  `mdo_id` int(11) DEFAULT NULL,
  `mos_id` int(11) DEFAULT NULL,
  `grup_type` int(11) DEFAULT NULL,
  `bpd_id` int(11) DEFAULT NULL,
  `bpd_id_2` int(11) DEFAULT NULL,
  `staff_pmk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_users_idx1` (`id`) USING BTREE,
  KEY `sys_users_idx2` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alus_u
-- ----------------------------
INSERT INTO `alus_u` VALUES ('64', 'admins', 'admins', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+5Kixew57njDPeg==', '::1', '$2y$08$.sbsuXatbF/d4/RvUy77GeeX/Nw48XoXXS/3Xurj7O/ujoQu3KGzK', 'xEfWFClsAdO4BnNm', '', '', null, '', '1469523580', '1579833925', '1', 'User', '', '', '11', '0', '1496118042.jpg', null, null, null, null, null, null);
INSERT INTO `alus_u` VALUES ('65', 'BAGIAN PERLENGKAPAN', 'BAGIAN PERLENGKAPAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkVgp03DrOdk5BlGFoiIk=', '::1', '$2y$08$JoKZ4fv6BkH5WTWLwW9IfulZAbwPRhawSu5/basXlOukNzemXJuqS', 'Ih49EoG2nF0Zt38O', null, null, null, null, '1542868077', '1550670091', '1', 'BAGIAN PERLENGKAPAN', null, null, '0', '0', 'avatar_default.png', null, '1', null, null, null, null);
INSERT INTO `alus_u` VALUES ('66', 'DINAS PENDIDIKAN', 'DINAS PENDIDIKAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnVgp03DrOdk5BlGFoiIk=', '::1', '$2y$08$VUKn/N/Oz3h/8IB7somj3ODzqJ3cGYVnLbUw/QESB9MVhCV.zeInG', 'Qoc9aAIiYkGjg9IZ', null, null, null, null, '1542868087', '1550991198', '1', 'DINAS PENDIDIKAN', '', null, '0', '0', 'avatar_default.png', null, '2', null, null, null, null);
INSERT INTO `alus_u` VALUES ('67', 'KECAMATAN KAYAN HULU', 'KECAMATAN KAYAN HULU', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmVgp03DrOdk5BlGFoiIk=', '::1', '$2y$08$amSFXmE4w705SSYY562IM.wr5fvtERPp7sXIFyi04MgZVY2rEhMXS', 'rrptJbn3YVDGJGOF', null, null, null, null, '1542868107', '1549440969', '1', 'KECAMATAN KAYAN HULU', null, null, '0', '0', 'avatar_default.png', null, '3', null, null, null, null);
INSERT INTO `alus_u` VALUES ('68', 'KECAMATAN MALINAU SELATAN HULU', 'KECAMATAN MALINAU SELATAN HULU', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhVgp03DrOdk5BlGFoiIk=', '::1', '$2y$08$54yXxiB4w4TpZrfS8E4k2.8h24NaIjW9txSJQJ5lTnpmT9b.Rbqpi', 'Ftr/Tmqyey/I30FI', null, null, null, null, '1542868115', '1551275597', '1', 'KECAMATAN MALINAU SELATAN HULU', null, null, '0', '0', 'avatar_default.png', null, '4', null, null, null, null);
INSERT INTO `alus_u` VALUES ('69', 'KECAMATAN MALINAU KOTA', 'KECAMATAN MALINAU KOTA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngVgp03DrOdk5BlGFoiIk=', '::1', '$2y$08$El7EPObwt.3SXLXC/Ra/Pe038PDY5nrJWQJ0Ol8H9dwGC.rU45Ed6', '60TGEWENwJbU2E.t', null, null, null, null, '1542868123', '1549271960', '1', 'KECAMATAN MALINAU KOTA', null, null, '0', '0', 'avatar_default.png', null, '5', null, null, null, null);
INSERT INTO `alus_u` VALUES ('70', 'BADAN PERENCANAAN PEMBANGUNAN DAERAH DAN LITBANG', 'BADAN PERENCANAAN PEMBANGUNAN DAERAH DAN LITBANG', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnjVgp03DrOdk5BlGFoiIk=', '::1', '$2y$08$rxv1uLfYNkY6rsWG1FUF0eO5ai0o0b/yahX1H1cgxKRmRyCVGkKJ6', 'nZnOhCQn1ho5dbWZ', null, null, null, null, '1542868130', null, '1', 'BADAN PERENCANAAN PEMBANGUNAN DAERAH DAN LITBANG', null, null, '0', '0', 'avatar_default.png', null, '6', null, null, null, null);
INSERT INTO `alus_u` VALUES ('71', 'DINAS PERHUBUNGAN', 'DINAS PERHUBUNGAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPniVgp03DrOdk5BlGFoiIk=', '::1', '$2y$08$/KMY9ZSiaLqSNvbQ60A.Gu.pNmuM.rQMm6y5Fa6pgGz2xTNi/6bUu', 'UHVMoXEIQ1Jdlkc/', null, null, null, null, '1542868139', null, '1', 'DINAS PERHUBUNGAN', null, null, '0', '0', 'avatar_default.png', null, '7', null, null, null, null);
INSERT INTO `alus_u` VALUES ('72', 'BAGIAN PEMBANGUNAN', 'BAGIAN PEMBANGUNAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPntVgp03DrOdk5BlGFoiIk=', '::1', '$2y$08$Drr9MvhHhfK.mbZoJpmHgOGT2V358Y/XYbadXbqBiTBXKHGOgb68i', 'lMsDc82.X6.iY6ni', null, null, null, null, '1542868147', null, '1', 'BAGIAN PEMBANGUNAN', null, null, '0', '0', 'avatar_default.png', null, '8', null, null, null, null);
INSERT INTO `alus_u` VALUES ('73', 'SEKRETARIAT DPRD', 'SEKRETARIAT DPRD', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnsVgp03DrOdk5BlGFoiIk=', '::1', '$2y$08$1HRiU7/MXyYi4HGQtRlsReLbmyYbmRJVQ6WBPNp1ZCLRGmWVBp.c6', 'V.h09FO10yyZpodC', null, null, null, null, '1542868153', null, '1', 'SEKRETARIAT DPRD', null, null, '0', '0', 'avatar_default.png', null, '9', null, null, null, null);
INSERT INTO `alus_u` VALUES ('74', 'BAGIAN ORGANISASI', 'BAGIAN ORGANISASI', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkJid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$ZFbbTqozjtTDp0L4xJAPPen6cBfKf9F.0PSTjVLhM8a/.tNnpgX4q', 'SSH8uLPH3S1ocJ9x', null, null, null, null, '1542868160', '1549447873', '1', 'BAGIAN ORGANISASI', null, null, '0', '0', 'avatar_default.png', null, '10', null, null, null, null);
INSERT INTO `alus_u` VALUES ('75', 'BAGIAN PENGADAAN BARANG DAN JASA', 'BAGIAN PENGADAAN BARANG DAN JASA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkJyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$ROEnxItEW6Q/Qe4YAn6QuudF6PLNnTsAg5gjkgmQVNvaIs8cusRQG', 'E4/B7vlEUGSBt/9n', null, null, null, null, '1542868167', '1549440721', '1', 'BAGIAN PENGADAAN BARANG DAN JASA', null, null, '0', '0', 'avatar_default.png', null, '11', null, null, null, null);
INSERT INTO `alus_u` VALUES ('76', 'BAGIAN PENGELOLAAN PERBATASAN NEGARA', 'BAGIAN PENGELOLAAN PERBATASAN NEGARA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkJCd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$gVBcpIGUsBXQXAop6ZbhnO0wkhm4grqUsikYbNzTubdRpsZsVml9i', 'ywaxdj2lO0vyjt5f', null, null, null, null, '1542868175', null, '1', 'BAGIAN PENGELOLAAN PERBATASAN NEGARA', null, null, '0', '0', 'avatar_default.png', null, '12', null, null, null, null);
INSERT INTO `alus_u` VALUES ('79', 'DINAS PERIKANAN', 'DINAS PERIKANAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkIyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$0IY0nl2KkJMVOxNBo.rpTeTDMWI.7oN6XOp2gKqyZ.PG4EzBUMun2', 'ump1Cg244ldPc4np', null, null, null, null, '1542868195', null, '1', 'DINAS PERIKANAN', null, null, '0', '0', 'avatar_default.png', null, '15', null, null, null, null);
INSERT INTO `alus_u` VALUES ('80', 'DINAS PERTANIAN', 'DINAS PERTANIAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkICd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$DQHmsH7zE6xJtd29MauosunPBgqGN2fml8Kn0JMBxrUhSC9gODKSq', 'm/vUH.JoDbyuWmsX', null, null, null, null, '1542868201', null, '1', 'DINAS PERTANIAN', null, null, '0', '0', 'avatar_default.png', null, '16', null, null, null, null);
INSERT INTO `alus_u` VALUES ('81', 'DINAS PERINDUSTRIAN DAN PERDAGANGAN', 'DINAS PERINDUSTRIAN DAN PERDAGANGAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkISd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$AOnWtOtLE9C2kgvmIjZJJeAQPzsy6wUKYzZK14Vnvt7leqcuABjX2', 'KfwQDwpJFcsNEnHH', null, null, null, null, '1542868208', null, '1', 'DINAS PERINDUSTRIAN DAN PERDAGANGAN', null, null, '0', '0', 'avatar_default.png', null, '17', null, null, null, null);
INSERT INTO `alus_u` VALUES ('82', 'DINAS KEBUDAYAAN DAN PARIWISATA', 'DINAS KEBUDAYAAN DAN PARIWISATA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkLid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$ivq3p0FOZP4/vi6kxtYc4ebkKmx3ZPzZa2qzcAXxCF51FPA6wlIz6', 'Hk6r0krOfpMlJQww', null, null, null, null, '1542868214', null, '1', 'DINAS KEBUDAYAAN DAN PARIWISATA', null, null, '0', '0', 'avatar_default.png', null, '18', null, null, null, null);
INSERT INTO `alus_u` VALUES ('83', 'DINAS KEPEMUDAAN DAN OLAHRAGA', 'DINAS KEPEMUDAAN DAN OLAHRAGA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkLyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$R/fA./V3uYPh2xLWLAC0Zedo3Fr/SRSZZNxfW1shSdYvBWOjX5xrK', 'DMIbULsgw0Cd71wb', null, null, null, null, '1542868221', null, '1', 'DINAS KEPEMUDAAN DAN OLAHRAGA', null, null, '0', '0', 'avatar_default.png', null, '19', null, null, null, null);
INSERT INTO `alus_u` VALUES ('84', 'BADAN KEPEGAWAIAN, PENDIDIKAN DAN PELATIHAN', 'BADAN KEPEGAWAIAN, PENDIDIKAN DAN PELATIHAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnJid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$1sTxGiMpQ/0C1KkU3LHbl.frJhweq1zNzA4bRaEFNRRAWp0AVZ8FK', '00k2AC7bWZWFhzE6', null, null, null, null, '1542868234', null, '1', 'BADAN KEPEGAWAIAN, PENDIDIKAN DAN PELATIHAN', '', null, '0', '0', 'avatar_default.png', null, '20', null, null, null, '11');
INSERT INTO `alus_u` VALUES ('85', 'BAGIAN TATA PEMERINTAHAN', 'BAGIAN TATA PEMERINTAHAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnJyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$.BDVTDqvas.GZO.l2HLxY.qSUrLwqvYKhOsYdFxPN8fQx39TX2.a6', 'ul0s6PLnTxEx41E2', null, null, null, null, '1542868262', null, '1', 'BAGIAN TATA PEMERINTAHAN', null, null, '0', '0', 'avatar_default.png', null, '21', null, null, null, null);
INSERT INTO `alus_u` VALUES ('86', 'DINAS PEKERJAAN UMUM, PENATAAN RUANG, PERUMAHAN DAN KAWASAN PEMUKIMAN', 'DINAS PEKERJAAN UMUM, PENATAAN RUANG, PERUMAHAN DA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnJCd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$BKgKiiPmmLn.DO4P.TyOrObIK1W6dvSFiU5NQfbw.zQ5SysDqp1Fy', 'flkveMiVlkIYUuGJ', null, null, null, null, '1542868271', null, '1', 'DINAS PEKERJAAN UMUM, PENATAAN RUANG, PERUMAHAN DA', null, null, '0', '0', 'avatar_default.png', null, '22', null, null, null, null);
INSERT INTO `alus_u` VALUES ('87', 'BADAN SATUAN POLISI PAMONG PRAJA DAN PEMADAM KEBAKARAN', 'BADAN SATUAN POLISI PAMONG PRAJA DAN PEMADAM KEBAK', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnJSd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$x.5JfLsBq1G/SBASCV4QROlZvvGJhCcRdJ9fZ4vAqov7eKln6iRk6', '9XDKlgf/4zdQTV1y', null, null, null, null, '1542868282', null, '1', 'BADAN SATUAN POLISI PAMONG PRAJA DAN PEMADAM KEBAK', null, null, '0', '0', 'avatar_default.png', null, '23', null, null, null, null);
INSERT INTO `alus_u` VALUES ('88', 'BADAN KESATUAN BANGSA DAN POLITIK', 'BADAN KESATUAN BANGSA DAN POLITIK', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnIid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$VvC4T1V4iZbnc6qPviK94OXUk9eFX9XYMWHsfEEqkQcgApC6dYs0a', 'umkKYV4x1afVmu.8', null, null, null, null, '1542868343', null, '1', 'BADAN KESATUAN BANGSA DAN POLITIK', '', null, '0', '0', 'avatar_default.png', null, '24', null, null, null, null);
INSERT INTO `alus_u` VALUES ('89', 'DINAS KETAHANAN PANGAN', 'DINAS KETAHANAN PANGAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnIyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$bSzkJcLMD8wcD9WvDwcnR.y3gtV.tmVf6QzPOld.zxDqC1NHQvNx.', 'yXGdAECGARwCxUer', null, null, null, null, '1542868359', null, '1', 'DINAS KETAHANAN PANGAN', null, null, '0', '0', 'avatar_default.png', null, '25', null, null, null, null);
INSERT INTO `alus_u` VALUES ('90', 'DINAS LINGKUNGAN HIDUP', 'DINAS LINGKUNGAN HIDUP', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnICd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$zfF8fYPmWJWXOgl7o4Ng3.m3iSLK7DCHKFbCNci0kbShDMYljrQ7S', 'CQvIrGTk/.1hhglm', null, null, null, null, '1542868370', null, '1', 'DINAS LINGKUNGAN HIDUP', null, null, '0', '0', 'avatar_default.png', null, '26', null, null, null, null);
INSERT INTO `alus_u` VALUES ('91', 'DINAS KOMUNIKASI DAN INFORMATIKA', 'DINAS KOMUNIKASI DAN INFORMATIKA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnISd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$wj1DM4xogVCf/mPzU5054uUxwBhjF9sByjY.gLEIhYo8RhAMEgvY2', 'oUe.j.CXcGZtxfhX', null, null, null, null, '1542868381', null, '1', 'DINAS KOMUNIKASI DAN INFORMATIKA', null, null, '0', '0', 'avatar_default.png', null, '27', null, null, null, null);
INSERT INTO `alus_u` VALUES ('92', 'DINAS PEMBERDAYAAN PEREMPUAN, PERLINDUNGAN ANAK DAN SOSIAL', 'DINAS PEMBERDAYAAN PEREMPUAN, PERLINDUNGAN ANAK DA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnLid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$O.BepJnMjdf34wthDVp3X.GkVXkzyWwOt8L3ZKHuDHPqYd7jCjWkm', 'Sg0zS/LEL1CHLTzd', null, null, null, null, '1542868391', null, '1', 'DINAS PEMBERDAYAAN PEREMPUAN, PERLINDUNGAN ANAK DA', null, null, '0', '0', 'avatar_default.png', null, '28', null, null, null, null);
INSERT INTO `alus_u` VALUES ('93', 'DINAS PEMBERDAYAAN MASYARAKAT DAN DESA', 'DINAS PEMBERDAYAAN MASYARAKAT DAN DESA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnLyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$znw3goPM9pnMUmpxw/qP1OOgaKk4VC/yzFnBjYtIOY2WbNKmJud4y', '17N73VZ2I3Rn3.rd', null, null, null, null, '1542868409', null, '1', 'DINAS PEMBERDAYAAN MASYARAKAT DAN DESA', null, null, '0', '0', 'avatar_default.png', null, '29', null, null, null, null);
INSERT INTO `alus_u` VALUES ('94', 'DINAS PENANAMAN MODAL, PELAYANAN TERPADU SATU PINTU DAN TENAGA KERJA', 'DINAS PENANAMAN MODAL, PELAYANAN TERPADU SATU PINT', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmJid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$OythoUmfSuJtqq4wyQX6sOhTSgnz5xmIr9MMnwTyf8lA598MF.Exy', 'Wc01LUHcCerdrPyO', null, null, null, null, '1542868416', null, '1', 'DINAS PENANAMAN MODAL, PELAYANAN TERPADU SATU PINT', null, null, '0', '0', 'avatar_default.png', null, '30', null, null, null, null);
INSERT INTO `alus_u` VALUES ('95', 'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL', 'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmJyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$NEM0qS9YsaVAKAkXhTQgfevwrXyNKndk08HZOOvCgd3orIaUXzNcW', 'h80dJ/KkQYQeH9CN', null, null, null, null, '1542868423', null, '1', 'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL', null, null, '0', '0', 'avatar_default.png', null, '31', null, null, null, null);
INSERT INTO `alus_u` VALUES ('96', 'BAGIAN EKONOMI', 'BAGIAN EKONOMI', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmJCd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$2jWtOqgBvOkuX2/OgC9Eo..jiJIrAE9ZvNNDmDIgjgO73Up0blPYS', 'TN0NGU98MIG8wno/', null, null, null, null, '1542868432', null, '1', 'BAGIAN EKONOMI', '', null, '0', '0', 'avatar_default.png', null, '32', null, null, null, '11');
INSERT INTO `alus_u` VALUES ('97', 'BAGIAN HUKUM', 'BAGIAN HUKUM', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmJSd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$HJ.ljNJqV8BIxOkT3VylXO97.FOwzh6DWJ5ldDUR8ZZUX.fClZhf.', 'LCYj.c2Mya1PSnl5', null, null, null, null, '1542868440', null, '1', 'BAGIAN HUKUM', null, null, '0', '0', 'avatar_default.png', null, '33', null, null, null, null);
INSERT INTO `alus_u` VALUES ('98', 'BAGIAN HUMAS DAN PROTOKOL', 'BAGIAN HUMAS DAN PROTOKOL', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmIid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$/1AvCTjQiRedBsTzc/aqBuVhIatGD2p13541Emx2CZoDXyP/r186u', 'AUWGK58J0Gjbr6KO', null, null, null, null, '1542868447', null, '1', 'BAGIAN HUMAS DAN PROTOKOL', null, null, '0', '0', 'avatar_default.png', null, '34', null, null, null, null);
INSERT INTO `alus_u` VALUES ('99', 'INSPEKTORAT', 'INSPEKTORAT', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmIyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$WlqpnJ6EwAHs.PJ0q9deoOQa88T3pLVyqHoFZnoxPEYKuNEc6Vmay', 'pIYTiZ3kZYZ8h8hf', null, null, null, null, '1542868455', null, '1', 'INSPEKTORAT', null, null, '0', '0', 'avatar_default.png', null, '35', null, null, null, null);
INSERT INTO `alus_u` VALUES ('100', 'SEKRETARIAT KORPRI', 'SEKRETARIAT KORPRI', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmICd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$Aotlhss7LXzzizLSL4MoPuaX5PkO7NfMb3h4fzYHAJZXcU.0BUjZS', 'swwMvJxq5GGKALBC', null, null, null, null, '1542868463', null, '1', 'SEKRETARIAT KORPRI', null, null, '0', '0', 'avatar_default.png', null, '36', null, null, null, null);
INSERT INTO `alus_u` VALUES ('101', 'DINAS PERPUSTAKAAN DAN KEARSIPAN DAERAH', 'DINAS PERPUSTAKAAN DAN KEARSIPAN DAERAH', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmISd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$Jy9lXjAxawk6aUrrVtXjQelD9LHDDMCfAfK9ac5Kera2d5FK9hiLS', 'WYp8BxWd5OaKaYDy', null, null, null, null, '1542868469', '1551275562', '1', 'DINAS PERPUSTAKAAN DAN KEARSIPAN DAERAH', null, null, '0', '0', 'avatar_default.png', null, '37', null, null, null, null);
INSERT INTO `alus_u` VALUES ('102', 'BADAN PENGELOLA KEUANGAN DAERAH', 'BADAN PENGELOLA KEUANGAN DAERAH', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmLid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$ZS6h33lajAZAOkY.DO5.TupwYP.TzxylIA6plz1Tts5zd1aJhZ2tm', '74VeV4Lv8XixiIHJ', null, null, null, null, '1542868476', null, '1', 'BADAN PENGELOLA KEUANGAN DAERAH', '', null, '0', '0', 'avatar_default.png', null, '38', null, null, null, null);
INSERT INTO `alus_u` VALUES ('104', 'DINAS KESEHATAN, PENGENDALIAN PENDUDUK DAN KELUARGA BERENCANA', 'DINAS KESEHATAN, PENGENDALIAN PENDUDUK DAN KELUARG', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhJid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$R/H2SKoGU.RC1DI5SjDvBOH82iWrv1yhuioerd1LmX39LhCQ2XlF6', '5K3KZUZQS.ym0VPj', null, null, null, null, '1542868525', null, '1', 'DINAS KESEHATAN, PENGENDALIAN PENDUDUK DAN KELUARG', null, null, '0', '0', 'avatar_default.png', null, '39', null, null, null, null);
INSERT INTO `alus_u` VALUES ('105', 'BADAN PENANGGULANGAN BENCANA DAERAH', 'BADAN PENANGGULANGAN BENCANA DAERAH', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhJyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$KtxQ9aH0ZcBayXqIuBJfxuc6cBtSmgQJx8R6vk6pdtl2Jy8n..csm', 'SXX0oB7pWW5UoneL', null, null, null, null, '1542868531', null, '1', 'BADAN PENANGGULANGAN BENCANA DAERAH', null, null, '0', '0', 'avatar_default.png', null, '40', null, null, null, null);
INSERT INTO `alus_u` VALUES ('106', 'BAGIAN UMUM', 'BAGIAN UMUM', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhJCd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$IB9xLxRK8sK4woRk1EU0Y.kZLPcUPoGag40tmp3Qd8kSR4NQvLyTC', 'PVIY9d4vxslZlxfG', null, null, null, null, '1542868538', null, '1', 'BAGIAN UMUM', null, null, '0', '0', 'avatar_default.png', null, '41', null, null, null, null);
INSERT INTO `alus_u` VALUES ('107', 'KECAMATAN MENTARANG', 'KECAMATAN MENTARANG', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhJSd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$iW5Ns.EpVPu2v5x5oSBi3e1s4rpwaLk1.SzrYGaqzXgl5Qu1Jdlgq', 'eWYHreUlwLuY/UQa', null, null, null, null, '1542868549', null, '1', 'KECAMATAN MENTARANG', null, null, '0', '0', 'avatar_default.png', null, '42', null, null, null, null);
INSERT INTO `alus_u` VALUES ('108', 'KECAMATAN MALINAU UTARA', 'KECAMATAN MALINAU UTARA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhIid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$AWWhTSH7ooH2Iq07QkbJg.Q5SCCrcg/XwkpE7JYG9Gd65YTrWeLkW', 'dOHgt9xCDrpnnsyR', null, null, null, null, '1542868556', null, '1', 'KECAMATAN MALINAU UTARA', null, null, '0', '0', 'avatar_default.png', null, '43', null, null, null, null);
INSERT INTO `alus_u` VALUES ('109', 'KECAMATAN SUNGAI BOH', 'KECAMATAN SUNGAI BOH', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhIyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$pfZT3o.nSaQt.9QwtuG8BuivORQ1FSz9zalR9abKgAejACm0B8TgK', 'kTlvINYpqur.6i5u', null, null, null, null, '1542868565', null, '1', 'KECAMATAN SUNGAI BOH', null, null, '0', '0', 'avatar_default.png', null, '44', null, null, null, null);
INSERT INTO `alus_u` VALUES ('110', 'KECAMATAN BAHAU HULU', 'KECAMATAN BAHAU HULU', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhICd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$IvXDeLYUz.LP5BB.OjmKk.IVoRZ6gD4deykrN0UoMsbPK6InGLk5C', 'sVkZXp038wloNSoU', null, null, null, null, '1542868583', null, '1', 'KECAMATAN BAHAU HULU', null, null, '0', '0', 'avatar_default.png', null, '45', null, null, null, null);
INSERT INTO `alus_u` VALUES ('111', 'KECAMATAN MALINAU BARAT', 'KECAMATAN MALINAU BARAT', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhISd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$ejeDvgtEHd9qhANiyaQQjuxdeM/iWr8xlbcS.7Yy52gV4OMGb/HTW', 'cSrBKWYww3v2iKFh', null, null, null, null, '1542868591', null, '1', 'KECAMATAN MALINAU BARAT', null, null, '0', '0', 'avatar_default.png', null, '46', null, null, null, null);
INSERT INTO `alus_u` VALUES ('112', 'KECAMATAN MALINAU SELATAN', 'KECAMATAN MALINAU SELATAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhLid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$B/8SFxgjdcxSuAMyFVcY5.TXW6Fo8He.ebV7UPH2pYzWRQNxo/3xq', 'Kf7Uy0PttuWeiJCt', null, null, null, null, '1542868599', null, '1', 'KECAMATAN MALINAU SELATAN', null, null, '0', '0', 'avatar_default.png', null, '47', null, null, null, null);
INSERT INTO `alus_u` VALUES ('113', 'KECAMATAN MENTARANG HULU', 'KECAMATAN MENTARANG HULU', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhLyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$RHAptJ3iHUpA2jZF42mMz.uE.8ESrJjm4U0osA90GreZCSyg//jVK', 'x9o48pPoBaYKvCfy', null, null, null, null, '1542868609', null, '1', 'KECAMATAN MENTARANG HULU', null, null, '0', '0', 'avatar_default.png', null, '48', null, null, null, null);
INSERT INTO `alus_u` VALUES ('114', 'KECAMATAN PUJUNGAN', 'KECAMATAN PUJUNGAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngJid40T/JeVoa3Wkpz4Sj', ' ', '$2y$08$GZ5ZLGrz8hD14lHfI1FCZe8mjNMK62qzYxNDCbkU1b/JLk7JvSebi', 't4J7xSm.XOc3AAPZ', null, null, null, null, '1542868617', null, '1', 'KECAMATAN PUJUNGAN', null, null, '0', '0', 'avatar_default.png', null, '49', null, null, null, null);
INSERT INTO `alus_u` VALUES ('115', 'KECAMATAN KAYAN HILIR', 'KECAMATAN KAYAN HILIR', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngJyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$7a5zc37Kx0NWBi2FvfFMheQ8k1tquwmgtpLe8GjLZxBJ5EeF/Krme', 'jIHOJM2UcRmSEklK', null, null, null, null, '1542868625', null, '1', 'KECAMATAN KAYAN HILIR', null, null, '0', '0', 'avatar_default.png', null, '50', null, null, null, null);
INSERT INTO `alus_u` VALUES ('116', 'KECAMATAN KAYAN SELATAN', 'KECAMATAN KAYAN SELATAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngJCd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$yZk0.afzayg9f/p82OfdkOOV8pKXefAoQKKwstppRdLLUBg7ZK2Cm', 'A.rcO02QCognqnL3', null, null, null, null, '1542868633', null, '1', 'KECAMATAN KAYAN SELATAN', null, null, '0', '0', 'avatar_default.png', null, '51', null, null, null, null);
INSERT INTO `alus_u` VALUES ('117', 'KECAMATAN SUNGAI TUBU', 'KECAMATAN SUNGAI TUBU', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngJSd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$xnnKZRlHPnMFktMj6bS1N.zMVpi.b.9CZLdjKMFxgbJVPy9xZC7na', 'GqQ/ZSi/6l3u.lJP', null, null, null, null, '1542868640', null, '1', 'KECAMATAN SUNGAI TUBU', null, null, '0', '0', 'avatar_default.png', null, '52', null, null, null, null);
INSERT INTO `alus_u` VALUES ('118', 'KECAMATAN MALINAU SELATAN HILIR', 'KECAMATAN MALINAU SELATAN HILIR', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngIid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$zfxrHhr9tfi0gULYJkdrIutoMjQ0FwBtiSXA7WzrcJOd6cvadkOs2', 'MnOjvwLzGdWzh8xU', null, null, null, null, '1542868647', null, '1', 'KECAMATAN MALINAU SELATAN HILIR', null, null, '0', '0', 'avatar_default.png', null, '53', null, null, null, null);
INSERT INTO `alus_u` VALUES ('119', 'PERWAKILAN KECAMATAN LONG SULE', 'PERWAKILAN KECAMATAN LONG SULE', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngIyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$MBqguuIAnPi4o0QU.bQcruaRKwRNr7Y39P85ZeWGM6uVylz12rQTi', '.vziohki/5YWhznl', null, null, null, null, '1542868655', null, '1', 'PERWAKILAN KECAMATAN LONG SULE', null, null, '0', '0', 'avatar_default.png', null, '54', null, null, null, null);
INSERT INTO `alus_u` VALUES ('120', 'KANTOR PERSIAPAN KECAMATAN MALINAU UTARA TIMUR', 'KANTOR PERSIAPAN KECAMATAN MALINAU UTARA TIMUR', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngICd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$mnbbvXqcDt5Dd0acGTpZrOmT3r5CvVGIhNCmNTNHwVLdl4Rs4v0zW', 'QHQ4H.vyodnM/WlS', null, null, null, null, '1542868663', null, '1', 'KANTOR PERSIAPAN KECAMATAN MALINAU UTARA TIMUR', null, null, '0', '0', 'avatar_default.png', null, '55', null, null, null, null);
INSERT INTO `alus_u` VALUES ('177', 'BAGIAN KESEJAHTERAAN RAKYAT', 'BAGIAN KESEJAHTERAAN RAKYAT', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkJSd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$xkLqzB427A/DorRTNQkvMuRP9pph.RV4M9iXco4gUaRXZcRjKyTym', 'jcBmBV2Nlp0J7tSu', null, null, null, null, '1542868183', null, '1', 'BAGIAN KESEJAHTERAAN RAKYAT', null, null, '0', '0', 'avatar_default.png', null, '13', null, null, null, null);
INSERT INTO `alus_u` VALUES ('178', 'RSUD', 'RSUD', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkIid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$yL5qQDoWOVqva0R89cPeLeQStYmnzj7kTvtakYMmGdIWVtLdwOqZa', 'JThT5.B3NQRg7qqF', null, null, null, null, '1542868189', null, '1', 'RSUD', null, null, '0', '0', 'avatar_default.png', null, '14', null, null, null, null);
INSERT INTO `alus_u` VALUES ('179', 'htu', 'htu', 'MTIzNDU2Nzg5MDEyMzQ1NvO/p7wxwKS8eEl23z4=', '::1', '$2y$08$hQYzRWoWHwh2UHQK68LcHuENpf3FG2htzkGGLKnAHEtVqgpjrZpjS', 'XMlDVWwcEeqsu1Kc', null, null, null, null, '1549439229', '1549439242', '1', 'HTU', '', null, '1', '0', 'avatar_default.png', null, null, null, null, null, null);
INSERT INTO `alus_u` VALUES ('180', 'user', 'user', 'MTIzNDU2Nzg5MDEyMzQ1NvaksZcl1Im0cgp83n3DeFY=', '::1', '$2y$08$0E5bLiUXEQKs6Qygvhd.vuBPebbQ/Kw/7N8LcXxRqgNmSVjiLjWo2', 'EVgXZipBo2gr1mmO', null, null, null, null, '1565064724', '1565076816', '1', 'User', '', null, '1', '0', 'avatar_default.png', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for alus_ug
-- ----------------------------
DROP TABLE IF EXISTS `alus_ug`;
CREATE TABLE `alus_ug` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`) USING BTREE,
  KEY `fk_users_groups_users1_idx` (`user_id`) USING BTREE,
  KEY `fk_users_groups_groups1_idx` (`group_id`) USING BTREE,
  CONSTRAINT `alus_ug_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `alus_g` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `alus_ug_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `alus_u` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alus_ug
-- ----------------------------
INSERT INTO `alus_ug` VALUES ('1', '64', '1');

-- ----------------------------
-- Table structure for sys_codes
-- ----------------------------
DROP TABLE IF EXISTS `sys_codes`;
CREATE TABLE `sys_codes` (
  `srn_id` int(11) NOT NULL AUTO_INCREMENT,
  `srn_code` varchar(50) DEFAULT NULL,
  `srn_value` int(11) DEFAULT NULL,
  `srn_length` int(11) DEFAULT '5',
  `srn_format` varchar(50) DEFAULT NULL,
  `srn_year` int(11) DEFAULT NULL,
  `srn_month` int(11) DEFAULT NULL,
  `srn_reset_by` varchar(20) DEFAULT 'NONE',
  PRIMARY KEY (`srn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_codes
-- ----------------------------
INSERT INTO `sys_codes` VALUES ('1', 'SN-IDTOKO', '52', '5', '{VALUE}', '2017', '1', 'YEAR');

-- ----------------------------
-- Table structure for t_user_endpoint
-- ----------------------------
DROP TABLE IF EXISTS `t_user_endpoint`;
CREATE TABLE `t_user_endpoint` (
  `tue_id` int(22) NOT NULL AUTO_INCREMENT,
  `tue_ip` varchar(75) NOT NULL,
  `tue_id_login` varchar(11) DEFAULT '0',
  `tue_endpoint` longtext,
  PRIMARY KEY (`tue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_user_endpoint
-- ----------------------------
INSERT INTO `t_user_endpoint` VALUES ('9', '8926d376-9656-4942-82a0-145ce3262eb9', '0', '{\"endpoint\":\"https://fcm.googleapis.com/fcm/send/dlrfzTlwERY:APA91bHBfq0S9QwFgXC_7BbSi3c61PtOb687tAEAlHi5k39XexEwTZtDsSnmuYM5OTex2WL7MNcm7LKPCEzIdV4AIaagAKnf-jQWZbw6Zi_aVm1suY3vwWdBpGUEKB5-kjgWkKlpJ5bF\",\"expirationTime\":null,\"keys\":{\"p256dh\":\"BCJdHlOxkhZjXXXQJZ1EprYpw-rP9Kb6y5p4glVB6ZB51UN3Uol-_w5KtpXv82ZkNKgX5EU6WrVyjeDRKKlaMUs\",\"auth\":\"xWQ87COB5PLiIsoR1ZNw7g\"}}');
INSERT INTO `t_user_endpoint` VALUES ('10', 'fb386e80-c20f-4c14-9c05-16c069ea9390', '0', '{\"endpoint\":\"https://fcm.googleapis.com/fcm/send/dSi3LVhVJSM:APA91bHNM7kEvSEU6eF7li5S5MovvZWG0MBanArphrYd26GYSwYgrTCRIhXTXDYCUVl9-DofgFrsxrB-dYftB3lWNuhfwBLRkQrrV1hI7lsEvVam1aDHp9ws_l4ZUbnqWzwJDHaJhOho\",\"expirationTime\":null,\"keys\":{\"p256dh\":\"BOd6G9SlnGqrMILGFHWut1RD6JV5jIFXoXFz8RliC2R8PjNg3g-z0p9TN5KrIT5tqh9ZD4YN_HsFDWNo1brgfAw\",\"auth\":\"0ndzI8m_3dD3RGJ_EiCJOw\"}}');
INSERT INTO `t_user_endpoint` VALUES ('11', 'e90c474e-d70b-4975-953f-873940e77272', '0', '{\"endpoint\":\"https://fcm.googleapis.com/fcm/send/cREzv9WlkS0:APA91bHOh9n19JSIICbYGaX53ZmO4wCyXqLdk7zODJ4bCtQ6MKBLzgCdYzYnln2TZ1Cp-E9EHmNqw2-XF0Iif398FmZx1fjQWRcB89O0qed8gB2ETPaUxy0LLaHrXpmsa5IsfB2SauSo\",\"expirationTime\":null,\"keys\":{\"p256dh\":\"BDs4453C_Nt4pHCT4mRP0ZNWq3m7EfF3D2wDlzVOx9fnzbt3j-QVWA8iPyXDeAg-ntRVJkA98rE7lX3Dzg2bOdU\",\"auth\":\"OBCLF2E1iZPlMwdMn4sEWw\"}}');
INSERT INTO `t_user_endpoint` VALUES ('12', 'e90c474e-d70b-4975-953f-873940e77272', '0', '{\"endpoint\":\"https://fcm.googleapis.com/fcm/send/cREzv9WlkS0:APA91bHOh9n19JSIICbYGaX53ZmO4wCyXqLdk7zODJ4bCtQ6MKBLzgCdYzYnln2TZ1Cp-E9EHmNqw2-XF0Iif398FmZx1fjQWRcB89O0qed8gB2ETPaUxy0LLaHrXpmsa5IsfB2SauSo\",\"expirationTime\":null,\"keys\":{\"p256dh\":\"BDs4453C_Nt4pHCT4mRP0ZNWq3m7EfF3D2wDlzVOx9fnzbt3j-QVWA8iPyXDeAg-ntRVJkA98rE7lX3Dzg2bOdU\",\"auth\":\"OBCLF2E1iZPlMwdMn4sEWw\"}}');
