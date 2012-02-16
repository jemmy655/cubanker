CREATE DATABASE  IF NOT EXISTS `cx` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cx`;
-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: cx
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8

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
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(25) DEFAULT '',
  `function_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function`
--

LOCK TABLES `function` WRITE;
/*!40000 ALTER TABLE `function` DISABLE KEYS */;
INSERT INTO `function` (`id`, `function_name`, `function_description`) VALUES (1,'Change Password','Change Password'),(2,'Accounts','View Accounts'),(3,'Beneficiaries','Maintain Beneficiaries'),(4,'Beneficiary Payments','Make Beneficiary Payments'),(5,'Recuring Payments','Maintain Recuring Payments');
/*!40000 ALTER TABLE `function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatedentity`
--

DROP TABLE IF EXISTS `relatedentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatedentity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relatedentity1` int(11) DEFAULT NULL,
  `relatedentity2` int(11) DEFAULT NULL,
  `relationshiptype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relatedentity_relationshiptype1` (`relationshiptype`),
  KEY `fk_relatedentity_entity1` (`relatedentity1`),
  KEY `fk_relatedentity_entity2` (`relatedentity2`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatedentity`
--

LOCK TABLES `relatedentity` WRITE;
/*!40000 ALTER TABLE `relatedentity` DISABLE KEYS */;
INSERT INTO `relatedentity` (`id`, `relatedentity1`, `relatedentity2`, `relationshiptype`) VALUES (1,1,2,1),(2,1,2,2);
/*!40000 ALTER TABLE `relatedentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitygrouping`
--

DROP TABLE IF EXISTS `entitygrouping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitygrouping` (
  `id` int(11) NOT NULL,
  `entityid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entitygrouping_entitygroup1` (`groupid`),
  KEY `fk_entitygrouping_entity1` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitygrouping`
--

LOCK TABLES `entitygrouping` WRITE;
/*!40000 ALTER TABLE `entitygrouping` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitygrouping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kyc`
--

DROP TABLE IF EXISTS `kyc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kyc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entityid` int(11) DEFAULT NULL,
  `ficatype` varchar(45) DEFAULT NULL,
  `ficaapproved` datetime DEFAULT NULL,
  `lastupdatedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kyc_ficatype1` (`ficatype`),
  KEY `fk_kyc_entity1` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kyc`
--

LOCK TABLES `kyc` WRITE;
/*!40000 ALTER TABLE `kyc` DISABLE KEYS */;
/*!40000 ALTER TABLE `kyc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(45) DEFAULT NULL,
  `attribute` varchar(75) DEFAULT NULL,
  `attributetype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entityattributes_entity1` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` (`id`, `entity_id`, `attribute`, `attributetype`) VALUES (1,'1','Peter',1),(2,'1','Pan',2),(3,'1','6601017867001',3),(4,'2','Pan Industries (Pty) Ltd',6);
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line1` varchar(45) DEFAULT NULL,
  `line2` varchar(45) DEFAULT NULL,
  `line3` varchar(45) DEFAULT NULL,
  `addresstype` int(11) DEFAULT NULL,
  `entityid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_addresstype1` (`addresstype`),
  KEY `fk_address_entity1` (`entityid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`id`, `line1`, `line2`, `line3`, `addresstype`, `entityid`) VALUES (1,'peter.pan@neverland.co.za',NULL,NULL,1,1),(2,'17 Faraway Tree','South Side','Treasure Island',3,NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entitytype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entity_entitytype1` (`entitytype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` (`id`, `entitytype`) VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profilebeneficiary`
--

DROP TABLE IF EXISTS `profilebeneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profilebeneficiary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profileid` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `accountname` varchar(45) DEFAULT NULL,
  `sortcode` varchar(45) DEFAULT NULL,
  `accountnumber` varchar(45) DEFAULT NULL,
  `lastpaiddate` varchar(45) DEFAULT NULL,
  `lastpaidamount` varchar(45) DEFAULT NULL,
  `notificationaddress1` varchar(45) DEFAULT NULL,
  `notificationaddress2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_beneficiary_profile1` (`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profilebeneficiary`
--

LOCK TABLES `profilebeneficiary` WRITE;
/*!40000 ALTER TABLE `profilebeneficiary` DISABLE KEYS */;
/*!40000 ALTER TABLE `profilebeneficiary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityaccount`
--

DROP TABLE IF EXISTS `entityaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entityid` int(11) DEFAULT NULL,
  `openedon` datetime DEFAULT NULL,
  `accountid` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entityaccount_entity1` (`entityid`),
  KEY `fk_entityaccount_account1` (`accountid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entityaccount`
--

LOCK TABLES `entityaccount` WRITE;
/*!40000 ALTER TABLE `entityaccount` DISABLE KEYS */;
INSERT INTO `entityaccount` (`id`, `entityid`, `openedon`, `accountid`, `name`) VALUES (1,1,'2009-07-21 00:00:00',5,'Peter\'s Transactions'),(2,2,'2009-01-01 00:00:00',6,'Pan\'s Clearing Account');
/*!40000 ALTER TABLE `entityaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chargemethod`
--

DROP TABLE IF EXISTS `chargemethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chargemethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `min` decimal(10,0) DEFAULT NULL,
  `max` decimal(10,0) DEFAULT NULL,
  `default` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chargemethod`
--

LOCK TABLES `chargemethod` WRITE;
/*!40000 ALTER TABLE `chargemethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `chargemethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankbranch`
--

DROP TABLE IF EXISTS `bankbranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankbranch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankentity` int(11) DEFAULT NULL,
  `sortcode` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `contactentity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bankbranch_entity1` (`bankentity`),
  KEY `fk_bankbranch_entity2` (`contactentity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankbranch`
--

LOCK TABLES `bankbranch` WRITE;
/*!40000 ALTER TABLE `bankbranch` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankbranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL DEFAULT '0',
  `item` varchar(45) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `item`, `notes`) VALUES (0,'fix descurity model','get the login using the role model security'),(1,'add a edit form for all static data','');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionhistory`
--

DROP TABLE IF EXISTS `transactionhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactionhistory` (
  `id` int(11) NOT NULL,
  `sequence` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `destinationaccountid` varchar(45) DEFAULT NULL,
  `reference` varchar(45) DEFAULT NULL,
  `originatingaccountid` varchar(45) DEFAULT NULL,
  `transactioncode` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `narrative` varchar(45) DEFAULT NULL,
  `batchid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transactionhistory_batchhistory1` (`batchid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionhistory`
--

LOCK TABLES `transactionhistory` WRITE;
/*!40000 ALTER TABLE `transactionhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactionhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitytype`
--

DROP TABLE IF EXISTS `entitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitytype`
--

LOCK TABLES `entitytype` WRITE;
/*!40000 ALTER TABLE `entitytype` DISABLE KEYS */;
INSERT INTO `entitytype` (`id`, `description`) VALUES (1,'Person (National)'),(2,'Private Company'),(3,'Closed Corporation'),(4,'Public Company (Listed)'),(5,'Public Company (Unlisted)'),(6,'Trust'),(7,'Partnership'),(8,'Persona (Foreigner)');
/*!40000 ALTER TABLE `entitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profilescheduledpayments`
--

DROP TABLE IF EXISTS `profilescheduledpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profilescheduledpayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profileid` varchar(45) DEFAULT NULL,
  `fromprofileaccount` int(11) DEFAULT NULL,
  `myreference` varchar(45) DEFAULT NULL,
  `toprofilebeneficiary` int(11) DEFAULT NULL,
  `theirreference` varchar(45) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `dueon` datetime DEFAULT NULL,
  `paymentnumber` int(11) DEFAULT NULL,
  `totalpayments` int(11) DEFAULT NULL,
  `paymentfrequency` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profilescheduledpayments_profile1` (`profileid`),
  KEY `fk_profilescheduledpayments_profileaccount1` (`fromprofileaccount`),
  KEY `fk_profilescheduledpayments_profilebeneficiary1` (`toprofilebeneficiary`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profilescheduledpayments`
--

LOCK TABLES `profilescheduledpayments` WRITE;
/*!40000 ALTER TABLE `profilescheduledpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `profilescheduledpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributetype`
--

DROP TABLE IF EXISTS `attributetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attributetype_attribute1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributetype`
--

LOCK TABLES `attributetype` WRITE;
/*!40000 ALTER TABLE `attributetype` DISABLE KEYS */;
INSERT INTO `attributetype` (`id`, `description`) VALUES (1,'First Name'),(2,'Surname'),(3,'National ID'),(4,'Passport Number'),(5,'Birthday'),(6,'Full Name'),(7,'Gender');
/*!40000 ALTER TABLE `attributetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documenttype`
--

DROP TABLE IF EXISTS `documenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documenttype` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documenttype`
--

LOCK TABLES `documenttype` WRITE;
/*!40000 ALTER TABLE `documenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `documenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `savedbyuserid` varchar(45) DEFAULT NULL,
  `location` varchar(145) DEFAULT NULL,
  `attached` blob,
  `documenttype` int(11) DEFAULT NULL,
  `tags` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_documenttype1` (`documenttype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchhistory`
--

DROP TABLE IF EXISTS `batchhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openedon` datetime DEFAULT NULL,
  `closedon` datetime DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `postedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchhistory`
--

LOCK TABLES `batchhistory` WRITE;
/*!40000 ALTER TABLE `batchhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entityid` int(11) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `passwordhash` varchar(20) NOT NULL,
  `passwordexpireson` date DEFAULT NULL,
  `logintype` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_logintype1` (`logintype`),
  KEY `fk_profile_entity1` (`entityid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`id`, `entityid`, `userid`, `passwordhash`, `passwordexpireson`, `logintype`) VALUES (4,1,'demo','password','2011-09-17',6),(5,2,'ceo','loveswendy','2012-01-01',7);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profileaccount`
--

DROP TABLE IF EXISTS `profileaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profileaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profileid` varchar(45) DEFAULT NULL,
  `entityaccountid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profileaccount_profile1` (`profileid`),
  KEY `fk_profileaccount_entityaccount1` (`entityaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profileaccount`
--

LOCK TABLES `profileaccount` WRITE;
/*!40000 ALTER TABLE `profileaccount` DISABLE KEYS */;
INSERT INTO `profileaccount` (`id`, `profileid`, `entityaccountid`) VALUES (1,'4','1'),(2,'5','1'),(3,'5','2');
/*!40000 ALTER TABLE `profileaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountstatus`
--

DROP TABLE IF EXISTS `accountstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountstatus`
--

LOCK TABLES `accountstatus` WRITE;
/*!40000 ALTER TABLE `accountstatus` DISABLE KEYS */;
INSERT INTO `accountstatus` (`id`, `description`) VALUES (1,'inactive'),(2,'active'),(3,'dormant'),(4,'closed');
/*!40000 ALTER TABLE `accountstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chargefrequency`
--

DROP TABLE IF EXISTS `chargefrequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chargefrequency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chargefrequency`
--

LOCK TABLES `chargefrequency` WRITE;
/*!40000 ALTER TABLE `chargefrequency` DISABLE KEYS */;
/*!40000 ALTER TABLE `chargefrequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresstype`
--

DROP TABLE IF EXISTS `addresstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresstype`
--

LOCK TABLES `addresstype` WRITE;
/*!40000 ALTER TABLE `addresstype` DISABLE KEYS */;
INSERT INTO `addresstype` (`id`, `description`) VALUES (1,'email'),(2,'work telephone'),(3,'physical address'),(4,'postal address'),(5,'skype id');
/*!40000 ALTER TABLE `addresstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incomeallocation`
--

DROP TABLE IF EXISTS `incomeallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incomeallocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chargemethodid` int(11) DEFAULT NULL,
  `entityaccountid` int(11) DEFAULT NULL,
  `fixedallocation` decimal(10,0) DEFAULT NULL,
  `percentageallocation` decimal(10,0) DEFAULT NULL,
  `transactioncode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chargeallocation_chargemethod1` (`chargemethodid`),
  KEY `fk_chargeallocation_transactioncode1` (`transactioncode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incomeallocation`
--

LOCK TABLES `incomeallocation` WRITE;
/*!40000 ALTER TABLE `incomeallocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `incomeallocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationshiptype`
--

DROP TABLE IF EXISTS `relationshiptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationshiptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationshiptype`
--

LOCK TABLES `relationshiptype` WRITE;
/*!40000 ALTER TABLE `relationshiptype` DISABLE KEYS */;
INSERT INTO `relationshiptype` (`id`, `description`) VALUES (1,'Spouse of'),(2,'Child of'),(3,'Relation of'),(4,'Director of'),(5,'Employed by'),(6,'Trustee of'),(7,'Beneficiary of');
/*!40000 ALTER TABLE `relationshiptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactioncharge`
--

DROP TABLE IF EXISTS `transactioncharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactioncharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chargedmethodapplied` varchar(45) DEFAULT NULL,
  `transactioncodecharged` varchar(3) DEFAULT NULL COMMENT 'need wild cards etc so using the code & not the refered table column\n',
  `originatingsortcode` varchar(45) DEFAULT NULL,
  `originatingaccount` varchar(45) DEFAULT NULL,
  `destinationsortcode` varchar(45) DEFAULT NULL,
  `destinationaccount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transactioncharge_chargemethod1` (`chargedmethodapplied`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactioncharge`
--

LOCK TABLES `transactioncharge` WRITE;
/*!40000 ALTER TABLE `transactioncharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactioncharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficadocument`
--

DROP TABLE IF EXISTS `ficadocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficadocument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kycid` int(11) DEFAULT NULL,
  `documentid` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ficadocument_document1` (`documentid`),
  KEY `fk_ficadocument_kyc1` (`kycid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficadocument`
--

LOCK TABLES `ficadocument` WRITE;
/*!40000 ALTER TABLE `ficadocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficadocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodiccharge`
--

DROP TABLE IF EXISTS `periodiccharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodiccharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chargemethodapplied` varchar(45) DEFAULT NULL,
  `chargefrequencyid` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_periodiccharge_frequencytype1` (`chargefrequencyid`),
  KEY `fk_periodiccharge_chargemethod1` (`chargemethodapplied`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodiccharge`
--

LOCK TABLES `periodiccharge` WRITE;
/*!40000 ALTER TABLE `periodiccharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `periodiccharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(45) NOT NULL,
  `sortcode` int(11) DEFAULT NULL,
  `accounttype` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `VATenabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_account_accountstatus1` (`status`),
  KEY `fk_account_accountype1` (`accounttype`),
  KEY `fk_account_bankbranch1` (`sortcode`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='client account';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `number`, `sortcode`, `accounttype`, `status`, `VATenabled`) VALUES (5,'04234567891',584000,1,2,0),(6,'04123456789',584000,2,2,0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `destinationaccountid` varchar(45) DEFAULT NULL,
  `reference` varchar(45) DEFAULT NULL,
  `originatingaccountid` varchar(45) DEFAULT NULL,
  `transactioncode` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `narrative` varchar(45) DEFAULT NULL,
  `batchid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transaction_batch1` (`batchid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficatype`
--

DROP TABLE IF EXISTS `ficatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficatype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficatype`
--

LOCK TABLES `ficatype` WRITE;
/*!40000 ALTER TABLE `ficatype` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profilefunction`
--

DROP TABLE IF EXISTS `profilefunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profilefunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profileid` int(11) NOT NULL,
  `functionid` int(11) NOT NULL,
  `allowdelete` tinyint(1) NOT NULL,
  `allownew` tinyint(1) NOT NULL,
  `allowedit` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profilefunction_profile1` (`profileid`),
  KEY `fk_profilefunction_functions1` (`functionid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profilefunction`
--

LOCK TABLES `profilefunction` WRITE;
/*!40000 ALTER TABLE `profilefunction` DISABLE KEYS */;
INSERT INTO `profilefunction` (`id`, `profileid`, `functionid`, `allowdelete`, `allownew`, `allowedit`) VALUES (1,1,1,0,0,1),(2,2,1,0,0,1),(3,1,2,0,0,0);
/*!40000 ALTER TABLE `profilefunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openedon` datetime DEFAULT NULL,
  `closedon` datetime DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `postedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logintype`
--

DROP TABLE IF EXISTS `logintype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logintype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logintype`
--

LOCK TABLES `logintype` WRITE;
/*!40000 ALTER TABLE `logintype` DISABLE KEYS */;
INSERT INTO `logintype` (`id`, `description`) VALUES (6,'Internet Banking'),(7,'Branch'),(8,'Call Centre');
/*!40000 ALTER TABLE `logintype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactioncode`
--

DROP TABLE IF EXISTS `transactioncode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactioncode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debitindicator` tinyint(1) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `nonfinancial` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactioncode`
--

LOCK TABLES `transactioncode` WRITE;
/*!40000 ALTER TABLE `transactioncode` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactioncode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitygroupcharged`
--

DROP TABLE IF EXISTS `entitygroupcharged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitygroupcharged` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entitygroupid` int(11) DEFAULT NULL,
  `chargemethodid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entitycharge_chargemethod1` (`chargemethodid`),
  KEY `fk_entitygroupcharged_entitygroup1` (`entitygroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitygroupcharged`
--

LOCK TABLES `entitygroupcharged` WRITE;
/*!40000 ALTER TABLE `entitygroupcharged` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitygroupcharged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountype`
--

DROP TABLE IF EXISTS `accountype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountype`
--

LOCK TABLES `accountype` WRITE;
/*!40000 ALTER TABLE `accountype` DISABLE KEYS */;
INSERT INTO `accountype` (`id`, `description`) VALUES (1,'Current Account'),(2,'Corporate Account'),(3,'Savings Account');
/*!40000 ALTER TABLE `accountype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chargetier`
--

DROP TABLE IF EXISTS `chargetier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chargetier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` decimal(10,0) DEFAULT NULL,
  `max` decimal(10,0) DEFAULT NULL,
  `fixedcharge` decimal(10,0) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `chargemethodid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chargetier_chargemethod1` (`chargemethodid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chargetier`
--

LOCK TABLES `chargetier` WRITE;
/*!40000 ALTER TABLE `chargetier` DISABLE KEYS */;
/*!40000 ALTER TABLE `chargetier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feesweeping`
--

DROP TABLE IF EXISTS `feesweeping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feesweeping` (
  `id` int(11) NOT NULL,
  `entityaccountid` varchar(45) DEFAULT NULL,
  `sweeptoentityaccountid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feesweeping`
--

LOCK TABLES `feesweeping` WRITE;
/*!40000 ALTER TABLE `feesweeping` DISABLE KEYS */;
/*!40000 ALTER TABLE `feesweeping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitygroup`
--

DROP TABLE IF EXISTS `entitygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitygroup` (
  `id` int(11) NOT NULL,
  `groupname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitygroup`
--

LOCK TABLES `entitygroup` WRITE;
/*!40000 ALTER TABLE `entitygroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitygroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-10-21 18:54:11
