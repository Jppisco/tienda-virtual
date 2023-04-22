-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2023 at 05:05 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tienda_virtual`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`) VALUES
(1, 'Pannier', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFBcVFRQXFxcYGhcXFxgaGhsaFxcYFxcYGBoXGBcdICwkGx0pHhgaJTYlKS4wMzMzGiI5PjkyPSwyMzABCwsLEA4QHhISHjUpIikyMjIyMjIyMjIyMjIyMjIyMjIyMDIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMv/AABEIAJwBQwMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAADAQIEBQYAB//EAD8QAAIBAgQDBwEFBQcEAwAAAAECEQADBBIhMQVBUQYTImFxgZGhFDJCUrEjwdHh8BVDYnKS0vEWM4KiNFNj/8QAGQEAAwEBAQAAAAAAAAAAAAAAAAECAwQF/8QAKBEAAgEDBQADAAIDAQEAAAAAAAECAxESEyExQVEEFGEyoYGRsVIi/9oADAMBAAIRAxEAPwCResnlUY2WO'),
(2, 'Matsoft', 'error: wrong number of arguments (given 3, expected 0)'),
(3, 'Keylex', 'error: wrong number of arguments (given 3, expected 0)'),
(4, 'Lotstring', 'error: wrong number of arguments (given 3, expected 0)'),
(5, 'Y-find', 'error: wrong number of arguments (given 3, expected 0)'),
(6, 'Sonsing', 'error: wrong number of arguments (given 3, expected 0)'),
(7, 'It', 'error: wrong number of arguments (given 3, expected 0)'),
(8, 'Tres-Zap', 'error: wrong number of arguments (given 3, expected 0)'),
(9, 'Voltsillam', 'error: wrong number of arguments (given 3, expected 0)'),
(10, 'Kanlam', 'error: wrong number of arguments (given 3, expected 0)'),
(11, 'Latlux', 'error: wrong number of arguments (given 3, expected 0)'),
(12, 'Lotstring', 'error: wrong number of arguments (given 3, expected 0)'),
(13, 'Domainer', 'error: wrong number of arguments (given 3, expected 0)'),
(14, 'Stringtough', 'error: wrong number of arguments (given 3, expected 0)'),
(15, 'Tempsoft', 'error: wrong number of arguments (given 3, expected 0)'),
(16, 'Greenlam', 'error: wrong number of arguments (given 3, expected 0)'),
(17, 'Temp', 'error: wrong number of arguments (given 3, expected 0)'),
(18, 'Andalax', 'error: wrong number of arguments (given 3, expected 0)'),
(19, 'Lotstring', 'error: wrong number of arguments (given 3, expected 0)'),
(20, 'Greenlam', 'error: wrong number of arguments (given 3, expected 0)');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(80) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `email_user` varchar(80) NOT NULL,
  `proceso` enum('1','2','3') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `id_categoria`) VALUES
(1, 'Syrup - Monin, Swiss Choclate', 'Remove Infusion Dev from Up Extrem Subcu/Fascia, Open', '657.58', 3929, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 1),
(2, 'Wine - Muscadet Sur Lie', 'Excision of Right Thyroid Gland Lobe, Perc Endo Approach', '181.26', 8902, 'error: wrong number of arguments (given 3, expecte', 2),
(3, 'Cocoa Powder - Natural', 'Drainage of Face Subcu/Fascia, Perc Approach, Diagn', '940.62', 43061, 'error: wrong number of arguments (given 3, expecte', 3),
(4, 'Bread - Dark Rye', 'Beam Radiation of Thymus using Photons <1 MeV', '285.41', 6599, 'error: wrong number of arguments (given 3, expecte', 4),
(5, 'Snapple Raspberry Tea', 'Revision of Int Fix in R Shoulder Jt, Perc Endo Approach', '271.56', 28, 'error: wrong number of arguments (given 3, expecte', 5),
(6, 'Pork - Loin, Boneless', 'Reposition L Humeral Shaft with Int Fix, Perc Endo Approach', '901.98', 61, 'error: wrong number of arguments (given 3, expecte', 6),
(7, 'Cheese - Grana Padano', 'Destruction of Lower Artery, Open Approach', '355.10', 99, 'error: wrong number of arguments (given 3, expecte', 7),
(8, 'Pepper - Orange', 'Alteration of L Shoulder with Nonaut Sub, Perc Approach', '183.50', 5759, 'error: wrong number of arguments (given 3, expecte', 8),
(9, 'Wine - Magnotta, White', 'Extirpation of Matter from Left Lacrimal Duct, Open Approach', '486.38', 272, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 9),
(10, 'Croissants Thaw And Serve', 'Occlusion of Carina with Intraluminal Device, Open Approach', '133.66', 841, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 10),
(11, 'Rum - Dark, Bacardi, Black', 'Removal of Drainage Device from Skull, Open Approach', '626.83', 2, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 11),
(12, 'Sprouts - Baby Pea Tendrils', 'Measurement of Gastrointestinal Motility, Via Opening', '477.63', 3196, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 12),
(13, 'Pork - Bones', 'Occlusion of L Neck Lymph with Extralum Dev, Perc Approach', '824.22', 255, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 13),
(14, 'Sauce - Apple, Unsweetened', 'Muscle Perform Assess Neuro Up Back/UE w Prosthesis', '370.36', 68, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 14),
(15, 'Rappini - Andy Boy', 'Removal of Intraluminal Device from Left Eye, Open Approach', '547.57', 14328, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 15),
(16, 'Oven Mitts - 15 Inch', 'Revision of Bone Stim in Up Bone, Extern Approach', '235.34', 9873, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 16),
(17, 'Zucchini - Yellow', 'Reposition Cecum, Percutaneous Endoscopic Approach', '984.00', 55709, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 17),
(18, 'Ice Cream Bar - Oreo Sandwich', 'Reposition Right Lower Femur with Ext Fix, Perc Approach', '266.93', 588, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 18),
(19, 'Bread - 10 Grain Parisian', 'Replacement of Splenic Vein with Synth Sub, Open Approach', '838.20', 8379, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 19),
(20, 'Wine - Lou Black Shiraz', 'Plain Radiography of Right Hand', '840.23', 99, 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
