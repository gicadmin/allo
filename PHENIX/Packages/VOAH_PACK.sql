CREATE OR REPLACE PACKAGE phenix.VOAH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vend_order_agreement_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_voah_id                        IN         vend_order_agreement_headers.voah_id%TYPE,
  p_voah_rec                       OUT NOCOPY vend_order_agreement_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_voah_id                        IN         vend_order_agreement_headers.voah_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_voah_id                        IN         vend_order_agreement_headers.voah_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_voah_id                        IN         vend_order_agreement_headers.voah_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_voah_id                        IN         vend_order_agreement_headers.voah_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_voah_id                        IN         vend_order_agreement_headers.voah_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_voah_id                        IN         vend_order_agreement_headers.voah_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_voah_ven_code                  IN         vend_order_agreement_headers.voah_ven_code%TYPE,
  p_voah_qualifier                 IN         vend_order_agreement_headers.voah_qualifier%TYPE,
  p_voah_agreement_id              IN         vend_order_agreement_headers.voah_agreement_id%TYPE,
  p_voah_rec                       OUT NOCOPY vend_order_agreement_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_voah_ven_code                  IN         vend_order_agreement_headers.voah_ven_code%TYPE,
  p_voah_qualifier                 IN         vend_order_agreement_headers.voah_qualifier%TYPE,
  p_voah_agreement_id              IN         vend_order_agreement_headers.voah_agreement_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_voah_ven_code                  IN         vend_order_agreement_headers.voah_ven_code%TYPE,
  p_voah_qualifier                 IN         vend_order_agreement_headers.voah_qualifier%TYPE,
  p_voah_agreement_id              IN         vend_order_agreement_headers.voah_agreement_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_voah_ven_code                  IN         vend_order_agreement_headers.voah_ven_code%TYPE,
  p_voah_qualifier                 IN         vend_order_agreement_headers.voah_qualifier%TYPE,
  p_voah_agreement_id              IN         vend_order_agreement_headers.voah_agreement_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_voah_ven_code                  IN         vend_order_agreement_headers.voah_ven_code%TYPE,
  p_voah_qualifier                 IN         vend_order_agreement_headers.voah_qualifier%TYPE,
  p_voah_agreement_id              IN         vend_order_agreement_headers.voah_agreement_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_voah_ven_code                  IN         vend_order_agreement_headers.voah_ven_code%TYPE,
  p_voah_qualifier                 IN         vend_order_agreement_headers.voah_qualifier%TYPE,
  p_voah_agreement_id              IN         vend_order_agreement_headers.voah_agreement_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_voah_ven_code                  IN         vend_order_agreement_headers.voah_ven_code%TYPE,
  p_voah_qualifier                 IN         vend_order_agreement_headers.voah_qualifier%TYPE,
  p_voah_agreement_id              IN         vend_order_agreement_headers.voah_agreement_id%TYPE);


FUNCTION INSERT_FUNC(
  p_voah_ven_code          IN         vend_order_agreement_headers.voah_ven_code%TYPE,
  p_voah_qualifier         IN         vend_order_agreement_headers.voah_qualifier%TYPE,
  p_voah_agreement_id      IN         vend_order_agreement_headers.voah_agreement_id%TYPE,
  p_voah_description       IN         vend_order_agreement_headers.voah_description%TYPE,
  p_voah_source            IN         vend_order_agreement_headers.voah_source%TYPE,
  p_voah_alt_description   IN         vend_order_agreement_headers.voah_alt_description%TYPE        DEFAULT NULL,
  p_voah_creation_date     IN         vend_order_agreement_headers.voah_creation_date%TYPE          DEFAULT SYSDATE ,
  p_voah_modification_date IN         vend_order_agreement_headers.voah_modification_date%TYPE      DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vend_order_agreement_headers%ROWTYPE)
RETURN NUMBER;

END VOAH_PACK;
/