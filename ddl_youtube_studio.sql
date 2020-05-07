drop table if exists studio1;
drop table if exists studio2;



-- -----------------------------------------------------
-- Table studio1, 2
-- -----------------------------------------------------
CREATE TABLE `studio1` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hour` VARCHAR(2) NOT NULL COMMENT 'hour',
  `minute` VARCHAR(2) NOT NULL COMMENT 'minute',
  `day` VARCHAR(30) NOT NULL COMMENT 'secondday etc',
  `user_id` VARCHAR(30) NULL DEFAULT NULL COMMENT 'user id',
  `user_pw` VARCHAR(256) NULL DEFAULT NULL COMMENT 'user pw',
  `enroll_date` DATETIME NULL DEFAULT NULL COMMENT 'date user enrolled',
  PRIMARY KEY (`id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `studio2` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hour` VARCHAR(2) NOT NULL COMMENT 'hour',
  `minute` VARCHAR(2) NOT NULL COMMENT 'minute',
  `day` VARCHAR(30) NOT NULL COMMENT 'firstday etc',
  `user_id` VARCHAR(30) NULL DEFAULT NULL COMMENT 'user id',
  `user_pw` VARCHAR(256) NULL DEFAULT NULL COMMENT 'user pw',
  `enroll_date` DATETIME NULL DEFAULT NULL COMMENT 'date user enrolled',
  PRIMARY KEY (`id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;


