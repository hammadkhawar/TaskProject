USE `tabashir_dev`;
DROP procedure IF EXISTS `delete_parent`;

DELIMITER $$
USE `tabashir_dev`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_parent`(
IN p_parent_id int
)
BEGIN
DELETE FROM `parent`
WHERE ParentId = p_parent_id;
 
END$$

DELIMITER ;
;

