USE `tabashir_dev`;
DROP procedure IF EXISTS `get_teacher_by_id`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `get_teacher_by_id`(
IN p_teacher_id int
)
BEGIN
SELECT TeacherId,
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
FROM `teachers`
Where TeacherId = p_teacher_id;
END$$

DELIMITER ;
;

