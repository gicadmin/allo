CREATE OR REPLACE PACKAGE phenix.jre_operation_pack AS

FUNCTION SETMAILRECIPIENT (
    p_jsc_id         IN NUMBER,
    p_code           IN VARCHAR2,                --p_code =  'CON','USE','VEN','OTH'
    p_id             IN NUMBER,                  --p_id = CON_ID, USE_CODE, VEN_CODE
    p_lang_code      IN VARCHAR2 DEFAULT NULL
) RETURN NUMBER;

FUNCTION SETMAILRECIPIENT (
  p_jsc_id         IN NUMBER,
  p_email          IN VARCHAR2,
  p_code           IN VARCHAR2,                --p_code =  'CON','USE','VEN','OTH'
  p_id             IN NUMBER,                  --p_id = CON_ID, USE_CODE, VEN_CODE
  p_lang_code      IN VARCHAR2 DEFAULT NULL,
  p_as_file_name   IN VARCHAR2 DEFAULT NULL,
  p_cc_email       IN VARCHAR2 DEFAULT NULL,
  p_bcc_email      IN VARCHAR2 DEFAULT NULL,
  p_from_email     IN VARCHAR2 DEFAULT NULL
)
RETURN NUMBER;

FUNCTION SETFAXRECIPIENT (
    p_jsc_id         IN NUMBER,
    p_code           IN VARCHAR2,                --p_code =  'CON','USE','VEN','OTH'
    p_id             IN NUMBER,                  --p_id = CON_ID, USE_CODE, VEN_CODE
    p_lang_code      IN VARCHAR2 DEFAULT NULL
) RETURN NUMBER;

FUNCTION SETFAXRECIPIENT (
    p_jsc_id         IN NUMBER,
    p_fax            IN NUMBER,
    p_code           IN VARCHAR2,                --p_code =  'CON','USE','VEN','OTH'
    p_id             IN NUMBER,                  --p_id = CON_ID, USE_CODE, VEN_CODE
    p_lang_code      IN VARCHAR2 DEFAULT NULL
) RETURN NUMBER;

FUNCTION SETPRINTRECIPIENT (
    p_jsc_id         IN NUMBER,
    p_code           IN VARCHAR2,                --p_code =  'CON','USE','VEN','OTH'
    p_id             IN NUMBER,                       --p_id = CON_ID, USE_CODE, VEN_CODE
    p_specific       IN NUMBER   DEFAULT NULL,        --p_Specific =  1,2,3
    p_whs_code       IN VARCHAR2 DEFAULT NULL,       -- pouvoir spécifier l'entrepôt où imprimer
    p_lang_code      IN VARCHAR2 DEFAULT 'FR'
) RETURN NUMBER;

PROCEDURE SEND_TO_RECIPIENTS_PROC(
  p_jsc_id     IN  job_schedules.jsc_id%TYPE,
  p_file_name  IN  VARCHAR2,
  p_dest_type  IN  job_recipients.jre_dest_type %TYPE,
  p_extension  IN  job_recipients.jre_extension%TYPE,
  p_lang_code  IN  job_recipients.jre_lang_code%TYPE
);

FUNCTION EXIST_RECIPIENT_FUNC( --gcl8571
  p_use_email 		IN users.use_email %TYPE
)
RETURN NUMBER;

FUNCTION DENORMALIZED_LANGUAGE_FUNC(
  p_code_lang       IN  VARCHAR2
) RETURN VARCHAR2;

PROCEDURE CHANGE_EMAIL_PROC(
  p_jre_id      IN job_recipients.jre_id%TYPE,
  p_user_email  IN users.use_email%TYPE
);

FUNCTION SETPRINTRECIPIENT(
 p_jsc_id     IN job_recipients.jre_jsc_id%TYPE,
 p_prn        IN job_recipients.jre_prn_id%TYPE,
 p_code       IN VARCHAR2,
 p_id         IN NUMBER,
 p_lang_code  IN VARCHAR2 DEFAULT 'FR'
 ) RETURN NUMBER;

FUNCTION GET_FILE_NAME_FUNC(
  p_file_name IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION COMPOSE_INV_REPORTS_NAME_FUNC(
  p_jsc_id      IN job_schedules.jsc_id%TYPE,
  p_pro_command IN programs.pro_command%TYPE
)
RETURN VARCHAR2;

END jre_operation_PACK;
/