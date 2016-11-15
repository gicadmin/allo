CREATE OR REPLACE PACKAGE phenix.PAL_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pallet_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pal_code                       IN         pallet_types.pal_code%TYPE,
  p_pal_rec                        OUT NOCOPY pallet_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pal_code                       IN         pallet_types.pal_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pal_code                       IN         pallet_types.pal_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pal_code                       IN         pallet_types.pal_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pal_code                       IN         pallet_types.pal_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pal_code                       IN         pallet_types.pal_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pal_code                    IN         pallet_types.pal_code%TYPE,
  p_pal_description             IN         pallet_types.pal_description%TYPE,
  p_pal_alt_description         IN         pallet_types.pal_alt_description%TYPE              DEFAULT NULL,
  p_pal_pallet_price            IN         pallet_types.pal_pallet_price%TYPE                 DEFAULT 0 ,
  p_pal_provincial_tax_switch   IN         pallet_types.pal_provincial_tax_switch%TYPE        DEFAULT 0 ,
  p_pal_federal_tax_switch      IN         pallet_types.pal_federal_tax_switch%TYPE           DEFAULT 0 ,
  p_pal_invoice_vendor_switch   IN         pallet_types.pal_invoice_vendor_switch%TYPE        DEFAULT 0 ,
  p_pal_invoice_customer_switch IN         pallet_types.pal_invoice_customer_switch%TYPE      DEFAULT 0 ,
  p_pal_invoice_carrier_switch  IN         pallet_types.pal_invoice_carrier_switch%TYPE       DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY pallet_types%ROWTYPE);

  FUNCTION DO_PAL_EXISTS_FUNC(
  p_pal_code IN pallet_types.pal_code%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_PAL_DESCRIPTION_FUNC(
  p_pal_code IN pallet_types.pal_code%TYPE,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

END PAL_PACK;
/