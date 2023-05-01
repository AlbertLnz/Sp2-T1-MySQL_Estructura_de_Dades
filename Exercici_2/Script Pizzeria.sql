-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-05-2023 a las 16:16:02
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
-- Base de datos: `pizzeria_v4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `botiga`
--

CREATE TABLE `botiga` (
  `id_botiga` int(5) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `provincia_id` int(5) NOT NULL,
  `localitat_id` int(5) NOT NULL,
  `adreca` varchar(50) NOT NULL,
  `codi_postal` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `botiga`
--

INSERT INTO `botiga` (`id_botiga`, `nom`, `provincia_id`, `localitat_id`, `adreca`, `codi_postal`) VALUES
(1, 'Dominos - Mataró', 1, 1, 'Carrer de la Riera, 128', '08303'),
(3, 'Dominos - Vigo', 3, 4, 'Rúa Severo Ochoa, 83', '36203');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_pizza`
--

CREATE TABLE `categoria_pizza` (
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_pizza`
--

INSERT INTO `categoria_pizza` (`nom`) VALUES
('Grande'),
('Mediana'),
('Pequeña');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(5) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cognoms` varchar(40) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `provincia_id` int(5) NOT NULL,
  `localitat_id` int(5) NOT NULL,
  `codi_postal` int(5) NOT NULL,
  `adreca` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `nom`, `cognoms`, `telefon`, `provincia_id`, `localitat_id`, `codi_postal`, `adreca`) VALUES
(1, 'María', 'Pérez Castillo', '638291023', 2, 2, 28804, 'Calle Dámaso Alonso, 24'),
(2, 'Pedro', 'Tomir Querta', '673192085', 3, 4, 36202, 'Avenida de Castelao, 87'),
(3, 'Josep', 'Vela Miró', '621021143', 1, 1, 8303, 'Ronda O\'Donnell, 11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda`
--

CREATE TABLE `comanda` (
  `comanda_id` int(5) NOT NULL,
  `client_id` int(5) NOT NULL,
  `botiga_id` int(5) NOT NULL,
  `treballador_id` int(5) NOT NULL,
  `preu` float(5,2) DEFAULT NULL,
  `order_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delivery_at` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comanda`
--

INSERT INTO `comanda` (`comanda_id`, `client_id`, `botiga_id`, `treballador_id`, `preu`, `order_at`, `delivery_at`) VALUES
(2, 3, 1, 4, NULL, '2023-05-01 14:07:23', '20:07:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llista_comanda`
--

CREATE TABLE `llista_comanda` (
  `id_comanda` int(5) NOT NULL,
  `producte_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `llista_comanda`
--

INSERT INTO `llista_comanda` (`id_comanda`, `producte_id`) VALUES
(2, 2),
(2, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llista_treballadors`
--

CREATE TABLE `llista_treballadors` (
  `id_llista_treballadors` varchar(30) NOT NULL DEFAULT '',
  `treballador_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `llista_treballadors`
--

INSERT INTO `llista_treballadors` (`id_llista_treballadors`, `treballador_id`) VALUES
('Dominos - Mataró', 3),
('Dominos - Mataró', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localitat`
--

CREATE TABLE `localitat` (
  `id_localitat` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `localitat`
--

INSERT INTO `localitat` (`id_localitat`, `nom`) VALUES
(1, 'Mataró'),
(2, 'Alcalá de Henares'),
(3, 'Camas'),
(4, 'Vigo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producte`
--

CREATE TABLE `producte` (
  `id_producte` int(5) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `tipus_producte_nom` varchar(20) NOT NULL,
  `categoria_pizza_nom` varchar(20) DEFAULT NULL,
  `descripcio` varchar(100) NOT NULL,
  `imatge` varchar(200) NOT NULL,
  `preu` float(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producte`
--

INSERT INTO `producte` (`id_producte`, `nom`, `tipus_producte_nom`, `categoria_pizza_nom`, `descripcio`, `imatge`, `preu`) VALUES
(1, 'Pizza hawaiana mediana', 'pizza', 'Mediana', 'Pizza hawaiana de temporada', 'pizza_hawaiana.jpg', 12.35),
(2, 'Pizza 4 quesos pequeña', 'pizza', 'Pequeña', 'Pizza 4 quesos descripción', '4quesos.jpg', 6.10),
(3, 'Fanta limón 20cl', 'beguda', NULL, 'fanta limón', 'fanta_limon.jpg', 2.01),
(4, 'Hamburguesa clàsica', 'hamburguesa', NULL, 'hambuerguesa clàsica especial', 'clasica.jpg', 10.20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id_provincia`, `nom`) VALUES
(1, 'Barcelona'),
(2, 'Madrid'),
(3, 'Pontevedra'),
(4, 'Sevilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus_producte`
--

CREATE TABLE `tipus_producte` (
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipus_producte`
--

INSERT INTO `tipus_producte` (`nom`) VALUES
('beguda'),
('hamburguesa'),
('pizza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `treballador`
--

CREATE TABLE `treballador` (
  `id_treballador` int(5) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cognoms` varchar(40) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `botiga_nom` varchar(30) NOT NULL DEFAULT '',
  `rol` enum('repartidor','contable','cambrer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `treballador`
--

INSERT INTO `treballador` (`id_treballador`, `nom`, `cognoms`, `nif`, `telefon`, `botiga_nom`, `rol`) VALUES
(3, 'Júlia', 'Porta Milo', '37192399S', '621910123', 'Dominos - Mataró', 'repartidor'),
(4, 'Miquel', 'Garcia Lutre', '83192033Q', '631920133', 'Dominos - Mataró', 'cambrer');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `botiga`
--
ALTER TABLE `botiga`
  ADD PRIMARY KEY (`id_botiga`),
  ADD KEY `provincia_id` (`provincia_id`),
  ADD KEY `localitat_id` (`localitat_id`),
  ADD KEY `nom` (`nom`);

--
-- Indices de la tabla `categoria_pizza`
--
ALTER TABLE `categoria_pizza`
  ADD KEY `nom` (`nom`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `provincia_id` (`provincia_id`),
  ADD KEY `localitat_id` (`localitat_id`);

--
-- Indices de la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`comanda_id`),
  ADD KEY `treballador_id` (`treballador_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `botiga_id` (`botiga_id`);

--
-- Indices de la tabla `llista_comanda`
--
ALTER TABLE `llista_comanda`
  ADD KEY `id_comanda` (`id_comanda`),
  ADD KEY `id_comanda_2` (`id_comanda`),
  ADD KEY `producte_id` (`producte_id`);

--
-- Indices de la tabla `llista_treballadors`
--
ALTER TABLE `llista_treballadors`
  ADD KEY `id_llista_treballadors` (`id_llista_treballadors`),
  ADD KEY `treballador_id` (`treballador_id`);

--
-- Indices de la tabla `localitat`
--
ALTER TABLE `localitat`
  ADD PRIMARY KEY (`id_localitat`);

--
-- Indices de la tabla `producte`
--
ALTER TABLE `producte`
  ADD PRIMARY KEY (`id_producte`),
  ADD KEY `tipus_producte_id` (`tipus_producte_nom`),
  ADD KEY `categoria_pizza_id` (`categoria_pizza_nom`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`);

--
-- Indices de la tabla `tipus_producte`
--
ALTER TABLE `tipus_producte`
  ADD KEY `nom` (`nom`);

--
-- Indices de la tabla `treballador`
--
ALTER TABLE `treballador`
  ADD PRIMARY KEY (`id_treballador`),
  ADD UNIQUE KEY `nif` (`nif`),
  ADD KEY `botiga_nom` (`botiga_nom`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `botiga`
--
ALTER TABLE `botiga`
  MODIFY `id_botiga` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comanda`
--
ALTER TABLE `comanda`
  MODIFY `comanda_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `localitat`
--
ALTER TABLE `localitat`
  MODIFY `id_localitat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producte`
--
ALTER TABLE `producte`
  MODIFY `id_producte` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `treballador`
--
ALTER TABLE `treballador`
  MODIFY `id_treballador` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `botiga`
--
ALTER TABLE `botiga`
  ADD CONSTRAINT `botiga_ibfk_2` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id_provincia`),
  ADD CONSTRAINT `botiga_ibfk_3` FOREIGN KEY (`localitat_id`) REFERENCES `localitat` (`id_localitat`);

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id_provincia`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`localitat_id`) REFERENCES `localitat` (`id_localitat`);

--
-- Filtros para la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `comanda_ibfk_2` FOREIGN KEY (`botiga_id`) REFERENCES `botiga` (`id_botiga`),
  ADD CONSTRAINT `comanda_ibfk_3` FOREIGN KEY (`treballador_id`) REFERENCES `treballador` (`id_treballador`);

--
-- Filtros para la tabla `llista_comanda`
--
ALTER TABLE `llista_comanda`
  ADD CONSTRAINT `llista_comanda_ibfk_1` FOREIGN KEY (`id_comanda`) REFERENCES `comanda` (`comanda_id`),
  ADD CONSTRAINT `llista_comanda_ibfk_2` FOREIGN KEY (`producte_id`) REFERENCES `producte` (`id_producte`);

--
-- Filtros para la tabla `llista_treballadors`
--
ALTER TABLE `llista_treballadors`
  ADD CONSTRAINT `llista_treballadors_ibfk_1` FOREIGN KEY (`id_llista_treballadors`) REFERENCES `botiga` (`nom`),
  ADD CONSTRAINT `llista_treballadors_ibfk_2` FOREIGN KEY (`treballador_id`) REFERENCES `treballador` (`id_treballador`);

--
-- Filtros para la tabla `producte`
--
ALTER TABLE `producte`
  ADD CONSTRAINT `producte_ibfk_2` FOREIGN KEY (`categoria_pizza_nom`) REFERENCES `categoria_pizza` (`nom`),
  ADD CONSTRAINT `producte_ibfk_3` FOREIGN KEY (`tipus_producte_nom`) REFERENCES `tipus_producte` (`nom`);

--
-- Filtros para la tabla `treballador`
--
ALTER TABLE `treballador`
  ADD CONSTRAINT `treballador_ibfk_1` FOREIGN KEY (`botiga_nom`) REFERENCES `botiga` (`nom`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
