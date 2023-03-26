-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2023 a las 10:06:11
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pizzeriav3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_pizza`
--

CREATE TABLE `categoria_pizza` (
  `id_categoria_pizza` int(5) NOT NULL,
  `tipo_categoria_pizza` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_pizza`
--

INSERT INTO `categoria_pizza` (`id_categoria_pizza`, `tipo_categoria_pizza`) VALUES
(1, 'mediana'),
(2, 'grande'),
(3, 'familiar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(5) NOT NULL,
  `tienda_id` int(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `codigo_postal` varchar(5) NOT NULL,
  `localidad` varchar(20) NOT NULL,
  `provincia` varchar(20) NOT NULL,
  `telefono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `tienda_id`, `nombre`, `apellido`, `direccion`, `codigo_postal`, `localidad`, `provincia`, `telefono`) VALUES
(1, 1, 'Marc', 'Lopez', 'Passeig de Gràcia, 51', '08025', 'Barcelona', 'Barcelona', 691864231),
(2, 1, 'Juan', 'Pereiro', 'Av. del Paral·lel, 88', '08724', 'Figureres', 'Girona', 645235910),
(3, 2, 'Lucia', 'Correa', 'C/ de la Asunción, 29', '32435', 'Valladolid', 'Valladolid', 630281927);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda`
--

CREATE TABLE `comanda` (
  `id_comanda` int(5) NOT NULL,
  `cliente_id` int(5) NOT NULL,
  `trabajador_id` int(5) NOT NULL,
  `order_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comanda`
--

INSERT INTO `comanda` (`id_comanda`, `cliente_id`, `trabajador_id`, `order_at`) VALUES
(1, 3, 3, '2023-03-23 08:56:27'),
(2, 1, 1, '2023-03-23 08:14:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda_productos`
--

CREATE TABLE `comanda_productos` (
  `comanda_id` int(5) NOT NULL,
  `producto_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comanda_productos`
--

INSERT INTO `comanda_productos` (`comanda_id`, `producto_id`) VALUES
(1, 3),
(1, 4),
(2, 1),
(2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(5) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `tipo` enum('pizza','hamburguesa','bebida') NOT NULL,
  `categoria_pizza_id` int(5) DEFAULT NULL,
  `imagen` varchar(40) NOT NULL,
  `precio` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `descripcion`, `tipo`, `categoria_pizza_id`, `imagen`, `precio`) VALUES
(1, 'Pizza mediana hawaiana', 'pizza', 1, 'pizza_mediana_hawaiana.jpg', '14.20'),
(2, 'Pizza familiar 4 quesos', 'pizza', 3, 'pizza_familiar_cuatro_quesos.jpg', '19.85'),
(3, 'Hamburguesa clásica', 'hamburguesa', NULL, 'hamburguesa_clasica.jpg', '8.99'),
(4, 'Agua 75cl', 'bebida', NULL, 'agua.jpg', '1.75');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id_tienda` int(5) NOT NULL,
  `nombre_tienda` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `codigo_postal` varchar(5) NOT NULL,
  `localidad` varchar(20) NOT NULL,
  `provincia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id_tienda`, `nombre_tienda`, `direccion`, `codigo_postal`, `localidad`, `provincia`) VALUES
(1, 'Tienda1 - BCN', 'Av. Catalunya, 32', '08123', 'Barcelona', 'Barcelona'),
(2, 'Tienda - GTF', 'Paseo de Palencia, 98', '74372', 'Getafe', 'Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `id_trabajador` int(5) NOT NULL,
  `tienda_id` int(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `cognom` varchar(20) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefono` int(9) NOT NULL,
  `tarea` enum('camarero','repartidor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`id_trabajador`, `tienda_id`, `nombre`, `cognom`, `nif`, `telefono`, `tarea`) VALUES
(1, 1, 'Maria', 'Fernandez', '74374732L', 673892192, 'camarero'),
(2, 1, 'Josep', 'Garrido', '74362737S', 627183913, 'repartidor'),
(3, 2, 'Jose Ramon', 'Perez', '23563247Q', 628491031, 'camarero');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_pizza`
--
ALTER TABLE `categoria_pizza`
  ADD PRIMARY KEY (`id_categoria_pizza`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`id_comanda`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `trabajador_id` (`trabajador_id`);

--
-- Indices de la tabla `comanda_productos`
--
ALTER TABLE `comanda_productos`
  ADD KEY `comanda_id` (`comanda_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categoria_pizza_id` (`categoria_pizza_id`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id_tienda`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`id_trabajador`),
  ADD KEY `botiga_id` (`tienda_id`),
  ADD KEY `tarea` (`tarea`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_pizza`
--
ALTER TABLE `categoria_pizza`
  MODIFY `id_categoria_pizza` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comanda`
--
ALTER TABLE `comanda`
  MODIFY `id_comanda` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id_tienda` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `id_trabajador` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tienda` (`id_tienda`);

--
-- Filtros para la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `comanda_ibfk_2` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id_trabajador`);

--
-- Filtros para la tabla `comanda_productos`
--
ALTER TABLE `comanda_productos`
  ADD CONSTRAINT `comanda_productos_ibfk_1` FOREIGN KEY (`comanda_id`) REFERENCES `comanda` (`id_comanda`),
  ADD CONSTRAINT `comanda_productos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_pizza_id`) REFERENCES `categoria_pizza` (`id_categoria_pizza`);

--
-- Filtros para la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tienda` (`id_tienda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
