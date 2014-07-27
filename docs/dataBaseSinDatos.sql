delimiter $$

CREATE DATABASE `pacientes` /*!40100 DEFAULT CHARACTER SET utf8 */$$

delimiter $$

CREATE TABLE `Provincia` (
  `idProvincia` int(11) NOT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `Localidad` (
  `idLocalidad` int(11) NOT NULL,
  `localidad` varchar(100) DEFAULT NULL,
  `idProvincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLocalidad`),
  KEY `fk_Localidad_Provincia` (`idProvincia`),
  CONSTRAINT `fk_Localidad_Provincia` FOREIGN KEY (`idProvincia`) REFERENCES `Provincia` (`idProvincia`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `ObraSocial` (
  `idObraSocial` int(11) NOT NULL,
  `obraSocial` varchar(100) DEFAULT NULL,
  `obraSocialDetalle` varchar(255) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `celular` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idObraSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `Persona` (
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
  `fechaNac` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `profesion` varchar(100) DEFAULT NULL,
  `matricula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  KEY `fk_Persona_Localidad` (`idLocalidad`),
  CONSTRAINT `fk_Persona_Localidad` FOREIGN KEY (`idLocalidad`) REFERENCES `Localidad` (`idLocalidad`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `Paciente_ObraSocial` (
  `idPaciente` int(11) NOT NULL,
  `idObraSocial` int(11) NOT NULL,
  `nroCarnet` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`,`idObraSocial`),
  KEY `fk_Paciente_ObraSocial_Pac` (`idPaciente`),
  KEY `fk_Paciente_ObraSocial_OS` (`idObraSocial`),
  CONSTRAINT `fk_Paciente_ObraSocial_Pac` FOREIGN KEY (`idPaciente`) REFERENCES `Persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Paciente_ObraSocial_OS` FOREIGN KEY (`idObraSocial`) REFERENCES `ObraSocial` (`idObraSocial`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `Practica` (
  `idPractica` int(11) NOT NULL,
  `practica` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPractica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `Practica_ObraSocial` (
  `idPractica` int(11) NOT NULL,
  `idObraSocial` int(11) NOT NULL,
  `idPractica_ObraSocial` varchar(100) DEFAULT NULL,
  `practicaObraSocial` varchar(255) DEFAULT NULL,
  `valorAcordado` float DEFAULT NULL,
  PRIMARY KEY (`idPractica`,`idObraSocial`),
  KEY `fk_Practica_ObraSocial_Prac` (`idPractica`),
  KEY `fk_Practica_ObraSocial_ObrS` (`idObraSocial`),
  CONSTRAINT `fk_Practica_ObraSocial_Prac` FOREIGN KEY (`idPractica`) REFERENCES `Practica` (`idPractica`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Practica_ObraSocial_ObrS` FOREIGN KEY (`idObraSocial`) REFERENCES `ObraSocial` (`idObraSocial`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `Tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `motivoConsulta` varchar(255) DEFAULT NULL,
  `loDeriva` varchar(255) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idTratamiento`,`idPaciente`),
  KEY `fk_Tratamiento_Paciente` (`idPaciente`),
  CONSTRAINT `fk_Tratamiento_Paciente` FOREIGN KEY (`idPaciente`) REFERENCES `Persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `Sesion` (
  `idTratamiento` int(11) NOT NULL,
  `fechaHoraInicio` datetime NOT NULL,
  `observaciones` longtext,
  `idObraSocial` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTratamiento`,`fechaHoraInicio`),
  KEY `fk_Sesion_Tratamiento` (`idTratamiento`),
  KEY `fk_Sesion_ObraSocial` (`idObraSocial`),
  CONSTRAINT `fk_Sesion_Tratamiento` FOREIGN KEY (`idTratamiento`) REFERENCES `Tratamiento` (`idTratamiento`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Sesion_ObraSocial` FOREIGN KEY (`idObraSocial`) REFERENCES `ObraSocial` (`idObraSocial`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `Practica_Sesion` (
  `idPractica` int(11) NOT NULL,
  `idTratamiento` int(11) NOT NULL,
  `fechaHoraInicio` datetime NOT NULL,
  `cobro` float DEFAULT NULL,
  PRIMARY KEY (`idPractica`,`idTratamiento`,`fechaHoraInicio`),
  KEY `fk_Practica_Sesion_Ses` (`idTratamiento`,`fechaHoraInicio`),
  CONSTRAINT `fk_Practica_Sesion_Ses` FOREIGN KEY (`idTratamiento`, `fechaHoraInicio`) REFERENCES `Sesion` (`idTratamiento`, `fechaHoraInicio`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `Profesional_Paciente` (
  `idProfesional` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idProfesional`,`idPaciente`),
  KEY `fk_Profesional_Paciente_Prof` (`idProfesional`),
  KEY `fk_Profesional_Paciente_Pers` (`idPaciente`),
  CONSTRAINT `fk_Profesional_Paciente_Prof` FOREIGN KEY (`idProfesional`) REFERENCES `Persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Profesional_Paciente_Pers` FOREIGN KEY (`idPaciente`) REFERENCES `Persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

