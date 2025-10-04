USE `tabashir_dev`;
DROP procedure IF EXISTS `delete_student`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `delete_student`(
IN p_student_id int
)
BEGIN
DELETE FROM `student` 
WHERE StudentId = p_student_id;


END$$

DELIMITER ;
;

