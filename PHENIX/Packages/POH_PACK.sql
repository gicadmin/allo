CREATE OR REPLACE PACKAGE phenix.POH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  purchase_order_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_poh_id                         IN         purchase_order_headers.poh_id%TYPE,
  p_poh_rec                        OUT NOCOPY purchase_order_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_poh_id                         IN         purchase_order_headers.poh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_poh_id                         IN         purchase_order_headers.poh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_poh_id                         IN         purchase_order_headers.poh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_poh_id                         IN         purchase_order_headers.poh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_poh_id                         IN         purchase_order_headers.poh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_poh_use_code                   IN         purchase_order_headers.poh_use_code%TYPE,
  p_poh_ven_to_pay_code            IN         purchase_order_headers.poh_ven_to_pay_code%TYPE,
  p_poh_ven_purchase_code          IN         purchase_order_headers.poh_ven_purchase_code%TYPE,
  p_poh_expected_recep_date        IN         purchase_order_headers.poh_expected_recep_date%TYPE,
  p_poh_order_date                 IN         purchase_order_headers.poh_order_date%TYPE,
  p_poh_prebook_switch             IN         purchase_order_headers.poh_prebook_switch%TYPE,
  p_poh_status                     IN         purchase_order_headers.poh_status%TYPE,
  p_poh_transport_cost             IN         purchase_order_headers.poh_transport_cost%TYPE,
  p_poh_whs_code                   IN         purchase_order_headers.poh_whs_code%TYPE,
  p_poh_prv_code                   IN         purchase_order_headers.poh_prv_code%TYPE                        DEFAULT NULL,
  p_poh_cancel_date                IN         purchase_order_headers.poh_cancel_date%TYPE                     DEFAULT NULL,
  p_poh_message                    IN         purchase_order_headers.poh_message%TYPE                         DEFAULT NULL,
  p_poh_pickup_address             IN         purchase_order_headers.poh_pickup_address%TYPE                  DEFAULT NULL,
  p_poh_pickup_city                IN         purchase_order_headers.poh_pickup_city%TYPE                     DEFAULT NULL,
  p_poh_pickup_postal_code         IN         purchase_order_headers.poh_pickup_postal_code%TYPE              DEFAULT NULL,
  p_poh_sent_date                  IN         purchase_order_headers.poh_sent_date%TYPE                       DEFAULT NULL,
  p_poh_original_delivery_date     IN         purchase_order_headers.poh_original_delivery_date%TYPE          DEFAULT NULL,
  p_poh_pickup_reference           IN         purchase_order_headers.poh_pickup_reference%TYPE                DEFAULT NULL,
  p_poh_cus_po_number              IN         purchase_order_headers.poh_cus_po_number%TYPE                   DEFAULT NULL,
  p_poh_inh_id                     IN         purchase_order_headers.poh_inh_id%TYPE                          DEFAULT NULL,
  p_poh_unloaded_packages_charge   IN         purchase_order_headers.poh_unloaded_packages_charged%TYPE       DEFAULT NULL,
  p_poh_reception_charge           IN         purchase_order_headers.poh_reception_charge%TYPE                DEFAULT NULL,
  p_poh_indirect_delivery_switch   IN         purchase_order_headers.poh_indirect_delivery_switch%TYPE        DEFAULT 0 ,
  p_poh_pickup_switch              IN         purchase_order_headers.poh_pickup_switch%TYPE                   DEFAULT 0 ,
  p_poh_division_order_switch      IN         purchase_order_headers.poh_division_order_switch%TYPE           DEFAULT 0 ,
  p_poh_reopened_switch            IN         purchase_order_headers.poh_reopened_switch%TYPE                 DEFAULT 0 ,
  p_poh_is_send_switch             IN         purchase_order_headers.poh_is_send_switch%TYPE                  DEFAULT 0 ,
  p_poh_created_on_receipt_switc   IN         purchase_order_headers.poh_created_on_receipt_switch%TYPE       DEFAULT 0 ,
  p_poh_inventory_avalability_da   IN         purchase_order_headers.poh_inventory_avalability_date%TYPE      DEFAULT trunc(SYSDATE) )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY purchase_order_headers%ROWTYPE)
RETURN NUMBER;


-----------------------------------
FUNCTION GET_POH_OR_CAH_ID_FUNC RETURN NUMBER;
----
FUNCTION GET_FULL_POH_FUNC(
  p_poh_id      IN purchase_order_headers.poh_id%TYPE,
  p_poh_record  OUT purchase_order_headers%ROWTYPE
)
RETURN BOOLEAN;

END POH_PACK;
/