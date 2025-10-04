USE `tabashir_dev`;
DROP procedure IF EXISTS `update_teacher`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `update_teacher`(
IN p_teacher_id int,
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

UPDATE teachers
SET
`TeacherNameEn` = p_teacher_name_en,
`TeacherNameAr` = p_teacher_name_ar,
`Email` = p_teacher_email,
`PhoneNumber` = p_phone_number,
`Mobile` = p_mobile,
`Qualification` = p_qualification,
`TeacherLevel` = p_teacher_level,
`TeacherCategory` = p_teacher_category,
`Address` = p_address,
`DateOfBirth` = p_date_of_birth,
`Gender` = p_gender,
`LastDegree` = p_last_degree,
`Experience` = p_experience,
`Extra1i` = p_extra_1i,
`Extra2i` = p_extra_2i,
`Extra3i` = p_extra_3i,
`Extra4s` = p_extra_4s,
`Extra5s` = p_extra_5s,
`Extra6s` = p_extra_6s,
`LastModifiedBy` = p_current_user_id,
`LastModifiedAt` = now(),
`LastUpdateIP` = p_last_update_ip,
`Comment` = p_comment
WHERE `TeacherId` = p_teacher_id;

END$$

DELIMITER ;
;

