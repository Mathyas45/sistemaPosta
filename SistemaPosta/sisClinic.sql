/*
 Navicat Premium Data Transfer

 Source Server         : cn
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : sispos

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 04/06/2023 10:41:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acceso
-- ----------------------------
DROP TABLE IF EXISTS `acceso`;
CREATE TABLE `acceso`  (
  `idperfil` int(11) NOT NULL,
  `idopcion` int(11) NOT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idperfil`, `idopcion`) USING BTREE,
  INDEX `idopcion`(`idopcion`) USING BTREE,
  CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `acceso_ibfk_2` FOREIGN KEY (`idopcion`) REFERENCES `opcion` (`idopcion`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acceso
-- ----------------------------
INSERT INTO `acceso` VALUES (1, 1, 1);
INSERT INTO `acceso` VALUES (1, 2, 1);
INSERT INTO `acceso` VALUES (1, 3, 1);
INSERT INTO `acceso` VALUES (1, 4, 1);
INSERT INTO `acceso` VALUES (1, 5, 1);
INSERT INTO `acceso` VALUES (1, 6, 1);
INSERT INTO `acceso` VALUES (1, 7, 1);
INSERT INTO `acceso` VALUES (1, 8, 1);
INSERT INTO `acceso` VALUES (1, 9, 0);
INSERT INTO `acceso` VALUES (1, 13, 1);
INSERT INTO `acceso` VALUES (1, 14, 1);
INSERT INTO `acceso` VALUES (1, 15, 1);
INSERT INTO `acceso` VALUES (2, 1, 0);
INSERT INTO `acceso` VALUES (2, 2, 0);
INSERT INTO `acceso` VALUES (2, 4, 0);
INSERT INTO `acceso` VALUES (2, 5, 1);
INSERT INTO `acceso` VALUES (2, 6, 1);
INSERT INTO `acceso` VALUES (3, 3, 0);
INSERT INTO `acceso` VALUES (3, 4, 0);
INSERT INTO `acceso` VALUES (3, 5, 1);
INSERT INTO `acceso` VALUES (3, 6, 1);
INSERT INTO `acceso` VALUES (3, 8, 1);
INSERT INTO `acceso` VALUES (4, 1, 1);
INSERT INTO `acceso` VALUES (4, 2, 1);
INSERT INTO `acceso` VALUES (4, 3, 0);
INSERT INTO `acceso` VALUES (4, 4, 0);
INSERT INTO `acceso` VALUES (4, 6, 0);
INSERT INTO `acceso` VALUES (4, 7, 1);
INSERT INTO `acceso` VALUES (6, 1, 1);
INSERT INTO `acceso` VALUES (6, 2, 0);
INSERT INTO `acceso` VALUES (6, 3, 0);
INSERT INTO `acceso` VALUES (6, 4, 0);
INSERT INTO `acceso` VALUES (6, 8, 0);
INSERT INTO `acceso` VALUES (6, 9, 0);

-- ----------------------------
-- Table structure for afectacion
-- ----------------------------
DROP TABLE IF EXISTS `afectacion`;
CREATE TABLE `afectacion`  (
  `idafectacion` int(11) NOT NULL,
  `descripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idafectacion`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of afectacion
-- ----------------------------
INSERT INTO `afectacion` VALUES (10, 'GRAVADAS');
INSERT INTO `afectacion` VALUES (20, 'EXONERADAS');
INSERT INTO `afectacion` VALUES (30, 'INAFECTAS');

-- ----------------------------
-- Table structure for almacen
-- ----------------------------
DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen`  (
  `idalmacen` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idalmacen`) USING BTREE,
  INDEX `idsucursal`(`idsucursal`) USING BTREE,
  CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of almacen
-- ----------------------------
INSERT INTO `almacen` VALUES (1, 'almacen 1 editado', 3, 1);
INSERT INTO `almacen` VALUES (2, 'almacen 2', 3, 1);

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idcategoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (1, 'METALES', 2);
INSERT INTO `categoria` VALUES (2, 'CHOCOLATES', 2);
INSERT INTO `categoria` VALUES (3, 'UTILES DE LIMPIEZA', 0);
INSERT INTO `categoria` VALUES (4, 'UTILES DE ASEO', 2);
INSERT INTO `categoria` VALUES (5, 'FRUTAS', 2);
INSERT INTO `categoria` VALUES (6, 'FRUTAS', 2);
INSERT INTO `categoria` VALUES (7, 'VERDURAS', 2);
INSERT INTO `categoria` VALUES (8, 'POSTRES', 1);
INSERT INTO `categoria` VALUES (9, 'CARNES', 1);
INSERT INTO `categoria` VALUES (10, 'GASEOSAS', 1);
INSERT INTO `categoria` VALUES (11, 'DULCES', 1);
INSERT INTO `categoria` VALUES (12, 'GOLOSINAS', 1);
INSERT INTO `categoria` VALUES (13, 'REPUESTOS', 1);
INSERT INTO `categoria` VALUES (14, 'MENESTRAS', 1);
INSERT INTO `categoria` VALUES (15, 'GALLETAS', 0);
INSERT INTO `categoria` VALUES (16, 'GALLETAS2', 2);
INSERT INTO `categoria` VALUES (17, 'LACTEOS', 0);
INSERT INTO `categoria` VALUES (18, 'LACTEOS X', 2);
INSERT INTO `categoria` VALUES (19, 'LACTEOS X', 2);
INSERT INTO `categoria` VALUES (20, 'GALLETAS X', 0);
INSERT INTO `categoria` VALUES (21, 'GALLETAS Z', 0);
INSERT INTO `categoria` VALUES (22, 'CATEGORIA ABC', 2);
INSERT INTO `categoria` VALUES (23, 'CATEGORIA XYZ', 2);
INSERT INTO `categoria` VALUES (24, 'PASTILLAS', 0);
INSERT INTO `categoria` VALUES (25, 'PRUEBA', 0);
INSERT INTO `categoria` VALUES (26, 'CATEGORIA ABC', 2);
INSERT INTO `categoria` VALUES (27, 'PRUEBA ABC', 2);
INSERT INTO `categoria` VALUES (28, '', 2);
INSERT INTO `categoria` VALUES (29, 'FRUTAS', 2);
INSERT INTO `categoria` VALUES (30, 'FRUTAS', 2);
INSERT INTO `categoria` VALUES (31, '', 2);
INSERT INTO `categoria` VALUES (32, 'PRUEBA XYZ', 2);
INSERT INTO `categoria` VALUES (33, 'prueba bbb', 2);
INSERT INTO `categoria` VALUES (34, 'pruebaqqw', 2);
INSERT INTO `categoria` VALUES (35, 'ABARROTESXZA', 2);
INSERT INTO `categoria` VALUES (36, 'ACCESORIO PARA BAÑO COMPLETO PAVCO', 0);
INSERT INTO `categoria` VALUES (37, 'gaseosa-lucila', 2);

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente`  (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idtipodocumento` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nrodocumento` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direccion` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idcliente`) USING BTREE,
  INDEX `idtipodocumento`(`idtipodocumento`) USING BTREE,
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idtipodocumento`) REFERENCES `tipodocumento` (`idtipodocumento`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES (1, 'JUAN PEREZ', '1', '12345699', 'MANUEL NRO 123 - CERCADO DE LIMA', 1);
INSERT INTO `cliente` VALUES (2, 'TAQINI TECHNOLOGY S.A.C.', '6', '20602814425', 'CAL.JUAN CUGLIEVAN NRO. 216 CERCADO DE CHICLAYO  (OFICINA NRO. 301)  LAMBAYEQUE - CHICLAYO - CHICLAYO', 1);
INSERT INTO `cliente` VALUES (3, 'JUNTA DE USUARIOS DEL SECTOR HIDRAULICO MENOR SAN LORENZO', '6', '20161500292', 'AV.REFORMA AGRARIA NRO. S N CRUCETA  (EX DRENAJE)  PIURA - PIURA - TAMBO GRANDE', 1);
INSERT INTO `cliente` VALUES (4, 'EUSEBIO KELVIN RIVADENEIRA FABIAN', '1', '75123787', 'Aguaytia - UCAYALI', 1);
INSERT INTO `cliente` VALUES (5, 'ELVIS ENRIQUE VALENTIN MALDONADO', '1', '46874321', 'PISCO', 1);
INSERT INTO `cliente` VALUES (6, 'ESWIN YASMANI MORALES VINCES', '1', '41981450', 'TUMBES', 1);
INSERT INTO `cliente` VALUES (7, 'CARLOS', '1', '12345695', 'PERU', 1);
INSERT INTO `cliente` VALUES (8, 'ASSEL', '1', '12345678', 'PERU', 1);
INSERT INTO `cliente` VALUES (9, 'CHAVITO', '1', '44332211', 'PERU', 1);
INSERT INTO `cliente` VALUES (10, 'JOSE PEREZ', '1', '12312333', 'CHICLAYO', 1);
INSERT INTO `cliente` VALUES (11, 'FUENTES ALCANTARA ANTONIO', '6', '10459336635', 'CALLE DIEGO FERRE NRO 877 - (-) LAMBAYEQUE -  LAMBAYEQUE -  JAYANCA', 1);
INSERT INTO `cliente` VALUES (12, 'CONECTA RETAIL S.A.', '6', '20141189850', 'AV.LUIS GONZALES NRO. 1315 URB.  CERCADO DE CHICLAYO  LAMBAYEQUE - CHICLAYO - CHICLAYO', 1);
INSERT INTO `cliente` VALUES (13, 'CYNTHIA ALEJANDRA GARCIA MAMANI', '1', '72897234', 'Lima', 1);
INSERT INTO `cliente` VALUES (14, 'CLIENTE VARIOS', '1', '', '', 1);
INSERT INTO `cliente` VALUES (15, 'ANTONIO JUNIOR FUENTES ALCANTARA', '1', '45933663', '', 1);
INSERT INTO `cliente` VALUES (16, 'CARLOS LUIS', '0', '34323454', '', 1);
INSERT INTO `cliente` VALUES (17, '', '6', '454621211', '', 1);
INSERT INTO `cliente` VALUES (18, '', '6', '5456', '', 1);

-- ----------------------------
-- Table structure for detalle
-- ----------------------------
DROP TABLE IF EXISTS `detalle`;
CREATE TABLE `detalle`  (
  `iddetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NULL DEFAULT NULL,
  `idproducto` int(11) NULL DEFAULT NULL,
  `cantidad` decimal(15, 2) NULL DEFAULT NULL,
  `unidad` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pventa` decimal(15, 2) NULL DEFAULT NULL,
  `igv` decimal(15, 2) NULL DEFAULT NULL,
  `icbper` decimal(15, 2) NULL DEFAULT NULL,
  `descuento` decimal(15, 2) NULL DEFAULT NULL,
  `total` decimal(15, 2) NULL DEFAULT NULL,
  `idafectacion` int(11) NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`iddetalle`) USING BTREE,
  INDEX `idproducto`(`idproducto`) USING BTREE,
  INDEX `idventa`(`idventa`) USING BTREE,
  CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detalle
-- ----------------------------
INSERT INTO `detalle` VALUES (1, 1, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 1);
INSERT INTO `detalle` VALUES (2, 2, 1, 3.00, 'NIU', 3.00, 1.37, 0.00, 0.00, 9.00, 10, 1);
INSERT INTO `detalle` VALUES (3, 3, 1, 1.00, 'NIU', 3.00, 0.46, 0.00, 0.00, 3.00, 10, 1);
INSERT INTO `detalle` VALUES (4, 3, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 1);
INSERT INTO `detalle` VALUES (5, 4, 6, 2.00, 'NIU', 6.00, 1.83, 0.00, 0.00, 12.00, 10, 1);
INSERT INTO `detalle` VALUES (6, 5, 1, 7.00, 'NIU', 3.00, 3.20, 0.00, 0.00, 21.00, 10, 1);
INSERT INTO `detalle` VALUES (7, 6, 3, 2.00, 'NIU', 0.60, 0.18, 0.00, 0.00, 1.20, 10, 1);
INSERT INTO `detalle` VALUES (8, 6, 6, 3.00, 'NIU', 6.00, 2.75, 0.00, 0.00, 18.00, 10, 1);
INSERT INTO `detalle` VALUES (9, 7, 8, 4.00, 'NIU', 10.00, 6.10, 0.00, 0.00, 40.00, 10, 1);
INSERT INTO `detalle` VALUES (10, 8, 6, 3.00, 'NIU', 6.00, 2.75, 0.00, 0.00, 18.00, 10, 1);
INSERT INTO `detalle` VALUES (11, 9, 9, 7.00, 'NIU', 15.00, 16.02, 0.00, 0.00, 105.00, 10, 1);
INSERT INTO `detalle` VALUES (12, 10, 9, 3.00, 'NIU', 15.00, 6.86, 0.00, 0.00, 45.00, 10, 1);
INSERT INTO `detalle` VALUES (13, 10, 6, 2.00, 'NIU', 6.00, 1.83, 0.00, 0.00, 12.00, 10, 1);
INSERT INTO `detalle` VALUES (14, 10, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 1);
INSERT INTO `detalle` VALUES (15, 11, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 1);
INSERT INTO `detalle` VALUES (16, 11, 9, 2.00, 'NIU', 15.00, 4.58, 0.00, 0.00, 30.00, 10, 1);
INSERT INTO `detalle` VALUES (17, 11, 6, 1.00, 'NIU', 6.00, 0.92, 0.00, 0.00, 6.00, 10, 1);
INSERT INTO `detalle` VALUES (18, 12, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 1);
INSERT INTO `detalle` VALUES (19, 12, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 1);
INSERT INTO `detalle` VALUES (20, 13, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 1);
INSERT INTO `detalle` VALUES (21, 13, 9, 2.00, 'NIU', 15.00, 4.58, 0.00, 0.00, 30.00, 10, 1);
INSERT INTO `detalle` VALUES (22, 14, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 1);
INSERT INTO `detalle` VALUES (23, 15, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 1);
INSERT INTO `detalle` VALUES (24, 16, 9, 2.00, 'NIU', 15.00, 4.58, 0.00, 0.00, 30.00, 10, 1);
INSERT INTO `detalle` VALUES (25, 17, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 2);
INSERT INTO `detalle` VALUES (26, 18, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 1);
INSERT INTO `detalle` VALUES (27, 18, 3, 1.00, 'NIU', 0.60, 0.09, 0.00, 0.00, 0.60, 10, 1);
INSERT INTO `detalle` VALUES (28, 18, 6, 2.00, 'NIU', 6.00, 1.83, 0.00, 0.00, 12.00, 10, 1);
INSERT INTO `detalle` VALUES (29, 19, 5, 2.00, 'NIU', 0.80, 0.09, 1.00, 0.00, 1.60, 10, 1);
INSERT INTO `detalle` VALUES (30, 19, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 1);
INSERT INTO `detalle` VALUES (31, 19, 3, 1.00, 'NIU', 0.60, 0.09, 0.00, 0.00, 0.60, 10, 1);
INSERT INTO `detalle` VALUES (32, 19, 7, 1.00, 'NIU', 5.00, 0.76, 0.00, 0.00, 5.00, 10, 1);
INSERT INTO `detalle` VALUES (33, 19, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 1);
INSERT INTO `detalle` VALUES (34, 19, 12, 1.00, 'BOX', 1.00, 0.15, 0.00, 0.00, 1.00, 10, 1);
INSERT INTO `detalle` VALUES (35, 19, 6, 1.00, 'NIU', 6.00, 0.92, 0.00, 0.00, 6.00, 10, 1);
INSERT INTO `detalle` VALUES (36, 17, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 2);
INSERT INTO `detalle` VALUES (37, 17, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 2);
INSERT INTO `detalle` VALUES (38, 17, 6, 1.00, 'NIU', 6.00, 0.92, 0.00, 0.00, 6.00, 10, 2);
INSERT INTO `detalle` VALUES (39, 17, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 2);
INSERT INTO `detalle` VALUES (40, 17, 6, 1.00, 'NIU', 6.00, 0.92, 0.00, 0.00, 6.00, 10, 2);
INSERT INTO `detalle` VALUES (41, 17, 7, 1.00, 'NIU', 5.00, 0.76, 0.00, 0.00, 5.00, 10, 2);
INSERT INTO `detalle` VALUES (42, 17, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 2);
INSERT INTO `detalle` VALUES (43, 17, 6, 1.00, 'NIU', 6.00, 0.92, 0.00, 0.00, 6.00, 10, 2);
INSERT INTO `detalle` VALUES (44, 17, 7, 1.00, 'NIU', 5.00, 0.76, 0.00, 0.00, 5.00, 10, 2);
INSERT INTO `detalle` VALUES (45, 17, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 2);
INSERT INTO `detalle` VALUES (46, 17, 6, 1.00, 'NIU', 6.00, 0.92, 0.00, 0.00, 6.00, 10, 2);
INSERT INTO `detalle` VALUES (47, 17, 7, 1.00, 'NIU', 5.00, 0.76, 0.00, 0.00, 5.00, 10, 2);
INSERT INTO `detalle` VALUES (48, 17, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 1);
INSERT INTO `detalle` VALUES (49, 17, 6, 1.00, 'NIU', 6.00, 0.92, 0.00, 0.00, 6.00, 10, 1);
INSERT INTO `detalle` VALUES (50, 17, 7, 1.00, 'NIU', 5.00, 0.76, 0.00, 0.00, 5.00, 10, 1);
INSERT INTO `detalle` VALUES (51, 20, 7, 1.00, 'NIU', 5.00, 0.76, 0.00, 0.00, 5.00, 10, 1);
INSERT INTO `detalle` VALUES (52, 20, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 1);
INSERT INTO `detalle` VALUES (53, 21, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 1);
INSERT INTO `detalle` VALUES (54, 21, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 1);
INSERT INTO `detalle` VALUES (55, 22, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 1);
INSERT INTO `detalle` VALUES (56, 22, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 1);
INSERT INTO `detalle` VALUES (57, 22, 12, 1.00, 'BOX', 1.00, 0.15, 0.00, 0.00, 1.00, 10, 1);
INSERT INTO `detalle` VALUES (58, 23, 3, 1.00, 'NIU', 0.60, 0.09, 0.00, 0.00, 0.60, 10, 1);
INSERT INTO `detalle` VALUES (59, 24, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 2);
INSERT INTO `detalle` VALUES (60, 24, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 2);
INSERT INTO `detalle` VALUES (61, 24, 12, 1.00, 'BOX', 1.00, 0.15, 0.00, 0.00, 1.00, 10, 2);
INSERT INTO `detalle` VALUES (62, 24, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 1);
INSERT INTO `detalle` VALUES (63, 24, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 1);
INSERT INTO `detalle` VALUES (64, 24, 12, 1.00, 'BOX', 1.00, 0.15, 0.00, 0.00, 1.00, 10, 1);
INSERT INTO `detalle` VALUES (65, 25, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 2);
INSERT INTO `detalle` VALUES (66, 25, 7, 1.00, 'NIU', 5.00, 0.76, 0.00, 0.00, 5.00, 10, 2);
INSERT INTO `detalle` VALUES (67, 25, 9, 1.00, 'NIU', 15.00, 2.29, 0.00, 0.00, 15.00, 10, 1);
INSERT INTO `detalle` VALUES (68, 25, 7, 1.00, 'NIU', 5.00, 0.76, 0.00, 0.00, 5.00, 10, 1);
INSERT INTO `detalle` VALUES (69, 26, 9, 2.00, 'NIU', 15.00, 4.58, 0.00, 0.00, 30.00, 10, 1);
INSERT INTO `detalle` VALUES (70, 26, 7, 2.00, 'NIU', 5.00, 1.53, 0.00, 0.00, 10.00, 10, 1);
INSERT INTO `detalle` VALUES (71, 27, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 2);
INSERT INTO `detalle` VALUES (72, 27, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 2);
INSERT INTO `detalle` VALUES (73, 27, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 2);
INSERT INTO `detalle` VALUES (74, 27, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 2);
INSERT INTO `detalle` VALUES (75, 27, 8, 1.00, 'NIU', 10.00, 1.53, 0.00, 0.00, 10.00, 10, 1);
INSERT INTO `detalle` VALUES (76, 27, 5, 1.00, 'NIU', 0.80, 0.05, 0.50, 0.00, 0.80, 10, 1);
INSERT INTO `detalle` VALUES (77, 30, 5, 2.00, 'NIU', 0.80, 0.09, 1.00, 0.00, 1.60, 10, 1);

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa`  (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `direccion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `ruc` char(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idempresa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES (1, 'Taqini editado por lucila', 'chiclayo', '12345678913', 2);
INSERT INTO `empresa` VALUES (2, 'Metro', '', '', 2);
INSERT INTO `empresa` VALUES (3, 'empresa 2', '', '', 2);
INSERT INTO `empresa` VALUES (4, 'empresa 3', NULL, NULL, 2);
INSERT INTO `empresa` VALUES (5, 'empresa de programacion', 'chiclayo', '12345678', 1);
INSERT INTO `empresa` VALUES (6, 'empresa x', '', '76875154123', 1);
INSERT INTO `empresa` VALUES (7, '78945', '', '45', 2);
INSERT INTO `empresa` VALUES (8, 'abel', '', '78945612365', 2);
INSERT INTO `empresa` VALUES (9, 'abel', '', '78945612345', 2);
INSERT INTO `empresa` VALUES (10, '456', 'editado editado 2', '45645645645', 0);
INSERT INTO `empresa` VALUES (11, 'empresa prueba 03-06', 'editado', '78945623100', 1);

-- ----------------------------
-- Table structure for moneda
-- ----------------------------
DROP TABLE IF EXISTS `moneda`;
CREATE TABLE `moneda`  (
  `idmoneda` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idmoneda`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of moneda
-- ----------------------------
INSERT INTO `moneda` VALUES ('PEN', 'SOLES', 1);
INSERT INTO `moneda` VALUES ('USD', 'DOLARES', 1);

-- ----------------------------
-- Table structure for opcion
-- ----------------------------
DROP TABLE IF EXISTS `opcion`;
CREATE TABLE `opcion`  (
  `idopcion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idopcionref` int(11) NULL DEFAULT NULL,
  `icono` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idopcion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of opcion
-- ----------------------------
INSERT INTO `opcion` VALUES (1, 'Categorias', 10, 'fa-tags', 'vista/categorias.php', 1);
INSERT INTO `opcion` VALUES (2, 'Productos', 10, 'fa-list', 'vista/productos.php', 1);
INSERT INTO `opcion` VALUES (3, 'Perfiles', 11, 'fa-user-lock', 'vista/perfiles.php', 1);
INSERT INTO `opcion` VALUES (4, 'Usuarios', 11, 'fa-user-circle', 'vista/usuarios.php', 1);
INSERT INTO `opcion` VALUES (5, 'Clientes', 12, 'fa-users', 'vista/clientes.php', 1);
INSERT INTO `opcion` VALUES (6, 'Ventas', 12, 'fa-cart-plus', 'vista/ventas.php', 1);
INSERT INTO `opcion` VALUES (7, 'Inventario', 10, 'fa-boxes', 'vista/inventario.php', 1);
INSERT INTO `opcion` VALUES (8, 'Ventas Por Mes', 9, 'fa-chart-bar', 'vista/reportes.php', 1);
INSERT INTO `opcion` VALUES (9, 'Reportes', NULL, 'fa-light fa-chart-simple', NULL, 1);
INSERT INTO `opcion` VALUES (10, 'Almacen', NULL, 'fa-store', NULL, 1);
INSERT INTO `opcion` VALUES (11, 'Administracion', NULL, 'fa-users', NULL, 1);
INSERT INTO `opcion` VALUES (12, 'Venta', NULL, 'fa-chart-bar', NULL, 1);
INSERT INTO `opcion` VALUES (13, 'Registro Almacen', 10, 'fa-store', 'vista/almacen.php', 1);
INSERT INTO `opcion` VALUES (14, 'Empresa', 11, 'fa-building-circle-check', 'vista/empresa.php', 1);
INSERT INTO `opcion` VALUES (15, 'Sucursal', 11, 'fa-warehouse', 'vista/sucursal.php', 1);

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil`  (
  `idperfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL COMMENT '0 -> INACTIVO \n1 -> ACTIVO\n2 -> ELIMINADO',
  PRIMARY KEY (`idperfil`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO `perfil` VALUES (1, 'ADMINISTRADOR', 1);
INSERT INTO `perfil` VALUES (2, 'VENDEDOR', 1);
INSERT INTO `perfil` VALUES (3, 'CAJERO', 0);
INSERT INTO `perfil` VALUES (4, 'ALMACENERO', 1);
INSERT INTO `perfil` VALUES (5, 'PRUEBA', 2);
INSERT INTO `perfil` VALUES (6, 'PERFIL PRUEBA', 1);

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `codigobarra` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pventa` decimal(15, 2) NULL DEFAULT NULL,
  `pcompra` decimal(15, 2) NULL DEFAULT NULL,
  `stock` decimal(15, 2) NULL DEFAULT NULL,
  `idunidad` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `urlimagen` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idcategoria` int(11) NULL DEFAULT NULL,
  `idafectacion` int(11) NULL DEFAULT NULL,
  `afectoicbper` smallint(6) NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  `stockseguridad` decimal(15, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`idproducto`) USING BTREE,
  INDEX `idcategoria`(`idcategoria`) USING BTREE,
  INDEX `idunidad`(`idunidad`) USING BTREE,
  INDEX `idafectacion`(`idafectacion`) USING BTREE,
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idunidad`) REFERENCES `unidad` (`idunidad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`idafectacion`) REFERENCES `afectacion` (`idafectacion`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (1, 'GASEOSA COCA COLA 1.5L', '292992929292', 3.00, 2.00, 18.00, 'NIU', 'imagen/productos/IMG_1camisa.jpg', 10, 10, 0, 0, 12.00);
INSERT INTO `producto` VALUES (2, 'GASEOSA INKA KOLA 1L', '9099393993', 5.00, 4.00, 24.00, 'NIU', NULL, 10, 10, NULL, 2, NULL);
INSERT INTO `producto` VALUES (3, 'GALLETA RELLENITA DE CHOCOLATE', '98238489234', 0.60, 0.40, 1.00, 'NIU', 'imagen/productos/IMG_3descarga.jpeg', 15, 10, 0, 1, 10.00);
INSERT INTO `producto` VALUES (4, 'GALLETITAS DE ANIMALITOS', '98238489231', 1.00, 0.80, 0.00, 'NIU', 'imagen/productos/IMG_4galletas_animales.jpg', 15, 10, 0, 1, 15.00);
INSERT INTO `producto` VALUES (5, 'BOLSA PLASTICA', 'B9999', 0.80, 0.60, 1.00, 'NIU', 'imagen/productos/IMG_5Futuro_bolsas_plasticas_en_Europa_GR.jpg', 13, 10, 1, 1, 50.00);
INSERT INTO `producto` VALUES (6, 'PILSEN CALLAO 620', '', 6.00, 5.00, 0.00, 'NIU', NULL, 10, 10, 0, 1, 40.00);
INSERT INTO `producto` VALUES (7, 'INKA COLA 1L', '11111111', 5.00, 4.00, 2.00, 'NIU', NULL, 10, 10, 0, 1, 12.00);
INSERT INTO `producto` VALUES (8, 'CONCORDIA 2L MARACUYA', 'C0000111', 10.00, 9.00, 1.00, 'NIU', NULL, 10, 10, 0, 1, 12.00);
INSERT INTO `producto` VALUES (9, 'MARTILLO', '98899888', 15.00, 10.00, 22.00, 'NIU', NULL, 15, 10, 0, 1, 20.00);
INSERT INTO `producto` VALUES (10, 'OREO', NULL, 1.00, 0.50, 45.00, 'NIU', NULL, 15, 10, 0, 2, 20.00);
INSERT INTO `producto` VALUES (11, 'OREO', 'MNDASF32', 1.00, 0.50, 45.00, 'NIU', NULL, 15, 10, 0, 2, 20.00);
INSERT INTO `producto` VALUES (12, 'OREO ABC', 'MNDASF32', 1.00, 0.50, 42.00, 'BOX', NULL, 15, 10, 0, 1, 20.00);
INSERT INTO `producto` VALUES (13, 'XYZ', 'AAAAA', 2.00, 3.00, 4.00, 'mt', NULL, 25, 10, 0, 2, 4.00);

-- ----------------------------
-- Table structure for productosalmacen
-- ----------------------------
DROP TABLE IF EXISTS `productosalmacen`;
CREATE TABLE `productosalmacen`  (
  `idproductosalmacen` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idalmacen` int(11) NOT NULL,
  `cantidad` decimal(9, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`idproductosalmacen`) USING BTREE,
  INDEX `idproducto`(`idproducto`) USING BTREE,
  INDEX `idalmacen`(`idalmacen`) USING BTREE,
  CONSTRAINT `productosalmacen_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productosalmacen_ibfk_2` FOREIGN KEY (`idalmacen`) REFERENCES `almacen` (`idalmacen`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serie
-- ----------------------------
DROP TABLE IF EXISTS `serie`;
CREATE TABLE `serie`  (
  `idserie` int(11) NOT NULL AUTO_INCREMENT,
  `idtipocomprobante` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serie` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `correlativo` int(11) NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idserie`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of serie
-- ----------------------------
INSERT INTO `serie` VALUES (1, '03', 'B001', 155, 1);
INSERT INTO `serie` VALUES (2, '03', 'B002', 90, 1);
INSERT INTO `serie` VALUES (3, '01', 'F001', 39, 1);
INSERT INTO `serie` VALUES (4, '01', 'F002', 45, 1);
INSERT INTO `serie` VALUES (5, '02', '001', 1, 1);
INSERT INTO `serie` VALUES (6, '00', '001', 0, 1);

-- ----------------------------
-- Table structure for sucursal
-- ----------------------------
DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal`  (
  `idsucursal` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `direccion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idsucursal`) USING BTREE,
  INDEX `idempresa`(`idempresa`) USING BTREE,
  CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sucursal
-- ----------------------------
INSERT INTO `sucursal` VALUES (1, 5, 'sucursal editado', 'direccion', 1);
INSERT INTO `sucursal` VALUES (2, 6, 'lucila', '789 editado', 1);
INSERT INTO `sucursal` VALUES (3, 5, 'lucila del carmen', '785412 cruz llaguento lucila cruz  lucila cruz llaguento lucila  lucila cruz llaguento', 1);
INSERT INTO `sucursal` VALUES (4, 11, 'sucursal nro2', '', 1);
INSERT INTO `sucursal` VALUES (5, 11, 'sucursal nro 3', '', 1);
INSERT INTO `sucursal` VALUES (6, 11, 'sucursal nro 4', '', 1);
INSERT INTO `sucursal` VALUES (7, 11, 'sucursal nro 5', '', 1);

-- ----------------------------
-- Table structure for tipocomprobante
-- ----------------------------
DROP TABLE IF EXISTS `tipocomprobante`;
CREATE TABLE `tipocomprobante`  (
  `idtipocomprobante` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idtipocomprobante`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipocomprobante
-- ----------------------------
INSERT INTO `tipocomprobante` VALUES ('00', 'TICKET', 1);
INSERT INTO `tipocomprobante` VALUES ('01', 'FACTURA', 1);
INSERT INTO `tipocomprobante` VALUES ('02', 'NOTA DE VENTA', 1);
INSERT INTO `tipocomprobante` VALUES ('03', 'BOLETA', 1);

-- ----------------------------
-- Table structure for tipodocumento
-- ----------------------------
DROP TABLE IF EXISTS `tipodocumento`;
CREATE TABLE `tipodocumento`  (
  `idtipodocumento` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idtipodocumento`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipodocumento
-- ----------------------------
INSERT INTO `tipodocumento` VALUES ('0', 'SIN DOCUMENTO', 1);
INSERT INTO `tipodocumento` VALUES ('1', 'DNI', 1);
INSERT INTO `tipodocumento` VALUES ('4', 'CARNET DE EXTRANJERIA', 1);
INSERT INTO `tipodocumento` VALUES ('6', 'RUC', 1);

-- ----------------------------
-- Table structure for unidad
-- ----------------------------
DROP TABLE IF EXISTS `unidad`;
CREATE TABLE `unidad`  (
  `idunidad` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idunidad`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unidad
-- ----------------------------
INSERT INTO `unidad` VALUES ('BOX', 'CAJA', 1);
INSERT INTO `unidad` VALUES ('KGM', 'KILOGRAMO', 1);
INSERT INTO `unidad` VALUES ('LT', 'LITRO', 1);
INSERT INTO `unidad` VALUES ('mt', 'METRO', 1);
INSERT INTO `unidad` VALUES ('NIU', 'UNIDAD', 1);
INSERT INTO `unidad` VALUES ('PAQ', 'PAQUETE', 1);

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `clave` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `idperfil` int(11) NOT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idusuario`) USING BTREE,
  INDEX `idperfil`(`idperfil`) USING BTREE,
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, 'ANTONIO', 'admin', 'dd5fef9c1c1da1394d6d34b248c51be2ad740840', 1, 1);
INSERT INTO `usuario` VALUES (2, 'CARLOS ALBERTO', 'carlosalberto', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 1);
INSERT INTO `usuario` VALUES (3, 'Pedro Perez', 'pedrito', '7c4a8d09ca3762af61e59520943dc26494f8941b', 6, 0);
INSERT INTO `usuario` VALUES (4, 'JUAN CARLOS', 'juan', 'cfa1150f1787186742a9a884b73a43d8cf219f9b', 2, 2);

-- ----------------------------
-- Table structure for usuariosucusal
-- ----------------------------
DROP TABLE IF EXISTS `usuariosucusal`;
CREATE TABLE `usuariosucusal`  (
  `idusuariosucusal` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idusuariosucusal`) USING BTREE,
  INDEX `idusuario`(`idusuario`) USING BTREE,
  INDEX `idsucursal`(`idsucursal`) USING BTREE,
  CONSTRAINT `usuariosucusal_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuariosucusal_ibfk_2` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuariosucusal
-- ----------------------------
INSERT INTO `usuariosucusal` VALUES (58, 2, 6, 1);
INSERT INTO `usuariosucusal` VALUES (59, 2, 5, 1);
INSERT INTO `usuariosucusal` VALUES (61, 2, 4, 1);
INSERT INTO `usuariosucusal` VALUES (62, 2, 3, 1);
INSERT INTO `usuariosucusal` VALUES (63, 2, 2, 1);
INSERT INTO `usuariosucusal` VALUES (64, 2, 7, 1);
INSERT INTO `usuariosucusal` VALUES (87, 1, 4, 1);
INSERT INTO `usuariosucusal` VALUES (88, 1, 5, 1);

-- ----------------------------
-- Table structure for venta
-- ----------------------------
DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta`  (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NULL DEFAULT NULL,
  `idcliente` int(11) NULL DEFAULT NULL,
  `idtipocomprobante` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serie` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `correlativo` int(11) NULL DEFAULT NULL,
  `total` decimal(15, 2) NULL DEFAULT NULL,
  `total_gravado` decimal(15, 2) NULL DEFAULT NULL,
  `total_exonerado` decimal(15, 2) NULL DEFAULT NULL,
  `total_inafecto` decimal(15, 2) NULL DEFAULT NULL,
  `total_igv` decimal(15, 2) NULL DEFAULT NULL,
  `total_icbper` decimal(15, 2) NULL DEFAULT NULL,
  `total_descuento` decimal(15, 2) NULL DEFAULT NULL,
  `formapago` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idmoneda` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vencimiento` date NULL DEFAULT NULL,
  `guiaremision` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordencompra` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idusuario` int(11) NULL DEFAULT NULL,
  `idsucursal` int(11) NULL DEFAULT NULL,
  `estado` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idventa`) USING BTREE,
  INDEX `idmoneda`(`idmoneda`) USING BTREE,
  INDEX `idcliente`(`idcliente`) USING BTREE,
  INDEX `idtipocomprobante`(`idtipocomprobante`) USING BTREE,
  INDEX `idusuario`(`idusuario`) USING BTREE,
  INDEX `idsucursal`(`idsucursal`) USING BTREE,
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`idtipocomprobante`) REFERENCES `tipocomprobante` (`idtipocomprobante`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `venta_ibfk_4` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `venta_ibfk_5` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of venta
-- ----------------------------
INSERT INTO `venta` VALUES (1, '2022-01-05', 7, '03', 'B001', 136, 10.00, 8.47, 0.00, 0.00, 1.53, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (2, '2022-01-20', 7, '03', 'B001', 137, 9.00, 7.63, 0.00, 0.00, 1.37, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (3, '2022-02-16', 1, '03', 'B001', 138, 18.00, 15.25, 0.00, 0.00, 2.75, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (4, '2022-03-24', 7, '03', 'B001', 139, 12.00, 10.17, 0.00, 0.00, 1.83, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (5, '2022-04-20', 7, '03', 'B001', 140, 21.00, 17.80, 0.00, 0.00, 3.20, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (6, '2022-05-26', 7, '03', 'B001', 141, 19.20, 16.27, 0.00, 0.00, 2.93, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (7, '2022-06-23', 7, '03', 'B001', 142, 40.00, 33.90, 0.00, 0.00, 6.10, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (8, '2022-07-19', 7, '03', 'B001', 143, 18.00, 15.25, 0.00, 0.00, 2.75, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (9, '2022-11-30', 7, '03', 'B001', 144, 105.00, 88.98, 0.00, 0.00, 16.02, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (10, '2022-08-24', 7, '03', 'B001', 145, 67.00, 56.78, 0.00, 0.00, 10.22, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (11, '2022-09-22', 2, '03', 'B001', 146, 46.00, 38.97, 0.00, 0.00, 7.03, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (12, '2022-10-25', 2, '01', 'F001', 31, 25.00, 21.18, 0.00, 0.00, 3.82, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (13, '2022-11-30', 2, '01', 'F001', 32, 40.00, 33.89, 0.00, 0.00, 6.11, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (14, '2022-01-01', 2, '01', 'F001', 33, 15.00, 12.71, 0.00, 0.00, 2.29, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (15, '2021-01-01', 2, '01', 'F001', 34, 15.00, 12.71, 0.00, 0.00, 2.29, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (16, '2022-11-15', 2, '01', 'F001', 35, 30.00, 25.42, 0.00, 0.00, 4.58, 0.00, 0.00, 'C', 'PEN', '0000-00-00', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (17, '2023-04-20', 14, '03', 'B001', 147, 11.80, 9.57, 0.00, 0.00, 1.73, 0.50, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (18, '2023-04-20', 14, '03', 'B001', 148, 22.60, 19.15, 0.00, 0.00, 3.45, 0.00, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (19, '2023-04-20', 15, '03', 'B001', 149, 39.20, 32.37, 0.00, 0.00, 5.83, 1.00, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (20, '2023-04-25', 11, '01', 'F001', 36, 20.00, 16.95, 0.00, 0.00, 3.05, 0.00, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (21, '2023-04-27', 15, '03', 'B001', 150, 10.80, 8.72, 0.00, 0.00, 1.58, 0.50, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (22, '2021-02-17', 15, '03', 'B001', 151, 16.80, 13.81, 0.00, 0.00, 2.49, 0.50, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (23, '2023-01-20', 16, '03', 'B001', 152, 0.60, 0.51, 0.00, 0.00, 0.09, 0.00, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (24, '2023-05-05', 15, '03', 'B001', 153, 16.80, 13.81, 0.00, 0.00, 2.49, 0.50, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (25, '2023-05-05', 11, '01', 'F001', 37, 20.00, 16.95, 0.00, 0.00, 3.05, 0.00, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (26, '2023-05-05', 14, '03', 'B001', 154, 40.00, 33.89, 0.00, 0.00, 6.11, 0.00, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (27, '2023-05-05', 14, '03', 'B001', 155, 10.80, 8.72, 0.00, 0.00, 1.58, 0.50, 0.00, 'D', 'PEN', '2023-05-12', '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (28, '2023-06-03', 17, '01', 'F001', 38, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (29, '2023-06-03', 18, '01', 'F001', 39, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);
INSERT INTO `venta` VALUES (30, '2023-06-03', 14, '02', '001', 1, 1.60, 0.51, 0.00, 0.00, 0.09, 1.00, 0.00, 'C', 'PEN', NULL, '', '', 1, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
