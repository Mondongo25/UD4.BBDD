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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
