CREATE OR REPLACE PACKAGE phenix.MCT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  miscellaneous_charge_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_mct_code                       IN         miscellaneous_charge_types.mct_code%TYPE,
  p_mct_rec                        OUT NOCOPY miscellaneous_charge_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mct_code                       IN         miscellaneous_charge_types.mct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_mct_code                       IN         miscellaneous_charge_types.mct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_mct_code                       IN         miscellaneous_charge_types.mct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_mct_code                       IN         miscellaneous_charge_types.mct_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_mct_code                       IN         miscellaneous_charge_types.mct_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_mct_remittance_type            IN         miscellaneous_charge_types.mct_remittance_type%TYPE,
  p_mct_rec                        OUT NOCOPY miscellaneous_charge_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mct_remittance_type            IN         miscellaneous_charge_types.mct_remittance_type%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_mct_remittance_type            IN         miscellaneous_charge_types.mct_remittance_type%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_mct_remittance_type            IN         miscellaneous_charge_types.mct_remittance_type%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_mct_remittance_type            IN         miscellaneous_charge_types.mct_remittance_type%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_mct_remittance_type            IN         miscellaneous_charge_types.mct_remittance_type%TYPE);


PROCEDURE INSERT_PROC(
  p_mct_code                 IN         miscellaneous_charge_types.mct_code%TYPE,
  p_mct_description          IN         miscellaneous_charge_types.mct_description%TYPE,
  p_mct_auto_calc_tax_switch IN         miscellaneous_charge_types.mct_auto_calc_tax_switch%TYPE,
  p_mct_gl_account           IN         miscellaneous_charge_types.mct_gl_account%TYPE,
  p_mct_alt_description      IN         miscellaneous_charge_types.mct_alt_description%TYPE           DEFAULT NULL,
  p_mct_remittance_type      IN         miscellaneous_charge_types.mct_remittance_type%TYPE           DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY miscellaneous_charge_types%ROWTYPE);


END MCT_PACK;
/