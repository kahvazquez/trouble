-- Adminer 4.2.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `cadcliente`;
CREATE TABLE `cadcliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(3) NOT NULL,
  `status` varchar(30) NOT NULL,
  `contrato` varchar(50) NOT NULL,
  `designacao` varchar(50) NOT NULL,
  `cliente` varchar(200) NOT NULL,
  `velocidade` varchar(30) NOT NULL,
  `operadora` varchar(30) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `data` date NOT NULL,
  `ax` varchar(60) NOT NULL,
  `localizacao` varchar(40) NOT NULL,
  `tributario` varchar(10) NOT NULL,
  `slot` varchar(10) NOT NULL,
  `interface` varchar(10) NOT NULL,
  `canalizado` varchar(50) NOT NULL,
  `localentrada` varchar(50) NOT NULL,
  `tssdh` varchar(50) NOT NULL,
  `did` varchar(50) NOT NULL,
  `slotentrada` varchar(50) NOT NULL,
  `portaentrada` varchar(50) NOT NULL,
  `posicaoentrada` varchar(50) NOT NULL,
  `klmentrada` varchar(50) NOT NULL,
  `localsaida` varchar(50) NOT NULL,
  `fila` varchar(50) NOT NULL,
  `bastidor` varchar(50) NOT NULL,
  `posicaosaida` varchar(50) NOT NULL,
  `klmsaida` varchar(50) NOT NULL,
  `portasaida` varchar(50) NOT NULL,
  `tecnicoresp` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade` (`cidade`),
  CONSTRAINT `cadcliente_ibfk_1` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cidade`;
CREATE TABLE `cidade` (
  `id` varchar(3) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cidade` (`id`, `name`) VALUES
('AJU',	'Aracaju'),
('CBA',	'Cuiabá'),
('CMR',	'Camaçari'),
('FSA',	'Feira de Santana'),
('JFA',	'Juiz de Fora'),
('NIT',	'Niterói'),
('REC',	'Recife'),
('SGL',	'São Gonçalo'),
('SSA',	'Salvador'),
('VRD',	'Volta Redonda');

DROP TABLE IF EXISTS `clienteseth`;
CREATE TABLE `clienteseth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(3) NOT NULL,
  `status` varchar(60) NOT NULL,
  `contrato` varchar(60) NOT NULL,
  `designacao` varchar(60) NOT NULL,
  `cliente` varchar(60) NOT NULL,
  `velocidade` varchar(60) NOT NULL,
  `operadora` varchar(60) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `data` date NOT NULL,
  `equipamento` varchar(60) NOT NULL,
  `interface` varchar(60) NOT NULL,
  `vlan` varchar(60) NOT NULL,
  `estacao` varchar(60) NOT NULL,
  `porta` varchar(60) NOT NULL,
  `posicao` varchar(60) NOT NULL,
  `estacao2` varchar(60) NOT NULL,
  `porta2` varchar(60) NOT NULL,
  `posicao2` varchar(60) NOT NULL,
  `estacao3` varchar(60) NOT NULL,
  `porta3` varchar(60) NOT NULL,
  `patch` varchar(60) NOT NULL,
  `tecnico` varchar(60) NOT NULL,
  `upgrade` date NOT NULL,
  `desativacao` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade` (`cidade`),
  CONSTRAINT `clienteseth_ibfk_1` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `equipamentos`;
CREATE TABLE `equipamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(10) NOT NULL,
  `ident` varchar(50) NOT NULL,
  `equipamento` varchar(50) NOT NULL,
  `fabricante` varchar(20) NOT NULL,
  `localizacao` varchar(50) NOT NULL,
  `tipo_acesso` varchar(100) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `ip_interno` varchar(30) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade` (`cidade`),
  CONSTRAINT `equipamentos_ibfk_1` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `group_permission`;
CREATE TABLE `group_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  KEY `permission` (`permission`),
  CONSTRAINT `group_permission_ibfk_1` FOREIGN KEY (`group`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_permission_ibfk_2` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `operadoras`;
CREATE TABLE `operadoras` (
  `operadora` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission` (`permission`),
  CONSTRAINT `page_ibfk_1` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_ticket`;
CREATE TABLE `t_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocolo` varchar(60) NOT NULL,
  `operadora` varchar(60) NOT NULL,
  `previsao` varchar(60) NOT NULL,
  `statuss` varchar(60) NOT NULL,
  `cidade` varchar(60) NOT NULL,
  `tipo_problema` varchar(100) NOT NULL,
  `cliente_final` varchar(100) NOT NULL,
  `designacao` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `obs` varchar(600) NOT NULL,
  `date` date NOT NULL,
  `arquivo` varchar(200) DEFAULT NULL,
  `tec_responsavel` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_email`;
CREATE TABLE `user_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `user_email_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `group` (`group`),
  CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_ibfk_2` FOREIGN KEY (`group`) REFERENCES `group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2015-09-27 17:32:20