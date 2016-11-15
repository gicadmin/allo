CREATE OR REPLACE PACKAGE phenix.TCCT_OPERATION_PACK AS

PROCEDURE BUILD_TABLE_PROC(
  p_pty_code       IN customer_promotions.cpr_pty_code%TYPE,
  p_whs_code       IN warehouses.whs_code%TYPE,
  p_from_loc_code  IN locations.loc_code%TYPE,
  p_to_loc_code    IN locations.loc_code%TYPE,
  p_from_date      IN price_changes.prx_effective_date%TYPE,
  p_to_date        IN price_changes.prx_effective_date%TYPE,
  p_from_prd_code  IN products.prd_code%TYPE,
  p_to_prd_code    IN products.prd_code%TYPE,
  p_report_type    IN VARCHAR2 DEFAULT 'GEN',
  p_dgt_code       IN discount_grid_types.dgt_code%TYPE DEFAULT NULL --BEA238 utilisé dans le GEN et le changement de prix seulement
);

FUNCTION GET_SALES_COST_FUNC(
  p_prf_prd_code            IN VARCHAR2,
  p_prf_fmt_code            IN VARCHAR2,
  p_invoice_cost            IN NUMBER,
  p_whs_code                IN VARCHAR2,
  p_prf_operation_flag      IN VARCHAR2,
  p_prf_conversion_to_base  IN NUMBER,
  p_cost_price              IN OUT NUMBER,
  p_prd_base_selling        IN OUT NUMBER,
  p_prd_average_cost_1      IN OUT NUMBER,
  p_prd_average_cost_2      IN OUT NUMBER,
  p_prd_average_cost_3      IN OUT NUMBER,
  p_prd_average_cost_4      IN OUT NUMBER,
  p_prd_average_list        IN OUT NUMBER,
  p_prd_avg_real_cost_1     IN OUT NUMBER,
  p_prd_avg_real_cost_2     IN OUT NUMBER,
  p_prd_avg_real_cost_3     IN OUT NUMBER,
  p_prd_avg_real_cost_4     IN OUT NUMBER,
  p_prd_avg_real_list       IN OUT NUMBER,
  p_check_for_prx_switch    IN NUMBER DEFAULT 0,  --doit avoir une date (prx_to_date) pour que la switch soit utilisée
  p_prx_to_date             IN DATE DEFAULT NULL  --a un impact juste si la switch check_for_prx est à 1
)
RETURN BOOLEAN;

FUNCTION GET_DISCOUNT_AMOUNT_FUNC(
  p_dgt_code                     IN NUMBER,
  p_prd_code                     IN VARCHAR2,
  p_fmt_code                     IN VARCHAR2,
  p_prd_pgr_code                 IN NUMBER,
  p_nprf_price                   IN NUMBER,
  p_prd_base_selling_list        IN NUMBER,
  p_prd_cost_admin_1             IN NUMBER,
  p_prd_cost_admin_2_percent     IN NUMBER,
  p_prd_cost_adjustment          IN NUMBER,
  p_prw_added_transp_amount      IN NUMBER,
  p_prf_tobacco_tax              IN NUMBER,
  p_nprd_average_cost_1          IN NUMBER,
  p_nprd_average_cost_2          IN NUMBER,
  p_nprd_average_cost_3          IN NUMBER,
  p_nprd_average_cost_4          IN NUMBER,
  p_nprd_average_list            IN NUMBER,
  p_nprd_avg_real_cost_1         IN NUMBER,
  p_nprd_avg_real_cost_2         IN NUMBER,
  p_nprd_avg_real_cost_3         IN NUMBER,
  p_nprd_avg_real_cost_4         IN NUMBER,
  p_nprd_avg_real_list           IN NUMBER,
  p_nprd_last_list_paid          IN NUMBER,
  p_ctr_admin_method             IN VARCHAR2,
  p_nadmin_amount                IN OUT NUMBER,
  p_npricing_strategy            IN OUT NUMBER,
  p_ndiscount_price              IN OUT NUMBER
)
RETURN BOOLEAN;

END TCCT_OPERATION_PACK;
/