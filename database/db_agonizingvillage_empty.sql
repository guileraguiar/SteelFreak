-- MySQL Script generated by MySQL Workbench
-- Tue Nov  5 21:02:36 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_agonizingvillage
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_agonizingvillage
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_agonizingvillage` ;
USE `db_agonizingvillage` ;

-- -----------------------------------------------------
-- Table `db_agonizingvillage`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_agonizingvillage`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `u_email` VARCHAR(100) NULL DEFAULT NULL,
  `u_user` VARCHAR(100) NULL DEFAULT NULL,
  `u_pass` CHAR(32) NULL DEFAULT NULL,
  `u_type` INT NULL DEFAULT 1,
  UNIQUE INDEX (`u_email` ASC),
  UNIQUE INDEX (`u_user` ASC),
  PRIMARY KEY (`id_user`));

-- -----------------------------------------------------
-- Table `db_agonizingvillage`.`race`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_agonizingvillage`.`race` (
  `id_race` INT NOT NULL AUTO_INCREMENT,
  `r_name` VARCHAR(100) NOT NULL,
  `r_life` INT NOT NULL,
  `r_energy` INT NOT NULL,
  `r_strenght` INT NOT NULL,
  `r_defense` INT NOT NULL,
  `r_crit_chance` INT NOT NULL,
  PRIMARY KEY (`id_race`));


-- -----------------------------------------------------
-- Table `db_agonizingvillage`.`equip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_agonizingvillage`.`equip` (
  `id_equip` INT NOT NULL AUTO_INCREMENT,
  `e_armor` INT NOT NULL,
  `e_attack` INT NOT NULL,
  `e_life` INT NOT NULL,
  `e_energy` INT NOT NULL,
  `e_price` INT NOT NULL,
  `e_crit_chance` INT NOT NULL,
  `type_equip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equip`));


-- -----------------------------------------------------
-- Table `db_agonizingvillage`.`duel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_agonizingvillage`.`duel` (
  `id_duel` INT NOT NULL AUTO_INCREMENT,
  `d_date` DATE NULL DEFAULT NULL,
  `d_result` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_duel`),
  UNIQUE INDEX (`id_duel` ASC));


-- -----------------------------------------------------
-- Table `db_agonizingvillage`.`characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_agonizingvillage`.`characters` (
  `id_characters` INT NOT NULL AUTO_INCREMENT,
  `c_nickname` VARCHAR(20) NULL DEFAULT NULL,
  `c_experience` INT NULL DEFAULT NULL,
  `c_life` INT NULL DEFAULT NULL,
  `c_energy` INT NULL DEFAULT NULL,
  `c_strenght` INT NULL DEFAULT NULL,
  `c_defense` INT NULL DEFAULT NULL,
  `c_level` INT NULL DEFAULT NULL,
  `c_crit_chance` INT NULL DEFAULT NULL,
  `c_money` INT NULL DEFAULT NULL,
  `race_id_race` INT NOT NULL,
  `users_id_user` INT NOT NULL,
  `c_type` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_characters`),
  INDEX `fk_characters_race1_idx` (`race_id_race` ASC),
  INDEX `fk_characters_users1_idx` (`users_id_user` ASC),
  CONSTRAINT `fk_characters_race1`
    FOREIGN KEY (`race_id_race`)
    REFERENCES `db_agonizingvillage`.`race` (`id_race`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `db_agonizingvillage`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `db_agonizingvillage`.`characters_has_equip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_agonizingvillage`.`characters_has_equip` (
  `characters_id_characters` INT NOT NULL,
  `equip_id_equip` INT NOT NULL,
  PRIMARY KEY (`characters_id_characters`, `equip_id_equip`),
  INDEX `fk_characters_has_equip_equip1_idx` (`equip_id_equip` ASC),
  INDEX `fk_characters_has_equip_characters1_idx` (`characters_id_characters` ASC),
  CONSTRAINT `fk_characters_has_equip_characters1`
    FOREIGN KEY (`characters_id_characters`)
    REFERENCES `db_agonizingvillage`.`characters` (`id_characters`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_has_equip_equip1`
    FOREIGN KEY (`equip_id_equip`)
    REFERENCES `db_agonizingvillage`.`equip` (`id_equip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `db_agonizingvillage`.`duel_has_characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_agonizingvillage`.`duel_has_characters` (
  `duel_id_duel` INT NOT NULL,
  `characters_id_characters` INT NOT NULL,
  PRIMARY KEY (`duel_id_duel`, `characters_id_characters`),
  INDEX `fk_duel_has_characters_characters1_idx` (`characters_id_characters` ASC),
  INDEX `fk_duel_has_characters_duel1_idx` (`duel_id_duel` ASC),
  CONSTRAINT `fk_duel_has_characters_duel1`
    FOREIGN KEY (`duel_id_duel`)
    REFERENCES `db_agonizingvillage`.`duel` (`id_duel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_duel_has_characters_characters1`
    FOREIGN KEY (`characters_id_characters`)
    REFERENCES `db_agonizingvillage`.`characters` (`id_characters`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


