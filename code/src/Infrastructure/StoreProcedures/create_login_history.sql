USE `tabashir_dev`;
DROP procedure IF EXISTS `create_login_history`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `create_login_history`(
IN p_user_id int,
IN p_login_type int,
IN p_login_time DateTime,
IN p_ip_address varchar(200),
IN p_device_information varchar(200) 
)
BEGIN
INSERT INTO login_history
(
`UserId`,
`LoginType`,
`LoginTime`,
`LogoutTime`,
`IPAddress`,
`DeviceInformation`
)
VALUES
(
p_user_id,
p_login_type,
p_login_time,
null,
p_ip_address,
p_device_information
);

END$$

DELIMITER ;
;

