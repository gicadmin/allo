CREATE OR REPLACE PACKAGE phenix.SCI_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  stat_customer_invoices%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sci_fcw_fca_year               IN         stat_customer_invoices.sci_fcw_fca_year%TYPE,
  p_sci_fcw_fca_period             IN         stat_customer_invoices.sci_fcw_fca_period%TYPE,
  p_sci_fcw_week                   IN         stat_customer_invoices.sci_fcw_week%TYPE,
  p_sci_cus_code                   IN         stat_customer_invoices.sci_cus_code%TYPE,
  p_sci_prd_code                   IN         stat_customer_invoices.sci_prd_code%TYPE,
  p_sci_inh_cash_and_carry_switc   IN         stat_customer_invoices.sci_inh_cash_and_carry_switch%TYPE,
  p_sci_whs_delivery_code          IN         stat_customer_invoices.sci_whs_delivery_code%TYPE,
  p_sci_rec                        OUT NOCOPY stat_customer_invoices%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sci_fcw_fca_year               IN         stat_customer_invoices.sci_fcw_fca_year%TYPE,
  p_sci_fcw_fca_period             IN         stat_customer_invoices.sci_fcw_fca_period%TYPE,
  p_sci_fcw_week                   IN         stat_customer_invoices.sci_fcw_week%TYPE,
  p_sci_cus_code                   IN         stat_customer_invoices.sci_cus_code%TYPE,
  p_sci_prd_code                   IN         stat_customer_invoices.sci_prd_code%TYPE,
  p_sci_inh_cash_and_carry_switc   IN         stat_customer_invoices.sci_inh_cash_and_carry_switch%TYPE,
  p_sci_whs_delivery_code          IN         stat_customer_invoices.sci_whs_delivery_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sci_fcw_fca_year               IN         stat_customer_invoices.sci_fcw_fca_year%TYPE,
  p_sci_fcw_fca_period             IN         stat_customer_invoices.sci_fcw_fca_period%TYPE,
  p_sci_fcw_week                   IN         stat_customer_invoices.sci_fcw_week%TYPE,
  p_sci_cus_code                   IN         stat_customer_invoices.sci_cus_code%TYPE,
  p_sci_prd_code                   IN         stat_customer_invoices.sci_prd_code%TYPE,
  p_sci_inh_cash_and_carry_switc   IN         stat_customer_invoices.sci_inh_cash_and_carry_switch%TYPE,
  p_sci_whs_delivery_code          IN         stat_customer_invoices.sci_whs_delivery_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sci_fcw_fca_year               IN         stat_customer_invoices.sci_fcw_fca_year%TYPE,
  p_sci_fcw_fca_period             IN         stat_customer_invoices.sci_fcw_fca_period%TYPE,
  p_sci_fcw_week                   IN         stat_customer_invoices.sci_fcw_week%TYPE,
  p_sci_cus_code                   IN         stat_customer_invoices.sci_cus_code%TYPE,
  p_sci_prd_code                   IN         stat_customer_invoices.sci_prd_code%TYPE,
  p_sci_inh_cash_and_carry_switc   IN         stat_customer_invoices.sci_inh_cash_and_carry_switch%TYPE,
  p_sci_whs_delivery_code          IN         stat_customer_invoices.sci_whs_delivery_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sci_fcw_fca_year               IN         stat_customer_invoices.sci_fcw_fca_year%TYPE,
  p_sci_fcw_fca_period             IN         stat_customer_invoices.sci_fcw_fca_period%TYPE,
  p_sci_fcw_week                   IN         stat_customer_invoices.sci_fcw_week%TYPE,
  p_sci_cus_code                   IN         stat_customer_invoices.sci_cus_code%TYPE,
  p_sci_prd_code                   IN         stat_customer_invoices.sci_prd_code%TYPE,
  p_sci_inh_cash_and_carry_switc   IN         stat_customer_invoices.sci_inh_cash_and_carry_switch%TYPE,
  p_sci_whs_delivery_code          IN         stat_customer_invoices.sci_whs_delivery_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sci_fcw_fca_year               IN         stat_customer_invoices.sci_fcw_fca_year%TYPE,
  p_sci_fcw_fca_period             IN         stat_customer_invoices.sci_fcw_fca_period%TYPE,
  p_sci_fcw_week                   IN         stat_customer_invoices.sci_fcw_week%TYPE,
  p_sci_cus_code                   IN         stat_customer_invoices.sci_cus_code%TYPE,
  p_sci_prd_code                   IN         stat_customer_invoices.sci_prd_code%TYPE,
  p_sci_inh_cash_and_carry_switc   IN         stat_customer_invoices.sci_inh_cash_and_carry_switch%TYPE,
  p_sci_whs_delivery_code          IN         stat_customer_invoices.sci_whs_delivery_code%TYPE);


PROCEDURE INSERT_PROC(
  p_sci_fcw_fca_year              IN         stat_customer_invoices.sci_fcw_fca_year%TYPE,
  p_sci_fcw_fca_period            IN         stat_customer_invoices.sci_fcw_fca_period%TYPE,
  p_sci_fcw_week                  IN         stat_customer_invoices.sci_fcw_week%TYPE,
  p_sci_cus_code                  IN         stat_customer_invoices.sci_cus_code%TYPE,
  p_sci_prd_code                  IN         stat_customer_invoices.sci_prd_code%TYPE,
  p_sci_inh_cash_and_carry_switc  IN         stat_customer_invoices.sci_inh_cash_and_carry_switch%TYPE,
  p_sci_sum_amount_credit_only    IN         stat_customer_invoices.sci_sum_amount_credit_only%TYPE,
  p_sci_sum_amount_sales          IN         stat_customer_invoices.sci_sum_amount_sales%TYPE,
  p_sci_sum_average_list          IN         stat_customer_invoices.sci_sum_average_list%TYPE,
  p_sci_sum_average_cost_1        IN         stat_customer_invoices.sci_sum_average_cost_1%TYPE,
  p_sci_sum_average_cost_2        IN         stat_customer_invoices.sci_sum_average_cost_2%TYPE,
  p_sci_sum_average_cost_3        IN         stat_customer_invoices.sci_sum_average_cost_3%TYPE,
  p_sci_sum_average_cost_4        IN         stat_customer_invoices.sci_sum_average_cost_4%TYPE,
  p_sci_sum_avg_real_list         IN         stat_customer_invoices.sci_sum_avg_real_list%TYPE,
  p_sci_sum_avg_real_cost_1       IN         stat_customer_invoices.sci_sum_avg_real_cost_1%TYPE,
  p_sci_sum_avg_real_cost_2       IN         stat_customer_invoices.sci_sum_avg_real_cost_2%TYPE,
  p_sci_sum_avg_real_cost_3       IN         stat_customer_invoices.sci_sum_avg_real_cost_3%TYPE,
  p_sci_sum_avg_real_cost_4       IN         stat_customer_invoices.sci_sum_avg_real_cost_4%TYPE,
  p_sci_count_lines               IN         stat_customer_invoices.sci_count_lines%TYPE,
  p_sci_sum_ven_agreement_amount  IN         stat_customer_invoices.sci_sum_ven_agreement_amount%TYPE,
  p_sci_sum_car_amount            IN         stat_customer_invoices.sci_sum_car_amount%TYPE,
  p_sci_whs_delivery_code         IN         stat_customer_invoices.sci_whs_delivery_code%TYPE,
  p_sci_sum_cost_price            IN         stat_customer_invoices.sci_sum_cost_price%TYPE,
  p_sci_last_invoice_date         IN         stat_customer_invoices.sci_last_invoice_date%TYPE,
  p_sci_sum_weight                IN         stat_customer_invoices.sci_sum_weight%TYPE                     DEFAULT NULL,
  p_sci_sum_quantity              IN         stat_customer_invoices.sci_sum_quantity%TYPE                   DEFAULT NULL,
  p_sci_sum_inventory_quantity    IN         stat_customer_invoices.sci_sum_inventory_quantity%TYPE         DEFAULT NULL,
  p_sci_sum_royalty_amount        IN         stat_customer_invoices.sci_sum_royalty_amount%TYPE             DEFAULT 0,
  p_sci_sum_base_selling_cost     IN         stat_customer_invoices.sci_sum_base_selling_cost%TYPE          DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY stat_customer_invoices%ROWTYPE);

END SCI_PACK;
/