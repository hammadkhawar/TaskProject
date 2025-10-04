USE `tabashir_dev`;
DROP procedure IF EXISTS `get_all_student`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE  PROCEDURE `get_all_student`(
IN p_page_no int,
IN p_page_size int,
In p_student_name varchar(200),
IN p_grade_id int,
In p_city_id int,
IN p_language int,
IN p_gender int
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
    l1.CNameEn AS Language1En,
    l1.CNameAr AS Language1Ar,
    Language2,
    l2.CNameEn AS Language1En,
    l2.CNameAr As Language1Ar,
    PhoneNumber,
    PhoneNumber2,
    Mobile,
    Email,
    `Status`,
    StudentNo,
    s.CurrentGradeId,
    g.GNameEn As GradeNameEn,
    g.GNameAr As GradeNameAr,
    s.TimeZone,
    s.CalenderType,
    s.Theme,
    s.RegisterationSource,
    s.Extra1i,
    s.Extra2i,
    s.Extra3i,
    s.Extra4s,
    s.Extra5s,
    s.Extra6s,
    s.CreatedBy,
    s.CreatedAt,
    s.LastModifiedBy,
    s.LastModifiedAt,
    s.LastUpdateIP,
    s.Comment
FROM student s
Left Join grade g ON g.GradeId = s.CurrentGradeId
Left Join category l1 ON c.CategoryId = s.Language1
Left Join category l2 ON c.CategoryId = s.Language2
;

END$$

DELIMITER ;
;

