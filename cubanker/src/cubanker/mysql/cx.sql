-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.58-1ubuntu1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cx
--

CREATE DATABASE IF NOT EXISTS cx;
USE cx;

--
-- Definition of table `cx`.`accesstype`
--

DROP TABLE IF EXISTS `cx`.`accesstype`;
CREATE TABLE  `cx`.`accesstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accesstype` varchar(2) NOT NULL,
  `description` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`accesstype`
--
INSERT INTO `cx`.`accesstype` (`id`,`accesstype`,`description`) VALUES 
 (1,'sa','System Administration'),
 (2,'cc','Customer Care'),
 (3,'cb','Corporate Banking'),
 (4,'bs','Branch System'),
 (5,'ib','Internet Banking');

--
-- Definition of table `cx`.`account`
--

DROP TABLE IF EXISTS `cx`.`account`;
CREATE TABLE  `cx`.`account` (
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

--
-- Dumping data for table `cx`.`account`
--
INSERT INTO `cx`.`account` (`id`,`number`,`sortcode`,`accounttype`,`status`,`VATenabled`) VALUES 
 (5,'04234567891',584000,1,2,0),
 (6,'04123456789',584000,2,2,0);

--
-- Definition of table `cx`.`accountstatus`
--

DROP TABLE IF EXISTS `cx`.`accountstatus`;
CREATE TABLE  `cx`.`accountstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`accountstatus`
--
INSERT INTO `cx`.`accountstatus` (`id`,`description`) VALUES 
 (1,'inactive'),
 (2,'active'),
 (3,'dormant'),
 (4,'closed');

--
-- Definition of table `cx`.`accountype`
--

DROP TABLE IF EXISTS `cx`.`accountype`;
CREATE TABLE  `cx`.`accountype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`accountype`
--
INSERT INTO `cx`.`accountype` (`id`,`description`) VALUES 
 (1,'Current Account'),
 (2,'Corporate Account'),
 (3,'Savings Account');

--
-- Definition of table `cx`.`address`
--

DROP TABLE IF EXISTS `cx`.`address`;
CREATE TABLE  `cx`.`address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line1` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `line2` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `line3` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `addresstype` int(11) DEFAULT NULL,
  `entityid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_addresstype1` (`addresstype`),
  KEY `fk_address_entity1` (`entityid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cx`.`address`
--
INSERT INTO `cx`.`address` (`id`,`line1`,`line2`,`line3`,`addresstype`,`entityid`) VALUES 
 (1,'peter.pan@neverland.co.za',NULL,NULL,1,1),
 (2,'17 Faraway Tree','South Side','Treasure Island',3,NULL);

--
-- Definition of table `cx`.`addresstype`
--

DROP TABLE IF EXISTS `cx`.`addresstype`;
CREATE TABLE  `cx`.`addresstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`addresstype`
--
INSERT INTO `cx`.`addresstype` (`id`,`description`) VALUES 
 (1,'email'),
 (2,'work telephone'),
 (3,'physical address'),
 (4,'postal address'),
 (5,'skype id');

--
-- Definition of table `cx`.`attribute`
--

DROP TABLE IF EXISTS `cx`.`attribute`;
CREATE TABLE  `cx`.`attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(45) DEFAULT NULL,
  `attribute` varchar(75) DEFAULT NULL,
  `attributetype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entityattributes_entity1` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`attribute`
--
INSERT INTO `cx`.`attribute` (`id`,`entity_id`,`attribute`,`attributetype`) VALUES 
 (1,'1','Peter',1),
 (2,'1','Pan',2),
 (3,'1','6601017867001',3),
 (4,'2','Pan Industries (Pty) Ltd',6);

--
-- Definition of table `cx`.`attributetype`
--

DROP TABLE IF EXISTS `cx`.`attributetype`;
CREATE TABLE  `cx`.`attributetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attributetype_attribute1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`attributetype`
--
INSERT INTO `cx`.`attributetype` (`id`,`description`) VALUES 
 (1,'First Name'),
 (2,'Surname'),
 (3,'National ID'),
 (4,'Passport Number'),
 (5,'Birthday'),
 (6,'Full Name'),
 (7,'Gender');

--
-- Definition of table `cx`.`bankbranch`
--

DROP TABLE IF EXISTS `cx`.`bankbranch`;
CREATE TABLE  `cx`.`bankbranch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankentity` int(11) DEFAULT NULL,
  `sortcode` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `contactentity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bankbranch_entity1` (`bankentity`),
  KEY `fk_bankbranch_entity2` (`contactentity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`bankbranch`
--

--
-- Definition of table `cx`.`batch`
--

DROP TABLE IF EXISTS `cx`.`batch`;
CREATE TABLE  `cx`.`batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openedon` datetime DEFAULT NULL,
  `closedon` datetime DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `postedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`batch`
--

--
-- Definition of table `cx`.`batchhistory`
--

DROP TABLE IF EXISTS `cx`.`batchhistory`;
CREATE TABLE  `cx`.`batchhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openedon` datetime DEFAULT NULL,
  `closedon` datetime DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `postedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`batchhistory`
--

--
-- Definition of table `cx`.`chargefrequency`
--

DROP TABLE IF EXISTS `cx`.`chargefrequency`;
CREATE TABLE  `cx`.`chargefrequency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`chargefrequency`
--

--
-- Definition of table `cx`.`chargemethod`
--

DROP TABLE IF EXISTS `cx`.`chargemethod`;
CREATE TABLE  `cx`.`chargemethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `min` decimal(10,0) DEFAULT NULL,
  `max` decimal(10,0) DEFAULT NULL,
  `default` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`chargemethod`
--

--
-- Definition of table `cx`.`chargetier`
--

DROP TABLE IF EXISTS `cx`.`chargetier`;
CREATE TABLE  `cx`.`chargetier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` decimal(10,0) DEFAULT NULL,
  `max` decimal(10,0) DEFAULT NULL,
  `fixedcharge` decimal(10,0) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `chargemethodid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chargetier_chargemethod1` (`chargemethodid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`chargetier`
--

--
-- Definition of table `cx`.`document`
--

DROP TABLE IF EXISTS `cx`.`document`;
CREATE TABLE  `cx`.`document` (
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

--
-- Dumping data for table `cx`.`document`
--

--
-- Definition of table `cx`.`documenttype`
--

DROP TABLE IF EXISTS `cx`.`documenttype`;
CREATE TABLE  `cx`.`documenttype` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`documenttype`
--

--
-- Definition of table `cx`.`entity`
--

DROP TABLE IF EXISTS `cx`.`entity`;
CREATE TABLE  `cx`.`entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entitytype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entity_entitytype1` (`entitytype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`entity`
--
INSERT INTO `cx`.`entity` (`id`,`entitytype`) VALUES 
 (1,1),
 (2,2);

--
-- Definition of table `cx`.`entityaccount`
--

DROP TABLE IF EXISTS `cx`.`entityaccount`;
CREATE TABLE  `cx`.`entityaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entityid` int(11) DEFAULT NULL,
  `openedon` datetime DEFAULT NULL,
  `accountid` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entityaccount_entity1` (`entityid`),
  KEY `fk_entityaccount_account1` (`accountid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`entityaccount`
--
INSERT INTO `cx`.`entityaccount` (`id`,`entityid`,`openedon`,`accountid`,`name`) VALUES 
 (1,1,'2009-07-21 00:00:00',5,'Peter\'s Transactions'),
 (2,2,'2009-01-01 00:00:00',6,'Pan\'s Clearing Account');

--
-- Definition of table `cx`.`entitygroup`
--

DROP TABLE IF EXISTS `cx`.`entitygroup`;
CREATE TABLE  `cx`.`entitygroup` (
  `id` int(11) NOT NULL,
  `groupname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`entitygroup`
--

--
-- Definition of table `cx`.`entitygroupcharged`
--

DROP TABLE IF EXISTS `cx`.`entitygroupcharged`;
CREATE TABLE  `cx`.`entitygroupcharged` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entitygroupid` int(11) DEFAULT NULL,
  `chargemethodid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entitycharge_chargemethod1` (`chargemethodid`),
  KEY `fk_entitygroupcharged_entitygroup1` (`entitygroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`entitygroupcharged`
--

--
-- Definition of table `cx`.`entitygrouping`
--

DROP TABLE IF EXISTS `cx`.`entitygrouping`;
CREATE TABLE  `cx`.`entitygrouping` (
  `id` int(11) NOT NULL,
  `entityid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entitygrouping_entitygroup1` (`groupid`),
  KEY `fk_entitygrouping_entity1` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`entitygrouping`
--

--
-- Definition of table `cx`.`entitytype`
--

DROP TABLE IF EXISTS `cx`.`entitytype`;
CREATE TABLE  `cx`.`entitytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`entitytype`
--
INSERT INTO `cx`.`entitytype` (`id`,`description`) VALUES 
 (1,'Person (National)'),
 (2,'Private Company'),
 (3,'Closed Corporation'),
 (4,'Public Company (Listed)'),
 (5,'Public Company (Unlisted)'),
 (6,'Trust'),
 (7,'Partnership'),
 (8,'Persona (Foreigner)');

--
-- Definition of table `cx`.`feesweeping`
--

DROP TABLE IF EXISTS `cx`.`feesweeping`;
CREATE TABLE  `cx`.`feesweeping` (
  `id` int(11) NOT NULL,
  `entityaccountid` varchar(45) DEFAULT NULL,
  `sweeptoentityaccountid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`feesweeping`
--

--
-- Definition of table `cx`.`ficadocument`
--

DROP TABLE IF EXISTS `cx`.`ficadocument`;
CREATE TABLE  `cx`.`ficadocument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kycid` int(11) DEFAULT NULL,
  `documentid` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ficadocument_document1` (`documentid`),
  KEY `fk_ficadocument_kyc1` (`kycid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`ficadocument`
--

--
-- Definition of table `cx`.`ficatype`
--

DROP TABLE IF EXISTS `cx`.`ficatype`;
CREATE TABLE  `cx`.`ficatype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`ficatype`
--

--
-- Definition of table `cx`.`function`
--

DROP TABLE IF EXISTS `cx`.`function`;
CREATE TABLE  `cx`.`function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(25) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`function`
--
INSERT INTO `cx`.`function` (`id`,`display_name`,`description`,`uri`) VALUES 
 (1,'Change Password','Change Password','#'),
 (2,'Accounts','View Accounts','accounts'),
 (3,'Person Manitenance','Person Maintenance','person'),
 (4,'Beneficiary Payments','Make Beneficiary Payments','#'),
 (5,'Project Items','Project Items','main'),
 (46,'Secure eMail','Secure Email','#');

--
-- Definition of table `cx`.`incomeallocation`
--

DROP TABLE IF EXISTS `cx`.`incomeallocation`;
CREATE TABLE  `cx`.`incomeallocation` (
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

--
-- Dumping data for table `cx`.`incomeallocation`
--

--
-- Definition of table `cx`.`kyc`
--

DROP TABLE IF EXISTS `cx`.`kyc`;
CREATE TABLE  `cx`.`kyc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entityid` int(11) DEFAULT NULL,
  `ficatype` varchar(45) DEFAULT NULL,
  `ficaapproved` datetime DEFAULT NULL,
  `lastupdatedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kyc_ficatype1` (`ficatype`),
  KEY `fk_kyc_entity1` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`kyc`
--

--
-- Definition of table `cx`.`periodiccharge`
--

DROP TABLE IF EXISTS `cx`.`periodiccharge`;
CREATE TABLE  `cx`.`periodiccharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chargemethodapplied` varchar(45) DEFAULT NULL,
  `chargefrequencyid` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_periodiccharge_frequencytype1` (`chargefrequencyid`),
  KEY `fk_periodiccharge_chargemethod1` (`chargemethodapplied`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`periodiccharge`
--

--
-- Definition of table `cx`.`profile`
--

DROP TABLE IF EXISTS `cx`.`profile`;
CREATE TABLE  `cx`.`profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entityid` int(11) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `passwordhash` varchar(20) NOT NULL,
  `passwordexpireson` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_entity1` (`entityid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`profile`
--
INSERT INTO `cx`.`profile` (`id`,`entityid`,`userid`,`passwordhash`,`passwordexpireson`) VALUES 
 (4,1,'demo','password','2011-09-17'),
 (5,2,'peter','loveswendy','2012-01-01');

--
-- Definition of table `cx`.`profileaccess`
--

DROP TABLE IF EXISTS `cx`.`profileaccess`;
CREATE TABLE  `cx`.`profileaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profileid` int(11) NOT NULL,
  `accesstype` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`profileaccess`
--
INSERT INTO `cx`.`profileaccess` (`id`,`profileid`,`accesstype`) VALUES 
 (1,5,'bs'),
 (2,4,'bs'),
 (3,4,'cb'),
 (4,4,'ib');

--
-- Definition of table `cx`.`profileaccount`
--

DROP TABLE IF EXISTS `cx`.`profileaccount`;
CREATE TABLE  `cx`.`profileaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profileid` varchar(45) DEFAULT NULL,
  `entityaccountid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profileaccount_profile1` (`profileid`),
  KEY `fk_profileaccount_entityaccount1` (`entityaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`profileaccount`
--
INSERT INTO `cx`.`profileaccount` (`id`,`profileid`,`entityaccountid`) VALUES 
 (1,'4','1'),
 (2,'5','1'),
 (3,'5','2');

--
-- Definition of table `cx`.`profilebeneficiary`
--

DROP TABLE IF EXISTS `cx`.`profilebeneficiary`;
CREATE TABLE  `cx`.`profilebeneficiary` (
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

--
-- Dumping data for table `cx`.`profilebeneficiary`
--

--
-- Definition of table `cx`.`profilerole`
--

DROP TABLE IF EXISTS `cx`.`profilerole`;
CREATE TABLE  `cx`.`profilerole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profileid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `accesstype` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`profilerole`
--
INSERT INTO `cx`.`profilerole` (`id`,`profileid`,`roleid`,`accesstype`) VALUES 
 (1,5,2,'ib'),
 (2,4,2,'ib'),
 (3,4,1,'bs'),
 (4,5,3,'ib');

--
-- Definition of table `cx`.`profilescheduledpayments`
--

DROP TABLE IF EXISTS `cx`.`profilescheduledpayments`;
CREATE TABLE  `cx`.`profilescheduledpayments` (
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

--
-- Dumping data for table `cx`.`profilescheduledpayments`
--

--
-- Definition of table `cx`.`project`
--

DROP TABLE IF EXISTS `cx`.`project`;
CREATE TABLE  `cx`.`project` (
  `id` int(11) NOT NULL DEFAULT '0',
  `item` varchar(45) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`project`
--
INSERT INTO `cx`.`project` (`id`,`item`,`notes`) VALUES 
 (0,'fix descurity model','get the login using the role model security'),
 (1,'add a edit form for all static data','');

--
-- Definition of table `cx`.`relatedentity`
--

DROP TABLE IF EXISTS `cx`.`relatedentity`;
CREATE TABLE  `cx`.`relatedentity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relatedentity1` int(11) DEFAULT NULL,
  `relatedentity2` int(11) DEFAULT NULL,
  `relationshiptype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relatedentity_relationshiptype1` (`relationshiptype`),
  KEY `fk_relatedentity_entity1` (`relatedentity1`),
  KEY `fk_relatedentity_entity2` (`relatedentity2`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`relatedentity`
--
INSERT INTO `cx`.`relatedentity` (`id`,`relatedentity1`,`relatedentity2`,`relationshiptype`) VALUES 
 (1,1,2,1),
 (2,1,2,2);

--
-- Definition of table `cx`.`relationshiptype`
--

DROP TABLE IF EXISTS `cx`.`relationshiptype`;
CREATE TABLE  `cx`.`relationshiptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`relationshiptype`
--
INSERT INTO `cx`.`relationshiptype` (`id`,`description`) VALUES 
 (1,'Spouse of'),
 (2,'Child of'),
 (3,'Relation of'),
 (4,'Director of'),
 (5,'Employed by'),
 (6,'Trustee of'),
 (7,'Beneficiary of');

--
-- Definition of table `cx`.`role`
--

DROP TABLE IF EXISTS `cx`.`role`;
CREATE TABLE  `cx`.`role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`role`
--
INSERT INTO `cx`.`role` (`id`,`description`) VALUES 
 (1,'Administrator'),
 (2,'Internet Banking Client'),
 (3,'Restricted Internet Banking');

--
-- Definition of table `cx`.`rolefunction`
--

DROP TABLE IF EXISTS `cx`.`rolefunction`;
CREATE TABLE  `cx`.`rolefunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `functionid` int(11) NOT NULL,
  `allowdelete` tinyint(1) NOT NULL,
  `allownew` tinyint(1) NOT NULL,
  `allowedit` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profilefunction_profile1` (`roleid`),
  KEY `fk_profilefunction_functions1` (`functionid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`rolefunction`
--
INSERT INTO `cx`.`rolefunction` (`id`,`roleid`,`functionid`,`allowdelete`,`allownew`,`allowedit`) VALUES 
 (1,1,3,0,1,1),
 (2,2,2,0,0,0),
 (3,1,5,1,1,1),
 (6,2,5,0,0,0),
 (7,2,46,0,0,0),
 (8,3,46,0,0,0),
 (9,3,2,0,0,0);

--
-- Definition of table `cx`.`tbl_person`
--

DROP TABLE IF EXISTS `cx`.`tbl_person`;
CREATE TABLE  `cx`.`tbl_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`tbl_person`
--
INSERT INTO `cx`.`tbl_person` (`id`,`name`,`gender`,`dob`) VALUES 
 (12,'Marita','F','1966-09-10'),
 (11,'Jacky Chan','M','2011-09-07'),
 (10,'fgjk','F','2011-09-15'),
 (8,'name3-3','F','2011-09-09'),
 (9,'sdghsdggh','F','2011-09-01');

--
-- Definition of table `cx`.`transaction`
--

DROP TABLE IF EXISTS `cx`.`transaction`;
CREATE TABLE  `cx`.`transaction` (
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

--
-- Dumping data for table `cx`.`transaction`
--

--
-- Definition of table `cx`.`transactioncharge`
--

DROP TABLE IF EXISTS `cx`.`transactioncharge`;
CREATE TABLE  `cx`.`transactioncharge` (
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

--
-- Dumping data for table `cx`.`transactioncharge`
--

--
-- Definition of table `cx`.`transactioncode`
--

DROP TABLE IF EXISTS `cx`.`transactioncode`;
CREATE TABLE  `cx`.`transactioncode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debitindicator` tinyint(1) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `nonfinancial` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cx`.`transactioncode`
--

--
-- Definition of table `cx`.`transactionhistory`
--

DROP TABLE IF EXISTS `cx`.`transactionhistory`;
CREATE TABLE  `cx`.`transactionhistory` (
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

--
-- Dumping data for table `cx`.`transactionhistory`
--

--
-- Definition of procedure `cx`.`sp_getfunctions`
--

DROP PROCEDURE IF EXISTS `cx`.`sp_getfunctions`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `cx`.`sp_getfunctions`( IN accesstype VARCHAR(2), IN pid INTEGER )
BEGIN
SELECT DISTINCT f.display_name, f.uri, r.allowdelete, r.allownew, r.allowedit FROM 
rolefunction r JOIN function f  ON f.id = r.functionid JOIN profilerole pr ON pr.roleid = r.roleid 
WHERE pr.profileid = pid and pr.accesstype = accesstype;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
