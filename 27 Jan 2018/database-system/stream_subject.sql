CREATE DATABASE `PUIS`;

USE `PUIS`;

-- tabel student
CREATE TABLE `students` (
	`student_id` INT NOT NULL AUTO_INCREMENT,
    `student_name` VARCHAR(255) NOT NULL,
    `student_major` VARCHAR(255),
    
    CONSTRAINT STUDENTID_PK PRIMARY KEY(student_id)
);

DROP TABLE `students`;

INSERT INTO `students` (`student_name`, `student_major`) VALUES ('Ammar', 'Information Technology');
INSERT INTO `students` (`student_name`, `student_major`) VALUES ('Ahyar', 'Information Technology');
INSERT INTO `students` (`student_name`, `student_major`) VALUES ('Rokhman', 'Information Technology');

SELECT * FROM `students`;

-- tabel subjects
CREATE TABLE `subjects` (
	`subject_id` INT NOT NULL AUTO_INCREMENT,
    `subject_name` VARCHAR(255) NOT NULL UNIQUE,
    `subject_credits` INT NOT NULL,
    
    CONSTRAINT SUBJECTID_PK PRIMARY KEY(subject_id)
);

INSERT INTO `subjects` (`subject_name`, `subject_credits`) VALUES ('Database Design', 3);
INSERT INTO `subjects` (`subject_name`, `subject_credits`) VALUES ('Structured Programming', 3);
INSERT INTO `subjects` (`subject_name`, `subject_credits`) VALUES ('Object Oriented Programming', 3);

SELECT * FROM `subjects`;

-- tabel report card
CREATE TABLE `reports` (
    `student_id` INT NOT NULL,
	`subject_id` INT NOT NULL,
    `report_year` INT NOT NULL,
    `grade` CHAR(1) NOT NULL,
    
    CONSTRAINT REPORT_PK PRIMARY KEY(student_id, subject_id, report_year)
);

INSERT INTO `reports` VALUES (1, 1, 20172, 'S');
INSERT INTO `reports` VALUES (1, 2, 20172, 'B');
INSERT INTO `reports` VALUES (1, 3, 20172, 'A');

INSERT INTO `reports` VALUES (2, 1, 20172, 'A');
INSERT INTO `reports` VALUES (2, 2, 20172, 'B');
INSERT INTO `reports` VALUES (2, 3, 20172, 'S');

INSERT INTO `reports` VALUES (3, 1, 20172, 'Z');
INSERT INTO `reports` VALUES (3, 2, 20172, 'Y');
INSERT INTO `reports` VALUES (3, 3, 20172, 'X');

SELECT * FROM `reports`;

-- selective select
SELECT
		`students`.`student_name` AS `name`,
        `subjects`.`subject_name` AS `subject`,
        `subjects`.`subject_credits` AS `credits`,
        `reports`.`grade` AS `grade`,
        IF (`grade` = 'A', 'Great!', IF(`grade` = 'S', 'Super!', IF(`grade` = 'Z', 'EpicZ!', 'Boo!'))) AS `commentary`
	FROM `reports`
	INNER JOIN `students` ON `students`.`student_id` = `reports`.`student_id`
    INNER JOIN `subjects` ON `subjects`.`subject_id` = `reports`.`subject_id`
    ORDER BY `reports`.`grade` ASC;



