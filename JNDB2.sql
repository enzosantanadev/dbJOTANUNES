-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: jotanunesdb_2
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `ambiente`
--

DROP TABLE IF EXISTS `ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ambiente` (
  `ambiente_id` bigint NOT NULL AUTO_INCREMENT,
  `topico_id` bigint NOT NULL,
  `nome` varchar(100) NOT NULL,
  `metragem` decimal(10,2) DEFAULT NULL,
  `observacoes` text,
  PRIMARY KEY (`ambiente_id`),
  KEY `fk_ambiente_topico` (`topico_id`),
  CONSTRAINT `fk_ambiente_topico` FOREIGN KEY (`topico_id`) REFERENCES `topico` (`topico_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambiente`
--

LOCK TABLES `ambiente` WRITE;
/*!40000 ALTER TABLE `ambiente` DISABLE KEYS */;
INSERT INTO `ambiente` VALUES (1,1,'Sala de Estar',25.50,'Com varanda');
/*!40000 ALTER TABLE `ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descricao`
--

DROP TABLE IF EXISTS `descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descricao` (
  `descricao_id` bigint NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `detalhe` text NOT NULL,
  PRIMARY KEY (`descricao_id`),
  KEY `fk_descricao_item` (`item_id`),
  CONSTRAINT `fk_descricao_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descricao`
--

LOCK TABLES `descricao` WRITE;
/*!40000 ALTER TABLE `descricao` DISABLE KEYS */;
INSERT INTO `descricao` VALUES (1,1,'porcelanato, cerâmica, h=8'),(2,1,'porcelanato, h=5');
/*!40000 ALTER TABLE `descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` bigint NOT NULL AUTO_INCREMENT,
  `ambiente_id` bigint NOT NULL,
  `nome` varchar(100) NOT NULL,
  `posicao` varchar(50) DEFAULT NULL,
  `observacoes` text,
  PRIMARY KEY (`item_id`),
  KEY `fk_item_ambiente` (`ambiente_id`),
  CONSTRAINT `fk_item_ambiente` FOREIGN KEY (`ambiente_id`) REFERENCES `ambiente` (`ambiente_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,'Piso da Sala','chão','Nivelado');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `marca_id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Portobello');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `material_id` bigint NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `acabamento` varchar(100) DEFAULT NULL,
  `cor` varchar(50) DEFAULT NULL,
  `dimensao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`material_id`),
  KEY `fk_material_item` (`item_id`),
  CONSTRAINT `fk_material_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,1,'Porcelanato esmaltado','brilho','bege','60x60');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialmarca`
--

DROP TABLE IF EXISTS `materialmarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialmarca` (
  `material_id` bigint NOT NULL,
  `marca_id` bigint NOT NULL,
  PRIMARY KEY (`material_id`,`marca_id`),
  KEY `fk_mm_marca` (`marca_id`),
  CONSTRAINT `fk_mm_marca` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`marca_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mm_material` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialmarca`
--

LOCK TABLES `materialmarca` WRITE;
/*!40000 ALTER TABLE `materialmarca` DISABLE KEYS */;
INSERT INTO `materialmarca` VALUES (1,1);
/*!40000 ALTER TABLE `materialmarca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obra`
--

DROP TABLE IF EXISTS `obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra` (
  `obra_id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `localizacao` text,
  `descricao` text,
  `observacoes` text,
  `status_docesptec` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`obra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obra`
--

LOCK TABLES `obra` WRITE;
/*!40000 ALTER TABLE `obra` DISABLE KEYS */;
INSERT INTO `obra` VALUES (1,'Residencial Fifous','São Paulo','Obra de apartamentos','Sem observações','Em andamento');
/*!40000 ALTER TABLE `obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `tipo_usuario_id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`tipo_usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topico`
--

DROP TABLE IF EXISTS `topico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topico` (
  `topico_id` bigint NOT NULL AUTO_INCREMENT,
  `obra_id` bigint NOT NULL,
  `torre_id` bigint DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`topico_id`),
  KEY `fk_topico_obra` (`obra_id`),
  KEY `fk_topico_torre` (`torre_id`),
  CONSTRAINT `fk_topico_obra` FOREIGN KEY (`obra_id`) REFERENCES `obra` (`obra_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_topico_torre` FOREIGN KEY (`torre_id`) REFERENCES `torre` (`torre_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topico`
--

LOCK TABLES `topico` WRITE;
/*!40000 ALTER TABLE `topico` DISABLE KEYS */;
INSERT INTO `topico` VALUES (1,1,1,'Pavimento térreo','Estrutura');
/*!40000 ALTER TABLE `topico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torre`
--

DROP TABLE IF EXISTS `torre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torre` (
  `torre_id` bigint NOT NULL AUTO_INCREMENT,
  `obra_id` bigint NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`torre_id`),
  KEY `fk_torre_obra` (`obra_id`),
  CONSTRAINT `fk_torre_obra` FOREIGN KEY (`obra_id`) REFERENCES `obra` (`obra_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torre`
--

LOCK TABLES `torre` WRITE;
/*!40000 ALTER TABLE `torre` DISABLE KEYS */;
INSERT INTO `torre` VALUES (1,1,'Torre A');
/*!40000 ALTER TABLE `torre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuario_id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `tipo_usuario_id` bigint NOT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_usuario_tipo` (`tipo_usuario_id`),
  CONSTRAINT `fk_usuario_tipo` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`tipo_usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-01 16:21:10
