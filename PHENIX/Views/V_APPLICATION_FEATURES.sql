CREATE OR REPLACE FORCE VIEW phenix.v_application_features (afea_id,afea_code,afea_status,afea_creation_date,afea_modification_date,afea_lang_code,afea_name,afea_description) AS
SELECT
  AFEA_ID,
  AFEA_CODE,
  AFEA_STATUS,
  AFEA_CREATION_DATE,
  AFEA_MODIFICATION_DATE,
  mlm_name.mlm_lang_code afea_lang_code,
  mlm_name.mlm_message afea_name,
  mlm_desc.mlm_message afea_description
FROM APPLICATION_FEATURES afea join
     multi_lang_messages mlm_name on
      (mlm_name.mlm_domain = 'APPLICATION_FEATURES.NAME' and
       mlm_name.mlm_domain_key = to_char(afea.afea_id)) join
     multi_lang_messages mlm_desc on
      (mlm_desc.mlm_domain = 'APPLICATION_FEATURES.DESCRIPTION' and
       mlm_desc.mlm_domain_key = to_char(afea.afea_id) and
       mlm_desc.mlm_lang_code = mlm_name.mlm_lang_code);