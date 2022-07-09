CREATE DATABASE  IF NOT EXISTS `fygodb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fygodb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: fygodb
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(45) NOT NULL,
  `address_line2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip` int(11) NOT NULL,
  `country` varchar(45) NOT NULL,
  `created_dt` date NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` date NOT NULL DEFAULT '0000-00-00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_nm` varchar(45) NOT NULL,
  `state_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_by` varchar(45) NOT NULL,
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_nm_UNIQUE` (`city_nm`),
  KEY `state_id_idx` (`state_id`),
  CONSTRAINT `state_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `complaint_raised_dt` timestamp NULL DEFAULT NULL,
  `customer_user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `merchant_store_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `cust_user_id_3_idx` (`customer_user_id`),
  KEY `order_id_3_idx` (`order_id`),
  KEY `merchant_store_id_3_idx` (`merchant_store_id`),
  CONSTRAINT `cust_user_id_3` FOREIGN KEY (`customer_user_id`) REFERENCES `system_user` (`system_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `merchant_store_id_3` FOREIGN KEY (`merchant_store_id`) REFERENCES `merchant_store` (`merchant_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_id_3` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_nm` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_nm_UNIQUE` (`country_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_delivery_address`
--

DROP TABLE IF EXISTS `customer_delivery_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_delivery_address` (
  `customer_delivery_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `use_default` int(11) DEFAULT NULL,
  `contact_no` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_delivery_address_id`),
  KEY `customer_user_id_idx` (`customer_user_id`),
  KEY `address_id_idx` (`address_id`),
  CONSTRAINT `address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_user_id` FOREIGN KEY (`customer_user_id`) REFERENCES `system_user` (`system_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_delivery_address`
--

LOCK TABLES `customer_delivery_address` WRITE;
/*!40000 ALTER TABLE `customer_delivery_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_delivery_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_refund_transaction`
--

DROP TABLE IF EXISTS `customer_refund_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_refund_transaction` (
  `refund_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `transaction_id` int(11) NOT NULL,
  `order_line_item_id` int(11) NOT NULL,
  `merchant_store_id` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `reason` varchar(155) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`refund_transaction_id`),
  KEY `transaction_id_idx` (`transaction_id`),
  KEY `order_line_item_id_idx` (`order_line_item_id`),
  KEY `merchant_store_id_idx` (`merchant_store_id`),
  CONSTRAINT `merchant_store_id_5` FOREIGN KEY (`merchant_store_id`) REFERENCES `merchant_store` (`merchant_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_line_item_id_5` FOREIGN KEY (`order_line_item_id`) REFERENCES `order_line_item` (`order_line_item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_id_5` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_refund_transaction`
--

LOCK TABLES `customer_refund_transaction` WRITE;
/*!40000 ALTER TABLE `customer_refund_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_refund_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_type`
--

DROP TABLE IF EXISTS `delivery_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_type` (
  `delivery_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_type_nm` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(20) NOT NULL,
  PRIMARY KEY (`delivery_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_type`
--

LOCK TABLES `delivery_type` WRITE;
/*!40000 ALTER TABLE `delivery_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_type`
--

DROP TABLE IF EXISTS `discount_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_type` (
  `discount_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_type_nm` varchar(45) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`discount_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_type`
--

LOCK TABLES `discount_type` WRITE;
/*!40000 ALTER TABLE `discount_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_type`
--

DROP TABLE IF EXISTS `identity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity_type` (
  `identity_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_type_nm` varchar(25) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(25) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(25) NOT NULL,
  PRIMARY KEY (`identity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_type`
--

LOCK TABLES `identity_type` WRITE;
/*!40000 ALTER TABLE `identity_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_nm` varchar(45) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant` (
  `merchant_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_nm` varchar(45) NOT NULL,
  `license_no` varchar(45) NOT NULL,
  `license_issued_authority` varchar(45) NOT NULL,
  `merchant_license_issued_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gstn_no` varchar(45) NOT NULL,
  `business_pancard_no` varchar(45) NOT NULL,
  `director_nm` varchar(45) NOT NULL,
  `merchant_primary_contact_address_id` int(11) NOT NULL,
  `merchant_secondary_contact_address_id` int(11) DEFAULT NULL,
  `primary_contact_no` varchar(20) NOT NULL,
  `secondary_contact_no` varchar(20) DEFAULT NULL,
  `primary_email_address` varchar(45) NOT NULL,
  `secondary_email_address` varchar(45) DEFAULT NULL,
  `unique_identity_no` varchar(45) NOT NULL,
  `identity_type_id` int(11) NOT NULL,
  `profile_photo` blob NOT NULL,
  `photo_nm` varchar(245) DEFAULT NULL,
  `file_type` varchar(7) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`merchant_user_id`),
  KEY `merchant_primary_contac_addresst_id_idx` (`merchant_primary_contact_address_id`),
  KEY `merchant_secondary_contact_address_id_idx` (`merchant_secondary_contact_address_id`),
  KEY `identity_type_id_idx` (`identity_type_id`),
  CONSTRAINT `identity_type_id` FOREIGN KEY (`identity_type_id`) REFERENCES `identity_type` (`identity_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `merchant_primary_contac_addresst_id` FOREIGN KEY (`merchant_primary_contact_address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `merchant_secondary_contact_address_id` FOREIGN KEY (`merchant_secondary_contact_address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `merchant_user_id` FOREIGN KEY (`merchant_user_id`) REFERENCES `system_user` (`system_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_enquiry`
--

DROP TABLE IF EXISTS `merchant_enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_enquiry` (
  `merchant_enquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_nm` varchar(45) NOT NULL,
  `established_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `contact_person_nm` varchar(30) NOT NULL,
  `primary_contact_no` varchar(45) NOT NULL,
  `secondary_contact_no` varchar(45) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `zip_circle_id` int(11) NOT NULL,
  `sales_per_day` varchar(30) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `deffered_reason` varchar(100) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  `primary_email_address` varchar(45) NOT NULL,
  `secondary_email_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`merchant_enquiry_id`),
  KEY `zip_circle_id_idx` (`zip_circle_id`),
  KEY `business_add_id_idx` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_enquiry`
--

LOCK TABLES `merchant_enquiry` WRITE;
/*!40000 ALTER TABLE `merchant_enquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_enquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_rating`
--

DROP TABLE IF EXISTS `merchant_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_rating` (
  `merchant_rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `merchant_store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `created_dt` timestamp NULL DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `last_modified_dt` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`merchant_rating_id`),
  KEY `customer_id_1_idx` (`customer_id`),
  KEY `merchant_store_id_12_idx` (`merchant_store_id`),
  KEY `product_id12_idx` (`product_id`),
  CONSTRAINT `customer_id_1` FOREIGN KEY (`customer_id`) REFERENCES `system_user` (`system_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `merchant_store_id_12` FOREIGN KEY (`merchant_store_id`) REFERENCES `merchant_store` (`merchant_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_id12` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_rating`
--

LOCK TABLES `merchant_rating` WRITE;
/*!40000 ALTER TABLE `merchant_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_store`
--

DROP TABLE IF EXISTS `merchant_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_store` (
  `merchant_store_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_user_id` int(11) NOT NULL,
  `store_nm` varchar(50) NOT NULL,
  `store_contact_person_nm` varchar(25) NOT NULL,
  `store_contact_person_no` varchar(25) NOT NULL,
  `store_contact_person_email_address` varchar(45) NOT NULL,
  `store_primary_contact_no` varchar(15) NOT NULL,
  `store_secondary_contact_no` varchar(15) DEFAULT NULL,
  `store_address_id` int(11) NOT NULL,
  `store_available_status` varchar(25) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `created_by` varchar(25) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(25) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`merchant_store_id`),
  KEY `merchant_user_id_idx` (`merchant_user_id`),
  KEY `store_address_id_idx` (`store_address_id`),
  CONSTRAINT `merchant_store_user_id` FOREIGN KEY (`merchant_user_id`) REFERENCES `merchant` (`merchant_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `store_address_id` FOREIGN KEY (`store_address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_store`
--

LOCK TABLES `merchant_store` WRITE;
/*!40000 ALTER TABLE `merchant_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_store_image`
--

DROP TABLE IF EXISTS `merchant_store_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_store_image` (
  `merchant_store_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_store_id` int(11) NOT NULL,
  `image_data` blob NOT NULL,
  `image_file_nm` varchar(45) NOT NULL,
  `image_file_type` varchar(10) NOT NULL,
  `use_cover_image` int(1) DEFAULT NULL,
  `created_by` varchar(45) NOT NULL,
  `created-dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`merchant_store_image_id`),
  KEY `merchant_store_id_idx` (`merchant_store_id`),
  CONSTRAINT `merchant_store_id_4` FOREIGN KEY (`merchant_store_id`) REFERENCES `merchant_store` (`merchant_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_store_image`
--

LOCK TABLES `merchant_store_image` WRITE;
/*!40000 ALTER TABLE `merchant_store_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_store_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_store_payment`
--

DROP TABLE IF EXISTS `merchant_store_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_store_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_initiated_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_amount` double NOT NULL,
  `status` varchar(45) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_store_payment`
--

LOCK TABLES `merchant_store_payment` WRITE;
/*!40000 ALTER TABLE `merchant_store_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_store_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_store_payment_order_line_items`
--

DROP TABLE IF EXISTS `merchant_store_payment_order_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_store_payment_order_line_items` (
  `merchant_store_payment_order_line_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_line_item_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`merchant_store_payment_order_line_items_id`),
  KEY `payment_id_idx` (`payment_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `order_line_item_id_idx` (`order_line_item_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_line_item_id` FOREIGN KEY (`order_line_item_id`) REFERENCES `order_line_item` (`order_line_item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `payment_id` FOREIGN KEY (`payment_id`) REFERENCES `merchant_store_payment` (`payment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_store_payment_order_line_items`
--

LOCK TABLES `merchant_store_payment_order_line_items` WRITE;
/*!40000 ALTER TABLE `merchant_store_payment_order_line_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_store_payment_order_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_store_product`
--

DROP TABLE IF EXISTS `merchant_store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_store_product` (
  `merchant_store_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `available_quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `discount` int(3) DEFAULT NULL,
  `discount_type_id` int(11) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`merchant_store_product_id`),
  KEY `merchant_store_id1_idx` (`merchant_store_id`),
  KEY `product_id1_idx` (`product_id`),
  KEY `discount_type_id_1_idx` (`discount_type_id`),
  CONSTRAINT `discount_type_id_1` FOREIGN KEY (`discount_type_id`) REFERENCES `discount_type` (`discount_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `merchant_store_id1` FOREIGN KEY (`merchant_store_id`) REFERENCES `merchant_store` (`merchant_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_id1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_store_product`
--

LOCK TABLES `merchant_store_product` WRITE;
/*!40000 ALTER TABLE `merchant_store_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_store_representative`
--

DROP TABLE IF EXISTS `merchant_store_representative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_store_representative` (
  `merchant_store_representative_id` int(11) NOT NULL,
  `representative_name` varchar(45) NOT NULL,
  `representative_address_id` int(11) NOT NULL,
  `merchant_store_id` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`merchant_store_representative_id`),
  KEY `representative_address_id_idx` (`representative_address_id`),
  KEY `merchant_store_id_idx` (`merchant_store_id`),
  CONSTRAINT `merchant_store_id` FOREIGN KEY (`merchant_store_id`) REFERENCES `merchant_store` (`merchant_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `merchant_store_representative_id` FOREIGN KEY (`merchant_store_representative_id`) REFERENCES `system_user` (`system_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `representative_address_id` FOREIGN KEY (`representative_address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_store_representative`
--

LOCK TABLES `merchant_store_representative` WRITE;
/*!40000 ALTER TABLE `merchant_store_representative` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_store_representative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_store_zip_location`
--

DROP TABLE IF EXISTS `merchant_store_zip_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_store_zip_location` (
  `merchant_store_zip_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_store_id` int(11) NOT NULL,
  `service_circle_zip_location_id` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`merchant_store_zip_location_id`),
  KEY `merchant_store_id_2_idx` (`merchant_store_id`),
  KEY `service_circle_zip_location_id_1_idx` (`service_circle_zip_location_id`),
  CONSTRAINT `merchant_store_id_2` FOREIGN KEY (`merchant_store_id`) REFERENCES `merchant_store` (`merchant_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `service_circle_zip_location_id_1` FOREIGN KEY (`service_circle_zip_location_id`) REFERENCES `service_circle_zip_location` (`service_circle_zip_location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_store_zip_location`
--

LOCK TABLES `merchant_store_zip_location` WRITE;
/*!40000 ALTER TABLE `merchant_store_zip_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_store_zip_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_terms_and_conditions`
--

DROP TABLE IF EXISTS `merchant_terms_and_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_terms_and_conditions` (
  `merchant_terms_and_conditions_id` int(11) NOT NULL AUTO_INCREMENT,
  `annual_charges_per_branch` float NOT NULL,
  `onboarding_charges_per_branch` float NOT NULL,
  `min_commision_charge_per_order` float NOT NULL,
  `percentage_of_commision_per_order` float NOT NULL,
  `payment_settlement_cycle_id` int(11) NOT NULL,
  `penality_charges_for_order_cancellation` float NOT NULL,
  `effective_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `merchant_id` int(11) NOT NULL,
  `terms_and_conditions_accepted_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(45) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`merchant_terms_and_conditions_id`),
  KEY `merchant_settlement_cycle_id_idx` (`payment_settlement_cycle_id`),
  KEY `merchant_id_idx` (`merchant_id`),
  CONSTRAINT `merchant_id` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `merchant_settlement_cycle_id` FOREIGN KEY (`payment_settlement_cycle_id`) REFERENCES `payment_cycle` (`payment_cycle_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_terms_and_conditions`
--

LOCK TABLES `merchant_terms_and_conditions` WRITE;
/*!40000 ALTER TABLE `merchant_terms_and_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_terms_and_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `ordered_dt` timestamp NULL DEFAULT NULL,
  `customer_user_id` int(11) NOT NULL,
  `delivery_address_id` int(11) NOT NULL,
  `delivery_type_id` int(11) NOT NULL,
  `schedule_delivery_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(15) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_user_id_idx` (`customer_user_id`),
  KEY `delivery_address_id_idx` (`delivery_address_id`),
  KEY `delivery_type_id_idx` (`delivery_type_id`),
  CONSTRAINT `cust_user_id` FOREIGN KEY (`customer_user_id`) REFERENCES `system_user` (`system_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `del_address_id` FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `del_type_id` FOREIGN KEY (`delivery_type_id`) REFERENCES `delivery_type` (`delivery_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_cancellation_or_refund`
--

DROP TABLE IF EXISTS `order_cancellation_or_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_cancellation_or_refund` (
  `order_cancellation_or_refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `cancellation_or_refund_requested_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_id` int(11) NOT NULL,
  `order_line_item_id` int(11) NOT NULL,
  `cancelled_or_refund_customer_user_id` int(11) NOT NULL,
  `cancelled_or_refund_merchant_representative_id` int(11) NOT NULL,
  `reason_for_cancellation_or_refund` varchar(100) NOT NULL,
  `cancellation_or_refund` varchar(20) DEFAULT NULL,
  `status_changed_by_csr_id` int(11) NOT NULL,
  `status_chnaged_by_merchant_representative_id` int(11) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`order_cancellation_or_refund_id`),
  KEY `status_change_by_merchant_repre_id_6_idx` (`status_chnaged_by_merchant_representative_id`),
  KEY `order_id_6` (`order_id`),
  KEY `order_line_item_id_6` (`order_line_item_id`),
  KEY `cancel_refund_user_id_6` (`cancelled_or_refund_customer_user_id`),
  KEY `representative_id_6` (`cancelled_or_refund_merchant_representative_id`),
  KEY `status_change_by_csr_id_6` (`status_changed_by_csr_id`),
  CONSTRAINT `cancel_refund_user_id_6` FOREIGN KEY (`cancelled_or_refund_customer_user_id`) REFERENCES `system_user` (`system_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_id_6` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_line_item_id_6` FOREIGN KEY (`order_line_item_id`) REFERENCES `order_line_item` (`order_line_item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `representative_id_6` FOREIGN KEY (`cancelled_or_refund_merchant_representative_id`) REFERENCES `system_user` (`system_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `status_change_by_csr_id_6` FOREIGN KEY (`status_changed_by_csr_id`) REFERENCES `system_user` (`system_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `status_change_represe_id_6` FOREIGN KEY (`status_chnaged_by_merchant_representative_id`) REFERENCES `system_user` (`system_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_cancellation_or_refund`
--

LOCK TABLES `order_cancellation_or_refund` WRITE;
/*!40000 ALTER TABLE `order_cancellation_or_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_cancellation_or_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_item`
--

DROP TABLE IF EXISTS `order_line_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line_item` (
  `order_line_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `merchant_store_id` int(11) NOT NULL,
  `units` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `order_line_item_received_person` varchar(45) DEFAULT NULL,
  `order_line_item_received_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`order_line_item_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `product_id_idx` (`product_id`),
  KEY `merchant_store_id_idx` (`merchant_store_id`),
  CONSTRAINT `mer_store_id` FOREIGN KEY (`merchant_store_id`) REFERENCES `merchant_store` (`merchant_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ord_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prod_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_item`
--

LOCK TABLES `order_line_item` WRITE;
/*!40000 ALTER TABLE `order_line_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_cycle`
--

DROP TABLE IF EXISTS `payment_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_cycle` (
  `payment_cycle_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_cycle_nm` varchar(45) NOT NULL,
  `days` int(11) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_cycle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_cycle`
--

LOCK TABLES `payment_cycle` WRITE;
/*!40000 ALTER TABLE `payment_cycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_info`
--

DROP TABLE IF EXISTS `payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_info` (
  `payment_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_transaction_id` int(11) NOT NULL,
  `bank_tx_id` int(11) NOT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `gateway_nm` varchar(50) NOT NULL,
  `response_msg` varchar(45) DEFAULT NULL,
  `payment_mode` varchar(45) NOT NULL,
  `mid` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `response_code` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`payment_info_id`),
  KEY `transaction_id_idx` (`transaction_id`),
  KEY `bank_tx_id_idx` (`bank_tx_id`),
  KEY `partner_tx_id_idx` (`partner_transaction_id`),
  KEY `merchant_id_fk_idx` (`mid`),
  CONSTRAINT `bank_tx_id` FOREIGN KEY (`bank_tx_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `partner_tx_id` FOREIGN KEY (`partner_transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_info`
--

LOCK TABLES `payment_info` WRITE;
/*!40000 ALTER TABLE `payment_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege_nm` varchar(30) NOT NULL,
  `privilege_cd` varchar(10) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(30) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(30) NOT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `dimension` varchar(45) DEFAULT NULL,
  `units` varchar(45) NOT NULL,
  `units_type_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_by` varchar(45) NOT NULL,
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modifed_by` varchar(45) NOT NULL,
  `last_modifed_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`product_id`),
  KEY `manufacturer_id_idx` (`manufacturer_id`),
  KEY `product_category_id_idx` (`product_category_id`),
  KEY `units_type_id_idx` (`units_type_id`),
  CONSTRAINT `manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`manufacturer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_category_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `units_type_id` FOREIGN KEY (`units_type_id`) REFERENCES `units_type` (`units_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_nm` varchar(45) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last-modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_image` blob NOT NULL,
  `product_image_file_nm` varchar(30) NOT NULL,
  `product_image_file_type` varchar(10) NOT NULL,
  `is_primary` tinyint(4) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(25) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(25) NOT NULL,
  PRIMARY KEY (`product_image_id`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_circle_zip_location`
--

DROP TABLE IF EXISTS `service_circle_zip_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_circle_zip_location` (
  `service_circle_zip_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `zip_circle_id` int(11) NOT NULL,
  `locality_nm` varchar(35) NOT NULL,
  `status` varchar(25) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(25) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(25) NOT NULL,
  `zip_code` int(6) DEFAULT NULL,
  PRIMARY KEY (`service_circle_zip_location_id`),
  KEY `zip_circle_id_idx` (`zip_circle_id`),
  CONSTRAINT `zip_circle_id` FOREIGN KEY (`zip_circle_id`) REFERENCES `zip_circle` (`zip_circle_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_circle_zip_location`
--

LOCK TABLES `service_circle_zip_location` WRITE;
/*!40000 ALTER TABLE `service_circle_zip_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_circle_zip_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_nm` varchar(45) NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `state_nm_UNIQUE` (`state_nm`),
  KEY `country_id_idx` (`country_id`),
  CONSTRAINT `country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_representative_privilige`
--

DROP TABLE IF EXISTS `store_representative_privilige`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_representative_privilige` (
  `store_representative_privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_store_representative_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`store_representative_privilege_id`),
  KEY `merchant_store_representative_id_idx` (`merchant_store_representative_id`),
  KEY `privilege_id_idx` (`privilege_id`),
  CONSTRAINT `merchant_store_represent_id` FOREIGN KEY (`merchant_store_representative_id`) REFERENCES `merchant_store_representative` (`merchant_store_representative_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `privilege_id` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`privilege_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_representative_privilige`
--

LOCK TABLES `store_representative_privilige` WRITE;
/*!40000 ALTER TABLE `store_representative_privilige` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_representative_privilige` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_user` (
  `system_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(45) NOT NULL,
  `mobile_nbr` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `email_address_verification_code` varchar(45) DEFAULT NULL,
  `mobile_nbr_otp_code` varchar(45) DEFAULT NULL,
  `mobile_nbr_otp_code_generated_dt` timestamp NULL DEFAULT NULL,
  `is_email_address_verified` tinyint(4) DEFAULT NULL,
  `is_mobile_nbr_verified` tinyint(4) DEFAULT NULL,
  `email_address_verified_dt` timestamp NULL DEFAULT NULL,
  `mobile_nbr_verified_dt` timestamp NULL DEFAULT NULL,
  `last_logged_in_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(45) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last-modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`system_user_id`),
  UNIQUE KEY `email_address_UNIQUE` (`email_address`),
  UNIQUE KEY `mobile_nbr_UNIQUE` (`mobile_nbr`),
  KEY `user_role_id_idx` (`user_role_id`),
  CONSTRAINT `user_role_id` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(45) NOT NULL,
  `order_id` int(11) NOT NULL,
  `transaction_type_id` int(11) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `transaction_type_id_idx` (`transaction_type_id`),
  CONSTRAINT `order_id_7` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_type_id_7` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`transaction_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_type` (
  `transaction_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_type_nm` varchar(45) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`transaction_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units_type`
--

DROP TABLE IF EXISTS `units_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units_type` (
  `units_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modifed_by` varchar(45) NOT NULL,
  `last_modifed_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`units_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units_type`
--

LOCK TABLES `units_type` WRITE;
/*!40000 ALTER TABLE `units_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `units_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_nm` varchar(45) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `created_by` varchar(45) NOT NULL,
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `user_role_nm_UNIQUE` (`user_role_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zip_circle`
--

DROP TABLE IF EXISTS `zip_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zip_circle` (
  `zip_circle_id` int(11) NOT NULL AUTO_INCREMENT,
  `circle_nm` varchar(45) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` varchar(45) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`zip_circle_id`),
  KEY `city_id_idx` (`city_id`),
  CONSTRAINT `city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zip_circle`
--

LOCK TABLES `zip_circle` WRITE;
/*!40000 ALTER TABLE `zip_circle` DISABLE KEYS */;
/*!40000 ALTER TABLE `zip_circle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-11 13:12:02
