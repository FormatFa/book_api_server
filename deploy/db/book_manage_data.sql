CREATE DATABASE  IF NOT EXISTS `ry` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ry`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: ry
-- ------------------------------------------------------
-- Server version	5.7.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.ruoyi.quartz.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0\'com.ruoyi.common.core.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0{)Q�Hxpt\0\0pppt\01t\00/10 * * * * ?t\0ryTask.ryNoParamst\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（无参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.ruoyi.quartz.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0\'com.ruoyi.common.core.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0{)Q�Hxpt\0\0pppt\01t\00/15 * * * * ?t\0ryTask.ryParams(\'ry\')t\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（有参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.ruoyi.quartz.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0\'com.ruoyi.common.core.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0{)Q�Hxpt\0\0pppt\01t\00/20 * * * * ?t\08ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)t\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（多参）t\03t\01x\0');
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler','STATE_ACCESS'),('RuoyiScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler','gg-X441UVK1633661034694',1633662736135,15000);
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1633661040000,-1,5,'PAUSED','CRON',1633661035000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1633661040000,-1,5,'PAUSED','CRON',1633661036000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1633661040000,-1,5,'PAUSED','CRON',1633661036000,0,NULL,2,'');
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'sys_job_log','定时任务调度日志表',NULL,NULL,'SysJobLog','crud','com.ruoyi.system','system','log','定时任务调度日志','ruoyi','0','/',NULL,'admin','2021-09-11 12:49:33','',NULL,NULL),(2,'sys_user_post','用户与岗位关联表',NULL,NULL,'SysUserPost','crud','com.ruoyi.system','system','post','用户与岗位关联','ruoyi','0','/',NULL,'admin','2021-10-03 03:05:05','',NULL,NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,'1','job_log_id','任务日志ID','bigint(20)','Long','jobLogId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-09-11 12:49:34','',NULL),(2,'1','job_name','任务名称','varchar(64)','String','jobName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2021-09-11 12:49:34','',NULL),(3,'1','job_group','任务组名','varchar(64)','String','jobGroup','0','0','1','1','1','1','1','EQ','input','',3,'admin','2021-09-11 12:49:34','',NULL),(4,'1','invoke_target','调用目标字符串','varchar(500)','String','invokeTarget','0','0','1','1','1','1','1','EQ','textarea','',4,'admin','2021-09-11 12:49:34','',NULL),(5,'1','job_message','日志信息','varchar(500)','String','jobMessage','0','0',NULL,'1','1','1','1','EQ','textarea','',5,'admin','2021-09-11 12:49:34','',NULL),(6,'1','status','执行状态（0正常 1失败）','char(1)','String','status','0','0',NULL,'1','1','1','1','EQ','radio','',6,'admin','2021-09-11 12:49:34','',NULL),(7,'1','exception_info','异常信息','varchar(2000)','String','exceptionInfo','0','0',NULL,'1','1','1','1','EQ','textarea','',7,'admin','2021-09-11 12:49:34','',NULL),(8,'1','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2021-09-11 12:49:34','',NULL),(9,'2','user_id','用户ID','bigint(20)','Long','userId','1','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-10-03 03:05:06','',NULL),(10,'2','post_id','岗位ID','bigint(20)','Long','postId','1','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',2,'admin','2021-10-03 03:05:06','',NULL);
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2021-08-09 13:10:20','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2021-08-09 13:10:20','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2021-08-09 13:10:20','',NULL,'深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue'),(4,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2021-08-09 13:10:20','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(5,'用户管理-密码字符范围','sys.account.chrtype','0','Y','admin','2021-08-09 13:10:20','',NULL,'默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）'),(6,'用户管理-初始密码修改策略','sys.account.initPasswordModify','0','Y','admin','2021-08-09 13:10:20','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),(7,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2021-08-09 13:10:20','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框'),(8,'主框架页-菜单导航显示风格','sys.index.menuStyle','default','Y','admin','2021-08-09 13:10:20','',NULL,'菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）'),(9,'主框架页-是否开启页脚','sys.index.ignoreFooter','true','Y','admin','2021-08-09 13:10:20','',NULL,'是否开启底部页脚显示（true显示，false隐藏）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2021-08-09 13:10:02','',NULL),(101,100,'0,100','编辑部',1,'若依','15888888888','ry@qq.com','0','0','admin','2021-08-09 13:10:02','admin','2021-10-03 03:10:38'),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2021-08-09 13:10:02','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2021-08-09 13:10:02','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2021-08-09 13:10:02','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2021-08-09 13:10:02','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2021-08-09 13:10:02','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2021-08-09 13:10:02','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2021-08-09 13:10:02','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2021-08-09 13:10:02','',NULL),(110,101,'0,100,101','fdsf',1,NULL,NULL,NULL,'0','2','admin','2021-09-11 10:06:37','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男1','0','sys_user_sex','','','Y','0','admin','2021-08-09 13:10:16','admin','2021-10-03 02:52:01','性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2021-08-09 13:10:17','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2021-08-09 13:10:17','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2021-08-09 13:10:17','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2021-08-09 13:10:17','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2021-08-09 13:10:17','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2021-08-09 13:10:17','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2021-08-09 13:10:17','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2021-08-09 13:10:17','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2021-08-09 13:10:17','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2021-08-09 13:10:17','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2021-08-09 13:10:17','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2021-08-09 13:10:17','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2021-08-09 13:10:18','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2021-08-09 13:10:18','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2021-08-09 13:10:18','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2021-08-09 13:10:18','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2021-08-09 13:10:18','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2021-08-09 13:10:18','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2021-08-09 13:10:18','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2021-08-09 13:10:18','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2021-08-09 13:10:18','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2021-08-09 13:10:19','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2021-08-09 13:10:19','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2021-08-09 13:10:19','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2021-08-09 13:10:19','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2021-08-09 13:10:19','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2021-08-09 13:10:19','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2021-08-09 13:10:19','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2021-08-09 13:10:15','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2021-08-09 13:10:15','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2021-08-09 13:10:15','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2021-08-09 13:10:15','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2021-08-09 13:10:16','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2021-08-09 13:10:16','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2021-08-09 13:10:16','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2021-08-09 13:10:16','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2021-08-09 13:10:16','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2021-08-09 13:10:16','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2021-08-09 13:10:21','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2021-08-09 13:10:21','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2021-08-09 13:10:21','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-09-11 09:07:37'),(2,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-09-11 10:06:12'),(3,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-09-11 12:48:01'),(4,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','验证码错误','2021-10-03 02:49:56'),(5,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','验证码错误','2021-10-03 02:50:03'),(6,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 02:50:07'),(7,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-03 03:12:07'),(8,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 03:12:26'),(9,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-03 03:12:38'),(10,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','验证码错误','2021-10-03 03:12:44'),(11,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 03:12:48'),(12,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-03 03:14:12'),(13,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 03:14:23'),(14,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','验证码错误','2021-10-03 05:22:29'),(15,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 05:22:32'),(16,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-03 05:46:44'),(17,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 05:46:56'),(18,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 07:20:58'),(19,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-03 07:21:27'),(20,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误1次','2021-10-03 07:21:48'),(21,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','验证码错误','2021-10-03 07:21:59'),(22,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 07:22:06'),(23,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 09:11:09'),(24,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-03 09:12:58'),(25,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 09:13:08'),(26,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 14:13:44'),(27,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误1次','2021-10-03 15:54:36'),(28,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','验证码错误','2021-10-03 15:54:59'),(29,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误2次','2021-10-03 15:55:10'),(30,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 15:55:25'),(31,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','验证码错误','2021-10-03 15:57:42'),(32,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误1次','2021-10-03 15:57:47'),(33,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 15:57:52'),(34,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 16:01:03'),(35,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误1次','2021-10-03 16:44:34'),(36,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','验证码错误','2021-10-03 16:44:45'),(37,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 16:45:30'),(38,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','验证码错误','2021-10-03 17:13:19'),(39,'editor','127.0.0.1','内网IP','Chrome 9','Linux','1','验证码错误','2021-10-03 17:13:23'),(40,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 17:13:26'),(41,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 17:18:02'),(42,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 17:31:22'),(43,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-03 17:34:09'),(44,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 03:08:46'),(45,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','1','验证码错误','2021-10-04 03:10:59'),(46,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 03:11:03'),(47,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 03:28:21'),(48,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 03:40:15'),(49,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','1','验证码错误','2021-10-04 03:51:28'),(50,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 03:51:32'),(51,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 03:54:30'),(52,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','1','验证码错误','2021-10-04 04:15:17'),(53,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 04:15:20'),(54,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 04:16:09'),(55,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 04:57:05'),(56,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 04:59:18'),(57,'admin','127.0.0.1','内网IP','Firefox 56','Windows 10','1','密码输入错误1次','2021-10-04 05:02:25'),(58,'admin','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 05:02:31'),(59,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 05:05:21'),(60,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 05:57:21'),(61,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 06:22:35'),(62,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 06:26:39'),(63,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 06:31:35'),(64,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 06:37:45'),(65,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 06:51:42'),(66,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 06:53:30'),(67,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 07:10:46'),(68,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 07:20:03'),(69,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 07:25:34'),(70,'editor','127.0.0.1','内网IP','Firefox 56','Windows 10','0','登录成功','2021-10-04 07:30:01'),(71,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 05:07:33'),(72,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-05 05:13:17'),(73,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误1次','2021-10-05 05:13:34'),(74,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 05:13:41'),(75,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:19:33'),(76,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:32:42'),(77,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:34:44'),(78,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:38:29'),(79,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:40:51'),(80,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:43:07'),(81,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:44:31'),(82,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:47:20'),(83,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:50:22'),(84,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:51:31'),(85,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-05 08:54:47'),(86,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:54:50'),(87,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-05 08:56:01'),(88,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误1次','2021-10-05 08:56:08'),(89,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 08:56:12'),(90,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:04:43'),(91,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:16:05'),(92,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:19:26'),(93,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-05 09:22:22'),(94,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:23:25'),(95,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-05 09:24:46'),(96,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:24:52'),(97,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:29:03'),(98,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:29:51'),(99,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:34:27'),(100,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:37:17'),(101,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:42:07'),(102,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:44:30'),(103,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:46:10'),(104,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 09:50:50'),(105,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 10:00:46'),(106,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 10:06:05'),(107,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-05 10:31:48'),(108,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 10:31:56'),(109,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-05 10:33:42'),(110,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 10:33:46'),(111,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-05 10:33:59'),(112,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误1次','2021-10-05 10:34:05'),(113,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 10:34:08'),(114,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-05 10:34:35'),(115,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 10:34:39'),(116,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 10:36:17'),(117,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 10:37:40'),(118,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 10:38:23'),(119,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 11:04:33'),(120,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 11:05:55'),(121,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 11:13:03'),(122,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 11:16:32'),(123,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 12:07:31'),(124,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 12:11:06'),(125,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 12:15:46'),(126,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 12:16:51'),(127,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 12:18:21'),(128,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 12:19:26'),(129,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 12:20:41'),(130,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 12:23:32'),(131,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 12:27:24'),(132,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 12:30:06'),(133,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 14:06:19'),(134,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 14:30:56'),(135,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 14:32:41'),(136,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 14:41:18'),(137,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 14:51:42'),(138,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 15:00:08'),(139,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 15:07:28'),(140,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 15:37:04'),(141,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 15:43:50'),(142,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 15:45:57'),(143,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 15:49:53'),(144,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 15:51:29'),(145,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 15:56:10'),(146,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-05 16:00:49'),(147,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-05 16:03:40'),(148,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-06 03:58:05'),(149,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-06 04:14:42'),(150,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 04:46:37'),(151,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-07 04:49:21'),(152,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误1次','2021-10-07 04:49:31'),(153,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误2次','2021-10-07 04:49:35'),(154,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误3次','2021-10-07 04:49:38'),(155,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 04:49:41'),(156,'admin','127.0.0.1','内网IP','Chrome 9','Linux','1','密码输入错误1次','2021-10-07 05:03:15'),(157,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 05:03:18'),(158,'admin','127.0.0.1','内网IP','Chrome 9','Linux','0','退出成功','2021-10-07 05:04:27'),(159,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 05:04:31'),(160,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 05:20:03'),(161,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 05:38:43'),(162,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 05:41:07'),(163,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 05:49:27'),(164,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 06:07:18'),(165,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 06:15:52'),(166,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 06:19:53'),(167,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 10:40:50'),(168,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 10:43:09'),(169,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 10:46:01'),(170,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 11:38:27'),(171,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 11:40:28'),(172,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 11:45:49'),(173,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 12:17:15'),(174,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 12:22:51'),(175,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 12:30:40'),(176,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 12:42:26'),(177,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 12:46:24'),(178,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 15:28:51'),(179,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 15:30:29'),(180,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 15:31:38'),(181,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 15:33:34'),(182,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 16:09:13'),(183,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 16:10:44'),(184,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 16:13:29'),(185,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 16:15:21'),(186,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 16:19:38'),(187,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-07 16:23:21'),(188,'editor','127.0.0.1','内网IP','Chrome 9','Linux','0','登录成功','2021-10-08 02:49:04');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1066 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'#','','M','0','1','','fa fa-gear','admin','2021-08-09 13:10:04','',NULL,'系统管理目录'),(2,'系统监控',0,2,'#','','M','0','1','','fa fa-video-camera','admin','2021-08-09 13:10:04','',NULL,'系统监控目录'),(3,'系统工具',0,3,'#','','M','0','1','','fa fa-bars','admin','2021-08-09 13:10:04','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip','menuBlank','C','0','1','','fa fa-location-arrow','admin','2021-08-09 13:10:04','',NULL,'若依官网地址'),(100,'用户管理',1,1,'/system/user','','C','0','1','system:user:view','fa fa-user-o','admin','2021-08-09 13:10:04','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'/system/role','','C','0','1','system:role:view','fa fa-user-secret','admin','2021-08-09 13:10:04','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'/system/menu','','C','0','1','system:menu:view','fa fa-th-list','admin','2021-08-09 13:10:04','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'/system/dept','','C','0','1','system:dept:view','fa fa-outdent','admin','2021-08-09 13:10:04','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'/system/post','','C','0','1','system:post:view','fa fa-address-card-o','admin','2021-08-09 13:10:04','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'/system/dict','','C','0','1','system:dict:view','fa fa-bookmark-o','admin','2021-08-09 13:10:04','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'/system/config','','C','0','1','system:config:view','fa fa-sun-o','admin','2021-08-09 13:10:04','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'/system/notice','','C','0','1','system:notice:view','fa fa-bullhorn','admin','2021-08-09 13:10:04','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'#','','M','0','1','','fa fa-pencil-square-o','admin','2021-08-09 13:10:04','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'/monitor/online','','C','0','1','monitor:online:view','fa fa-user-circle','admin','2021-08-09 13:10:04','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'/monitor/job','','C','0','1','monitor:job:view','fa fa-tasks','admin','2021-08-09 13:10:04','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'/monitor/data','','C','0','1','monitor:data:view','fa fa-bug','admin','2021-08-09 13:10:04','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'/monitor/server','','C','0','1','monitor:server:view','fa fa-server','admin','2021-08-09 13:10:04','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'/monitor/cache','','C','0','1','monitor:cache:view','fa fa-cube','admin','2021-08-09 13:10:04','',NULL,'缓存监控菜单'),(114,'表单构建',3,1,'/tool/build','','C','0','1','tool:build:view','fa fa-wpforms','admin','2021-08-09 13:10:05','',NULL,'表单构建菜单'),(115,'代码生成',3,2,'/tool/gen','','C','0','1','tool:gen:view','fa fa-code','admin','2021-08-09 13:10:05','',NULL,'代码生成菜单'),(116,'系统接口',3,3,'/tool/swagger','','C','0','1','tool:swagger:view','fa fa-gg','admin','2021-08-09 13:10:05','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'/monitor/operlog','','C','0','1','monitor:operlog:view','fa fa-address-book','admin','2021-08-09 13:10:05','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'/monitor/logininfor','','C','0','1','monitor:logininfor:view','fa fa-file-image-o','admin','2021-08-09 13:10:05','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'#','','F','0','1','system:user:list','#','admin','2021-08-09 13:10:05','',NULL,''),(1001,'用户新增',100,2,'#','','F','0','1','system:user:add','#','admin','2021-08-09 13:10:05','',NULL,''),(1002,'用户修改',100,3,'#','','F','0','1','system:user:edit','#','admin','2021-08-09 13:10:05','',NULL,''),(1003,'用户删除',100,4,'#','','F','0','1','system:user:remove','#','admin','2021-08-09 13:10:05','',NULL,''),(1004,'用户导出',100,5,'#','','F','0','1','system:user:export','#','admin','2021-08-09 13:10:05','',NULL,''),(1005,'用户导入',100,6,'#','','F','0','1','system:user:import','#','admin','2021-08-09 13:10:05','',NULL,''),(1006,'重置密码',100,7,'#','','F','0','1','system:user:resetPwd','#','admin','2021-08-09 13:10:05','',NULL,''),(1007,'角色查询',101,1,'#','','F','0','1','system:role:list','#','admin','2021-08-09 13:10:05','',NULL,''),(1008,'角色新增',101,2,'#','','F','0','1','system:role:add','#','admin','2021-08-09 13:10:05','',NULL,''),(1009,'角色修改',101,3,'#','','F','0','1','system:role:edit','#','admin','2021-08-09 13:10:05','',NULL,''),(1010,'角色删除',101,4,'#','','F','0','1','system:role:remove','#','admin','2021-08-09 13:10:05','',NULL,''),(1011,'角色导出',101,5,'#','','F','0','1','system:role:export','#','admin','2021-08-09 13:10:05','',NULL,''),(1012,'菜单查询',102,1,'#','','F','0','1','system:menu:list','#','admin','2021-08-09 13:10:05','',NULL,''),(1013,'菜单新增',102,2,'#','','F','0','1','system:menu:add','#','admin','2021-08-09 13:10:05','',NULL,''),(1014,'菜单修改',102,3,'#','','F','0','1','system:menu:edit','#','admin','2021-08-09 13:10:05','',NULL,''),(1015,'菜单删除',102,4,'#','','F','0','1','system:menu:remove','#','admin','2021-08-09 13:10:05','',NULL,''),(1016,'部门查询',103,1,'#','','F','0','1','system:dept:list','#','admin','2021-08-09 13:10:05','',NULL,''),(1017,'部门新增',103,2,'#','','F','0','1','system:dept:add','#','admin','2021-08-09 13:10:05','',NULL,''),(1018,'部门修改',103,3,'#','','F','0','1','system:dept:edit','#','admin','2021-08-09 13:10:05','',NULL,''),(1019,'部门删除',103,4,'#','','F','0','1','system:dept:remove','#','admin','2021-08-09 13:10:05','',NULL,''),(1020,'岗位查询',104,1,'#','','F','0','1','system:post:list','#','admin','2021-08-09 13:10:05','',NULL,''),(1021,'岗位新增',104,2,'#','','F','0','1','system:post:add','#','admin','2021-08-09 13:10:06','',NULL,''),(1022,'岗位修改',104,3,'#','','F','0','1','system:post:edit','#','admin','2021-08-09 13:10:06','',NULL,''),(1023,'岗位删除',104,4,'#','','F','0','1','system:post:remove','#','admin','2021-08-09 13:10:06','',NULL,''),(1024,'岗位导出',104,5,'#','','F','0','1','system:post:export','#','admin','2021-08-09 13:10:06','',NULL,''),(1025,'字典查询',105,1,'#','','F','0','1','system:dict:list','#','admin','2021-08-09 13:10:06','',NULL,''),(1026,'字典新增',105,2,'#','','F','0','1','system:dict:add','#','admin','2021-08-09 13:10:06','',NULL,''),(1027,'字典修改',105,3,'#','','F','0','1','system:dict:edit','#','admin','2021-08-09 13:10:06','',NULL,''),(1028,'字典删除',105,4,'#','','F','0','1','system:dict:remove','#','admin','2021-08-09 13:10:06','',NULL,''),(1029,'字典导出',105,5,'#','','F','0','1','system:dict:export','#','admin','2021-08-09 13:10:06','',NULL,''),(1030,'参数查询',106,1,'#','','F','0','1','system:config:list','#','admin','2021-08-09 13:10:06','',NULL,''),(1031,'参数新增',106,2,'#','','F','0','1','system:config:add','#','admin','2021-08-09 13:10:06','',NULL,''),(1032,'参数修改',106,3,'#','','F','0','1','system:config:edit','#','admin','2021-08-09 13:10:06','',NULL,''),(1033,'参数删除',106,4,'#','','F','0','1','system:config:remove','#','admin','2021-08-09 13:10:06','',NULL,''),(1034,'参数导出',106,5,'#','','F','0','1','system:config:export','#','admin','2021-08-09 13:10:06','',NULL,''),(1035,'公告查询',107,1,'#','','F','0','1','system:notice:list','#','admin','2021-08-09 13:10:06','',NULL,''),(1036,'公告新增',107,2,'#','','F','0','1','system:notice:add','#','admin','2021-08-09 13:10:06','',NULL,''),(1037,'公告修改',107,3,'#','','F','0','1','system:notice:edit','#','admin','2021-08-09 13:10:06','',NULL,''),(1038,'公告删除',107,4,'#','','F','0','1','system:notice:remove','#','admin','2021-08-09 13:10:06','',NULL,''),(1039,'操作查询',500,1,'#','','F','0','1','monitor:operlog:list','#','admin','2021-08-09 13:10:06','',NULL,''),(1040,'操作删除',500,2,'#','','F','0','1','monitor:operlog:remove','#','admin','2021-08-09 13:10:06','',NULL,''),(1041,'详细信息',500,3,'#','','F','0','1','monitor:operlog:detail','#','admin','2021-08-09 13:10:06','',NULL,''),(1042,'日志导出',500,4,'#','','F','0','1','monitor:operlog:export','#','admin','2021-08-09 13:10:06','',NULL,''),(1043,'登录查询',501,1,'#','','F','0','1','monitor:logininfor:list','#','admin','2021-08-09 13:10:06','',NULL,''),(1044,'登录删除',501,2,'#','','F','0','1','monitor:logininfor:remove','#','admin','2021-08-09 13:10:06','',NULL,''),(1045,'日志导出',501,3,'#','','F','0','1','monitor:logininfor:export','#','admin','2021-08-09 13:10:07','',NULL,''),(1046,'账户解锁',501,4,'#','','F','0','1','monitor:logininfor:unlock','#','admin','2021-08-09 13:10:07','',NULL,''),(1047,'在线查询',109,1,'#','','F','0','1','monitor:online:list','#','admin','2021-08-09 13:10:07','',NULL,''),(1048,'批量强退',109,2,'#','','F','0','1','monitor:online:batchForceLogout','#','admin','2021-08-09 13:10:07','',NULL,''),(1049,'单条强退',109,3,'#','','F','0','1','monitor:online:forceLogout','#','admin','2021-08-09 13:10:07','',NULL,''),(1050,'任务查询',110,1,'#','','F','0','1','monitor:job:list','#','admin','2021-08-09 13:10:07','',NULL,''),(1051,'任务新增',110,2,'#','','F','0','1','monitor:job:add','#','admin','2021-08-09 13:10:07','',NULL,''),(1052,'任务修改',110,3,'#','','F','0','1','monitor:job:edit','#','admin','2021-08-09 13:10:07','',NULL,''),(1053,'任务删除',110,4,'#','','F','0','1','monitor:job:remove','#','admin','2021-08-09 13:10:08','',NULL,''),(1054,'状态修改',110,5,'#','','F','0','1','monitor:job:changeStatus','#','admin','2021-08-09 13:10:08','',NULL,''),(1055,'任务详细',110,6,'#','','F','0','1','monitor:job:detail','#','admin','2021-08-09 13:10:08','',NULL,''),(1056,'任务导出',110,7,'#','','F','0','1','monitor:job:export','#','admin','2021-08-09 13:10:08','',NULL,''),(1057,'生成查询',115,1,'#','','F','0','1','tool:gen:list','#','admin','2021-08-09 13:10:08','',NULL,''),(1058,'生成修改',115,2,'#','','F','0','1','tool:gen:edit','#','admin','2021-08-09 13:10:08','',NULL,''),(1059,'生成删除',115,3,'#','','F','0','1','tool:gen:remove','#','admin','2021-08-09 13:10:08','',NULL,''),(1060,'预览代码',115,4,'#','','F','0','1','tool:gen:preview','#','admin','2021-08-09 13:10:08','',NULL,''),(1061,'生成代码',115,5,'#','','F','0','1','tool:gen:code','#','admin','2021-08-09 13:10:08','',NULL,''),(1062,'书籍管理',0,2,'#','menuItem','M','0','1','','#','admin','2021-10-03 03:07:44','admin','2021-10-03 03:07:58',''),(1063,'全部数据管理',1062,2,'/book/manage','menuItem','C','0','1','','#','admin','2021-10-03 03:08:44','admin','2021-10-03 03:09:27',''),(1064,'用户管理',1062,2,'/book/user','menuItem','C','0','1','','#','admin','2021-10-05 10:33:15','admin','2021-10-05 10:33:34',''),(1065,'合集管理',1062,2,'/book/collection','menuItem','C','0','1',NULL,'#','admin','2021-10-07 05:04:04','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2021-08-09 13:10:22','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2021-08-09 13:10:22','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.addSave()','POST',1,'admin','研发部门','/system/dept/add','127.0.0.1','内网IP','{\"parentId\":[\"101\"],\"deptName\":[\"fdsf\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2021-09-11 10:06:37'),(2,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','GET',1,'admin','研发部门','/system/dept/remove/101','127.0.0.1','内网IP','101','{\n  \"msg\" : \"存在下级部门,不允许删除\",\n  \"code\" : 301\n}',0,NULL,'2021-09-11 10:06:43'),(3,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.update()','POST',1,'admin','研发部门','/system/user/profile/update','127.0.0.1','内网IP','{\"id\":[\"\"],\"userName\":[\"若依\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"0\"]}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2021-09-11 12:48:26'),(4,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"sys_job_log\"]}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2021-09-11 12:49:34'),(5,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/4','127.0.0.1','内网IP','4','{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}',0,NULL,'2021-10-03 02:51:14'),(6,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','研发部门','/system/dict/data/edit','127.0.0.1','内网IP','{\"dictCode\":[\"1\"],\"dictLabel\":[\"男1\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_sex\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"性别男\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 02:52:01'),(7,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.addSave()','POST',1,'admin','研发部门','/system/role/add','127.0.0.1','内网IP','{\"roleName\":[\"书籍编辑\"],\"roleKey\":[\"editor\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 03:00:49'),(8,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"sys_user_post\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 03:05:06'),(9,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 03:07:44'),(10,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"1062\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"书籍管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 03:07:58'),(11,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"全部数据管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 03:08:44'),(12,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"1063\"],\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"全部数据管理\"],\"url\":[\"/book/manage\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 03:09:27'),(13,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\"roleId\":[\"3\"],\"roleName\":[\"书籍编辑\"],\"roleKey\":[\"editor\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1063\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 03:09:45'),(14,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.editSave()','POST',1,'admin','研发部门','/system/dept/edit','127.0.0.1','内网IP','{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"若依科技\"],\"deptName\":[\"编辑部\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 03:10:38'),(15,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','GET',1,'admin','研发部门','/system/dept/remove/110','127.0.0.1','内网IP','110','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 03:10:52'),(16,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"101\"],\"userName\":[\"editor\"],\"deptName\":[\"编辑部\"],\"phonenumber\":[\"18817374841\"],\"email\":[\"\"],\"loginName\":[\"editor\"],\"sex\":[\"0\"],\"role\":[\"3\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"3\"],\"postIds\":[\"4\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-03 03:11:57'),(17,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\"roleId\":[\"3\"],\"roleName\":[\"书籍编辑\"],\"roleKey\":[\"editor\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1063\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-05 08:57:11'),(18,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\"roleId\":[\"3\"],\"roleName\":[\"书籍编辑\"],\"roleKey\":[\"editor\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1063\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-05 08:57:27'),(19,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-05 10:33:15'),(20,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"1064\"],\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"/book/user\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-05 10:33:34'),(21,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\"roleId\":[\"3\"],\"roleName\":[\"书籍编辑\"],\"roleKey\":[\"editor\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1063,1064\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-05 10:34:32'),(22,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"合集管理\"],\"url\":[\"/book/collection\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-07 05:04:04'),(23,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\"roleId\":[\"3\"],\"roleName\":[\"书籍编辑\"],\"roleKey\":[\"editor\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1063,1064,1065\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2021-10-07 05:04:24');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2021-08-09 13:10:03','',NULL,''),(2,'se','项目经理',2,'0','admin','2021-08-09 13:10:03','',NULL,''),(3,'hr','人力资源',3,'0','admin','2021-08-09 13:10:03','',NULL,''),(4,'user','普通员工',4,'0','admin','2021-08-09 13:10:03','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1','0','0','admin','2021-08-09 13:10:03','',NULL,'超级管理员'),(2,'普通角色','common',2,'2','0','0','admin','2021-08-09 13:10:03','',NULL,'普通角色'),(3,'书籍编辑','editor',1,'1','0','0','admin','2021-10-03 03:00:49','admin','2021-10-07 05:04:24','');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,1061),(3,1062),(3,1063),(3,1064),(3,1065);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','0','','29c67a30398638269fe600f73a054934','111111','0','0','127.0.0.1','2021-10-07 13:03:19','2021-08-09 13:10:02','admin','2021-08-09 13:10:02','','2021-10-07 05:03:18','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','8e6d98b90472783cc73c17047ddccf36','222222','0','0','127.0.0.1','2021-08-09 13:10:02','2021-08-09 13:10:02','admin','2021-08-09 13:10:02','',NULL,'测试员'),(3,101,'editor','editor','00','','18817374841','0','','414dbb0b0f1b9e6ad95e9150608fe42b','b25747','0','0','127.0.0.1','2021-10-08 10:49:05',NULL,'admin','2021-10-03 03:11:56','','2021-10-08 02:49:04',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` VALUES ('70fa3240-04bc-4af2-9992-7d5ba75acb57','editor','编辑部','127.0.0.1','内网IP','Chrome 9','Linux','on_line','2021-10-08 10:44:03','2021-10-08 10:54:21',1800000);
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(3,4);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-09 22:20:46
