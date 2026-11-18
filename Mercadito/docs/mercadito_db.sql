-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: mercadito_db
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mercadito_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mercadito_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mercadito_db`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add producto',7,'add_producto'),(26,'Can change producto',7,'change_producto'),(27,'Can delete producto',7,'delete_producto'),(28,'Can view producto',7,'view_producto'),(29,'Can add categoria',8,'add_categoria'),(30,'Can change categoria',8,'change_categoria'),(31,'Can delete categoria',8,'delete_categoria'),(32,'Can view categoria',8,'view_categoria'),(33,'Can add detalle venta',9,'add_detalleventa'),(34,'Can change detalle venta',9,'change_detalleventa'),(35,'Can delete detalle venta',9,'delete_detalleventa'),(36,'Can view detalle venta',9,'view_detalleventa'),(37,'Can add venta',10,'add_venta'),(38,'Can change venta',10,'change_venta'),(39,'Can delete venta',10,'delete_venta'),(40,'Can view venta',10,'view_venta');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$AXAPndavpFVOwyDPVVcaT8$3owPcLsgcyjkf28rJGMWMceGeRG+lLdXzleTh+3+fRU=','2026-11-18 14:04:13.470785',1,'benyi','','','',1,1,'2026-11-18 13:57:02.637290');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-11-18 14:01:16.363761','1','Bebidas y jugos',1,'[{\"added\": {}}]',8,1),(2,'2026-11-18 14:01:42.404431','2','Galletas y colaciones',1,'[{\"added\": {}}]',8,1),(3,'2026-11-18 14:03:13.476983','3','Harinas',1,'[{\"added\": {}}]',8,1),(4,'2026-11-18 14:06:18.547438','4','Snacks',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'productos','categoria'),(7,'productos','producto'),(9,'productos_llevar','detalleventa'),(6,'sessions','session'),(10,'ventas','venta');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-11-18 13:55:49.119196'),(2,'auth','0001_initial','2026-11-18 13:55:51.130994'),(3,'admin','0001_initial','2026-11-18 13:55:51.525248'),(4,'admin','0002_logentry_remove_auto_add','2026-11-18 13:55:51.542890'),(5,'admin','0003_logentry_add_action_flag_choices','2026-11-18 13:55:51.566381'),(6,'contenttypes','0002_remove_content_type_name','2026-11-18 13:55:51.877085'),(7,'auth','0002_alter_permission_name_max_length','2026-11-18 13:55:52.081348'),(8,'auth','0003_alter_user_email_max_length','2026-11-18 13:55:52.137072'),(9,'auth','0004_alter_user_username_opts','2026-11-18 13:55:52.157456'),(10,'auth','0005_alter_user_last_login_null','2026-11-18 13:55:52.322246'),(11,'auth','0006_require_contenttypes_0002','2026-11-18 13:55:52.332737'),(12,'auth','0007_alter_validators_add_error_messages','2026-11-18 13:55:52.350626'),(13,'auth','0008_alter_user_username_max_length','2026-11-18 13:55:52.582033'),(14,'auth','0009_alter_user_last_name_max_length','2026-11-18 13:55:52.759596'),(15,'auth','0010_alter_group_name_max_length','2026-11-18 13:55:52.806143'),(16,'auth','0011_update_proxy_permissions','2026-11-18 13:55:52.830670'),(17,'auth','0012_alter_user_first_name_max_length','2026-11-18 13:55:53.062283'),(18,'productos','0001_initial','2026-11-18 13:55:53.140276'),(19,'productos','0002_categoria','2026-11-18 13:55:53.206516'),(20,'productos','0003_alter_categoria_options_categoria_descripcion_and_more','2026-11-18 13:55:53.538642'),(21,'productos','0004_producto_categoria_producto_fecha_ingreso','2026-11-18 13:55:53.973592'),(22,'ventas','0001_initial','2026-11-18 13:55:54.073213'),(23,'productos_llevar','0001_initial','2026-11-18 13:55:54.576148'),(24,'productos_llevar','0002_detalleventa_unico_producto_por_venta','2026-11-18 13:55:54.664354'),(25,'sessions','0001_initial','2026-11-18 13:55:54.764464');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('j2012o6x1nzffjri5bgkxo4tjs2y5ak8','.eJxVjEEOwiAQRe_C2pACpR1cuvcMZIYZbNVAUtqV8e7apAvd_vfef6mI2zrFrckSZ1ZnZdTpdyNMDyk74DuWW9WplnWZSe-KPmjT18ryvBzu38GEbfrWiQgzjSBGxsH03joPOYFhlsyddXbokNB33sMgiccUQnDZgXigkHtQ7w8AWjhL:1xTg9z:M3Gj_sA89SbdocfYC8uMuKZ4rhpabmfwha2ACXCiITA','2026-12-02 13:57:15.573320'),('tuzuavezsfi0cr11i9j335chzs1l0twm','.eJxVjEEOwiAQRe_C2pACpR1cuvcMZIYZbNVAUtqV8e7apAvd_vfef6mI2zrFrckSZ1ZnZdTpdyNMDyk74DuWW9WplnWZSe-KPmjT18ryvBzu38GEbfrWiQgzjSBGxsH03joPOYFhlsyddXbokNB33sMgiccUQnDZgXigkHtQ7w8AWjhL:1xTgGj:Zg7vfUgaeejUr0yzmyKHSmDoggtJOrOBA1hnY0ydBoo','2026-12-02 14:04:13.484822');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_categoria`
--

DROP TABLE IF EXISTS `productos_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productos_categoria_nombre_64d1661c_uniq` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_categoria`
--

LOCK TABLES `productos_categoria` WRITE;
/*!40000 ALTER TABLE `productos_categoria` DISABLE KEYS */;
INSERT INTO `productos_categoria` VALUES (1,'Bebidas y jugos',''),(2,'Galletas y colaciones',''),(3,'Harinas',''),(4,'Snacks','');
/*!40000 ALTER TABLE `productos_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_llevar_detalleventa`
--

DROP TABLE IF EXISTS `productos_llevar_detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_llevar_detalleventa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` int unsigned NOT NULL,
  `precio_unitario` int unsigned NOT NULL,
  `producto_id` int NOT NULL,
  `venta_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `unico_producto_por_venta` (`venta_id`,`producto_id`),
  KEY `productos_llevar_det_producto_id_9cb018d9_fk_productos` (`producto_id`),
  CONSTRAINT `productos_llevar_det_producto_id_9cb018d9_fk_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos_producto` (`id`),
  CONSTRAINT `productos_llevar_det_venta_id_4587c0e9_fk_ventas_ve` FOREIGN KEY (`venta_id`) REFERENCES `ventas_venta` (`n_venta`),
  CONSTRAINT `productos_llevar_detalleventa_chk_1` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `productos_llevar_detalleventa_chk_2` CHECK ((`precio_unitario` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_llevar_detalleventa`
--

LOCK TABLES `productos_llevar_detalleventa` WRITE;
/*!40000 ALTER TABLE `productos_llevar_detalleventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_llevar_detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_producto`
--

DROP TABLE IF EXISTS `productos_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` int unsigned NOT NULL,
  `stock` int unsigned NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `categoria_id` int NOT NULL,
  `fecha_ingreso` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `productos_producto_categoria_id_1fef506a_fk_productos` (`categoria_id`),
  CONSTRAINT `productos_producto_categoria_id_1fef506a_fk_productos` FOREIGN KEY (`categoria_id`) REFERENCES `productos_categoria` (`id`),
  CONSTRAINT `productos_producto_chk_1` CHECK ((`precio` >= 0)),
  CONSTRAINT `productos_producto_chk_2` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_producto`
--

LOCK TABLES `productos_producto` WRITE;
/*!40000 ALTER TABLE `productos_producto` DISABLE KEYS */;
INSERT INTO `productos_producto` VALUES (1,'7b9ae9a65d4545fcb1d12ab7977ade37','Galleta Frac',850,8,1,2,'2026-11-18'),(2,'2a066c5236e249bfbd5a9e9d04fa3870','Chocman',350,16,1,2,'2026-11-18'),(3,'c875658df0474b2cbcf5d84f96406d0c','Jugo Soprole',1500,2,1,1,'2026-11-18'),(4,'3e02b08250484b1db6df3136be7722e6','Kryzpo',1000,6,1,4,'2026-11-18'),(5,'f96554a3d24540dba806f912146b9b2d','Coca Cola 2.5L',2800,7,1,1,'2026-11-18'),(6,'d10b3aca69184be28f699a111aca5ca0','Coca Cola 1L',1000,2,1,1,'2026-11-18'),(7,'3813814e82b944718213ff4b7d1511c4','Mini Coca Cola 250ml',800,6,1,1,'2026-11-18'),(8,'e636fc06546c466ea4d723fe0f77f3a7','Harina 1Kg',1400,4,1,3,'2026-11-18'),(9,'3f67e355f6f64a078a2930a58581b83f','Galleta Tuareg',850,2,1,2,'2026-11-18'),(10,'de203d58481544a49a363a839a0f4b6f','Shufle Maní',1400,2,1,4,'2026-11-18');
/*!40000 ALTER TABLE `productos_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_venta`
--

DROP TABLE IF EXISTS `ventas_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_venta` (
  `n_venta` int NOT NULL AUTO_INCREMENT,
  `uuid` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_emision` datetime(6) NOT NULL,
  `tipo_pago` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiado_a` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagado` tinyint(1) NOT NULL,
  `total_venta` int unsigned NOT NULL,
  PRIMARY KEY (`n_venta`),
  UNIQUE KEY `uuid` (`uuid`),
  CONSTRAINT `ventas_venta_chk_1` CHECK ((`total_venta` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_venta`
--

LOCK TABLES `ventas_venta` WRITE;
/*!40000 ALTER TABLE `ventas_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-18 11:28:54
