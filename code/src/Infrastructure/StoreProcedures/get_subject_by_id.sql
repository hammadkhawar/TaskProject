USE `tabashir_dev`;
DROP procedure IF EXISTS `get_subject_by_id`;

DELIMITER $$
USE `tabashir_dev`$$
CREATE  PROCEDURE `get_subject_by_id`(
IN p_subject_id int
)
BEGIN

SELECT 
	`SubjectId`,
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
FROM subject
Where SubjectId = p_subject_id;


END$$

DELIMITER ;
;

