CREATE TABLE IF NOT EXISTS `nyo_gm_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT 0,
  `name` varchar(25) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nyo_gm_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(3) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `type` int(3) NOT NULL DEFAULT 1,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]' CHECK (json_valid(`data`)),
  PRIMARY KEY (`id`),
  KEY `cascade_gm_logs_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nyo_gm_organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(25) NOT NULL,
  `type` int(3) NOT NULL DEFAULT '0',
  `icon` varchar(50) NOT NULL DEFAULT 'fas fa-user-nurse',
  `name` varchar(25) DEFAULT NULL,
  `creation_date` int(25) DEFAULT NULL,
  `max_members` int(11) NOT NULL,
  `transfer_code` varchar(8) DEFAULT NULL,
  `money` int(12) NOT NULL DEFAULT 0,
  `config` varchar(25) DEFAULT NULL,
  `upgrades` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]' CHECK (json_valid(`upgrades`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gm_prefix` (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nyo_gm_orgs_members` (
  `org_id` int(11) NOT NULL,
  `char_id` int(11) NOT NULL,
  `donated_money` int(25) NOT NULL DEFAULT 0,
  `owner` tinyint(1) NOT NULL DEFAULT 0,
  `contracted_by` int(11) NOT NULL DEFAULT 0,
  `date` int(20) NOT NULL DEFAULT 0,
  UNIQUE KEY `ukey` (`char_id`,`org_id`) USING BTREE,
  KEY `gm_org_cascate` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nyo_gm_permissions` (
  `group_id` int(11) NOT NULL,
  `permission` varchar(50) NOT NULL,
  KEY `index` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `nyo_gm_groups`
  ADD CONSTRAINT `gm_groups_org_cascate` FOREIGN KEY IF NOT EXISTS (`org_id`) REFERENCES `nyo_gm_organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nyo_gm_logs`
  ADD CONSTRAINT `cascade_gm_logs_org_id` FOREIGN KEY IF NOT EXISTS (`org_id`) REFERENCES `nyo_gm_organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nyo_gm_orgs_members`
  ADD CONSTRAINT `gm_member_cascate` FOREIGN KEY IF NOT EXISTS (`char_id`) REFERENCES `nyo_character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gm_org_cascate` FOREIGN KEY IF NOT EXISTS (`org_id`) REFERENCES `nyo_gm_organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nyo_gm_permissions`
  ADD CONSTRAINT `gm_permission_cascate` FOREIGN KEY IF NOT EXISTS (`group_id`) REFERENCES `nyo_gm_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;