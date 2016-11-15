CREATE OR REPLACE PACKAGE phenix.USE_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  users%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_use_login                      IN         users.use_login%TYPE,
  p_use_rec                        OUT NOCOPY users%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_use_login                      IN         users.use_login%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_use_login                      IN         users.use_login%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_use_login                      IN         users.use_login%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_use_login                      IN         users.use_login%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_use_login                      IN         users.use_login%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_use_login                      IN         users.use_login%TYPE);

FUNCTION GET_FULL_FUNC(
  p_use_code                       IN         users.use_code%TYPE,
  p_use_rec                        OUT NOCOPY users%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_use_code                       IN         users.use_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_use_code                       IN         users.use_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_use_code                       IN         users.use_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_use_code                       IN         users.use_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_use_code                       IN         users.use_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_use_code                       IN         users.use_code%TYPE);


PROCEDURE INSERT_PROC(
  p_use_code                  IN         users.use_code%TYPE,
  p_use_first_name            IN         users.use_first_name%TYPE,
  p_use_last_name             IN         users.use_last_name%TYPE,
  p_use_language              IN         users.use_language%TYPE,
  p_use_wms_user_switch       IN         users.use_wms_user_switch%TYPE,
  p_use_whs_code              IN         users.use_whs_code%TYPE,
  p_use_prv_code              IN         users.use_prv_code%TYPE                   DEFAULT NULL,
  p_use_address               IN         users.use_address%TYPE                    DEFAULT NULL,
  p_use_email                 IN         users.use_email%TYPE                      DEFAULT NULL,
  p_use_year_spiffs           IN         users.use_year_spiffs%TYPE                DEFAULT NULL,
  p_use_alt_email             IN         users.use_alt_email%TYPE                  DEFAULT NULL,
  p_use_fax                   IN         users.use_fax%TYPE                        DEFAULT NULL,
  p_use_city                  IN         users.use_city%TYPE                       DEFAULT NULL,
  p_use_login                 IN         users.use_login%TYPE                      DEFAULT NULL,
  p_use_password              IN         users.use_password%TYPE                   DEFAULT NULL,
  p_use_postal_code           IN         users.use_postal_code%TYPE                DEFAULT NULL,
  p_use_telephone             IN         users.use_telephone%TYPE                  DEFAULT NULL,
  p_use_telephone_2           IN         users.use_telephone_2%TYPE                DEFAULT NULL,
  p_use_telephone_extension   IN         users.use_telephone_extension%TYPE        DEFAULT NULL,
  p_use_telephone_extension_2 IN         users.use_telephone_extension_2%TYPE      DEFAULT NULL,
  p_use_sgr_code              IN         users.use_sgr_code%TYPE                   DEFAULT NULL,
  p_use_prn_id                IN         users.use_prn_id%TYPE                     DEFAULT NULL,
  p_use_vr_password           IN         users.use_vr_password%TYPE                DEFAULT NULL,
  p_use_last_connection_date  IN         users.use_last_connection_date%TYPE       DEFAULT NULL,
  p_use_department            IN         users.use_department%TYPE                 DEFAULT NULL,
  p_use_message               IN         users.use_message%TYPE                    DEFAULT NULL,
  p_use_create_use_code       IN         users.use_create_use_code%TYPE            DEFAULT 99999 ,
  p_use_creation_date         IN         users.use_creation_date%TYPE              DEFAULT SYSDATE );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY users%ROWTYPE);

-- !! Essayer de ne plus utiliser --
FUNCTION FIND_USE_WHS_CODE_FUNC(
	p_use_code IN NUMBER
)
RETURN VARCHAR2;

-- !! Essayer de ne plus utiliser --
FUNCTION FIND_USE_NAME_FUNC(
	p_use_code 								IN NUMBER,
	p_last_name_first_switch 	IN NUMBER DEFAULT 1
)
RETURN VARCHAR2;

-- !! Essayer de ne plus utiliser --
FUNCTION FIND_USE_PRN_ID(
	p_use_code IN NUMBER
)
RETURN NUMBER;

END USE_PACK;
/