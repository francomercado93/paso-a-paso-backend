CREATE DATABASE  IF NOT EXISTS `paso-a-paso` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `paso-a-paso`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: paso-a-paso
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `instruccion`
--

DROP TABLE IF EXISTS `instruccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruccion` (
  `id_instruccion` int NOT NULL AUTO_INCREMENT,
  `id_ruta` int NOT NULL,
  `numero_instruccion` int NOT NULL,
  `id_tipo_instruccion` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_instruccion`),
  KEY `fk_id_ruta_idx` (`id_ruta`),
  KEY `fk_id_tipo_instruccion_idx` (`id_tipo_instruccion`),
  CONSTRAINT `fk_id_tipo_instruccion` FOREIGN KEY (`id_tipo_instruccion`) REFERENCES `tipo_instruccion` (`id_tipo_instruccion`),
  CONSTRAINT `fk_ruta` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruccion`
--

LOCK TABLES `instruccion` WRITE;
/*!40000 ALTER TABLE `instruccion` DISABLE KEYS */;
INSERT INTO `instruccion` VALUES (1,2,1,1,20),(2,2,2,2,0),(4,2,3,1,20),(5,2,4,4,20),(6,2,5,1,35),(7,4,1,1,20),(8,4,2,3,0),(9,4,3,1,20),(10,4,4,3,0),(11,4,5,1,5),(12,4,6,2,0),(13,4,7,1,40),(14,4,8,2,0),(15,4,9,1,15),(16,4,10,3,0),(17,4,11,1,75),(18,4,12,3,0),(19,4,13,1,3),(20,4,14,2,0),(21,4,15,1,3),(22,4,16,3,0),(23,4,17,1,10),(24,5,1,1,10),(25,5,2,2,0),(26,5,3,6,5),(27,5,4,1,5),(28,5,5,2,0),(29,2,1,1,10),(235,148,0,1,10),(236,148,3,1,5),(237,148,2,5,10),(238,148,1,2,45);
/*!40000 ALTER TABLE `instruccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacion`
--

DROP TABLE IF EXISTS `locacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacion` (
  `id_locacion` int NOT NULL AUTO_INCREMENT,
  `nombre_locacion` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `id_provincia` int NOT NULL,
  `id_tipo_locacion` int NOT NULL,
  `es_publica` tinyint(1) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_locacion`),
  KEY `fk_id_provincia_idx` (`id_provincia`),
  KEY `fk_id_tipo_locacion_idx` (`id_tipo_locacion`),
  KEY `fk_usuario_idx` (`usuario`),
  CONSTRAINT `fk_id_provincia` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`),
  CONSTRAINT `fk_id_tipo_locacion` FOREIGN KEY (`id_tipo_locacion`) REFERENCES `tipo_locacion` (`id_tipo_locacion`),
  CONSTRAINT `fk_usr` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacion`
--

LOCK TABLES `locacion` WRITE;
/*!40000 ALTER TABLE `locacion` DISABLE KEYS */;
INSERT INTO `locacion` VALUES (1,'Universidad Nacional de San Martín','Martin de Irigoyen 3100','San Martin',2,3,0,'lamponne@gmail.com'),(2,'Universidad Nacional de La Matanza','Pres. Juan Domingo Peron 2335','La Matanza',2,3,0,'lamponne@gmail.com'),(3,'Universidad Nacional de Tres de Febrero','Valentin Gomez 4772','Tres de Febrero',2,3,0,'lamponne@gmail.com'),(4,'Hospital Pirovano','Av. Monroe 3555\"','CABA',1,2,0,'lamponne@gmail.com'),(5,'Hospital Tornú','Combatientes de Malvinas 3002','CABA',1,2,0,'lamponne@gmail.com'),(6,'Hospital Thompson','Avellaneda 33','San Martin',1,2,1,'lamponne@gmail.com'),(18,'Hospital Posadas','Calle falsa 123','El Palomar',2,2,1,'emiravenna@gmail.com');
/*!40000 ALTER TABLE `locacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacion_propuesta`
--

DROP TABLE IF EXISTS `locacion_propuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacion_propuesta` (
  `usuario` varchar(45) NOT NULL,
  `id_locacion` int NOT NULL,
  `comentario_usuario` varchar(45) DEFAULT NULL,
  `comentario_colaborador` varchar(45) DEFAULT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`usuario`,`id_locacion`),
  KEY `fk_id_locacion_idx` (`id_locacion`),
  KEY `fk_id_estado_idx` (`id_estado`),
  CONSTRAINT `fk_id_estado_loc` FOREIGN KEY (`id_estado`) REFERENCES `notificada_estado` (`id_estado`),
  CONSTRAINT `fk_locacion_id_loc` FOREIGN KEY (`id_locacion`) REFERENCES `locacion` (`id_locacion`),
  CONSTRAINT `fk_usuario_usr` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacion_propuesta`
--

LOCK TABLES `locacion_propuesta` WRITE;
/*!40000 ALTER TABLE `locacion_propuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `locacion_propuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificada_estado`
--

DROP TABLE IF EXISTS `notificada_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificada_estado` (
  `id_estado` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificada_estado`
--

LOCK TABLES `notificada_estado` WRITE;
/*!40000 ALTER TABLE `notificada_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificada_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id_provincia` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'CABA'),(2,'Buenos Aires'),(3,'Cordoba'),(4,'Santa Fe'),(5,'Entre Ríos'),(6,'Corrientes'),(7,'Misiones'),(8,'Chaco'),(9,'Formosa'),(10,'Santiago del Estero'),(11,'Salta'),(12,'Jujuy'),(13,'Catamarca'),(14,'Tucumán'),(15,'La Rioja'),(16,'San Juan'),(17,'San Luis'),(18,'Mendoza'),(19,'La Pampa'),(20,'Neuquén'),(21,'Río Negro'),(22,'Chubut'),(23,'Santa Cruz'),(24,'Tierra del Fuego');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruta` (
  `id_ruta` int NOT NULL AUTO_INCREMENT,
  `es_publica` tinyint(1) NOT NULL,
  `id_locacion` int NOT NULL,
  `nombre_ruta` varchar(45) NOT NULL,
  `creado_por` varchar(45) NOT NULL,
  `creado_el` date NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `id_ruta_estado` int NOT NULL,
  PRIMARY KEY (`id_ruta`),
  KEY `fk_ruta_1_idx` (`id_ruta_estado`),
  KEY `fk_nombreusuario_idx` (`creado_por`),
  KEY `fk_locacion_id_idx` (`id_locacion`),
  CONSTRAINT `fk_locacion_id` FOREIGN KEY (`id_locacion`) REFERENCES `locacion` (`id_locacion`),
  CONSTRAINT `fk_nombreusuario` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`usuario`),
  CONSTRAINT `fk_ruta_1` FOREIGN KEY (`id_ruta_estado`) REFERENCES `ruta_estado` (`id_ruta_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (1,1,1,'Biblioteca','lamponne@gmail.com','2020-05-06','Biblioteca de la UNSAM',1),(2,1,1,'Departamento de alumnos tornavías','lamponne@gmail.com','2020-05-06','Departamento de alumnos tornavías de la UNSAM',1),(3,0,1,'Aulario','lamponne@gmail.com','2020-05-06','Aulario de la UNSAM',1),(4,1,1,'Laboratorio de Ciencias Sociales','lamponne@gmail.com','2020-05-06','Laboratiorio de Ciencias Sociales de la UNSAM',1),(5,0,4,'Sala de rayos X','lamponne@gmail.com','2020-05-06','Sala de rayos X del Hospital Pirovano',1),(148,1,18,'Consultorio 1','emiravenna@gmail.com','2020-05-06','Test',1);
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta_estado`
--

DROP TABLE IF EXISTS `ruta_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruta_estado` (
  `id_ruta_estado` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ruta_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta_estado`
--

LOCK TABLES `ruta_estado` WRITE;
/*!40000 ALTER TABLE `ruta_estado` DISABLE KEYS */;
INSERT INTO `ruta_estado` VALUES (1,'Pendiente'),(2,'Aprobado'),(3,'Rechazado');
/*!40000 ALTER TABLE `ruta_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta_favorito_usuario`
--

DROP TABLE IF EXISTS `ruta_favorito_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruta_favorito_usuario` (
  `usuario` varchar(45) NOT NULL,
  `id_ruta` int NOT NULL,
  PRIMARY KEY (`usuario`,`id_ruta`),
  KEY `fk_id_ruta_idx` (`id_ruta`),
  CONSTRAINT `fk_ruta_usr` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`),
  CONSTRAINT `fk_usuario_u` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta_favorito_usuario`
--

LOCK TABLES `ruta_favorito_usuario` WRITE;
/*!40000 ALTER TABLE `ruta_favorito_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruta_favorito_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta_propuesta`
--

DROP TABLE IF EXISTS `ruta_propuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruta_propuesta` (
  `usuario` varchar(45) NOT NULL,
  `id_ruta` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `id_estado` int NOT NULL,
  `fecha_creacion` varchar(45) NOT NULL,
  PRIMARY KEY (`usuario`,`id_ruta`),
  KEY `fk_id_ruta_idx` (`id_ruta`),
  KEY `fk_id_estado_idx` (`id_estado`),
  CONSTRAINT `fk_estado_id` FOREIGN KEY (`id_estado`) REFERENCES `notificada_estado` (`id_estado`),
  CONSTRAINT `fk_ruta_us` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`),
  CONSTRAINT `fk_user` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta_propuesta`
--

LOCK TABLES `ruta_propuesta` WRITE;
/*!40000 ALTER TABLE `ruta_propuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruta_propuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutas_reportadas`
--

DROP TABLE IF EXISTS `rutas_reportadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutas_reportadas` (
  `usuario` varchar(45) NOT NULL,
  `id_ruta` int NOT NULL,
  `comentario_usuario` varchar(45) NOT NULL,
  `id_estado` int NOT NULL,
  `fecha_creacion` date NOT NULL,
  `comentario_colaborador` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuario`,`id_ruta`),
  KEY `fk_id_ruta_idx` (`id_ruta`),
  KEY `fk_id_estado_idx` (`id_estado`),
  CONSTRAINT `fk_id_estado` FOREIGN KEY (`id_estado`) REFERENCES `notificada_estado` (`id_estado`),
  CONSTRAINT `fk_ruta_id` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutas_reportadas`
--

LOCK TABLES `rutas_reportadas` WRITE;
/*!40000 ALTER TABLE `rutas_reportadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `rutas_reportadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_instruccion`
--

DROP TABLE IF EXISTS `tipo_instruccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_instruccion` (
  `id_tipo_instruccion` int NOT NULL,
  `instruccion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_instruccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_instruccion`
--

LOCK TABLES `tipo_instruccion` WRITE;
/*!40000 ALTER TABLE `tipo_instruccion` DISABLE KEYS */;
INSERT INTO `tipo_instruccion` VALUES (1,'Caminar'),(2,'Girar a la izquierda'),(3,'Girar a la derecha'),(4,'Subir escalones'),(5,'Bajar escalones'),(6,'Subir ascensor'),(7,'Bajar ascensor');
/*!40000 ALTER TABLE `tipo_instruccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_locacion`
--

DROP TABLE IF EXISTS `tipo_locacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_locacion` (
  `id_tipo_locacion` int NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_locacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_locacion`
--

LOCK TABLES `tipo_locacion` WRITE;
/*!40000 ALTER TABLE `tipo_locacion` DISABLE KEYS */;
INSERT INTO `tipo_locacion` VALUES (1,'Favoritos'),(2,'Hospitales'),(3,'Universidades'),(4,'Museos');
/*!40000 ALTER TABLE `tipo_locacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int NOT NULL,
  `tipo_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Registrado'),(2,'Colaborador'),(3,'Administrador');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuario` varchar(45) NOT NULL,
  `alias` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `es_vidente` tinyint(1) NOT NULL,
  `id_tipo_usuario` int NOT NULL,
  `id_provincia` int NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  PRIMARY KEY (`usuario`),
  KEY `fk_id_tipo_usuario_idx` (`id_tipo_usuario`),
  KEY `fk_provincia_idx` (`id_provincia`),
  CONSTRAINT `fk_id_tipo_usuario` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`),
  CONSTRAINT `fk_provincia` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('emiravenna@gmail.com','emilioravenna','Emilio','Ravenna','cozzeti',1,1,1,'CABA'),('lamponne@gmail.com','pabloLamponne','Pablo','Lamponne','betun',1,2,1,'CABA'),('mariosantos@gmail.com','mariosantos','Mario','Santos','milazzo',1,3,2,'San Isidro');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'paso-a-paso'
--

--
-- Dumping routines for database 'paso-a-paso'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_locacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_locacion`(IN id INT, IN nombre VARCHAR(45), IN direccion VARCHAR(45), IN ciudad VARCHAR(45), IN id_provincia INT, IN id_tipoLocacion INT, IN esPublica Boolean, IN usuario VARCHAR(45))
BEGIN
	UPDATE locacion SET 
    nombre_locacion = nombre, 
    direccion = direccion, 
    ciudad = ciudad, 
    id_provincia = id_provincia, 
    id_tipo_locacion = id_tipoLocacion, 
    es_publica = IF(esPublica = false, 1, 0), 
    usuario = usuario
    WHERE id_locacion = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `categorias`()
BEGIN
	SELECT tl.id_tipo_locacion AS id, tl.tipo AS nombre FROM tipo_locacion tl;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crear_locacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_locacion`(IN nombre VARCHAR(45), IN direccion VARCHAR(45), IN ciudad VARCHAR(45), IN id_provincia INT, IN id_tipoLocacion INT, IN esPublica Boolean, IN usuario VARCHAR(45))
BEGIN
	INSERT INTO locacion ( nombre_locacion, direccion, ciudad, id_provincia, id_tipo_locacion, es_publica, usuario)
	VALUES (nombre, direccion, ciudad, id_provincia, id_tipoLocacion, IF(esPublica = false, 1, 0), usuario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `idInstruccionPorNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `idInstruccionPorNombre`(IN nombre VARCHAR(45))
BEGIN
	SELECT ti.id_tipo_instruccion as idInstruccion FROM tipo_instruccion ti
    WHERE ti.instruccion LIKE '%nombre%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `idLocacionPorNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `idLocacionPorNombre`(IN nombre VARCHAR(45))
BEGIN
	SELECT l.id_locacion as idLocacion FROM locacion l
    WHERE l.nombre_locacion = nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertInstruccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInstruccion`(IN ruta INT, IN tipoInstruccion VARCHAR(45), IN cantidad INT, IN numeroInstruccion INT )
BEGIN
	DECLARE idInstruccion INT DEFAULT 0;
	SET idInstruccion = (SELECT ti.id_tipo_instruccion FROM tipo_instruccion ti WHERE ti.instruccion = tipoInstruccion);
	INSERT INTO instruccion (id_ruta, id_tipo_instruccion, cantidad, numero_instruccion )
	VALUES  (ruta, idInstruccion ,cantidad, numeroInstruccion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `instruccionesRuta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `instruccionesRuta`(IN IdRuta INT)
BEGIN
	SELECT i.id_instruccion AS id, r.nombre_ruta AS nombreRuta, i.numero_instruccion AS numeroInstruccion, ti.instruccion AS tipoInstruccion, i.cantidad 
	FROM instruccion i
	INNER JOIN ruta r ON r.id_ruta = i.id_ruta
	INNER JOIN tipo_instruccion ti ON ti.id_tipo_instruccion = i.id_tipo_instruccion
	WHERE i.id_ruta = IdRuta
    ORDER BY i.numero_instruccion ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `locacionById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `locacionById`(IN id INT)
BEGIN
select l.id_locacion, l.nombre_locacion, l.direccion, l.ciudad, p.nombre as provincia, tl.tipo as tipo_locacion, IF(l.es_publica, 'true', 'false') as esPublica , l.usuario from locacion l
    inner join provincia p on p.id_provincia = l.id_provincia
    inner join tipo_locacion tl on tl.id_tipo_locacion = l.id_tipo_locacion
    where l.id_locacion = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `locaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `locaciones`()
BEGIN
select l.id_locacion as id, l.nombre_locacion as nombre, l.direccion, l.ciudad, p.nombre as provincia, tl.tipo as tipoLocacion, IF(l.es_publica, 'true', 'false') as esPublica , l.usuario from locacion l
    inner join provincia p on p.id_provincia = l.id_provincia
    inner join tipo_locacion tl on tl.id_tipo_locacion = l.id_tipo_locacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `locacionesByTipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `locacionesByTipo`(IN IdTipoLocacion INT)
BEGIN
	select l.id_locacion as id, l.nombre_locacion as nombre, l.direccion, l.ciudad, p.nombre as provincia, tl.tipo as tipoLocacion, IF(l.es_publica, 'true', 'false') as esPublica , l.usuario from locacion l
    inner join provincia p on p.id_provincia = l.id_provincia
    inner join tipo_locacion tl on tl.id_tipo_locacion = l.id_tipo_locacion
    where l.id_tipo_locacion = IdTipoLocacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `locacionesPorNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `locacionesPorNombre`(IN nombre VARCHAR(45))
BEGIN
select l.id_locacion, l.nombre_locacion, l.direccion, l.ciudad, p.nombre as provincia, tl.tipo as tipo_locacion, IF(l.es_publica, 'true', 'false') as esPublica , l.usuario from locacion l
    inner join provincia p on p.id_provincia = l.id_provincia
    inner join tipo_locacion tl on tl.id_tipo_locacion = l.id_tipo_locacion
    where l.nombre_locacion like CONCAT('%', nombre , '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `locaciones_por_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `locaciones_por_usuario`(IN usuario VARCHAR(45))
BEGIN
	select l.id_locacion as id, l.nombre_locacion as nombre, l.direccion, l.ciudad, p.nombre as provincia, tl.tipo as tipoLocacion, l.es_publica as esPublica , l.usuario from locacion l
    inner join provincia p on p.id_provincia = l.id_provincia
    inner join tipo_locacion tl on tl.id_tipo_locacion = l.id_tipo_locacion
    where l.usuario = usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuevaRuta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevaRuta`(IN esPublica Bool, IN locacion VARCHAR(45), IN nombre VARCHAR(45), IN usuario VARCHAR(45), IN fecha DATE, IN descripcion VARCHAR(45), IN rutaEstado INT)
BEGIN
	DECLARE l_ruta_id INT DEFAULT 0;
	DECLARE idLocacion INT DEFAULT 0;
    
    SET idLocacion = (SELECT l.id_locacion as idLocacion FROM locacion l
						WHERE l.nombre_locacion = locacion);
                        
	INSERT INTO ruta (es_publica, id_locacion, nombre_ruta, creado_por, creado_el, descripcion, id_ruta_estado)
	VALUES (esPublica, idLocacion, nombre,usuario , fecha, descripcion, rutaEstado);
    
	SET l_ruta_id = LAST_INSERT_ID();
    SELECT r.id_ruta FROM ruta r WHERE r.id_ruta = l_ruta_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `provincias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `provincias`()
BEGIN
	SELECT p.id_provincia AS id, p.nombre FROM provincia p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `publicarRuta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `publicarRuta`(IN idRuta INT)
BEGIN
	UPDATE ruta r
    SET r.es_publica = 1
	WHERE r.id_ruta = idRuta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rutaPorId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rutaPorId`(IN IdRuta VARCHAR(45))
BEGIN
	SELECT r.id_ruta AS id, IF(r.es_publica, 'true', 'false') as esPublica , l.nombre_locacion AS locacion, r.nombre_ruta AS nombre, r.creado_por AS usuario, r.creado_el AS fechaCreacion, r.descripcion, re.descripcion as estado
	FROM ruta r 
	INNER JOIN locacion l on l.id_locacion = r.id_locacion
	INNER JOIN ruta_estado re on re.id_ruta_estado = r.id_ruta_estado
	WHERE r.id_ruta = IdRuta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rutasPorLocacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rutasPorLocacion`(IN IdLocacion VARCHAR(45))
BEGIN
SELECT r.id_ruta as id, IF(r.es_publica, 'true', 'false') as esPublica , l.nombre_locacion as locacion, r.nombre_ruta as nombre, r.creado_por as usuario, r.creado_el as fechaCreacion, r.descripcion, re.descripcion as estado
FROM ruta r 
INNER JOIN locacion l on l.id_locacion = r.id_locacion
INNER JOIN ruta_estado re on re.id_ruta_estado = r.id_ruta_estado
WHERE l.id_locacion = IdLocacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rutasUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rutasUsuario`(IN usuario VARCHAR(45))
BEGIN
	SELECT r.id_ruta as id, r.es_publica as esPublica , l.nombre_locacion as locacion, r.nombre_ruta as nombre, r.creado_por as usuario, r.creado_el as fechaCreacion, r.descripcion, re.descripcion as estado
	FROM ruta r 
	INNER JOIN locacion l on l.id_locacion = r.id_locacion
	INNER JOIN ruta_estado re on re.id_ruta_estado = r.id_ruta_estado
	WHERE r.creado_por = usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tiposInstrucciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tiposInstrucciones`()
BEGIN
	SELECT ti.id_tipo_instruccion as id, ti.instruccion as nombre FROM tipo_instruccion ti;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuarioLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarioLogin`(IN usuario VARCHAR(45), IN password VARCHAR(45))
BEGIN
	SELECT u.usuario, u.alias, u.nombre, u.apellido, u.password, IF(u.es_vidente, 'true', 'false') as esVidente, tu.tipo_usuario as tipoUsuario, p.nombre as provincia , u.ciudad 
	FROM usuario u
	INNER JOIN tipo_usuario tu ON tu.id_tipo_usuario = u.id_tipo_usuario
	INNER JOIN provincia p ON p.id_provincia = u.id_provincia
    WHERE u.usuario LIKE usuario AND u.password LIKE password;
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

-- Dump completed on 2020-06-26 16:03:51
