USE `tabashir_dev`;
DROP procedure IF EXISTS `create_teacher`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `create_teacher`(
IN p_teacher_name_en varchar(200),
IN p_teacher_name_ar varchar(200),
IN p_teacher_email varchar(200), 
IN p_phone_number varchar(200),
IN p_mobile varchar(200),
IN p_qualification varchar(200),
IN p_teacher_level int,
IN p_teacher_category int,
IN p_address varchar(200),
IN p_date_of_birth datetime,
IN p_gender int,
IN p_last_degree varchar(200),
IN p_experience int,
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

INSERT INTO `teachers`
(
`TeacherNameEn`,
`TeacherNameAr`,
`Email`,
`PhoneNumber`,
`Mobile`,
`Qualification`,
`TeacherLevel`,
`TeacherCategory`,
`Address`,
`DateOfBirth`,
`Gender`,
`LastDegree`,
`Experience`,
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
	p_teacher_name_en ,
	p_teacher_name_ar ,
	p_teacher_email,
	p_phone_number,
	p_mobile ,
	p_qualification ,
	p_teacher_level ,
	p_teacher_category ,
	p_address ,
	p_date_of_birth ,
	p_gender,
	p_last_degree,
	p_experience,
	p_extra_1i,
	p_extra_2i,
	p_extra_3i ,
	p_extra_4s ,
	p_extra_5s ,
	p_extra_6s ,
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

