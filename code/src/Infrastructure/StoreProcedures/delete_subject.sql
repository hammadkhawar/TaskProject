USE `tabashir_dev`;
DROP procedure IF EXISTS `delete_subject`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `delete_subject`(
IN p_subject_id int
)
BEGIN
DELETE FROM `subject`  
WHERE SubjectId = p_subject_id;


END$$

DELIMITER ;
;

