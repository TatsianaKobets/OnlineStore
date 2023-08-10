-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: pazl
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(45) DEFAULT NULL,
  `CATEGORY_DESC` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (6,'Услуги','широкий спектр услуг'),(7,'Товары','Вы можете у нас приобрести');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict_items_state`
--

DROP TABLE IF EXISTS `dict_items_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict_items_state` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_items_state`
--

LOCK TABLES `dict_items_state` WRITE;
/*!40000 ALTER TABLE `dict_items_state` DISABLE KEYS */;
INSERT INTO `dict_items_state` VALUES (3,'В наличии',NULL),(4,'Нет на складе',NULL);
/*!40000 ALTER TABLE `dict_items_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict_order_status`
--

DROP TABLE IF EXISTS `dict_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict_order_status` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `STATUS_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_order_status`
--

LOCK TABLES `dict_order_status` WRITE;
/*!40000 ALTER TABLE `dict_order_status` DISABLE KEYS */;
INSERT INTO `dict_order_status` VALUES (1,'В корзине'),(2,'Создан'),(3,'Подтвержден'),(4,'Доставлен'),(5,'Отменен');
/*!40000 ALTER TABLE `dict_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict_payment_types`
--

DROP TABLE IF EXISTS `dict_payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict_payment_types` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_payment_types`
--

LOCK TABLES `dict_payment_types` WRITE;
/*!40000 ALTER TABLE `dict_payment_types` DISABLE KEYS */;
INSERT INTO `dict_payment_types` VALUES (1,'cash','Наличные деньги'),(2,'credit_card','Кредитная карта'),(3,'cashless','Безналичный расчет');
/*!40000 ALTER TABLE `dict_payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict_users_state`
--

DROP TABLE IF EXISTS `dict_users_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict_users_state` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_users_state`
--

LOCK TABLES `dict_users_state` WRITE;
/*!40000 ALTER TABLE `dict_users_state` DISABLE KEYS */;
INSERT INTO `dict_users_state` VALUES (1,'created','Создан'),(2,'active','Активный'),(3,'blocked','Заблокирован'),(4,'deleted','Удален');
/*!40000 ALTER TABLE `dict_users_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ITEMS_ID` int DEFAULT NULL,
  `IMG` blob,
  PRIMARY KEY (`ID`),
  KEY `images_items_id_idx` (`ITEMS_ID`),
  CONSTRAINT `images_items_id` FOREIGN KEY (`ITEMS_ID`) REFERENCES `items` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_reviews`
--

DROP TABLE IF EXISTS `item_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_reviews` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `ITEM_ID` int DEFAULT NULL,
  `RATE` int DEFAULT NULL,
  `TEXT` varchar(1024) DEFAULT NULL,
  `EVENT_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `fk_user_id_idx` (`USER_ID`),
  KEY `fk_reviews_item_id_idx` (`ITEM_ID`),
  CONSTRAINT `fk_reviews_item_id` FOREIGN KEY (`ITEM_ID`) REFERENCES `items` (`ID`),
  CONSTRAINT `fk_rewiews_user_id` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_reviews`
--

LOCK TABLES `item_reviews` WRITE;
/*!40000 ALTER TABLE `item_reviews` DISABLE KEYS */;
INSERT INTO `item_reviews` VALUES (16,84,59,5,'Супер вкусно','2021-05-13 16:02:15'),(17,76,60,4,'Без сахара','2021-05-13 16:02:15'),(18,85,54,5,'Понравился','2021-05-13 16:02:15'),(19,85,54,2,'','2021-05-26 20:34:43'),(20,92,53,5,'Замечательно провели время!','2021-05-26 21:36:33'),(21,85,59,3,'','2021-08-09 01:38:05'),(22,85,53,4,'В воскресенье много людей. Шумно. ','2021-09-10 07:31:33');
/*!40000 ALTER TABLE `item_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CATEGORY` int DEFAULT NULL,
  `NAME_SHORT` varchar(45) DEFAULT NULL,
  `NAME_FULL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `MANUFACTURER` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `IMAGE_ID` int DEFAULT NULL,
  `STATE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_categoty_id_idx` (`ID_CATEGORY`),
  KEY `fk_items_state_id_idx` (`STATE_ID`),
  CONSTRAINT `fk_categoty_id` FOREIGN KEY (`ID_CATEGORY`) REFERENCES `category` (`ID`),
  CONSTRAINT `fk_items_state_id` FOREIGN KEY (`STATE_ID`) REFERENCES `dict_items_state` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (53,6,'Игровая комната','Аренда игровой комнаты','Почасовая аренда, до 20 детей',NULL,50.00,NULL,3),(54,6,'Фотограф','Услуги фотографа','Почасовая оплата',NULL,30.00,NULL,3),(55,6,'Аниматор','Услуги аниматора','Почасовая оплата',NULL,50.00,NULL,3),(56,6,'\"Мама на час\"','Услуги няни','Почасовая оплата',NULL,25.00,NULL,3),(57,7,'Набор для проведения праздника','Набор для проведения праздника','Набор для проведения праздника станет отличным украшением торжества! В нём уже есть всё, что нужно, чтобы красочно отметить это важное событие)',NULL,10.00,NULL,3),(58,7,'Набор праздничной одноразовой посуды','Набор праздничной одноразовой посуды','В ассортименте',NULL,5.00,NULL,3),(59,7,'Торт','Праздничный торт','Под заказ',NULL,10.00,NULL,4),(60,7,'Сок','Сок Беллакт','В ассортименте',NULL,1.00,NULL,3),(61,6,'Аниматор','Услуги аниматора','Почасовая оплата','',50.00,NULL,3);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int DEFAULT NULL,
  `ITEM_ID` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `ITEM_COST` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_det_item_id_idx` (`ITEM_ID`),
  KEY `order_det_order_id_idx` (`ORDER_ID`),
  CONSTRAINT `order_det_item_id` FOREIGN KEY (`ITEM_ID`) REFERENCES `items` (`ID`),
  CONSTRAINT `order_det_order_id` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,41,53,2,100.00),(2,41,53,2,100.00),(3,45,60,1,1.00),(4,45,55,2,100.00),(5,45,55,2,100.00),(6,45,55,2,100.00),(7,41,56,2,50.00),(8,50,58,1,5.00),(9,51,59,1,10.00),(10,51,58,1,5.00),(11,51,58,1,5.00),(12,51,58,1,5.00),(13,52,53,1,50.00),(14,53,60,1,1.00),(15,55,55,1,50.00),(16,55,55,1,50.00),(17,55,55,1,50.00),(18,55,53,1,50.00),(19,56,53,1,50.00),(20,56,53,1,50.00),(23,58,60,1,1.00),(24,59,60,1,1.00),(25,59,53,1,50.00),(26,60,53,1,50.00);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_history`
--

DROP TABLE IF EXISTS `order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_history` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EVENT_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `ORDER_ID` int DEFAULT NULL,
  `ORDER_STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_hst_order_id_idx` (`ORDER_ID`),
  KEY `fk_hst_status_id_idx` (`ORDER_STATUS`),
  CONSTRAINT `fk_hst_order_id` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ID`),
  CONSTRAINT `fk_hst_status_id` FOREIGN KEY (`ORDER_STATUS`) REFERENCES `dict_order_status` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_history`
--

LOCK TABLES `order_status_history` WRITE;
/*!40000 ALTER TABLE `order_status_history` DISABLE KEYS */;
INSERT INTO `order_status_history` VALUES (87,'2021-08-09 00:43:41',49,1),(88,'2021-08-09 01:14:38',49,2),(89,'2021-08-09 01:16:01',49,2),(90,'2021-08-09 01:36:03',50,1),(91,'2021-08-09 03:40:42',51,1),(92,'2021-08-09 04:08:31',50,2),(93,'2021-08-09 05:03:07',52,1),(94,'2021-08-09 05:03:11',52,2),(95,'2021-08-09 05:07:28',53,1),(96,'2021-08-09 05:07:34',53,2),(97,'2021-08-16 20:16:40',54,1),(98,'2021-09-09 10:13:57',55,1),(99,'2021-09-10 07:40:27',55,2),(100,'2021-09-16 21:55:30',56,1),(101,'2021-10-03 13:08:18',57,1),(102,'2021-10-04 17:06:13',58,1),(103,'2021-10-04 17:06:13',59,1),(104,'2021-10-05 03:14:19',59,2),(105,'2023-08-10 11:44:11',60,1);
/*!40000 ALTER TABLE `order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `START_DATE` datetime DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `PAYMENT_TYPE_ID` int DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  `DELIVERY_ADDRESS` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_user_id_idx` (`USER_ID`),
  KEY `fk_payment_type_id_idx` (`PAYMENT_TYPE_ID`),
  CONSTRAINT `fk_orders_payment_type_id` FOREIGN KEY (`PAYMENT_TYPE_ID`) REFERENCES `dict_payment_types` (`ID`),
  CONSTRAINT `fk_orders_user_id` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (40,NULL,85,1,NULL,'Gomel'),(41,'2021-07-20 00:00:00',85,NULL,NULL,NULL),(42,'2021-07-20 00:00:00',85,NULL,NULL,NULL),(43,'2021-07-20 00:00:00',85,NULL,NULL,NULL),(44,'2021-07-20 00:00:00',85,NULL,NULL,NULL),(45,'2021-07-20 00:00:00',85,NULL,NULL,NULL),(49,'2021-08-09 00:43:41',85,1,'','Мозырь'),(50,'2021-08-09 01:36:03',85,1,'',''),(51,'2021-08-09 03:40:42',94,NULL,NULL,NULL),(52,'2021-08-09 05:03:07',85,1,'',''),(53,'2021-08-09 05:07:28',85,1,'',''),(54,'2021-08-16 20:16:40',85,NULL,NULL,NULL),(55,'2021-09-09 10:13:57',85,1,'',''),(56,'2021-09-16 21:55:30',86,NULL,NULL,NULL),(57,'2021-10-03 13:08:18',85,NULL,NULL,NULL),(58,'2021-10-04 17:06:12',84,NULL,NULL,NULL),(59,'2021-10-04 17:06:13',84,1,'',''),(60,'2023-08-10 11:44:11',104,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'user'),(3,'employe');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_item_id_idx` (`ITEM_ID`),
  CONSTRAINT `fk_item_id` FOREIGN KEY (`ITEM_ID`) REFERENCES `items` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (51,53,2),(52,55,9),(53,54,2),(54,60,20),(55,59,1),(56,58,4),(57,56,22),(58,57,2),(59,61,1);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `SURNAME` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `STATE_ID` int DEFAULT NULL,
  `ROLE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGIN_UNIQUE` (`LOGIN`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`),
  KEY `fk_users_status_id_idx` (`STATE_ID`),
  KEY `fk_users_role_id_idx` (`ROLE_ID`),
  CONSTRAINT `fk_users_role_id` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ID`),
  CONSTRAINT `fk_users_status_id` FOREIGN KEY (`STATE_ID`) REFERENCES `dict_users_state` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (76,'test_user','1','t','t','kobets170916@gmail.com',NULL,NULL,NULL,NULL),(84,'Tania','Tania','Tania','Tania','Tania@gmail.com',NULL,NULL,NULL,NULL),(85,'1','1','1','1','1@gmail.com',NULL,NULL,NULL,1),(86,'2','2','2','2','2@yandex.ru',NULL,NULL,NULL,NULL),(88,'3','3','3','3','3@yandex.ru',NULL,NULL,NULL,NULL),(89,'5','5','5','5','5@gmail.com',NULL,NULL,NULL,NULL),(90,'6','6','6','6','6@gmail.com',NULL,NULL,NULL,NULL),(91,'4','4','4','4','4@gmail.com',NULL,NULL,NULL,NULL),(92,'Sergey','Sergey','Sergey','Sergey','Sergey@gmail.com',NULL,NULL,NULL,NULL),(93,'Kobets','Kobets','K','','',NULL,NULL,NULL,NULL),(94,'User','User','User','User','User@gmail.com',NULL,NULL,NULL,NULL),(95,'Admin','1111','Admin','Admin','Admin@yandex.ru',NULL,NULL,NULL,1),(99,'u','u','u','u','u@gmail.com',NULL,NULL,NULL,NULL),(102,'Tatsiana','Tatsiana','Tatsiana','Kobets','kobets.tatsiana@yandex.ru',NULL,NULL,NULL,NULL),(103,'11','11','11','11','11@mail.ru',NULL,NULL,NULL,NULL),(104,'+375296366570','1111','Tatsiana','Kobets','tatsiana.kobets@yandex.ru',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pazl'
--

--
-- Dumping routines for database 'pazl'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_new_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_item`(
IN id_category VARCHAR(255), 
	IN name_short VARCHAR(45), 
	IN name_full VARCHAR(255), 
	IN description VARCHAR(1024), 
	IN manufacturer VARCHAR(255), 
	IN price decimal(10,2), 
	IN state_id int,
    IN count int,
    OUT item_id INT)
BEGIN

	DECLARE l_item_id INT DEFAULT 0;
    
	START TRANSACTION;
    
    insert into pazl.items(id_category, name_short, name_full, description, manufacturer, price, state_id)
        VALUES(id_category,name_short,name_full,description,manufacturer,price,state_id);
    
    -- get item id
    SET l_item_id = LAST_INSERT_ID();
    
     IF l_item_id > 0 THEN
		insert into pazl.storage(item_id, count) values(l_item_id, count);
        -- commit
        COMMIT;
        SET item_id = l_item_id;
     ELSE
		ROLLBACK;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `confirm_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `confirm_order`(
IN payment_type VARCHAR(45), 
	IN comment VARCHAR(526), 
	IN address VARCHAR(526), 
	IN order_id INT)
BEGIN
 DECLARE exit_loop BOOLEAN DEFAULT FALSE;
    DECLARE i, c INT;
	DECLARE v_payment_type_id INT DEFAULT 1;
	DECLARE v_order_status_id INT DEFAULT 2;
    
    DECLARE employee_cursor CURSOR FOR SELECT od.item_id, od.COUNT FROM pazl.order_details od where od.order_id = order_id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
    
   START TRANSACTION;
	SELECT pt.id into v_payment_type_id FROM pazl.dict_payment_types pt where pt.DESCRIPTION = '';
    
	update pazl.orders ord set ord.payment_type_id = v_payment_type_id, ord.comment = comment, ord.delivery_address = address
		where ord.id = order_id;
	
	insert into pazl.order_status_history(order_id,order_status) values(order_id, v_order_status_id);
	
    SET exit_loop = false;
    OPEN employee_cursor;

	employee_loop: LOOP
     FETCH NEXT FROM employee_cursor INTO i, c;
		
     IF exit_loop THEN
         CLOSE employee_cursor;
         LEAVE employee_loop;
     END IF;
     update pazl.storage st set st.count = (st.count - c) where st.item_id = i;
   END LOOP employee_loop;
   
   COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_order`(
IN id_user INT, 
OUT order_id INT)
BEGIN
DECLARE l_order_id INT DEFAULT 0;
	DECLARE l_state_name VARCHAR(45);
    
	START TRANSACTION;
    
	insert into pazl.orders(start_date,user_id) values(sysdate(), id_user);
	
	-- get item id
    SET l_order_id = LAST_INSERT_ID();
	
	IF l_order_id > 0 THEN
		insert into pazl.order_status_history(event_date,order_id,order_status) values(sysdate(),l_order_id,1);
	
	COMMIT;
        SET order_id = l_order_id;
     ELSE
		ROLLBACK;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-10 13:05:45
