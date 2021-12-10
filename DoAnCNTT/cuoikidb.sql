-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: cuoiki
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id_bill` int NOT NULL,
  `date` datetime NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `sum` int NOT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_bill`),
  KEY `FKl555fe2abhoghoveainiqhobe` (`id_user`),
  CONSTRAINT `FKl555fe2abhoghoveainiqhobe` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL,
  `id_product` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail`
--

DROP TABLE IF EXISTS `detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail` (
  `id_bill` int NOT NULL,
  `quantily` int DEFAULT NULL,
  `id_product` int DEFAULT NULL,
  PRIMARY KEY (`id_bill`),
  KEY `FKj0y3v2m7sbfqj663j0i65a37x` (`id_product`),
  CONSTRAINT `FKetp1lxv2dmi6tn732v8wbqa30` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id_bill`),
  CONSTRAINT `FKj0y3v2m7sbfqj663j0i65a37x` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail`
--

LOCK TABLES `detail` WRITE;
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (5);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantily` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5,' Dung Tích 2.1L - Công Suất 500W - Thương Hiệu Mỹ','images/products/item-1.jpg','Máy Xay Thực Phẩm Đa Năng',1000000,1),(6,'Dung Tích 15L  Chức Năng Công Suất 2000W  Độ Ồn Thấp Nhất','images/products/item-2.jpg','Nồi Chiên Không Dầu OLIVO',1000000,1),(7,'Nồi Chiên Không Dầu OLIVO AF 250','images/products/item-6.jpg','Nồi Chiên Không Dầu OLIVO AF 250',2000000,1),(8,'Máy Ép Trái Cây Olivo Sj 189 với công nghệ ép chậm tiên tiến cho tất cả các loại trái cây','images/products/anh-2.webp','Máy Ép Trái Cây Olivo Sj 189',2000000,1),(9,'Làm sạch và diệt vi khuẩn đến 99,99%','images/products/anh-3.webp','Máy Rửa Bát OLIVO DW 2 ',1000000,1),(10,'Đem lại cho gia đình bạn không gian thoáng mát ','images/products/item-9.jpg','Hút Mùi OLIVO RH 39',4000000,1),(11,'Máy ép nước hoa quả tươi ngon, làm sinh tố, làm kem hoa quả rất mịn','images/products/item-11.jpg','Máy Ép Chậm OLIVO SJ 200',6000000,1),(12,'Máy ép chậm thiết kế mỏng sử dụng thép không gỉ chất lượng cao.','images/products/item-16.jpg','Máy Ép Chậm OLIVO SJ 180',4000000,1),(13,'Thiết kế bếp siêu mỏng, mặt bếp kích thước lớn cho khả năng đun nấu hiệu quả.','images/products/item-10.jpg','Bếp Từ OLIVO CT 11',5000000,1),(14,'Kích thước nhỏ dễ dàng sắp xếp trong gian bếp.','images/products/item-13.jpg','Lò Nướng OLIVO OV 550',2000000,1),(15,' Nồi chiên không dầu, hạn chế tối đa chất béo','images/products/item-17.jpg','Nồi Chiên Không Dầu OLIVO AF 200 ',2000000,1),(16,'Công suất đầu ra tối đa sẽ được điều chỉnh thành 600 W ','images/products/item-5.jpg','Lò Nướng OLIVO OV 10',2000000,1),(20,'Chất liệu mặt bếp là kính cường lực chịu nhiệt, chịu lực','images/products/item-15.jpg','Bếp Từ OLIVO CT 300.',1200000,1),(21,'Với thiết kế nhỏ gọn 9 trong 1 giúp bạn tiết kiệm được không gian.','images/products/item-4.jpg','Nồi Chiên Không Dầu OLIVO AF 12',2000000,1),(22,'Giải Pháp Chăm Sóc Sức khỏe Tuyệt Vời','images/products/item-14.jpg','Máy Làm Sữa Hạt Olivo X20 ',8000000,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_MEMBER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK84m4x29g16h6ll9apisavaqow` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (3,'Hiệp bình chánh thủ đức','0989542812','admin'),(4,'cantho','0339340128','Truong');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (3,1),(3,2),(4,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'admin@gmail.com','$2a$10$mWGdEVuUO6IzlBmMHXgfZ.BP02AMfnfUtLq7s9DWQwiuyOBQPfi2K'),(4,'dactruong2306@gmail.com','$2a$10$a9oFsG2Hch98HNYKCA/0XuVotNIbjAotsq3g4GDj9UAPHjp.FsJrG');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-10 14:18:05
