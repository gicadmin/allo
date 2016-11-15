CREATE OR REPLACE PACKAGE phenix.MLM_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  multi_lang_messages%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_mlm_id                         IN         multi_lang_messages.mlm_id%TYPE,
  p_mlm_rec                        OUT NOCOPY multi_lang_messages%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mlm_id                         IN         multi_lang_messages.mlm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_mlm_id                         IN         multi_lang_messages.mlm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_mlm_id                         IN         multi_lang_messages.mlm_id%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_mlm_domain                     IN         multi_lang_messages.mlm_domain%TYPE,
  p_mlm_domain_key                 IN         multi_lang_messages.mlm_domain_key%TYPE,
  p_mlm_lang_code                  IN         multi_lang_messages.mlm_lang_code%TYPE,
  p_mlm_rec                        OUT NOCOPY multi_lang_messages%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mlm_domain                     IN         multi_lang_messages.mlm_domain%TYPE,
  p_mlm_domain_key                 IN         multi_lang_messages.mlm_domain_key%TYPE,
  p_mlm_lang_code                  IN         multi_lang_messages.mlm_lang_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_mlm_domain                     IN         multi_lang_messages.mlm_domain%TYPE,
  p_mlm_domain_key                 IN         multi_lang_messages.mlm_domain_key%TYPE,
  p_mlm_lang_code                  IN         multi_lang_messages.mlm_lang_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_mlm_domain                     IN         multi_lang_messages.mlm_domain%TYPE,
  p_mlm_domain_key                 IN         multi_lang_messages.mlm_domain_key%TYPE,
  p_mlm_lang_code                  IN         multi_lang_messages.mlm_lang_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_mlm_domain           IN         multi_lang_messages.mlm_domain%TYPE,
  p_mlm_domain_key       IN         multi_lang_messages.mlm_domain_key%TYPE,
  p_mlm_lang_code        IN         multi_lang_messages.mlm_lang_code%TYPE,
  p_mlm_message          IN         multi_lang_messages.mlm_message%TYPE,
  p_mlm_order            IN         multi_lang_messages.mlm_order%TYPE                 DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY multi_lang_messages%ROWTYPE)
RETURN NUMBER;

END MLM_PACK;
/