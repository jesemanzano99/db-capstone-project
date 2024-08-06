-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema capstone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capstone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capstone` DEFAULT CHARACTER SET utf8 ;
USE `capstone` ;

-- -----------------------------------------------------
-- Table `capstone`.`Customers details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`Customers details` ;

CREATE TABLE IF NOT EXISTS `capstone`.`Customers details` (
  `customerID` INT NOT NULL,
  `customername` VARCHAR(255) NOT NULL,
  `contactdetail` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `capstone`.`Bookings` (
  `bookingID` INT NOT NULL,
  `bookingdate` DATE NOT NULL,
  `tablenumber` INT NOT NULL,
  `customerID` INT NOT NULL,
  PRIMARY KEY (`bookingID`),
  INDEX `customerfk_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `customeridbookingfk`
    FOREIGN KEY (`customerID`)
    REFERENCES `capstone`.`Customers details` (`customerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`Staff` ;

CREATE TABLE IF NOT EXISTS `capstone`.`Staff` (
  `staffID` INT NOT NULL,
  `staffname` VARCHAR(255) NOT NULL,
  `role` VARCHAR(255) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`Menu` ;

CREATE TABLE IF NOT EXISTS `capstone`.`Menu` (
  `itemID` INT NOT NULL,
  `itemtype` VARCHAR(45) NOT NULL,
  `itemname` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`itemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`Order Delivery Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`Order Delivery Status` ;

CREATE TABLE IF NOT EXISTS `capstone`.`Order Delivery Status` (
  `orderstatusID` INT NOT NULL,
  `deliverydate` DATE NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`orderstatusID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`Orders` ;

CREATE TABLE IF NOT EXISTS `capstone`.`Orders` (
  `orderID` INT NOT NULL,
  `orderdate` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalcost` DECIMAL(10,2) NOT NULL,
  `customerID` INT NOT NULL,
  `staffID` INT NOT NULL,
  `itemID` INT NOT NULL,
  `orderstatusID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `customeridfk_idx` (`customerID` ASC) VISIBLE,
  INDEX `staffidfk_idx` (`staffID` ASC) VISIBLE,
  INDEX `menuidfk_idx` (`itemID` ASC) VISIBLE,
  INDEX `orderstatusidfk_idx` (`orderstatusID` ASC) VISIBLE,
  CONSTRAINT `customeridfk`
    FOREIGN KEY (`customerID`)
    REFERENCES `capstone`.`Customers details` (`customerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staffidfk`
    FOREIGN KEY (`staffID`)
    REFERENCES `capstone`.`Staff` (`staffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menuidfk`
    FOREIGN KEY (`itemID`)
    REFERENCES `capstone`.`Menu` (`itemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orderstatusidfk`
    FOREIGN KEY (`orderstatusID`)
    REFERENCES `capstone`.`Order Delivery Status` (`orderstatusID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
