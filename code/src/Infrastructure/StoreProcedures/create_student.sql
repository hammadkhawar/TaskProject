USE `tabashir_dev`;
DROP procedure IF EXISTS `create_student`;

DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `create_student`(
IN p_student_name_en varchar(200),
IN p_student_name_ar varchar(200),
IN p_address varchar(255),
IN p_address_2 varchar(255),
IN p_city int,
IN p_country int,
In p_date_of_birth datetime,
IN p_nationality int,
IN p_language_1 int,
IN p_language_2 int,
IN p_phone_number varchar(200),
IN p_phone_number_2 varchar(200),
IN p_mobile varchar(200),
IN p_email varchar(200),
IN p_status int,
IN p_student_no varchar(200),
IN p_current_grade_id int,
IN p_time_zone int,
IN p_calender_type int,
IN p_theme int,
IN p_registeration_source int,
IN p_extra_1i int,
IN p_extra_2i int,
IN p_extra_3i int,
IN p_extra_4s varchar(200),
IN p_extra_5s varchar(200),
IN p_extra_6s varchar(200),
IN p_current_user_id int,
IN p_last_update_ip varchar(200),
IN p_comment varchar(200)
)
BEGIN

INSERT INTO `student`
(
`StudentNameEn`,
`StudentNameAr`,
`Address`,
`Address2`,
`City`,
`Country`, 
`DateOfBirth`,
`Nationality`,
`Language1`,
`Language2`,
`PhoneNumber`,
`PhoneNumber2`,
`Mobile`,
`Email`,
`Status`,
`StudentNo`,
`CurrentGradeId`,
`TimeZone`,
`CalenderType`,
`Theme`,
`RegisterationSource`,
`Extra1i`,
`Extra2i`,
`Extra3i`,
`Extra4s`,
`Extra5s`,
`Extra6s`,
`CreatedBy`,
`CreatedAt`,
`LastModifiedBy`,
`LastModifiedAt`,
`LastUpdateIP`,
`Comment`)
VALUES
(
p_student_name_en,
p_student_name_ar,
p_address,
p_address_2,
p_city,
p_country,
p_date_of_birth,
p_nationality,
p_language_1,
p_language_2,
p_phone_number,
p_phone_number_2,
p_mobile,
p_email,
p_status,
p_student_no,
p_current_grade_id,
p_time_zone,
p_calender_type,
p_theme,
p_registeration_source,
p_extra_1i,
p_extra_2i,
p_extra_3i,
p_extra_4s,
p_extra_5s,
p_extra_6s,
p_current_user_id,
now(),
p_current_user_id,
now(),
p_last_update_ip,
p_comment
);

Select last_insert_id();



END$$

DELIMITER ;
;

