DROP TABLE IF EXISTS `schema_version`;

CREATE TABLE
    `schema_version` (
        `Sequence` INT UNSIGNED NOT NULL AUTO_INCREMENT,
        `Filename` VARCHAR(255) NOT NULL,
        `Checksum` CHAR(64) NOT NULL,
        `Date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`Sequence`),
        UNIQUE (`Filename`),
        UNIQUE (`Checksum`)
    ) ENGINE = InnoDB;

ALTER TABLE `schema_version` CONVERT TO CHARACTER SET utf8;
