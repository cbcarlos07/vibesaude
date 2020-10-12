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
  `codigo` VARCHAR(6) NULL,
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
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (1, '2020-10-11', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (2, '2020-10-11', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (3, '2020-10-11', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (4, '2020-10-11', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (5, '2020-10-11', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (6, '2020-10-11', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (7, '2020-10-11', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (8, '2020-10-11', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (9, '2020-10-11', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (10, '2020-10-11', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (11, '2020-10-11', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (12, '2020-10-11', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (13, '2020-10-11', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (14, '2020-10-11', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (15, '2020-10-11', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (16, '2020-10-11', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (17, '2020-10-11', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (18, '2020-10-11', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (19, '2020-10-11', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (20, '2020-10-11', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (21, '2020-10-11', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (22, '2020-10-11', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (23, '2020-10-11', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (24, '2020-10-11', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (25, '2020-10-11', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (26, '2020-10-11', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (27, '2020-10-11', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (28, '2020-10-11', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (29, '2020-10-11', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (30, '2020-10-11', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (31, '2020-10-11', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (32, '2020-10-11', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (33, '2020-10-11', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (34, '2020-10-11', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (35, '2020-10-11', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (36, '2020-10-11', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (37, '2020-10-11', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (38, '2020-10-11', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (39, '2020-10-11', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (40, '2020-10-11', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (41, '2020-10-11', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (42, '2020-10-11', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (43, '2020-10-12', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (44, '2020-10-12', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (45, '2020-10-12', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (46, '2020-10-12', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (47, '2020-10-12', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (48, '2020-10-12', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (49, '2020-10-12', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (50, '2020-10-12', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (51, '2020-10-12', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (52, '2020-10-12', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (53, '2020-10-12', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (54, '2020-10-12', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (55, '2020-10-12', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (56, '2020-10-12', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (57, '2020-10-12', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (58, '2020-10-12', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (59, '2020-10-12', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (60, '2020-10-12', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (61, '2020-10-12', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (62, '2020-10-12', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (63, '2020-10-12', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (64, '2020-10-12', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (65, '2020-10-12', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (66, '2020-10-12', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (67, '2020-10-12', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (68, '2020-10-12', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (69, '2020-10-12', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (70, '2020-10-12', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (71, '2020-10-12', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (72, '2020-10-12', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (73, '2020-10-12', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (74, '2020-10-12', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (75, '2020-10-12', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (76, '2020-10-12', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (77, '2020-10-12', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (78, '2020-10-12', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (79, '2020-10-12', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (80, '2020-10-12', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (81, '2020-10-12', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (82, '2020-10-12', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (83, '2020-10-12', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (84, '2020-10-12', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (85, '2020-10-13', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (86, '2020-10-13', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (87, '2020-10-13', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (88, '2020-10-13', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (89, '2020-10-13', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (90, '2020-10-13', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (91, '2020-10-13', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (92, '2020-10-13', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (93, '2020-10-13', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (94, '2020-10-13', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (95, '2020-10-13', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (96, '2020-10-13', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (97, '2020-10-13', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (98, '2020-10-13', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (99, '2020-10-13', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (100, '2020-10-13', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (101, '2020-10-13', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (102, '2020-10-13', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (103, '2020-10-13', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (104, '2020-10-13', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (105, '2020-10-13', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (106, '2020-10-13', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (107, '2020-10-13', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (108, '2020-10-13', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (109, '2020-10-13', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (110, '2020-10-13', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (111, '2020-10-13', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (112, '2020-10-13', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (113, '2020-10-13', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (114, '2020-10-13', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (115, '2020-10-13', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (116, '2020-10-13', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (117, '2020-10-13', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (118, '2020-10-13', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (119, '2020-10-13', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (120, '2020-10-13', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (121, '2020-10-13', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (122, '2020-10-13', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (123, '2020-10-13', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (124, '2020-10-13', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (125, '2020-10-13', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (126, '2020-10-13', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (127, '2020-10-14', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (128, '2020-10-14', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (129, '2020-10-14', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (130, '2020-10-14', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (131, '2020-10-14', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (132, '2020-10-14', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (133, '2020-10-14', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (134, '2020-10-14', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (135, '2020-10-14', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (136, '2020-10-14', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (137, '2020-10-14', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (138, '2020-10-14', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (139, '2020-10-14', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (140, '2020-10-14', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (141, '2020-10-14', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (142, '2020-10-14', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (143, '2020-10-14', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (144, '2020-10-14', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (145, '2020-10-14', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (146, '2020-10-14', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (147, '2020-10-14', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (148, '2020-10-14', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (149, '2020-10-14', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (150, '2020-10-14', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (151, '2020-10-14', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (152, '2020-10-14', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (153, '2020-10-14', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (154, '2020-10-14', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (155, '2020-10-14', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (156, '2020-10-14', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (157, '2020-10-14', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (158, '2020-10-14', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (159, '2020-10-14', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (160, '2020-10-14', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (161, '2020-10-14', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (162, '2020-10-14', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (163, '2020-10-14', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (164, '2020-10-14', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (165, '2020-10-14', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (166, '2020-10-14', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (167, '2020-10-14', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (168, '2020-10-14', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (169, '2020-10-15', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (170, '2020-10-15', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (171, '2020-10-15', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (172, '2020-10-15', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (173, '2020-10-15', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (174, '2020-10-15', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (175, '2020-10-15', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (176, '2020-10-15', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (177, '2020-10-15', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (178, '2020-10-15', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (179, '2020-10-15', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (180, '2020-10-15', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (181, '2020-10-15', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (182, '2020-10-15', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (183, '2020-10-15', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (184, '2020-10-15', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (185, '2020-10-15', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (186, '2020-10-15', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (187, '2020-10-15', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (188, '2020-10-15', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (189, '2020-10-15', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (190, '2020-10-15', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (191, '2020-10-15', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (192, '2020-10-15', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (193, '2020-10-15', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (194, '2020-10-15', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (195, '2020-10-15', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (196, '2020-10-15', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (197, '2020-10-15', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (198, '2020-10-15', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (199, '2020-10-15', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (200, '2020-10-15', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (201, '2020-10-15', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (202, '2020-10-15', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (203, '2020-10-15', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (204, '2020-10-15', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (205, '2020-10-15', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (206, '2020-10-15', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (207, '2020-10-15', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (208, '2020-10-15', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (209, '2020-10-15', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (210, '2020-10-15', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (211, '2020-10-16', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (212, '2020-10-16', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (213, '2020-10-16', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (214, '2020-10-16', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (215, '2020-10-16', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (216, '2020-10-16', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (217, '2020-10-16', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (218, '2020-10-16', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (219, '2020-10-16', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (220, '2020-10-16', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (221, '2020-10-16', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (222, '2020-10-16', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (223, '2020-10-16', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (224, '2020-10-16', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (225, '2020-10-16', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (226, '2020-10-16', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (227, '2020-10-16', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (228, '2020-10-16', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (229, '2020-10-16', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (230, '2020-10-16', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (231, '2020-10-16', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (232, '2020-10-16', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (233, '2020-10-16', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (234, '2020-10-16', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (235, '2020-10-16', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (236, '2020-10-16', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (237, '2020-10-16', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (238, '2020-10-16', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (239, '2020-10-16', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (240, '2020-10-16', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (241, '2020-10-16', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (242, '2020-10-16', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (243, '2020-10-16', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (244, '2020-10-16', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (245, '2020-10-16', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (246, '2020-10-16', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (247, '2020-10-16', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (248, '2020-10-16', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (249, '2020-10-16', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (250, '2020-10-16', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (251, '2020-10-16', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (252, '2020-10-16', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (253, '2020-10-17', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (254, '2020-10-17', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (255, '2020-10-17', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (256, '2020-10-17', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (257, '2020-10-17', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (258, '2020-10-17', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (259, '2020-10-17', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (260, '2020-10-17', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (261, '2020-10-17', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (262, '2020-10-17', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (263, '2020-10-17', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (264, '2020-10-17', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (265, '2020-10-17', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (266, '2020-10-17', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (267, '2020-10-17', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (268, '2020-10-17', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (269, '2020-10-17', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (270, '2020-10-17', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (271, '2020-10-17', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (272, '2020-10-17', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (273, '2020-10-17', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (274, '2020-10-17', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (275, '2020-10-17', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (276, '2020-10-17', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (277, '2020-10-17', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (278, '2020-10-17', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (279, '2020-10-17', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (280, '2020-10-17', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (281, '2020-10-17', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (282, '2020-10-17', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (283, '2020-10-17', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (284, '2020-10-17', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (285, '2020-10-17', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (286, '2020-10-17', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (287, '2020-10-17', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (288, '2020-10-17', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (289, '2020-10-17', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (290, '2020-10-17', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (291, '2020-10-17', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (292, '2020-10-17', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (293, '2020-10-17', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (294, '2020-10-17', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (295, '2020-10-18', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (296, '2020-10-18', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (297, '2020-10-18', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (298, '2020-10-18', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (299, '2020-10-18', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (300, '2020-10-18', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (301, '2020-10-18', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (302, '2020-10-18', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (303, '2020-10-18', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (304, '2020-10-18', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (305, '2020-10-18', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (306, '2020-10-18', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (307, '2020-10-18', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (308, '2020-10-18', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (309, '2020-10-18', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (310, '2020-10-18', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (311, '2020-10-18', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (312, '2020-10-18', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (313, '2020-10-18', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (314, '2020-10-18', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (315, '2020-10-18', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (316, '2020-10-18', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (317, '2020-10-18', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (318, '2020-10-18', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (319, '2020-10-18', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (320, '2020-10-18', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (321, '2020-10-18', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (322, '2020-10-18', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (323, '2020-10-18', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (324, '2020-10-18', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (325, '2020-10-18', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (326, '2020-10-18', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (327, '2020-10-18', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (328, '2020-10-18', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (329, '2020-10-18', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (330, '2020-10-18', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (331, '2020-10-18', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (332, '2020-10-18', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (333, '2020-10-18', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (334, '2020-10-18', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (335, '2020-10-18', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (336, '2020-10-18', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (337, '2020-10-19', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (338, '2020-10-19', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (339, '2020-10-19', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (340, '2020-10-19', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (341, '2020-10-19', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (342, '2020-10-19', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (343, '2020-10-19', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (344, '2020-10-19', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (345, '2020-10-19', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (346, '2020-10-19', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (347, '2020-10-19', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (348, '2020-10-19', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (349, '2020-10-19', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (350, '2020-10-19', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (351, '2020-10-19', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (352, '2020-10-19', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (353, '2020-10-19', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (354, '2020-10-19', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (355, '2020-10-19', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (356, '2020-10-19', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (357, '2020-10-19', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (358, '2020-10-19', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (359, '2020-10-19', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (360, '2020-10-19', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (361, '2020-10-19', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (362, '2020-10-19', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (363, '2020-10-19', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (364, '2020-10-19', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (365, '2020-10-19', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (366, '2020-10-19', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (367, '2020-10-19', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (368, '2020-10-19', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (369, '2020-10-19', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (370, '2020-10-19', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (371, '2020-10-19', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (372, '2020-10-19', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (373, '2020-10-19', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (374, '2020-10-19', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (375, '2020-10-19', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (376, '2020-10-19', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (377, '2020-10-19', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (378, '2020-10-19', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (379, '2020-10-20', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (380, '2020-10-20', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (381, '2020-10-20', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (382, '2020-10-20', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (383, '2020-10-20', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (384, '2020-10-20', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (385, '2020-10-20', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (386, '2020-10-20', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (387, '2020-10-20', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (388, '2020-10-20', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (389, '2020-10-20', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (390, '2020-10-20', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (391, '2020-10-20', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (392, '2020-10-20', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (393, '2020-10-20', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (394, '2020-10-20', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (395, '2020-10-20', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (396, '2020-10-20', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (397, '2020-10-20', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (398, '2020-10-20', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (399, '2020-10-20', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (400, '2020-10-20', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (401, '2020-10-20', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (402, '2020-10-20', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (403, '2020-10-20', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (404, '2020-10-20', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (405, '2020-10-20', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (406, '2020-10-20', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (407, '2020-10-20', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (408, '2020-10-20', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (409, '2020-10-20', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (410, '2020-10-20', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (411, '2020-10-20', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (412, '2020-10-20', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (413, '2020-10-20', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (414, '2020-10-20', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (415, '2020-10-20', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (416, '2020-10-20', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (417, '2020-10-20', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (418, '2020-10-20', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (419, '2020-10-20', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (420, '2020-10-20', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (421, '2020-10-21', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (422, '2020-10-21', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (423, '2020-10-21', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (424, '2020-10-21', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (425, '2020-10-21', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (426, '2020-10-21', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (427, '2020-10-21', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (428, '2020-10-21', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (429, '2020-10-21', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (430, '2020-10-21', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (431, '2020-10-21', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (432, '2020-10-21', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (433, '2020-10-21', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (434, '2020-10-21', '13:30:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (435, '2020-10-21', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (436, '2020-10-21', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (437, '2020-10-21', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (438, '2020-10-21', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (439, '2020-10-21', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (440, '2020-10-21', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (441, '2020-10-21', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (442, '2020-10-21', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (443, '2020-10-21', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (444, '2020-10-21', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (445, '2020-10-21', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (446, '2020-10-21', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (447, '2020-10-21', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (448, '2020-10-21', '13:30:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (449, '2020-10-21', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (450, '2020-10-21', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (451, '2020-10-21', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (452, '2020-10-21', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (453, '2020-10-21', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (454, '2020-10-21', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (455, '2020-10-21', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (456, '2020-10-21', '13:00:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (457, '2020-10-21', '13:05:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (458, '2020-10-21', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (459, '2020-10-21', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (460, '2020-10-21', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (461, '2020-10-21', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (462, '2020-10-21', '13:30:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (463, '2020-10-22', '13:00:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (464, '2020-10-22', '13:05:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (465, '2020-10-22', '13:10:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (466, '2020-10-22', '13:15:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (467, '2020-10-22', '13:20:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (468, '2020-10-22', '13:25:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (469, '2020-10-22', '13:30:00', 1);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (470, '2020-10-22', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (471, '2020-10-22', '13:05:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (472, '2020-10-22', '13:10:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (473, '2020-10-22', '13:15:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (474, '2020-10-22', '13:20:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (475, '2020-10-22', '13:25:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (476, '2020-10-22', '13:00:00', 2);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (477, '2020-10-22', '13:05:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (478, '2020-10-22', '13:10:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (479, '2020-10-22', '13:15:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (480, '2020-10-22', '13:20:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (481, '2020-10-22', '13:25:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (482, '2020-10-22', '13:30:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (483, '2020-10-22', '13:00:00', 3);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (484, '2020-10-22', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (485, '2020-10-22', '13:10:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (486, '2020-10-22', '13:15:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (487, '2020-10-22', '13:20:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (488, '2020-10-22', '13:25:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (489, '2020-10-22', '13:00:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (490, '2020-10-22', '13:05:00', 4);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (491, '2020-10-22', '13:10:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (492, '2020-10-22', '13:15:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (493, '2020-10-22', '13:20:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (494, '2020-10-22', '13:25:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (495, '2020-10-22', '13:30:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (496, '2020-10-22', '13:00:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (497, '2020-10-22', '13:05:00', 5);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (498, '2020-10-22', '13:10:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (499, '2020-10-22', '13:15:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (500, '2020-10-22', '13:20:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (501, '2020-10-22', '13:25:00', 6);
INSERT INTO `vibesaude`.`horarios` (`id`, `data`, `hora`, `medico_id`) VALUES (502, '2020-10-22', '13:30:00', 6);

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


-- -----------------------------------------------------
-- Data for table `vibesaude`.`cid`
-- -----------------------------------------------------
START TRANSACTION;
USE `vibesaude`;
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (1, 'Q66', 'Deformidades congênitas do pé');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (2, 'Q66.9', 'Deformidade congênita não especificada do pé');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (3, 'Q66.8', 'Outras deformidades congênitas do pé');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (4, 'E11', 'Diabetes mellitus não-insulino-dependente');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (5, 'E11.9', 'Diabetes mellitus não-insulino-dependente - sem complicações');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (6, 'Z76.1', 'Supervisão e cuidado de saúde de crianças assistidas');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (7, 'Z00.1', 'Exame de rotina de saúde da criança');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (8, 'Z00', 'Exame geral e investigação de pessoas sem queixas ou diagnóstico relatado');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (9, 'Z00.0', 'Exame médico geral');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (10, 'E34.9', 'Transtorno endócrino não especificado');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (11, 'I51', 'Complicações de cardiopatias e doenças cardíacas mal definidas');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (12, 'I51.5', 'Degeneração miocárdica');
INSERT INTO `vibesaude`.`cid` (`id`, `codigo`, `descricao`) VALUES (13, 'I51.6', 'Doença cardiovascular não especificada');

COMMIT;

