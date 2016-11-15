CREATE OR REPLACE PACKAGE phenix.RCL_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  retail_clients%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rcl_naz_nac_code               IN         retail_clients.rcl_naz_nac_code%TYPE,
  p_rcl_nac_client_code            IN         retail_clients.rcl_nac_client_code%TYPE,
  p_rcl_rec                        OUT NOCOPY retail_clients%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rcl_naz_nac_code               IN         retail_clients.rcl_naz_nac_code%TYPE,
  p_rcl_nac_client_code            IN         retail_clients.rcl_nac_client_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rcl_naz_nac_code               IN         retail_clients.rcl_naz_nac_code%TYPE,
  p_rcl_nac_client_code            IN         retail_clients.rcl_nac_client_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rcl_naz_nac_code               IN         retail_clients.rcl_naz_nac_code%TYPE,
  p_rcl_nac_client_code            IN         retail_clients.rcl_nac_client_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rcl_naz_nac_code               IN         retail_clients.rcl_naz_nac_code%TYPE,
  p_rcl_nac_client_code            IN         retail_clients.rcl_nac_client_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rcl_naz_nac_code               IN         retail_clients.rcl_naz_nac_code%TYPE,
  p_rcl_nac_client_code            IN         retail_clients.rcl_nac_client_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_rcl_id                         IN         retail_clients.rcl_id%TYPE,
  p_rcl_rec                        OUT NOCOPY retail_clients%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rcl_id                         IN         retail_clients.rcl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rcl_id                         IN         retail_clients.rcl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rcl_id                         IN         retail_clients.rcl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rcl_id                         IN         retail_clients.rcl_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rcl_id                         IN         retail_clients.rcl_id%TYPE);


FUNCTION INSERT_FUNC(
  p_rcl_name                  IN         retail_clients.rcl_name%TYPE,
  p_rcl_address               IN         retail_clients.rcl_address%TYPE,
  p_rcl_city                  IN         retail_clients.rcl_city%TYPE,
  p_rcl_prv_code              IN         retail_clients.rcl_prv_code%TYPE,
  p_rcl_postal_code           IN         retail_clients.rcl_postal_code%TYPE,
  p_rcl_telephone             IN         retail_clients.rcl_telephone%TYPE,
  p_rcl_contact_name          IN         retail_clients.rcl_contact_name%TYPE,
  p_rcl_nac_client_code       IN         retail_clients.rcl_nac_client_code%TYPE            DEFAULT NULL,
  p_rcl_email                 IN         retail_clients.rcl_email%TYPE                      DEFAULT NULL,
  p_rcl_fax_number            IN         retail_clients.rcl_fax_number%TYPE                 DEFAULT NULL,
  p_rcl_message               IN         retail_clients.rcl_message%TYPE                    DEFAULT NULL,
  p_rcl_naz_nac_code          IN         retail_clients.rcl_naz_nac_code%TYPE               DEFAULT NULL,
  p_rcl_naz_zone_code         IN         retail_clients.rcl_naz_zone_code%TYPE              DEFAULT NULL,
  p_rcl_qty_code              IN         retail_clients.rcl_qty_code%TYPE                   DEFAULT NULL,
  p_rcl_deletion_date         IN         retail_clients.rcl_deletion_date%TYPE              DEFAULT NULL,
  p_rcl_rlt_code              IN         retail_clients.rcl_rlt_code%TYPE                   DEFAULT NULL,
  p_rcl_rcm_code              IN         retail_clients.rcl_rcm_code%TYPE                   DEFAULT NULL,
  p_rcl_terms                 IN         retail_clients.rcl_terms%TYPE                      DEFAULT NULL,
  p_rcl_open_quotation_switch IN         retail_clients.rcl_open_quotation_switch%TYPE      DEFAULT 1 ,
  p_rcl_creation_date         IN         retail_clients.rcl_creation_date%TYPE              DEFAULT sysdate ,
  p_rcl_modification_date     IN         retail_clients.rcl_modification_date%TYPE          DEFAULT sysdate ,
  p_rcl_owner_type            IN         retail_clients.rcl_owner_type%TYPE                 DEFAULT 'I' )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY retail_clients%ROWTYPE)
RETURN NUMBER;


END RCL_PACK;
/