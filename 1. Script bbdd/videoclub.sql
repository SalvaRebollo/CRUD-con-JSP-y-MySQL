-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-03-2018 a las 15:51:16
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `videoclub`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `idAlquiler` int(10) NOT NULL,
  `fecha` varchar(8) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fechaEntrega` varchar(8) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `socio` int(10) NOT NULL,
  `pelicula` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`idAlquiler`, `fecha`, `fechaEntrega`, `socio`, `pelicula`) VALUES
(1, '20-03-18', '80-03-18', 1, 5),
(2, '07-01-18', '09-01-18', 7, 8),
(3, '30-03-18', '2-04-18', 3, 2),
(4, '30-01-18', '09-02-18', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `idPelicula` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `genero` varchar(100) NOT NULL,
  `ano` int(4) NOT NULL DEFAULT '2018',
  `director` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`idPelicula`, `nombre`, `genero`, `ano`, `director`) VALUES
(1, 'La Guerra de las Galaxias', 'Ficcion', 1990, 'George Lucas'),
(2, 'Como Dios', 'Comedia', 2003, 'Tom Shadyac'),
(3, 'Arenas de Muerte', 'Clasico', 1957, 'Henry Hathaway'),
(4, 'A través del espejo', 'Cine Negro', 1946, 'Robert Siodmak'),
(5, 'Adios America', 'Drama', 1997, 'Thierry Notz'),
(6, 'El Principe y el Mendigo', 'Aventuras', 2000, 'Giles Foster'),
(7, 'Xingu: La misión al Amazonas', 'Aventuras', 2012, 'Cao Hamburger'),
(8, 'A Ghost Story', 'Fantastica', 2017, 'David Lowery'),
(9, 'Honey', 'Musical', 2003, 'Bille Woodruff'),
(10, 'American Psycho', 'Terror', 2000, 'Mary Harron');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `idSocio` int(10) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `ciudad` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `dni` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`idSocio`, `nombre`, `email`, `sexo`, `ciudad`, `dni`) VALUES
(1, 'Pepe', 'pepe@gmail.com', 'Hombre', 'Malaga', '00000000A'),
(2, 'Jose', 'jose@gmail.com', 'Hombre', 'Malaga', '11111111B'),
(3, 'Eduardo', 'eduardo@gmail.com', 'Hombre', 'Malaga', '22222222C'),
(4, 'Salvador', 'salvador@gmail.com', 'Hombre', 'Malaga', '55555555G'),
(5, 'Marivi', 'fantamiro@hotmail.es', 'Mujer', 'Malaga', '33357187B'),
(6, 'David', 'david@gmail.com', 'Hombre', 'Malaga', '77777777A'),
(7, 'Adan', 'adan@gmail.com', 'Hombre', 'Malaga', '9999999T');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`idAlquiler`),
  ADD KEY `socio` (`socio`),
  ADD KEY `pelicula` (`pelicula`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`idPelicula`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`idSocio`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `alquiler_ibfk_1` FOREIGN KEY (`socio`) REFERENCES `socio` (`idSocio`),
  ADD CONSTRAINT `alquiler_ibfk_2` FOREIGN KEY (`pelicula`) REFERENCES `pelicula` (`idPelicula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
