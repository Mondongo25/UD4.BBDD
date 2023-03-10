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
-- Table `mydb`.`MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MATRICULA` (
  `FECHA` INT NOT NULL,
  `ALUMNO` VARCHAR(45) NOT NULL,
  `ASIGNATURA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FECHA`, `ALUMNO`),
  UNIQUE INDEX `ALUMNO_UNIQUE` (`ALUMNO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ASIGNATURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ASIGNATURA` (
  `NOMBRE` INT NOT NULL,
  `CREDITOS` VARCHAR(45) NOT NULL,
  `DEPARTAMENTO` VARCHAR(45) NOT NULL,
  `PROFESOR` VARCHAR(45) NOT NULL,
  `MATRICULA_FECHA` INT NOT NULL,
  `MATRICULA_ALUMNO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NOMBRE`),
  UNIQUE INDEX `NOMBRE_UNIQUE` (`NOMBRE` ASC) VISIBLE,
  INDEX `fk_ASIGNATURA_MATRICULA1_idx` (`MATRICULA_FECHA` ASC, `MATRICULA_ALUMNO` ASC) VISIBLE,
  CONSTRAINT `fk_ASIGNATURA_MATRICULA1`
    FOREIGN KEY (`MATRICULA_FECHA` , `MATRICULA_ALUMNO`)
    REFERENCES `mydb`.`MATRICULA` (`FECHA` , `ALUMNO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPARTAMENTO` (
  `NOMBRE` INT NOT NULL,
  `ASIGNATURA_NOMBRE` INT NOT NULL,
  PRIMARY KEY (`NOMBRE`),
  UNIQUE INDEX `NOMBRE_UNIQUE` (`NOMBRE` ASC) VISIBLE,
  INDEX `fk_DEPARTAMENTO_ASIGNATURA1_idx` (`ASIGNATURA_NOMBRE` ASC) VISIBLE,
  CONSTRAINT `fk_DEPARTAMENTO_ASIGNATURA1`
    FOREIGN KEY (`ASIGNATURA_NOMBRE`)
    REFERENCES `mydb`.`ASIGNATURA` (`NOMBRE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ALUMNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALUMNO` (
  `DNI` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDOS` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `DEPARTAMENTO_NOMBRE` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  INDEX `fk_ALUMNO_DEPARTAMENTO_idx` (`DEPARTAMENTO_NOMBRE` ASC) VISIBLE,
  CONSTRAINT `fk_ALUMNO_DEPARTAMENTO`
    FOREIGN KEY (`DEPARTAMENTO_NOMBRE`)
    REFERENCES `mydb`.`DEPARTAMENTO` (`NOMBRE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
