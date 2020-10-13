-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema vibesaude
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vibesaude
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vibesaude` DEFAULT CHARACTER SET utf8 ;
USE `vibesaude` ;

-- -----------------------------------------------------
-- Table `vibesaude`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibesaude`.`paciente` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dt_nascimento` DATE NOT NULL,
  `sexo` CHAR(1) NULL,
  `cpf` VARCHAR(11) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vibesaude`.`especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibesaude`.`especialidade` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vibesaude`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibesaude`.`medico` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `crm` VARCHAR(4) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `dt_nascimento` DATE NOT NULL,
  `especialidade_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medico_especialidade1_idx` (`especialidade_id` ASC),
  CONSTRAINT `fk_medico_especialidade1`
    FOREIGN KEY (`especialidade_id`)
    REFERENCES `vibesaude`.`especialidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vibesaude`.`horarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibesaude`.`horarios` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `data` DATE NULL,
  `hora` TIME NULL,
  `medico_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_horarios_medico_idx` (`medico_id` ASC),
  CONSTRAINT `fk_horarios_medico`
    FOREIGN KEY (`medico_id`)
    REFERENCES `vibesaude`.`medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vibesaude`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibesaude`.`status` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vibesaude`.`horario_agendado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibesaude`.`horario_agendado` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `paciente_id` INT UNSIGNED NOT NULL,
  `horarios_id` INT UNSIGNED NOT NULL,
  `status_id` INT UNSIGNED NOT NULL,
  `confirmado` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_horario_agendado_paciente1_idx` (`paciente_id` ASC),
  INDEX `fk_horario_agendado_horarios1_idx` (`horarios_id` ASC),
  INDEX `fk_horario_agendado_status1_idx` (`status_id` ASC),
  CONSTRAINT `fk_horario_agendado_paciente1`
    FOREIGN KEY (`paciente_id`)
    REFERENCES `vibesaude`.`paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_agendado_horarios1`
    FOREIGN KEY (`horarios_id`)
    REFERENCES `vibesaude`.`horarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_agendado_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `vibesaude`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vibesaude`.`cid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibesaude`.`cid` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(4) NULL,
  `descricao` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vibesaude`.`registro_consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibesaude`.`registro_consulta` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `data` DATETIME NULL,
  `descricao` TEXT NULL,
  `cid_id` INT UNSIGNED NOT NULL,
  `hoag_id` INT UNSIGNED NOT NULL COMMENT 'ho = horario\nag = agendamento\nid  = nome do campo\n\nhoag_id',
  PRIMARY KEY (`id`),
  INDEX `fk_registro_consulta_cid1_idx` (`cid_id` ASC),
  INDEX `fk_registro_consulta_horario_agendado1_idx` (`hoag_id` ASC),
  CONSTRAINT `fk_registro_consulta_cid1`
    FOREIGN KEY (`cid_id`)
    REFERENCES `vibesaude`.`cid` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_consulta_horario_agendado1`
    FOREIGN KEY (`hoag_id`)
    REFERENCES `vibesaude`.`horario_agendado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `vibesaude`.`paciente`
-- -----------------------------------------------------
START TRANSACTION;
USE `vibesaude`;
INSERT INTO `vibesaude`.`paciente` (`id`, `nome`, `dt_nascimento`, `sexo`, `cpf`) VALUES (1, 'CARLOS BRUNO ', '2020-08-04', 'M', '63178738100');
INSERT INTO `vibesaude`.`paciente` (`id`, `nome`, `dt_nascimento`, `sexo`, `cpf`) VALUES (2, 'CARLOS ALBERTO', '2013-06-03', 'M', '17682262370');
INSERT INTO `vibesaude`.`paciente` (`id`, `nome`, `dt_nascimento`, `sexo`, `cpf`) VALUES (3, 'GUILHERME BRITO', '2016-05-05', 'M', '26226182202');
INSERT INTO `vibesaude`.`paciente` (`id`, `nome`, `dt_nascimento`, `sexo`, `cpf`) VALUES (4, 'JONATHAN RAMALHO', '2005-09-16', 'M', '61425952046');
INSERT INTO `vibesaude`.`paciente` (`id`, `nome`, `dt_nascimento`, `sexo`, `cpf`) VALUES (5, 'GEYSE RODRIGUES', '2002-10-02', 'F', '52636750118');
INSERT INTO `vibesaude`.`paciente` (`id`, `nome`, `dt_nascimento`, `sexo`, `cpf`) VALUES (6, 'GISELLY GALUCIO', '1982-07-21', 'F', '76885212202');
INSERT INTO `vibesaude`.`paciente` (`id`, `nome`, `dt_nascimento`, `sexo`, `cpf`) VALUES (7, 'CHARLES HERCULES', '1986-10-07', 'M', '69093648055');
INSERT INTO `vibesaude`.`paciente` (`id`, `nome`, `dt_nascimento`, `sexo`, `cpf`) VALUES (8, 'CARMEM MICHELLY', '1988-11-21', 'F', '55773261766');
INSERT INTO `vibesaude`.`paciente` (`id`, `nome`, `dt_nascimento`, `sexo`, `cpf`) VALUES (9, 'MARIA DO CARMO', '1967-02-04', 'F', '41644257688');
INSERT INTO `vibesaude`.`paciente` (`id`, `nome`, `dt_nascimento`, `sexo`, `cpf`) VALUES (10, 'LUCIA ALBUQUERQUE', '2005-12-20', 'F', '23263626167');

COMMIT;


-- -----------------------------------------------------
-- Data for table `vibesaude`.`especialidade`
-- -----------------------------------------------------
START TRANSACTION;
USE `vibesaude`;
INSERT INTO `vibesaude`.`especialidade` (`id`, `descricao`) VALUES (1, 'ORTOPEDIA');
INSERT INTO `vibesaude`.`especialidade` (`id`, `descricao`) VALUES (2, 'PEDIATRIA');
INSERT INTO `vibesaude`.`especialidade` (`id`, `descricao`) VALUES (3, 'CLINCA GERAL');
INSERT INTO `vibesaude`.`especialidade` (`id`, `descricao`) VALUES (4, 'ENDOCRINOLOGIA');
INSERT INTO `vibesaude`.`especialidade` (`id`, `descricao`) VALUES (5, 'CARDIOLOGIA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `vibesaude`.`medico`
-- -----------------------------------------------------
START TRANSACTION;
USE `vibesaude`;
INSERT INTO `vibesaude`.`medico` (`id`, `nome`, `crm`, `sexo`, `dt_nascimento`, `especialidade_id`) VALUES (1, 'ALBERTO SOUZA', '3215', 'M', '1970-05-06', 3);
INSERT INTO `vibesaude`.`medico` (`id`, `nome`, `crm`, `sexo`, `dt_nascimento`, `especialidade_id`) VALUES (2, 'MARIA DA SILVA', '1234', 'F', '1968-10-15', 4);
INSERT INTO `vibesaude`.`medico` (`id`, `nome`, `crm`, `sexo`, `dt_nascimento`, `especialidade_id`) VALUES (3, 'PAULO COSTA', '3210', 'M', '1980-01-05', 5);
INSERT INTO `vibesaude`.`medico` (`id`, `nome`, `crm`, `sexo`, `dt_nascimento`, `especialidade_id`) VALUES (4, 'ANA HAOXOWELL', '5155', 'F', '1985-02-20', 2);
INSERT INTO `vibesaude`.`medico` (`id`, `nome`, `crm`, `sexo`, `dt_nascimento`, `especialidade_id`) VALUES (5, 'FLAVIO FIGUEIREDO', '5255', 'M', '1969-03-15', 1);
INSERT INTO `vibesaude`.`medico` (`id`, `nome`, `crm`, `sexo`, `dt_nascimento`, `especialidade_id`) VALUES (6, 'MARCELO BREVES', '1050', 'M', '1970-12-25', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vibesaude`.`horarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `vibesaude`;
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (DEFAULT, '2020-10-11', '13:00:00', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vibesaude`.`status`
-- -----------------------------------------------------
START TRANSACTION;
USE `vibesaude`;
INSERT INTO `vibesaude`.`status` (`id`, `descricao`) VALUES (1, 'AGENDADO');
INSERT INTO `vibesaude`.`status` (`id`, `descricao`) VALUES (2, 'CANCELADO');
INSERT INTO `vibesaude`.`status` (`id`, `descricao`) VALUES (3, 'CONSULTA_REALIZADA');
INSERT INTO `vibesaude`.`status` (`id`, `descricao`) VALUES (4, 'FALTA');

COMMIT;

