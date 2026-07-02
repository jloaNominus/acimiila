-- acimiila.IsoPais definition

CREATE TABLE `IsoPais` (
  `cPais` char(2) NOT NULL,
`xPais` varchar(100) NOT NULL,
`cPhonePrefix` varchar(5) DEFAULT NULL,
`cCurrency` varchar(3) DEFAULT NULL,
`cCurrencySymbol` varchar(100) DEFAULT NULL,
PRIMARY KEY (`cPais`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.LrnIdioma definition

CREATE TABLE `LrnIdioma` (
  `bIdioma` tinyint(3) unsigned NOT NULL,
`xIdioma` varchar(30) NOT NULL,
`cForMoodle` char(1) DEFAULT NULL,
`bSteps` int(10) unsigned DEFAULT 10,
PRIMARY KEY (`bIdioma`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.LrnIntensidad definition

CREATE TABLE `LrnIntensidad` (
  `bIntensidad` tinyint(3) unsigned NOT NULL,
`cIntensidad` char(1) NOT NULL,
`lLun` tinyint(1) NOT NULL,
`lMar` tinyint(1) NOT NULL,
`lMie` tinyint(1) NOT NULL,
`lJue` tinyint(1) NOT NULL,
`lVie` tinyint(1) NOT NULL,
`lSab` tinyint(1) NOT NULL,
PRIMARY KEY (`bIntensidad`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.LrnSede definition

CREATE TABLE `LrnSede` (
  `bSede` tinyint(3) unsigned NOT NULL,
`xNombre` varchar(60) NOT NULL,
`cForMoodle` char(3) NOT NULL,
`cCodigo` char(3) NOT NULL,
PRIMARY KEY (`bSede`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.MatGrupoPadre definition

CREATE TABLE `MatGrupoPadre` (
  `sGrupoPadre` smallint(5) unsigned NOT NULL,
`bSede` tinyint(3) unsigned NOT NULL,
`bIntensidad` tinyint(3) unsigned NOT NULL,
`bIdioma` tinyint(3) unsigned NOT NULL,
`bStep` tinyint(3) unsigned NOT NULL,
PRIMARY KEY (`sGrupoPadre`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci;
-- acimiila.PerPersona definition

CREATE TABLE `PerPersona` (
  `iPersona` int(10) unsigned NOT NULL,
`xApellidos` varchar(60) NOT NULL,
`xNombres` varchar(60) NOT NULL,
PRIMARY KEY (`iPersona`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.PerPersonaDiscapacidadTipo definition

CREATE TABLE `PerPersonaDiscapacidadTipo` (
  `sDiscapacidad` smallint(5) unsigned NOT NULL,
`cCodigo` varchar(40) NOT NULL,
`xDescripcion` varchar(200) DEFAULT NULL,
PRIMARY KEY (`sDiscapacidad`),
UNIQUE KEY `PerPersonaDiscapacidadTipo_codigo_uk` (`cCodigo`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.PerPersonaGrupoTipo definition

CREATE TABLE `PerPersonaGrupoTipo` (
  `sGrupo` smallint(5) unsigned NOT NULL,
`cCodigo` varchar(40) NOT NULL,
`xDescripcion` varchar(200) DEFAULT NULL,
PRIMARY KEY (`sGrupo`),
UNIQUE KEY `PerGrupoTipo_codigo_uk` (`cCodigo`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.Persona definition

CREATE TABLE `IsoTipoDocumento` (
  `sTipoDocumento` smallint(5) unsigned NOT NULL,
`xTipoDocumento` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci DEFAULT NULL,
`cAbreviatura` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci DEFAULT NULL,
`cPais` char(2) DEFAULT NULL,
PRIMARY KEY (`sTipoDocumento`),
KEY `IsoTipoDocumento_IsoPais_FK` (`cPais`),
CONSTRAINT `IsoTipoDocumento_IsoPais_FK` FOREIGN KEY (`cPais`) REFERENCES `IsoPais` (`cPais`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.LrnGrupo definition

CREATE TABLE `LrnGrupo` (
  `iGrupo` int(10) unsigned NOT NULL,
`bSede` tinyint(3) unsigned NOT NULL,
`bIntensidad` tinyint(3) unsigned NOT NULL DEFAULT 49,
`bIdioma` tinyint(3) unsigned NOT NULL,
`bStep` tinyint(3) unsigned NOT NULL,
`sGrupo` smallint(5) unsigned NOT NULL DEFAULT 0,
`sConvenio` smallint(5) unsigned NOT NULL,
`dInicio` datetime NOT NULL,
`lVirtual` tinyint(1) NOT NULL DEFAULT 0,
`bMaxAforo` tinyint(3) unsigned NOT NULL,
`iDocente` int(10) unsigned DEFAULT NULL,
PRIMARY KEY (`iGrupo`),
KEY `LrnGrupo_LrnIntensidad_FK` (`bIntensidad`),
KEY `LrnGrupo_LrnSede_FK` (`bSede`),
KEY `LrnGrupo_LrnIdioma_FK` (`bIdioma`),
CONSTRAINT `LrnGrupo_LrnIdioma_FK` FOREIGN KEY (`bIdioma`) REFERENCES `LrnIdioma` (`bIdioma`),
CONSTRAINT `LrnGrupo_LrnIntensidad_FK` FOREIGN KEY (`bIntensidad`) REFERENCES `LrnIntensidad` (`bIntensidad`),
CONSTRAINT `LrnGrupo_LrnSede_FK` FOREIGN KEY (`bSede`) REFERENCES `LrnSede` (`bSede`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci;
-- acimiila.LrnHorario definition

CREATE TABLE `LrnHorario` (
  `iHorario` int(10) unsigned NOT NULL,
`iGrupo` int(10) unsigned NOT NULL,
`dInicio` datetime NOT NULL,
`dFinal` datetime NOT NULL,
PRIMARY KEY (`iHorario`),
KEY `LrnHorario_LrnGrupo_FK` (`iGrupo`),
CONSTRAINT `LrnHorario_LrnGrupo_FK` FOREIGN KEY (`iGrupo`) REFERENCES `LrnGrupo` (`iGrupo`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci;
-- acimiila.MatMatricula definition

CREATE TABLE `MatMatricula` (
  `iMatricula` int(10) unsigned NOT NULL,
`dFecha` datetime NOT NULL,
`iPersona` int(10) unsigned NOT NULL,
`sGrupoPadre` smallint(5) unsigned NOT NULL,
PRIMARY KEY (`iMatricula`),
KEY `MatMatricula_PerPersona_FK` (`iPersona`),
KEY `MatMatricula_MatGrupoPadre_FK` (`sGrupoPadre`),
CONSTRAINT `MatMatricula_MatGrupoPadre_FK` FOREIGN KEY (`sGrupoPadre`) REFERENCES `MatGrupoPadre` (`sGrupoPadre`),
CONSTRAINT `MatMatricula_PerPersona_FK` FOREIGN KEY (`iPersona`) REFERENCES `PerPersona` (`iPersona`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.MatNivelacion definition

CREATE TABLE `MatNivelacion` (
  `iNivelacion` int(10) unsigned NOT NULL,
`dFecha` datetime NOT NULL,
`iAlumno` int(10) unsigned NOT NULL,
`iDocente` int(10) unsigned NOT NULL,
`sGrupoPadre` smallint(5) unsigned DEFAULT NULL,
PRIMARY KEY (`iNivelacion`),
KEY `MatNivelacion_PerPersona_FK` (`iAlumno`),
KEY `MatNivelacion_MatGrupoPadre_FK` (`sGrupoPadre`),
CONSTRAINT `MatNivelacion_MatGrupoPadre_FK` FOREIGN KEY (`sGrupoPadre`) REFERENCES `MatGrupoPadre` (`sGrupoPadre`),
CONSTRAINT `MatNivelacion_PerPersona_FK` FOREIGN KEY (`iAlumno`) REFERENCES `PerPersona` (`iPersona`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci;
-- acimiila.PerEmail definition

CREATE TABLE `PerEmail` (
  `iPersona` int(10) unsigned NOT NULL,
`bConsecutivo` tinyint(3) unsigned NOT NULL,
`xEmail` varchar(100) DEFAULT NULL,
`lMoodle` tinyint(1) DEFAULT 0,
PRIMARY KEY (`iPersona`,
`bConsecutivo`),
CONSTRAINT `PerEmail_PerPersona_FK` FOREIGN KEY (`iPersona`) REFERENCES `PerPersona` (`iPersona`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.PerIdentidad definition

CREATE TABLE `PerIdentidad` (
  `iPersona` int(10) unsigned NOT NULL,
`bConsecutivo` tinyint(3) unsigned NOT NULL,
`sTipoDocumento` smallint(5) unsigned DEFAULT NULL,
`cDocumento` varchar(16) DEFAULT NULL,
PRIMARY KEY (`iPersona`,
`bConsecutivo`),
KEY `PerIdentidad_IsoTipoDocumento_FK` (`sTipoDocumento`),
CONSTRAINT `PerIdentidad_IsoTipoDocumento_FK` FOREIGN KEY (`sTipoDocumento`) REFERENCES `IsoTipoDocumento` (`sTipoDocumento`),
CONSTRAINT `PerIdentidad_PerPersona_FK` FOREIGN KEY (`iPersona`) REFERENCES `PerPersona` (`iPersona`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.PerPersonaDiscapacidad definition

CREATE TABLE `PerPersonaDiscapacidad` (
  `iPersona` int(10) unsigned NOT NULL,
`sDiscapacidad` smallint(5) unsigned NOT NULL,
`lTiene` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`iPersona`,
`sDiscapacidad`),
KEY `PerPersonaDiscapacidad_Tipo_FK` (`sDiscapacidad`),
CONSTRAINT `PerPersonaDiscapacidad_PerPersona_FK` FOREIGN KEY (`iPersona`) REFERENCES `PerPersona` (`iPersona`),
CONSTRAINT `PerPersonaDiscapacidad_Tipo_FK` FOREIGN KEY (`sDiscapacidad`) REFERENCES `PerPersonaDiscapacidadTipo` (`sDiscapacidad`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.PerPersonaGrupo definition

CREATE TABLE `PerPersonaGrupo` (
  `iPersona` int(10) unsigned NOT NULL,
`sGrupo` smallint(5) unsigned NOT NULL,
`lPertenece` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`iPersona`,
`sGrupo`),
KEY `PerPersonaGrupo_Grupo_FK` (`sGrupo`),
CONSTRAINT `PerPersonaGrupo_Grupo_FK` FOREIGN KEY (`sGrupo`) REFERENCES `PerPersonaGrupoTipo` (`sGrupo`),
CONSTRAINT `PerPersonaGrupo_PerPersona_FK` FOREIGN KEY (`iPersona`) REFERENCES `PerPersona` (`iPersona`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.PerTelefono definition

CREATE TABLE `PerTelefono` (
  `iPersona` int(10) unsigned NOT NULL,
`bConsecutivo` tinyint(3) unsigned NOT NULL,
`cPais` char(2) NOT NULL,
`xTelefono` varchar(12) NOT NULL,
`lMoodle` tinyint(1) NOT NULL DEFAULT 0,
`lFireAuth` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`iPersona`,
`bConsecutivo`),
KEY `PerTelefono_IsoPais_FK` (`cPais`),
CONSTRAINT `PerTelefono_IsoPais_FK` FOREIGN KEY (`cPais`) REFERENCES `IsoPais` (`cPais`),
CONSTRAINT `PerTelefono_PerPersona_FK` FOREIGN KEY (`iPersona`) REFERENCES `PerPersona` (`iPersona`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- acimiila.LrnDetalleHorario definition

CREATE TABLE `LrnDetalleHorario` (
  `iHorario` int(10) unsigned NOT NULL,
`dInicio` datetime NOT NULL,
`tTermina` time DEFAULT NULL,
PRIMARY KEY (`iHorario`,
`dInicio`),
CONSTRAINT `LrnDetalleHorario_LrnHorario_FK` FOREIGN KEY (`iHorario`) REFERENCES `LrnHorario` (`iHorario`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci;
-- acimiila.MatAltura definition

CREATE TABLE `MatAltura` (
  `iMatricula` int(10) unsigned NOT NULL,
`bAltura` tinyint(3) unsigned NOT NULL,
`iGrupo` int(10) unsigned DEFAULT NULL,
PRIMARY KEY (`iMatricula`,
`bAltura`),
KEY `MatAltura_LrnGrupo_FK` (`iGrupo`),
CONSTRAINT `MatAltura_LrnGrupo_FK` FOREIGN KEY (`iGrupo`) REFERENCES `LrnGrupo` (`iGrupo`),
CONSTRAINT `MatAltura_MatMatricula_FK` FOREIGN KEY (`iMatricula`) REFERENCES `MatMatricula` (`iMatricula`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci;
