SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `news_id` int(11) NOT NULL,
  `comment` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `date` char(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `rating` (`rating`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`rating`) REFERENCES `number` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `feedback` (`id`, `ip`, `news_id`, `comment`, `rating`, `date`) VALUES
(1,	'193.239.27.6',	1,	NULL,	4,	'18.04.2021'),
(2,	'197.29.27.53',	2,	'Не видел никакого метеорита. Пустая трата времени на ожидание. Верните деньги',	1,	'3.08.2022');

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `date` char(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `news` (`id`, `text`, `type_id`, `date`) VALUES
(1,	'Экстремально низкая температура. Этим летом в некоторых регионах будет наблюдаться температура до -15 в конце августа',	1,	'17.04.2021'),
(2,	'Метеорит. Этим летом в июле в Землю врежется метеорит. Данное событие ожидается 13 июля текущего года',	2,	'27.05.2022');

DROP TABLE IF EXISTS `number`;
CREATE TABLE `number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `number` (`id`) VALUES
(1),
(2),
(3),
(4),
(5);

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_type` char(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `type` (`id`, `news_type`) VALUES
(1,	'Погода'),
(2,	'Мировые события');