DROP PROCEDURE IF EXISTS mtron_lstadev.sp_select_dealappstat_count;
CREATE PROCEDURE mtron_lstadev.`sp_select_dealappstat_count`(
    IN   a_sys_id            varchar(20),
    IN   a_appl_date_fr      varchar(20),
    IN   a_appl_date_to      varchar(20),
    IN   a_appl_bm           varchar(20),
    IN   a_appl_stat         varchar(20),
    IN   a_appl_type         varchar(20),
    IN   a_ti_dc             varchar(20),
    IN   a_name_email        varchar(200)
)
    COMMENT 'Select Select dealappstat count'
BEGIN
    SELECT COUNT(1)
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
    AND APPL_MAIL LIKE CONCAT('%',a_name_email,'%');
END;