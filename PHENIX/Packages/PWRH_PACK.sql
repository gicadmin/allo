CREATE OR REPLACE PACKAGE phenix.PWRH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  public_whse_receipt_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pwrh_id                        IN         public_whse_receipt_headers.pwrh_id%TYPE,
  p_pwrh_rec                       OUT NOCOPY public_whse_receipt_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pwrh_id                        IN         public_whse_receipt_headers.pwrh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwrh_id                        IN         public_whse_receipt_headers.pwrh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwrh_id                        IN         public_whse_receipt_headers.pwrh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwrh_id                        IN         public_whse_receipt_headers.pwrh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwrh_id                        IN         public_whse_receipt_headers.pwrh_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pwrh_pwo_code                  IN         public_whse_receipt_headers.pwrh_pwo_code%TYPE,
  p_pwrh_receipt_number            IN         public_whse_receipt_headers.pwrh_receipt_number%TYPE,
  p_pwrh_rec                       OUT NOCOPY public_whse_receipt_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pwrh_pwo_code                  IN         public_whse_receipt_headers.pwrh_pwo_code%TYPE,
  p_pwrh_receipt_number            IN         public_whse_receipt_headers.pwrh_receipt_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwrh_pwo_code                  IN         public_whse_receipt_headers.pwrh_pwo_code%TYPE,
  p_pwrh_receipt_number            IN         public_whse_receipt_headers.pwrh_receipt_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwrh_pwo_code                  IN         public_whse_receipt_headers.pwrh_pwo_code%TYPE,
  p_pwrh_receipt_number            IN         public_whse_receipt_headers.pwrh_receipt_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwrh_pwo_code                  IN         public_whse_receipt_headers.pwrh_pwo_code%TYPE,
  p_pwrh_receipt_number            IN         public_whse_receipt_headers.pwrh_receipt_number%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwrh_pwo_code                  IN         public_whse_receipt_headers.pwrh_pwo_code%TYPE,
  p_pwrh_receipt_number            IN         public_whse_receipt_headers.pwrh_receipt_number%TYPE);


FUNCTION INSERT_FUNC(
  p_pwrh_pwo_code               IN         public_whse_receipt_headers.pwrh_pwo_code%TYPE,
  p_pwrh_whs_code               IN         public_whse_receipt_headers.pwrh_whs_code%TYPE,
  p_pwrh_receipt_number         IN         public_whse_receipt_headers.pwrh_receipt_number%TYPE,
  p_pwrh_po_number              IN         public_whse_receipt_headers.pwrh_po_number%TYPE                   DEFAULT NULL,
  p_pwrh_project_reception_date IN         public_whse_receipt_headers.pwrh_project_reception_date%TYPE      DEFAULT NULL,
  p_pwrh_site_number            IN         public_whse_receipt_headers.pwrh_site_number%TYPE                 DEFAULT NULL,
  p_pwrh_account_id             IN         public_whse_receipt_headers.pwrh_account_id%TYPE                  DEFAULT NULL,
  p_pwrh_enterprise_name        IN         public_whse_receipt_headers.pwrh_enterprise_name%TYPE             DEFAULT NULL,
  p_pwrh_address                IN         public_whse_receipt_headers.pwrh_address%TYPE                     DEFAULT NULL,
  p_pwrh_city                   IN         public_whse_receipt_headers.pwrh_city%TYPE                        DEFAULT NULL,
  p_pwrh_prv_code               IN         public_whse_receipt_headers.pwrh_prv_code%TYPE                    DEFAULT NULL,
  p_pwrh_postal_code            IN         public_whse_receipt_headers.pwrh_postal_code%TYPE                 DEFAULT NULL,
  p_pwrh_transport_method       IN         public_whse_receipt_headers.pwrh_transport_method%TYPE            DEFAULT NULL,
  p_pwrh_scac_code              IN         public_whse_receipt_headers.pwrh_scac_code%TYPE                   DEFAULT NULL,
  p_pwrh_seal_number            IN         public_whse_receipt_headers.pwrh_seal_number%TYPE                 DEFAULT NULL,
  p_pwrh_seal_status            IN         public_whse_receipt_headers.pwrh_seal_status%TYPE                 DEFAULT NULL,
  p_pwrh_creation_date          IN         public_whse_receipt_headers.pwrh_creation_date%TYPE               DEFAULT SYSDATE ,
  p_pwrh_closed_switch          IN         public_whse_receipt_headers.pwrh_closed_switch%TYPE               DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY public_whse_receipt_headers%ROWTYPE)
RETURN NUMBER;

END PWRH_PACK;
/