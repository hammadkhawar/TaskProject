USE `tabashir_dev`;
DROP procedure IF EXISTS `update_parent`;


DELIMITER $$
USE `tabashir_dev`$$
CREATE PROCEDURE `update_parent`(
IN p_parent_id int,
IN p_parent_name_en varchar(200),
IN p_parent_name_ar varchar(200),
IN p_address varchar(255),
IN p_address_2 varchar(255),
IN p_city int,
IN p_country int, 
In p_date_of_birth datetime,
IN p_nationality int,
IN p_language_1 int,
IN p_language_2 int,
IN p_phone_number varchar(200),
IN p_phone_number_2 varchar(200),
IN p_mobile varchar(200),
IN p_email varchar(200),
IN p_status int,
IN p_time_zone int,
IN p_calender_type int,
IN p_theme int,
IN p_registeration_source int,
IN p_extra_1i int,
IN p_extra_2i int,
IN p_extra_3i int,
IN p_extra_4s varchar(200),
IN p_extra_5s varchar(200),
IN p_extra_6s varchar(200),
IN p_current_user_id int,
IN p_last_update_ip varchar(200),
IN p_comment varchar(200)
)
BEGIN

UPDATE parent
SET
`ParentNameEn` = p_parent_name_en,
`ParentNameAr` = p_parent_name_ar,
`Address` = p_address,
`Address2` = p_address_2,
`City` = p_city,
`Country` = p_country,
`DateOfBirth` = p_date_of_birth,
`Nationality` = p_nationality,
`Language1` = p_language_1,
`Language2` = p_language_2,
`PhoneNumber` = p_phone_number,
`PhoneNumber2` = p_phone_number_2,
`Mobile` = p_mobile,
`Email` = p_email,
`Status` = p_status,
`TimeZone` = p_time_zone,
`CalenderType` = p_calender_type,
`Theme` = p_theme,
`RegisterationSource` = p_registeration_source,
`Extra1i` = p_extra_1i,
`Extra2i` = p_extra_2i,
`Extra3i` = p_extra_3i,
`Extra4s` = p_extra_4s,
`Extra5s` = p_extra_5s,
`Extra6s` = p_extra_6s,
`LastModifiedBy` = p_current_user_id,
`LastModifiedAt` = Now(),
`LastUpdateIP` = p_last_update_ip,
`Comment` = p_comment
WHERE `ParentId` = p_parent_id;

END$$

DELIMITER ;
;

