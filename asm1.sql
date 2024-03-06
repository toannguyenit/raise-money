CREATE DATABASE  IF NOT EXISTS `asm1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `asm1`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: asm1
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `money` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `is_show` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (3,'T01','Trung thu cho em','2024-03-12',200000,'Trung thu cho em','Truong DH SPKT','123123123','2024-02-01',3,1),(4,'T02','Tet cho em 2024','2024-03-09',0,'Tet cho em 2024','Dai hoc Y Duoc','01234567891212','2024-02-01',1,1),(5,'H02','Fill content','2024-02-03',0,'Vi tre em 2','Y Duoc 2','0123','2024-02-01',2,0),(6,'H03','Fill content','2024-02-03',0,'Vi tre em 2','Y Duoc3','123123','2024-02-01',0,0),(7,'H04','Fill content','2024-02-04',0,'Vi tre em 4','Y Duoc 4','123123','2024-02-01',1,0),(8,'H05','Fill content','2024-02-03',0,'Vi tre em 5','Y Duoc 5','123123','2024-02-01',1,0),(9,'H06','Fill content','2024-02-05',0,'Vi tre em 5','Y Duoc 5','123123','2024-02-01',1,0),(13,'T03','LCK 2024','2024-03-31',0,'LCK 2024','FTP Shop','0123456789','2024-02-22',3,1),(14,'T04','MSI 2024','2024-03-31',0,'MSI 2024','Esport TV','123123123','2024-02-22',0,1),(15,'T05','VCS Mua he','2024-05-22',400000,'VCS Mua he','EsportTV','123123123','2024-02-22',1,1),(16,'T06','Trai dat om mat troi','2024-02-29',0,'Trai dat om mat troi','Kai Dinh','123123123','2024-02-24',1,1);
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `is_show` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'toannguyen','1234','Toan Nguyen','Binh Dinh','1234567123','toannguyen@gmail.com',1,NULL,NULL,1,1),(17,'songtoan','','Hung Nguyen','Binh Dinh','123123','toannguyen.hcmute@gmail.com',1,NULL,NULL,2,1),(26,'tungduong','123123','Tung Duong','Khanh Hoa','123123','tungduong1996@gmail.com',1,NULL,NULL,2,1),(27,'thamvu','123123','Tham Vu','Khanh Hoa','123123','thamvu@gmail.com',1,NULL,NULL,2,1),(30,'anhtuyet','123123','Anh Tuyet','Binh Dinh','0123456789','anhtuyet@gmail.com',1,NULL,NULL,2,1),(31,'ynguyen','123123','Y Nguyen','Quang Ngai','123123','ynguyen@gmail.com',1,NULL,NULL,2,1),(32,'nghianguyen','123123','Nghia Nguyen','Quang Ngai','123123123','nghianguyen@gmail.com',1,NULL,NULL,2,1),(33,'phucthien','123123','Phuc Thien','Binh Dinh','123123123','phucthien@gmail.com',1,NULL,NULL,2,1),(35,'phunguyen','123123','Phu Nguyen','Binh Dinh','0123456789','phunguyen@gmail.com',1,NULL,NULL,2,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_donation`
--

DROP TABLE IF EXISTS `user_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_donation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` varchar(255) DEFAULT NULL,
  `money` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `donation_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_donation_user` (`user_id`),
  KEY `fk_user_donation_donation` (`donation_id`),
  CONSTRAINT `fk_user_donation_donation` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`),
  CONSTRAINT `fk_user_donation_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_donation`
--

LOCK TABLES `user_donation` WRITE;
/*!40000 ALTER TABLE `user_donation` DISABLE KEYS */;
INSERT INTO `user_donation` VALUES (6,'2024-02-23 07:09:43.345',200000,'Song Toan',1,'Ung ho\r\n',3,6),(7,'2024-02-23 07:17:49.667',200000,'Minh Hung',1,'Ung ho                                                ',15,6),(8,'2024-02-23 07:27:47.488',200000,'Song Toan',2,'ung ho                                                ',15,6),(9,'2024-02-23 08:01:04.624',200000,'Tham Vu',1,'Ung ho                                                ',15,6);
/*!40000 ALTER TABLE `user_donation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23 16:11:31
