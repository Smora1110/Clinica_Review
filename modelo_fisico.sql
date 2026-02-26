-- =====================================================
-- Modelo Físico de la Clínica Universitaria
-- =====================================================

-- Creación del esquema
CREATE SCHEMA IF NOT EXISTS `clinica_universitaria` DEFAULT CHARACTER SET utf8mb4;
USE `clinica_universitaria`;

-- Tabla de pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `idpaciente` VARCHAR(6) NOT NULL,
  `nombre_paciente` VARCHAR(45) NOT NULL,
  `apellido_paciente` VARCHAR(45) NOT NULL,
  `telefono_paciente` INT NOT NULL,
  PRIMARY KEY (`idpaciente`));

-- Tabla de facultades
CREATE TABLE IF NOT EXISTS `facultades` (
  `idfacultad` VARCHAR(6) NOT NULL,
  `nombre_facultad` VARCHAR(45) NOT NULL,
  `decano_facultad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfacultad`));

-- Tabla de especialidades
CREATE TABLE IF NOT EXISTS `especialidades` (
  `idespecialidad` VARCHAR(6) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idespecialidad`));

-- Tabla de médicos
CREATE TABLE IF NOT EXISTS `medicos` (
  `idmedico` VARCHAR(6) NOT NULL,
  `nombre_medico` VARCHAR(45) NOT NULL,
  `idfacultad` VARCHAR(6) NOT NULL,
  `idespecialidad` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`idmedico`),
  INDEX `fk_medicos_facultades` (`idfacultad`),
  INDEX `fk_medicos_especialidades` (`idespecialidad`),
  CONSTRAINT `fk_medicos_facultades`
    FOREIGN KEY (`idfacultad`) REFERENCES `facultades` (`idfacultad`),
  CONSTRAINT `fk_medicos_especialidades`
    FOREIGN KEY (`idespecialidad`) REFERENCES `especialidades` (`idespecialidad`));

-- Tabla de hospitales
CREATE TABLE IF NOT EXISTS `hospitales` (
  `idhospital` VARCHAR(6) NOT NULL,
  `hospital` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhospital`));

-- Tabla de citas médicas
CREATE TABLE IF NOT EXISTS `citas` (
  `idcita` VARCHAR(6) NOT NULL,
  `fecha_cita` DATE,
  `diagnostico` VARCHAR(255),
  `idmedico` VARCHAR(6) NOT NULL,
  `idpaciente` VARCHAR(6) NOT NULL,
  `idhospital` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`idcita`),
  INDEX `fk_citas_medicos` (`idmedico`),
  INDEX `fk_citas_pacientes` (`idpaciente`),
  INDEX `fk_citas_hospitales` (`idhospital`),
  CONSTRAINT `fk_citas_medicos`
    FOREIGN KEY (`idmedico`) REFERENCES `medicos` (`idmedico`),
  CONSTRAINT `fk_citas_pacientes`
    FOREIGN KEY (`idpaciente`) REFERENCES `pacientes` (`idpaciente`),
  CONSTRAINT `fk_citas_hospitales`
    FOREIGN KEY (`idhospital`) REFERENCES `hospitales` (`idhospital`));

-- Tabla de medicamentos
CREATE TABLE IF NOT EXISTS `medicamentos` (
  `idmedicamento` VARCHAR(6) NOT NULL,
  `medicamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmedicamento`));

-- Tabla de recetas médicas
CREATE TABLE IF NOT EXISTS `recetas` (
  `idreceta` VARCHAR(6) NOT NULL,
  `dosis` VARCHAR(45) NOT NULL,
  `idmedicamento` VARCHAR(6) NOT NULL,
  `idcita` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`idreceta`),
  INDEX `fk_recetas_medicamentos` (`idmedicamento`),
  INDEX `fk_recetas_citas` (`idcita`),
  CONSTRAINT `fk_recetas_medicamentos`
    FOREIGN KEY (`idmedicamento`) REFERENCES `medicamentos` (`idmedicamento`),
  CONSTRAINT `fk_recetas_citas`
    FOREIGN KEY (`idcita`) REFERENCES `citas` (`idcita`));

-- Tabla de log de errores
CREATE TABLE IF NOT EXISTS `log_errores` (
  `id_log` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre_tabla` VARCHAR(50),
  `codigo_error` VARCHAR(10),
  `mensaje_error` TEXT,
  `fecha_hora` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
