CREATE OR REPLACE PACKAGE phenix.PWO_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  public_whse_owners%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pwo_code                       IN         public_whse_owners.pwo_code%TYPE,
  p_pwo_rec                        OUT NOCOPY public_whse_owners%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwo_code                       IN         public_whse_owners.pwo_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwo_code                       IN         public_whse_owners.pwo_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pwo_code                       IN         public_whse_owners.pwo_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwo_code                       IN         public_whse_owners.pwo_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwo_code                       IN         public_whse_owners.pwo_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pwo_code                      IN         public_whse_owners.pwo_code%TYPE,
  p_pwo_name                      IN         public_whse_owners.pwo_name%TYPE,
  p_pwo_address                   IN         public_whse_owners.pwo_address%TYPE,
  p_pwo_city                      IN         public_whse_owners.pwo_city%TYPE,
  p_pwo_prv_code                  IN         public_whse_owners.pwo_prv_code%TYPE,
  p_pwo_postal_code               IN         public_whse_owners.pwo_postal_code%TYPE,
  p_pwo_alt_name                  IN         public_whse_owners.pwo_alt_name%TYPE                       DEFAULT NULL,
  p_pwo_telephone                 IN         public_whse_owners.pwo_telephone%TYPE                      DEFAULT NULL,
  p_pwo_fax                       IN         public_whse_owners.pwo_fax%TYPE                            DEFAULT NULL,
  p_pwo_enterprise_identificatio  IN         public_whse_owners.pwo_enterprise_identification%TYPE      DEFAULT NULL,
  p_pwo_edi_switch                IN         public_whse_owners.pwo_edi_switch%TYPE                     DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY public_whse_owners%ROWTYPE);

END PWO_PACK;
/