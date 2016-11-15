CREATE OR REPLACE PACKAGE phenix.VTT_OPERATION_PACK IS


FUNCTION EXIST_VTR_NOT_INVOICED_FUNC (
  p_vtr_id                     IN vendor_transport_transactions.vtt_id%TYPE --GCL8156
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_inh_id                    IN INVOICE_HEADERS.INH_ID%type
);

PROCEDURE PREP_PRINT_INVOICE_PROC(
  p_jsc_id  job_schedules.jsc_id%TYPE
);

PROCEDURE UPDATE_VTT_INTERFACE_PROC(
  p_vtt_id                        IN vendor_transport_transactions.vtt_id%TYPE,
  p_vtt_shipped_switch            IN vendor_transport_transactions.vtt_shipped_switch%TYPE,
  p_vtt_doc_id                    IN vendor_transport_transactions.vtt_doc_id%TYPE,
  p_vtt_path_img_original         IN vendor_transport_transactions.vtt_path_img_original%TYPE,
  p_vtt_path_img_updated          IN vendor_transport_transactions.vtt_path_img_updated%TYPE,
  p_vtt_path_img_signed           IN vendor_transport_transactions.vtt_path_img_signed%TYPE,
  p_vtt_stamp_switch              IN vendor_transport_transactions.vtt_stamp_switch%TYPE,
  p_vtt_signed_switch             IN vendor_transport_transactions.vtt_signed_switch%TYPE,
  p_vtt_exception_switch          IN vendor_transport_transactions.vtt_exception_switch%TYPE,
  p_vtt_page_missed               IN vendor_transport_transactions.vtt_page_missed%TYPE,
  p_vtt_path_img_original_print   IN vendor_transport_transactions.vtt_path_img_original_print%TYPE,
  p_vtt_path_img_updated_print    IN vendor_transport_transactions.vtt_path_img_updated_print%TYPE,
  p_vtt_number_of_pallets         IN vendor_transport_transactions.vtt_number_of_pallets%TYPE DEFAULT NULL,
  p_vtt_number_of_packages        IN vendor_transport_transactions.vtt_number_of_packages%TYPE DEFAULT NULL,
  p_vtt_value                     IN vendor_transport_transactions.vtt_value%TYPE DEFAULT NULL,
  p_vtt_weight                    IN vendor_transport_transactions.vtt_weight%TYPE  DEFAULT NULL,
  p_vtt_weight_uom                IN vendor_transport_transactions.vtt_weight_uom%TYPE  DEFAULT NULL ,
  p_vtt_volume                   IN vendor_transport_transactions.vtt_volume%TYPE  DEFAULT NULL
);

PROCEDURE update_shipped_switch_proc(
  p_vtt_id     IN     vendor_transport_transactions.vtt_id%TYPE,
  p_lang_code  IN     VARCHAR2,
  p_error_code IN OUT error_codes.ccr_code%TYPE,
  p_error_msg  IN OUT error_codes.ccr_message%TYPE
);

FUNCTION GET_VTT_DOCUMENTS_FUNC(
  p_vtt_id    IN  vendor_transport_transactions.vtt_id%TYPE,
  p_doc_code  IN  VARCHAR2
)
RETURN BLOB;

FUNCTION EXIST_VTT_FOR_CUSTOMER_FUNC(
  p_tec_ven_code              IN TRANSPORTER_REF_CUSTOMERS.tec_ven_code%TYPE,
  p_tec_cus_transporter_code  IN TRANSPORTER_REF_CUSTOMERS.tec_cus_transporter_code%TYPE,
  p_tec_cus_code              IN TRANSPORTER_REF_CUSTOMERS.tec_cus_code %TYPE
)
RETURN NUMBER;

PROCEDURE CHECK_VTT_FOR_CUSTOMER_PROC(
  p_tec_ven_code              IN TRANSPORTER_REF_CUSTOMERS.tec_ven_code%TYPE,
  p_tec_cus_transporter_code  IN TRANSPORTER_REF_CUSTOMERS.tec_cus_transporter_code%TYPE,
  p_tec_cus_code              IN TRANSPORTER_REF_CUSTOMERS.tec_cus_code %TYPE
);

FUNCTION EXIST_REF_NUMBER_FUNC (
  p_vtt_billed_cus_code  IN vendor_transport_transactions.vtt_billed_cus_code%TYPE,
  p_vtt_delivery_date    IN vendor_transport_transactions.vtt_delivery_date%TYPE,
  p_vtt_reference_number IN vendor_transport_transactions.vtt_reference_number%TYPE,
  p_vtt_id               IN vendor_transport_transactions.vtt_id%TYPE)
  RETURN BOOLEAN;

FUNCTION EXIST_CUS_CODE_FUNC(
  p_vtt_cus_code  IN vendor_transport_transactions.vtt_cus_code%TYPE
)
RETURN BOOLEAN;

FUNCTION EXISTS_CUS_ROU_DATE_FUNC(
  p_vtt_cus_code       IN vendor_transport_transactions.vtt_cus_code%TYPE,
  p_vtt_rou_code       IN vendor_transport_transactions.vtt_rou_code%type,
  p_vtt_delivery_date  IN vendor_transport_transactions.vtt_delivery_date%type
)
RETURN BOOLEAN;

FUNCTION  set_route_func(
  p_delivery_date                 IN      customer_order_details.cod_project_delivery_date%TYPE,
  p_cus_code                      IN      customers.cus_code%TYPE,
  p_rou_code                      IN      routes.rou_code%TYPE,
  p_rod_position                  IN      ROUTE_DATES.ROD_POSITION%TYPE)
  RETURN NUMBER; -- 0 = no transport where changed, 1 = 1 or more transport where changed


END VTT_OPERATION_PACK;
/