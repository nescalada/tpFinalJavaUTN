-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Servidor: sql3.freemysqlhosting.net
-- Tiempo de generaciÃ³n: 24-07-2014 a las 13:14:13
-- VersiÃ³n del servidor: 5.5.35-0ubuntu0.12.04.2
-- VersiÃ³n de PHP: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sql347551`
--
CREATE DATABASE `sql347551` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sql347551`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Localidad`
--

CREATE TABLE IF NOT EXISTS `Localidad` (
  `idLocalidad` int(11) NOT NULL,
  `localidad` varchar(100) DEFAULT NULL,
  `idProvincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLocalidad`),
  KEY `fk_Localidad_Provincia` (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Localidad`
--

INSERT INTO `Localidad` (`idLocalidad`, `localidad`, `idProvincia`) VALUES
(0, 'Villa MarÃ­a Grande', 1),
(1, 'ParanÃ¡', 1),
(2, 'Hasenkamp', 1),
(3, 'Rosario', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ObraSocial`
--

CREATE TABLE IF NOT EXISTS `ObraSocial` (
  `idObraSocial` int(11) NOT NULL,
  `obraSocial` varchar(100) DEFAULT NULL,
  `obraSocialDetalle` varchar(255) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `celular` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idObraSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ObraSocial`
--

INSERT INTO `ObraSocial` (`idObraSocial`, `obraSocial`, `obraSocialDetalle`, `telefono`, `celular`, `email`) VALUES
(0, 'OSECAC', 'Obra Social de los Empleados de Comercio y Actividades Civiles', NULL, NULL, NULL),
(1, 'OSPRERA', 'Obra Social del Personal Rural y Estibadores de la RepÃºblica Argentina', NULL, NULL, NULL),
(2, 'Swiss Medical', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Paciente_ObraSocial`
--

CREATE TABLE IF NOT EXISTS `Paciente_ObraSocial` (
  `idPaciente` int(11) NOT NULL,
  `idObraSocial` int(11) NOT NULL,
  `nroCarnet` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`,`idObraSocial`),
  KEY `fk_Paciente_ObraSocial_Pac` (`idPaciente`),
  KEY `fk_Paciente_ObraSocial_OS` (`idObraSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Paciente_ObraSocial`
--

INSERT INTO `Paciente_ObraSocial` (`idPaciente`, `idObraSocial`, `nroCarnet`) VALUES
(1, 0, 'NROC00321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Persona`
--

CREATE TABLE IF NOT EXISTS `Persona` (
  `idPersona` int(11) NOT NULL,
  `idLocalidad` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `tipoDoc` varchar(100) DEFAULT NULL,
  `numeroDoc` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `celular` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sexo` varchar(100) DEFAULT NULL,
  `fechaNac` datetime DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `profesion` varchar(100) DEFAULT NULL,
  `matricula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  KEY `fk_Persona_Localidad` (`idLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Persona`
--

INSERT INTO `Persona` (`idPersona`, `idLocalidad`, `nombre`, `apellido`, `tipoDoc`, `numeroDoc`, `direccion`, `telefono`, `celular`, `email`, `sexo`, `fechaNac`, `user`, `pass`, `profesion`, `matricula`) VALUES
(0, 0, 'VerÃ³nica', 'Pautasso', 'DNI', '36601816', 'Av. Artigas 225', '034644485604', '0346815405608', 'contacto@lafono.com.ar', 'Femenino', '1986-11-25 00:00:00', 'fono', 'pass', 'Licenciada en FonoaudiologÃ­a', '285'),
(1, 3, 'Nehuen', 'Escalada', 'DNI', '36601816', 'Rioja 715', NULL, '0346915694952', 'nehuenescalada@algo.com', 'Masculino', '1991-11-02 00:00:00', 'nehuen', 'pass', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Practica`
--

CREATE TABLE IF NOT EXISTS `Practica` (
  `idPractica` int(11) NOT NULL,
  `practica` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPractica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Practica`
--

INSERT INTO `Practica` (`idPractica`, `practica`) VALUES
(0, 'Primera entrevista'),
(1, 'SesiÃ³n de reeducaciÃ³n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Practica_ObraSocial`
--

CREATE TABLE IF NOT EXISTS `Practica_ObraSocial` (
  `idPractica` int(11) NOT NULL,
  `idObraSocial` int(11) NOT NULL,
  `idPractica_ObraSocial` varchar(100) DEFAULT NULL,
  `practicaObraSocial` varchar(255) DEFAULT NULL,
  `valorAcordado` float DEFAULT NULL,
  PRIMARY KEY (`idPractica`,`idObraSocial`),
  KEY `fk_Practica_ObraSocial_Prac` (`idPractica`),
  KEY `fk_Practica_ObraSocial_ObrS` (`idObraSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Practica_ObraSocial`
--

INSERT INTO `Practica_ObraSocial` (`idPractica`, `idObraSocial`, `idPractica_ObraSocial`, `practicaObraSocial`, `valorAcordado`) VALUES
(0, 1, '510101', 'Entrevista de consulta y eval. diagnÃ³stica', 90),
(1, 0, '510102', 'SesiÃ³n de reeducaciÃ³n', 75),
(1, 1, '510102', 'SesiÃ³n de reeducaciÃ³n', 75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Practica_Sesion`
--

CREATE TABLE IF NOT EXISTS `Practica_Sesion` (
  `idPractica` int(11) NOT NULL,
  `idTratamiento` int(11) NOT NULL,
  `fechaHoraInicio` datetime NOT NULL,
  `cobro` float DEFAULT NULL,
  PRIMARY KEY (`idPractica`,`idTratamiento`,`fechaHoraInicio`),
  KEY `fk_Practica_Sesion_Ses` (`idTratamiento`,`fechaHoraInicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Practica_Sesion`
--

INSERT INTO `Practica_Sesion` (`idPractica`, `idTratamiento`, `fechaHoraInicio`, `cobro`) VALUES
(0, 0, '2014-07-24 14:20:00', 110);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Profesional_Paciente`
--

CREATE TABLE IF NOT EXISTS `Profesional_Paciente` (
  `idProfesional` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idProfesional`,`idPaciente`),
  KEY `fk_Profesional_Paciente_Prof` (`idProfesional`),
  KEY `fk_Profesional_Paciente_Pers` (`idPaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Profesional_Paciente`
--

INSERT INTO `Profesional_Paciente` (`idProfesional`, `idPaciente`) VALUES
(0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Provincia`
--

CREATE TABLE IF NOT EXISTS `Provincia` (
  `idProvincia` int(11) NOT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Provincia`
--

INSERT INTO `Provincia` (`idProvincia`, `provincia`) VALUES
(0, 'Santa Fe'),
(1, 'Entre RÃ­os');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sesion`
--

CREATE TABLE IF NOT EXISTS `Sesion` (
  `idTratamiento` int(11) NOT NULL,
  `fechaHoraInicio` datetime NOT NULL,
  `observaciones` longtext,
  `idObraSocial` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTratamiento`,`fechaHoraInicio`),
  KEY `fk_Sesion_Tratamiento` (`idTratamiento`),
  KEY `fk_Sesion_ObraSocial` (`idObraSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Sesion`
--

INSERT INTO `Sesion` (`idTratamiento`, `fechaHoraInicio`, `observaciones`, `idObraSocial`) VALUES
(0, '2014-07-24 14:20:00', 'Su hermana Amancay Escalada lo derivÃ³ a la FonoaudiÃ³loga ya que el paciente habla demasiado rÃ¡pido y no se le entiende.\r\n\r\nEl paciente cuenta que estudia IngenierÃ­a en Sistemas de InformaciÃ³n y trabaja actualmente en la Caja de Jubilaciones y Pensiones de la Provincia de Santa Fe.', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tratamiento`
--

CREATE TABLE IF NOT EXISTS `Tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `motivoConsulta` varchar(255) DEFAULT NULL,
  `loDeriva` varchar(255) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idTratamiento`,`idPaciente`),
  KEY `fk_Tratamiento_Paciente` (`idPaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Tratamiento`
--

INSERT INTO `Tratamiento` (`idTratamiento`, `idPaciente`, `motivoConsulta`, `loDeriva`, `estado`) VALUES
(0, 1, 'Habla rÃ¡pido y balbucea', 'Su hermana', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Localidad`
--
ALTER TABLE `Localidad`
  ADD CONSTRAINT `fk_Localidad_Provincia` FOREIGN KEY (`idProvincia`) REFERENCES `Provincia` (`idProvincia`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Paciente_ObraSocial`
--
ALTER TABLE `Paciente_ObraSocial`
  ADD CONSTRAINT `fk_Paciente_ObraSocial_Pac` FOREIGN KEY (`idPaciente`) REFERENCES `Persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Paciente_ObraSocial_OS` FOREIGN KEY (`idObraSocial`) REFERENCES `ObraSocial` (`idObraSocial`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Persona`
--
ALTER TABLE `Persona`
  ADD CONSTRAINT `fk_Persona_Localidad` FOREIGN KEY (`idLocalidad`) REFERENCES `Localidad` (`idLocalidad`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Practica_ObraSocial`
--
ALTER TABLE `Practica_ObraSocial`
  ADD CONSTRAINT `fk_Practica_ObraSocial_Prac` FOREIGN KEY (`idPractica`) REFERENCES `Practica` (`idPractica`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Practica_ObraSocial_ObrS` FOREIGN KEY (`idObraSocial`) REFERENCES `ObraSocial` (`idObraSocial`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Practica_Sesion`
--
ALTER TABLE `Practica_Sesion`
  ADD CONSTRAINT `fk_Practica_Sesion_Ses` FOREIGN KEY (`idTratamiento`, `fechaHoraInicio`) REFERENCES `Sesion` (`idTratamiento`, `fechaHoraInicio`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Profesional_Paciente`
--
ALTER TABLE `Profesional_Paciente`
  ADD CONSTRAINT `fk_Profesional_Paciente_Prof` FOREIGN KEY (`idProfesional`) REFERENCES `Persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Profesional_Paciente_Pers` FOREIGN KEY (`idPaciente`) REFERENCES `Persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Sesion`
--
ALTER TABLE `Sesion`
  ADD CONSTRAINT `fk_Sesion_Tratamiento` FOREIGN KEY (`idTratamiento`) REFERENCES `Tratamiento` (`idTratamiento`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sesion_ObraSocial` FOREIGN KEY (`idObraSocial`) REFERENCES `ObraSocial` (`idObraSocial`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Tratamiento`
--
ALTER TABLE `Tratamiento`
  ADD CONSTRAINT `fk_Tratamiento_Paciente` FOREIGN KEY (`idPaciente`) REFERENCES `Persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
