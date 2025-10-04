USE `tabashir_dev`;
DROP procedure IF EXISTS `delete_teacher`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `delete_teacher`(
IN p_teacher_id int
)
BEGIN
DELETE FROM `teacher`  
WHERE TeacherId = p_teacher_id;


END$$

DELIMITER ;
;

