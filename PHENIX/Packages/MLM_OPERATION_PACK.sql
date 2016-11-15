CREATE OR REPLACE PACKAGE phenix.MLM_OPERATION_PACK AS

PROCEDURE CLEAR_VALUES_PROC(
  p_mlm_domain      IN  multi_lang_messages.mlm_domain%TYPE,
  p_mlm_domain_key  IN  multi_lang_messages.mlm_domain_key%TYPE);

PROCEDURE CLEAR_VALUES_PROC(
  p_mlm_domain      IN  multi_lang_messages.mlm_domain%TYPE);

PROCEDURE CLEAR_ALL_VALUES_PROC(
  p_mlm_domain      IN  multi_lang_messages.mlm_domain%TYPE,
  p_mlm_domain_key  IN  multi_lang_messages.mlm_domain_key%TYPE);

PROCEDURE CLEAR_ALL_VALUES_PROC(
  p_mlm_domain      IN  multi_lang_messages.mlm_domain%TYPE);

FUNCTION NORMALIZED_LANGUAGE_FUNC(
  p_code_lang       IN  VARCHAR2
) RETURN VARCHAR2;
PRAGMA RESTRICT_REFERENCES (NORMALIZED_LANGUAGE_FUNC,RNDS,WNDS,RNPS,WNPS);

FUNCTION GET_MESSAGE_FUNC(
  p_mlm_domain      IN  multi_lang_messages.mlm_domain%TYPE,
  p_mlm_domain_key  IN  multi_lang_messages.mlm_domain_key%TYPE,
  p_mlm_lang_code   IN  multi_lang_messages.mlm_lang_code%TYPE
)
RETURN VARCHAR2;

FUNCTION EXISTS_DOMAIN_AND_KEY_FUNC(
 p_mlm_domain      IN  multi_lang_messages.mlm_domain%TYPE,
 p_mlm_domain_key  IN  multi_lang_messages.mlm_domain_key%TYPE
)
RETURN BOOLEAN;

FUNCTION REPLACE_PLACEHOLDERS_FUNC(
  p_message  IN  VARCHAR2,
  p_sqlerrm  IN  VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_MESSAGE_FUNC(
  p_mlm_domain      IN  multi_lang_messages.mlm_domain%TYPE,
  p_mlm_domain_key  IN  multi_lang_messages.mlm_domain_key%TYPE,
  p_mlm_lang_code   IN  multi_lang_messages.mlm_lang_code%TYPE,
  p_placeholders    IN  VARCHAR2
)
RETURN VARCHAR2;

END MLM_OPERATION_PACK;
/