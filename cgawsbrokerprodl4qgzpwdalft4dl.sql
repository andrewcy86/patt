-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `mantis_api_token_table`;
CREATE TABLE `mantis_api_token_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `hash` varchar(128) NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  `date_used` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id_name` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_api_token_table` (`id`, `user_id`, `name`, `hash`, `date_created`, `date_used`) VALUES
(1,	1,	'test-Create API Token',	'900f6274c88fe17515b4dfc6b3a31830bd73b64844a02db951b598edbbc2b42b',	1569517570,	1);

DROP TABLE IF EXISTS `mantis_bugnote_table`;
CREATE TABLE `mantis_bugnote_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bugnote_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `note_type` int(11) DEFAULT '0',
  `note_attr` varchar(250) DEFAULT '',
  `time_tracking` int(10) unsigned NOT NULL DEFAULT '0',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '1',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug` (`bug_id`),
  KEY `idx_last_mod` (`last_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bugnote_table` (`id`, `bug_id`, `reporter_id`, `bugnote_text_id`, `view_state`, `note_type`, `note_attr`, `time_tracking`, `last_modified`, `date_submitted`) VALUES
(1,	1,	1,	1,	10,	0,	'',	0,	1569833214,	1569833214);

DROP TABLE IF EXISTS `mantis_bugnote_text_table`;
CREATE TABLE `mantis_bugnote_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bugnote_text_table` (`id`, `note`) VALUES
(1,	'How will the types of scanning be determined, i.e. DPI, double-sided, size, etc.?');

DROP TABLE IF EXISTS `mantis_bug_file_table`;
CREATE TABLE `mantis_bug_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob,
  `date_added` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bug_file_bug_id` (`bug_id`),
  KEY `idx_diskfile` (`diskfile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_history_table`;
CREATE TABLE `mantis_bug_history_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(64) NOT NULL,
  `old_value` varchar(255) NOT NULL,
  `new_value` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `date_modified` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_history_bug_id` (`bug_id`),
  KEY `idx_history_user_id` (`user_id`),
  KEY `idx_bug_history_date_modified` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_history_table` (`id`, `user_id`, `bug_id`, `field_name`, `old_value`, `new_value`, `type`, `date_modified`) VALUES
(1,	1,	1,	'',	'',	'',	1,	1569441134),
(2,	1,	1,	'status',	'10',	'50',	0,	1569441134),
(3,	1,	1,	'handler_id',	'0',	'1',	0,	1569441134),
(4,	1,	1,	'category',	'General',	'Folder Level',	0,	1569598271),
(5,	1,	1,	'category',	'Folder Level',	'Non-Site Specific',	0,	1569598611),
(6,	1,	1,	'status',	'50',	'90',	0,	1569601422),
(7,	1,	1,	'Index Level',	'',	'Folder Level',	0,	1569601423),
(8,	1,	1,	'Number of Boxes',	'',	'5',	0,	1569601423),
(9,	1,	1,	'Date',	'',	'1451779200',	0,	1569601423),
(10,	1,	1,	'Sensitivity',	'',	'no',	0,	1569601423),
(11,	1,	1,	'Accession Number',	'',	'12311',	0,	1569601423),
(12,	1,	1,	'PII',	'',	'no',	0,	1569601423),
(13,	1,	1,	'PHI',	'',	'no',	0,	1569601423),
(14,	1,	1,	'CUI',	'',	'no',	0,	1569601423),
(15,	1,	1,	'status',	'90',	'60',	0,	1569607002),
(16,	1,	1,	'status',	'60',	'10',	0,	1569607789),
(17,	1,	1,	'',	'0000001',	'',	2,	1569833214),
(18,	1,	1,	'handler_id',	'1',	'2',	0,	1569850929),
(19,	1,	1,	'project_id',	'1',	'2',	0,	1569867687),
(20,	1,	1,	'project_id',	'2',	'1',	0,	1569867725),
(21,	1,	1,	'status',	'10',	'90',	0,	1569867926),
(22,	1,	1,	'resolution',	'10',	'20',	0,	1569867926),
(23,	1,	1,	'status',	'90',	'20',	0,	1569867954),
(24,	1,	1,	'resolution',	'20',	'30',	0,	1569867954),
(25,	1,	1,	'priority',	'30',	'50',	0,	1569867967),
(26,	1,	2,	'',	'',	'',	1,	1569932380),
(27,	1,	2,	'status',	'10',	'30',	0,	1569932881),
(28,	1,	1,	'status',	'20',	'30',	0,	1569932881),
(29,	1,	2,	'project_id',	'1',	'2',	0,	1569933728),
(30,	1,	3,	'',	'',	'',	1,	1569937450),
(31,	1,	4,	'',	'',	'',	1,	1569937549),
(32,	1,	4,	'status',	'10',	'40',	0,	1569937671),
(33,	1,	1,	'status',	'30',	'40',	0,	1569937671),
(34,	1,	3,	'project_id',	'1',	'2',	0,	1569937719),
(35,	1,	4,	'handler_id',	'0',	'2',	0,	1569938537),
(36,	1,	4,	'status',	'40',	'50',	0,	1569938537),
(37,	1,	4,	'handler_id',	'2',	'1',	0,	1569938593),
(38,	1,	5,	'',	'',	'',	1,	1569938798),
(39,	1,	5,	'status',	'10',	'50',	0,	1569938888),
(40,	1,	5,	'handler_id',	'0',	'2',	0,	1569938888),
(41,	1,	4,	'handler_id',	'1',	'2',	0,	1569938888),
(42,	1,	3,	'status',	'10',	'50',	0,	1569938888),
(43,	1,	3,	'handler_id',	'0',	'2',	0,	1569938888),
(44,	1,	2,	'status',	'30',	'50',	0,	1569938888),
(45,	1,	2,	'handler_id',	'0',	'2',	0,	1569938888),
(46,	1,	3,	'sticky',	'0',	'1',	0,	1569941937),
(47,	1,	1,	'project_id',	'1',	'2',	0,	1570117639),
(48,	1,	5,	'project_id',	'1',	'2',	0,	1570117639),
(49,	1,	1,	'project_id',	'2',	'1',	0,	1570117652),
(50,	1,	5,	'project_id',	'2',	'1',	0,	1570117652),
(51,	1,	1,	'project_id',	'1',	'2',	0,	1570648284),
(52,	1,	4,	'project_id',	'1',	'2',	0,	1570648284),
(53,	1,	4,	'priority',	'30',	'20',	0,	1570713682),
(54,	1,	1,	'priority',	'50',	'20',	0,	1570713682);

DROP TABLE IF EXISTS `mantis_bug_monitor_table`;
CREATE TABLE `mantis_bug_monitor_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`bug_id`),
  KEY `idx_bug_id` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_relationship_table`;
CREATE TABLE `mantis_bug_relationship_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `destination_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `relationship_type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_relationship_source` (`source_bug_id`),
  KEY `idx_relationship_destination` (`destination_bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_revision_table`;
CREATE TABLE `mantis_bug_revision_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL,
  `bugnote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_rev_type` (`type`),
  KEY `idx_bug_rev_id_time` (`bug_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_table`;
CREATE TABLE `mantis_bug_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `handler_id` int(10) unsigned NOT NULL DEFAULT '0',
  `duplicate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` smallint(6) NOT NULL DEFAULT '30',
  `severity` smallint(6) NOT NULL DEFAULT '50',
  `reproducibility` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `resolution` smallint(6) NOT NULL DEFAULT '10',
  `projection` smallint(6) NOT NULL DEFAULT '10',
  `eta` smallint(6) NOT NULL DEFAULT '10',
  `bug_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '',
  `fixed_in_version` varchar(64) NOT NULL DEFAULT '',
  `build` varchar(32) NOT NULL DEFAULT '',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `summary` varchar(128) NOT NULL DEFAULT '',
  `sponsorship_total` int(11) NOT NULL DEFAULT '0',
  `sticky` tinyint(4) NOT NULL DEFAULT '0',
  `target_version` varchar(64) NOT NULL DEFAULT '',
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  `due_date` int(10) unsigned NOT NULL DEFAULT '1',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_sponsorship_total` (`sponsorship_total`),
  KEY `idx_bug_fixed_in_version` (`fixed_in_version`),
  KEY `idx_bug_status` (`status`),
  KEY `idx_project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_table` (`id`, `project_id`, `reporter_id`, `handler_id`, `duplicate_id`, `priority`, `severity`, `reproducibility`, `status`, `resolution`, `projection`, `eta`, `bug_text_id`, `os`, `os_build`, `platform`, `version`, `fixed_in_version`, `build`, `profile_id`, `view_state`, `summary`, `sponsorship_total`, `sticky`, `target_version`, `category_id`, `date_submitted`, `due_date`, `last_updated`) VALUES
(1,	2,	1,	2,	0,	20,	50,	70,	40,	30,	10,	10,	1,	'',	'',	'',	'',	'',	'',	0,	10,	'Documents to be digitized',	0,	0,	'',	1,	1569441134,	1,	1570713682),
(2,	2,	1,	2,	0,	30,	50,	70,	50,	10,	10,	10,	2,	'',	'',	'',	'',	'',	'',	0,	10,	'Test 2',	0,	0,	'',	3,	1569932380,	1,	1569938888),
(3,	2,	1,	2,	0,	30,	50,	70,	50,	10,	10,	10,	3,	'',	'',	'',	'',	'',	'',	0,	10,	'Include ECMS',	0,	1,	'',	3,	1569937450,	1,	1569941937),
(4,	2,	1,	2,	0,	20,	50,	70,	50,	10,	10,	10,	4,	'',	'',	'',	'',	'',	'',	0,	10,	'Scanning',	0,	0,	'',	1,	1569937549,	1,	1570713682),
(5,	1,	1,	2,	0,	30,	50,	70,	50,	10,	10,	10,	5,	'',	'',	'',	'',	'',	'',	0,	10,	'Scan all documents',	0,	0,	'',	3,	1569938798,	1,	1570117652);

DROP TABLE IF EXISTS `mantis_bug_tag_table`;
CREATE TABLE `mantis_bug_tag_table` (
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_attached` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`bug_id`,`tag_id`),
  KEY `idx_bug_tag_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_text_table`;
CREATE TABLE `mantis_bug_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `steps_to_reproduce` longtext NOT NULL,
  `additional_information` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_text_table` (`id`, `description`, `steps_to_reproduce`, `additional_information`) VALUES
(1,	'Digitize test documents',	'',	''),
(2,	'Second Test',	'',	''),
(3,	'Assessment Record for OU27 of the Fort Meade, MD. site.',	'',	'Index:  Site Name, Author, Doc-date, OU, Project Phase, '),
(4,	'none',	'',	'none'),
(5,	'Box of contracts for digitization',	'',	'some information goes here');

DROP TABLE IF EXISTS `mantis_category_table`;
CREATE TABLE `mantis_category_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_project_name` (`project_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES
(1,	0,	0,	'Non-Site Specific',	0),
(3,	0,	0,	'Site Specific',	0);

DROP TABLE IF EXISTS `mantis_config_table`;
CREATE TABLE `mantis_config_table` (
  `config_id` varchar(64) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `access_reqd` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '90',
  `value` longtext NOT NULL,
  PRIMARY KEY (`config_id`,`project_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_config_table` (`config_id`, `project_id`, `user_id`, `access_reqd`, `type`, `value`) VALUES
('bug_report_page_fields',	0,	0,	90,	3,	'[\"category_id\",\"view_state\",\"summary\",\"description\",\"additional_info\",\"attachments\"]'),
('bug_update_page_fields',	0,	0,	90,	3,	'[\"category_id\",\"handler\",\"priority\",\"status\",\"view_state\",\"summary\",\"description\",\"additional_info\",\"attachments\"]'),
('csv_columns',	0,	0,	90,	3,	'[\"id\",\"project_id\",\"reporter_id\",\"handler_id\",\"priority\",\"category_id\",\"date_submitted\",\"view_state\",\"last_updated\",\"summary\",\"status\"]'),
('csv_columns',	1,	0,	90,	3,	'[\"id\",\"project_id\",\"reporter_id\",\"handler_id\",\"priority\",\"version\",\"category_id\",\"date_submitted\",\"view_state\",\"last_updated\",\"summary\",\"status\"]'),
('database_version',	0,	0,	90,	1,	'209'),
('excel_columns',	0,	0,	90,	3,	'[\"id\",\"project_id\",\"reporter_id\",\"handler_id\",\"priority\",\"category_id\",\"date_submitted\",\"view_state\",\"last_updated\",\"summary\",\"status\"]'),
('excel_columns',	1,	0,	90,	3,	'[\"id\",\"project_id\",\"reporter_id\",\"handler_id\",\"priority\",\"version\",\"category_id\",\"date_submitted\",\"view_state\",\"last_updated\",\"summary\",\"status\"]'),
('plugin_Announce_schema',	0,	0,	90,	1,	'5'),
('plugin_FilterBugList_schema',	0,	0,	90,	1,	'-1'),
('plugin_MantisGraph_schema',	0,	0,	90,	1,	'-1'),
('plugin_SimpleSAMLphpAuth_schema',	0,	0,	90,	1,	'-1'),
('print_issues_page_columns',	0,	0,	90,	3,	'[\"selection\",\"priority\",\"id\",\"bugnotes_count\",\"attachment_count\",\"category_id\",\"status\",\"last_updated\",\"summary\"]'),
('print_issues_page_columns',	1,	0,	90,	3,	'[\"selection\",\"priority\",\"id\",\"bugnotes_count\",\"attachment_count\",\"category_id\",\"status\",\"last_updated\",\"summary\"]'),
('view_issues_page_columns',	0,	0,	90,	3,	'[\"selection\",\"edit\",\"priority\",\"id\",\"bugnotes_count\",\"category_id\",\"status\",\"last_updated\",\"summary\"]'),
('view_issues_page_columns',	1,	0,	90,	3,	'[\"selection\",\"edit\",\"priority\",\"id\",\"bugnotes_count\",\"attachment_count\",\"category_id\",\"status\",\"last_updated\",\"summary\"]'),
('view_issues_page_columns',	1,	1,	90,	3,	'[\"selection\",\"edit\",\"priority\",\"id\",\"bugnotes_count\",\"attachment_count\",\"category_id\",\"status\",\"last_updated\",\"summary\",\"custom_Shipping Tracking Number\"]');

DROP TABLE IF EXISTS `mantis_custom_field_project_table`;
CREATE TABLE `mantis_custom_field_project_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_custom_field_project_table` (`field_id`, `project_id`, `sequence`) VALUES
(1,	1,	5),
(1,	2,	0),
(2,	1,	0),
(3,	1,	1),
(5,	1,	2),
(6,	1,	3),
(7,	1,	4),
(8,	1,	6),
(9,	1,	7),
(10,	1,	0);

DROP TABLE IF EXISTS `mantis_custom_field_string_table`;
CREATE TABLE `mantis_custom_field_string_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `text` longtext,
  PRIMARY KEY (`field_id`,`bug_id`),
  KEY `idx_custom_field_bug` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_custom_field_string_table` (`field_id`, `bug_id`, `value`, `text`) VALUES
(1,	1,	'no',	NULL),
(1,	2,	'no',	NULL),
(1,	3,	'no',	NULL),
(1,	4,	'no',	NULL),
(1,	5,	'no',	NULL),
(2,	1,	'',	NULL),
(2,	3,	'12239494922',	NULL),
(2,	4,	'1Z8383Y',	NULL),
(2,	5,	'1166655444557',	NULL),
(3,	1,	'5',	NULL),
(3,	2,	'4',	NULL),
(3,	3,	'1',	NULL),
(3,	4,	'1',	NULL),
(3,	5,	'9',	NULL),
(5,	1,	'1451779200',	NULL),
(5,	2,	'1580601600',	NULL),
(5,	3,	'1569888000',	NULL),
(5,	4,	'1571443200',	NULL),
(5,	5,	'1552003200',	NULL),
(6,	1,	'no',	NULL),
(6,	2,	'yes',	NULL),
(6,	3,	'yes',	NULL),
(6,	4,	'no',	NULL),
(6,	5,	'yes',	NULL),
(7,	1,	'12311',	NULL),
(7,	2,	'123',	NULL),
(7,	3,	'1234-1252',	NULL),
(7,	4,	'12522',	NULL),
(7,	5,	'111-555-887',	NULL),
(8,	1,	'no',	NULL),
(8,	2,	'no',	NULL),
(8,	3,	'no',	NULL),
(8,	4,	'no',	NULL),
(8,	5,	'no',	NULL),
(9,	1,	'no',	NULL),
(9,	2,	'no',	NULL),
(9,	3,	'no',	NULL),
(9,	4,	'no',	NULL),
(9,	5,	'no',	NULL),
(10,	1,	'Folder Level',	NULL),
(10,	2,	'Folder Level',	NULL),
(10,	3,	'Folder Level',	NULL),
(10,	4,	'Folder Level',	NULL),
(10,	5,	'Folder Level',	NULL);

DROP TABLE IF EXISTS `mantis_custom_field_table`;
CREATE TABLE `mantis_custom_field_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `possible_values` text,
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `access_level_r` smallint(6) NOT NULL DEFAULT '0',
  `access_level_rw` smallint(6) NOT NULL DEFAULT '0',
  `length_min` int(11) NOT NULL DEFAULT '0',
  `length_max` int(11) NOT NULL DEFAULT '0',
  `require_report` tinyint(4) NOT NULL DEFAULT '0',
  `require_update` tinyint(4) NOT NULL DEFAULT '0',
  `display_report` tinyint(4) NOT NULL DEFAULT '0',
  `display_update` tinyint(4) NOT NULL DEFAULT '1',
  `require_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_closed` tinyint(4) NOT NULL DEFAULT '0',
  `require_closed` tinyint(4) NOT NULL DEFAULT '0',
  `filter_by` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_custom_field_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_custom_field_table` (`id`, `name`, `type`, `possible_values`, `default_value`, `valid_regexp`, `access_level_r`, `access_level_rw`, `length_min`, `length_max`, `require_report`, `require_update`, `display_report`, `display_update`, `require_resolved`, `display_resolved`, `display_closed`, `require_closed`, `filter_by`) VALUES
(1,	'PII',	9,	'yes|no',	'',	'',	10,	10,	0,	0,	0,	0,	1,	1,	0,	1,	1,	0,	1),
(2,	'Shipping Tracking Number',	0,	'',	'',	'',	10,	10,	0,	0,	0,	0,	1,	1,	0,	1,	1,	0,	1),
(3,	'Number of Boxes',	1,	'',	'',	'',	10,	10,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1),
(5,	'Date',	8,	'',	'',	'',	10,	10,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1),
(6,	'Sensitivity',	9,	'yes|no',	'',	'',	10,	10,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1),
(7,	'Accession Number',	0,	'',	'',	'',	10,	10,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1),
(8,	'PHI',	9,	'yes|no',	'',	'',	10,	10,	0,	0,	0,	0,	1,	1,	0,	1,	1,	0,	1),
(9,	'CUI',	9,	'yes|no',	'',	'',	10,	10,	0,	0,	0,	0,	1,	1,	0,	1,	1,	0,	1),
(10,	'Index Level',	6,	'Box Level|Folder Level',	'Folder Level',	'',	10,	10,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1);

DROP TABLE IF EXISTS `mantis_email_table`;
CREATE TABLE `mantis_email_table` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `metadata` longtext NOT NULL,
  `body` longtext NOT NULL,
  `submitted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_email_table` (`email_id`, `email`, `subject`, `metadata`, `body`, `submitted`) VALUES
(1,	'kieslich.jolleen@epa.gov',	'[Digitization Request] Account registration',	'a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'Thank you for registering. You have an account with username \"jkieslic\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttps://mantisbt.app.cloud.gov/app/web/verify.php?id=2&confirm_hash=624ZazJp88FAh-M1BUY1M1A_vyLCQ8pz58y2RIvK8c3t1pd1GyeppRUDjO1s_nVuTixv9As90ydnI25x3RWS\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',	1569512023),
(2,	'root@localhost',	'[Digitization Request] Account registration',	'a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'The following account has been created:\n\nUsername: jkieslic\nE-mail: kieslich.jolleen@epa.gov\nRemote IP address: 127.0.0.1\nhttps://mantisbt.app.cloud.gov/app/web/\n\nDo not reply to this message',	1569512023),
(3,	'kieslich.jolleen@epa.gov',	'[Digitization Request] Account updated',	'a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttps://mantisbt.app.cloud.gov/app/web/account_page.php\n\nAccess Level reporter => updater',	1569850880),
(4,	'kieslich.jolleen@epa.gov',	'[Digitization Request] Account updated',	'a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttps://mantisbt.app.cloud.gov/app/web/account_page.php\n\nAccess Level updater => manager',	1569850905),
(5,	'kieslich.jolleen@epa.gov',	'[digitization east 0000001]: Documents to be digitized',	'a:3:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:37:\"[digitization east] Non-Site Specific\";s:11:\"In-Reply-To\";s:32:\"386ede16d6170b65d2b78a5d7702840c\";}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'The following request has been ASSIGNED. \n====================================================================== \nhttps://mantisbt.app.cloud.gov/app/web/view.php?id=1 \n====================================================================== \nReported By:                administrator\nAssigned To:                jkieslic\n====================================================================== \nSite:                       digitization east\nRequest ID:                 1\nCategory:                   Non-Site Specific\nPriority:                   normal\nStatus:                     new\nIndex Level:                Folder Level \nShipping Tracking Number:    \nNumber of Boxes:            5 \nDate:                       2016-01-03 \nSensitivity:                no \nAccession Number:           12311 \nPII:                        no \nPHI:                        no \nCUI:                        no \n====================================================================== \nDate Submitted:             2019-09-25 19:52 UTC\nLast Modified:              2019-09-30 13:42 UTC\n====================================================================== \nCustomer Goal/Objective for Scanning Project: Documents to be digitized\nDescription: \nDigitize test documents\n====================================================================== \n\n---------------------------------------------------------------------- \n (0000001) administrator (administrator) - 2019-09-30 08:46\n https://mantisbt.app.cloud.gov/app/web/view.php?id=1#c1 \n---------------------------------------------------------------------- \nHow will the types of scanning be determined, i.e. DPI, double-sided, size, etc.? \n\nRequest History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2019-09-25 19:52 administrator  New Request                                  \n2019-09-25 19:52 administrator  Status                   new => assigned     \n2019-09-25 19:52 administrator  Assigned To               => administrator   \n2019-09-27 15:31 administrator  Category                 General => Folder Level\n2019-09-27 15:36 administrator  Category                 Folder Level => Non-Site Specific\n2019-09-27 16:23 administrator  Status                   assigned => closed  \n2019-09-27 16:23 administrator  Index Level               => Folder Level    \n2019-09-27 16:23 administrator  Number of Boxes           => 5               \n2019-09-27 16:23 administrator  Date                      => 2016-01-03      \n2019-09-27 16:23 administrator  Sensitivity               => no              \n2019-09-27 16:23 administrator  Accession Number          => 12311           \n2019-09-27 16:23 administrator  PII                       => no              \n2019-09-27 16:23 administrator  PHI                       => no              \n2019-09-27 16:23 administrator  CUI                       => no              \n2019-09-27 17:56 administrator  Status                   closed => @60@      \n2019-09-27 18:09 administrator  Status                   @60@ => new         \n2019-09-30 08:46 administrator  Note Added: 0000001                          \n2019-09-30 13:42 administrator  Assigned To              administrator => jkieslic\n======================================================================',	1569850929),
(6,	'kieslich.jolleen@epa.gov',	'[digitization east 0000001]: Documents to be digitized',	'a:3:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:37:\"[digitization east] Non-Site Specific\";s:11:\"In-Reply-To\";s:32:\"386ede16d6170b65d2b78a5d7702840c\";}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'The following request has been CLOSED \n====================================================================== \nhttps://mantisbt.app.cloud.gov/app/web/view.php?id=1 \n====================================================================== \nReported By:                administrator\nAssigned To:                jkieslic\n====================================================================== \nSite:                       digitization east\nRequest ID:                 1\nCategory:                   Non-Site Specific\nPriority:                   normal\nStatus:                     closed\nIndex Level:                Folder Level \nShipping Tracking Number:    \nNumber of Boxes:            5 \nDate:                       2016-01-03 \nSensitivity:                no \nAccession Number:           12311 \nPII:                        no \nPHI:                        no \nCUI:                        no \nFixed in Version:           \n====================================================================== \nDate Submitted:             2019-09-25 19:52 UTC\nLast Modified:              2019-09-30 18:25 UTC\n====================================================================== \nCustomer Goal/Objective for Scanning Project: Documents to be digitized\nDescription: \nDigitize test documents\n====================================================================== \n\n---------------------------------------------------------------------- \n (0000001) administrator (administrator) - 2019-09-30 08:46\n https://mantisbt.app.cloud.gov/app/web/view.php?id=1#c1 \n---------------------------------------------------------------------- \nHow will the types of scanning be determined, i.e. DPI, double-sided, size, etc.? \n\nRequest History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2019-09-25 19:52 administrator  New Request                                  \n2019-09-25 19:52 administrator  Status                   new => assigned     \n2019-09-25 19:52 administrator  Assigned To               => administrator   \n2019-09-27 15:31 administrator  Category                 General => Folder Level\n2019-09-27 15:36 administrator  Category                 Folder Level => Non-Site Specific\n2019-09-27 16:23 administrator  Status                   assigned => closed  \n2019-09-27 16:23 administrator  Index Level               => Folder Level    \n2019-09-27 16:23 administrator  Number of Boxes           => 5               \n2019-09-27 16:23 administrator  Date                      => 2016-01-03      \n2019-09-27 16:23 administrator  Sensitivity               => no              \n2019-09-27 16:23 administrator  Accession Number          => 12311           \n2019-09-27 16:23 administrator  PII                       => no              \n2019-09-27 16:23 administrator  PHI                       => no              \n2019-09-27 16:23 administrator  CUI                       => no              \n2019-09-27 17:56 administrator  Status                   closed => @60@      \n2019-09-27 18:09 administrator  Status                   @60@ => new         \n2019-09-30 08:46 administrator  Note Added: 0000001                          \n2019-09-30 13:42 administrator  Assigned To              administrator => jkieslic\n2019-09-30 18:21 administrator  Site                     digitization east => digitization west\n2019-09-30 18:22 administrator  Site                     digitization west => digitization east\n2019-09-30 18:25 administrator  Status                   new => closed       \n2019-09-30 18:25 administrator  Resolution               open => fixed       \n======================================================================',	1569867926),
(7,	'kieslich.jolleen@epa.gov',	'[digitization east 0000001]: Documents to be digitized',	'a:3:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:37:\"[digitization east] Non-Site Specific\";s:11:\"In-Reply-To\";s:32:\"386ede16d6170b65d2b78a5d7702840c\";}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'The following request has been REOPENED. \n====================================================================== \nhttps://mantisbt.app.cloud.gov/app/web/view.php?id=1 \n====================================================================== \nReported By:                administrator\nAssigned To:                jkieslic\n====================================================================== \nSite:                       digitization east\nRequest ID:                 1\nCategory:                   Non-Site Specific\nPriority:                   normal\nStatus:                     feedback\nIndex Level:                Folder Level \nShipping Tracking Number:    \nNumber of Boxes:            5 \nDate:                       2016-01-03 \nSensitivity:                no \nAccession Number:           12311 \nPII:                        no \nPHI:                        no \nCUI:                        no \n====================================================================== \nDate Submitted:             2019-09-25 19:52 UTC\nLast Modified:              2019-09-30 18:25 UTC\n====================================================================== \nCustomer Goal/Objective for Scanning Project: Documents to be digitized\nDescription: \nDigitize test documents\n====================================================================== \n\n---------------------------------------------------------------------- \n (0000001) administrator (administrator) - 2019-09-30 08:46\n https://mantisbt.app.cloud.gov/app/web/view.php?id=1#c1 \n---------------------------------------------------------------------- \nHow will the types of scanning be determined, i.e. DPI, double-sided, size, etc.? \n\nRequest History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2019-09-25 19:52 administrator  New Request                                  \n2019-09-25 19:52 administrator  Status                   new => assigned     \n2019-09-25 19:52 administrator  Assigned To               => administrator   \n2019-09-27 15:31 administrator  Category                 General => Folder Level\n2019-09-27 15:36 administrator  Category                 Folder Level => Non-Site Specific\n2019-09-27 16:23 administrator  Status                   assigned => closed  \n2019-09-27 16:23 administrator  Index Level               => Folder Level    \n2019-09-27 16:23 administrator  Number of Boxes           => 5               \n2019-09-27 16:23 administrator  Date                      => 2016-01-03      \n2019-09-27 16:23 administrator  Sensitivity               => no              \n2019-09-27 16:23 administrator  Accession Number          => 12311           \n2019-09-27 16:23 administrator  PII                       => no              \n2019-09-27 16:23 administrator  PHI                       => no              \n2019-09-27 16:23 administrator  CUI                       => no              \n2019-09-27 17:56 administrator  Status                   closed => @60@      \n2019-09-27 18:09 administrator  Status                   @60@ => new         \n2019-09-30 08:46 administrator  Note Added: 0000001                          \n2019-09-30 13:42 administrator  Assigned To              administrator => jkieslic\n2019-09-30 18:21 administrator  Site                     digitization east => digitization west\n2019-09-30 18:22 administrator  Site                     digitization west => digitization east\n2019-09-30 18:25 administrator  Status                   new => closed       \n2019-09-30 18:25 administrator  Resolution               open => fixed       \n2019-09-30 18:25 administrator  Status                   closed => feedback  \n2019-09-30 18:25 administrator  Resolution               fixed => reopened   \n======================================================================',	1569867954),
(8,	'kieslich.jolleen@epa.gov',	'[digitization east 0000004]: Scanning',	'a:3:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:37:\"[digitization east] Non-Site Specific\";s:11:\"In-Reply-To\";s:32:\"0fd7cdb738a6bd769f0cc8d349517cac\";}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'The following request has been ASSIGNED. \n====================================================================== \nhttps://mantisbt.app.cloud.gov/app/web/view.php?id=4 \n====================================================================== \nReported By:                administrator\nAssigned To:                jkieslic\n====================================================================== \nSite:                       digitization east\nRequest ID:                 4\nCategory:                   Non-Site Specific\nPriority:                   normal\nStatus:                     assigned\nIndex Level:                Folder Level \nShipping Tracking Number:   1Z8383Y \nNumber of Boxes:            1 \nDate:                       2019-10-19 \nSensitivity:                no \nAccession Number:           12522 \nPII:                        no \nPHI:                        no \nCUI:                        no \n====================================================================== \nDate Submitted:             2019-10-01 13:45 UTC\nLast Modified:              2019-10-01 14:02 UTC\n====================================================================== \nCustomer Goal/Objective for Scanning Project: Scanning\nDescription: \nnone\n\nAdditional Information: \nnone\n====================================================================== \n\nRequest History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2019-10-01 13:45 administrator  New Request                                  \n2019-10-01 13:47 administrator  Status                   new => confirmed    \n2019-10-01 14:02 administrator  Assigned To               => jkieslic        \n2019-10-01 14:02 administrator  Status                   confirmed => assigned\n======================================================================',	1569938538),
(9,	'kieslich.jolleen@epa.gov',	'[digitization east 0000004]: Scanning',	'a:3:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:37:\"[digitization east] Non-Site Specific\";s:11:\"In-Reply-To\";s:32:\"0fd7cdb738a6bd769f0cc8d349517cac\";}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'The following request has been ASSIGNED. \n====================================================================== \nhttps://mantisbt.app.cloud.gov/app/web/view.php?id=4 \n====================================================================== \nReported By:                administrator\nAssigned To:                administrator\n====================================================================== \nSite:                       digitization east\nRequest ID:                 4\nCategory:                   Non-Site Specific\nPriority:                   normal\nStatus:                     assigned\nIndex Level:                Folder Level \nShipping Tracking Number:   1Z8383Y \nNumber of Boxes:            1 \nDate:                       2019-10-19 \nSensitivity:                no \nAccession Number:           12522 \nPII:                        no \nPHI:                        no \nCUI:                        no \n====================================================================== \nDate Submitted:             2019-10-01 13:45 UTC\nLast Modified:              2019-10-01 14:03 UTC\n====================================================================== \nCustomer Goal/Objective for Scanning Project: Scanning\nDescription: \nnone\n\nAdditional Information: \nnone\n====================================================================== \n\nRequest History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2019-10-01 13:45 administrator  New Request                                  \n2019-10-01 13:47 administrator  Status                   new => confirmed    \n2019-10-01 14:02 administrator  Assigned To               => jkieslic        \n2019-10-01 14:02 administrator  Status                   confirmed => assigned\n2019-10-01 14:03 administrator  Assigned To              jkieslic => administrator\n======================================================================',	1569938593),
(10,	'kieslich.jolleen@epa.gov',	'[digitization east 0000005]: Scan all documents',	'a:3:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:33:\"[digitization east] Site Specific\";s:11:\"In-Reply-To\";s:32:\"134032a3569eba00aeaa97ea64e7cc22\";}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'The following request has been ASSIGNED. \n====================================================================== \nhttps://mantisbt.app.cloud.gov/app/web/view.php?id=5 \n====================================================================== \nReported By:                administrator\nAssigned To:                jkieslic\n====================================================================== \nSite:                       digitization east\nRequest ID:                 5\nCategory:                   Site Specific\nPriority:                   normal\nStatus:                     assigned\nIndex Level:                Folder Level \nShipping Tracking Number:   1166655444557 \nNumber of Boxes:            9 \nDate:                       2019-03-08 \nSensitivity:                yes \nAccession Number:           111-555-887 \nPII:                        no \nPHI:                        no \nCUI:                        no \n====================================================================== \nDate Submitted:             2019-10-01 14:06 UTC\nLast Modified:              2019-10-01 14:08 UTC\n====================================================================== \nCustomer Goal/Objective for Scanning Project: Scan all documents\nDescription: \nBox of contracts for digitization\n\nAdditional Information: \nsome information goes here\n====================================================================== \n\nRequest History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2019-10-01 14:06 administrator  New Request                                  \n2019-10-01 14:08 administrator  Status                   new => assigned     \n2019-10-01 14:08 administrator  Assigned To               => jkieslic        \n======================================================================',	1569938888),
(11,	'kieslich.jolleen@epa.gov',	'[digitization east 0000004]: Scanning',	'a:3:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:37:\"[digitization east] Non-Site Specific\";s:11:\"In-Reply-To\";s:32:\"0fd7cdb738a6bd769f0cc8d349517cac\";}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'The following request has been ASSIGNED. \n====================================================================== \nhttps://mantisbt.app.cloud.gov/app/web/view.php?id=4 \n====================================================================== \nReported By:                administrator\nAssigned To:                jkieslic\n====================================================================== \nSite:                       digitization east\nRequest ID:                 4\nCategory:                   Non-Site Specific\nPriority:                   normal\nStatus:                     assigned\nIndex Level:                Folder Level \nShipping Tracking Number:   1Z8383Y \nNumber of Boxes:            1 \nDate:                       2019-10-19 \nSensitivity:                no \nAccession Number:           12522 \nPII:                        no \nPHI:                        no \nCUI:                        no \n====================================================================== \nDate Submitted:             2019-10-01 13:45 UTC\nLast Modified:              2019-10-01 14:08 UTC\n====================================================================== \nCustomer Goal/Objective for Scanning Project: Scanning\nDescription: \nnone\n\nAdditional Information: \nnone\n====================================================================== \n\nRequest History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2019-10-01 13:45 administrator  New Request                                  \n2019-10-01 13:47 administrator  Status                   new => confirmed    \n2019-10-01 14:02 administrator  Assigned To               => jkieslic        \n2019-10-01 14:02 administrator  Status                   confirmed => assigned\n2019-10-01 14:03 administrator  Assigned To              jkieslic => administrator\n2019-10-01 14:08 administrator  Assigned To              administrator => jkieslic\n======================================================================',	1569938888),
(12,	'kieslich.jolleen@epa.gov',	'[digitization west 0000003]: Include ECMS',	'a:3:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:33:\"[digitization west] Site Specific\";s:11:\"In-Reply-To\";s:32:\"5f853344948379115ac659d46135a044\";}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'The following request has been ASSIGNED. \n====================================================================== \nhttps://mantisbt.app.cloud.gov/app/web/view.php?id=3 \n====================================================================== \nReported By:                administrator\nAssigned To:                jkieslic\n====================================================================== \nSite:                       digitization west\nRequest ID:                 3\nCategory:                   Site Specific\nPriority:                   normal\nStatus:                     assigned\n====================================================================== \nDate Submitted:             2019-10-01 13:44 UTC\nLast Modified:              2019-10-01 14:08 UTC\n====================================================================== \nCustomer Goal/Objective for Scanning Project: Include ECMS\nDescription: \nAssessment Record for OU27 of the Fort Meade, MD. site.\n\nAdditional Information: \nIndex:  Site Name, Author, Doc-date, OU, Project Phase, \n====================================================================== \n\nRequest History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2019-10-01 13:44 administrator  New Request                                  \n2019-10-01 13:48 administrator  Site                     digitization east => digitization west\n2019-10-01 14:08 administrator  Status                   new => assigned     \n2019-10-01 14:08 administrator  Assigned To               => jkieslic        \n======================================================================',	1569938888),
(13,	'kieslich.jolleen@epa.gov',	'[digitization west 0000002]: Test 2',	'a:3:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:33:\"[digitization west] Site Specific\";s:11:\"In-Reply-To\";s:32:\"69c9e11762675818bf43be4c6a16bf48\";}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:22:\"mantisbt.app.cloud.gov\";}',	'The following request has been ASSIGNED. \n====================================================================== \nhttps://mantisbt.app.cloud.gov/app/web/view.php?id=2 \n====================================================================== \nReported By:                administrator\nAssigned To:                jkieslic\n====================================================================== \nSite:                       digitization west\nRequest ID:                 2\nCategory:                   Site Specific\nPriority:                   normal\nStatus:                     assigned\n====================================================================== \nDate Submitted:             2019-10-01 12:19 UTC\nLast Modified:              2019-10-01 14:08 UTC\n====================================================================== \nCustomer Goal/Objective for Scanning Project: Test 2\nDescription: \nSecond Test\n====================================================================== \n\nRequest History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2019-10-01 12:19 administrator  New Request                                  \n2019-10-01 12:28 administrator  Status                   new => acknowledged \n2019-10-01 12:42 administrator  Site                     digitization east => digitization west\n2019-10-01 14:08 administrator  Status                   acknowledged => assigned\n2019-10-01 14:08 administrator  Assigned To               => jkieslic        \n======================================================================',	1569938888);

DROP TABLE IF EXISTS `mantis_filters_table`;
CREATE TABLE `mantis_filters_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(4) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `filter_string` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_filters_table` (`id`, `user_id`, `project_id`, `is_public`, `name`, `filter_string`) VALUES
(1,	1,	0,	0,	'',	'v9#{\"_version\":\"v9\",\"_view_type\":\"simple\",\"category_id\":[\"0\"],\"severity\":[0],\"status\":[0],\"highlight_changed\":6,\"reporter_id\":[0],\"handler_id\":[0],\"project_id\":[-3],\"resolution\":[0],\"build\":[\"0\"],\"version\":[\"0\"],\"hide_status\":[90],\"monitor_user_id\":[0],\"sort\":\"last_updated\",\"dir\":\"DESC\",\"per_page\":50,\"match_type\":0,\"platform\":[\"0\"],\"os\":[\"0\"],\"os_build\":[\"0\"],\"fixed_in_version\":[\"0\"],\"target_version\":[\"0\"],\"profile_id\":[0],\"priority\":[0],\"note_user_id\":[0],\"sticky\":true,\"filter_by_date\":false,\"start_month\":\"10\",\"end_month\":\"10\",\"start_day\":1,\"end_day\":\"10\",\"start_year\":\"2019\",\"end_year\":\"2019\",\"filter_by_last_updated_date\":false,\"last_updated_start_month\":\"10\",\"last_updated_end_month\":\"10\",\"last_updated_start_day\":1,\"last_updated_end_day\":\"10\",\"last_updated_start_year\":\"2019\",\"last_updated_end_year\":\"2019\",\"search\":\"\",\"view_state\":0,\"tag_string\":\"\",\"tag_select\":0,\"relationship_type\":-1,\"relationship_bug\":0,\"filterbuglist_list\":null,\"custom_fields\":{\"1\":[\"0\"],\"2\":[\"0\"],\"3\":[\"0\"],\"5\":[\"0\"],\"6\":[\"0\"],\"7\":[\"0\"],\"8\":[\"0\"],\"9\":[\"0\"],\"10\":[\"0\"]},\"_source_query_id\":1}'),
(2,	1,	-1,	0,	'',	'v9#{\"_version\":\"v9\",\"_view_type\":\"simple\",\"category_id\":[\"0\"],\"severity\":[0],\"status\":[0],\"highlight_changed\":6,\"reporter_id\":[0],\"handler_id\":[0],\"project_id\":[-3],\"resolution\":[0],\"build\":[\"0\"],\"version\":[\"0\"],\"hide_status\":[90],\"monitor_user_id\":[0],\"sort\":\"last_updated\",\"dir\":\"DESC\",\"per_page\":50,\"match_type\":0,\"platform\":[\"0\"],\"os\":[\"0\"],\"os_build\":[\"0\"],\"fixed_in_version\":[\"0\"],\"target_version\":[\"0\"],\"profile_id\":[0],\"priority\":[0],\"note_user_id\":[0],\"sticky\":true,\"filter_by_date\":false,\"start_month\":\"10\",\"end_month\":\"10\",\"start_day\":1,\"end_day\":\"07\",\"start_year\":\"2019\",\"end_year\":\"2019\",\"filter_by_last_updated_date\":false,\"last_updated_start_month\":\"10\",\"last_updated_end_month\":\"10\",\"last_updated_start_day\":1,\"last_updated_end_day\":\"07\",\"last_updated_start_year\":\"2019\",\"last_updated_end_year\":\"2019\",\"search\":\"\",\"view_state\":0,\"tag_string\":\"\",\"tag_select\":0,\"relationship_type\":-1,\"relationship_bug\":0,\"filterbuglist_list\":null,\"custom_fields\":{\"1\":[\"0\"],\"2\":[\"0\"],\"3\":[\"0\"],\"5\":[\"0\"],\"6\":[\"0\"],\"7\":[\"0\"],\"8\":[\"0\"],\"9\":[\"0\"],\"10\":[\"0\"]}}'),
(3,	1,	-2,	0,	'',	'v9#{\"filterbuglist_list\":null,\"_version\":\"v9\",\"_view_type\":\"simple\",\"category_id\":[\"Non-Site Specific\"],\"severity\":[0],\"status\":[0],\"per_page\":50,\"highlight_changed\":6,\"reporter_id\":[0],\"handler_id\":[0],\"project_id\":[-3],\"sort\":\"last_updated\",\"dir\":\"DESC\",\"filter_by_date\":false,\"start_month\":10,\"start_day\":1,\"start_year\":2019,\"end_month\":10,\"end_day\":9,\"end_year\":2019,\"filter_by_last_updated_date\":false,\"last_updated_start_month\":10,\"last_updated_start_day\":1,\"last_updated_start_year\":2019,\"last_updated_end_month\":10,\"last_updated_end_day\":9,\"last_updated_end_year\":2019,\"search\":\"\",\"hide_status\":[90],\"resolution\":[0],\"build\":[\"0\"],\"version\":[\"0\"],\"fixed_in_version\":[\"0\"],\"target_version\":[\"0\"],\"priority\":[0],\"monitor_user_id\":[0],\"view_state\":0,\"custom_fields\":{\"1\":[\"0\"],\"2\":[\"0\"],\"3\":[\"0\"],\"5\":[\"0\"],\"6\":[\"0\"],\"7\":[\"0\"],\"8\":[\"0\"],\"9\":[\"0\"],\"10\":[\"0\"]},\"sticky\":true,\"relationship_type\":-1,\"relationship_bug\":0,\"profile_id\":[0],\"platform\":[\"0\"],\"os\":[\"0\"],\"os_build\":[\"0\"],\"tag_string\":\"\",\"tag_select\":0,\"note_user_id\":[0],\"match_type\":0,\"_source_query_id\":3}'),
(4,	1,	0,	1,	'Default',	'v9#{\"filterbuglist_list\":null,\"_version\":\"v9\",\"_view_type\":\"simple\",\"category_id\":[\"0\"],\"severity\":[0],\"status\":[0],\"per_page\":50,\"highlight_changed\":6,\"reporter_id\":[0],\"handler_id\":[0],\"project_id\":[-3],\"sort\":\"priority\",\"dir\":\"DESC\",\"filter_by_date\":false,\"start_month\":10,\"start_day\":1,\"start_year\":2019,\"end_month\":10,\"end_day\":1,\"end_year\":2019,\"filter_by_last_updated_date\":false,\"last_updated_start_month\":10,\"last_updated_start_day\":1,\"last_updated_start_year\":2019,\"last_updated_end_month\":10,\"last_updated_end_day\":1,\"last_updated_end_year\":2019,\"search\":\"\",\"hide_status\":[90],\"resolution\":[0],\"build\":[\"0\"],\"version\":[\"0\"],\"fixed_in_version\":[\"0\"],\"target_version\":[\"0\"],\"priority\":[0],\"monitor_user_id\":[0],\"view_state\":0,\"custom_fields\":{\"1\":[\"0\"],\"2\":[\"0\"],\"3\":[\"0\"],\"5\":[\"0\",\"0\",\"0\"],\"6\":[\"0\"],\"7\":[\"0\"],\"8\":[\"0\"],\"9\":[\"0\"],\"10\":[\"0\"]},\"sticky\":true,\"relationship_type\":-1,\"relationship_bug\":0,\"profile_id\":[0],\"platform\":[\"0\"],\"os\":[\"0\"],\"os_build\":[\"0\"],\"tag_string\":\"\",\"tag_select\":0,\"note_user_id\":[0],\"match_type\":0}');

DROP TABLE IF EXISTS `mantis_news_table`;
CREATE TABLE `mantis_news_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `announcement` tinyint(4) NOT NULL DEFAULT '0',
  `headline` varchar(64) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `last_modified` int(10) unsigned NOT NULL DEFAULT '1',
  `date_posted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_plugin_Announce_context_table`;
CREATE TABLE `mantis_plugin_Announce_context_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `location` varchar(20) NOT NULL,
  `access` int(10) unsigned NOT NULL,
  `ttl` int(10) unsigned NOT NULL DEFAULT '0',
  `dismissable` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_plugin_announce_context` (`message_id`,`project_id`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_plugin_Announce_context_table` (`id`, `message_id`, `project_id`, `location`, `access`, `ttl`, `dismissable`) VALUES
(1,	1,	0,	'header',	10,	0,	0);

DROP TABLE IF EXISTS `mantis_plugin_Announce_dismissed_table`;
CREATE TABLE `mantis_plugin_Announce_dismissed_table` (
  `context_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`context_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_plugin_Announce_dismissed_table` (`context_id`, `user_id`, `timestamp`) VALUES
(1,	1,	1569959677);

DROP TABLE IF EXISTS `mantis_plugin_Announce_message_table`;
CREATE TABLE `mantis_plugin_Announce_message_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_plugin_Announce_message_table` (`id`, `timestamp`, `title`, `message`) VALUES
(1,	1570739131,	'Site is in Beta Version',	'The site is in Beta Version');

DROP TABLE IF EXISTS `mantis_plugin_table`;
CREATE TABLE `mantis_plugin_table` (
  `basename` varchar(40) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `priority` int(10) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`basename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_plugin_table` (`basename`, `enabled`, `protected`, `priority`) VALUES
('Announce',	1,	0,	3),
('FilterBugList',	1,	0,	3),
('MantisCoreFormatting',	1,	0,	3),
('MantisGraph',	1,	0,	3),
('SimpleSAMLphpAuth',	1,	0,	3);

DROP TABLE IF EXISTS `mantis_project_file_table`;
CREATE TABLE `mantis_project_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob,
  `date_added` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_project_hierarchy_table`;
CREATE TABLE `mantis_project_hierarchy_table` (
  `child_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `inherit_parent` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_project_hierarchy` (`child_id`,`parent_id`),
  KEY `idx_project_hierarchy_child_id` (`child_id`),
  KEY `idx_project_hierarchy_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_project_table`;
CREATE TABLE `mantis_project_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `access_min` smallint(6) NOT NULL DEFAULT '10',
  `file_path` varchar(250) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `inherit_global` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_name` (`name`),
  KEY `idx_project_view` (`view_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_project_table` (`id`, `name`, `status`, `enabled`, `view_state`, `access_min`, `file_path`, `description`, `category_id`, `inherit_global`) VALUES
(1,	'digitization east',	10,	1,	10,	10,	'',	'',	1,	1),
(2,	'digitization west',	10,	1,	10,	10,	'',	'',	1,	1);

DROP TABLE IF EXISTS `mantis_project_user_list_table`;
CREATE TABLE `mantis_project_user_list_table` (
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `idx_project_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_project_version_table`;
CREATE TABLE `mantis_project_version_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `version` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `released` tinyint(4) NOT NULL DEFAULT '1',
  `obsolete` tinyint(4) NOT NULL DEFAULT '0',
  `date_order` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_version` (`project_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_sponsorship_table`;
CREATE TABLE `mantis_sponsorship_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(128) NOT NULL DEFAULT '',
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_sponsorship_bug_id` (`bug_id`),
  KEY `idx_sponsorship_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_tag_table`;
CREATE TABLE `mantis_tag_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  `date_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`name`),
  KEY `idx_tag_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_tokens_table`;
CREATE TABLE `mantis_tokens_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '1',
  `expiry` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_typeowner` (`type`,`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_tokens_table` (`id`, `owner`, `type`, `value`, `timestamp`, `expiry`) VALUES
(11,	1,	5,	'{\"filter\":false,\"sidebar\":false,\"profile\":false,\"assigned\":false}',	1569517841,	1602275133),
(61,	1,	3,	'1,4,5',	1570648061,	1570814387),
(64,	1,	4,	'1',	1570739109,	1570739417);

DROP TABLE IF EXISTS `mantis_user_pref_table`;
CREATE TABLE `mantis_user_pref_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_profile` int(10) unsigned NOT NULL DEFAULT '0',
  `default_project` int(10) unsigned NOT NULL DEFAULT '0',
  `refresh_delay` int(11) NOT NULL DEFAULT '0',
  `redirect_delay` int(11) NOT NULL DEFAULT '0',
  `bugnote_order` varchar(4) NOT NULL DEFAULT 'ASC',
  `email_on_new` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_assigned` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_feedback` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_closed` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_reopened` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_bugnote` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_status` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_status_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_bugnote_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_reopened_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_closed_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_resolved_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_feedback_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_assigned_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_new_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_bugnote_limit` smallint(6) NOT NULL DEFAULT '0',
  `language` varchar(32) NOT NULL DEFAULT 'english',
  `timezone` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_user_pref_table` (`id`, `user_id`, `project_id`, `default_profile`, `default_project`, `refresh_delay`, `redirect_delay`, `bugnote_order`, `email_on_new`, `email_on_assigned`, `email_on_feedback`, `email_on_resolved`, `email_on_closed`, `email_on_reopened`, `email_on_bugnote`, `email_on_status`, `email_on_priority`, `email_on_priority_min_severity`, `email_on_status_min_severity`, `email_on_bugnote_min_severity`, `email_on_reopened_min_severity`, `email_on_closed_min_severity`, `email_on_resolved_min_severity`, `email_on_feedback_min_severity`, `email_on_assigned_min_severity`, `email_on_new_min_severity`, `email_bugnote_limit`, `language`, `timezone`) VALUES
(1,	1,	0,	0,	1,	30,	2,	'ASC',	1,	1,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'auto',	'UTC');

DROP TABLE IF EXISTS `mantis_user_print_pref_table`;
CREATE TABLE `mantis_user_print_pref_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `print_pref` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_user_profile_table`;
CREATE TABLE `mantis_user_profile_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_user_table`;
CREATE TABLE `mantis_user_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) NOT NULL DEFAULT '',
  `realname` varchar(191) NOT NULL DEFAULT '',
  `email` varchar(191) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `lost_password_request_count` smallint(6) NOT NULL DEFAULT '0',
  `failed_login_count` smallint(6) NOT NULL DEFAULT '0',
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '1',
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_cookie_string` (`cookie_string`),
  UNIQUE KEY `idx_user_username` (`username`),
  KEY `idx_enable` (`enabled`),
  KEY `idx_access` (`access_level`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantis_user_table` (`id`, `username`, `realname`, `email`, `password`, `enabled`, `protected`, `access_level`, `login_count`, `lost_password_request_count`, `failed_login_count`, `cookie_string`, `last_visit`, `date_created`) VALUES
(1,	'administrator',	'',	'root@localhost',	'b120e5d603a9afcba83814a2a746e4a6',	1,	0,	90,	77,	0,	0,	'Zb0hlPYOwnCjzUkRFlMJq2Nilfhjm2zMNk16BZf48pcndiN-D0VberHwH7rSoPvJ',	1570739133,	1569440491),
(2,	'jkieslic',	'',	'kieslich.jolleen@epa.gov',	'd527a5ba71c96738ec1122c3681fe7fa',	1,	0,	70,	0,	0,	0,	'xbqrYpVYcuUPDfM2hZihGBDJq6wzqDEo9D8HdFAc5fhWZRKZOTpjpBlzegE4kug8',	1569512023,	1569512023);

-- 2019-10-10 21:30:40
