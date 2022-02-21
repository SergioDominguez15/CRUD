
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Autoescuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `CodAct` int(11) NOT NULL,
  `NomAct` varchar(20) NOT NULL,
  `DescAct` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`CodAct`, `NomAct`, `DescAct`) VALUES
(1, 'AM', 'El permiso de conducir AM faculta al titular a circular con vehículos de dos y tres ruedas que no posean motores de más de 50 cc y que no superen la velocidad de 45 km/h.'),
(2, 'A1', 'El carnet A1 es un permiso de moto con el que podrás conducir motocicletas sin sidecar hasta 125 cc., con una potencia máxima de 11 KW y una relación potencia peso que no sobrepase los 0,1 kW/Kg.'),
(3, 'A2', 'El permiso de conducción de la clase A2 autoriza para conducir motocicletas con una potencia máxima de 35 Kw (48 CV) y una relación potencia/peso máxima de 0,2 kW/kg y no derivadas de un vehículo con más del doble de su potencia.'),
(4, 'B', 'El carnet B permite conducir turismos, furgonetas y, en general, vehículos cuya masa máxima autorizada no supere los 3.500 kg. y cuyo número de asientos no sea mayor de 9.'),
(5, 'C1', 'da permiso para conducir automóviles cuya masa supere los 3.500 kg., pero no exceda de los 7.500 kg.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apuntado`
--

CREATE TABLE `apuntado` (
  `CodCli` int(11) NOT NULL,
  `CodAct` int(11) NOT NULL,
  `FecApu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `apuntado`
--

INSERT INTO `apuntado` (`CodCli`, `CodAct`, `FecApu`) VALUES
(1, 3, '1900-01-01'),
(22, 3, '1900-01-01'),
(343, 2, '1900-01-01'),
(1233, 5, '1900-01-01'),
(3245, 3, '1900-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `CodCli` int(11) NOT NULL,
  `NomCli` varchar(20) NOT NULL,
  `ApeCli` varchar(40) NOT NULL,
  `FechNac` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`CodCli`, `NomCli`, `ApeCli`, `FechNac`) VALUES
(1, 'Sergio', 'Dominguez Gomez', '1996-01-11'),
(2, 'Marcos', 'Fernández Nadales', '1999-05-07'),
(3, 'Diego', 'Rodriguez Barcos', '1999-01-01'),
(4, 'Alberto', 'Parra Toval', '1999-01-01'),
(5, 'Jose Antonio', 'Benitez Ruiz', '1999-05-07'),
(6, 'Alvaro', 'Linero Fernnandez', '1999-01-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`CodAct`),
  ADD UNIQUE KEY `NomAct` (`NomAct`);

--
-- Indices de la tabla `apuntado`
--
ALTER TABLE `apuntado`
  ADD PRIMARY KEY (`CodCli`,`CodAct`),
  ADD KEY `CodAct` (`CodAct`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CodCli`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apuntado`
--
ALTER TABLE `apuntado`
  ADD CONSTRAINT `apuntado_ibfk_1` FOREIGN KEY (`CodCli`) REFERENCES `cliente` (`CodCli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apuntado_ibfk_2` FOREIGN KEY (`CodAct`) REFERENCES `actividad` (`CodAct`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
