USE `tabashir_dev`;
DROP procedure IF EXISTS `get_all_teacher`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `get_all_teacher`(
IN p_page_no int,
IN p_page_size int
)
BEGIN

DECLARE var_offset_value INT DEFAULT 0;
DECLARE var_limit_value BIGINT DEFAULT 184467440737095516;

IF p_page_no <> 0 AND p_page_size <> 0 THEN
        SET var_offset_value = (p_page_size * (p_page_no - 1));
        SET var_limit_value = p_page_size;
END IF;
        
SELECT
	COUNT(*) OVER() AS `TotalCount`,
TeacherId,
    TeacherNameEn,
    TeacherNameAr,
    Email,
    PhoneNumber,
    Mobile,
    Qualification,
    TeacherLevel,
    TeacherCategory,
    Address,
    DateOfBirth,
    Gender,
    LastDegree,
    Experience,
    Extra1i,
    Extra2i,
    Extra3i,
    Extra4s,
    Extra5s,
    Extra6s,
    CreatedBy,
    CreatedAt,
    LastModifiedBy,
    LastModifiedAt,
    LastUpdateIP,
    Comment
FROM `teachers`;

END$$

DELIMITER ;
;

