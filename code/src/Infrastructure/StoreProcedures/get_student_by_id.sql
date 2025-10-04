USE `tabashir_dev`;
DROP procedure IF EXISTS `get_student_by_id`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `get_student_by_id`(
IN p_student_id int
)
BEGIN

SELECT 
StudentId, 
StudentNameEn,
StudentNameAr,
Address,
Address2,
City,
Country,
DateOfBirth,
Nationality,
Language1,
Language2,
PhoneNumber,
PhoneNumber2,
Mobile,
Email,
Status,
StudentNo,
CurrentGradeId,
TimeZone,
CalenderType,
Theme,
RegisterationSource,
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
FROM student
Where StudentId = p_student_id;


END$$

DELIMITER ;
;

