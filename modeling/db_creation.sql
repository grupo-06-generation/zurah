-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_zurah
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_zurah` DEFAULT CHARACTER SET utf8 ;
USE `db_zurah` ;

-- -----------------------------------------------------
-- Table `db_zurah`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_zurah`.`category` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NOT NULL,
  `food_type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_zurah`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_zurah`.`user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `mail` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `photo` LONGBLOB NULL,
  `is_seller` TINYINT NOT NULL,
  `address` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_zurah`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_zurah`.`product` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `category_id` BIGINT NOT NULL,
  `user_id` BIGINT NOT NULL,
  `expire` DATE NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `quantity` INT NOT NULL,
  `region` VARCHAR(255) NULL,
  PRIMARY KEY (`id`, `category_id`, `user_id`),
  INDEX `fk_produtos_categoria_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_produtos_usuarios1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_categoria`
    FOREIGN KEY (`category_id`)
    REFERENCES `db_zurah`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_usuarios1`
    FOREIGN KEY (`user_id`)
    REFERENCES `db_zurah`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
