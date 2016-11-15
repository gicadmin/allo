CREATE OR REPLACE FORCE VIEW phenix.v_application_messages (ames_creation_date,ames_end_date,ames_id,ames_modification_date,ames_source,ames_start_date,ames_status,ames_type,arol_lang_code,ames_message) AS
SELECT AMES_CREATION_DATE,
          AMES_END_DATE,
          AMES_ID,
          AMES_MODIFICATION_DATE,
          AMES_SOURCE,
          AMES_START_DATE,
          AMES_STATUS,
          AMES_TYPE,
          mlm_name.mlm_lang_code arol_lang_code,
          mlm_name.mlm_message ames_message
     FROM APPLICATION_MESSAGES ames JOIN
          multi_lang_messages mlm_name
             ON (    mlm_name.mlm_domain = 'APPLICATION_MESSAGES.MESSAGE'
                 AND mlm_name.mlm_domain_key = TO_CHAR (ames.ames_id));