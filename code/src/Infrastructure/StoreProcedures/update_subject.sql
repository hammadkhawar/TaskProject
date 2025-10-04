USE `tabashir_dev`;
DROP procedure IF EXISTS `update_subject`;

DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `update_subject`(
IN p_subject_id int,
IN p_subject_name_en varchar(200),
IN p_subject_name_ar varchar(200),
IN p_description varchar(200),
IN p_subject_type int,
IN p_subject_option int,
IN p_description_html text, 
IN p_status int,
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

UPDATE `subject`
SET
`SubjectNameAr` = p_subject_name_ar,
`SubjectNameEn` = p_subject_name_en,
`Description` = p_description,
`SubjectType` = p_subject_type,
`SubjectOption` = p_subject_option,
`DescriptionHtml` = p_description_html,
`Status` = p_status,
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
WHERE `SubjectId` = p_subject_id;


END$$

DELIMITER ;
;

