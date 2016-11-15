CREATE OR REPLACE PACKAGE phenix.POD_PACK AS

FUNCTION LOCK_POD_FUNC(
	p_pod_poh_id 			IN purchase_order_details.pod_poh_id%TYPE,
	p_pod_line_number		IN purchase_order_details.pod_line_number%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_THERE_OPEN_POD_FOR_PRD_FUNC(
	p_prd_code IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE FIND_POD_STATUS_PROC(
	p_pod_poh_id 			IN 	purchase_order_details.pod_poh_id%TYPE,
	p_pod_line_number 		IN  purchase_order_details.pod_line_number%TYPE,
	p_pod_status 			OUT purchase_order_details.pod_status%TYPE,
	p_pod_back_order_switch OUT purchase_order_details.pod_back_order_switch%TYPE
);

FUNCTION IS_THERE_NOT_CL_POD_FUNC(
	p_poh_id IN purchase_order_headers.poh_id%TYPE
)
RETURN NUMBER;

PROCEDURE CLOSE_LINE_PROC(
    p_pod_poh_id                         IN purchase_order_details.pod_poh_id%TYPE,
    p_pod_line_number                    IN purchase_order_details.pod_line_number%TYPE,
    p_pod_prf_prd_code                   IN purchase_order_details.pod_prf_prd_code%TYPE,
    p_pod_prf_fmt_code                   IN purchase_order_details.pod_prf_fmt_code%TYPE,
    p_pod_status                         IN purchase_order_details.pod_status%TYPE,
    p_pod_quantity_ordered               IN purchase_order_details.pod_quantity_ordered%TYPE,
    p_pod_weight_ordered                 IN purchase_order_details.pod_weight_ordered%TYPE
);

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  purchase_order_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pod_poh_id                     IN         purchase_order_details.pod_poh_id%TYPE,
  p_pod_line_number                IN         purchase_order_details.pod_line_number%TYPE,
  p_pod_rec                        OUT NOCOPY purchase_order_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pod_poh_id                     IN         purchase_order_details.pod_poh_id%TYPE,
  p_pod_line_number                IN         purchase_order_details.pod_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pod_poh_id                     IN         purchase_order_details.pod_poh_id%TYPE,
  p_pod_line_number                IN         purchase_order_details.pod_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pod_poh_id                     IN         purchase_order_details.pod_poh_id%TYPE,
  p_pod_line_number                IN         purchase_order_details.pod_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pod_poh_id                     IN         purchase_order_details.pod_poh_id%TYPE,
  p_pod_line_number                IN         purchase_order_details.pod_line_number%TYPE)
RETURN NUMBER;


PROCEDURE INSERT_PROC(
  p_pod_poh_id                     IN         purchase_order_details.pod_poh_id%TYPE,
  p_pod_line_number                IN         purchase_order_details.pod_line_number%TYPE,
  p_pod_prf_prd_code               IN         purchase_order_details.pod_prf_prd_code%TYPE,
  p_pod_prf_fmt_code               IN         purchase_order_details.pod_prf_fmt_code%TYPE,
  p_pod_avr                        IN         purchase_order_details.pod_avr%TYPE,
  p_pod_back_order_switch          IN         purchase_order_details.pod_back_order_switch%TYPE,
  p_pod_consignment_amount         IN         purchase_order_details.pod_consignment_amount%TYPE,
  p_pod_cost_1                     IN         purchase_order_details.pod_cost_1%TYPE,
  p_pod_cost_2                     IN         purchase_order_details.pod_cost_2%TYPE,
  p_pod_cost_3                     IN         purchase_order_details.pod_cost_3%TYPE,
  p_pod_cost_4                     IN         purchase_order_details.pod_cost_4%TYPE,
  p_pod_federal_tax_rate           IN         purchase_order_details.pod_federal_tax_rate%TYPE,
  p_pod_line_type                  IN         purchase_order_details.pod_line_type%TYPE,
  p_pod_list                       IN         purchase_order_details.pod_list%TYPE,
  p_pod_manual_discount            IN         purchase_order_details.pod_manual_discount%TYPE,
  p_pod_provincial_tax_rate        IN         purchase_order_details.pod_provincial_tax_rate%TYPE,
  p_pod_quantity_ordered           IN         purchase_order_details.pod_quantity_ordered%TYPE,
  p_pod_special_order_switch       IN         purchase_order_details.pod_special_order_switch%TYPE,
  p_pod_status                     IN         purchase_order_details.pod_status%TYPE,
  p_pod_suggested_retail_price     IN         purchase_order_details.pod_suggested_retail_price%TYPE,
  p_pod_tobacco_tax                IN         purchase_order_details.pod_tobacco_tax%TYPE,
  p_pod_weight_ordered             IN         purchase_order_details.pod_weight_ordered%TYPE,
  p_pod_prf_prd_original_code      IN         purchase_order_details.pod_prf_prd_original_code%TYPE,
  p_pod_prf_fmt_original_code      IN         purchase_order_details.pod_prf_fmt_original_code%TYPE,
  p_pod_pty_code                   IN         purchase_order_details.pod_pty_code%TYPE,
  p_pod_prebook_quantity_left      IN         purchase_order_details.pod_prebook_quantity_left%TYPE,
  p_pod_prebook_weight_left        IN         purchase_order_details.pod_prebook_weight_left%TYPE,
  p_pod_message                    IN         purchase_order_details.pod_message%TYPE,
  p_pod_prebook_flag               IN         purchase_order_details.pod_prebook_flag%TYPE,
  p_pod_pod_poh_id                 IN         purchase_order_details.pod_pod_poh_id%TYPE,
  p_pod_pod_line_number            IN         purchase_order_details.pod_pod_line_number%TYPE,
  p_pod_allocation_1               IN         purchase_order_details.pod_allocation_1%TYPE,
  p_pod_allocation_2               IN         purchase_order_details.pod_allocation_2%TYPE,
  p_pod_allocation_3               IN         purchase_order_details.pod_allocation_3%TYPE,
  p_pod_allocation_1_applied_on    IN         purchase_order_details.pod_allocation_1_applied_on%TYPE,
  p_pod_allocation_2_applied_on    IN         purchase_order_details.pod_allocation_2_applied_on%TYPE,
  p_pod_allocation_3_applied_on    IN         purchase_order_details.pod_allocation_3_applied_on%TYPE,
  p_pod_quantity_cancelled         IN         purchase_order_details.pod_quantity_cancelled%TYPE,
  p_pod_weight_cancelled           IN         purchase_order_details.pod_weight_cancelled%TYPE,
  p_pod_max_quantity_allowed       IN         purchase_order_details.pod_max_quantity_allowed%TYPE,
  p_pod_max_weight_allowed         IN         purchase_order_details.pod_max_weight_allowed%TYPE,
  p_pod_use_code                   IN         purchase_order_details.pod_use_code%TYPE,
  p_pod_cancelled_date             IN         purchase_order_details.pod_cancelled_date%TYPE,
  p_pod_ven_code                   IN         purchase_order_details.pod_ven_code%TYPE,
  p_pod_reclaim_message            IN         purchase_order_details.pod_reclaim_message%TYPE,
  p_pod_reclaim_reference          IN         purchase_order_details.pod_reclaim_reference%TYPE,
  p_pod_affect_match_cost_1_swit   IN         purchase_order_details.pod_affect_match_cost_1_switch%TYPE,
  p_pod_affect_match_cost_2_swit   IN         purchase_order_details.pod_affect_match_cost_2_switch%TYPE,
  p_pod_affect_match_cost_3_swit   IN         purchase_order_details.pod_affect_match_cost_3_switch%TYPE,
  p_pod_match_cost                 IN         purchase_order_details.pod_match_cost%TYPE,
  p_pod_manual_disc_cost_affecte   IN         purchase_order_details.pod_manual_disc_cost_affected%TYPE,
  p_pod_ven_payable_code           IN         purchase_order_details.pod_ven_payable_code%TYPE,
  p_pod_system_closed_date         IN         purchase_order_details.pod_system_closed_date%TYPE,
  p_pod_creation_source            IN         purchase_order_details.pod_creation_source%TYPE,
  p_pod_suggested_quantity         IN         purchase_order_details.pod_suggested_quantity%TYPE,
  p_pod_suggested_weight           IN         purchase_order_details.pod_suggested_weight%TYPE,
  p_pod_duplicate_switch           IN         purchase_order_details.pod_duplicate_switch%TYPE                DEFAULT NULL,
  p_pod_added_transp_amount        IN         purchase_order_details.pod_added_transp_amount%TYPE             DEFAULT NULL,
  p_pod_match_cost_with_freight    IN         purchase_order_details.pod_match_cost_with_freight%TYPE         DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY purchase_order_details%ROWTYPE);

END POD_PACK;
/