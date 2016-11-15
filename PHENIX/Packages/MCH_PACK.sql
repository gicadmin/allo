CREATE OR REPLACE PACKAGE phenix.MCH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  miscellaneous_charge_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_mch_id                         IN         miscellaneous_charge_headers.mch_id%TYPE,
  p_mch_rec                        OUT NOCOPY miscellaneous_charge_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_mch_id                         IN         miscellaneous_charge_headers.mch_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mch_id                         IN         miscellaneous_charge_headers.mch_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_mch_id                         IN         miscellaneous_charge_headers.mch_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_mch_id                         IN         miscellaneous_charge_headers.mch_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_mch_id                         IN         miscellaneous_charge_headers.mch_id%TYPE);


FUNCTION INSERT_FUNC(
  p_mch_type             IN         miscellaneous_charge_headers.mch_type%TYPE,
  p_mch_whs_code         IN         miscellaneous_charge_headers.mch_whs_code%TYPE,
  p_mch_date             IN         miscellaneous_charge_headers.mch_date%TYPE,
  p_mch_use_code         IN         miscellaneous_charge_headers.mch_use_code%TYPE,
  p_mch_cus_code         IN         miscellaneous_charge_headers.mch_cus_code%TYPE              DEFAULT NULL,
  p_mch_cus_payable_code IN         miscellaneous_charge_headers.mch_cus_payable_code%TYPE      DEFAULT NULL,
  p_mch_ven_code         IN         miscellaneous_charge_headers.mch_ven_code%TYPE              DEFAULT NULL,
  p_mch_ven_payable_code IN         miscellaneous_charge_headers.mch_ven_payable_code%TYPE      DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY miscellaneous_charge_headers%ROWTYPE)
RETURN NUMBER;

END MCH_PACK;
/