-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pacient` (
  `idPacient` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `NumeroSegSocial` INT NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `DNI/NIE/Passaport` VARCHAR(45) NULL,
  PRIMARY KEY (`idPacient`, `NumeroSegSocial`),
  UNIQUE INDEX `NumeroSegSocial_UNIQUE` (`NumeroSegSocial` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Metge` (
  `NumCol·legiat` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `DNI/NIE/Passaport` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumCol·legiat`),
  UNIQUE INDEX `NumCol·legiat_UNIQUE` (`NumCol·legiat` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `Pacient_idPacient` INT NOT NULL,
  `Pacient_NumeroSegSocial` INT NOT NULL,
  `Metge_NumCol·legiat` INT NOT NULL,
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_idPacient` ASC, `Pacient_NumeroSegSocial` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_NumCol·legiat` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_idPacient` , `Pacient_NumeroSegSocial`)
    REFERENCES `mydb`.`Pacient` (`idPacient` , `NumeroSegSocial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_NumCol·legiat`)
    REFERENCES `mydb`.`Metge` (`NumCol·legiat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROYECCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROYECCION` (
  `CINE` INT NOT NULL,
  `PELICULA_TITOL` VARCHAR(45) NOT NULL,
  `DATA` VARCHAR(45) NOT NULL,
  `HORA` VARCHAR(45) NOT NULL,
  `SALA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CINE`),
  UNIQUE INDEX `CINE_UNIQUE` (`CINE` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PELICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PELICULA` (
  `TITULO` INT NOT NULL,
  `CLASIFICACION` VARCHAR(45) NOT NULL,
  `GENERO` VARCHAR(45) NOT NULL,
  `DIRECTOR` VARCHAR(45) NOT NULL,
  `DURACION` VARCHAR(45) NOT NULL,
  `PROYECCION_CINE` INT NOT NULL,
  PRIMARY KEY (`TITULO`),
  INDEX `fk_PELICULA_PROYECCION2_idx` (`PROYECCION_CINE` ASC) VISIBLE,
  CONSTRAINT `fk_PELICULA_PROYECCION2`
    FOREIGN KEY (`PROYECCION_CINE`)
    REFERENCES `mydb`.`PROYECCION` (`CINE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CINE` (
  `NOMBRE` INT NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `POBLACION` VARCHAR(45) NOT NULL,
  `NUMERO` VARCHAR(45) NOT NULL,
  `SALES` VARCHAR(45) NOT NULL,
  `ID` VARCHAR(45) NOT NULL,
  `PELICULA_TITULO` INT NOT NULL,
  PRIMARY KEY (`NOMBRE`),
  UNIQUE INDEX `NOMBRE_UNIQUE` (`NOMBRE` ASC) VISIBLE,
  INDEX `fk_CINE_PELICULA2_idx` (`PELICULA_TITULO` ASC) VISIBLE,
  CONSTRAINT `fk_CINE_PELICULA2`
    FOREIGN KEY (`PELICULA_TITULO`)
    REFERENCES `mydb`.`PELICULA` (`TITULO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TARIFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TARIFA` (
  `CINE` INT NOT NULL,
  `TIPOS` VARCHAR(45) NOT NULL,
  `PRECIO` VARCHAR(45) NOT NULL,
  `ID` VARCHAR(45) NOT NULL,
  `CINE_NOMBRE` INT NOT NULL,
  PRIMARY KEY (`CINE`),
  UNIQUE INDEX `CINE_UNIQUE` (`CINE` ASC) VISIBLE,
  INDEX `fk_TARIFA_CINE2_idx` (`CINE_NOMBRE` ASC) VISIBLE,
  CONSTRAINT `fk_TARIFA_CINE2`
    FOREIGN KEY (`CINE_NOMBRE`)
    REFERENCES `mydb`.`CINE` (`NOMBRE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROYECCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROYECCION` (
  `CINE` INT NOT NULL,
  `PELICULA_TITOL` VARCHAR(45) NOT NULL,
  `DATA` VARCHAR(45) NOT NULL,
  `HORA` VARCHAR(45) NOT NULL,
  `SALA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CINE`),
  UNIQUE INDEX `CINE_UNIQUE` (`CINE` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PELICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PELICULA` (
  `TITULO` INT NOT NULL,
  `CLASIFICACION` VARCHAR(45) NOT NULL,
  `GENERO` VARCHAR(45) NOT NULL,
  `DIRECTOR` VARCHAR(45) NOT NULL,
  `DURACION` VARCHAR(45) NOT NULL,
  `PROYECCION_CINE` INT NOT NULL,
  PRIMARY KEY (`TITULO`),
  INDEX `fk_PELICULA_PROYECCION2_idx` (`PROYECCION_CINE` ASC) VISIBLE,
  CONSTRAINT `fk_PELICULA_PROYECCION2`
    FOREIGN KEY (`PROYECCION_CINE`)
    REFERENCES `mydb`.`PROYECCION` (`CINE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CINE` (
  `NOMBRE` INT NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `POBLACION` VARCHAR(45) NOT NULL,
  `NUMERO` VARCHAR(45) NOT NULL,
  `SALES` VARCHAR(45) NOT NULL,
  `ID` VARCHAR(45) NOT NULL,
  `PELICULA_TITULO` INT NOT NULL,
  PRIMARY KEY (`NOMBRE`),
  UNIQUE INDEX `NOMBRE_UNIQUE` (`NOMBRE` ASC) VISIBLE,
  INDEX `fk_CINE_PELICULA2_idx` (`PELICULA_TITULO` ASC) VISIBLE,
  CONSTRAINT `fk_CINE_PELICULA2`
    FOREIGN KEY (`PELICULA_TITULO`)
    REFERENCES `mydb`.`PELICULA` (`TITULO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TARIFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TARIFA` (
  `CINE` INT NOT NULL,
  `TIPOS` VARCHAR(45) NOT NULL,
  `PRECIO` VARCHAR(45) NOT NULL,
  `ID` VARCHAR(45) NOT NULL,
  `CINE_NOMBRE` INT NOT NULL,
  PRIMARY KEY (`CINE`),
  UNIQUE INDEX `CINE_UNIQUE` (`CINE` ASC) VISIBLE,
  INDEX `fk_TARIFA_CINE2_idx` (`CINE_NOMBRE` ASC) VISIBLE,
  CONSTRAINT `fk_TARIFA_CINE2`
    FOREIGN KEY (`CINE_NOMBRE`)
    REFERENCES `mydb`.`CINE` (`NOMBRE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
