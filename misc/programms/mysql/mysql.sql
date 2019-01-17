GRANT ALL ON discount_catalog.* TO `dc`@'%' IDENTIFIED BY "dc";
CREATE DATABASE discount_catalog;
flush privileges;

use discount_catalog;

CREATE TABLE IF NOT EXISTS test (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` text,
  `DESCRIPTION` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;