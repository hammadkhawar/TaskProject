USE `tabashir_dev`;
DROP procedure IF EXISTS `user_role_get`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `user_role_get`(
IN p_user_id int
)
BEGIN
SELECT 
	ur.`UserRoleId`,
    ur.`RoleId`, 
    r.RoleName,
    ur.`UserId`,
    ur.`Active`
FROM `user_role` ur
Left Join role r ON r.RoleId = ur.RoleId
Where ur.UserId = p_user_id And ur.Active = 1;

END$$

DELIMITER ;
;

