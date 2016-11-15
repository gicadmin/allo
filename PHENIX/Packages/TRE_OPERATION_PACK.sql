CREATE OR REPLACE PACKAGE phenix.TRE_OPERATION_PACK
IS

PROCEDURE INSERT_COD_LINES_PROC(
  p_coh_id            IN customer_order_headers.coh_id%TYPE,
  p_use_code          IN users.use_code%TYPE,
  p_user_sid_id       IN NUMBER,
  p_coh_cus_code      IN customer_order_headers.coh_cus_code%TYPE,
  p_rou_code          IN routes.rou_code%TYPE,
  p_route_position    IN customer_routes.cro_position%TYPE,
  p_whs_picking_code  IN OUT  customer_order_details.cod_whs_picking_code%TYPE
);

FUNCTION BUILD_RAP_PREP_FUTURE_ORD_FUNC(
  p_use_code   IN temporary_repack_entries.tre_use_code%TYPE,
  p_lang_code  IN job_recipients.jre_lang_code%TYPE
) RETURN VARCHAR2;

PROCEDURE UPDATE_TRE_PROC(
  p_use_code            IN temporary_repack_entries.tre_use_code%TYPE,
  p_number_of_packages  IN temporary_repack_entries.tre_number_of_packages%TYPE,
  p_user_sid_id         IN temporary_repack_entries.tre_sid_id%TYPE,
  p_coh_id              IN temporary_repack_entries.tre_coh_id %TYPE
);

PROCEDURE DELETE_TRE_PROC(
  p_use_code            IN temporary_repack_entries.tre_use_code%TYPE,
  p_user_sid_id         IN temporary_repack_entries.tre_sid_id%TYPE,
  p_coh_id              IN temporary_repack_entries.tre_coh_id %TYPE
);

FUNCTION PRINT_ETIQ_PREPARATION_FUNC(
  p_use_code                 IN temporary_repack_entries.tre_use_code%TYPE,
  p_coh_id                   IN temporary_repack_entries.tre_coh_id %TYPE,
  p_user_sid_id              IN temporary_repack_entries.tre_sid_id%TYPE,
  p_show_report_only         IN NUMBER,
  p_whs_picking_code         IN VARCHAR2,
  p_lang_code  IN job_recipients.jre_lang_code%TYPE
) RETURN VARCHAR2;

PROCEDURE DUPLICATE_REC_BEF_ENDING_PROC(
  p_use_code      IN temporary_repack_entries.tre_use_code%TYPE,
  p_coh_id        IN temporary_repack_entries.tre_coh_id %TYPE,
  p_user_sid_id   IN temporary_repack_entries.tre_sid_id%TYPE
);

FUNCTION IS_LINE_EXIST_FUNC(
  p_use_code      IN temporary_repack_entries.tre_use_code%TYPE,
  p_user_sid_id   IN temporary_repack_entries.tre_sid_id%TYPE
) RETURN BOOLEAN;

PROCEDURE FIND_WEIGHT_TO_ENTER_PROC(
  p_use_code                   IN  temporary_repack_entries.tre_use_code%TYPE,
  p_coh_id                     IN  temporary_repack_entries.tre_coh_id %TYPE,
  p_user_sid_id                IN  temporary_repack_entries.tre_sid_id%TYPE,
  p_ctr_weight_tolerance_perc  IN  control.ctr_weight_tolerance_perc%TYPE,
  p_language                   IN  VARCHAR2,
  p_weight_tre_id              OUT temporary_repack_entries.tre_id%TYPE,
  p_weight_prd_code            OUT temporary_repack_entries.tre_prf_prd_code%TYPE,
  p_weight_prd_description     OUT products.prd_description%TYPE,
  p_weight_fmt_code            OUT temporary_repack_entries.tre_prf_fmt_code%TYPE,
  p_weight_prf_description     OUT product_formats.prf_description%TYPE,
  p_weight_for_quantity        OUT NUMBER,
  p_weight_prf_min_tolerance   OUT NUMBER,
  p_weight_prf_max_tolerance   OUT NUMBER,
  p_weights_left               OUT NUMBER
) ;

FUNCTION DELETE_TRE_PER_SESSION_FUNC(
  p_user_sid_id  IN temporary_repack_entries.tre_sid_id%TYPE
)RETURN NUMBER;

PROCEDURE INSERT_TRE_BAY_COD_PROC(
  p_use_code          IN  temporary_repack_entries.tre_use_code%TYPE,
  p_coh_id            IN  temporary_repack_entries.tre_coh_id %TYPE,
  p_user_sid_id       IN  temporary_repack_entries.tre_sid_id%TYPE,
  p_coh_cus_code      IN  temporary_repack_entries.tre_cus_code%TYPE,
  p_rou_code          IN  temporary_repack_entries.tre_route_code%TYPE,
  p_route_position    IN  temporary_repack_entries.tre_route_position%TYPE,
  p_whs_picking_code  IN OUT warehouses.whs_code%TYPE
);

END TRE_OPERATION_PACK;
/