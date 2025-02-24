CREATE TABLE IF NOT EXISTS `nyo_homes` (
  `id` varchar(20) NOT NULL,
  `interior` varchar(40) NOT NULL,
  `tax` int(11) NOT NULL,
  `maxMember` int(11) NOT NULL,
  `vault` int(11) NOT NULL,
  `vaultData` longtext NOT NULL DEFAULT '{"i":[],"w":[]}',
  UNIQUE KEY `id unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nyo_homes_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homes_id` varchar(20) NOT NULL,
  `charId` int(10) NOT NULL,
  `owner` int(1) NOT NULL,
  `vault` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

ALTER TABLE `nyo_homes_permission`
  ADD CONSTRAINT `homes_charId_cascate` FOREIGN KEY IF NOT EXISTS (`charId`) REFERENCES `nyo_character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `homes_hid_cascate` FOREIGN KEY IF NOT EXISTS (`homes_id`) REFERENCES `nyo_homes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;