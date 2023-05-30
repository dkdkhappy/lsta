DROP PROCEDURE IF EXISTS mtron_lstadev.sp_get_dealapplstat;
CREATE PROCEDURE mtron_lstadev.`sp_get_dealapplstat`(
    IN   a_sys_id            varchar(20)
)
    COMMENT 'dealapplstat'
BEGIN
      SELECT CODE_CD     AS 'CODE_CD', 
             CODE_NAME   AS 'CODE_NAME'
  		FROM sys_code
  		WHERE SYS_ID = a_sys_id
  			  AND CODE_GRUP = 'NDA_STAT'
  			  AND USE_FLAG = 'Y';
END;