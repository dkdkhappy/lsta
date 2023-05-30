DROP PROCEDURE IF EXISTS mtron_lstadev.sp_select_conf_for_mail_send;
CREATE PROCEDURE mtron_lstadev.`sp_select_conf_for_mail_send`(
    IN   a_sys_id            varchar(20),
    IN   a_start             int,
    IN   a_end               int,
    IN   a_code_name         varchar(50),
    IN   a_code_desc         varchar(256),
    IN   a_use_flag          varchar(1)
)
    COMMENT 'Select Select conf_for_mail_send'
BEGIN
      SELECT *
      FROM  (
           SELECT x.*
           FROM  (
                  SELECT z1.*
                        ,@rownum := @rownum+1 AS RNUM
                  FROM  (   
                  SELECT CODE_NAME,
                         CODE_CD,
                         CODE_DESC,
                         USE_FLAG,
                         EXT_TEXT,
                         REGI_ID, 
                         REGI_DATE, 
                         CHNG_ID, 
                         CHNG_DATE
                  FROM   sys_code 
                  WHERE  SYS_ID = a_sys_id
                  AND    CODE_NAME = CASE WHEN a_code_name = '' THEN CODE_NAME
                                          ELSE a_code_name
                                          END
                  AND    USE_FLAG =  CASE WHEN a_use_flag = '' THEN USE_FLAG
                                          ELSE a_use_flag
                                          END
                  AND    CODE_DESC LIKE CONCAT('%',a_code_desc,'%')
                  ) z1
                       ,(
                         SELECT @rownum:=0) z2
                 ) x
           WHERE RNUM < IFNULL(a_end, 99999)
          ) x
    WHERE RNUM >= IFNULL(a_start, 1)
    ;
END;