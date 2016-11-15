CREATE OR REPLACE PACKAGE phenix.RMC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  recurring_misc_charges%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rmc_id                         IN         recurring_misc_charges.rmc_id%TYPE,
  p_rmc_rec                        OUT NOCOPY recurring_misc_charges%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rmc_id                         IN         recurring_misc_charges.rmc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rmc_id                         IN         recurring_misc_charges.rmc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rmc_id                         IN         recurring_misc_charges.rmc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rmc_id                         IN         recurring_misc_charges.rmc_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rmc_id                         IN         recurring_misc_charges.rmc_id%TYPE);


FUNCTION INSERT_FUNC(
  p_rmc_mct_code           IN         recurring_misc_charges.rmc_mct_code%TYPE,
  p_rmc_whs_code           IN         recurring_misc_charges.rmc_whs_code%TYPE,
  p_rmc_amount             IN         recurring_misc_charges.rmc_amount%TYPE,
  p_rmc_federal_tax        IN         recurring_misc_charges.rmc_federal_tax%TYPE,
  p_rmc_provincial_tax     IN         recurring_misc_charges.rmc_provincial_tax%TYPE,
  p_rmc_billing_method     IN         recurring_misc_charges.rmc_billing_method%TYPE,
  p_rmc_cus_code           IN         recurring_misc_charges.rmc_cus_code%TYPE                DEFAULT NULL,
  p_rmc_cus_payable_code   IN         recurring_misc_charges.rmc_cus_payable_code%TYPE        DEFAULT NULL,
  p_rmc_ven_code           IN         recurring_misc_charges.rmc_ven_code%TYPE                DEFAULT NULL,
  p_rmc_ven_payable_code   IN         recurring_misc_charges.rmc_ven_payable_code%TYPE        DEFAULT NULL,
  p_rmc_reference_number   IN         recurring_misc_charges.rmc_reference_number%TYPE        DEFAULT NULL,
  p_rmc_billing_cycle      IN         recurring_misc_charges.rmc_billing_cycle%TYPE           DEFAULT NULL,
  p_rmc_date_last_billed   IN         recurring_misc_charges.rmc_date_last_billed%TYPE        DEFAULT NULL,
  p_rmc_recurring_end_date IN         recurring_misc_charges.rmc_recurring_end_date%TYPE      DEFAULT NULL,
  p_rmc_message            IN         recurring_misc_charges.rmc_message%TYPE                 DEFAULT NULL,
  p_rmc_creation_date      IN         recurring_misc_charges.rmc_creation_date%TYPE           DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY recurring_misc_charges%ROWTYPE)
RETURN NUMBER;

END RMC_PACK;
/