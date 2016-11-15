CREATE OR REPLACE PACKAGE phenix.MCD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  miscellaneous_charge_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_mcd_id                         IN         miscellaneous_charge_details.mcd_id%TYPE,
  p_mcd_rec                        OUT NOCOPY miscellaneous_charge_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mcd_id                         IN         miscellaneous_charge_details.mcd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_mcd_id                         IN         miscellaneous_charge_details.mcd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_mcd_id                         IN         miscellaneous_charge_details.mcd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_mcd_id                         IN         miscellaneous_charge_details.mcd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_mcd_mch_id                IN         miscellaneous_charge_details.mcd_mch_id%TYPE,
  p_mcd_mct_code              IN         miscellaneous_charge_details.mcd_mct_code%TYPE,
  p_mcd_retail_amount         IN         miscellaneous_charge_details.mcd_retail_amount%TYPE,
  p_mcd_federal_tax_amount    IN         miscellaneous_charge_details.mcd_federal_tax_amount%TYPE,
  p_mcd_provincial_tax_amount IN         miscellaneous_charge_details.mcd_provincial_tax_amount%TYPE,
  p_mcd_automatic_switch      IN         miscellaneous_charge_details.mcd_automatic_switch%TYPE,
  p_mcd_reference_number      IN         miscellaneous_charge_details.mcd_reference_number%TYPE           DEFAULT NULL,
  p_mcd_message               IN         miscellaneous_charge_details.mcd_message%TYPE                    DEFAULT NULL,
  p_mcd_inh_id                IN         miscellaneous_charge_details.mcd_inh_id%TYPE                     DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY miscellaneous_charge_details%ROWTYPE)
RETURN NUMBER;

END MCD_PACK;
/