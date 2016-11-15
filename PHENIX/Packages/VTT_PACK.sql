CREATE OR REPLACE PACKAGE phenix.VTT_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_transport_transactions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vtt_id                         IN         vendor_transport_transactions.vtt_id%TYPE,
  p_vtt_rec                        OUT NOCOPY vendor_transport_transactions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vtt_id                         IN         vendor_transport_transactions.vtt_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vtt_id                         IN         vendor_transport_transactions.vtt_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vtt_id                         IN         vendor_transport_transactions.vtt_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vtt_id                         IN         vendor_transport_transactions.vtt_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vtt_id                         IN         vendor_transport_transactions.vtt_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_vtt_billed_cus_code            IN         vendor_transport_transactions.vtt_billed_cus_code%TYPE,
  p_vtt_delivery_date              IN         vendor_transport_transactions.vtt_delivery_date%TYPE,
  p_vtt_reference_number           IN         vendor_transport_transactions.vtt_reference_number%TYPE,
  p_vtt_rec                        OUT NOCOPY vendor_transport_transactions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vtt_billed_cus_code            IN         vendor_transport_transactions.vtt_billed_cus_code%TYPE,
  p_vtt_delivery_date              IN         vendor_transport_transactions.vtt_delivery_date%TYPE,
  p_vtt_reference_number           IN         vendor_transport_transactions.vtt_reference_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vtt_billed_cus_code            IN         vendor_transport_transactions.vtt_billed_cus_code%TYPE,
  p_vtt_delivery_date              IN         vendor_transport_transactions.vtt_delivery_date%TYPE,
  p_vtt_reference_number           IN         vendor_transport_transactions.vtt_reference_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vtt_billed_cus_code            IN         vendor_transport_transactions.vtt_billed_cus_code%TYPE,
  p_vtt_delivery_date              IN         vendor_transport_transactions.vtt_delivery_date%TYPE,
  p_vtt_reference_number           IN         vendor_transport_transactions.vtt_reference_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vtt_billed_cus_code            IN         vendor_transport_transactions.vtt_billed_cus_code%TYPE,
  p_vtt_delivery_date              IN         vendor_transport_transactions.vtt_delivery_date%TYPE,
  p_vtt_reference_number           IN         vendor_transport_transactions.vtt_reference_number%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vtt_billed_cus_code            IN         vendor_transport_transactions.vtt_billed_cus_code%TYPE,
  p_vtt_delivery_date              IN         vendor_transport_transactions.vtt_delivery_date%TYPE,
  p_vtt_reference_number           IN         vendor_transport_transactions.vtt_reference_number%TYPE);


FUNCTION INSERT_FUNC(
  p_vtt_ven_code                 IN         vendor_transport_transactions.vtt_ven_code%TYPE,
  p_vtt_cus_code                 IN         vendor_transport_transactions.vtt_cus_code%TYPE,
  p_vtt_billed_cus_code          IN         vendor_transport_transactions.vtt_billed_cus_code%TYPE,
  p_vtt_delivery_date            IN         vendor_transport_transactions.vtt_delivery_date%TYPE,
  p_vtt_reference_number         IN         vendor_transport_transactions.vtt_reference_number%TYPE,
  p_vtt_vts_code                 IN         vendor_transport_transactions.vtt_vts_code%TYPE,
  p_vtt_vtr_id                   IN         vendor_transport_transactions.vtt_vtr_id%TYPE,
  p_vtt_rou_code                 IN         vendor_transport_transactions.vtt_rou_code%TYPE,
  p_vtt_position                 IN         vendor_transport_transactions.vtt_position%TYPE,
  p_vtt_weight                   IN         vendor_transport_transactions.vtt_weight%TYPE,
  p_vtt_weight_uom               IN         vendor_transport_transactions.vtt_weight_uom%TYPE,
  p_vtt_number_of_packages       IN         vendor_transport_transactions.vtt_number_of_packages%TYPE,
  p_vtt_value                    IN         vendor_transport_transactions.vtt_value%TYPE,
  p_vtt_number_of_stickers       IN         vendor_transport_transactions.vtt_number_of_stickers%TYPE,
  p_vtt_whs_code                 IN         vendor_transport_transactions.vtt_whs_code%TYPE,
  p_vtt_volume                   IN         vendor_transport_transactions.vtt_volume%TYPE,
  p_vtt_number_of_pallets        IN         vendor_transport_transactions.vtt_number_of_pallets%TYPE             DEFAULT NULL,
  p_vtt_message                  IN         vendor_transport_transactions.vtt_message%TYPE                       DEFAULT NULL,
  p_vtt_inh_id                   IN         vendor_transport_transactions.vtt_inh_id%TYPE                        DEFAULT NULL,
  p_vtt_invoiced_fuel_amount     IN         vendor_transport_transactions.vtt_invoiced_fuel_amount%TYPE          DEFAULT NULL,
  p_vtt_vtr_invoicing_method     IN         vendor_transport_transactions.vtt_vtr_invoicing_method%TYPE          DEFAULT NULL,
  p_vtt_vtr_fixed_amount         IN         vendor_transport_transactions.vtt_vtr_fixed_amount%TYPE              DEFAULT NULL,
  p_vtt_vtr_minimum_charge       IN         vendor_transport_transactions.vtt_vtr_minimum_charge%TYPE            DEFAULT NULL,
  p_vtt_vtr_min_charge_method    IN         vendor_transport_transactions.vtt_vtr_min_charge_method%TYPE         DEFAULT NULL,
  p_vtt_vtr_min_charge_grouping  IN         vendor_transport_transactions.vtt_vtr_min_charge_grouping%TYPE       DEFAULT NULL,
  p_vtt_vtl_charge_rate          IN         vendor_transport_transactions.vtt_vtl_charge_rate%TYPE               DEFAULT NULL,
  p_vtt_doc_id                   IN         vendor_transport_transactions.vtt_doc_id%TYPE                        DEFAULT NULL,
  p_vtt_path_img_original        IN         vendor_transport_transactions.vtt_path_img_original%TYPE             DEFAULT NULL,
  p_vtt_path_img_updated         IN         vendor_transport_transactions.vtt_path_img_updated%TYPE              DEFAULT NULL,
  p_vtt_path_img_signed          IN         vendor_transport_transactions.vtt_path_img_signed%TYPE               DEFAULT NULL,
  p_vtt_page_missed              IN         vendor_transport_transactions.vtt_page_missed%TYPE                   DEFAULT NULL,
  p_vtt_path_img_original_print  IN         vendor_transport_transactions.vtt_path_img_original_print%TYPE       DEFAULT NULL,
  p_vtt_path_img_updated_print   IN         vendor_transport_transactions.vtt_path_img_updated_print%TYPE        DEFAULT NULL,
  p_vtt_receipt_switch           IN         vendor_transport_transactions.vtt_receipt_switch%TYPE                DEFAULT 1 ,
  p_vtt_shipped_switch           IN         vendor_transport_transactions.vtt_shipped_switch%TYPE                DEFAULT 0 ,
  p_vtt_invoiced_minimum_value   IN         vendor_transport_transactions.vtt_invoiced_minimum_value%TYPE        DEFAULT 0 ,
  p_vtt_invoiced_trans_amount    IN         vendor_transport_transactions.vtt_invoiced_trans_amount%TYPE         DEFAULT 0 ,
  p_vtt_skip_invoicing_switch    IN         vendor_transport_transactions.vtt_skip_invoicing_switch%TYPE         DEFAULT 0 ,
  p_vtt_federal_tax_rate         IN         vendor_transport_transactions.vtt_federal_tax_rate%TYPE              DEFAULT 0 ,
  p_vtt_provincial_tax_rate      IN         vendor_transport_transactions.vtt_provincial_tax_rate%TYPE           DEFAULT 0 ,
  p_vtt_creation_date            IN         vendor_transport_transactions.vtt_creation_date%TYPE                 DEFAULT SYSDATE ,
  p_vtt_stamp_switch             IN         vendor_transport_transactions.vtt_stamp_switch%TYPE                  DEFAULT 0 ,
  p_vtt_signed_switch            IN         vendor_transport_transactions.vtt_signed_switch%TYPE                 DEFAULT 0 ,
  p_vtt_exception_switch         IN         vendor_transport_transactions.vtt_exception_switch%TYPE              DEFAULT 0 ,
  p_vtt_fuel_federal_tax_rate    IN         vendor_transport_transactions.vtt_fuel_federal_tax_rate%TYPE         DEFAULT 0 ,
  p_vtt_fuel_provincial_tax_rate IN         vendor_transport_transactions.vtt_fuel_provincial_tax_rate%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_transport_transactions%ROWTYPE)
RETURN NUMBER;

END VTT_PACK;
/