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

INSERT INTO `cadcliente` (`id`, `cidade`, `status`, `contrato`, `designacao`, `cliente`, `velocidade`, `operadora`, `endereco`, `data`, `ax`, `localizacao`, `tributario`, `slot`, `interface`, `canalizado`, `localentrada`, `tssdh`, `did`, `slotentrada`, `portaentrada`, `posicaoentrada`, `klmentrada`, `localsaida`, `fila`, `bastidor`, `posicaosaida`, `klmsaida`, `portasaida`, `tecnicoresp`) VALUES
(1,	'Nit',	'Em Ativação',	'2015500',	'TVC-LDF-201501',	'KARINE VAZQUEZ',	'100M',	'TIM',	'RUA SARGENTO JOSE',	'2015-05-14',	'NIT-AX4E1-0001',	'',	'CANAL 2',	'1',	'G.703',	'',	'',	'',	'',	'',	'Não possui',	'',	'',	'',	'',	'Não possui',	'',	'',	'',	'ALEXANDRE'),
(2,	'Rec',	'Ativo',	'karine',	'karine',	'karine',	'256 Kbps',	'karine',	'karine',	'2015-06-09',	'',	'',	'Não possui',	'Não possui',	'V.35',	'',	'',	'',	'',	'',	'Não possui',	'',	'',	'',	'',	'Não possui',	'',	'',	'',	''),
(3,	'Nit',	'Em Ativação',	'12345',	'TVC-LDF-0001',	'LEADER',	'256 Kbps',	'TELEFONICA',	'RUA ARTUR RIOS',	'2015-09-22',	'',	'',	'Não possui',	'Não possui',	'V.35',	'',	'',	'',	'',	'',	'Não possui',	'',	'',	'',	'',	'Não possui',	'',	'',	'',	'KARINE');

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

INSERT INTO `clienteseth` (`id`, `cidade`, `status`, `contrato`, `designacao`, `cliente`, `velocidade`, `operadora`, `endereco`, `data`, `equipamento`, `interface`, `vlan`, `estacao`, `porta`, `posicao`, `estacao2`, `porta2`, `posicao2`, `estacao3`, `porta3`, `patch`, `tecnico`, `upgrade`, `desativacao`) VALUES
(1,	'REC',	'Ativo',	'2015',	'TVC-LDF-2015-TIM',	'MC DONALDS',	'30M',	'TIM',	'RUA A',	'2015-05-25',	'CMETH',	'Fast Ethernet',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'2015-05-25',	'2015-05-25'),
(2,	'REC',	'Ativo',	'2015',	'TVC-LDF-2015-TIM',	'MC DONALDS',	'30M',	'TIM',	'RUA A',	'2015-05-25',	'CMETH',	'Fast Ethernet',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'2015-05-25',	'2015-05-25');

DROP TABLE IF EXISTS `equipamento`;
CREATE TABLE `equipamento` (
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
  CONSTRAINT `equipamento_ibfk_1` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `equipamento` (`id`, `cidade`, `ident`, `equipamento`, `fabricante`, `localizacao`, `tipo_acesso`, `ip`, `ip_interno`, `login`, `senha`) VALUES
(1,	'REC',	'REC-MMO63E1-0001',	'MMO63E1',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet / SDH Manager',	'192.168.22.17',	'10.12.0.1',	'',	'9245'),
(2,	'REC',	'REC-MMO63E1-0003',	'MMO63E1',	'ASGA',	'REC_POP_TIM_CL',	'Telnet / SDH Manager',	'192.168.0.3',	'10.14.0.2',	'admin',	'admin'),
(3,	'REC',	'REC-MMO63E1-0004',	'MMO63E1',	'ASGA',	'REC_POP_TIM_JF',	'Telnet / SDH Manager',	'',	'10.14.0.3',	'admin',	'admin'),
(4,	'REC',	'REC-MMO21E1-0001',	'MMO21E1',	'ASGA',	'REC_POP_TELEFONICA',	'Telnet / SDH Manager',	'',	'10.12.0.2',	'',	''),
(5,	'REC',	'REC-MMO21E1-0003',	'MMO21E1',	'ASGA',	'REC_POP_INTELIG',	'Telnet / SDH Manager',	'',	'10.12.0.4',	'',	''),
(6,	'REC',	'REC-MMO21E1-0004',	'MMO21E1',	'ASGA',	'WALMART',	'Telnet / SDH Manager',	'',	'10.12.0.5',	'',	''),
(7,	'REC',	'REC-AX4E1-0001',	'AX4E1',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet',	'192.168.22.23',	'',	'admin',	'admin'),
(8,	'REC',	'REC-AX4E1-0002',	'AX4E1',	'ASGA',	'REC_POP_TVC_02 (HUB)',	'Telnet',	'192.168.22.19',	'',	'admin',	'admin'),
(9,	'REC',	'REC-AX4E1-0003',	'AX4E1',	'ASGA',	'REC_POP_TVC_02 (HUB)',	'Telnet',	'192.168.22.34',	'',	'admin',	'admin'),
(10,	'REC',	'REC-AX4E1-0004',	'AX4E1',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet',	'192.168.22.36',	'',	'admin',	'admin'),
(11,	'REC',	'REC-AX4E1-0005',	'AX4E1',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet',	'192.168.22.5',	'',	'admin',	'admin'),
(12,	'REC',	'REC-AX4E1-0006',	'AX4E1',	'ASGA',	'REC_POP_TVC_02 (HUB)',	'Telnet',	'192.168.22.7',	'',	'admin',	'admin'),
(13,	'REC',	'REC-AX4E1-0007',	'AX4E1',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet',	'192.168.22.49',	'',	'admin',	'admin'),
(14,	'REC',	'REC-AX4E1-0008',	'AX4E1',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet',	'192.168.22.108',	'',	'admin',	'admin'),
(15,	'REC',	'REC-AX4E1-0009',	'AX4E1',	'ASGA',	'REC_POP_TVC_03 (SUAPE)',	'Telnet',	'172.16.22.34',	'10.2.0.119',	'admin',	'admin'),
(16,	'REC',	'REC-AX4E1-0010',	'AX4E1',	'ASGA',	'REC_POP_TVC_02 (HUB)',	'Telnet',	'172.16.22.35/24',	'',	'admin',	'admin'),
(17,	'REC',	'REC-MA10-0004-TELEFONICA',	'MUX MA-10',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'192.168.22.50',	'',	'admin',	'petvctelef'),
(18,	'REC',	'REC-MA10-0006-TELEFONICA',	'MUX MA-10',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'192.168.22.33',	'',	'admin',	'petvctelef'),
(19,	'REC',	'REC-MA10-0006-TELEFONICA',	'MUX MA-10',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'192.168.22.33',	'',	'admin',	'petvctelef'),
(20,	'REC',	'REC-MA10-0003-INTELIG',	'MUX MA-10',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'192.168.22.26',	'',	'admin',	'petvctelef'),
(21,	'REC',	'REC-MA10-0001-IMPSAT',	'MUX MA-10',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'192.168.22.16',	'',	'admin',	'petvcimp'),
(22,	'REC',	'REC-MA10-0002-IMPSAT',	'MUX MA-10',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'192.168.22.27',	'',	'admin',	'petvcimp'),
(23,	'REC',	'REC-PROXY-0001',	'AGENTE PROXY SNMP',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet',	'192.168.22.230',	'',	'admin',	'admin'),
(24,	'REC',	'REC-MMO16E1-0001',	'MMO16E1',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'REC-PROXY-0001 ENDEREÇO 005',	'',	'',	'',	''),
(25,	'REC',	'REC-MMO16E1-0002',	'MMO16E1',	'ASGA',	'REC_POP_COMSAT',	'Telnet',	'',	'',	'',	''),
(26,	'REC',	'REC-CRS12-0001',	'RS-232 CONCENTRADOR',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'',	'',	'',	'',	''),
(27,	'REC',	'REC-DMSTM1-0003',	'DMSTM1',	'DATACOM',	'REC_POP_CSU',	'Telnet / DmView',	'',	'10.11.7.2/30',	'datacom',	'datacom'),
(28,	'REC',	'REC-DMSTM1-0004',	'DMSTM1',	'DATACOM',	'REC_POP_TIMCL',	'Telnet / DmView',	'',	'10.11.0.3/28',	'datacom',	'datacom'),
(29,	'REC',	'REC-RPR-0001',	'Time Source 3600',	'Symmetricom',	'REC_POP_TVC_01 (HEADEND)',	'Time Scan Craft',	'192.168.22.97',	'',	'',	''),
(30,	'REC',	'REC-CMGR-0001',	'CMGR',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'HTTP',	'192.168.22.210',	'',	'admin',	'cmgrasga'),
(31,	'REC',	'REC-CMGR-0002',	'CMGR',	'ASGA',	'REC_POP_TVC_02 (HUB)',	'HTTP',	'192.168.22.211',	'',	'admin',	'cmgrasga'),
(32,	'REC',	'REC-CMGR-0003',	'CMGR',	'ASGA',	'REC_POP_TVC_03 (SUAPE)',	'',	'10.2.0.120',	'',	'admin',	'cmgrasga'),
(33,	'REC',	'REC-CRS12-0001',	'RS-232 CONCENTRADOR',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'',	'',	'',	'',	''),
(34,	'REC',	'REC-DM16E1-0001',	'DM16E1',	'DATACOM',	'REC_POP_TVC_01 (HEADEND)',	'DMVIEW',	'192.168.22.209',	'10.11.5.1/28',	'',	''),
(35,	'REC',	'REC-DM16E1-0002',	'DM16E1',	'DATACOM',	'REC_POP_CONTAX_R.PRINCIPE',	'DMVIEW',	'',	'10.11.5.2/28',	'',	''),
(36,	'REC',	'REC-DM16E1-0003',	'DM16E1',	'DATACOM',	'REC_POP_TVC_02 (HUB)',	'DMVIEW',	'192.168.22.110',	'10.11.2.1',	'',	''),
(37,	'REC',	'REC-DM16E1-0004',	'DM16E1',	'DATACOM',	'REC_POP_PE2209',	'DMVIEW',	'',	'10.11.2.2',	'',	''),
(38,	'REC',	'REC-DM16E1-0005',	'DM16E1',	'DATACOM',	'REC_POP_PE2202',	'DMVIEW',	'',	'10.11.2.3',	'',	''),
(39,	'REC',	'REC-DM16E1-0006',	'DM16E1',	'DATACOM',	'REC_POP_TVC_02 (HEADEND)',	'DMVIEW',	'192.168.22.111',	'',	'',	''),
(40,	'REC',	'REC-DM16E1-0007',	'DM16E1',	'DATACOM',	'REC_POP_PRIMESYS',	'DMVIEW',	'',	'',	'',	''),
(41,	'REC',	'REC-DM16E1-0008',	'DM16E1',	'DATACOM',	'REC_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'',	'',	''),
(42,	'REC',	'REC-DM16E1-0009',	'DM16E1',	'DATACOM',	'REC_POP_COMPUGRAF',	'DMVIEW',	'192.168.22.215',	'',	'',	''),
(43,	'REC',	'REC-DM16E1-0010',	'DM16E1',	'DATACOM',	'REC_POP_TVC_01 (HEADEND)',	'DMVIEW',	'192.168.22.32',	'',	'',	''),
(44,	'REC',	'REC-DM16E1-0011',	'DM16E1',	'DATACOM',	'REC_POP_IPCORP',	'DMVIEW',	'',	'',	'',	''),
(45,	'REC',	'REC-DM705-0001',	'DM705-SUB',	'DATACOM',	'REC_POP_TVC_01 (HEADEND)',	'DMVIEW / Telnet',	'192.168.22.70',	'',	'admin',	'admin'),
(46,	'REC',	'REC-DM880-0003',	'DM881',	'DATACOM',	'REC_POP_TIMCL',	'DMVIEW/HTTP',	'192.168.0.123',	'10.11.3.3',	'admin',	'admin'),
(47,	'REC',	'REC-DM880-0004',	'DM881',	'DATACOM',	'REC_POP_TIMJF',	'DMVIEW/HTTP',	'192.168.5.25',	'10.11.3.4',	'admin',	'admin'),
(48,	'REC',	'REC-DM881-0001',	'DM881',	'DATACOM',	'REC_POP_TVC_01 (HEADEND)',	'DMVIEW/HTTP',	'192.168.22.229',	'10.11.3.1',	'admin',	'admin'),
(49,	'REC',	'REC-DM881-0001-TELEFONICA',	'STM-4',	'DATACOM',	'REC_POP_TVC_01 (HEADEND)',	'DMVIEW/HTTP',	'192.168.22.229',	'10.11.3.1',	'admin',	'admin'),
(50,	'REC',	'REC-DM881-0002-TELEFONICA',	'STM-4',	'DATACOM',	'REC_POP_TVC_02 (HUB)',	'DMVIEW/HTTP',	'192.168.22.228',	'10.11.3.2',	'admin',	'admin'),
(51,	'REC',	'REC-DM881-0002',	'DM881',	'DATACOM',	'REC_POP_TVC_02 (HUB)',	'DMVIEW/HTTP',	'192.168.22.228',	'10.11.3.2',	'admin',	'admin'),
(52,	'REC',	'REC-DM881-0002-IMPSAT',	'STM-4',	'DATACOM',	'REC_POP_TVC_02 (HUB)',	'DMWIEW/HTTP',	'192.168.22.228',	'10.11.3.2',	'admin',	'admin'),
(53,	'REC',	'REC-DM881-0002-INTELIG',	'STM-4',	'DATACOM',	'REC_POP_TVC_02 (HUB)',	'DMVIEW/HTTP',	'192.168.22.228',	'10.11.3.2',	'admin',	'admin'),
(54,	'REC',	'REC-DM881-0002-INTELIG',	'STM-4',	'DATACOM',	'REC_POP_TVC_01 (HEADEND)',	'DMVIEW/HTTP',	'',	'10.11.3.2',	'admin',	'admin'),
(55,	'REC',	'REC-DM881-0002-TELEFONICA',	'STM-4',	'DATACOM',	'REC_POP_TVC_02 (HUB)',	'DMVIEW/HTTP',	'',	'10.11.3.2',	'admin',	'admin'),
(56,	'REC',	'REC-DM881-0003',	'DM881',	'DATACOM',	'REC_POP_TVC_03 (SUAPE)',	'DMVIEW/HTTP',	'172.16.22.30',	'10.2.0.118',	'admin',	'admin'),
(57,	'REC',	'REC-DMSTM1-0003',	'STM-4',	'DATACOM',	'REC_NEXTEL_ED.MARAJÓ',	'DMVIEW',	'',	'10.2.0.123',	'',	''),
(58,	'REC',	'REC-DMSTM1-0004',	'STM-4',	'DATACOM',	'REC_POP_INTELIG_PTP_NEXTEL MARAJÓ',	'DMVIEW',	'',	'10.2.0.124',	'',	''),
(59,	'REC',	'REC-DMSTM1-0005',	'DMSTM1',	'DATACOM',	'REC_POP_INTELIG',	'Telnet / DmView',	'',	'10.11.9.2',	'datacom',	'datacom'),
(60,	'REC',	'REC-DMSTM1-0006',	'DMSTM1',	'DATACOM',	'REC_POP_INTELIG',	'',	'',	'10.11.13.2/28',	'datacom',	'datacom'),
(61,	'REC',	'REC-DMSTM1-0007',	'DMSTM1',	'DATACOM',	'REC_POP_TELEFONICA',	'Telnet / DmView',	'',	'10.11.12.3/28',	'datacom',	'datacom'),
(62,	'REC',	'REC-DMSTM1-0008',	'DMSTM1',	'DATACOM',	'REC_POP_TELEFONICA',	'Telnet / DmView',	'',	'10.11.8.3/28',	'datacom',	'datacom'),
(63,	'REC',	'REC-DMSTM1-0009',	'DMSTM1',	'DATACOM',	'REC_POP_CSUBATALHA',	'Telnet / DmView',	'',	'10.11.15.2/30',	'datacom',	'datacom'),
(64,	'REC',	'REC-DMSTM1-0012',	'DMSTM1',	'DATACOM',	'REC_POP_TIMJF',	'DMVIEW',	'',	'10.11.6.1/28',	'',	''),
(65,	'REC',	'REC-DMSTM1-0013',	'DMSTM1',	'DATACOM',	'REC_POP_TIMRCP',	'DMVIEW',	'',	'10.11.4.9',	'',	''),
(66,	'REC',	'REC-DMSTM1-0014',	'DMSTM1',	'DATACOM',	'REC_POP_TIMLDA',	'DMVIEW',	'',	'10.11.4.8',	'',	''),
(67,	'REC',	'REC-DMSTM1-0015',	'DMSTM1',	'DATACOM',	'REC_POP_TIMABC',	'DMVIEW',	'',	'10.11.4.7',	'',	''),
(68,	'REC',	'REC-DMSTM1-0016',	'DMSTM1',	'DATACOM',	'REC_POP_TIMHIL',	'DMVIEW',	'',	'10.11.4.11',	'',	''),
(69,	'REC',	'REC-DMSTM1-0017',	'DMSTM1',	'DATACOM',	'REC_POP_TIMCPOR',	'DMVIEW',	'',	'10.11.4.4',	'',	''),
(70,	'REC',	'REC-DMSTM1-0018',	'DMSTM1',	'DATACOM',	'REC_POP_TIMCDT',	'DMVIEW',	'',	'10.11.4.13',	'',	''),
(71,	'REC',	'REC-DMSTM1-0019',	'DMSTM1',	'DATACOM',	'REC_POP_TIMJF',	'DMVIEW',	'',	'10.11.4.1',	'',	''),
(72,	'REC',	'REC-DMSTM1-0020',	'DMSTM1',	'DATACOM',	'REC_POP_TIMMAS',	'DMVIEW',	'',	'10.11.4.2',	'',	''),
(73,	'REC',	'REC-DMSTM1-0021',	'DMSTM1',	'DATACOM',	'REC_POP_TIMECT',	'DMVIEW',	'',	'10.11.4.3',	'',	''),
(74,	'REC',	'REC-DMSTM1-0022',	'DMSTM1',	'DATACOM',	'REC_POP_TIMSFC',	'DMVIEW',	'',	'10.11.4.6',	'',	''),
(75,	'REC',	'REC-DMSTM1-0024',	'DMSTM1',	'DATACOM',	'REC_POP_TIMPCC',	'DMVIEW',	'',	'10.11.4.12',	'',	''),
(76,	'REC',	'REC-DMSTM1-0025',	'DMSTM1',	'DATACOM',	'REC_POP_TIMCZE',	'DMVIEW',	'',	'10.11.4.10',	'',	''),
(77,	'REC',	'REC-DMSTM1-0026',	'DMSTM1',	'DATACOM',	'REC_POP_TIMSJQ',	'DMVIEW',	'',	'10.11.4.14',	'',	''),
(78,	'REC',	'REC-DMSTM1-0029',	'DMSTM1',	'DATACOM',	'REC_POP_CSU',	'DMVIEW',	'',	'10.11.6.2/28',	'',	''),
(79,	'REC',	'REC-DMSTM1-0030',	'DMSTM1',	'DATACOM',	'REC_POP_INTELIG',	'DMVIEW',	'',	'10.11.11.1/28',	'',	''),
(80,	'REC',	'REC-DMSTM1-0031',	'DMSTM1',	'DATACOM',	'REC_POP_CONTAX-AURORA',	'DMVIEW',	'',	'10.11.11.2/28',	'',	''),
(81,	'REC',	'REC-DMSW-0001',	'DMSWITCH',	'DATACOM',	'REC_POP_INTELIG',	'Telnet',	'',	'172.16.22.4',	'admin',	'tv(teIecom'),
(82,	'REC',	'REC-DMSW-0002',	'DMSWITCH',	'DATACOM',	'REC_POP_TVC_01 (HEADEND)',	'Telnet',	'',	'172.16.22.2',	'admin',	'tv(teIecom'),
(83,	'REC',	'REC-DMSW-0003',	'DMSWITCH',	'DATACOM',	'REC_POP_TVC_02 (HUB)',	'Telnet',	'',	'172.16.22.3',	'admin',	'tv(teIecom'),
(84,	'REC',	'REC-DMSW-0005',	'DMSWITCH',	'DATACOM',	'REC_POP_TIMJF',	'Telnet',	'',	'172.16.22.5',	'admin',	'tv(teIecom'),
(85,	'REC',	'REC-DMSW-0006',	'DMSWITCH',	'DATACOM',	'REC_POP_GVT',	'Telnet',	'',	'172.16.22.6',	'admin',	'tv(teIecom'),
(86,	'REC',	'REC-DMSW-0007',	'DMSWITCH',	'DATACOM',	'REC_POP_TELEFONICA',	'Telnet',	'',	'172.16.22.7',	'admin',	'tv(teIecom'),
(87,	'REC',	'REC-DMSW-0008',	'DMSWITCH',	'DATACOM',	'REC_POP_TVC_01 (HEADEND)',	'Telnet',	'',	'172.16.22.8',	'admin',	'tv(teIecom'),
(88,	'REC',	'REC-DMSW-0009-EDD',	'DMSWITCH - EDD',	'DATACOM',	'REC_CPD_IMPSA',	'Telnet',	'',	'10.2.0.109',	'admin',	'admin'),
(89,	'REC',	'REC-DMSW-0010-EDD',	'DMSWITCH - EDD',	'DATACOM',	'REC_POP_TVC_02 (HUB) (LIGADO A IMPSA)',	'Telnet',	'192.168.122.175',	'10.2.0.110',	'admin',	'admin'),
(90,	'REC',	'REC-DMSW-0011',	'DMSWITCH',	'DATACOM',	'REC_POP_BT COMSAT',	'Telnet',	'',	'172.16.22.11',	'admin',	'tv(teIecom'),
(91,	'REC',	'REC-DMSW-0012',	'DMSWITCH',	'DATACOM',	'NEXTEL - PTP OLD-AREIAS',	'SEM GERÊNCIA',	'',	'10.2.0.112',	'admin',	'admin'),
(92,	'REC',	'REC-DMSW-0013',	'DMSWITCH',	'DATACOM',	'NEXTEL - PTP OLD-AREIAS',	'SEM GERÊNCIA',	'',	'10.2.0.113',	'admin',	'admin'),
(93,	'REC',	'REC-DMSW-0014',	'DMSWITCH',	'DATACOM',	'REC_POP_TVC_02 (HUB)',	'Telnet',	'',	'172.16.22.14',	'admin',	'tv(teIecom'),
(94,	'REC',	'REC-DMSW-0015',	'DMSWITCH',	'DATACOM',	'REC_POP_PRIMESYS',	'Telnet',	'',	'172.16.22.15',	'admin',	'tv(teIecom'),
(95,	'REC',	'REC-DMSW-0016',	'DMSWITCH',	'DATACOM',	'REC_POP_TVC_SUAPE',	'Telnet',	'',	'172.16.22.16',	'admin',	'tv(teIecom'),
(96,	'REC',	'REC-DMSW-0017-EDD',	'DMSWITCH - EDD',	'DATACOM',	'REC_PETROBRÁS_BVG',	'Telnet',	'',	'172.16.22.17',	'admin',	'admin'),
(97,	'REC',	'REC-DMSW-0018-EDD',	'DMSWITCH - EDD',	'DATACOM',	'REC_SITE_INTELIG_INTERLIGADO A NEXTEL',	'Telnet',	'',	'172.16.22.18',	'admin',	'admin'),
(98,	'REC',	'REC-DMSW-0019',	'DMSWITCH',	'DATACOM',	'REC_SITE_NEXTEL_CASA FORTE',	'Telnet',	'',	'172.16.22.19',	'admin',	'admin'),
(99,	'REC',	'REC-DMSW-0020-EDD CMTS',	'DMSWITCH - EDD',	'DATACOM',	'REC_POP_HEADEND_DATACENTER CMTS',	'Telnet',	'',	'172.16.22.20',	'admin',	'admin'),
(100,	'REC',	'REC-DMSW-0021-EDD CMTS',	'DMSWITCH - EDD',	'DATACOM',	'REC_POP_HUB_DATACENTER CMTS',	'Telnet',	'',	'172.16.22.21',	'admin',	'admin'),
(101,	'REC',	'REC-DMSW-0022',	'DMSWITCH',	'DATACOM',	'REC_POP_INTELIG',	'Telnet',	'',	'172.16.22.22',	'admin',	'tv(teIecom'),
(102,	'REC',	'REC-DMSW-0023',	'DMSWITCH',	'DATACOM',	'REC_POP_TVC_01 (HEADEND)',	'Telnet',	'',	'172.16.22.23',	'admin',	'tv(teIecom'),
(103,	'REC',	'REC-DMSW-0024',	'DMSWITCH',	'DATACOM',	'REC_POP_TVC_02 (HUB)',	'Telnet',	'',	'172.16.22.24',	'admin',	'tv(teIecom'),
(104,	'REC',	'REC-DMSW-0025',	'DMSWITCH - EDD',	'DATACOM',	'REC_PTP GALPÃO PÃO DE AÇÚCAR',	'Telnet',	'',	'172.16.22.25',	'admin',	'admin'),
(105,	'REC',	'REC-DMSW-0026',	'DMSWITCH - EDD',	'DATACOM',	'REC_POP_HUB (LIGADO AO GPA)',	'Telnet',	'',	'172.16.22.26',	'admin',	'admin'),
(106,	'REC',	'REC-DMSW-0027-EDD',	'DMSWITCH - EDD',	'DATACOM',	'REC_CLIENTE_GLOBO MORRO DO PELUDO',	'Telnet',	'',	'172.16.22.27',	'admin',	'admin'),
(107,	'REC',	'REC-MA10-0001-PRIMESYS',	'MUX MA-10',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'',	'',	'admin',	'petvcimp'),
(108,	'REC',	'REC-MMO16E1-0002',	'MMO16E1',	'ASGA',	'REC_POP_COMSAT',	'Telnet',	'',	'',	'',	''),
(109,	'REC',	'REC-MMO16E1-0003',	'MMO16E1',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'',	'',	'',	'',	''),
(110,	'REC',	'REC-MMO16E1-0004',	'MMO16E1',	'ASGA',	'REC_POP_TRANSIT',	'Telnet',	'',	'',	'',	''),
(111,	'REC',	'REC-MMO16E1-0005',	'MMO16E1',	'ASGA',	'REC_POP_TVC_01 (HEADEND)',	'HTTP',	'192.168.22.32',	'',	'admin',	'16ngasga'),
(112,	'REC',	'REC-MMO16E1-0006',	'MMO16E1',	'ASGA',	'RE_POP_IPCORP',	'HTTP',	'',	'10.0.10.2',	'admin',	'16ngasga'),
(113,	'REC',	'REC-PROXY-0001',	'AGENTE PROXY SNMP',	'ASGA',	'POP_TVC_REC_01 (HEADEND)',	'Telnet',	'192.168.22.230',	'',	'admin',	'admin'),
(114,	'SSA',	'SSA-MMO63E1-0001',	'MMO63E1',	'ASGA',	'SSA_POP_TVC_01 (HEADEND) ',	'Telnet / SDH Manager',	'',	'10.13.0.2',	'',	'8855'),
(115,	'SSA',	'SSA-MMO63E1-0002',	'MMO63E1',	'ASGA',	'SSA_POP_INTELIG',	'Telnet / SDH Manager',	'',	'10.13.0.66',	'',	'8855'),
(116,	'SSA',	'SSA-MMO21E1-0001',	'MMO21E1',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'Telnet / SDH Manager',	'',	'10.13.0.117',	'admin',	'8855'),
(117,	'SSA',	'SSA-MMO21E1-0002',	'MMO21E1',	'ASGA',	'SSA_POP_TRANSIT',	'Telnet / SDH Manager',	'',	'10.13.0.118',	'admin',	'8855'),
(118,	'SSA',	'SSA-AX4E1-0001',	'AX4E1',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'Telnet',	'',	'10.13.0.4',	'',	'885500'),
(119,	'SSA',	'SSA-AX4E1-0002',	'AX4E1',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'Telnet',	'',	'10.13.0.10',	'',	'885500'),
(120,	'SSA',	'SSA-AX4E1-0003',	'AX4E1',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'Telnet',	'',	'10.13.0.21',	'',	'885500'),
(121,	'SSA',	'SSA-AX4E1-0004',	'AX4E1',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'Telnet',	'',	'10.13.0.22',	'',	'885500'),
(122,	'SSA',	'SSA-AX4E1-0005',	'AX4E1',	'ASGA',	'SSA_POP_TVC_02 (BARBALHO)',	'Telnet',	'',	'10.13.0.30',	'admin',	'885500'),
(123,	'SSA',	'SSA-AX4E1-0006',	'AX4E1',	'ASGA',	'SSA_POP_TVC_03 (PIATA)',	'Telnet',	'',	'10.13.0.32',	'admin',	'885500'),
(124,	'SSA',	'SSA-AX4E1-0007',	'AX4E1',	'ASGA',	'SSA_POP_TVC_04 (BARRA)',	'Telnet',	'',	'10.13.0.36',	'admin',	'admin'),
(125,	'SSA',	'SSA-AX4E1-0008',	'AX4E1',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'Telnet',	'',	'10.13.0.28',	'admin',	'admin'),
(126,	'SSA',	'SSA-AX4E1-0009',	'AX4E1',	'ASGA',	'SSA_POP_TVC_03 (PIATA)',	'Telnet',	'',	'10.13.0.40',	'admin',	'admin'),
(127,	'SSA',	'SSA-AX4E1-0010',	'AX4E1',	'ASGA',	'SSA_POP_TVC_02 (BARBALHO)',	'Telnet',	'',	'10.13.0.60',	'admin',	'admin'),
(128,	'SSA',	'SSA-MA10-0001-IMPSAT',	'MUX MA-10',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'',	'10.13.0.5',	'admin',	'885500'),
(129,	'SSA',	'SSA-MA10-0003-IMPSAT',	'MUX MA-10',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'',	'10.13.0.20',	'admin',	'885500'),
(130,	'SSA',	'SSA-MA10-0004-IMPSAT',	'MUX MA-10',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'',	'10.13.0.26',	'admin',	'885500'),
(131,	'SSA',	'SSA-PROXY-0001',	'AGENTE PROXY SNMP',	'ASGA',	'POP_TVC_SSA_01 (HEADEND)',	'Telnet',	'',	'10.13.0.3',	'admin',	'admin'),
(132,	'SSA',	'SSA-DM881-0001',	'DM881',	'DATACOM',	'POP_TVC_SSA_01 (HEADEND)',	'DMVIEW / WEB',	'',	'10.13.0.23',	'',	''),
(133,	'SSA',	'SSA-DM881-0002',	'DM881',	'DATACOM',	'SSA_POP_TVC_02 (BARBALHO)',	'DMVIEW / WEB',	'',	'10.13.0.194',	'',	''),
(134,	'SSA',	'SSA-DM881-0003',	'DM881',	'DATACOM',	'SSA_POP_TVC_04 (BARRA)',	'DMVIEW / WEB',	'',	'10.13.0.193',	'',	''),
(135,	'SSA',	'SSA-DM881-0004',	'DM881',	'DATACOM',	'POP_TVC_SSA_01 (HEADEND)',	'DMVIEW / WEB',	'',	'10.15.0.106',	'',	''),
(136,	'SSA',	'SSA-DM881-0005',	'DM881',	'DATACOM',	'POP_TVC_SSA_(HUB PIATA)',	'DMVIEW / WEB',	'',	'10.13.0.212',	'',	''),
(137,	'SSA',	'SSA-DM881-0006',	'DM881',	'DATACOM',	'POP_TVC_SSA_(POP_INTELIG)',	'DMVIEW / WEB',	'',	'10.13.0.109',	'',	''),
(138,	'SSA',	'SSA-DM881-0007',	'DM881',	'DATACOM',	'POP_TVC_SSA_(POP_GVT)',	'DMVIEW / WEB',	'',	'10.15.0.102',	'',	''),
(139,	'SSA',	'SSA-DMSTM1-0001',	'DMSTM1',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'10.13.0.121',	'',	''),
(140,	'SSA',	'SSA-DMSTM1-0002',	'DMSTM1',	'DATACOM',	'SSA_POP_TELEFÔNICA',	'DMVIEW',	'',	'10.15.0.118',	'',	''),
(141,	'SSA',	'SSA-DMSTM1-0003',	'DMSTM1',	'DATACOM',	'SSA_POP_INTELIG',	'DMVIEW',	'',	'10.13.0.113',	'',	''),
(142,	'SSA',	'SSA-DMSTM1-0004',	'DMSTM1',	'DATACOM',	'SSA_POP_EMBRATEL',	'DMVIEW',	'',	'10.13.0.126',	'',	''),
(143,	'SSA',	'SSA-DMSTM1-0006',	'DMSTM1',	'DATACOM',	'SSA_POP_TELEFÔNICA',	'DMVIEW',	'',	'10.13.0.147',	'',	''),
(144,	'SSA',	'SSA-DMSTM1-0007',	'DMSTM1',	'DATACOM',	'DMSTM1	DATACOM	SSA_POP_TELEFÔNICA',	'DMVIEW',	'',	'10.13.0.161',	'',	''),
(145,	'SSA',	'SSA-DMSTM1-0008',	'DMSTM1',	'DATACOM',	'SSA_POP_TELEFÔNICA_VILA LAURA',	'DMVIEW',	'',	'10.15.0.126',	'',	''),
(146,	'SSA',	'SSA-DMSTM1-0009',	'DMSTM1',	'DATACOM',	'SSA_POP_BT',	'DMVIEW',	'',	'10.15.0.113',	'',	''),
(147,	'SSA',	'SSA-DMSTM1-00010',	'DMSTM1',	'DATACOM',	'SSA_POP_INTELIG',	'DMVIEW',	'',	'10.15.0.114',	'',	''),
(148,	'SSA',	'SSA-DMSWITCH-0001',	'DMSWITCH 3000',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	' WEB',	'',	'10.15.0.2',	'admin1',	'telecoba'),
(149,	'SSA',	'SSA-DMSWITCH-0002',	'DMSWITCH 3000',	'DATACOM',	'SSA_POP_INTELIG',	' WEB',	'',	'10.15.0.8',	'admin1',	'Telecoba'),
(150,	'SSA',	'SSA-DMSWITCH-0003',	'DMSWITCH 3000',	'DATACOM',	'SSA_POP_TELEFONICA',	' WEB',	'',	'10.15.0.9',	'admin1',	'telecoba'),
(151,	'SSA',	'SSA-DMSWITCH-0004',	'DMSWITCH 3000',	'DATACOM',	'SSA_HUB_PIATA',	' WEB',	'',	'10.15.0.5',	'admin1',	'telecoba'),
(152,	'SSA',	'SSA-DMSWITCH-0005',	'DMSWITCH 3000',	'DATACOM',	'SSA_POP_TVC_02 (HEADEND)',	' WEB',	'',	'10.15.0.3',	'admin1',	'telecoba'),
(153,	'SSA',	'SSA-DMSWITCH-0006',	'DMSWITCH 3000',	'DATACOM',	'SSA_POP_GVT',	' WEB',	'',	'10.15.0.12',	'admin1',	'telecoba'),
(154,	'SSA',	'SSA-DMSWITCH-0007',	'DMSWITCH 3000',	'DATACOM',	'SSA_POP_PRIMISYS',	' WEB',	'',	'10.15.0.7',	'admin1',	'telecoba'),
(155,	'SSA',	'SSA-DMSWITCH-0008',	'DMSWITCH 3000',	'DATACOM',	'SSA_HUB_BARBALHO',	' WEB',	'',	'10.15.0.6',	'admin1',	'telecoba'),
(156,	'SSA',	'SSA-DMSWITCH-0009',	'DMSWITCH 3000',	'DATACOM',	'SSA_POP_TELEFONICA VILA LAURA',	' WEB',	'',	'10.15.0.10',	'admin1',	'telecoba'),
(157,	'SSA',	'SSA-DMSWITCH-0010',	'DMSWITCH 3000',	'DATACOM',	'SSA_POP_TVC_03 (HEADEND)',	' WEB',	'',	'10.15.0.4',	'admin',	'admin'),
(158,	'SSA',	'SSA-DMSWITCH-EDD-0011',	'DMSWITCH-EDD',	'DATACOM',	'SSA_BRADESCO COMERCIO',	' WEB',	'',	'10.15.0.11',	'admin',	'admin'),
(159,	'SSA',	'SSA-DM16E1-0003',	'16E1',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'10.13.0.31',	'',	''),
(160,	'SSA',	'SSA-DM16E1-0004',	'16E1',	'DATACOM',	'TIM',	'DMVIEW',	'',	'10.13.0.31',	'',	''),
(161,	'SSA',	'SSA-DM16E1-0005',	'16E1',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'10.13.0.37',	'',	''),
(162,	'SSA',	'SSA-DM16E1-0006',	'16E1',	'DATACOM',	'ATENTO',	'DMVIEW',	'',	'10.13.0.37',	'',	''),
(163,	'SSA',	'SSA-DM16E1-0007',	'16E1',	'DATACOM',	'SSA_POP_TVC_02 (BARBALHO)',	'DMVIEW',	'',	'10.13.0.41',	'',	''),
(164,	'SSA',	'SSA-DM16E1-0008',	'16E1',	'DATACOM',	'Banco do Brasil',	'DMVIEW',	'',	'10.13.0.41',	'',	''),
(165,	'SSA',	'SSA-DM16E1-0009',	'16E1',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'10.13.0.55',	'',	''),
(166,	'SSA',	'SSA-DM16E1-0010',	'16E1',	'DATACOM',	'TIM S.A',	'DMVIEW',	'',	'10.13.0.55',	'',	''),
(167,	'SSA',	'SSA-DM16E1-0011',	'16E1',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'10.13.0.45',	'',	''),
(168,	'SSA',	'SSA-DM16E1-0012',	'16E1',	'DATACOM',	'GVT',	'DMVIEW',	'',	'10.13.0.45',	'',	''),
(169,	'SSA',	'SSA-DM16E1-0013',	'16E1',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'10.13.0.38',	'',	''),
(170,	'SSA',	'SSA-DM16E1-0014',	'16E1',	'DATACOM',	'TIM S.A',	'DMVIEW',	'',	'10.13.0.38',	'',	''),
(171,	'SSA',	'SSA-DM16E1-0015',	'16E1',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'10.13.0.50',	'',	''),
(172,	'SSA',	'SSA-DM16E1-0016',	'16E1',	'DATACOM',	'IPCORP',	'DMVIEW',	'',	'10.13.0.50',	'',	''),
(173,	'SSA',	'SSA-DM16E1-0017',	'16E1',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'10.13.0.58',	'',	''),
(174,	'SSA',	'SSA-DM16E1-0018',	'16E1',	'DATACOM',	'BT',	'DMVIEW',	'',	'10.13.0.58',	'',	''),
(175,	'SSA',	'CMR-MA10-0001',	'MA-10',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'WEB',	'',	'',	'admin',	'1234'),
(176,	'SSA',	'CMR-MA10-0002',	'MA-10',	'ASGA',	'POP CAMAÇARI',	'WEB',	'',	'10.13.0.57',	'',	''),
(177,	'SSA',	'SSA-DM4E1-0001',	'4E1',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'10.13.0.42',	'',	''),
(178,	'SSA',	'SSA-DM4E1-0002',	'4E1',	'DATACOM',	'SSA_POP_TVC_05 (TRADE CENTER)',	'DMVIEW',	'',	'10.13.0.42',	'',	''),
(179,	'SSA',	'SSA-DM4E1-0003',	'4E1',	'DATACOM',	'SSA_POP_TVC_02 (BARBALHO)',	'DMVIEW',	'',	'10.13.0.43',	'',	''),
(180,	'SSA',	'SSA-DM4E1-0004',	'4E1',	'DATACOM',	'SENAC (AQUIDABA)',	'DMVIEW',	'',	'10.13.0.43',	'',	''),
(181,	'SSA',	'',	'CMGR',	'ASGA',	'SSA_POP_TVC_01 (HEADEND)',	'WEB',	'',	'10.13.0.48',	'admin',	'telecoba'),
(182,	'SSA',	'',	'CMGR',	'ASGA',	'SSA_POP_TVC_01 (HUB PIATA)',	'WEB',	'',	'10.13.0.51',	'admin',	'telecoba'),
(183,	'NIT',	'NIT-MA10-0001-IMPSAT',	'MUX MA-10',	'ASGA',	'HUB ICARAÍ',	'Telnet / HTTP',	'192.168.40.200',	'',	'',	''),
(184,	'NIT',	'NIT-PROXY_ASGA-0001',	'AGENTE PROXY SNMP',	'ASGA',	'HUB ICARAÍ',	'Telnet / HTTP',	'192.168.40.188',	'',	'',	''),
(185,	'NIT',	'NIT-DMSTM1-0001',	'DMSTM1',	'DATACOM',	'NIT_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'172.16.40.10',	'',	''),
(186,	'NIT',	'NIT-DMSTM1-0002',	'DMSTM1',	'DATACOM',	'NIT_POP_ HUB SGL',	'DMVIEW',	'',	'172.16.40.30/30',	'',	''),
(187,	'NIT',	'NIT-DMSTM1-0003',	'DMSTM1',	'DATACOM',	'NIT_POP_ HUB ICARAI',	'DMVIEW',	'',	'172.16.40.42',	'',	''),
(188,	'NIT',	'NIT-DMSTM1-0004',	'DMSTM1',	'DATACOM',	'NIT_POP_INTELIG',	'DMVIEW',	'',	'172.16.40.13',	'',	''),
(189,	'NIT',	'NIT-DMSTM1-0005',	'DMSTM1',	'DATACOM',	'NIT_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'172.16.40.25',	'',	''),
(190,	'NIT',	'NIT-DMSTM1-0005',	'DMSTM1',	'DATACOM',	'NIT_POP_TELEFÔNICA',	'DMVIEW',	'',	'172.16.40.18',	'',	''),
(191,	'NIT',	'NIT-DM881-0001',	'DM881',	'DATACOM',	'NIT_POP_TELEFÔNICA',	'DMVIEW',	'',	'172.16.40.34',	'',	''),
(192,	'NIT',	'NIT-DM881-0002',	'DM881',	'DATACOM',	'NIT_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'172.16.40.2',	'',	''),
(193,	'NIT',	'NIT-DMSW-0001',	'DMSWITCH 3000',	'DATACOM',	'NIT_POP_TVC_01 (HEADEND)',	'Telnet / DMVIEW',	'',	'172.16.40.6',	'admin',	'admin'),
(194,	'NIT',	'NIT-DMSW-0002',	'DMSWITCH 3000',	'DATACOM',	'HUB ICARAÍ',	'Telnet / DMVIEW',	'',	'172.16.40.7',	'admin',	'admin'),
(195,	'NIT',	'NIT-DMSW-0003',	'DMSWITCH 3000',	'DATACOM',	'HUB SÃO GONÇALO',	'Telnet / DMVIEW',	'',	'172.16.40.8',	'admin',	'admin'),
(196,	'NIT',	'NIT-DMSW-0004',	'DMSWITCH 3000',	'DATACOM',	'NIT_POP_TELEFÔNICA',	'Telnet / DMVIEW',	'',	'172.16.40.3',	'admin',	'admin'),
(197,	'NIT',	'NIT-AX4E1-0001',	'AX4E1',	'ASGA',	'NIT_POP_TVC_01 (HEADEND)',	'Telnet',	'',	'172.16.40.20',	'admin',	'admin'),
(198,	'NIT',	'NIT-AX4E1-0002',	'AX4E1',	'ASGA',	'NIT_POP_TVC_ (HUB ICARAI)',	'Telnet',	'',	'172.16.40.22',	'admin',	'admin'),
(199,	'NIT',	'NIT-CMGR-0001',	'CMGR',	'ASGA',	'NIT_POP_TVC_01 (HEADEND)',	'WEB',	'',	'172.16.40.9',	'admin',	'cmgrasga'),
(200,	'NIT',	'NIT-CMGR-0002',	'CMGR',	'ASGA',	'NIT_POP_TVC_ (HUB ICARAI)',	'WEB',	'',	'172.16.40.23',	'admin',	'cmgrasga'),
(201,	'NIT',	'NIT-CMGR-0003',	'CMGR',	'ASGA',	'NIT_POP_TVC_ (HUB ICARAI)',	'WEB',	'',	'172.16.40.5',	'admin',	'cmgrasga'),
(202,	'AJU',	'AJU-DMSTM1-0001',	'DMSTM1',	'DATACOM',	'HEADEND',	'DMVIEW',	'172.16.23.5',	'',	'',	''),
(203,	'AJU',	'AJU-DMSTM1-0002',	'DMSTM1',	'DATACOM',	'INTELIG',	'DMVIEW',	'172.33.0.251/28',	'',	'',	''),
(204,	'AJU',	'AJU-DMSTM1-0003',	'DMSTM1',	'DATACOM',	'RECORD',	'DMVIEW',	'172.33.0.252/28',	'',	'',	''),
(205,	'AJU',	'AJU-MA10-0001',	'MUX MA-10',	'ASGA',	'HEADEND',	'Telnet / WEB',	'172.16.23.6',	'',	'admin',	'1234'),
(206,	'AJU',	'AJU-MA10-0002',	'MUX MA-10',	'ASGA',	'HEADEND',	'Telnet / WEB',	'172.16.23.7',	'',	'admin',	'1234'),
(207,	'AJU',	'AJU-MA10-0003',	'MUX MA-10',	'ASGA',	'HEADEND',	'Telnet / WEB',	'172.16.23.8',	'',	'admin',	'1234'),
(208,	'AJU',	'AJU-MA10-0004',	'MUX MA-10',	'ASGA',	'HEADEND',	'Telnet / WEB',	'172.16.23.9',	'',	'admin',	'1234'),
(209,	'AJU',	'AJU-MA10-0005',	'MUX MA-10',	'ASGA',	'HEADEND',	'Telnet / WEB',	'172.16.23.10',	'',	'admin',	'1234'),
(210,	'AJU',	'AJU-AX4E1-0001',	'AX4E1',	'ASGA',	'AJU_POP_TVC_01 (HEADEND)',	'Telnet',	'172.16.23.11',	'',	'',	'admin'),
(211,	'AJU',	'AJU-CMGR-0001',	'CMGR',	'ASGA',	'HEADEND',	'WEB',	'172.16.23.12',	'',	'',	''),
(212,	'AJU',	'AJU-DMSWITCH-0001',	'DMSWITCH 3000',	'ASGA',	'AJU_POP_TVC_01 (HEADEND)',	' WEB / Telnet',	'',	'172.16.23.2',	'admin1',	'admin'),
(213,	'AJU',	'AJU-DMSWITCH-0002',	'DMSWITCH 3000',	'ASGA',	'AJU_POP_INTELIG',	' WEB / Telnet',	'',	'172.16.23.3',	'admin1',	'admin'),
(214,	'AJU',	'AJU-DMSWITCH-0003',	'DMSWITCH - EDD',	'ASGA',	'NET',	'Telnet',	'',	'172.16.23.4',	'admin1',	'admin'),
(215,	'SGL',	'NIT-DMSTM1-0001',	'DMSTM1',	'DATACOM',	'NIT_POP_TVC_01 (HEADEND)',	'DMVIEW',	'172.16.40.10/27',	'172.16.40.33',	'',	''),
(216,	'SGL',	'NIT-DMSTM1-0002',	'DMSTM1',	'DATACOM',	'NIT_POP_ HUB SGL',	'DMVIEW',	'',	'172.16.40.30/30',	'',	''),
(217,	'SGL',	'NIT-DMSTM1-0003',	'DMSTM1',	'DATACOM',	'HUB ICARAÍ',	'DMVIEW',	'',	'172.16.40.42/30',	'',	''),
(218,	'SGL',	'NIT-DM880-0001',	'DM881',	'DATACOM',	'NIT_POP_TELEFÔNICA',	'DMVIEW',	'',	'172.16.40.34',	'',	''),
(219,	'SGL',	'NIT-DM881-0002',	'DM881',	'DATACOM',	'NIT_POP_TVC_01 (HEADEND)',	'DMVIEW',	'172.16.40.2/27',	'',	'',	''),
(220,	'SGL',	'NIT-DMSWITCH-0001',	'DMSWITCH 3000',	'DATACOM',	'NIT_POP_TELEFÔNICA',	'Telnet / DMVIEW',	'',	'172.16.40.3',	'',	''),
(221,	'SGL',	'NIT-DMSW-0001',	'DMSWITCH 3000',	'DATACOM',	'NIT_POP_TVC_01 (HEADEND)',	'Telnet / DMVIEW',	'',	'172.16.40.6',	'admin',	'admin'),
(222,	'SGL',	'NIT-DMSW-0002',	'DMSWITCH 3000',	'DATACOM',	'HUB ICARAÍ',	'Telnet / DMVIEW',	'',	'172.16.40.7',	'admin',	'admin'),
(223,	'SGL',	'NIT-DMSW-0003',	'DMSWITCH 3000',	'DATACOM',	'HUB SÃO GONÇALO',	'Telnet / DMVIEW',	'',	'172.16.40.8',	'admin',	'admin'),
(224,	'SGL',	'NIT-DMSW-0004',	'DMSWITCH 3000',	'DATACOM',	'NIT_POP_TELEFÔNICA',	'Telnet / DMVIEW',	'',	'172.16.40.3',	'admin',	'admin'),
(225,	'SGL',	'SGL-CMGR-0004',	'CMGR',	'ASGA',	'HUB SÃO GONÇALO',	'WEB',	'',	'172.16.40.4',	'admin',	'cmgrasga'),
(226,	'SGL',	'SGL-AX4E1-0001',	'AX4E1',	'ASGA',	'HUB SÃO GONÇALO',	'Telnet',	'',	'172.16.40.21',	'admin',	'admin'),
(227,	'FSA',	'FSA-DMSTM1-0001',	'DMSTM1',	'DATACOM',	'HEADEND',	'DMVIEW',	'172.16.21.2',	'',	'',	''),
(228,	'FSA',	'FSA-DMSTM1-0002',	'DMSTM1',	'DATACOM',	'TIM',	'DMVIEW',	'',	'',	'',	''),
(229,	'FSA',	'FSA-DMSTM1-0003',	'DMSTM1',	'DATACOM',	'OI',	'DMVIEW',	'172.16.21.14',	'',	'',	''),
(230,	'FSA',	'FSA-DM16E1-0001',	'DM16E1',	'DATACOM',	'HEADEND',	'DMVIEW',	'192.168.21.52',	'',	'',	''),
(231,	'FSA',	'FSA-AX4E1-0001',	'AX4E1',	'ASGA',	'HEADEND',	'Telnet',	'192.168.21.58',	'',	'admin',	'1234'),
(232,	'JFA',	'JFA-DMSTM1-0001',	'DmSTM-1',	'DATACOM',	'FJA_POP_TVC_01 (HEADEND)',	'Telnet / DmView',	'',	'172.16.42.3',	'datacom',	'datacom'),
(233,	'JFA',	'JFA-DM705-0001',	'Dm705 Sub',	'DATACOM',	'FJA_POP_TVC_01 (HEADEND)',	'Telnet / DmView',	'',	'172.16.42.2',	'admin',	'admin'),
(234,	'VRD',	'VRD-DM881-0001',	'DM881',	'DATACOM',	'VRD_POP_TVC_01 (HEADEND)',	'Telnet / HTTP / DmView',	'',	'172.16.43.4',	'admin',	'admin'),
(235,	'VRD',	'VRD-DMSTM1-0001',	'DmSTM-1',	'DATACOM',	'POP_INTELIG',	'Telnet / DmView',	'',	' 172.16.43.34',	'datacom',	'datacom'),
(236,	'VRD',	'VRD-DM705-0001',	'Dm705 Sub',	'DATACOM',	'VRD_POP_TVC_01 (HEADEND)',	'Telnet / DmView',	'',	'172.16.43.3',	'admin',	'admin'),
(237,	'VRD',	'VRD-CMGR-0001',	'CMGR',	'ASGA',	'VRD_POP_TVC_01 (HEADEND)',	'HTTP',	'',	'172.16.43.2',	'admin',	'cmgrasga'),
(238,	'VRD',	'VRD-DMSW-0001',	'Dm3000',	'DATACOM',	'VRD_POP_TVC_01 (HEADEND)',	'Telnet / HTTP / DmView',	'',	'172.16.43.29',	'admin',	'admin'),
(239,	'VRD',	'VRD-DMSW-0002',	'Dm3000',	'DATACOM',	'POP_INTELIG',	'Telnet / HTTP / DmView',	'',	'172.16.43.8',	'admin',	'admin'),
(240,	'VRD',	'VRD-DMSW-0003',	'DMEDD',	'DATACOM',	'POP_SKY',	'Telnet / HTTP / DmView',	'',	'172.16.43.7',	'admin',	'admin'),
(241,	'VRD',	'VRD-DM4E1-0001',	'Dm4E1',	'DATACOM',	'VRD_POP_TVC_01 (HEADEND)',	'DmView',	'',	'172.16.43.5',	'',	'telecomvrd'),
(242,	'VRD',	'VRD-DM4E1-0002',	'Dm4E1',	'DATACOM',	'POP_TIM',	'DmView',	'',	'172.16.43.5',	'',	'telecomvrd'),
(243,	'VRD',	'VRD-DM4E1-0003',	'Dm4E1',	'DATACOM',	'VRD_POP_TVC_01 (HEADEND)',	'DmView',	'',	'172.16.43.6',	'',	'telecomvrd'),
(244,	'VRD',	'VRD-DM4E1-0004',	'Dm4E1',	'DATACOM',	'POP_CTBC',	'DmView',	'',	'172.16.43.6',	'',	'telecomvrd'),
(245,	'CMR',	'CMR-DM881-0001',	'DM881',	'DATACOM',	'CMR_POP_CAMACARI',	'DMVIEW',	'',	'10.13.0.57',	'',	''),
(246,	'CMR',	'CMR-DM16E1-0001',	'DM16E1',	'DATACOM',	'CMR_POP_CAMACARI',	'DMVIEW',	'',	'10.13.0.52',	'',	''),
(247,	'CMR',	'CMR-DM16E1-0002',	'DM16E1',	'DATACOM',	'CMR_FORD',	'DMVIEW',	'',	'10.13.0.52',	'',	''),
(248,	'CMR',	'CMR-AX4E1-0001',	'AX4E1',	'ASGA',	'CMR_POP_CAMACARI',	'Telnet ',	'',	'10.13.0.54',	'admin',	''),
(249,	'CMR',	'CMR-DM16E1-0003',	'DM16E1',	'DATACOM',	'CMR_POP_CAMACARI',	'DMVIEW',	'',	'10.13.0.25',	'',	''),
(250,	'CMR',	'CMR-DM16E1-0004',	'DM16E1',	'DATACOM',	'CMR_DUPOINT',	'DMVIEW',	'',	'10.13.0.25',	'',	''),
(251,	'CMR',	'PLACA CMGR',	'CMGR',	'ASGA',	'CMR_POP_CAMACARI',	'WEB',	'',	'10.13.0.5',	'admin',	'telecoba'),
(252,	'CMR',	'CMR-DM4E1-0001',	'DM4E1',	'DATACOM',	'CMR_POP_CAMACARI',	'DMVIEW',	'',	'10.13.0.56',	'',	''),
(253,	'CMR',	'CMR-DM4E1-0002',	'DM4E1',	'DATACOM',	'CMR_FORD',	'DMVIEW',	'',	'10.13.0.56',	'',	''),
(254,	'CBA',	'CBA-SMTM1-0001',	'DMSTM1',	'DATACOM',	'CBA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'172.16.30.3',	'172.16.30.25/30',	'',	''),
(255,	'CBA',	'CBA-SMTM1-0002',	'DMSTM1',	'DATACOM',	'CBA_POP_TELEFÔNICA',	'DMVIEW',	'',	'172.16.30.26/30',	'',	''),
(256,	'CBA',	'CBA-SMTM1-0003',	'DMSTM1',	'DATACOM',	'CBA_POP_INTELIG',	'DMVIEW',	'',	'',	'',	''),
(257,	'CBA',	'CBA-AX4E1-0001',	'AX4E1',	'ASGA',	'CBA_POP_TVC_01 (HEADEND)',	'Telnet',	'',	'172.16.30.6',	'admin',	'admin'),
(258,	'CBA',	'CBA-MA10-0001-TELEFONICA',	'MUX MA-10',	'ASGA',	'CBA_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'',	'172.16.30.4',	'admin',	'1234'),
(259,	'CBA',	'CBA-MA10-0002-TELEFONICA',	'MUX MA-10',	'ASGA',	'CBA_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'',	'172.16.30.5',	'admin',	'1234'),
(260,	'CBA',	'CBA-MA10-0003-TELEFONICA',	'MUX MA-10',	'ASGA',	'CBA_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'',	'172.16.30.7',	'admin',	'1234'),
(261,	'CBA',	'CBA-MA10-0004-TELEFONICA',	'MUX MA-10',	'ASGA',	'CBA_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'',	'172.16.30.10',	'admin',	'1234'),
(262,	'CBA',	'CBA-MA10-0005-TELEFONICA',	'MUX MA-10',	'ASGA',	'CBA_POP_TVC_01 (HEADEND)',	'Telnet / HTTP',	'',	'172.16.30.9',	'admin',	'1234'),
(263,	'CBA',	'CBA-DMSW-0001',	'DMSWITCH',	'DATACOM',	'CBA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'172.16.30.28',	'admin',	'admin'),
(264,	'CBA',	'CBA-DMSW-0002',	'DMSWITCH',	'DATACOM',	'CBA_POP_TELEFÔNICA',	'DMVIEW',	'',	'172.16.30.29',	'admin',	'admin'),
(265,	'CBA',	'CBA-DMSW-0003',	'DMSWITCH - EDD',	'DATACOM',	'CBA_POP_BT',	'DMVIEW',	'',	'172.16.30.30',	'admin',	'admin'),
(266,	'CBA',	'CBA-DM4E1-0001',	'4E1',	'DATACOM',	'SSA_POP_TVC_01 (HEADEND)',	'DMVIEW',	'',	'172.16.30.8',	'admin',	'admin'),
(267,	'CBA',	'CBA-DM4E1-0002',	'4E1',	'DATACOM',	'SSA_POP_TVC_05 (BT/COMSAT)',	'DMVIEW',	'',	'172.16.30.8',	'admin',	'admin');

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

INSERT INTO `operadoras` (`operadora`) VALUES
('Telefônica'),
('Intelig'),
('Level 3'),
('Global');

DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `permission` int(11) NOT NULL,
  `menu` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `permission` (`permission`),
  CONSTRAINT `page_ibfk_1` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `page` (`id`, `name`, `permission`, `menu`) VALUES
('editar_equipamento',	'Editar Equipamento',	4,	0),
('editar_ticket',	'Editar Ticket',	3,	0),
('equipamentos',	'Equipamentos',	1,	1),
('tickets',	'Tickets',	2,	1);

DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `permission` (`id`, `name`) VALUES
(1,	'ver equipamentos'),
(2,	'ver tickets'),
(3,	'editar tickets'),
(4,	'editar equipamentos');

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `status` (`id`, `name`) VALUES
(1,	'Stop Time'),
(2,	'Em Andamento'),
(3,	'Agendado'),
(4,	'Finalizado');

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocolo` varchar(60) NOT NULL,
  `operadora` varchar(60) NOT NULL,
  `previsao` varchar(60) NOT NULL,
  `status` varchar(60) NOT NULL,
  `cidade` varchar(3) NOT NULL,
  `tipo_problema` varchar(100) NOT NULL,
  `cliente_final` varchar(100) NOT NULL,
  `designacao` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `obs` varchar(600) NOT NULL,
  `date` date NOT NULL,
  `arquivo` varchar(200) DEFAULT NULL,
  `tec_responsavel` varchar(20) NOT NULL,
  `criado_em` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cidade` (`cidade`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ticket` (`id`, `protocolo`, `operadora`, `previsao`, `status`, `cidade`, `tipo_problema`, `cliente_final`, `designacao`, `telefone`, `obs`, `date`, `arquivo`, `tec_responsavel`, `criado_em`) VALUES
(1,	'201573589',	'TELEFONICA',	'4:00',	'Stop Time',	'REC',	'INDISPONIVEL',	'ATENTO',	'REC-LDF-0350-TELEFONICA',	'21135541',	'CLIENTE INFORMA QUE CIRCUITO FORA',	'0000-00-00',	'',	'KARINE VAZQUEZ',	'2015-09-29 17:28:56'),
(2,	'201550040',	'TELEFONICA',	'03:00',	'Em Andamento',	'REC',	'Indisponível',	'ATENTO',	'REC-LDF-0300-TELEFONICA',	'2121125541',	'Circuito fora',	'2015-01-30',	'',	'Karine Vazquez',	'2015-09-29 17:28:56'),
(3,	'201548965',	'TVC',	'01:00',	'Stop Time',	'JFA',	'Intermitente',	'C&A',	'JFA-LDF-2015787',	'',	'',	'2015-01-30',	'',	'JANSEN',	'2015-09-29 17:28:56'),
(4,	'124654789',	'TELEFONICA',	'01:00',	'Stop Time',	'CBA',	'Taxando erro de CRC',	'ATENTO',	'REC-LDF-0215-TELEFONICA',	'2121458965',	'TESTE',	'2015-01-30',	'',	'KARINE VAZQUEZ',	'2015-09-29 17:28:56'),
(5,	'201502021',	'INTELIG',	'01:00',	'Em Andamento',	'FSA',	'Indisponível',	'INTELIG',	'REC-LDF-00222-INTELIG',	'2121135541',	'TESTE',	'2015-02-02',	'',	'',	'2015-09-29 17:28:56'),
(6,	'201589654',	'INTELIG',	'13:00',	'Agendado',	'REC',	'Indisponível',	'TVCIDADE',	'REC-LDF-0158-TVC',	'2121458963',	'TESTE',	'2015-02-02',	'',	'KARINE VAZQUEZ',	'2015-09-29 17:28:56'),
(7,	'201520108',	'TVC',	'00:00',	'Agendado',	'FSA',	'Taxando erro de CRC',	'tvc',	'REC-LDF-0259-tvc',	'',	'Cliente informa que ax travado',	'2015-02-23',	'',	'Erisvan',	'2015-09-29 17:28:56'),
(8,	'201589635',	'INTELIG',	'01:59',	'Stop Time',	'NIT',	'Indisponível',	'CASAS BAHIA',	'REC-LDF-02588',	'212589654',	'Cliente informa que circuito indisponível',	'2015-02-23',	'',	'karine',	'2015-09-29 17:28:56'),
(9,	'201550044',	'telefonica',	'04:58',	'Em Andamento',	'CMR',	'Indisponível',	'TELEFONICA',	'REC-LDF-0259-TELEFONICA',	'2158965478',	'REC-LDF-0259-TELEFONICA',	'2015-02-23',	'',	'karine',	'2015-09-29 17:28:56'),
(10,	'201589632',	'TVC',	'00:00',	'Em Andamento',	'NIT',	'Indisponível',	'TVC',	'TVC',	'TVC',	'TVC',	'2015-02-24',	'',	'TVC',	'2015-09-29 17:28:56'),
(11,	'201541025',	'TVC',	'21:23',	'Em Andamento',	'NIT',	'Taxando erro de CRC',	'TVC',	'TVC',	'',	'Cliente informa que circuito indisponível',	'2015-02-24',	'',	'RAFAEL',	'2015-09-29 17:28:56'),
(12,	'201512345',	'Global',	'01:59',	'Em Andamento',	'JFA',	'Indisponível',	'Leader',	'JFA-LDF-2015789',	'201512345',	'201512345',	'2015-02-24',	'',	'JANSEN',	'2015-09-29 17:28:56'),
(13,	'201512346',	'TVC',	'14:08',	'Em Andamento',	'JFA',	'Indisponível',	'',	'201512345',	'201512345',	'Cliente informa que circuito indisponível',	'2015-02-24',	'',	'JANSEN',	'2015-09-29 17:28:56'),
(14,	'201514785',	'Global',	'12:00',	'Em Andamento',	'SSA',	'Indisponível',	'',	'SSA-LDF-201589',	'',	'Cliente informa que ax travado',	'2015-02-24',	'',	'SAULO',	'2015-09-29 17:28:56'),
(15,	'201512348',	'INTELIG',	'17:20',	'Em Andamento',	'REC',	'Indisponível',	'IND. DE ALIMENTOS',	'REC-LDF-02580',	'',	'Cliente informa que circuito indisponível',	'2015-02-24',	'',	'PATRICIA',	'2015-09-29 17:28:56'),
(16,	'201512347',	'TVC',	'23:08',	'Em Andamento',	'NIT',	'Indisponível',	'MARALCO',	'NIT-LDF-1258965',	'',	'Cliente informa que circuito indisponível',	'2015-02-24',	'',	'ALEXANDRE',	'2015-09-29 17:28:56'),
(17,	'201520198',	'LEVEL 3',	'01:59',	'Em Andamento',	'NIT',	'Indisponível',	'SANSUNG',	'NIT-LDF-2015078',	'',	'Cliente informa que ax travado',	'2015-03-03',	'',	'ALEXANDRE',	'2015-09-29 17:28:56'),
(26,	'201550043',	'TELEFONICA',	'14:11',	'Em Andamento',	'REC',	'Indisponível',	'PATRICIA LTDA',	'REC-LDF-00300-TELEFONICA',	'212345678',	'Cliente patricia boladona',	'2015-04-07',	NULL,	'Karine Linda',	'2015-09-29 17:28:56'),
(28,	'201550093',	'Global',	'01:01',	'Em Andamento',	'NIT',	'Indisponível',	'MC DONALD\'S',	'NIT-LDF-2015003',	'584384',	'Cliente informa que circuito indisponível',	'2015-07-13',	NULL,	'karine',	'2015-09-29 17:28:56');

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


-- 2015-09-29 20:32:45