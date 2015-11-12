SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Maternidad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Maternidad` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Maternidad` ;

-- -----------------------------------------------------
-- Table `Maternidad`.`Seguridades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Maternidad`.`Seguridades` (
  `idSeguridad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSeguridad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Maternidad`.`Residencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Maternidad`.`Residencias` (
  `idResidencia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idResidencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Maternidad`.`Madres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Maternidad`.`Madres` (
  `idMadre` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `documento` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `fechaDeNacimento` DATE NOT NULL,
  `seguridad` INT NOT NULL,
  `residencia` INT NOT NULL,
  PRIMARY KEY (`idMadre`),
  INDEX `fk_Madres_Seguridades1_idx` (`seguridad` ASC),
  INDEX `fk_Madres_Residencias1_idx` (`residencia` ASC),
  CONSTRAINT `fk_Madres_Seguridades1`
    FOREIGN KEY (`seguridad`)
    REFERENCES `Maternidad`.`Seguridades` (`idSeguridad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Madres_Residencias1`
    FOREIGN KEY (`residencia`)
    REFERENCES `Maternidad`.`Residencias` (`idResidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Maternidad`.`Familiares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Maternidad`.`Familiares` (
  `idFamiliar` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `documento` VARCHAR(45) NOT NULL,
  `residencia` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `madre` INT NOT NULL,
  PRIMARY KEY (`idFamiliar`),
  INDEX `fk_Familiares_Madres_idx` (`madre` ASC),
  CONSTRAINT `fk_Familiares_Madres`
    FOREIGN KEY (`madre`)
    REFERENCES `Maternidad`.`Madres` (`idMadre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Maternidad`.`Embarazo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Maternidad`.`Embarazo` (
  `idEmbarazo` INT NOT NULL AUTO_INCREMENT,
  `fechaPosibleDeParto` DATE NOT NULL,
  `fechaPosibleDeEmbarazo` DATE NOT NULL,
  `obstreticos` VARCHAR(45) NOT NULL,
  `madre` INT NOT NULL,
  PRIMARY KEY (`idEmbarazo`),
  INDEX `fk_Embarazo_Madres1_idx` (`madre` ASC),
  CONSTRAINT `fk_Embarazo_Madres1`
    FOREIGN KEY (`madre`)
    REFERENCES `Maternidad`.`Madres` (`idMadre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Maternidad`.`Controles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Maternidad`.`Controles` (
  `idControl` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `realizado` TINYINT(1) NOT NULL,
  `embarazo` INT NOT NULL,
  PRIMARY KEY (`idControl`),
  INDEX `fk_Controles_Embarazo1_idx` (`embarazo` ASC),
  CONSTRAINT `fk_Controles_Embarazo1`
    FOREIGN KEY (`embarazo`)
    REFERENCES `Maternidad`.`Embarazo` (`idEmbarazo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
