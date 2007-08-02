CREATE TABLE `courses` (
  `id` int(11) NOT NULL auto_increment,
  `full_name` varchar(100) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  `description` text,
  `started_at` datetime default NULL,
  `finished_at` datetime default NULL,
  `max_students` int(11) default NULL,
  `visible` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(40) NOT NULL,
  `crypted_password` varchar(40) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO schema_info (version) VALUES (2)