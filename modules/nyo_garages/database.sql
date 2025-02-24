CREATE TABLE IF NOT EXISTS `nyo_users_vehicles` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) NOT NULL,
  `garage_id` varchar(10) NOT NULL DEFAULT 'g-public',
  `vehname` varchar(30) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `work` tinyint(1) NOT NULL DEFAULT 0,
  `tax` int(15) NOT NULL DEFAULT 0,
  `impounded` tinyint(1) NOT NULL DEFAULT 0,
  `scrapped` tinyint(1) NOT NULL DEFAULT 0,
  `body` int(4) NOT NULL DEFAULT 1000,
  `engine` int(4) NOT NULL DEFAULT 1000,
  `fuel` int(3) NOT NULL DEFAULT 100,
  `damage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `custom` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom`)),
  `chest` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mid_chest` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `level` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_plate` (`plate`),
  KEY `users_vehicles_char_id` (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nyo_users_vehicles_keys` (
  `veh_id` int(11) NOT NULL,
  `char_id` int(11) NOT NULL,
  UNIQUE KEY `unique_users_vehicles_keys` (`veh_id`,`char_id`),
  KEY `users_vehicles_keys_char_id` (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `nyo_users_vehicles`
  ADD CONSTRAINT `vehicle_charid_cascate` FOREIGN KEY IF NOT EXISTS (`char_id`) REFERENCES `nyo_character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nyo_users_vehicles_keys`
  ADD CONSTRAINT `vehiclecid_key_cascate` FOREIGN KEY IF NOT EXISTS (`char_id`) REFERENCES `nyo_character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicleid_key_cascate` FOREIGN KEY IF NOT EXISTS (`veh_id`) REFERENCES `nyo_users_vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;