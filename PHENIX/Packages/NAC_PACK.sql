CREATE OR REPLACE PACKAGE phenix.NAC_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  national_accounts%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_nac_code                       IN         national_accounts.nac_code%TYPE,
  p_nac_rec                        OUT NOCOPY national_accounts%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_nac_code                       IN         national_accounts.nac_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_nac_code                       IN         national_accounts.nac_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_nac_code                       IN         national_accounts.nac_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_nac_code                       IN         national_accounts.nac_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_nac_code                       IN         national_accounts.nac_code%TYPE);


PROCEDURE INSERT_PROC(
  p_nac_code                      IN         national_accounts.nac_code%TYPE,
  p_nac_description               IN         national_accounts.nac_description%TYPE,
  p_nac_admin_method              IN         national_accounts.nac_admin_method%TYPE,
  p_nac_product_identifier        IN         national_accounts.nac_product_identifier%TYPE,
  p_nac_address                   IN         national_accounts.nac_address%TYPE,
  p_nac_city                      IN         national_accounts.nac_city%TYPE,
  p_nac_prv_code                  IN         national_accounts.nac_prv_code%TYPE,
  p_nac_postal_code               IN         national_accounts.nac_postal_code%TYPE,
  p_nac_include_car_amount_switc  IN         national_accounts.nac_include_car_amount_switch%TYPE      DEFAULT 0 ,
  p_nac_prd_check_digit_switch    IN         national_accounts.nac_prd_check_digit_switch%TYPE         DEFAULT 0 ,
  p_nac_alt_description           IN         national_accounts.nac_alt_description%TYPE                DEFAULT NULL,
  p_nac_telephone                 IN         national_accounts.nac_telephone%TYPE                      DEFAULT NULL,
  p_nac_fax                       IN         national_accounts.nac_fax%TYPE                            DEFAULT NULL,
  p_nac_contact_name              IN         national_accounts.nac_contact_name%TYPE                   DEFAULT NULL,
  p_nac_email                     IN         national_accounts.nac_email%TYPE                          DEFAULT NULL,
  p_nac_synchronization_id        IN         national_accounts.nac_synchronization_id%TYPE             DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY national_accounts%ROWTYPE);

FUNCTION GET_FULL_NAC_FUNC(
  p_nac_code   IN  national_accounts.nac_code%TYPE,
  p_nac_record OUT national_accounts%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_NAC_FUNC(
  p_nac_code IN national_accounts.nac_code%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_COLUMN_VALUE_VARCHAR_FUNC(
  p_column_name IN VARCHAR2,
  p_nac_code    IN national_accounts.nac_code%TYPE
)
RETURN VARCHAR2;

FUNCTION FIND_COLUMN_VALUE_NUMBER_FUNC(
  p_column_name IN VARCHAR2,
  p_nac_code    IN national_accounts.nac_code%TYPE
)
RETURN NUMBER;

END NAC_PACK;
/