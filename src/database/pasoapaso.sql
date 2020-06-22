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
  `id_instruccion` int NOT NULL,
  `id_ruta` int NOT NULL,
  `id_tipo_instruccion` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_instruccion`),
  KEY `fk_id_ruta_idx` (`id_ruta`),
  KEY `fk_id_tipo_instruccion_idx` (`id_tipo_instruccion`),
  CONSTRAINT `fk_id_tipo_instruccion` FOREIGN KEY (`id_tipo_instruccion`) REFERENCES `tipo_instruccion` (`id_tipo_instruccion`),
  CONSTRAINT `fk_ruta` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruccion`
--

LOCK TABLES `instruccion` WRITE;
/*!40000 ALTER TABLE `instruccion` DISABLE KEYS */;
INSERT INTO `instruccion` VALUES (1,2,1,20),(2,2,2,0),(4,2,1,20),(5,2,4,20),(6,2,1,35),(7,4,1,20),(8,4,3,0),(9,4,1,20),(10,4,3,0),(11,4,1,5),(12,4,2,0),(13,4,1,40),(14,4,2,0),(15,4,1,15),(16,4,3,0),(17,4,1,75),(18,4,3,0),(19,4,1,3),(20,4,2,0),(21,4,1,3),(22,4,3,0),(23,4,1,10),(24,5,1,10),(25,5,2,0),(26,5,6,5),(27,5,1,5),(28,5,2,0);
/*!40000 ALTER TABLE `instruccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacion`
--

DROP TABLE IF EXISTS `locacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacion` (
  `id_locacion` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacion`
--

LOCK TABLES `locacion` WRITE;
/*!40000 ALTER TABLE `locacion` DISABLE KEYS */;
INSERT INTO `locacion` VALUES (1,'Universidad Nacional de San Martín','Martin de Irigoyen 3100','San Martin',2,3,0,'lamponne@gmail.com'),(2,'Universidad Nacional de La Matanza','Pres. Juan Domingo Peron 2335','La Matanza',2,3,0,'lamponne@gmail.com'),(3,'Universidad Nacional de Tres de Febrero','Valentin Gomez 4772','Tres de Febrero',2,3,0,'lamponne@gmail.com'),(4,'Hospital Pirovano','Av. Monroe 3555\"','CABA',1,2,0,'lamponne@gmail.com'),(5,'Hospital Tornú','Combatientes de Malvinas 3002','CABA',1,2,0,'lamponne@gmail.com'),(6,'Hospital Thompson','Avellaneda 33','San Martin',1,2,1,'lamponne@gmail.com');
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
  PRIMARY KEY (`usuario`),
  KEY `fk_id_locacion_idx` (`id_locacion`),
  KEY `fk_id_estado_idx` (`id_estado`),
  CONSTRAINT `fk_id_estado_loc` FOREIGN KEY (`id_estado`) REFERENCES `notificada_estado` (`id_estado`),
  CONSTRAINT `fk_locacion_id` FOREIGN KEY (`id_locacion`) REFERENCES `locacion` (`id_locacion`),
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
  `id_ruta` int NOT NULL,
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
  CONSTRAINT `fk_id_locacion` FOREIGN KEY (`id_ruta`) REFERENCES `locacion` (`id_locacion`),
  CONSTRAINT `fk_nombreusuario` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`usuario`),
  CONSTRAINT `fk_ruta_1` FOREIGN KEY (`id_ruta_estado`) REFERENCES `ruta_estado` (`id_ruta_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (1,0,1,'Biblioteca','lamponne@gmail.com','2020-05-06','Biblioteca de la UNSAM',1),(2,0,1,'Departamento de alumnos tornavías','lamponne@gmail.com','2020-05-06','Departamento de alumnos tornavías de la UNSAM',1),(3,0,1,'Aulario','lamponne@gmail.com','2020-05-06','Aulario de la UNSAM',1),(4,0,1,'Laboratorio de Ciencias Sociales','lamponne@gmail.com','2020-05-06','Laboratiorio de Ciencias Sociales de la UNSAM',1),(5,0,4,'Sala de rayos X','lamponne@gmail.com','2020-05-06','Sala de rayos X del Hospital Pirovano',1),(6,0,1,'Test','lamponne@gmail.com','2020-05-06','Caminito',1);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-22  7:37:01
