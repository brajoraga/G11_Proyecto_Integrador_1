-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20221214.fafa7d289d
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2025 a las 14:07:15
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdmarino`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `recargo` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `total_general` decimal(10,2) NOT NULL,
  `nombre_cliente` varchar(255) DEFAULT NULL,
  `documento_cliente` varchar(20) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierre_caja`
--

CREATE TABLE `cierre_caja` (
  `id` int(11) NOT NULL,
  `fecha_cierre` date NOT NULL,
  `hora_cierre` time DEFAULT curtime(),
  `usuario_id` int(11) NOT NULL,
  `saldo_inicial` decimal(10,2) NOT NULL DEFAULT 0.00,
  `obs` text DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT 0.00,
  `total_neto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `Codigo` varchar(30) DEFAULT NULL,
  `platillo_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `disponible` varchar(2) DEFAULT 'SI',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `nombre`, `descripcion`, `precio`, `categoria`, `imagen_url`, `disponible`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Ceviche', 'Se prepara con pescado fresco marinado en jugo de limón, ají, cebolla y cilantro. La combinación de ', 30.50, 'Aperitivo', 'https://barramaretazo.com/wp-content/uploads/2024/07/restaurante-marino-ceviche.webp', '1', '2025-05-15 11:05:10', '2025-05-15 11:05:10'),
(2, 'Arroz con Mariscos', 'Este plato combina arroz sazonado con una variedad de mariscos frescos como camarones, calamares y m', 29.90, 'Plato de fondo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiA1wc4_9kvYj4ACt-zVJEvf9NbUr1O0BXEQ&s', '1', '2025-05-15 11:05:10', '2025-05-15 11:05:10'),
(3, 'Pariguela', 'Es un plato de casa, con ingredientes marinos.', 45.00, 'Mariscos', '????\0JFIF\0\0H\0H\0\0??\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(??\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((??\0?\"\0??\0\0\0\0\0\0\0\0\0\0\0	\n??\0?\0\0\0}\0!1AQa\"q2???', 'SI', '2025-06-05 02:34:14', '2025-06-05 02:34:14'),
(4, 'Pariguela', 'Es un plato de casa, con ingredientes marinos.', 45.00, 'Mariscos', '????\0JFIF\0\0H\0H\0\0??\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(??\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((??\0?\"\0??\0\0\0\0\0\0\0\0\0\0\0	\n??\0?\0\0\0}\0!1AQa\"q2???', 'SI', '2025-06-05 02:34:48', '2025-06-05 02:34:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `codigo_detalle` varchar(20) DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'Pendiente',
  `tipo` varchar(50) DEFAULT 'Para llevar',
  `total` decimal(10,2) NOT NULL,
  `notas` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `pass` varchar(30) NOT NULL DEFAULT '1234',
  `activo` tinyint(1) DEFAULT 1,
  `dni` varchar(10) DEFAULT NULL,
  `rol` varchar(100) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `pass`, `activo`, `dni`, `rol`, `fecha_creacion`) VALUES
(1, 'JOEL', '1234', 0, '77777777', '', '2025-05-15 03:48:31'),
(5, 'admin', 'admin123', 1, '12345678A', 'administrador', '2025-06-10 11:25:03'),
(6, 'mesero1', 'mesero123', 1, '87654321B', 'mesero', '2025-06-10 11:25:03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `cierre_caja`
--
ALTER TABLE `cierre_caja`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fecha_cierre` (`fecha_cierre`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD KEY `platillo_id` (`platillo_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_detalle` (`codigo_detalle`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cierre_caja`
--
ALTER TABLE `cierre_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `boleta_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `cierre_caja`
--
ALTER TABLE `cierre_caja`
  ADD CONSTRAINT `cierre_caja_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`platillo_id`) REFERENCES `menu` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
