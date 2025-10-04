USE `tabashir_dev`;
DROP procedure IF EXISTS `create_subject`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `create_subject`(
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
INSERT INTO 
subject
(
`SubjectNameAr`,
`SubjectNameEn`,
`Description`,
`SubjectType`,
`SubjectOption`,
`DescriptionHtml`,
`Status`,
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
`Comment`
)
VALUES
(
p_subject_name_ar,
p_subject_name_en,
p_description, 
p_subject_type,
p_subject_option,
p_description_html,
p_status,
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

