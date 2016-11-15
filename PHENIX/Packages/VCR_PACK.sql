CREATE OR REPLACE PACKAGE phenix.VCR_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_transport_credits%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vcr_id                         IN         vendor_transport_credits.vcr_id%TYPE,
  p_vcr_rec                        OUT NOCOPY vendor_transport_credits%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vcr_id                         IN         vendor_transport_credits.vcr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vcr_id                         IN         vendor_transport_credits.vcr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vcr_id                         IN         vendor_transport_credits.vcr_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vcr_id                         IN         vendor_transport_credits.vcr_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vcr_ven_code                 IN         vendor_transport_credits.vcr_ven_code%TYPE,
  p_vcr_cus_code                 IN         vendor_transport_credits.vcr_cus_code%TYPE,
  p_vcr_cus_billed_code          IN         vendor_transport_credits.vcr_cus_billed_code%TYPE,
  p_vcr_vtr_id                   IN         vendor_transport_credits.vcr_vtr_id%TYPE,
  p_vcr_number_of_pallets        IN         vendor_transport_credits.vcr_number_of_pallets%TYPE,
  p_vcr_value                    IN         vendor_transport_credits.vcr_value%TYPE,
  p_vcr_invoiced_trans_amount    IN         vendor_transport_credits.vcr_invoiced_trans_amount%TYPE,
  p_vcr_invoiced_fuel_amount     IN         vendor_transport_credits.vcr_invoiced_fuel_amount%TYPE,
  p_vcr_vts_code                 IN         vendor_transport_credits.vcr_vts_code%TYPE,
  p_vcr_minimum_charge           IN         vendor_transport_credits.vcr_minimum_charge%TYPE,
  p_vcr_tct_code                 IN         vendor_transport_credits.vcr_tct_code%TYPE,
  p_vcr_whs_code                 IN         vendor_transport_credits.vcr_whs_code%TYPE,
  p_vcr_vtt_id                   IN         vendor_transport_credits.vcr_vtt_id%TYPE                        DEFAULT NULL,
  p_vcr_weight                   IN         vendor_transport_credits.vcr_weight%TYPE                        DEFAULT NULL,
  p_vcr_weight_uom               IN         vendor_transport_credits.vcr_weight_uom%TYPE                    DEFAULT NULL,
  p_vcr_number_of_packages       IN         vendor_transport_credits.vcr_number_of_packages%TYPE            DEFAULT NULL,
  p_vcr_message                  IN         vendor_transport_credits.vcr_message%TYPE                       DEFAULT NULL,
  p_vcr_inh_id                   IN         vendor_transport_credits.vcr_inh_id%TYPE                        DEFAULT NULL,
  p_vcr_reference_number         IN         vendor_transport_credits.vcr_reference_number%TYPE              DEFAULT NULL,
  p_vcr_vcr_id                   IN         vendor_transport_credits.vcr_vcr_id%TYPE                        DEFAULT NULL,
  p_vcr_federal_tax_rate         IN         vendor_transport_credits.vcr_federal_tax_rate%TYPE              DEFAULT 0 ,
  p_vcr_provincial_tax_rate      IN         vendor_transport_credits.vcr_provincial_tax_rate%TYPE           DEFAULT 0 ,
  p_vcr_debit_switch             IN         vendor_transport_credits.vcr_debit_switch%TYPE                  DEFAULT 0 ,
  p_vcr_fuel_federal_tax_rate    IN         vendor_transport_credits.vcr_fuel_federal_tax_rate%TYPE         DEFAULT 0 ,
  p_vcr_fuel_provincial_tax_rate IN         vendor_transport_credits.vcr_fuel_provincial_tax_rate%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_transport_credits%ROWTYPE)
RETURN NUMBER;

END VCR_PACK;
/