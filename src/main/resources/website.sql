-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: website
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `website`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `website` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `website`;

--
-- Table structure for table `e_dict`
--

DROP TABLE IF EXISTS `e_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_dict` (
                          `id` bigint(20) NOT NULL AUTO_INCREMENT,
                          `create_by` varchar(255) DEFAULT NULL,
                          `create_time` datetime DEFAULT NULL,
                          `update_by` varchar(255) DEFAULT NULL,
                          `update_time` datetime DEFAULT NULL,
                          `code` varchar(255) DEFAULT NULL,
                          `name` varchar(255) DEFAULT NULL,
                          `remark` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `UKf5wwh5osfukkeebw7h2yb4kmp` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_dict`
--

LOCK TABLES `e_dict` WRITE;
/*!40000 ALTER TABLE `e_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_dict_item`
--

DROP TABLE IF EXISTS `e_dict_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_dict_item` (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT,
                               `create_by` varchar(255) DEFAULT NULL,
                               `create_time` datetime DEFAULT NULL,
                               `update_by` varchar(255) DEFAULT NULL,
                               `update_time` datetime DEFAULT NULL,
                               `code` varchar(255) DEFAULT NULL,
                               `name` varchar(255) DEFAULT NULL,
                               `remark` varchar(255) DEFAULT NULL,
                               `sort` int(11) DEFAULT NULL,
                               `erupt_dict_id` bigint(20) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `UKl0kiq8otpn3fvtlvarebt8xkh` (`code`,`erupt_dict_id`),
                               KEY `FKrrbi2dt94rjd8sjt830m3w0a` (`erupt_dict_id`),
                               CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_dict_item`
--

LOCK TABLES `e_dict_item` WRITE;
/*!40000 ALTER TABLE `e_dict_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_dict_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_login_log`
--

DROP TABLE IF EXISTS `e_upms_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_login_log` (
                                    `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                    `browser` varchar(255) DEFAULT NULL,
                                    `device_type` varchar(255) DEFAULT NULL,
                                    `ip` varchar(255) DEFAULT NULL,
                                    `login_time` datetime DEFAULT NULL,
                                    `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                    `system_name` varchar(255) DEFAULT NULL,
                                    `token` varchar(255) DEFAULT NULL,
                                    `user_name` varchar(255) DEFAULT NULL,
                                    `region` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_login_log`
--

LOCK TABLES `e_upms_login_log` WRITE;
/*!40000 ALTER TABLE `e_upms_login_log` DISABLE KEYS */;
INSERT INTO `e_upms_login_log` VALUES (1,'Chrome 10 103','Computer','192.168.10.233','2022-07-12 18:54:44',NULL,'Mac OS X','ROIZXzsM7Cnnkf75','erupt','0|0|0|内网IP|内网IP');
/*!40000 ALTER TABLE `e_upms_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_menu`
--

DROP TABLE IF EXISTS `e_upms_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_menu` (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT,
                               `create_by` varchar(255) DEFAULT NULL,
                               `create_time` datetime DEFAULT NULL,
                               `update_by` varchar(255) DEFAULT NULL,
                               `update_time` datetime DEFAULT NULL,
                               `code` varchar(255) DEFAULT NULL,
                               `icon` varchar(255) DEFAULT NULL,
                               `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                               `param` varchar(2000) DEFAULT NULL,
                               `sort` int(11) DEFAULT NULL,
                               `status` int(11) DEFAULT NULL,
                               `type` varchar(255) DEFAULT NULL,
                               `value` varchar(255) DEFAULT NULL,
                               `parent_menu_id` bigint(20) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `UK95xpkppt33d2bka0g2d7rgwqt` (`code`),
                               KEY `FK5mkgea183mm02v7ic1pdwxy5s` (`parent_menu_id`),
                               CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_menu`
--

LOCK TABLES `e_upms_menu` WRITE;
/*!40000 ALTER TABLE `e_upms_menu` DISABLE KEYS */;
INSERT INTO `e_upms_menu` VALUES (1,NULL,'2022-07-11 20:41:07',NULL,NULL,'magic-api',NULL,'接口配置',NULL,50,1,'tpl','magic-api.ftl',NULL),(2,NULL,'2022-07-11 20:41:07',NULL,NULL,'magic-api-function',NULL,'函数',NULL,10,1,'button','ERUPT_MAGIC_FUNCTION',1),(3,NULL,'2022-07-11 20:41:07',NULL,NULL,'magic-api-datasource',NULL,'数据源',NULL,20,1,'button','ERUPT_MAGIC_DATASOURCE',1),(4,NULL,'2022-07-11 20:41:07',NULL,NULL,'magic-api-save',NULL,'保存',NULL,30,1,'button','ERUPT_MAGIC_SAVE',1),(5,NULL,'2022-07-11 20:41:07',NULL,NULL,'magic-api-view',NULL,'查看',NULL,40,1,'button','ERUPT_MAGIC_VIEW',1),(6,NULL,'2022-07-11 20:41:08',NULL,NULL,'magic-api-delete',NULL,'删除',NULL,50,1,'button','ERUPT_MAGIC_DELETE',1),(7,NULL,'2022-07-11 20:41:08',NULL,NULL,'magic-api-download',NULL,'导出',NULL,60,1,'button','ERUPT_MAGIC_DOWNLOAD',1),(8,NULL,'2022-07-11 20:41:08',NULL,NULL,'magic-api-upload',NULL,'上传',NULL,70,1,'button','ERUPT_MAGIC_UPLOAD',1),(9,NULL,'2022-07-11 20:41:08',NULL,NULL,'magic-api-push',NULL,'远程推送',NULL,80,1,'button','ERUPT_MAGIC_PUSH',1),(10,NULL,'2022-07-11 20:41:08',NULL,NULL,'magic-api-lock',NULL,'锁定',NULL,90,1,'button','ERUPT_MAGIC_LOCK',1),(11,NULL,'2022-07-11 20:41:08',NULL,NULL,'magic-api-unlock',NULL,'解锁',NULL,100,1,'button','ERUPT_MAGIC_UNLOCK',1),(12,NULL,'2022-07-11 20:41:08',NULL,NULL,'$manager','fa fa-cogs','系统管理',NULL,1,1,NULL,NULL,NULL),(13,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptMenu','','菜单管理',NULL,0,1,'tree','EruptMenu',12),(14,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptMenu@ADD',NULL,'新增',NULL,10,1,'button','EruptMenu@ADD',13),(15,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptMenu@EDIT',NULL,'修改',NULL,20,1,'button','EruptMenu@EDIT',13),(16,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptMenu@DELETE',NULL,'删除',NULL,30,1,'button','EruptMenu@DELETE',13),(17,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptMenu@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptMenu@VIEW_DETAIL',13),(18,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptRole','','角色管理',NULL,10,1,'table','EruptRole',12),(19,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptRole@ADD',NULL,'新增',NULL,10,1,'button','EruptRole@ADD',18),(20,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptRole@EDIT',NULL,'修改',NULL,20,1,'button','EruptRole@EDIT',18),(21,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptRole@DELETE',NULL,'删除',NULL,30,1,'button','EruptRole@DELETE',18),(22,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptRole@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptRole@VIEW_DETAIL',18),(23,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptOrg','','组织维护',NULL,20,1,'tree','EruptOrg',12),(24,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptOrg@ADD',NULL,'新增',NULL,10,1,'button','EruptOrg@ADD',23),(25,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptOrg@EDIT',NULL,'修改',NULL,20,1,'button','EruptOrg@EDIT',23),(26,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptOrg@DELETE',NULL,'删除',NULL,30,1,'button','EruptOrg@DELETE',23),(27,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptOrg@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptOrg@VIEW_DETAIL',23),(28,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptPost','','岗位维护',NULL,30,1,'tree','EruptPost',12),(29,NULL,'2022-07-11 20:41:08',NULL,NULL,'EruptPost@ADD',NULL,'新增',NULL,10,1,'button','EruptPost@ADD',28),(30,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptPost@EDIT',NULL,'修改',NULL,20,1,'button','EruptPost@EDIT',28),(31,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptPost@DELETE',NULL,'删除',NULL,30,1,'button','EruptPost@DELETE',28),(32,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptPost@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptPost@VIEW_DETAIL',28),(33,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptUser','','用户配置',NULL,40,1,'table','EruptUser',12),(34,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptUser@ADD',NULL,'新增',NULL,10,1,'button','EruptUser@ADD',33),(35,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptUser@EDIT',NULL,'修改',NULL,20,1,'button','EruptUser@EDIT',33),(36,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptUser@DELETE',NULL,'删除',NULL,30,1,'button','EruptUser@DELETE',33),(37,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptUser@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptUser@VIEW_DETAIL',33),(38,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDict','','数据字典',NULL,50,1,'table','EruptDict',12),(39,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDict@ADD',NULL,'新增',NULL,10,1,'button','EruptDict@ADD',38),(40,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDict@EDIT',NULL,'修改',NULL,20,1,'button','EruptDict@EDIT',38),(41,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDict@DELETE',NULL,'删除',NULL,30,1,'button','EruptDict@DELETE',38),(42,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDict@EXPORT',NULL,'导出',NULL,40,1,'button','EruptDict@EXPORT',38),(43,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDict@VIEW_DETAIL',NULL,'详情',NULL,50,1,'button','EruptDict@VIEW_DETAIL',38),(44,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDictItem','','字典项',NULL,60,2,'table','EruptDictItem',12),(45,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDictItem@ADD',NULL,'新增',NULL,10,1,'button','EruptDictItem@ADD',44),(46,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDictItem@EDIT',NULL,'修改',NULL,20,1,'button','EruptDictItem@EDIT',44),(47,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDictItem@DELETE',NULL,'删除',NULL,30,1,'button','EruptDictItem@DELETE',44),(48,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDictItem@EXPORT',NULL,'导出',NULL,40,1,'button','EruptDictItem@EXPORT',44),(49,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptDictItem@VIEW_DETAIL',NULL,'详情',NULL,50,1,'button','EruptDictItem@VIEW_DETAIL',44),(50,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptOnline','','在线用户',NULL,65,1,'table','EruptOnline',12),(51,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptOnline@EXPORT',NULL,'导出',NULL,10,1,'button','EruptOnline@EXPORT',50),(52,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptLoginLog','','登录日志',NULL,70,1,'table','EruptLoginLog',12),(53,NULL,'2022-07-11 20:41:09',NULL,NULL,'EruptLoginLog@EXPORT',NULL,'导出',NULL,10,1,'button','EruptLoginLog@EXPORT',52),(54,NULL,'2022-07-11 20:41:10',NULL,NULL,'EruptOperateLog','','操作日志',NULL,80,1,'table','EruptOperateLog',12);
/*!40000 ALTER TABLE `e_upms_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_operate_log`
--

DROP TABLE IF EXISTS `e_upms_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_operate_log` (
                                      `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                      `api_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                      `create_time` datetime DEFAULT NULL,
                                      `error_info` longtext,
                                      `ip` varchar(255) DEFAULT NULL,
                                      `operate_user` varchar(255) DEFAULT NULL,
                                      `region` varchar(255) DEFAULT NULL,
                                      `req_addr` varchar(4000) DEFAULT NULL,
                                      `req_method` varchar(255) DEFAULT NULL,
                                      `req_param` varchar(4000) DEFAULT NULL,
                                      `status` bit(1) DEFAULT NULL,
                                      `total_time` bigint(20) DEFAULT NULL,
                                      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_operate_log`
--

LOCK TABLES `e_upms_operate_log` WRITE;
/*!40000 ALTER TABLE `e_upms_operate_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_org`
--

DROP TABLE IF EXISTS `e_upms_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_org` (
                              `id` bigint(20) NOT NULL AUTO_INCREMENT,
                              `code` varchar(255) DEFAULT NULL,
                              `name` varchar(255) DEFAULT NULL,
                              `sort` int(11) DEFAULT NULL,
                              `parent_org_id` bigint(20) DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `UKc2wj35ujq2m84uw59dx6wy3gj` (`code`),
                              KEY `FKtj7222kjnkt7pv9kfn9g8ck4h` (`parent_org_id`),
                              CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_org`
--

LOCK TABLES `e_upms_org` WRITE;
/*!40000 ALTER TABLE `e_upms_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_post`
--

DROP TABLE IF EXISTS `e_upms_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_post` (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT,
                               `code` varchar(255) DEFAULT NULL,
                               `name` varchar(255) DEFAULT NULL,
                               `weight` int(11) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `UKltq5h3n5cyyk5nxtjhg9lhidg` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_post`
--

LOCK TABLES `e_upms_post` WRITE;
/*!40000 ALTER TABLE `e_upms_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_role`
--

DROP TABLE IF EXISTS `e_upms_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_role` (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT,
                               `create_time` datetime DEFAULT NULL,
                               `update_time` datetime DEFAULT NULL,
                               `code` varchar(255) DEFAULT NULL,
                               `name` varchar(255) DEFAULT NULL,
                               `sort` int(11) DEFAULT NULL,
                               `status` bit(1) DEFAULT NULL,
                               `create_user_id` bigint(20) DEFAULT NULL,
                               `update_user_id` bigint(20) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `UKjgxkp7mr4183tcwosrbqpsl3a` (`code`),
                               KEY `FKad39xpgtpmhq0fp5newnabv1g` (`create_user_id`),
                               KEY `FKbghup2p4f1x9eokeygyg8p658` (`update_user_id`),
                               CONSTRAINT `FKad39xpgtpmhq0fp5newnabv1g` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
                               CONSTRAINT `FKbghup2p4f1x9eokeygyg8p658` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_role`
--

LOCK TABLES `e_upms_role` WRITE;
/*!40000 ALTER TABLE `e_upms_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_role_menu`
--

DROP TABLE IF EXISTS `e_upms_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_role_menu` (
                                    `role_id` bigint(20) NOT NULL,
                                    `menu_id` bigint(20) NOT NULL,
                                    PRIMARY KEY (`role_id`,`menu_id`),
                                    KEY `FKr6bl403chgwjnb6jk0uqqd9x8` (`menu_id`),
                                    CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`),
                                    CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_role_menu`
--

LOCK TABLES `e_upms_role_menu` WRITE;
/*!40000 ALTER TABLE `e_upms_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_user`
--

DROP TABLE IF EXISTS `e_upms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_user` (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT,
                               `name` varchar(255) DEFAULT NULL,
                               `account` varchar(255) DEFAULT NULL,
                               `is_admin` bit(1) DEFAULT NULL,
                               `status` bit(1) DEFAULT NULL,
                               `create_time` datetime DEFAULT NULL,
                               `update_time` datetime DEFAULT NULL,
                               `email` varchar(255) DEFAULT NULL,
                               `is_md5` bit(1) DEFAULT NULL,
                               `password` varchar(255) DEFAULT NULL,
                               `phone` varchar(255) DEFAULT NULL,
                               `remark` varchar(2000) DEFAULT NULL,
                               `reset_pwd_time` datetime DEFAULT NULL,
                               `white_ip` varchar(2000) DEFAULT NULL,
                               `erupt_org_id` bigint(20) DEFAULT NULL,
                               `erupt_post_id` bigint(20) DEFAULT NULL,
                               `create_user_id` bigint(20) DEFAULT NULL,
                               `update_user_id` bigint(20) DEFAULT NULL,
                               `erupt_menu_id` bigint(20) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `UK812t22yn0295dkkvx5gjgahax` (`account`),
                               KEY `FK1re8jv3614mkk2wfxscvgvmnm` (`erupt_org_id`),
                               KEY `FK53cice19aydjcuykpv847ocdv` (`erupt_post_id`),
                               KEY `FKdvwfw4x66ahh1tavd69cnx4i0` (`create_user_id`),
                               KEY `FKct3f9stm4eti10401f7rbh5ey` (`update_user_id`),
                               KEY `FKga0jd7sahnn1tv14mq4dy5kba` (`erupt_menu_id`),
                               CONSTRAINT `FK1re8jv3614mkk2wfxscvgvmnm` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`),
                               CONSTRAINT `FK53cice19aydjcuykpv847ocdv` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`),
                               CONSTRAINT `FKct3f9stm4eti10401f7rbh5ey` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`),
                               CONSTRAINT `FKdvwfw4x66ahh1tavd69cnx4i0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
                               CONSTRAINT `FKga0jd7sahnn1tv14mq4dy5kba` FOREIGN KEY (`erupt_menu_id`) REFERENCES `e_upms_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_user`
--

LOCK TABLES `e_upms_user` WRITE;
/*!40000 ALTER TABLE `e_upms_user` DISABLE KEYS */;
INSERT INTO `e_upms_user` VALUES (1,'erupt','erupt',_binary '',_binary '','2022-07-11 20:41:10',NULL,NULL,_binary '','610d44f73b7709169e8e06ca4ac5af8e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `e_upms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_user_role`
--

DROP TABLE IF EXISTS `e_upms_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_user_role` (
                                    `user_id` bigint(20) NOT NULL,
                                    `role_id` bigint(20) NOT NULL,
                                    PRIMARY KEY (`role_id`,`user_id`),
                                    KEY `FKes2ylim5w3ej690ss84sb956x` (`user_id`),
                                    CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`),
                                    CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_user_role`
--

LOCK TABLES `e_upms_user_role` WRITE;
/*!40000 ALTER TABLE `e_upms_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-12 11:17:22
