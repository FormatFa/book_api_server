-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema book
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema book
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `book` ;
USE `book` ;

-- -----------------------------------------------------
-- Table `book`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `openid` VARCHAR(45) NULL,
  `avatar_url` VARCHAR(45) NULL,
  `nickname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `sex` VARCHAR(45) NULL,
  `password` VARCHAR(60) NULL,
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `coin` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`book_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`book_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `parent_id` INT NULL,
  `category` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `author` VARCHAR(45) NULL,
  `category` INT NULL,
  `status` VARCHAR(45) NULL,
  `word_count` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_book_id_idx` (`category` ASC),
  CONSTRAINT `fk_category_book_id`
    FOREIGN KEY (`category`)
    REFERENCES `book`.`book_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`book_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`book_tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NULL,
  `tag` VARCHAR(45) NULL COMMENT 'tag is from categories , depth 1',
  PRIMARY KEY (`id`),
  INDEX `fk_book_id_idx` (`book_id` ASC),
  CONSTRAINT `fk_book_id`
    FOREIGN KEY (`book_id`)
    REFERENCES `book`.`book` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`book_shelf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`book_shelf` (
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `add_time` DATETIME NULL,
  INDEX `fk_book_id_idx` (`book_id` ASC),
  INDEX `fk_user_id_idx` (`user_id` ASC),
  PRIMARY KEY (`book_id`, `user_id`),
  CONSTRAINT `fk_book_shelf_id`
    FOREIGN KEY (`book_id`)
    REFERENCES `book`.`book` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_shelf_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `book`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`tags` (
  `id` INT NOT NULL,
  `tag` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`book_chapter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`book_chapter` (
  `chapter_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `content` TEXT NULL,
  `price` INT NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`chapter_id`, `book_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`buy_record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`buy_record` (
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `chapter_id` INT NOT NULL,
  `buy_time` DATETIME NULL,
  `cost` INT NULL,
  `balance` INT NULL,
  `summary` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`, `book_id`, `chapter_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`check_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`check_in` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `check_in_time` DATETIME NULL,
  `add_point` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`user_friend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`user_friend` (
  `user_id` INT NOT NULL,
  `friend_id` INT NULL,
  `add_time` DATETIME NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_friend_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `book`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`message` (
  `id` INT NOT NULL,
  `sender` INT NULL,
  `receiver` INT NULL,
  `content` VARCHAR(300) NULL,
  `send_time` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`collection` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`book_collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`book_collection` (
  `collection_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`collection_id`, `book_id`),
  INDEX `fk_book_bookid_idx` (`book_id` ASC),
  CONSTRAINT `fk_bc_collection`
    FOREIGN KEY (`collection_id`)
    REFERENCES `book`.`collection` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_bookid`
    FOREIGN KEY (`book_id`)
    REFERENCES `book`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`.`content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`content` (
  `book_id` INT NOT NULL,
  `chapter_id` VARCHAR(45) NOT NULL,
  `content` TEXT NULL,
  PRIMARY KEY (`book_id`, `chapter_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
