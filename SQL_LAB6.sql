SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `line`;
CREATE TABLE `line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `line` (`id`, `name`) VALUES
(1,	'red'),
(2,	'blue'),
(3,	'green');

DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_in_line` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `line` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `line` (`line`),
  CONSTRAINT `station_ibfk_1` FOREIGN KEY (`line`) REFERENCES `line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `station` (`id`, `number_in_line`, `name`, `line`) VALUES
(1,	1,	'Майдан Конституцiї',	1),
(2,	2,	'Проспект Гагарiна',	1),
(3,	1,	'Iсторичний музей',	2);

DROP TABLE IF EXISTS `transition`;
CREATE TABLE `transition` (
  `from_station` int(11) NOT NULL,
  `to_station` int(11) NOT NULL,
  KEY `from_station` (`from_station`),
  KEY `to_station` (`to_station`),
  CONSTRAINT `transition_ibfk_1` FOREIGN KEY (`from_station`) REFERENCES `station` (`id`),
  CONSTRAINT `transition_ibfk_2` FOREIGN KEY (`to_station`) REFERENCES `station` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `transition` (`from_station`, `to_station`) VALUES
(1,	3);