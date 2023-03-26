-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2023 a las 10:05:34
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
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(5) NOT NULL,
  `nom_empresa` varchar(20) NOT NULL,
  `codi_postal` mediumint(10) NOT NULL,
  `correu_electronic` varchar(45) NOT NULL,
  `data_registre` timestamp NOT NULL DEFAULT current_timestamp(),
  `recomanat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `nom_empresa`, `codi_postal`, `correu_electronic`, `data_registre`, `recomanat`) VALUES
(4, 'Optica Mari Carmen', 8329, 'opticamaricarmen2023@gmail.com', '2023-03-16 19:51:16', 'NO'),
(5, 'Optica Cadaqués', 17488, 'cadaquesvisio@outlook.es', '2023-03-16 19:52:05', 'SI'),
(6, 'Quiosc d\'en Pep', 73472, 'pepmartinez1956@gmail.com', '2023-03-16 19:53:13', 'SI'),
(7, 'Persianas Manel SL', 8192, 'persianasmanelbcn@gmail.com', '2023-03-16 19:53:46', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `id_proveidor` int(5) NOT NULL,
  `nom` varchar(15) NOT NULL,
  `adreca` varchar(40) NOT NULL,
  `telefon` int(9) NOT NULL,
  `fax` varchar(30) NOT NULL,
  `nif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveidor`
--

INSERT INTO `proveidor` (`id_proveidor`, `nom`, `adreca`, `telefon`, `fax`, `nif`) VALUES
(1, 'Oakley', 'Av. Mataró nº32', 643342154, 'oakleycompany@gmail.com', '8437273132'),
(3, 'RayBan SA', 'C/ Marie Curie nº42', 673013824, 'raybainspain@gmail.com', '374391384J'),
(4, 'Prada', 'Rambla de Catalunya nº4', 672930183, 'prada_spain@gmail.com', '374819304P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `treballadors`
--

CREATE TABLE `treballadors` (
  `id_treballador` int(6) NOT NULL,
  `nom` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `treballadors`
--

INSERT INTO `treballadors` (`id_treballador`, `nom`) VALUES
(1, 'Maria'),
(2, 'Pere');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `clients_id` int(11) NOT NULL,
  `treballador_id` int(6) NOT NULL,
  `proveidor_id` int(6) NOT NULL,
  `marca` varchar(10) NOT NULL,
  `graduacio` varchar(20) NOT NULL,
  `tipus_muntura` varchar(15) NOT NULL,
  `color_muntura` varchar(15) NOT NULL,
  `color_vidre` varchar(15) NOT NULL,
  `data_compra` date NOT NULL,
  `preu` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`clients_id`, `treballador_id`, `proveidor_id`, `marca`, `graduacio`, `tipus_muntura`, `color_muntura`, `color_vidre`, `data_compra`, `preu`) VALUES
(5, 1, 1, 'DG', 'progresivo', 'flotant', 'vermell', 'negre', '2023-03-21', '124.32'),
(6, 2, 4, 'Carrera', 'Blue Free', 'pasta', 'negre', 'blau', '2023-03-01', '76.03'),
(7, 1, 4, 'Louis Vuit', 'monofocal', 'metàl·lica', 'verd', 'verd', '2019-03-13', '214.97');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD UNIQUE KEY `nif` (`nif`);

--
-- Indices de la tabla `treballadors`
--
ALTER TABLE `treballadors`
  ADD PRIMARY KEY (`id_treballador`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`clients_id`),
  ADD KEY `treballador_id` (`treballador_id`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id_proveidor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `treballadors`
--
ALTER TABLE `treballadors`
  MODIFY `id_treballador` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `clients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`treballador_id`) REFERENCES `treballadors` (`id_treballador`),
  ADD CONSTRAINT `ulleres_ibfk_3` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`id_proveidor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
