CREATE OR REPLACE FORCE VIEW phenix.v_application_roles (arol_id,arol_arol_id,arol_status,arol_read_only,arol_creation_date,arol_modification_date,arol_lang_code,arol_name) AS
SELECT
  AROL_ID,
  AROL_AROL_ID,
  AROL_STATUS,
  AROL_READ_ONLY,
  AROL_CREATION_DATE,
  AROL_MODIFICATION_DATE,
  mlm_name.mlm_lang_code arol_lang_code,
  mlm_name.mlm_message arol_name
FROM APPLICATION_ROLES arol join
     multi_lang_messages mlm_name on
      (mlm_name.mlm_domain = 'APPLICATION_ROLES.NAME' and
       mlm_name.mlm_domain_key = to_char(arol.arol_id));