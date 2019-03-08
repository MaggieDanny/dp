/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.24-log : Database - fhadmin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fhadmin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fhadmin`;

/*Table structure for table `db_fhdb` */

DROP TABLE IF EXISTS `db_fhdb`;

CREATE TABLE `db_fhdb` (
  `FHDB_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `db_fhdb` */

/*Table structure for table `db_timingbackup` */

DROP TABLE IF EXISTS `db_timingbackup`;

CREATE TABLE `db_timingbackup` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL,
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `db_timingbackup` */

insert  into `db_timingbackup`(`TIMINGBACKUP_ID`,`JOBNAME`,`CREATE_TIME`,`TABLENAME`,`STATUS`,`FHTIME`,`TIMEEXPLAIN`,`BZ`) values ('311e06c34a5e4518a86d5d30799f9b55','sys_app_user_515762','2016-04-11 17:04:55','sys_app_user',2,'1/2 * * ? * *','每个月的 每周 每天 每小时执行一次','备份任务'),('bc4a788bc2ec40bdb1b7730131c26d42','sys_app_user_359515','2016-04-12 17:24:05','sys_app_user',2,'1/3 * * ? * *','每个月的 每周 每天 每小时执行一次','ssss');

/*Table structure for table `dp_pay_channel_param` */

DROP TABLE IF EXISTS `dp_pay_channel_param`;

CREATE TABLE `dp_pay_channel_param` (
  `cp_id` varchar(100) NOT NULL COMMENT '主键id',
  `type` int(11) NOT NULL COMMENT '支付渠道 1：支付宝 2：微信APP支付 3：微信公众平台支付',
  `status` int(11) NOT NULL COMMENT '状态 1：有效 0：无效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `ali_pid` varchar(100) DEFAULT NULL COMMENT '支付宝合作者PIDl',
  `ali_account` varchar(100) DEFAULT NULL COMMENT '支付宝账号',
  `ali_appid` varchar(100) DEFAULT NULL COMMENT '支付宝appid',
  `ali_busi_pri_key` varchar(500) DEFAULT NULL COMMENT '支付宝商户私钥',
  `ali_pub_key` varchar(500) DEFAULT NULL COMMENT '支付宝公钥',
  `wx_busi_no` varchar(100) DEFAULT NULL COMMENT '微信商户id',
  `wx_appid` varchar(100) DEFAULT NULL COMMENT '微信APP_ID',
  `wx_busi_key` varchar(500) DEFAULT NULL COMMENT '微信支付支付商户Key（API密钥）',
  `wx_app_secret` varchar(100) DEFAULT NULL COMMENT '微信App_Secret',
  `wx_certificate` varchar(500) DEFAULT NULL COMMENT '微信HTTP证书文件',
  `wx_certificate_pwd` varchar(100) DEFAULT NULL COMMENT '微信HTTP证书文件密码（默认为商户id）',
  PRIMARY KEY (`cp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付渠道参数';

/*Data for the table `dp_pay_channel_param` */

insert  into `dp_pay_channel_param`(`cp_id`,`type`,`status`,`create_time`,`ali_pid`,`ali_account`,`ali_appid`,`ali_busi_pri_key`,`ali_pub_key`,`wx_busi_no`,`wx_appid`,`wx_busi_key`,`wx_app_secret`,`wx_certificate`,`wx_certificate_pwd`) values ('1',3,1,'2016-07-29 12:23:26',NULL,NULL,NULL,NULL,NULL,'1307220701','wx4366b4b199e8d8bd','allcitygo20160419weixinrecharege','d345a479b34e61d5372281f31890b710','D:/citytsm/我的文档/条码支付/weixin/证书/微信支付证书cert/apiclient_cert.p12','1307220701');

/*Table structure for table `dp_pay_company_channel` */

DROP TABLE IF EXISTS `dp_pay_company_channel`;

CREATE TABLE `dp_pay_company_channel` (
  `cc_id` varchar(100) NOT NULL COMMENT '主键id',
  `company_id` varchar(100) NOT NULL COMMENT '卡公司id',
  `channel_id` varchar(100) NOT NULL COMMENT '支付渠道id',
  `type` int(2) NOT NULL COMMENT '支付渠道类型 1：支付宝 2：微信APP支付 3：微信公众平台支付',
  `status` int(2) NOT NULL COMMENT '状态 1：有效 0：无效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卡公司渠道关联表';

/*Data for the table `dp_pay_company_channel` */

insert  into `dp_pay_company_channel`(`cc_id`,`company_id`,`channel_id`,`type`,`status`,`create_time`) values ('1','3341f0053e1e45e18bd07b6f3ab32926','1',3,1,'2016-07-29 12:22:22');

/*Table structure for table `dp_pay_order` */

DROP TABLE IF EXISTS `dp_pay_order`;

CREATE TABLE `dp_pay_order` (
  `order_id` varchar(100) NOT NULL COMMENT '主键id',
  `trade_no` varchar(50) NOT NULL COMMENT '商户订单号',
  `transaction_id` varchar(50) DEFAULT NULL COMMENT '第三方支付交易号',
  `order_title` varchar(100) DEFAULT NULL COMMENT '订单标题',
  `order_info` varchar(200) DEFAULT NULL COMMENT '订单描述',
  `pay_type` int(10) NOT NULL COMMENT '支付类型',
  `auth_code` varchar(50) NOT NULL COMMENT '支付授权码（如用户支付宝中的“付款码”信息）',
  `total_amount` decimal(10,2) NOT NULL COMMENT '订单总金额',
  `operator_id` varchar(100) NOT NULL COMMENT '商户操作员id',
  `status` int(2) NOT NULL COMMENT '状态：0：删除(废弃、撤销) 1：交易创建，等待买家付款 2：超时关闭 3：全额退款 4：支付成功',
  `status_info` varchar(200) DEFAULT NULL COMMENT '订单状态说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付订单表';

/*Data for the table `dp_pay_order` */

insert  into `dp_pay_order`(`order_id`,`trade_no`,`transaction_id`,`order_title`,`order_info`,`pay_type`,`auth_code`,`total_amount`,`operator_id`,`status`,`status_info`,`create_time`,`update_time`) values ('021c1f1c264547759004194e6aac4141','wx_b_pay_20160801183221_2456',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 18:32:21','2016-08-01 18:32:21'),('02c05b31bab44016bbff3002d396d915','wx_b_pay_20160801171833_2479',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:18:33','2016-08-01 17:18:33'),('02d12f073da04a5280f4976d0181ad18','wx_b_pay_20160801170811_4043',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:08:11','2016-08-01 17:08:11'),('046ad8834228482f97d300b3ae4364c0','wx_b_pay_20160801182142_6817',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 18:21:42','2016-08-01 18:21:42'),('05914b6c2ecc4a3b81ffb79ee797a16d','wx_b_pay_20160801153253_8010',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:32:53','2016-08-01 15:32:53'),('07a1dbb15fae4855b0ef88519c01d1f2','wx_b_pay_20160801150523_1383',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:05:23','2016-08-01 15:05:23'),('097871842f7345eb92cf23a6a780bb77','wx_b_pay_20160801080830_9575',NULL,NULL,'4',3,'4','4.00','1',1,NULL,'2016-08-01 08:08:30','2016-08-01 08:08:30'),('0cb1a82b5a6a4a62b1e4e6f41836805e','wx_b_pay_20160802144042_6994',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 14:40:42','2016-08-02 14:40:42'),('0cc623772628480eb3da824b18a0efb8','wx_b_pay_20160801093226_6174',NULL,NULL,'1',3,'11','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 09:32:26','2016-08-01 09:32:26'),('0ded08a9604445d6915a0f074e5eba85','wx_b_pay_20160801092528_9745',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 09:25:28','2016-08-01 09:25:28'),('0eb16b9b727240a594b7f6fa86d2448d','wx_b_pay_20160802104247_1950',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:42:47','2016-08-02 10:42:47'),('130e5400d27a40c4adb860c028e018cc','wx_b_pay_20160801120611_9842',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 12:06:11','2016-08-01 12:06:11'),('15e55f9cf0f5452abfdebdaa5d3a5830','wx_b_pay_20160801140616_1430',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:06:16','2016-08-01 14:06:16'),('160c3022d72443f7935059e68df43792','wx_b_pay_20160801093256_3117',NULL,NULL,'1',3,'11','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 09:32:56','2016-08-01 09:32:56'),('16279129eda94d95bd3a45342720d5ee','wx_b_pay_20160802102049_8067',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:20:49','2016-08-02 10:20:49'),('16404002c1994399a41fcdbb13a83892','wx_b_pay_20160801111341_6983',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 11:13:41','2016-08-01 11:13:41'),('1880d9f140a34969b82263889dab7621','wx_b_pay_20160802111256_8152',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 11:12:56','2016-08-02 11:12:56'),('18f034dfa8024e478991e3af166fd415','wx_b_pay_20160801145623_1367',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:56:23','2016-08-01 14:56:23'),('1998b415ebe8448da0bc0317e64bffd3','wx_b_pay_20160801103338_7624',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 10:33:38','2016-08-01 10:33:38'),('1a484f5184fe438cb800a3082870ad69','wx_b_pay_20160801110038_2188',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 11:00:38','2016-08-01 11:00:38'),('1a5cfc03c31e4777b2e1eb2c945a3abc','wx_b_pay_20160801181322_7943',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 18:13:22','2016-08-01 18:13:22'),('1a5da60954b343b480584b111dad9bd7','wx_b_pay_20160801112907_1891',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 11:29:07','2016-08-01 11:29:07'),('1ac012b4486241cca09749c98305b2b9','wx_barcode_pay_20160729174703-1072',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 17:47:03','2016-07-29 17:47:03'),('1bfadefbfb4f4bf5a5a1e602fab70b5f','wx_b_pay_20160802103210_1351',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:32:10','2016-08-02 10:32:10'),('1ebf5f6dc79c46d0b77da6955fd7e96c','wx_b_pay_20160801145546_7917',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:55:46','2016-08-01 14:55:46'),('215abb0bf2dc4567bbda88d17d2ed5ea','wx_b_pay_20160801174413_8896',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:44:13','2016-08-01 17:44:13'),('21d702a82110454db7e8bf7d88af7900','wx_b_pay_20160801112745_8835',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 11:27:45','2016-08-01 11:27:45'),('25b290e614a7477d8d430feb32ab656d','wx_b_pay_20160801094017_8778',NULL,NULL,'3',3,'3','3.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 09:40:17','2016-08-01 09:40:17'),('2664d288b08849c7959ccccfc1e6f6da','wx_b_pay_20160802154131_5054',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 15:41:31','2016-08-02 15:41:31'),('348a3ac1ed55432baa07372c433ee105','wx_b_pay_20160802163458_1626',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 16:34:58','2016-08-02 16:34:58'),('389e09d6186d4c82bb20832dd051e456','wx_b_pay_20160802164535_4263',NULL,NULL,'5',3,'5','5.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 16:45:35','2016-08-02 16:45:35'),('3d7d45e9ef534d78a2b3e895a2bc33c9','wx_b_pay_20160801173940_2784',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:39:40','2016-08-01 17:39:40'),('3f4729b4db884235b7c8961fca5b242a','wx_b_pay_20160801112515_6612',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 11:25:15','2016-08-01 11:25:15'),('4001c73fa78d49e18a84dc9d8845c693','wx_b_pay_20160801153216_6432',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:32:16','2016-08-01 15:32:16'),('4176f4d059474db6b0d5280c6f83127a','wx_b_pay_20160801120937_9404',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 12:09:37','2016-08-01 12:09:37'),('41bf149b585340248ce92c5b7a1cd6fa','wx_b_pay_20160801140452_4724',NULL,NULL,'123455',3,'1231231231231123','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:04:52','2016-08-01 14:04:52'),('4958200581904a6c9ccbd50e6459bf68','wx_b_pay_20160801080356_9228',NULL,NULL,'1',3,'1','1.00','1',1,NULL,'2016-08-01 08:03:56','2016-08-01 08:03:56'),('4bd6c234632b4cc2b260cf552460a7b8','wx_b_pay_20160802133736_4903',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 13:37:36','2016-08-02 13:37:36'),('4dd2af87997b4498a258e3242c0705c8','wx_b_pay_20160801103454_1388',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 10:34:54','2016-08-01 10:34:54'),('4e17b3ce608844e084d674bac06e66c7','wx_b_pay_20160802151521_9236',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 15:15:21','2016-08-02 15:15:21'),('5027512b82fd4d3e92d2992213d6d556','wx_b_pay_20160802105056_1471',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:50:56','2016-08-02 10:50:56'),('50955a89bc3446119b2cffe186c51459','wx_b_pay_20160801120237_6287',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 12:02:37','2016-08-01 12:02:37'),('52f9918681b44206852f3fa22eebdc87','wx_b_pay_20160802102831_9627',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:28:31','2016-08-02 10:28:31'),('531c71a6f6a74d24a91a21cdc14f2f8c','wx_b_pay_20160802103106_8653',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:31:06','2016-08-02 10:31:06'),('53fd115f7bf844338c6c12e4921e4758','wx_b_pay_20160802154441_1039',NULL,NULL,'2',3,'2','2.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 15:44:41','2016-08-02 15:44:41'),('543d930ca6024f939d8263a465114159','wx_barcode_pay_20160729175108-2193',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 17:51:08','2016-07-29 17:51:08'),('55ce6856aef442d5b3d181705a63e646','wx_b_pay_20160801141651_6119',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:16:51','2016-08-01 14:16:51'),('579565baa8cc4fcf858b7dcfaa9f7a4b','wx_b_pay_20160801094651_5403',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 09:46:51','2016-08-01 09:46:51'),('5ddd5dee0fc142deb862821d7ee19264','wx_b_pay_20160801145251_9782',NULL,NULL,'1',3,'130075122410773646','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:52:51','2016-08-01 14:52:51'),('61316297ecf042ab82e602d474d383d2','wx_b_pay_20160801170245_7284',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:02:45','2016-08-01 17:02:45'),('61bf27d5445b4e038519a73cc380cf15','wx_barcode_pay_20160729173726-4601',NULL,NULL,'1',3,'1','1.00','1',1,NULL,'2016-07-29 17:37:26','2016-07-29 17:37:26'),('6320a6bdf588497bb7cb7996b362d683','wx_b_pay_20160801145609_3454',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:56:09','2016-08-01 14:56:09'),('64a66065979046c1b6c26ec196e2f0b6','wx_b_pay_20160802164819_7110',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,'授权码无效，提示用户刷新一维码/二维码，之后重新扫码支付\"','2016-08-02 16:48:19','2016-08-02 16:48:25'),('661b00c6a1c342ae990778ecacc3444c','wx_b_pay_20160801080709_1705',NULL,NULL,'3',3,'3','3.00','1',1,NULL,'2016-08-01 08:07:09','2016-08-01 08:07:09'),('688e9368de744ac18ea109d4133964f3','wx_b_pay_20160801180515_2146',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 18:05:15','2016-08-01 18:05:15'),('6978fd16dc5548348b9a709e5d1643bf','wx_b_pay_20160801151040_3004',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:10:40','2016-08-01 15:10:40'),('6ae69688df6b4b1dbfa0c139dbfc7d9b','wx_b_pay_20160801154634_8919',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:46:34','2016-08-01 15:46:34'),('6f6d94e450c34588aa27cb512ef874aa','wx_b_pay_20160802135941_8911',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 13:59:41','2016-08-02 13:59:41'),('6f700fa944f94371baac8a7e1ba7fdc0','wx_b_pay_20160801120944_9589',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 12:09:44','2016-08-01 12:09:44'),('705fbb550bd34aa4a3f7bbbaaf34f5ef','wx_b_pay_20160801111540_2034',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 11:15:40','2016-08-01 11:15:40'),('7112dbbd7ad645a6bf42ab4d2e8411a2','wx_b_pay_20160802134501_3455',NULL,NULL,'11',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 13:45:01','2016-08-02 13:45:01'),('72a3f5d6c9274154b515ec8b6f6f0c5a','wx_b_pay_20160729180202-2695',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 18:02:02','2016-07-29 18:02:02'),('73a72dcb14e644d6ae087ba00bc38e29','wx_b_pay_20160802154415_9682',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 15:44:15','2016-08-02 15:44:15'),('73f50a7a759b42f6a4a89d6dc6ac4ab9','wx_barcode_pay_20160729173913-4964',NULL,NULL,'1',3,'1','1.00','1',1,NULL,'2016-07-29 17:39:13','2016-07-29 17:39:13'),('756bc83bc85d4e1cb7ac54cb0ad7ca93','wx_b_pay_20160802154242_8128',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 15:42:42','2016-08-02 15:42:42'),('77e56e0a17fc44cb9a768a621f837508','wx_b_pay_20160801174133_3555',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:41:33','2016-08-01 17:41:33'),('79089c099dcd42f097b4aefe5ae79424','wx_b_pay_20160801172150_1505',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:21:50','2016-08-01 17:21:50'),('7995ae3667504616be9b1ec179486b9d','wx_b_pay_20160801154035_9959',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:40:35','2016-08-01 15:40:35'),('79d89155adab4e1487b3b5c3bded9f01','wx_barcode_pay_20160729174204-6501',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 17:42:04','2016-07-29 17:42:04'),('7aca6499acc04991ab9c6426eb74fb67','wx_b_pay_20160729181012-3919',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 18:10:12','2016-07-29 18:10:12'),('7b6bbe8d287b4cef88d12ccf4412a866','wx_b_pay_20160729175825-9565',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 17:58:25','2016-07-29 17:58:25'),('7fc4f823e8e54a74aac3424f1c7962ad','wx_b_pay_20160801111756_1589',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 11:17:56','2016-08-01 11:17:56'),('85cc2b715d75410db07727c38da0b81e','wx_b_pay_20160801163557_6054',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 16:35:57','2016-08-01 16:35:57'),('8cff338fee8d4c1bb385aee398384d75','wx_b_pay_20160801135353_3045',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 13:53:53','2016-08-01 13:53:53'),('8d3801a5765f4bfa87e75f52a9db15b4','wx_b_pay_20160729180250-6654',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 18:02:50','2016-07-29 18:02:50'),('906883aaaaa146e2bf773a8ec4834536','wx_b_pay_20160802163353_5234',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 16:33:53','2016-08-02 16:33:53'),('910ac4ba658a4b3ba37585fea5f78f6b','wx_b_pay_20160801150327_9257',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:03:27','2016-08-01 15:03:27'),('9508d9a32ec9475d8fc8f5cea753d1d6','wx_b_pay_20160802163150_8379',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 16:31:50','2016-08-02 16:31:50'),('9531b3626f5246209e4cce93ad35af47','wx_b_pay_20160802110456_2055',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 11:04:56','2016-08-02 11:04:56'),('961eec9da9684b8a9cea41afee6d2ef1','wx_b_pay_20160802163409_7529',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 16:34:09','2016-08-02 16:34:09'),('971aea886f974e46882c22a0d4551709','wx_b_pay_20160802163537_1997',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 16:35:37','2016-08-02 16:35:37'),('976d95ec2dfa471daf2e230e486aa69d','wx_b_pay_20160802103642_5711',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:36:42','2016-08-02 10:36:42'),('989919931daa4c099d9057d9af2e47f3','wx_b_pay_20160802132743_3523',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 13:27:43','2016-08-02 13:27:43'),('98f2ecb372344c89bf25c0881e0468c0','wx_b_pay_20160801165609_1110',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 16:56:09','2016-08-01 16:56:09'),('9b25e44bb3e64f66aca5756e243996fa','wx_b_pay_20160801183451_1775',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 18:34:51','2016-08-01 18:34:51'),('9c87febfd9024b6e88239ec43c5e56ce','wx_b_pay_20160802140441_3734',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 14:04:41','2016-08-02 14:04:41'),('9c90e5776dcd4a1fbc16e6c6611dce11','wx_b_pay_20160801105221_4335',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 10:52:21','2016-08-01 10:52:21'),('a28fdb6a25234d0e8e9f3af7e7fe9ff6','wx_barcode_pay_20160729173811-5362',NULL,NULL,'1',3,'1','1.00','1',1,NULL,'2016-07-29 17:38:11','2016-07-29 17:38:11'),('a3d13de0408f471caca5b6b0de81faad','wx_b_pay_20160801172749_4677',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:27:49','2016-08-01 17:27:49'),('a5f42ac30ba5423bacfd46b52e763805','wx_b_pay_20160802174347_7568',NULL,NULL,'666',3,'6','6.00','0cefb86be95646ccb5935d4db1ac556d',1,'授权码无效，提示用户刷新一维码/二维码，之后重新扫码支付','2016-08-02 17:43:47','2016-08-02 17:43:53'),('a6b392842fb74d85af5c6421aacf55cd','wx_b_pay_20160801144747_4921',NULL,NULL,'1',3,'130075122410773646','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:47:47','2016-08-01 14:47:47'),('a8204faadf0047e0a521e1cf4c51991b','wx_b_pay_20160729180546-7000',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 18:05:46','2016-07-29 18:05:46'),('a9c0f004507a493e9d776d54b52da645','wx_b_pay_20160801153305_2240',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:33:05','2016-08-01 15:33:05'),('aafe2f42587445a687c3136603a980f1','wx_b_pay_20160801142954_9198',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:29:54','2016-08-01 14:29:54'),('adde86ab80f64649b1a77df192979465','wx_b_pay_20160801170153_2495',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:01:53','2016-08-01 17:01:53'),('ae34395b06f64237a6ac1b8c8acfa456','wx_b_pay_20160801120909_4228',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 12:09:09','2016-08-01 12:09:09'),('af2b0b633bfd4a029c6378502425202f','wx_b_pay_20160801092743_7680',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 09:27:43','2016-08-01 09:27:43'),('af81b71e80324c60b38e0e181fa33712','wx_b_pay_20160801175632_6100',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:56:32','2016-08-01 17:56:32'),('b3602b34f3d24772a06caf9eb2d09c51','wx_b_pay_20160801183128_2177',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 18:31:28','2016-08-01 18:31:28'),('b3fe4e5f5d8c41e7af96bd17bf102a61','wx_b_pay_20160802132307_7706',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 13:23:07','2016-08-02 13:23:07'),('b611e93fbefb483ba6b5912bdc72173d','wx_b_pay_20160802110916_3701',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 11:09:16','2016-08-02 11:09:16'),('b6582c9cae7443ef8cc821fc476c82ee','wx_b_pay_20160802112601_2218',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 11:26:01','2016-08-02 11:26:01'),('b70fa46064f64e36827e5a4d9d9845d1','wx_b_pay_20160801174036_5723',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:40:36','2016-08-01 17:40:36'),('b80220d3b48f4dccae6996fe103455e2','wx_barcode_pay_20160729174403-9359',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 17:44:03','2016-07-29 17:44:03'),('b877636099824d98b125d7a37b3e0dde','wx_b_pay_20160801080650_9342',NULL,NULL,'3',3,'3','3.00','1',1,NULL,'2016-08-01 08:06:50','2016-08-01 08:06:50'),('b979993cb9f34d4a8811060f8328d27b','wx_b_pay_20160801174617_1787',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:46:17','2016-08-01 17:46:17'),('bc517fa2630e484fb4a936d4698237f9','wx_b_pay_20160801150405_1120',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:04:05','2016-08-01 15:04:05'),('be4d01928e2148958ba86045ce229c5c','wx_b_pay_20160802133801_2134',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 13:38:01','2016-08-02 13:38:01'),('bfd2cc58c98845b99292513b48b324ef','wx_barcode_pay_20160729175500-9744',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 17:55:00','2016-07-29 17:55:00'),('c20bf7c6d8f8435fae97a99d72ff36aa','wx_b_pay_20160802103832_8185',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:38:32','2016-08-02 10:38:32'),('c21458a25bdd4de9946bddac2f3983f3','wx_barcode_pay_20160729174847-3844',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 17:48:47','2016-07-29 17:48:47'),('c5289875c8b64e1eab78ace49d7df338','wx_b_pay_20160801104809_1386',NULL,NULL,'3',3,'3','3.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 10:48:09','2016-08-01 10:48:09'),('c786c04d2d2e4dc0be4c61b9affdd42b','wx_b_pay_20160801150900_6492',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:09:00','2016-08-01 15:09:00'),('c834356c6df04b178fc85f86ea8fb0f5','wx_b_pay_20160801150634_6528',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:06:34','2016-08-01 15:06:34'),('cc0f6569490942db8f686b9c7d4688c4','wx_b_pay_20160801093324_1809',NULL,NULL,'1',3,'11','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 09:33:24','2016-08-01 09:33:24'),('cc1ab9176cfd4ec99f93f20073f1b465','wx_b_pay_20160801080437_8429',NULL,NULL,'2',3,'2','2.00','1',1,NULL,'2016-08-01 08:04:37','2016-08-01 08:04:37'),('ce50ac8d34d14a59b48656f3c5f3676b','wx_b_pay_20160801103816_6995',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 10:38:16','2016-08-01 10:38:16'),('ceaec3eebb6d4265b1329c383d593cc3','wx_b_pay_20160801143909_6917',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:39:09','2016-08-01 14:39:09'),('d5b8fefde61a4ac8966d2e9064323db4','wx_b_pay_20160801170142_4722',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 17:01:42','2016-08-01 17:01:42'),('d81701fb470d4f648cb7f4e26e8282de','wx_b_pay_20160802151846_9037',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 15:18:46','2016-08-02 15:18:46'),('daefc935c75747a2b4182b26250cf1b6','wx_b_pay_20160801080856_2918',NULL,NULL,'5',3,'5','5.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 08:08:56','2016-08-01 08:08:56'),('db0dfcc42fd94afb981f8e8e5ead41b7','wx_b_pay_20160802111216_4340',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 11:12:16','2016-08-02 11:12:16'),('db4076c0681142dfba055e4d85cafd63','wx_b_pay_20160802164321_7217',NULL,NULL,'4',3,'4','4.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 16:43:21','2016-08-02 16:43:28'),('dbc8b648b75746d0a383e17a423d2054','wx_b_pay_20160802102453_9803',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:24:53','2016-08-02 10:24:53'),('dd47f75bb38c4eb6acaa72f7c9e9f229','wx_b_pay_20160802134643_3014',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 13:46:43','2016-08-02 13:46:43'),('e0333be96d2f48f08fbc8ff86c4a38d4','wx_b_pay_20160729180413-4720',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-07-29 18:04:13','2016-07-29 18:04:13'),('e03923b4c53a4f70b990d04d24bd3848','wx_b_pay_20160801145413_5960',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:54:13','2016-08-01 14:54:13'),('e110468c4fd54c19ac338d2744b6589c','wx_b_pay_20160801142807_5597',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 14:28:07','2016-08-01 14:28:07'),('e3204ed44a7c4137b69642b4162b9bac','wx_b_pay_20160802104440_2261',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:44:40','2016-08-02 10:44:40'),('e35cfda5b6e94e55b8ff043986caf68a','wx_b_pay_20160801144623_8785',NULL,NULL,'1',3,'1','1.00','1',1,NULL,'2016-08-01 14:46:23','2016-08-01 14:46:23'),('e35da17087c642cb9744fec4869afbc3','wx_b_pay_20160802105427_4286',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:54:27','2016-08-02 10:54:27'),('e37d6210b1ac4e5bb949bdc435880c39','wx_b_pay_20160801103158_6674',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 10:31:58','2016-08-01 10:31:58'),('e6808e6befe84c5dad097c7e89fad819','wx_b_pay_20160802103405_4353',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 10:34:05','2016-08-02 10:34:05'),('e7b9e9f46d5c419eaaa346997414df0e','wx_b_pay_20160801150246_9763',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 15:02:46','2016-08-01 15:02:46'),('e90143f5176e43f79127adf9ef594f7d','wx_b_pay_20160801115737_2690',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 11:57:37','2016-08-01 11:57:37'),('eaa4f34ae2834cde8203ebaca9d1e915','wx_b_pay_20160802151403_9771',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 15:14:03','2016-08-02 15:14:03'),('ecb1f99ae97d4147a3bada2cb52f50c8','wx_b_pay_20160801100200_9436',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 10:02:00','2016-08-01 10:02:00'),('eef20a14396649fd82086a2ebdc41ee5','wx_b_pay_20160801135818_5081',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 13:58:18','2016-08-01 13:58:18'),('ef3fb34882924b3dbfc16aa20febf5d8','wx_b_pay_20160801121158_6531',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 12:11:58','2016-08-01 12:11:58'),('f2a0a01bfb1646239738fa1a1796b7bf','wx_b_pay_20160801101152_7036',NULL,NULL,'2',3,'2','2.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 10:11:52','2016-08-01 10:11:52'),('f31c66b190e8420987a8ff62eb8b9ad1','wx_b_pay_20160801135707_5763',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 13:57:07','2016-08-01 13:57:07'),('f4857632e65c49029ac4a9535d37fb3b','wx_b_pay_20160802151656_4133',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 15:16:56','2016-08-02 15:16:56'),('f717f83117c94e08b1783999116285ef','wx_barcode_pay_20160728171308-2115','',NULL,'1',0,'1','123.00','',0,'','2016-07-28 17:13:08','2016-07-28 17:13:08'),('f8871505e6114de786f34c1d616229dc','wx_b_pay_20160802132943_8439',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 13:29:43','2016-08-02 13:29:43'),('f91f1a3fc845423497cfad24f79c47d1','wx_b_pay_20160802110747_3079',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 11:07:47','2016-08-02 11:07:47'),('fa42363c54b34416ad09fd8f9d51437c','wx_b_pay_20160802112741_2585',NULL,NULL,'2',3,'2','2.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 11:27:41','2016-08-02 11:27:41'),('fb44639108464e679f239f74ef07e1ed','wx_b_pay_20160802152435_9635',NULL,NULL,'2',3,'2','2.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 15:24:35','2016-08-02 15:24:35'),('fdc6086d5ff748628cad50172d5ffc34','wx_b_pay_20160801121020_7723',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-01 12:10:20','2016-08-01 12:10:20'),('fe325c8dcd2546d59fb4d1b8e62dc6f0','wx_b_pay_20160802140543_3709',NULL,NULL,'1',3,'1','1.00','0cefb86be95646ccb5935d4db1ac556d',1,NULL,'2016-08-02 14:05:43','2016-08-02 14:05:43');

/*Table structure for table `dp_sys_app_user` */

DROP TABLE IF EXISTS `dp_sys_app_user`;

CREATE TABLE `dp_sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dp_sys_app_user` */

insert  into `dp_sys_app_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`PHONE`,`SFID`,`START_TIME`,`END_TIME`,`YEARS`,`NUMBER`,`EMAIL`) values ('1e89e6504be349a68c025976b3ecc1d1','a1','c4ca4238a0b923820dcc509a6f75849b','会员甲','','115b386ff04f4352b060dffcd2b5d1da','','','1','121','1212','1212','2015-12-02','2015-12-25',2,'111','313596790@qq.com');

/*Table structure for table `dp_sys_createcode` */

DROP TABLE IF EXISTS `dp_sys_createcode`;

CREATE TABLE `dp_sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  `FHTYPE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dp_sys_createcode` */

insert  into `dp_sys_createcode`(`CREATECODE_ID`,`PACKAGENAME`,`OBJECTNAME`,`TABLENAME`,`FIELDLIST`,`CREATETIME`,`TITLE`,`FHTYPE`) values ('002ea762e3e242a7a10ea5ca633701d8','system','Buttonrights','sys_,fh,BUTTONRIGHTS','NAME,fh,String,fh,名称,fh,是,fh,无,fh,255Q313596790','2016-01-16 23:20:36','按钮权限','single'),('01c910b6254546e29a76e7c25f11a972','fhtest','Stest','FHTESTS_,fh,STEST','FHSJS,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0Q313596790BRITHDAY,fh,Date,fh,生日,fh,是,fh,无,fh,32,fh,0Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,11,fh,0Q313596790JINGDU,fh,Double,fh,精度,fh,是,fh,无,fh,11,fh,3Q313596790','2016-04-16 03:13:10','测试','tree'),('0ee023606efb45b9a3baaa072e502161','information','FtestMx','FH_,fh,FTESTMX','TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0Q313596790CHANGDU,fh,Integer,fh,长度,fh,是,fh,无,fh,11,fh,0Q313596790','2016-04-21 01:52:11','主表测试(明细)','sontable'),('1be959583e82473b82f6e62087bd0d38','information','Attached','TB_,fh,ATTACHED','NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790FDESCRIBE,fh,String,fh,FDESCRIBE,fh,是,fh,无,fh,255,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790','2016-04-21 17:07:59','主表测试','fathertable'),('4173a8c56a504dd6b6213d2b9cd3e91b','information','AttachedMx','TB_,fh,ATTACHEDMX','NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790TITLE,fh,String,fh,TITLE,fh,是,fh,无,fh,255,fh,0Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790','2016-04-21 17:09:40','主表测试(明细)','sontable'),('44bf0cdcca5243649b443d904893e774','barcodepay','PayCompanyChannel',',fh,PAYCOMPANYCHANNEL','COMPANY_ID,fh,String,fh,卡公司id,fh,是,fh,无,fh,100,fh,0QCHANNEL_ID,fh,String,fh,支付渠道id,fh,是,fh,无,fh,100,fh,0QSTATUS,fh,Integer,fh,状态,fh,是,fh,无,fh,2,fh,0QCREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,19,fh,0Q','2016-07-27 17:19:54','卡公司渠道关联','single'),('49cd7bf570b74ac7b7dbb14617fb6a6f','test','Test','T_TEST,fh,TEST','TEST_ID,fh,String,fh,备注1,fh,是,fh,无,fh,100,fh,0QINFO,fh,String,fh,备注2,fh,是,fh,无,fh,255,fh,0Q','2016-07-21 15:59:57','test','single'),('49d985e081ed44e6b34ba1b8c5466e39','fhdb','TimingBackUp','DB_,fh,TIMINGBACKUP','JOBNAME,fh,String,fh,任务名称,fh,否,fh,无,fh,50Q313596790CREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790TYPE,fh,Integer,fh,类型,fh,否,fh,无,fh,1Q313596790FHTIME,fh,String,fh,时间规则,fh,是,fh,无,fh,30Q313596790TIMEEXPLAIN,fh,String,fh,规则说明,fh,是,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790','2016-04-09 11:53:38','定时备份','single'),('4cde553ec4854a4e9f1ae17c2e831a0e','information','Ftest','FH_,fh,FTEST','NAME,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,11,fh,0Q313596790CHANGDU,fh,Double,fh,长度,fh,是,fh,无,fh,11,fh,2Q313596790','2016-04-21 01:41:19','主表测试','fathertable'),('5ac28e316c8d4fc8b62c0b9f7ca3eb25','fhtest','Stest','FHTESTS_,fh,STEST','FHSJS,fh,String,fh,姓名,fh,是,fh,无,fh,255,fh,0Q313596790BRITHDAY,fh,Date,fh,生日,fh,是,fh,无,fh,32,fh,0Q313596790AGE,fh,Integer,fh,年龄,fh,是,fh,无,fh,11,fh,0Q313596790JINGDU,fh,Double,fh,精度,fh,是,fh,无,fh,11,fh,3Q313596790Q','2016-07-22 16:57:16','测试','single'),('5cef8ddcabf94327a55bfff2830d58b4','barcodepay','PayChannelParam',',fh,PAYCHANNELPARAM','TYPE,fh,Integer,fh,支付渠道类型,fh,是,fh,无,fh,11,fh,0QSTATUS,fh,Integer,fh,状态,fh,否,fh,无,fh,11,fh,0QCREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,19,fh,0QALI_PID,fh,String,fh,支付宝合作者PID,fh,是,fh,无,fh,100,fh,0QALI_ACCOUNT,fh,String,fh,支付宝账号,fh,是,fh,无,fh,100,fh,0QALI_APPID,fh,String,fh,支付宝appid,fh,是,fh,无,fh,100,fh,0QALI_BUSI_PRI_KEY,fh,String,fh,支付宝商户私钥,fh,是,fh,无,fh,500,fh,0QALI_PUB_KEY,fh,String,fh,支付宝公钥,fh,是,fh,无,fh,500,fh,0QWX_BUSI_NO,fh,String,fh,微信商户id,fh,是,fh,无,fh,100,fh,0QWX_APPID,fh,String,fh,微信APP_ID,fh,是,fh,无,fh,100,fh,0QWX_BUSI_KEY,fh,String,fh,微信支付商户Key,fh,是,fh,无,fh,500,fh,0QWX_APP_SECRET,fh,String,fh,微信App_Secret,fh,是,fh,无,fh,100,fh,0QWX_CERTIFICATE,fh,String,fh,微信HTTP证书文件,fh,是,fh,无,fh,500,fh,0QWX_CERTIFICATE_PWD,fh,String,fh,微信HTTP证书文件密码,fh,是,fh,无,fh,100,fh,0Q','2016-07-28 15:21:34','支付渠道参数表','single'),('6797e00430df470cbbab4e50a0a57ddd','barcodepay','PayOrder',',fh,PAYORDER','ORDER_ID,fh,String,fh,备注1,fh,是,fh,无,fh,100,fh,0QTRADE_NO,fh,String,fh,备注2,fh,是,fh,无,fh,50,fh,0QTRANSACTION_ID,fh,String,fh,备注3,fh,是,fh,无,fh,50,fh,0QORDER_TITLE,fh,String,fh,备注4,fh,是,fh,无,fh,100,fh,0QORDER_INFO,fh,String,fh,备注5,fh,是,fh,无,fh,200,fh,0QCOMPANY_CHANNEL_ID,fh,String,fh,备注6,fh,是,fh,无,fh,100,fh,0QPAY_TYPE,fh,Integer,fh,备注7,fh,是,fh,无,fh,10,fh,0QAUTH_CODE,fh,String,fh,备注8,fh,是,fh,无,fh,50,fh,0QOPERATOR_ID,fh,String,fh,备注9,fh,是,fh,无,fh,100,fh,0QSTATUS,fh,Integer,fh,备注10,fh,是,fh,无,fh,2,fh,0QSTATUS_INFO,fh,String,fh,备注11,fh,是,fh,无,fh,200,fh,0QCREATE_TIME,fh,Date,fh,备注12,fh,是,fh,无,fh,19,fh,0QUPDATE_TIME,fh,Date,fh,备注13,fh,是,fh,无,fh,19,fh,0Q','2016-07-27 14:05:10','支付订单','single'),('703124e26fff456eaabf020df20f6d78','barcodepay','PayOrder',',fh,PAYORDER','TRADE_NO,fh,String,fh,商户订单号,fh,是,fh,无,fh,50,fh,0QTRANSACTION_ID,fh,String,fh,第三方支付交易号,fh,否,fh,无,fh,50,fh,0QORDER_TITLE,fh,String,fh,订单标题,fh,是,fh,无,fh,100,fh,0QORDER_INFO,fh,String,fh,订单描述,fh,是,fh,无,fh,200,fh,0QCOMPANY_CHANNEL_ID,fh,String,fh,卡公司渠道关联id,fh,否,fh,无,fh,100,fh,0QPAY_TYPE,fh,Integer,fh,支付类型,fh,否,fh,无,fh,10,fh,0QAUTH_CODE,fh,String,fh,支付授权码,fh,是,fh,无,fh,50,fh,0QOPERATOR_ID,fh,String,fh,操作员id,fh,否,fh,无,fh,100,fh,0QSTATUS,fh,Integer,fh,状态,fh,否,fh,无,fh,2,fh,0QSTATUS_INFO,fh,String,fh,订单状态说明,fh,否,fh,无,fh,200,fh,0QCREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,19,fh,0QUPDATE_TIME,fh,Date,fh,更新时间,fh,否,fh,无,fh,19,fh,0Q','2016-07-27 14:45:28','支付订单','single'),('761fa85c7bd244c2bb2a1f916ecab207','barcodepay','PayCompanyChannel',',fh,PAYCOMPANYCHANNEL','COMPANY_ID,fh,String,fh,卡公司id,fh,是,fh,无,fh,100,fh,0QCHANNEL_ID,fh,String,fh,支付渠道id,fh,是,fh,无,fh,100,fh,0QTYPE,fh,Integer,fh,支付渠道类型,fh,是,fh,无,fh,2,fh,0QSTATUS,fh,Integer,fh,状态,fh,否,fh,无,fh,2,fh,0QCREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,19,fh,0Q','2016-07-28 15:17:50','卡公司渠道关联表','single'),('8f46c907304642aaafa1ee765905879f','barcodepay','PayCompanyChannel',',fh,PAYCOMPANYCHANNEL','COMPANY_ID,fh,String,fh,卡公司ID,fh,是,fh,无,fh,100,fh,0QCHANNEL_ID,fh,String,fh,支付渠道ID,fh,是,fh,无,fh,100,fh,0QSTATUS,fh,Integer,fh,状态,fh,否,fh,无,fh,2,fh,0QCREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,19,fh,0Q','2016-07-28 14:52:44','卡公司渠道关联','single'),('bf35ab8b2d064bf7928a04bba5e5a6dd','system','Fhsms','SYS_,fh,FHSMS','CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790','2016-03-27 21:39:45','站内信','single'),('c7586f931fd44c61beccd3248774c68c','system','Department','SYS_,fh,DEPARTMENT','NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790','2015-12-20 01:49:25','组织机构','tree'),('c937e21208914e5b8fb1202c685bbf2f','fhdb','Fhdb','DB_,fh,FHDB','USERNAME,fh,String,fh,操作用户,fh,否,fh,无,fh,50Q313596790BACKUP_TIME,fh,Date,fh,备份时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790SQLPATH,fh,String,fh,存储位置,fh,否,fh,无,fh,300Q313596790TYPE,fh,Integer,fh,类型,fh,是,fh,无,fh,1Q313596790DBSIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10Q313596790BZ,fh,String,fh,备注,fh,否,fh,无,fh,255Q313596790','2016-03-30 13:46:54','数据库管理','single'),('e0aa7af79c454bdab46669707cc65208','test','Test','TB_,fh,TEST','INFO,fh,String,fh,info,fh,是,fh,无,fh,255,fh,0Q','2016-07-21 14:07:07','test','single'),('fe239f8742194481a5b56f90cad71520','system','Fhbutton','SYS_,fh,FHBUTTON','NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790','2016-01-15 18:38:40','按钮管理','single');

/*Table structure for table `dp_sys_dictionaries` */

DROP TABLE IF EXISTS `dp_sys_dictionaries`;

CREATE TABLE `dp_sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dp_sys_dictionaries` */

insert  into `dp_sys_dictionaries`(`DICTIONARIES_ID`,`NAME`,`NAME_EN`,`BIANMA`,`ORDER_BY`,`PARENT_ID`,`BZ`,`TBSNAME`) values ('096e4ec8986149d994b09e604504e38d','黄浦区','huangpu','0030201',1,'f1ea30ddef1340609c35c88fb2919bee','黄埔',''),('12a62a3e5bed44bba0412b7e6b733c93','北京','beijing','00301',1,'be4a8c5182c744d28282a5345783a77f','北京',''),('4eb486a523174d7e8e9bfbf21bfa67cc','1','1','1',1,'096e4ec8986149d994b09e604504e38d','1','1'),('507fa87a49104c7c8cdb52fdb297da12','宣武区','xuanwuqu','0030101',1,'12a62a3e5bed44bba0412b7e6b733c93','宣武区',''),('6988b0378c6e4a5292d2aff5a88bd12f','test2','test2','test1',222,'a8fe0f6ed1be4d47be5cbab329616a4e','222','22'),('8994f5995f474e2dba6cfbcdfe5ea07a','语文','yuwen','00201',1,'fce20eb06d7b4b4d8f200eda623f725c','语文',''),('8ea7c44af25f48b993a14f791c8d689f','分类','fenlei','001',1,'0','分类',''),('a8fe0f6ed1be4d47be5cbab329616a4e','test','test','o1',111,'0','ss','2'),('be4a8c5182c744d28282a5345783a77f','地区','diqu','003',3,'0','地区',''),('d428594b0494476aa7338d9061e23ae3','红色','red','00101',1,'8ea7c44af25f48b993a14f791c8d689f','红色',''),('de9afadfbed0428fa343704d6acce2c4','绿色','green','00102',2,'8ea7c44af25f48b993a14f791c8d689f','绿色',''),('f1ea30ddef1340609c35c88fb2919bee','上海','shanghai','00302',2,'be4a8c5182c744d28282a5345783a77f','上海',''),('fce20eb06d7b4b4d8f200eda623f725c','课程','kecheng','002',2,'0','课程','');

/*Table structure for table `dp_sys_fhbutton` */

DROP TABLE IF EXISTS `dp_sys_fhbutton`;

CREATE TABLE `dp_sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dp_sys_fhbutton` */

insert  into `dp_sys_fhbutton`(`FHBUTTON_ID`,`NAME`,`QX_NAME`,`BZ`) values ('3542adfbda73410c976e185ffe50ad06','导出EXCEL','toExcel','导出EXCEL'),('46992ea280ba4b72b29dedb0d4bc0106','发邮件','email','发送电子邮件'),('4efa162fce8340f0bd2dcd3b11d327ec','导入EXCEL','FromExcel','导入EXCEL到系统用户'),('cc51b694d5344d28a9aa13c84b7166cd','发短信','sms','发送短信'),('da7fd386de0b49ce809984f5919022b8','站内信','FHSMS','发送站内信');

/*Table structure for table `dp_sys_fhsms` */

DROP TABLE IF EXISTS `dp_sys_fhsms`;

CREATE TABLE `dp_sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dp_sys_fhsms` */

insert  into `dp_sys_fhsms`(`FHSMS_ID`,`CONTENT`,`TYPE`,`TO_USERNAME`,`FROM_USERNAME`,`SEND_TIME`,`STATUS`,`SANME_ID`) values ('05879f5868824f35932ee9f2062adc03','你好','2','admin','san','2016-01-25 14:05:31','1','b311e893228f42d5a05dbe16917fd16f'),('2635dd035c6f4bb5a091abdd784bd899','你好','2','san','admin','2016-01-25 14:05:02','2','1b7637306683460f89174c2b025862b5'),('52378ccd4e2d4fe08994d1652af87c68','你好','1','admin','san','2016-01-25 16:26:44','1','920b20dafdfb4c09b560884eb277c51d'),('77ed13f9c49a4c4bb460c41b8580dd36','gggg','2','admin','san','2016-01-24 21:22:43','2','dd9ee339576e48c5b046b94fa1901d00'),('98a6869f942042a1a037d9d9f01cb50f','你好','1','admin','san','2016-01-25 14:05:02','2','1b7637306683460f89174c2b025862b5'),('9e00295529014b6e8a27019cbccb3da1','柔柔弱弱','1','admin','san','2016-01-24 21:22:57','1','a29603d613ea4e54b5678033c1bf70a6'),('d3aedeb430f640359bff86cd657a8f59','你好','1','admin','san','2016-01-24 21:22:12','1','f022fbdce3d845aba927edb698beb90b'),('e5376b1bd54b489cb7f2203632bd74ec','管理员好','2','admin','san','2016-01-25 14:06:13','2','b347b2034faf43c79b54be4627f3bd2b'),('e613ac0fcc454f32895a70b747bf4fb5','你也好','2','admin','san','2016-01-25 16:27:54','2','ce8dc3b15afb40f28090f8b8e13f078d'),('f25e00cfafe741a3a05e3839b66dc7aa','你好','2','san','admin','2016-01-25 16:26:44','1','920b20dafdfb4c09b560884eb277c51d');

/*Table structure for table `dp_sys_menu` */

DROP TABLE IF EXISTS `dp_sys_menu`;

CREATE TABLE `dp_sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dp_sys_menu` */

insert  into `dp_sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) values (1,'系统管理','#','0','1','menu-icon fa fa-desktop blue','2',1),(2,'权限管理','#','1','1','menu-icon fa fa-lock black','1',1),(6,'信息管理','#','0','5','menu-icon fa fa-credit-card green','2',1),(7,'图片管理','#','6','1','menu-icon fa fa-folder-o pink','2',1),(8,'性能监控','druid/index.html','9','8','menu-icon fa fa-tachometer red','1',1),(9,'系统工具','#','0','3','menu-icon fa fa-cog black','2',1),(10,'接口测试','tool/interfaceTest.do','9','2','menu-icon fa fa-exchange green','1',1),(11,'发送邮件','tool/goSendEmail.do','9','3','menu-icon fa fa-envelope-o green','1',1),(12,'置二维码','tool/goTwoDimensionCode.do','9','4','menu-icon fa fa-barcode green','1',1),(14,'地图工具','tool/map.do','9','6','menu-icon fa fa-globe black','1',1),(15,'微信管理','#','0','4','menu-icon fa fa-comments purple','2',0),(16,'文本回复','textmsg/list.do','15','2','menu-icon fa fa-comment green','2',1),(17,'应用命令','command/list.do','15','4','menu-icon fa fa-comment grey','2',1),(18,'图文回复','imgmsg/list.do','15','3','menu-icon fa fa-comment pink','2',1),(19,'关注回复','textmsg/goSubscribe.do','15','1','menu-icon fa fa-comment orange','2',1),(20,'在线管理','onlinemanager/list.do','1','5','menu-icon fa fa-laptop green','1',1),(21,'打印测试','tool/printTest.do','9','7','menu-icon fa fa-hdd-o grey','1',1),(22,'一级菜单','#','0','10','menu-icon fa fa-fire orange','2',1),(23,'二级菜单','#','22','1','menu-icon fa fa-leaf black','1',1),(24,'三级菜单','#','23','1','menu-icon fa fa-leaf black','1',1),(36,'角色(基础权限)','role.do','2','1','menu-icon fa fa-key orange','1',1),(37,'按钮权限','buttonrights/list.do','2','2','menu-icon fa fa-key green','1',1),(38,'菜单管理','menu/listAllMenu.do','1','3','menu-icon fa fa-folder-open-o brown','1',1),(39,'按钮管理','fhbutton/list.do','1','2','menu-icon fa fa-download orange','1',1),(40,'用户管理','#','0','2','menu-icon fa fa-users blue','2',1),(41,'系统用户','user/listUsers.do','40','1','menu-icon fa fa-users green','1',1),(42,'会员管理','happuser/listUsers.do','40','2','menu-icon fa fa-users orange','1',1),(43,'数据字典','dictionaries/listAllDict.do?DICTIONARIES_ID=0','1','4','menu-icon fa fa-book purple','1',1),(44,'代码生成器','#','9','0','menu-icon fa fa-cogs brown','1',1),(48,'图表报表',' tool/fusionchartsdemo.do','9','5','menu-icon fa fa-bar-chart-o black','1',1),(50,'站内信','fhsms/list.do','6','3','menu-icon fa fa-envelope green','1',1),(51,'图片列表','pictures/list.do','7','1','menu-icon fa fa-folder-open-o green','1',1),(52,'图片爬虫','pictures/goImageCrawler.do','7','2','menu-icon fa fa-cloud-download green','1',1),(53,'表单构建器','tool/goFormbuilder.do','9','1','menu-icon fa fa-leaf black','1',1),(54,'数据库管理','#','0','9','menu-icon fa fa-hdd-o blue','2',1),(55,'数据库备份','brdb/listAllTable.do','54','1','menu-icon fa fa-cloud-upload blue','1',1),(56,'数据库还原','brdb/list.do','54','3','menu-icon fa fa-cloud-download blue','1',1),(57,'备份定时器','timingbackup/list.do','54','2','menu-icon fa fa-tachometer blue','1',1),(58,'SQL编辑器','sqledit/view.do','54','4','menu-icon fa fa-pencil-square-o blue','1',1),(59,'OA办公','#','0','6','menu-icon fa fa-laptop pink','1',0),(60,'组织机构','department/listAllDepartment.do?DEPARTMENT_ID=0','59','1','menu-icon fa fa-users green','1',1),(61,'反向生成','recreateCode/list.do','44','2','menu-icon fa fa-cogs blue','1',1),(62,'正向生成','createCode/list.do','44','1','menu-icon fa fa-cogs green','1',1),(63,'主附结构','attached/list.do','6','2','menu-icon fa fa-folder-open blue','1',1),(64,'test','test/list.do','22','1','menu-icon fa fa-leaf black','1',1),(65,'支付','#','0','11','menu-icon fa fa-leaf black','2',1),(66,'条码支付','payorder/list.do','65','1','menu-icon fa fa-asterisk blue','1',1);

/*Table structure for table `dp_sys_role` */

DROP TABLE IF EXISTS `dp_sys_role`;

CREATE TABLE `dp_sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dp_sys_role` */

insert  into `dp_sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) values ('1','默认组','147573143280432439238','0','1','1','1','1'),('115b386ff04f4352b060dffcd2b5d1da','一级会员','110680464442257309952','2','110680464442257309696','0','0','110680464442257309696'),('1b67fc82ce89457a8347ae53e43a347e','二级会员','110680464442257309952','2','110680464442257309696','0','0','110680464442257309696'),('2','会员组','110680464442257309952','0','0','0','0','1'),('3264c8e83d0248bb9e3ea6195b4c0216','一级管理员','147573143280432439238','1','18448178867697868742','1442490569711558','18447060664372420550','19006632918073204678'),('3341f0053e1e45e18bd07b6f3ab32926','公司1','110680464442257309696','1','110680464442257309696','110680464442257309696','110680464442257309696','110680464442257309696'),('5ca216685e684ed081314b2306737d14','公司3','110680464442257309696','1','0','0','0','0'),('68f8e4a39efe47c7bb869e9d15ab925d','二级管理员','147573143280432439238','1','18446744073713745920','0','2251798773489606','18446744073713745920'),('d3d98b5ad6b74257ac8f96d445f257c4','公司2','110680464442257309696','1','0','0','0','0'),('de9de2f006e145a29d52dfadda295353','三级管理员','147573143280432439238','1','0','0','0','0');

/*Table structure for table `dp_sys_role_fhbutton` */

DROP TABLE IF EXISTS `dp_sys_role_fhbutton`;

CREATE TABLE `dp_sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `dp_sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `dp_sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dp_sys_role_fhbutton` */

insert  into `dp_sys_role_fhbutton`(`RB_ID`,`ROLE_ID`,`BUTTON_ID`) values ('14b5c28ea6ae4508b57d2d272ab3d5f1','3264c8e83d0248bb9e3ea6195b4c0216','46992ea280ba4b72b29dedb0d4bc0106'),('1743733f366240c693c4295b527d1b0e','de9de2f006e145a29d52dfadda295353','4efa162fce8340f0bd2dcd3b11d327ec'),('3768e60edd1c4b5c9f1dd861188ae2f9','3264c8e83d0248bb9e3ea6195b4c0216','cc51b694d5344d28a9aa13c84b7166cd'),('8231c216fb514b4188e4162e629c6237','3264c8e83d0248bb9e3ea6195b4c0216','4efa162fce8340f0bd2dcd3b11d327ec'),('9412d1d05162464c83658c7f89ab03f0','68f8e4a39efe47c7bb869e9d15ab925d','3542adfbda73410c976e185ffe50ad06'),('96567633dd3548c9b75d28f430adf5a3','3264c8e83d0248bb9e3ea6195b4c0216','da7fd386de0b49ce809984f5919022b8'),('a1478f27c852459fa9cad04b642f4fb7','de9de2f006e145a29d52dfadda295353','3542adfbda73410c976e185ffe50ad06'),('ba6696b8761044618e44c7e02c9ba89e','68f8e4a39efe47c7bb869e9d15ab925d','cc51b694d5344d28a9aa13c84b7166cd'),('f0329033d0914faf8ea6e9ff252cc5e6','68f8e4a39efe47c7bb869e9d15ab925d','46992ea280ba4b72b29dedb0d4bc0106'),('f627982cc9d4479dbc03af726dc6ac58','de9de2f006e145a29d52dfadda295353','cc51b694d5344d28a9aa13c84b7166cd'),('f8752772862b4b81aa55a0466edf33ac','3264c8e83d0248bb9e3ea6195b4c0216','3542adfbda73410c976e185ffe50ad06');

/*Table structure for table `dp_sys_user` */

DROP TABLE IF EXISTS `dp_sys_user`;

CREATE TABLE `dp_sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dp_sys_user` */

insert  into `dp_sys_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) values ('0cefb86be95646ccb5935d4db1ac556d','a1','cc3282bafa1ffcbc63c7edf850067c98e28fedb3','a','','3341f0053e1e45e18bd07b6f3ab32926','2016-08-02 15:24:05','127.0.0.1','0','a','default','a@a.com','002','12345678900'),('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','admin','1133671055321055258374707980945218933803269864762743594642571294','1','2016-08-03 09:04:24','127.0.0.1','0','admin','default','a@a.com','001','18788888888'),('69177258a06e4927b4639ab1684c3320','san','47c4a8dc64ac2f0bb46bbd8813b037c9718f9349','三','','3264c8e83d0248bb9e3ea6195b4c0216','2016-04-21 17:53:06','127.0.0.1','0','111','default','978336446@qq.com','333','13562202556'),('70e42b5cc3e44c5b932bb9bbbd3c9665','wanwu','de3086b90b17fbeb5e108a3408e8f993c3d50c15','王五','','de9de2f006e145a29d52dfadda295353','2016-07-25 09:47:34','127.0.0.1','0','test','default','a@a.com','1103','12345678910'),('9991f4d7782a4ccfb8a65bd96ea7aafa','lisi','2612ade71c1e48cd7150b5f4df152faa699cedfe','李四','','3264c8e83d0248bb9e3ea6195b4c0216','2016-03-21 17:41:57','127.0.0.1','0','小李','default','313596790@qq.com','1102','13566233663'),('e29149962e944589bb7da23ad18ddeed','zhangsan','c2da1419caf053885c492e10ebde421581cdc03f','张三','','3264c8e83d0248bb9e3ea6195b4c0216','','','0','小张','default','zhangsan@www.com','1101','2147483647');

/*Table structure for table `oa_department` */

DROP TABLE IF EXISTS `oa_department`;

CREATE TABLE `oa_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oa_department` */

insert  into `oa_department`(`DEPARTMENT_ID`,`NAME`,`NAME_EN`,`BIANMA`,`PARENT_ID`,`BZ`,`HEADMAN`,`TEL`,`FUNCTIONS`,`ADDRESS`) values ('0956d8c279274fca92f4091f2a69a9ad','销售会计','xiaokuai','05896','d41af567914a409893d011aa53eda797','','','','',''),('3e7227e11dc14b4d9e863dd1a1fcedf6','成本会计','chengb','03656','d41af567914a409893d011aa53eda797','','','','',''),('5cccdb7c432449d8b853c52880058140','B公司','b','002','0','冶铁','李四','112','冶铁','河北'),('83a25761c618457cae2fa1211bd8696d','销售B组','xiaob','002365','cbbc84eddde947ba8af7d509e430eb70','','李四','','',''),('8f8b045470f342fdbc4c312ab881d62b','销售A组','xiaoA','0326','cbbc84eddde947ba8af7d509e430eb70','','张三','0201212','',''),('a0982dea52554225ab682cd4b421de47','1队','yidui','02563','8f8b045470f342fdbc4c312ab881d62b','','小王','12356989','',''),('a6c6695217ba4a4dbfe9f7e9d2c06730','A公司','a','001','0','挖煤','张三','110','洼煤矿','山西'),('cbbc84eddde947ba8af7d509e430eb70','销售部','xiaoshoubu','00201','5cccdb7c432449d8b853c52880058140','推销商品','小明','11236','推销商品','909办公室'),('d41af567914a409893d011aa53eda797','财务部','caiwubu','00101','a6c6695217ba4a4dbfe9f7e9d2c06730','负责发工资','王武','11236','管理财务','308办公室');

/*Table structure for table `tb_attached` */

DROP TABLE IF EXISTS `tb_attached`;

CREATE TABLE `tb_attached` (
  `ATTACHED_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) DEFAULT NULL COMMENT '描述',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '价格',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_attached` */

insert  into `tb_attached`(`ATTACHED_ID`,`NAME`,`FDESCRIBE`,`PRICE`,`CTIME`) values ('d74b6f507e784607b8f85e31e3cfad22','AA','aaa',222.00,'2016-04-17 18:20:41');

/*Table structure for table `tb_attachedmx` */

DROP TABLE IF EXISTS `tb_attachedmx`;

CREATE TABLE `tb_attachedmx` (
  `ATTACHEDMX_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ATTACHED_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTACHEDMX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_attachedmx` */

insert  into `tb_attachedmx`(`ATTACHEDMX_ID`,`NAME`,`TITLE`,`CTIME`,`PRICE`,`ATTACHED_ID`) values ('04717d1a034c4e51aacd5e062a4c63bd','ddd','ddd','2016-03-29',111.00,'d74b6f507e784607b8f85e31e3cfad22'),('f7ac797407be4a76a7125d41fe345112','rgt','gdf','2016-03-30',3423.00,'d74b6f507e784607b8f85e31e3cfad22');

/*Table structure for table `tb_pictures` */

DROP TABLE IF EXISTS `tb_pictures`;

CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_pictures` */

/*Table structure for table `tb_test` */

DROP TABLE IF EXISTS `tb_test`;

CREATE TABLE `tb_test` (
  `TEST_ID` varchar(100) NOT NULL,
  `INFO` varchar(255) DEFAULT NULL COMMENT 'info',
  PRIMARY KEY (`TEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_test` */

insert  into `tb_test`(`TEST_ID`,`INFO`) values ('344aadcb711847faab24cca5cc155e79','Hello world!!!!!!!'),('5ca1c295af6e40e395162dd2f638f4ae','2'),('ad4a45b5ebf5401e920271dab1a5ff49','my honor');

/*Table structure for table `weixin_command` */

DROP TABLE IF EXISTS `weixin_command`;

CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `weixin_command` */

insert  into `weixin_command`(`COMMAND_ID`,`KEYWORD`,`COMMANDCODE`,`CREATETIME`,`STATUS`,`BZ`) values ('2636750f6978451b8330874c9be042c2','锁定服务器','rundll32.exe user32.dll,LockWorkStation','2015-05-10 21:25:06',1,'锁定计算机'),('46217c6d44354010823241ef484f7214','打开浏览器','C:/Program Files/Internet Explorer/iexplore.exe','2015-05-09 02:43:02',1,'打开浏览器操作'),('576adcecce504bf3bb34c6b4da79a177','关闭浏览器','taskkill /f /im iexplore.exe','2015-05-09 02:36:48',2,'关闭浏览器操作'),('854a157c6d99499493f4cc303674c01f','关闭QQ','taskkill /f /im qq.exe','2015-05-10 21:25:46',1,'关闭QQ'),('ab3a8c6310ca4dc8b803ecc547e55ae7','打开QQ','D:/SOFT/QQ/QQ/Bin/qq.exe','2015-05-10 21:25:25',1,'打开QQ');

/*Table structure for table `weixin_imgmsg` */

DROP TABLE IF EXISTS `weixin_imgmsg`;

CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `weixin_imgmsg` */

insert  into `weixin_imgmsg`(`IMGMSG_ID`,`KEYWORD`,`CREATETIME`,`STATUS`,`BZ`,`TITLE1`,`DESCRIPTION1`,`IMGURL1`,`TOURL1`,`TITLE2`,`DESCRIPTION2`,`IMGURL2`,`TOURL2`,`TITLE3`,`DESCRIPTION3`,`IMGURL3`,`TOURL3`,`TITLE4`,`DESCRIPTION4`,`IMGURL4`,`TOURL4`,`TITLE5`,`DESCRIPTION5`,`IMGURL5`,`TOURL5`,`TITLE6`,`DESCRIPTION6`,`IMGURL6`,`TOURL6`,`TITLE7`,`DESCRIPTION7`,`IMGURL7`,`TOURL7`,`TITLE8`,`DESCRIPTION8`,`IMGURL8`,`TOURL8`) values ('380b2cb1f4954315b0e20618f7b5bd8f','首页','2015-05-10 20:51:09',1,'图文回复','图文回复标题','图文回复描述','http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg','www.baidu.com','','','','','','','','','','','','','','','','','','','','','','','','','','','','');

/*Table structure for table `weixin_textmsg` */

DROP TABLE IF EXISTS `weixin_textmsg`;

CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `weixin_textmsg` */

insert  into `weixin_textmsg`(`TEXTMSG_ID`,`KEYWORD`,`CONTENT`,`CREATETIME`,`STATUS`,`BZ`) values ('695cd74779734231928a253107ab0eeb','吃饭','吃了噢噢噢噢','2015-05-10 22:52:27',1,'文本回复'),('d4738af7aea74a6ca1a5fb25a98f9acb','关注','这里是关注后回复的内容','2015-05-11 02:12:36',1,'关注回复');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
