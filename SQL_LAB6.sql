SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `lines` (`id`, `name`) VALUES
(1,	'red'),
(2,	'blue'),
(3,	'green');

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `number_in_line` int(8) NOT NULL,
  `station_name` text COLLATE utf8_unicode_ci NOT NULL,
  `station_line` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `stations` (`id`, `number_in_line`, `station_name`, `station_line`) VALUES
(1,	1,	'Центральний ринок',	'red'),
(2,	2,	'Майдан Конституцiї',	'red'),
(3,	1,	'Iсторичний музей',	'blue'),
(4,	2,	'Унiверситет',	'blue');

DROP TABLE IF EXISTS `transitions`;
CREATE TABLE `transitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_station` text COLLATE utf8_unicode_ci NOT NULL,
  `to_station` text COLLATE utf8_unicode_ci NOT NULL,
  `from_line` text COLLATE utf8_unicode_ci NOT NULL,
  `to_line` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `transitions` (`id`, `from_station`, `to_station`, `from_line`, `to_line`) VALUES
(1,	'Майдан Конституцiї',	'Iсторичний музей',	'red',	'blue');