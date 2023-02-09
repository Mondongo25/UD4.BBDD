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
-- Table `mydb`.`TIPUS DE POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIPUS DE POLISSA` (
  `ID` VARCHAR(45) NOT NULL,
  `NOM` INT NOT NULL,
  `DESCRIPCIO` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENEDOR` (
  `DNI` INT NOT NULL,
  `NOM` VARCHAR(45) NOT NULL,
  `COGNOMS` VARCHAR(45) NULL,
  `ADREÇA` VARCHAR(45) NULL,
  `MOBIL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`POLISSA` (
  `NUMPOLISSA` INT NOT NULL,
  `IMPORT` FLOAT NOT NULL,
  `DATA INICI` VARCHAR(45) NULL,
  `DATA FI` VARCHAR(45) NULL,
  `TIPUS DE POLISSA_ID` VARCHAR(45) NOT NULL,
  `VENEDOR_DNI` INT NOT NULL,
  `CLIENT_DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NUMPOLISSA`),
  INDEX `fk_POLISSA_TIPUS DE POLISSA1_idx` (`TIPUS DE POLISSA_ID` ASC) VISIBLE,
  INDEX `fk_POLISSA_VENEDOR1_idx` (`VENEDOR_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_POLISSA_TIPUS DE POLISSA1`
    FOREIGN KEY (`TIPUS DE POLISSA_ID`)
    REFERENCES `mydb`.`TIPUS DE POLISSA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLISSA_VENEDOR1`
    FOREIGN KEY (`VENEDOR_DNI`)
    REFERENCES `mydb`.`VENEDOR` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTE` (
  `DNI` VARCHAR(10) NOT NULL,
  `NOM` VARCHAR(45) NOT NULL,
  `COGNOMS` VARCHAR(45) NOT NULL,
  `ADREÇA` VARCHAR(45) NOT NULL,
  `MOBIL` VARCHAR(45) NOT NULL,
  `VIP` INT NOT NULL,
  `POLISSA_NUMPOLISSA` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_CLIENTE_POLISSA_idx` (`POLISSA_NUMPOLISSA` ASC) VISIBLE,
  CONSTRAINT `fk_CLIENTE_POLISSA`
    FOREIGN KEY (`POLISSA_NUMPOLISSA`)
    REFERENCES `mydb`.`POLISSA` (`NUMPOLISSA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
