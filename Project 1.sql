-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema OnlineBookStore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema OnlineBookStore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OnlineBookStore` DEFAULT CHARACTER SET utf8 ;
USE `OnlineBookStore` ;

-- -----------------------------------------------------
-- Table `OnlineBookStore`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OnlineBookStore`.`Book` (
  `BookID` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Author` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(45) NOT NULL,
  PRIMARY KEY (`BookID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OnlineBookStore`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OnlineBookStore`.`Customer` (
  `CustomerID` INT NOT NULL,
  `Namer` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `ShippingAddress` TEXT(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OnlineBookStore`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OnlineBookStore`.`Order` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `TotalPrice` DECIMAL NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_customer_id_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_customer_id`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `OnlineBookStore`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OnlineBookStore`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OnlineBookStore`.`Payment` (
  `PaymentID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `PaymentDate` DATE NOT NULL,
  `PaymentAmount` DECIMAL(45) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  INDEX `fk_order_id_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_order_id`
    FOREIGN KEY (`OrderID`)
    REFERENCES `OnlineBookStore`.`Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OnlineBookStore`.`Order_Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OnlineBookStore`.`Order_Book` (
  `BookID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`BookID`, `OrderID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `BookID `
    FOREIGN KEY (`BookID`)
    REFERENCES `OnlineBookStore`.`Book` (`BookID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `OnlineBookStore`.`Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
