-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-09-2021 a las 23:52:11
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_reciclaje`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(40) NOT NULL,
  `materiales` varchar(50) NOT NULL,
  `respaldos` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` int NOT NULL,
  `nombre_contacto` int NOT NULL,
  `cel_contacto` int NOT NULL,
  `banco` varchar(20) NOT NULL,
  `cuenta_banco` int NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_especial`
--

DROP TABLE IF EXISTS `material_especial`;
CREATE TABLE IF NOT EXISTS `material_especial` (
  `idmat_esp` int NOT NULL AUTO_INCREMENT,
  `idreg_comp` int NOT NULL,
  `idprov` int NOT NULL,
  `mat_reciclables` varchar(100) NOT NULL,
  PRIMARY KEY (`idmat_esp`),
  UNIQUE KEY `idreg_comp` (`idreg_comp`),
  UNIQUE KEY `idreg_prov` (`idprov`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_reciclable`
--

DROP TABLE IF EXISTS `material_reciclable`;
CREATE TABLE IF NOT EXISTS `material_reciclable` (
  `idmat` int NOT NULL AUTO_INCREMENT,
  `material` varchar(30) NOT NULL,
  `peso` double NOT NULL,
  PRIMARY KEY (`idmat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `idprov` int NOT NULL AUTO_INCREMENT,
  `Nombre` int NOT NULL,
  `ci-nit` int NOT NULL,
  `direccion` int NOT NULL,
  `telefono` int NOT NULL,
  `nom_contacto` int NOT NULL,
  `cel_contacto` int NOT NULL,
  `banco` varchar(20) NOT NULL,
  `cuenta_banco` int NOT NULL,
  PRIMARY KEY (`idprov`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_compras`
--

DROP TABLE IF EXISTS `registro_compras`;
CREATE TABLE IF NOT EXISTS `registro_compras` (
  `idreg_comp` int NOT NULL AUTO_INCREMENT,
  `idprov` int NOT NULL,
  `Descrip` int NOT NULL,
  `Peso` int NOT NULL,
  `precio_unid` double NOT NULL,
  `precio_total` double NOT NULL,
  `observacion` varchar(100) NOT NULL,
  `caja_chica` double NOT NULL,
  `costo_transp` double NOT NULL,
  PRIMARY KEY (`idreg_comp`),
  UNIQUE KEY `idprov` (`idprov`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_ventas`
--

DROP TABLE IF EXISTS `registro_ventas`;
CREATE TABLE IF NOT EXISTS `registro_ventas` (
  `idreg_vent` int NOT NULL AUTO_INCREMENT,
  `idmat` int NOT NULL,
  `idcliente` int NOT NULL,
  `fecha` int NOT NULL,
  `peso` double NOT NULL,
  `precio_unid` double NOT NULL,
  `precio_total` double NOT NULL,
  `costo_trans` double NOT NULL,
  `caja_chica` double NOT NULL,
  `observacion` varchar(100) NOT NULL,
  PRIMARY KEY (`idreg_vent`),
  UNIQUE KEY `idmat` (`idmat`),
  UNIQUE KEY `idcliente` (`idcliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
