CREATE DATABASE Concursos;
USE Concursos;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT ,
  `Usuario` VARCHAR(25) NOT NULL ,
  `Nombre` VARCHAR(45) NOT NULL ,
  `Aroba` VARCHAR(25) NOT NULL ,
  `Imagen` VARCHAR(50) NULL ,
  `Estatus` VARCHAR(20) NULL ,
  `FechaRegistro` DATE NULL ,
  `Privilegio` VARCHAR(45) NULL ,
  PRIMARY KEY (`idUsuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Concurso`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Concurso` (
  `idConcurso` INT NOT NULL ,
  `idUsuario` INT NOT NULL ,
  `idUsuarioGanador` INT NOT NULL ,
  `Nombre` VARCHAR(45) NOT NULL ,
  `DescripcionBreve` VARCHAR(120) NULL ,
  `Hashtag` VARCHAR(20) NOT NULL ,
  `Dificultad` VARCHAR(15) NOT NULL ,
  `FechaInicio` DATE NOT NULL ,
  `FechaFin` DATE NOT NULL ,
  `FechaCreacion` DATE NULL ,
  `Estatus` VARCHAR(15) NOT NULL ,
  `MotivoCancelacion` VARCHAR(50) NULL ,
  PRIMARY KEY (`idConcurso`) ,
  INDEX `idUsuario_idx` (`idUsuario` ASC, `idUsuarioGanador` ASC) ,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario` , `idUsuarioGanador` )
    REFERENCES `mydb`.`Usuario` (`idUsuario` , `idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Imagen`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Imagen` (
  `idImagen` INT NOT NULL ,
  `idConcurso` INT NOT NULL ,
  `Imagen` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`idImagen`) ,
  INDEX `idConcurso_idx` (`idConcurso` ASC) ,
  CONSTRAINT `idConcurso`
    FOREIGN KEY (`idConcurso` )
    REFERENCES `mydb`.`Concurso` (`idConcurso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entrada`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Entrada` (
  `idEntrada` INT NOT NULL ,
  `idUsuario` INT NOT NULL ,
  `idConcurso` INT NOT NULL ,
  `Entrada` VARCHAR(120) NOT NULL ,
  `Enlace` VARCHAR(50) NULL ,
  PRIMARY KEY (`idEntrada`) ,
  INDEX `idUsuario_idx` (`idUsuario` ASC) ,
  INDEX `idConcurso_idx` (`idConcurso` ASC) ,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `mydb`.`Usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idConcurso`
    FOREIGN KEY (`idConcurso` )
    REFERENCES `mydb`.`Concurso` (`idConcurso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `idAdministrador` INT NOT NULL ,
  `Usuario` VARCHAR(25) NOT NULL ,
  `Aroba` VARCHAR(25) NOT NULL ,
  PRIMARY KEY (`idAdministrador`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idCategoria` INT NOT NULL ,
  `idConcurso` INT NOT NULL ,
  `Categoria` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`idCategoria`) ,
  INDEX `idConcurso_idx` (`idConcurso` ASC) ,
  CONSTRAINT `idConcurso0`
    FOREIGN KEY (`idConcurso` )
    REFERENCES `mydb`.`Concurso` (`idConcurso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
