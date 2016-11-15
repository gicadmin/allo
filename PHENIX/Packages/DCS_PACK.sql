CREATE OR REPLACE PACKAGE phenix.DCS_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  drop_customer_surcharges%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dcs_cus_code                   IN         drop_customer_surcharges.dcs_cus_code%TYPE,
  p_dcs_ven_code                   IN         drop_customer_surcharges.dcs_ven_code%TYPE,
  p_dcs_rec                        OUT NOCOPY drop_customer_surcharges%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dcs_cus_code                   IN         drop_customer_surcharges.dcs_cus_code%TYPE,
  p_dcs_ven_code                   IN         drop_customer_surcharges.dcs_ven_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_dcs_cus_code                   IN         drop_customer_surcharges.dcs_cus_code%TYPE,
  p_dcs_ven_code                   IN         drop_customer_surcharges.dcs_ven_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dcs_cus_code                   IN         drop_customer_surcharges.dcs_cus_code%TYPE,
  p_dcs_ven_code                   IN         drop_customer_surcharges.dcs_ven_code%TYPE);


PROCEDURE INSERT_PROC(
  p_dcs_ven_code              IN         drop_customer_surcharges.dcs_ven_code%TYPE,
  p_dcs_cus_code              IN         drop_customer_surcharges.dcs_cus_code%TYPE,
  p_dcs_surcharge_amount      IN         drop_customer_surcharges.dcs_surcharge_amount%TYPE           DEFAULT NULL,
  p_dcs_surcharge_percent     IN         drop_customer_surcharges.dcs_surcharge_percent%TYPE          DEFAULT NULL,
  p_dcs_federal_tax_switch    IN         drop_customer_surcharges.dcs_federal_tax_switch%TYPE         DEFAULT 0 ,
  p_dcs_provincial_tax_switch IN         drop_customer_surcharges.dcs_provincial_tax_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY drop_customer_surcharges%ROWTYPE);

END DCS_PACK;
/