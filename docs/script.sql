SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `db403261570` DEFAULT CHARACTER SET utf8 ;
USE `db403261570` ;

-- -----------------------------------------------------
-- Table `db403261570`.`Lugar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db403261570`.`Lugar` (
  `idLugar` INT NOT NULL AUTO_INCREMENT ,
  `nombreLugar` VARCHAR(20) NULL ,
  `tipoLugar` VARCHAR(1) NULL ,
  `Lugar_idLugar` INT NOT NULL ,
  PRIMARY KEY (`idLugar`) ,
  INDEX `fk_Lugar_Lugar1` (`Lugar_idLugar` ASC) ,
  CONSTRAINT `fk_Lugar_Lugar1`
    FOREIGN KEY (`Lugar_idLugar` )
    REFERENCES `db403261570`.`Lugar` (`idLugar` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db403261570`.`Tienda`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db403261570`.`Tienda` (
  `idTienda` INT NOT NULL AUTO_INCREMENT ,
  `direccion` VARCHAR(100) NULL ,
  `Lugar_idLugar` INT NOT NULL ,
  PRIMARY KEY (`idTienda`) ,
  INDEX `fk_Tienda_Lugar` (`Lugar_idLugar` ASC) ,
  CONSTRAINT `fk_Tienda_Lugar`
    FOREIGN KEY (`Lugar_idLugar` )
    REFERENCES `db403261570`.`Lugar` (`idLugar` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db403261570`.`Producto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db403261570`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(50) NULL ,
  `codigo` VARCHAR(10) NULL ,
  `categoria` VARCHAR(2) NULL ,
  `tipoAudiencia` VARCHAR(1) NULL ,
  `tipoProducto` VARCHAR(1) NULL ,
  `diasAlquiler` INT NULL ,
  `precio` DOUBLE NULL ,
  `costo` DOUBLE NULL ,
  `numFactura` INT NULL ,
  `fechaCompra` DATETIME NULL ,
  `estado` VARCHAR(1) NULL ,
  `Tienda_idTienda` INT NOT NULL ,
  PRIMARY KEY (`idProducto`) ,
  INDEX `fk_Producto_Tienda1` (`Tienda_idTienda` ASC) ,
  CONSTRAINT `fk_Producto_Tienda1`
    FOREIGN KEY (`Tienda_idTienda` )
    REFERENCES `db403261570`.`Tienda` (`idTienda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db403261570`.`Cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db403261570`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(20) NULL ,
  `apellidos` VARCHAR(50) NULL ,
  `codigo` VARCHAR(8) NULL ,
  `fechaVigencia` DATETIME NULL ,
  PRIMARY KEY (`idCliente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db403261570`.`Alquiler`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db403261570`.`Alquiler` (
  `idAlquiler` INT NOT NULL AUTO_INCREMENT ,
  `fecha` DATETIME NULL ,
  `estado` VARCHAR(1) NULL ,
  `Cliente_idCliente` INT NOT NULL ,
  PRIMARY KEY (`idAlquiler`) ,
  INDEX `fk_Alquiler_Cliente1` (`Cliente_idCliente` ASC) ,
  CONSTRAINT `fk_Alquiler_Cliente1`
    FOREIGN KEY (`Cliente_idCliente` )
    REFERENCES `db403261570`.`Cliente` (`idCliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db403261570`.`Producto_Alquiler`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db403261570`.`Producto_Alquiler` (
  `idProducto_Alquiler` INT NOT NULL AUTO_INCREMENT ,
  `precio` DOUBLE NULL ,
  `mora` DOUBLE NULL ,
  `diasTarde` INT NULL ,
  `estado` VARCHAR(1) NULL ,
  `fechaDevolucion` DATETIME NULL ,
  `estadoProdDev` VARCHAR(100) NULL ,
  `Producto_idProducto` INT NOT NULL ,
  `Alquiler_idAlquiler` INT NOT NULL ,
  PRIMARY KEY (`idProducto_Alquiler`) ,
  INDEX `fk_Producto_Alquiler_Producto1` (`Producto_idProducto` ASC) ,
  INDEX `fk_Producto_Alquiler_Alquiler1` (`Alquiler_idAlquiler` ASC) ,
  CONSTRAINT `fk_Producto_Alquiler_Producto1`
    FOREIGN KEY (`Producto_idProducto` )
    REFERENCES `db403261570`.`Producto` (`idProducto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Alquiler_Alquiler1`
    FOREIGN KEY (`Alquiler_idAlquiler` )
    REFERENCES `db403261570`.`Alquiler` (`idAlquiler` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
