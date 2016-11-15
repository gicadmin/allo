CREATE OR REPLACE PACKAGE phenix.COD_OPERATION_PACK IS

PROCEDURE FIND_RESERVED_ON_COD_PROC(
  p_cod_coh_id            IN NUMBER,
  p_cod_line_number       IN NUMBER,
  p_cod_reserved_quantity OUT NUMBER,
  p_cod_reserved_weight   OUT NUMBER
);

--valider sil reste des lignes de COD ouvertes sur un COH particulier
FUNCTION ARE_THERE_OPEN_COD_LINE_FUNC(
  p_coh_id IN NUMBER
)
RETURN NUMBER;

--valider sil reste des lignes de COD ouvertes sur un COH particulier
FUNCTION ARE_THERE_OPEN_PIGE_FUNC(
  p_cod_coh_id      IN NUMBER,
  p_cod_line_number IN NUMBER
)
RETURN NUMBER;

--trouver les quantités/poids leftover sur le COD
PROCEDURE FIND_COD_LEFTOVER_PROC(
  p_cod_coh_id            IN NUMBER,
  p_cod_line_number       IN NUMBER,
  p_cod_leftover_quantity OUT NUMBER,
  p_cod_leftover_weight   OUT NUMBER
);

PROCEDURE FIX_COD_LEFTOVER_FOR_RMA_PROC( --GIC1193
  p_coh_id            IN NUMBER,
  p_cod_line_number   IN NUMBER,
  p_rma_fmt_code      IN VARCHAR2,
  p_adjusted_quantity IN NUMBER,
  p_adjusted_weight   IN NUMBER,
  p_wms_flag          IN VARCHAR2,
  p_debit_switch      IN NUMBER,
  p_damaged_switch    IN NUMBER   --CHA1179
);

PROCEDURE UPDATE_PREBOOK_MASTER_PROC(
  p_reservation_coh_id      IN NUMBER,
  p_reservation_cod_line    IN NUMBER,
  p_fmt_code                IN VARCHAR2,  --format représenté par les qty/weight to add - Si NULL, on assume que ca parle du FMT de la réservation
  p_prd_definition          IN VARCHAR2,
  p_weight_to_add           IN NUMBER,  --si négatif, ca se retrouve à enlever du leftover
  p_qty_to_add              IN NUMBER,  --si négatif, ca se retrouve à enlever du leftover
  p_log_id                  IN NUMBER DEFAULT NULL, --csc1869
  p_closing_allowed         IN NUMBER DEFAULT 1 --csc1869
);

PROCEDURE UPDATE_COD_WHEN_INVOICING_PROC( --BER78
  p_coh_id             IN NUMBER,
  p_cod_line           IN NUMBER,
  p_poh_id             IN NUMBER,
  p_pod_line           IN NUMBER,
  p_order_type         IN VARCHAR2,
  p_qty                IN NUMBER,
  p_weight             IN NUMBER,
  p_cost               IN NUMBER,
  p_average_list       IN NUMBER,
  p_average_cost_1     IN NUMBER,
  p_average_cost_2     IN NUMBER,
  p_average_cost_3     IN NUMBER,
  p_average_cost_4     IN NUMBER,
  p_avg_real_list      IN NUMBER,
  p_avg_real_cost_1    IN NUMBER,
  p_avg_real_cost_2    IN NUMBER,
  p_avg_real_cost_3    IN NUMBER,
  p_avg_real_cost_4    IN NUMBER,
  p_base_selling_cost  IN NUMBER,
  p_original_retail    IN NUMBER,
  p_selling_retail     IN NUMBER,
  p_promotion_amount   IN NUMBER,
  p_surcharge          IN NUMBER,
  p_fmt_code_srp       IN VARCHAR2,
  p_price_srp          IN NUMBER,
  p_quantity_srp       IN NUMBER,
  p_royalty_amount     IN NUMBER,
  p_replacement_list   IN NUMBER,
  p_replacement_cost_1 IN NUMBER,
  p_replacement_cost_2 IN NUMBER,
  p_replacement_cost_3 IN NUMBER,
  p_replacement_cost_4 IN NUMBER,
  p_cod_pricing_source IN customer_order_details.cod_pricing_source%TYPE,
  p_cod_pty_code       IN customer_order_details.cod_pty_code%TYPE,
  p_cod_car_amount     IN customer_order_details.cod_car_amount%TYPE,
  p_log_id             IN NUMBER DEFAULT NULL
);

FUNCTION COUNT_COD_FUNC(
  p_coh_id IN NUMBER
)
RETURN NUMBER;

FUNCTION COUNT_COD_PRD_ATTRIBUTE_FUNC(
  p_coh_id        IN NUMBER,
  p_prd_attribute IN VARCHAR2
)
RETURN NUMBER;

FUNCTION COUNT_COD_PREBOOK_SPECIAL_FUNC(
  p_coh_id IN NUMBER
)
RETURN NUMBER;

PROCEDURE DELETE_COD_MAIL_PROC(
  p_coh_id   IN NUMBER
);

--Obtenir la prochaine date de livraison d'un produit pour les commandes ouvertes qui ne sont pas de type bulletin
FUNCTION GET_NEXT_DELIVERY_DATE_FUNC(
  p_prd_code IN VARCHAR2,
  p_date     IN DATE DEFAULT SYSDATE
) RETURN DATE;

--BER3190 Trouver la quantité/poids totale commandée pour le lendemain
FUNCTION FIND_QTY_ORDERED_TOMORROW_FUNC(
  p_cod_prf_prd_code     IN customer_order_details.cod_prf_prd_code%TYPE,
  p_cod_prf_fmt_code     IN customer_order_details.cod_prf_fmt_code%TYPE,
  p_cod_whs_picking_code IN customer_order_details.cod_whs_picking_code%TYPE
) RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_coh_id IN customer_order_headers.coh_id%TYPE
);

PROCEDURE TIMELINE_ADJUST_PROC(
  p_inh_id IN invoice_headers.inh_id%TYPE
);

FUNCTION IS_THERE_OPEN_COD_FOR_PRD_FUNC(
  p_prd_code                IN products.prd_code%TYPE,
  p_exclude_purchase_format BOOLEAN DEFAULT FALSE
) RETURN BOOLEAN;

PROCEDURE UPDATE_COD_COST_FOR_SCI_PROC(
  p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number  IN customer_order_details.cod_line_number%TYPE,
  p_cod_prf_prd_code IN customer_order_details.cod_prf_prd_code%TYPE
);

FUNCTION FREEGOOD_REBIL_AMOUNT_FUNC( --USG709
  p_prd_code           IN VARCHAR2,
  p_fmt_code           IN VARCHAR2,
  p_cod_selling_retail IN NUMBER
) RETURN NUMBER;

FUNCTION PREBOOK_IS_FREEGOOD_FUNC( --USG709
  p_cod_cod_coh_id      IN NUMBER,
  p_cod_cod_line_number IN NUMBER
)
RETURN NUMBER;

FUNCTION FIND_FREEGOOD_PREBOOK_FUNC
(
  p_cod_cod_coh_id              IN  customer_order_details.cod_coh_id%TYPE,
  p_cod_cod_line_number         IN  customer_order_details.cod_line_number%TYPE,
  p_cod_freegood_rebill_amount  OUT customer_order_details.cod_freegood_rebill_amount%TYPE,
  p_cod_freegood_message        OUT customer_order_details.cod_freegood_message%TYPE,
  p_cod_freegood_switch         OUT customer_order_details.cod_freegood_switch%TYPE,
  p_cod_selling_retail_orig     OUT customer_order_details.cod_selling_retail_orig%TYPE
)
RETURN BOOLEAN;

PROCEDURE SET_RECONCILIATION_PROC(  p_coh_id                IN customer_order_headers.coh_id%TYPE,
                                    p_cod_line_number       IN customer_order_details.cod_line_number%TYPE,
                                    p_use_code              IN users.use_code%TYPE,
                                    p_reconciliation_date   IN DATE
);

-- Houria 2013_11_28: retourne s'il y a des commandes ouvertes pour un client donné
FUNCTION ARE_THERE_OPENED_COD_CUS_FUNC(
  p_cus_code IN customers.cus_code%TYPE
)
RETURN NUMBER;

 FUNCTION LOCK_COD_FUNC(
  p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number  IN customer_order_details.cod_line_number%TYPE
)
RETURN BOOLEAN;

PROCEDURE UPD_COD_LINE_PREBOOK_METH_PROC(
  p_cod_coh_id                   IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number              IN customer_order_details.cod_line_number %TYPE,
  p_final_cod_prebook_method     IN customer_order_details.cod_prebook_method%TYPE
 ) ;
PROCEDURE UPDATE_COD_PREBOOK_METHOD_PROC (
  p_cod_coh_id                   IN customer_order_details.cod_coh_id%TYPE ,
  p_final_cod_prebook_method     IN customer_order_details.cod_prebook_method%TYPE,
  p_number_cod_updated           OUT NUMBER
 ) ;

FUNCTION UPDATE_COD_DELIVERY_DATE_FUNC (
  p_cod_coh_id                   IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number              IN customer_order_details.cod_line_number %TYPE,
  p_cod_project_delivery_date    IN customer_order_details.cod_project_delivery_date%TYPE
) RETURN BOOLEAN ;

FUNCTION UPDATE_COD_SELLING_RETAIL_FUNC (
  p_cod_coh_id                   IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number              IN customer_order_details.cod_line_number %TYPE,
  p_cod_selling_retail           IN customer_order_details.cod_selling_retail%TYPE
) RETURN BOOLEAN ;

--cvi2821 mettre la fonctionalité dans le package pour pouvoir utiliser les rowtype...
PROCEDURE COPY_TO_NEW_COH_AND_WHS_PROC(
  p_old_coh_id          IN NUMBER,
  p_old_cod_line_number IN NUMBER,
  p_new_coh_id          IN NUMBER,
  p_new_cod_line_number IN NUMBER,
  p_use_code            IN NUMBER,
  p_new_whs_code        IN VARCHAR2
);

--cvi2821 trouver la premiere facture lié avec une ligne de commande client
FUNCTION FIND_FIRST_INH_LINKED_FUNC(
  p_cod_coh_id        IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number   IN customer_order_details.cod_line_number%TYPE
)
RETURN NUMBER;

FUNCTION LOCK_BY_CUS_PTY_WHS_VEN_FUNC(
  p_ven_code  IN vendors.ven_code%TYPE ,
  p_cus_code  IN customers.cus_code%TYPE,
  p_pty_code  IN promotion_types.pty_code%TYPE,
  p_whs_code  IN warehouses.whs_code%TYPE,
  p_date      IN DATE
)
RETURN BOOLEAN;

FUNCTION COUNT_CUS_PRD_PTY_WHS_FUNC(
  p_cus_code  IN  customers.cus_code%TYPE,
  p_ven_code  IN  vendors.ven_code%TYPE,
  p_pty_code  IN  promotion_types.pty_code%TYPE ,
  p_whs_code  IN  warehouses.whs_code%TYPE
)
RETURN NUMBER;

PROCEDURE SET_QUANTITY_WEIGHT_PROC(
  p_prd_definition_det        IN  products.prd_definition%TYPE,
  p_qty_a_livrer              IN  customer_order_details.cod_order_quantity%TYPE,
  p_poids_a_livrer            IN  customer_order_details.cod_order_weight%TYPE,
  p_cod_order_quantity_det    IN  customer_order_details.cod_order_quantity%TYPE,
  p_cod_order_weight_det      IN  customer_order_details.cod_order_weight%TYPE,
  p_cod_leftover_quantity_det IN  customer_order_details.cod_leftover_quantity%TYPE,
  p_cod_leftover_weight_det   IN  customer_order_details.cod_leftover_weight%TYPE,
  p_cod_coh_id_det            IN  customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number_det       IN  customer_order_details.cod_line_number%TYPE
);

PROCEDURE CREATE_INDIRECT_DELIV_COD_PROC(
  p_coh_sequence                IN NUMBER,
  p_cod_line                    IN NUMBER,
  p_cod_coh_id                  IN customer_order_details.cod_coh_id%TYPE ,
  p_cod_line_number             IN customer_order_details.cod_line_number%TYPE  ,
  p_poh_id                      IN NUMBER,
  p_pod_line_number             IN NUMBER,
  p_coh_cus_code                IN NUMBER,
  p_cus_use_code                IN NUMBER,
  p_telemark_code               IN NUMBER,
  p_cod_prf_prd_code            IN customer_order_details.cod_prf_prd_code%TYPE ,
  p_cod_prf_fmt_code            IN customer_order_details.cod_prf_fmt_code%TYPE ,
  p_cod_pty_code                IN customer_order_details.cod_pty_code%TYPE,
  p_cod_selling_retail          IN customer_order_details.cod_selling_retail%TYPE,
  p_cod_cost_price              IN customer_order_details.cod_cost_price%TYPE,
  p_cod_project_date            IN customer_order_details.cod_project_delivery_date%TYPE,
  p_base_selling_list           IN NUMBER,
  p_original_retail             IN NUMBER,
  p_selling_retail              IN NUMBER,
  p_cod_promotion_amount        IN customer_order_details.cod_promotion_amount%TYPE,
  p_tobacco_tax                 IN NUMBER,
  p_srp_fmt_code                IN VARCHAR2,
  p_cod_quantity_srp            IN customer_order_details.cod_quantity_srp%TYPE,
  p_cod_price_srp               IN customer_order_details.cod_price_srp%TYPE,
  p_cod_surcharge               IN NUMBER ,
  p_prd_average_cost_1          IN customer_order_details.cod_average_cost_1%TYPE,
  p_prd_average_cost_2          IN customer_order_details.cod_average_cost_2%TYPE,
  p_prd_average_cost_3          IN customer_order_details.cod_average_cost_3%TYPE,
  p_prd_average_cost_4          IN customer_order_details.cod_average_cost_4%TYPE,
  p_prd_average_list            IN customer_order_details.cod_average_list%TYPE ,
  p_prd_avg_real_cost_1         IN customer_order_details.cod_avg_real_cost_1%TYPE,
  p_prd_avg_real_cost_2         IN customer_order_details.cod_avg_real_cost_2%TYPE,
  p_prd_avg_real_cost_3         IN customer_order_details.cod_avg_real_cost_3%TYPE,
  p_prd_avg_real_cost_4         IN customer_order_details.cod_avg_real_cost_4%TYPE,
  p_prd_avg_real_list           IN customer_order_details.cod_avg_real_list%TYPE,
  p_qty_a_livrer                IN NUMBER,
  p_poids_a_livrer              IN NUMBER,
  p_cod_message                 IN VARCHAR2,
  p_cod_customer_po_line_det    IN NUMBER,
  p_cod_customer_po_number_det  IN VARCHAR2,
  p_cod_whs_picking_code        IN VARCHAR2
);

FUNCTION SUM_OPEN_ORDER_FUNC(
  p_cus_code               IN customer_order_headers.coh_cus_code%TYPE,
  p_federal_tax            IN PRODUCT_WAREHOUSES.PRW_FEDERAL_TAX_SWITCH%type,
  p_provincial_tax         IN PRODUCT_WAREHOUSES.PRW_PROVINCIAL_TAX_SWITCH%type,
  p_compounded_tax_switch  IN provinces.prv_compounded_tax_switch%type
)RETURN NUMBER;

FUNCTION GET_MAX_DATE_FUNC(
  p_coh_id   IN customer_order_headers.coh_id%TYPE
)RETURN DATE;

PROCEDURE SET_COD_PRINTED_SWITCH_PROC(
  p_coh_id  IN customer_order_details.cod_coh_id%TYPE
);

PROCEDURE UPDATE_COD_SPE_ORD_STATU_PROC(
  p_cod_coh_id           IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number      IN customer_order_details.cod_pod_line_number%TYPE,
  p_cod_pod_poh_id       IN customer_order_details.cod_pod_poh_id%TYPE,
  p_cod_pod_line_number  IN customer_order_details.cod_pod_line_number%TYPE
);

PROCEDURE UPDATE_COD_SPE_ORD_STATU_PROC(
  p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number  IN customer_order_details.cod_pod_line_number%TYPE
);

PROCEDURE UPDATE_COD_PROC(
  p_pod_prf_prd_code      IN purchase_order_details.pod_prf_prd_code%TYPE,
  p_pod_prf_fmt_code      IN purchase_order_details.pod_prf_fmt_code%TYPE,
  p_poh_id                IN purchase_order_headers.poh_id%TYPE,
  p_pod_line_number       IN purchase_order_details.pod_line_number%TYPE,
  p_poh_whs_code          IN purchase_order_headers.poh_whs_code%TYPE,
  p_pod_quantity_ordered  IN purchase_order_details.pod_quantity_ordered%TYPE,
  p_pod_weight_ordered    IN purchase_order_details.pod_weight_ordered%TYPE
);

PROCEDURE UPDATE_TO_SPECIAL_PROC(
  p_vwh_ven_code  IN products.prd_ven_code%TYPE,
  p_vwh_whs_code  IN customer_order_details.cod_whs_picking_code%TYPE
);

PROCEDURE UPDATE_TO_SPECIAL_PROC(
  p_vwh_caps_tch_locking_id  IN temporary_caps_cods.tcc_tch_id%TYPE
);

FUNCTION IS_PREBOOK_EXIST_FUNC(
   p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
   p_cod_line_number  IN customer_order_details.cod_line_number%TYPE
) RETURN BOOLEAN;

FUNCTION GET_ORDERED_TOBACCO_FUNC(
  p_cod_coh_id IN customer_order_details.cod_coh_id%TYPE
)
RETURN NUMBER;

FUNCTION GET_NEXT_LINE_NUMBER_FUNC(
  p_cod_coh_id IN customer_order_details.cod_coh_id%TYPE
)
RETURN NUMBER;

PROCEDURE CALCULATE_LINE_PROC(
  p_cod_coh_id             IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number        IN customer_order_details.cod_line_number%TYPE,
  p_sale_to_invoice        IN NUMBER,
  p_surcharge_to_invoice   IN NUMBER,
  p_federal_tax_rate       IN NUMBER,
  p_provincial_tax_rate    IN NUMBER,
  p_compounded_tax_switch  IN NUMBER,
  p_fed_consign_tax_total  IN NUMBER,
  p_prov_consign_tax_total IN NUMBER,
  p_federal_tax_total      IN OUT NUMBER,
  p_provincial_tax_total   IN OUT NUMBER,
  p_sale_total             IN OUT NUMBER,
  p_surcharge_total        IN OUT NUMBER
);

PROCEDURE PURGE_CHILD_PROC(
  p_cod_coh_id      IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number IN customer_order_details.cod_line_number%TYPE
);

FUNCTION GET_INCENTIVE_FUNC(
  p_cus_code           IN customer_order_headers.coh_cus_code%TYPE,
  p_prd_code           IN customer_order_details.cod_prf_prd_code%TYPE,
  p_fmt_code           IN customer_order_details.cod_prf_fmt_code%TYPE
 ) RETURN vendor_sales_incentives.vsi_code%TYPE;


PROCEDURE APPLICATE_AMOUNT_INCENT_PROC(
  p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
  p_amount           IN customer_order_details.cod_sio_distributed_amount%TYPE,
  p_vsi_code         IN vendor_sales_incentives.vsi_code%TYPE,
  p_nb_incent_applied OUT NUMBER
 );
PROCEDURE APPLICATE_AMOUNT_INCENT_PROC(
  p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
  p_bill_amount      IN customer_order_details.cod_sio_collected_amount%TYPE,
  p_ven_code         IN vendors.ven_code%TYPE,
  p_vsi_code         IN vendor_sales_incentives.vsi_code%TYPE,
  p_nb_incent_applied OUT NUMBER
 ) ;

FUNCTION DOES_COH_HAVE_INCENTIVE_FUNC(
  p_coh_id           IN customer_order_headers.coh_id%TYPE
) RETURN BOOLEAN ;

FUNCTION IS_PREBOOK_MERGE_FUNC(
  p_coh_id        IN customer_order_headers.coh_id%TYPE,
  p_cus_code      IN customers.cus_code%TYPE,
  p_cus_cus_code  IN customers.cus_cus_code%TYPE,
  p_date          IN DATE
) RETURN BOOLEAN;

FUNCTION INSERT_LINE_FUNC(
  p_cod_coh_id                 IN customer_order_details.cod_coh_id%TYPE,
  p_cod_prf_prd_code           IN customer_order_details.cod_prf_prd_code%TYPE,
  p_cod_prf_fmt_code           IN customer_order_details.cod_prf_fmt_code%TYPE,
  p_cod_project_delivery_date  IN customer_order_details.cod_project_delivery_date%TYPE,
  p_cod_use_code               IN customer_order_details.cod_use_code%TYPE,
  p_cod_use_telemark_code      IN customer_order_details.cod_use_telemark_code%TYPE,
  p_cod_whs_picking_code       IN customer_order_details.cod_whs_picking_code%TYPE,
  p_cod_message                IN customer_order_details.cod_message%TYPE,
  p_cod_order_source           IN customer_order_details.cod_order_source%TYPE,
  p_cod_pricing_source         IN customer_order_details.cod_pricing_source%TYPE,
  p_cod_tobacco_tax            IN customer_order_details.cod_tobacco_tax%TYPE,
  p_cod_selling_retail         IN customer_order_details.cod_selling_retail%TYPE,
  p_cod_selling_retail_orig    IN customer_order_details.cod_selling_retail_orig%TYPE,
  p_cod_pricing_source_orig    IN customer_order_details.cod_pricing_source_orig%TYPE,
  p_cod_use_override_code      IN customer_order_details.cod_use_override_code%TYPE,
  p_cod_desired_quantity       IN customer_order_details.cod_desired_quantity%TYPE,
  p_cod_desired_weight         IN customer_order_details.cod_desired_weight%TYPE,
  p_cod_cod_shorted_coh_id     IN customer_order_details.cod_cod_shorted_coh_id%TYPE,
  p_cod_cod_sorted_line_number IN customer_order_details.cod_cod_shorted_line_number%TYPE,
  p_cod_subst_inv_quantity     IN customer_order_details.cod_subst_inv_quantity%TYPE,
  p_cod_subst_inv_weight       IN customer_order_details.cod_subst_inv_weight%TYPE,
  p_coh_cus_code               IN customer_order_headers.coh_cus_code%TYPE,
  p_coh_whs_delivery_code      IN customer_order_headers.coh_whs_delivery_code%TYPE,
  p_cus_fed_tax_exempt_switch  IN customers.cus_federal_tax_exempt_switch%TYPE,
  p_cus_srt_code               IN customers.cus_srt_code%TYPE,
  p_prd_definition             IN products.prd_definition%TYPE,
  p_prd_special_order_switch   IN products.prd_special_order_switch%TYPE,
  p_prd_cigar_switch           IN products.prd_cigar_switch%TYPE,
  p_prf_pre_print_switch       IN product_formats.prf_pre_print_required_switch%TYPE,
  p_prv_code                   IN provinces.prv_code%TYPE,
  p_prv_federal_tax_rate       IN provinces.prv_federal_tax%TYPE,
  p_prv_tobacco_markup_rate    IN provinces.prv_tobacco_markup_rate%TYPE,
  p_prv_tobacco_tax_rate       IN provinces.prv_tobacco_tax_rate%TYPE,
  p_insert_cod_to_zero         IN BOOLEAN,
  p_quantity_left              IN OUT NUMBER,
  p_weight_left                IN OUT NUMBER,
  p_ccr_code                   OUT NUMBER
)
RETURN NUMBER;

FUNCTION INSERT_PROFILE_LINE_FUNC(
  p_cod_coh_id                   IN customer_order_details.cod_coh_id%TYPE,
  p_cod_prf_prd_code             IN customer_order_details.cod_prf_prd_code%TYPE,
  p_cod_prf_fmt_code             IN customer_order_details.cod_prf_fmt_code%TYPE,
  p_cod_project_delivery_date    IN customer_order_details.cod_project_delivery_date%TYPE,
  p_order_quantity_weight        IN NUMBER,
  p_desired_quantity_weight      IN NUMBER,
  p_substitution_quantity_weight IN NUMBER,
  p_cod_use_code                 IN customer_order_details.cod_use_code%TYPE,
  p_cod_use_telemark_code        IN customer_order_details.cod_use_telemark_code%TYPE,
  p_cod_whs_picking_code         IN customer_order_details.cod_whs_picking_code%TYPE,
  p_cod_message                  IN customer_order_details.cod_message%TYPE,
  p_cod_order_source             IN customer_order_details.cod_order_source%TYPE,
  p_cod_pricing_source           IN customer_order_details.cod_pricing_source%TYPE,
  p_cod_tobacco_tax              IN customer_order_details.cod_tobacco_tax%TYPE,
  p_cod_selling_retail           IN customer_order_details.cod_selling_retail%TYPE,
  p_cod_selling_retail_orig      IN customer_order_details.cod_selling_retail_orig%TYPE,
  p_cod_pricing_source_orig      IN customer_order_details.cod_pricing_source_orig%TYPE,
  p_cod_use_override_code        IN customer_order_details.cod_use_override_code%TYPE,
  p_cod_cod_shorted_coh_id       IN customer_order_details.cod_cod_shorted_coh_id%TYPE,
  p_cod_cod_shorted_line_number  IN customer_order_details.cod_cod_shorted_line_number%TYPE,
  p_coh_cus_code                 IN customer_order_headers.coh_cus_code%TYPE,
  p_coh_whs_delivery_code        IN customer_order_headers.coh_whs_delivery_code%TYPE,
  p_cus_fed_tax_exempt_switch    IN customers.cus_federal_tax_exempt_switch%TYPE,
  p_cus_srt_code                 IN customers.cus_srt_code%TYPE,
  p_prd_definition               IN products.prd_definition%TYPE,
  p_prd_special_order_switch     IN products.prd_special_order_switch%TYPE,
  p_prd_cigar_switch             IN products.prd_cigar_switch%TYPE,
  p_prf_pre_print_switch         IN product_formats.prf_pre_print_required_switch%TYPE,
  p_prv_code                     IN provinces.prv_code%TYPE,
  p_prv_federal_tax_rate         IN provinces.prv_federal_tax%TYPE,
  p_prv_tobacco_markup_rate      IN provinces.prv_tobacco_markup_rate%TYPE,
  p_prv_tobacco_tax_rate         IN provinces.prv_tobacco_tax_rate%TYPE,
  p_insert_cod_to_zero           IN BOOLEAN,
  p_ccr_code                     OUT NUMBER
)
RETURN NUMBER;

PROCEDURE RELEASE_SUBSTITUTION_PROC(
  p_cod_coh_id      IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number IN customer_order_details.cod_line_number%TYPE
);

FUNCTION GET_FULL_SUBSTITUTION_FUNC(
  p_cod_coh_id      IN         customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number IN         customer_order_details.cod_line_number%TYPE,
  p_cod_rec         OUT NOCOPY customer_order_details%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION GET_SUBSTITUTION_PRODUCT_FUNC(
  p_cod_coh_id      IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number IN customer_order_details.cod_line_number%TYPE
)
RETURN VARCHAR2;

FUNCTION GET_SUBSTITUTION_QTY_WGT_FUNC(
  p_cod_coh_id      IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number IN customer_order_details.cod_line_number%TYPE
)
RETURN NUMBER;

FUNCTION COUNT_SUBSTITUTION_LINE_FUNC(
  p_cod_coh_id      IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number IN customer_order_details.cod_line_number%TYPE
)
RETURN NUMBER;

FUNCTION GET_PREBOOK_SPEC_ORDER_FUNC(
  p_cus_code                  IN customers.cus_code%TYPE,
  p_cod_prf_prd_code          IN customer_order_details.cod_prf_prd_code%TYPE,
  p_cod_project_delivery_date IN customer_order_details.cod_project_delivery_date%TYPE,
  p_cod_rec                   OUT NOCOPY customer_order_details%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION EXISTS_PREBOOK_SPEC_ORDER_FUNC(
  p_cus_code                  IN customers.cus_code%TYPE,
  p_cod_prf_prd_code          IN customer_order_details.cod_prf_prd_code%TYPE,
  p_cod_project_delivery_date IN customer_order_details.cod_project_delivery_date%TYPE
)
RETURN BOOLEAN;

FUNCTION EXISTS_PREBOOK_SPEC_ORDER_FUNC(
  p_cus_code                  IN customers.cus_code%TYPE,
  p_cod_project_delivery_date IN customer_order_details.cod_project_delivery_date%TYPE
)
RETURN BOOLEAN;

FUNCTION EXISTS_PREBOOK_SPEC_ORDER_FUNC(
  p_cus_code IN customers.cus_code%TYPE
)
RETURN BOOLEAN;

END COD_OPERATION_PACK;
/