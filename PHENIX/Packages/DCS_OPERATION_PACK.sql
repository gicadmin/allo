CREATE OR REPLACE PACKAGE phenix.DCS_OPERATION_PACK IS

PROCEDURE GET_SURCHARGE_TAX_VALUES_PROC(
  p_dcs_cus_code           IN  drop_customer_surcharges.dcs_cus_code%TYPE,
  p_dcs_ven_code           IN  drop_customer_surcharges.dcs_ven_code%TYPE,
  p_sales_amount           IN  NUMBER,
  p_fed_tax_rate           IN  NUMBER,
  p_prov_tax_rate          IN  NUMBER,
  p_compounded_tax_switch  IN  NUMBER,
  p_dcs_surcharge_amount   OUT NUMBER,
  p_fed_tax_amount         OUT NUMBER,
  p_prov_tax_amount        OUT NUMBER
  );

PROCEDURE GET_TAX_FOR_SURCHARGE_PROC(
  p_dcs_cus_code           IN  drop_customer_surcharges.dcs_cus_code%TYPE,
  p_dcs_ven_code           IN  drop_customer_surcharges.dcs_ven_code%TYPE,
  p_dcs_surcharge_amount   IN NUMBER,
  p_fed_tax_amount         OUT NUMBER,
  p_prov_tax_amount        OUT NUMBER
 );

FUNCTION EXISTS_DCS_FUNC (
  p_dcs_cus_code    IN         drop_customer_surcharges.dcs_cus_code%TYPE,
  p_dcs_ven_code    IN         drop_customer_surcharges.dcs_ven_code%TYPE
  ) RETURN BOOLEAN ;

END DCS_OPERATION_PACK;
/