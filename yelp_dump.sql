-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: yelp
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `_property`
--

DROP TABLE IF EXISTS `_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_property`
--

LOCK TABLES `_property` WRITE;
/*!40000 ALTER TABLE `_property` DISABLE KEYS */;
INSERT INTO `_property` VALUES (1,'Takes Reservations'),(2,'Offers Takeout'),(3,'No Delivery'),(4,'Accepts Credit Cards'),(5,'Vegan Options'),(6,'Many Vegetarian Options'),(7,'Outdoor Seating'),(8,'Touristy, Classy'),(9,'Moderate Noise'),(10,'Good for Groups'),(11,'Good For Kids'),(12,'Good for Lunch, Dinner'),(13,'Garage Parking, Validated Parking'),(14,'Bike Parking'),(15,'Waiter Service'),(16,'Free Wi-Fi'),(17,'Best nights on Friday, Saturday, Sunday'),(18,'Full Bar'),(19,'Dogs Allowed'),(20,'Wheelchair Accessible'),(21,'Open to All'),(22,'Sit-down dining'),(23,'Accepts Android Pay'),(24,'Accepts Apple Pay'),(25,'Accepts Cryptocurrency'),(26,'Not Good For Dancing'),(27,'No Pool Table'),(28,'No Happy Hour'),(29,'No Smoking'),(30,'No TV'),(31,'Afhalen mogelijk'),(32,'Geen reserveringen'),(33,'Geen bezorging'),(34,'Veganistische opties'),(35,'Terras'),(36,'Chique, Trendy, Vrijetijdskleding'),(37,'Rumoerig'),(38,'Geschikt voor groepen'),(39,'Geschikt voor kinderen'),(40,'Geschikt voor: Lunch, Diner'),(41,'Gratis wifi'),(42,'Alle soorten'),(43,'Tv'),(44,'Zonder zaalbediening'),(45,'Honden niet toegelaten'),(46,'Honden toegelaten'),(47,'Toegankelijk voor rolstoelgebruikers');
/*!40000 ALTER TABLE `_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `_id` varchar(50) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `reviews_count` int(11) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `about` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `_id` (`_id`),
  UNIQUE KEY `image` (`image`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,'Fog Harbor Fish House','https://www.yelp.com/biz/fog-harbor-fish-house-san-francisco-2','f-m7-hyFzkf0HSEeQ2s-9A','https://s3-media0.fl.yelpcdn.com/bphoto/M6WJatZbR7VahSi6HSgONg/l.jpg','(415) 421-2442',NULL,'San Francisco','US','94133','CA','The Embarcadero\nSte A-202',4,6223,'http://www.fogharbor.com','From the business\nSpecialties\nRanked Top 5 Most Popular Restaurants in SF by Yelp\nAward winning view of the Golden Gate Bridge, and Alcatraz!\nWaterfront outdoor seating available and open-air indoor dining room\nFirst restaurant on Fisherman\'s Wharf with 100% sustainable seafood.\nFresh fish delivered and hand cut daily.\nFresh sourdough bread baked every 30 minutes.\nNew England Clam Chowder made from scratch daily.\nVast California wine list and full bar with premium liquor.\nHistory\nEstablished in 2007.\nFog Harbor Fish House offers the quintessential San Francisco waterfront dining experience. Steeped in tradition, Fog Harbor Fish House was created by the original developers of PIER 39 and is filled with a quarter century of San Francisco history. Family-owned and operated, Fog Harbor Fish House is among the most favored restaurants on the Wharf where we pride ourselves in offering the freshest seafood in San Francisco..'),(2,'De Foodhallen','https://www.yelp.nl/biz/de-foodhallen-amsterdam','jsNbOS1qCIsSG7kvH7CBuQ','https://s3-media0.fl.yelpcdn.com/bphoto/7NWSNJ8EjQ7Irv_bx0iQHA/l.jpg','020-2181776',NULL,'Amsterdam','NL','1053 AT','NH','Bellamyplein 51',4.5,463,'https://www.foodhallen.nl/amsterdam',NULL),(3,'Van Dijk &amp; Ko','https://www.yelp.nl/biz/van-dijk-and-ko-amsterdam','Tf7nY8RfiWUjhLgd1GqODA','https://s3-media0.fl.yelpcdn.com/bphoto/JYNgb61pqsvjBD71fqVSJg/l.jpg','020-6841524',NULL,'Amsterdam','NL','1032 KJ','NH','Papaverweg 46',4,10,'http://www.vandijkenko.n','From the business\nSpecialties\nRuim 2500 m2 unieke vintage, antiek, brocante, industriële meubels en decorstukken enzo. Gehuisvest in een voormalige fabriekshal in Amsterdam-Noord op een steenworp afstand van de NDSM-werf..\nHistory\nEstablished in None.\nNone.'),(4,'Autoradam Amsterdam Nieuwpoortkade','https://www.yelp.nl/biz/autoradam-amsterdam-nieuwpoortkade-amsterdam','iA8hIzhSXh-pY41twsLjNg','https://s3-media0.fl.yelpcdn.com/bphoto/JuAY1VFvDEETCs8gHFdcJg/l.jpg','0318-80351212',NULL,'Amsterdam','NL','1055 RX','NH','Nieuwpoortkade 5',NULL,NULL,'http://www.autoradam.n','From the business\nSpecialties\nAutoradam beschikt over diverse moderne tankstations en autowasstraten maar u kunt bij Autoradam ook terecht voor autolease of een auto huren. Een modern autobedrijf dat al meer dan honderd jaar dezelfde filosofie hanteert: \'Uitstekende kwaliteit tegen de laagste prijzen..\nHistory\nEstablished in None.\nNone.');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_category`
--

DROP TABLE IF EXISTS `business_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_category` (
  `business_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  KEY `business_id` (`business_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `business_category_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
  CONSTRAINT `business_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_category`
--

LOCK TABLES `business_category` WRITE;
/*!40000 ALTER TABLE `business_category` DISABLE KEYS */;
INSERT INTO `business_category` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,2),(3,7),(3,9),(3,8),(3,6),(4,13),(4,10),(4,12),(4,11),(4,14);
/*!40000 ALTER TABLE `business_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_property`
--

DROP TABLE IF EXISTS `business_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_property` (
  `business_id` int(11) DEFAULT NULL,
  `_property` int(11) DEFAULT NULL,
  KEY `business_id` (`business_id`),
  KEY `_property` (`_property`),
  CONSTRAINT `business_property_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
  CONSTRAINT `business_property_ibfk_2` FOREIGN KEY (`_property`) REFERENCES `_property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_property`
--

LOCK TABLES `business_property` WRITE;
/*!40000 ALTER TABLE `business_property` DISABLE KEYS */;
INSERT INTO `business_property` VALUES (1,6),(1,11),(1,26),(1,9),(1,25),(1,27),(1,15),(1,21),(1,7),(1,5),(1,28),(1,22),(1,29),(1,8),(1,23),(1,20),(1,30),(1,10),(1,16),(1,24),(1,2),(1,14),(1,1),(1,3),(1,13),(1,4),(1,17),(1,19),(1,12),(1,18),(2,33),(2,45),(2,38),(2,40),(2,41),(2,39),(2,43),(2,31),(2,34),(2,36),(2,37),(2,44),(2,35),(2,42),(2,32),(3,46),(3,47);
/*!40000 ALTER TABLE `business_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'seafood'),(2,'restaurants'),(3,'bars'),(4,'nightlife'),(5,'food_court'),(6,'thrift_stores'),(7,'shopping'),(8,'antiques'),(9,'furniture'),(10,'carwash'),(11,'auto'),(12,'hotelstravel'),(13,'servicestations'),(14,'carrental');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mon` varchar(50) DEFAULT NULL,
  `tue` varchar(50) DEFAULT NULL,
  `wed` varchar(50) DEFAULT NULL,
  `thu` varchar(50) DEFAULT NULL,
  `fri` varchar(50) DEFAULT NULL,
  `sat` varchar(50) DEFAULT NULL,
  `sun` varchar(50) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_id` (`business_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'11:00 AM - 9:00 PM','11:00 AM - 9:00 PM','11:00 AM - 9:00 PM','11:00 AM - 9:00 PM','11:00 AM - 10:00 PM','10:30 AM - 10:00 PM','10:30 AM - 9:00 PM',1),(2,'11:00 AM - 11:30 PM','11:00 AM - 11:30 PM','11:00 AM - 11:30 PM','11:00 AM - 1:00 AM (volgende dag)','11:00 AM - 1:00 AM (volgende dag)','11:00 AM - 1:00 AM (volgende dag)','11:00 AM - 11:30 PM',2),(3,'Gesloten','10:00 AM - 6:00 PM','10:00 AM - 6:00 PM','10:00 AM - 6:00 PM','10:00 AM - 6:00 PM','10:00 AM - 6:00 PM','12:00 PM - 6:00 PM',3),(4,'24/24 open','24/24 open','24/24 open','24/24 open','24/24 open','24/24 open','24/24 open',4);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-17 20:59:01
