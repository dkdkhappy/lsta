DROP PROCEDURE IF EXISTS mtron_lstadev.sp_select_dealappstat;
CREATE PROCEDURE mtron_lstadev.`sp_select_dealappstat`(
    IN   a_sys_id            varchar(20),
    IN   a_start             int,
    IN   a_end               int,
    IN   a_appl_date_fr      varchar(20),
    IN   a_appl_date_to      varchar(20),
    IN   a_appl_bm           varchar(20),
    IN   a_appl_stat         varchar(20),
    IN   a_appl_type         varchar(20),
    IN   a_ti_dc             varchar(20),
    IN   a_name_email        varchar(200)
)
    COMMENT 'Select Select dealappstat'
BEGIN
      SELECT *
      FROM  (
           SELECT x.*
           FROM  (
                  SELECT z1.*
                        ,@rownum := @rownum+1 AS RNUM
                  FROM  (   
                  SELECT SYS_ID, 
                         TEMP_ID,
                         DEAL_SHIP, 
                         CASE WHEN APPL_TYPE = 'P' THEN (SELECT s.CODE_NAME
                                												 FROM sys_code s
                                												 WHERE s.CODE_CD = APPL_TYPE
                                												 AND s.CODE_GRUP = 'NDA_TYPE'
                                                         AND s.USE_FLAG = 'Y')
                              WHEN APPL_TYPE = 'R' THEN (SELECT s.CODE_NAME
                                												 FROM sys_code s
                                												 WHERE s.CODE_CD = APPL_TYPE
                                												 AND s.CODE_GRUP = 'NDA_TYPE'
                                                         AND s.USE_FLAG = 'Y')
                    		 END AS applType,  
                         APPL_DBA, 
                         APPL_BM, 
                         fn_conv_date1(APPL_DATE) AS applDate, 
                         APPL_MAIL, 
                         DEAL_CODE, 
                         DEAL_NAME, 
                         CASE WHEN APPL_STAT = '100' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y')
                              WHEN APPL_STAT = '150' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              WHEN APPL_STAT = '200' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              WHEN APPL_STAT = '250' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              WHEN APPL_STAT = '300' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              WHEN APPL_STAT = '310' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              WHEN APPL_STAT = '350' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              WHEN APPL_STAT = '400' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              WHEN APPL_STAT = '500' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              WHEN APPL_STAT = '600' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              WHEN APPL_STAT = '900' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              WHEN APPL_STAT = '950' THEN (SELECT s.CODE_NAME
                                                           FROM sys_code s
                                                           WHERE s.CODE_GRUP = 'NDA_STAT'
                                                           AND s.CODE_CD = APPL_STAT
                                                           AND USE_FLAG = 'Y') 
                              END AS APPL_STAT, 
                         PRE_APPR_LAST_STAT, 
                         CASE WHEN APPL_TYPE = 'p' THEN fn_conv_date1(left(PRE_APPR_DATE,10))
                         ELSE fn_conv_date1(left(REG_APPR_DATE,10)) END AS APPR_DATE,
                         LSTA_REMK, 
                         USE_YN, 
                         REGI_ID, 
                         REGI_DATE, 
                         CHNG_ID, 
                         CHNG_DATE
                  FROM nda_mast_info 
                  WHERE SYS_ID = a_sys_id
                  AND APPL_DATE BETWEEN fn_conv_date2(a_appl_date_fr) AND fn_conv_date2(a_appl_date_to)
                  AND APPL_BM = CASE WHEN a_appl_bm = '' THEN APPL_BM
                                     ELSE a_appl_bm
                                     END
                  AND APPL_STAT = CASE WHEN a_appl_stat = '' THEN APPL_STAT
                                       ELSE a_appl_stat
                                       END
                  AND APPL_TYPE = CASE WHEN a_appl_type = '' THEN APPL_TYPE
                                       ELSE a_appl_type
                                       END
                  AND TEMP_ID LIKE CONCAT('%',a_ti_dc,'%')
                  AND APPL_MAIL LIKE CONCAT('%',a_name_email,'%')
                  ) z1
                       ,(
                         SELECT @rownum:=0) z2
                 ) x
           WHERE RNUM < IFNULL(a_end, 99999)
          ) x
    WHERE RNUM >= IFNULL(a_start, 1)
    ;
END;