DROP PROCEDURE IF EXISTS mtron_lstadev.sp_get_nda_mail_main_item_list;
CREATE PROCEDURE mtron_lstadev.`sp_get_nda_mail_main_item_list`(
	IN a_sys_id             varchar(20),
	IN a_user_id            varchar(50),
	IN a_lang               varchar(10),
	IN a_mail_id            varchar(10),
  IN a_temp_id            varchar(50)
)
    COMMENT 'New Dealer Application 메일 전송시 아이템 정보'
BEGIN

    IF a_mail_id = 'P01' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date)     AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,IFNULL(lsta_remk,'')         AS lsta_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'P02' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date)     AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,IFNULL(deal_remk,'')         AS deal_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'P03' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date)     AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,IFNULL(lsta_remk,'')         AS lsta_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'P04' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date)     AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,IFNULL(lsta_remk,'')         AS lsta_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'P05' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,''                           AS lsta_inte_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'P06' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,''                           AS lsta_inte_remk
              ,''                           AS appr_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'P07' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,''                           AS lsta_inte_remk
              ,''                           AS appr_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'P08' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,''                           AS lsta_inte_remk
              ,''                           AS appr_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'R01' THEN
        SELECT temp_id
              ,deal_ship
              ,appl_dba
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'R02' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,IFNULL(deal_remk,'')         AS deal_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'R03' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,IFNULL(lsta_remk,'')         AS lsta_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'R04' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,IFNULL(lsta_remk,'')         AS lsta_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'R05' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,''                           AS lsta_inte_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'R06' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,''                           AS lsta_inte_remk
              ,''                           AS appr_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'R07' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,''                           AS lsta_inte_remk
              ,''                           AS appr_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    ELSEIF a_mail_id = 'R08' THEN
        SELECT temp_id
              ,deal_ship
              ,CASE WHEN appl_type = 'P' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
                    WHEN appl_type = 'R' THEN (SELECT s.CODE_NAME
                      												 FROM sys_code s
                      												 WHERE s.CODE_CD = appl_type
                      												 AND s.CODE_GRUP = 'NDA_TYPE'
                                               AND s.USE_FLAG = 'Y')
          		 END AS appl_type
              ,appl_dba
              ,appl_bm
              ,fn_conv_date1(appl_date) AS appl_date
              ,appl_mail
              ,(SELECT s.CODE_NAME
                FROM sys_code s
                WHERE s.CODE_GRUP = 'NDA_STAT'
                AND s.CODE_CD = appl_stat
                AND USE_FLAG = 'Y') appl_stat
              ,''                           AS lsta_inte_remk
              ,''                           AS appr_remk
              ,fn_get_user_name(temp_id)    AS deal_name
              ,fn_conv_dttm_disp(chng_date) AS chng_date
        FROM   nda_mast_info
        WHERE  sys_id  = a_sys_id
        AND    temp_id = a_temp_id
        ;
    END IF;
   
END;
