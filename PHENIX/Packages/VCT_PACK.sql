CREATE OR REPLACE PACKAGE phenix.VCT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_credit_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vct_code                       IN         vendor_credit_types.vct_code%TYPE,
  p_vct_rec                        OUT NOCOPY vendor_credit_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vct_code                       IN         vendor_credit_types.vct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vct_code                       IN         vendor_credit_types.vct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_vct_code                       IN         vendor_credit_types.vct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vct_code                       IN         vendor_credit_types.vct_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vct_code                       IN         vendor_credit_types.vct_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vct_code                       IN         vendor_credit_types.vct_code%TYPE,
  p_vct_description                IN         vendor_credit_types.vct_description%TYPE,
  p_vct_pick_switch                IN         vendor_credit_types.vct_pick_switch%TYPE,
  p_vct_damage_switch              IN         vendor_credit_types.vct_damage_switch%TYPE,
  p_vct_price_source               IN         vendor_credit_types.vct_price_source%TYPE,
  p_vct_formats_allowed_switch     IN         vendor_credit_types.vct_formats_allowed_switch%TYPE,
  p_vct_alt_description            IN         vendor_credit_types.vct_alt_description%TYPE                 DEFAULT NULL,
  p_vct_gl_account                 IN         vendor_credit_types.vct_gl_account%TYPE                      DEFAULT NULL,
  p_vct_quantity_switch            IN         vendor_credit_types.vct_quantity_switch%TYPE                 DEFAULT 0 ,
  p_vct_include_consignment_swit   IN         vendor_credit_types.vct_include_consignment_switch%TYPE      DEFAULT 0 ,
  p_vct_admin_switch               IN         vendor_credit_types.vct_admin_switch%TYPE                    DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_credit_types%ROWTYPE);

END VCT_PACK;
/