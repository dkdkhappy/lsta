DROP PROCEDURE IF EXISTS mtron_lstadev.sp_get_conf_code_name;
CREATE PROCEDURE mtron_lstadev.`sp_get_conf_code_name`(
    IN   a_sys_id            varchar(20)
)
    COMMENT 'Select get confCodeName'
BEGIN
    SELECT DISTINCT CODE_NAME
    FROM   sys_code 
    WHERE  CODE_GRUP = 'NDA_MAIL_YN'
    AND    SYS_ID = a_sys_id
    AND    USE_FLAG = 'Y'
    ORDER 
    BY     SORT_SEQ;
END;