CREATE OR REPLACE PACKAGE phenix.TENE_OPERATION_PACK IS

FUNCTION GET_FULL_FUNC(
  p_tene_rec  OUT NOCOPY temporary_edi_ni_extract%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE GET_SUM_TENE_PROC(
  p_federal_tax_amount     OUT NUMBER,
  p_provincial_tax_amount  OUT NUMBER,
  p_invoiced_quantity      OUT NUMBER,
  p_cost_price_total       OUT NUMBER,
  p_sale_price_total       OUT NUMBER,
  p_surcharge_amount       OUT NUMBER
);

PROCEDURE UPDATE_TENE_PROC(
  p_tene_id                      IN temporary_edi_ni_extract.tene_id%TYPE,
  p_tene_invoiced_ext_price      IN temporary_edi_ni_extract.tene_invoiced_ext_price%TYPE,
  p_tene_invoiced_ext_surcharge  IN temporary_edi_ni_extract.tene_invoiced_ext_surcharge%TYPE,
  p_tene_federal_tax_amount      IN temporary_edi_ni_extract.tene_federal_tax_amount%TYPE,
  p_tene_provincial_tax_amount   IN temporary_edi_ni_extract.tene_provincial_tax_amount  %TYPE
);

END TENE_OPERATION_PACK;
/