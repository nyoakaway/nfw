CREATE TABLE IF NOT EXISTS `nyo_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `queue_priority` int(3) NOT NULL DEFAULT 0,
  `max_character` int(3) NOT NULL DEFAULT 1,
  `last_login` int(11) NOT NULL DEFAULT 0,
  `discord_id` varchar(40) NOT NULL DEFAULT 0,
  `vip` text NOT NULL DEFAULT '{}',
  `coin` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nyo_character` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `registration` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `age` int(3) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `skin` text DEFAULT NULL,
  `customization` text DEFAULT NULL,
  `tattoo` text DEFAULT NULL,
  `wardrobe` text DEFAULT NULL,
  `cloakroom` text DEFAULT NULL,
  `health` int(4) DEFAULT 400,
  `armour` int(4) DEFAULT 0,
  `hunger` int(3) NOT NULL DEFAULT 100,
  `thirst` int(3) NOT NULL DEFAULT 100,
  `position` varchar(100) DEFAULT NULL,
  `groups` text DEFAULT '{}',
  `inventory` text DEFAULT NULL,
  `bank_money` int(50) DEFAULT NULL,
  `prision` int(5) NOT NULL DEFAULT -1,
  `vip` text NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nyo_account_identifier` (
  `identifier` varchar(100) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`identifier`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `nyo_character`
  ADD CONSTRAINT `char_cascate` FOREIGN KEY IF NOT EXISTS (`account_id`) REFERENCES `nyo_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nyo_account_identifier`
  ADD CONSTRAINT `account_identifier_cascate` FOREIGN KEY IF NOT EXISTS (`account_id`) REFERENCES `nyo_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;