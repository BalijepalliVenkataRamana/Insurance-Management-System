-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: insurance_management
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents` (
  `agent_id` int NOT NULL,
  `agent_name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (201,'Amit','9000011111','amit@gmail.com','Hyderabad'),(202,'Neha','9000022222','neha@gmail.com','Chennai'),(203,'Ravi','9000033333','ravi@gmail.com','Mumbai');
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claims`
--

DROP TABLE IF EXISTS `claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claims` (
  `claim_id` int NOT NULL,
  `customer_policy_id` int DEFAULT NULL,
  `claim_amount` decimal(12,2) DEFAULT NULL,
  `claim_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`claim_id`),
  KEY `claims_ibfk_1` (`customer_policy_id`),
  CONSTRAINT `claims_ibfk_1` FOREIGN KEY (`customer_policy_id`) REFERENCES `customer_policies` (`customer_policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claims`
--

LOCK TABLES `claims` WRITE;
/*!40000 ALTER TABLE `claims` DISABLE KEYS */;
INSERT INTO `claims` VALUES (501,301,50000.00,'2024-06-01','Approved'),(502,302,25000.00,'2024-06-15','Approved'),(504,304,75000.00,'2024-08-05','Approved');
/*!40000 ALTER TABLE `claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_policies`
--

DROP TABLE IF EXISTS `customer_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_policies` (
  `customer_policy_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `policy_id` int DEFAULT NULL,
  `agent_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_policy_id`),
  KEY `policy_id` (`policy_id`),
  KEY `agent_id` (`agent_id`),
  KEY `customer_policies_ibfk_1` (`customer_id`),
  CONSTRAINT `customer_policies_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `customer_policies_ibfk_2` FOREIGN KEY (`policy_id`) REFERENCES `policies` (`policy_id`),
  CONSTRAINT `customer_policies_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_policies`
--

LOCK TABLES `customer_policies` WRITE;
/*!40000 ALTER TABLE `customer_policies` DISABLE KEYS */;
INSERT INTO `customer_policies` VALUES (301,1,101,201,'2024-01-15','2034-01-14','Active'),(302,2,102,202,'2024-02-20','2029-02-19','Active'),(303,3,103,203,'2024-03-25','2027-03-24','Active'),(304,4,104,201,'2024-04-10','2039-04-09','Active'),(305,5,105,202,'2024-05-15','2025-05-14','Expired'),(306,6,101,201,'2024-07-01','2034-06-30','Active'),(307,7,101,201,'2024-09-01','2034-08-31','Active');
/*!40000 ALTER TABLE `customer_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Rahul','rahul_new@gmail.com','9999999999','Hyderabad','2024-01-10'),(2,'Priya','priya@gmail.com','9876543211','Hyderabad','2024-02-15'),(3,'Arjun','arjun@gmail.com','9876543212','Chennai','2024-03-20'),(4,'Sneha','sneha@gmail.com','9876543213','Mumbai','2024-04-05'),(5,'Kiran','kiran@gmail.com','9876543214','Hyderabad','2024-05-12'),(6,'Anil','anil@gmail.com','9876543215','Hyderabad','2024-06-10'),(7,'Vijay','vijay123@gmail.com','9876500000','Hyderabad','2024-07-01'),(13,'Test Customer','testcustomer@gmail.com','9000000001','Hyderabad','2024-09-01');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policies`
--

DROP TABLE IF EXISTS `policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policies` (
  `policy_id` int NOT NULL,
  `policy_name` varchar(100) DEFAULT NULL,
  `policy_type` varchar(50) DEFAULT NULL,
  `premium_amount` decimal(10,2) DEFAULT NULL,
  `coverage_amount` decimal(12,2) DEFAULT NULL,
  `duration_years` int DEFAULT NULL,
  PRIMARY KEY (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policies`
--

LOCK TABLES `policies` WRITE;
/*!40000 ALTER TABLE `policies` DISABLE KEYS */;
INSERT INTO `policies` VALUES (101,'Life Secure','Life',6500.00,1000000.00,10),(102,'Health Plus','Health',4500.00,500000.00,5),(103,'Car Protect','Vehicle',7000.00,300000.00,3),(104,'Family Shield','Life',8500.00,1500000.00,15),(105,'Travel Safe','Travel',2500.00,200000.00,1);
/*!40000 ALTER TABLE `policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premium_payments`
--

DROP TABLE IF EXISTS `premium_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premium_payments` (
  `payment_id` int NOT NULL,
  `customer_policy_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `premium_payments_ibfk_1` (`customer_policy_id`),
  CONSTRAINT `premium_payments_ibfk_1` FOREIGN KEY (`customer_policy_id`) REFERENCES `customer_policies` (`customer_policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premium_payments`
--

LOCK TABLES `premium_payments` WRITE;
/*!40000 ALTER TABLE `premium_payments` DISABLE KEYS */;
INSERT INTO `premium_payments` VALUES (401,301,6000.00,'2024-02-01','UPI','Paid'),(402,302,4500.00,'2024-02-25','Card','Paid'),(403,303,7000.00,'2024-03-30','Cash','Paid'),(404,304,8500.00,'2024-04-15','UPI','Paid'),(405,305,2500.00,'2024-05-20','Card','Paid');
/*!40000 ALTER TABLE `premium_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'insurance_management'
--
/*!50003 DROP PROCEDURE IF EXISTS `AssignPolicy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignPolicy`(
    IN p_customer_id INT,
    IN p_policy_id INT,
    IN p_agent_id INT,
    IN p_start_date DATE
)
BEGIN
    DECLARE v_duration INT;

    SELECT duration_years
    INTO v_duration
    FROM Policies
    WHERE policy_id = p_policy_id;

    IF v_duration IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Policy not found';
    END IF;

    INSERT INTO Customer_Policies
    (
        customer_id,
        policy_id,
        agent_id,
        start_date,
        end_date,
        status
    )
    VALUES
    (
        p_customer_id,
        p_policy_id,
        p_agent_id,
        p_start_date,
        DATE_SUB(
            DATE_ADD(p_start_date, INTERVAL v_duration YEAR),
            INTERVAL 1 DAY
        ),
        'Active'
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerPolicies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerPolicies`(
    IN p_customer_id INT
)
BEGIN
    SELECT c.name, p.policy_name,
           cp.start_date, cp.end_date, cp.status
    FROM Customers c
    JOIN Customer_Policies cp
    ON c.customer_id = cp.customer_id
    JOIN Policies p
    ON cp.policy_id = p.policy_id
    WHERE c.customer_id = p_customer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCustomer`(
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_phone VARCHAR(15),
    IN p_address VARCHAR(255),
    IN p_date DATE
)
BEGIN
    INSERT INTO Customers
    (name, email, phone, address, registration_date)
    VALUES
    (p_name, p_email, p_phone, p_address, p_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListClaimsByStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListClaimsByStatus`(
    IN p_status VARCHAR(50)
)
BEGIN
    SELECT
        claim_id,
        customer_policy_id,
        claim_amount,
        claim_date,
        status
    FROM Claims
    WHERE status = p_status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TotalPremiumCollected` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalPremiumCollected`()
BEGIN
    SELECT SUM(amount) AS Total_Collection
    FROM Premium_Payments
    WHERE status = 'Paid';
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

-- Dump completed on 2026-11-11 19:10:41
