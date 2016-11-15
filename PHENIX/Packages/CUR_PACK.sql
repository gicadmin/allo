CREATE OR REPLACE PACKAGE phenix.CUR_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_remittances%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cur_id                         IN         customer_remittances.cur_id%TYPE,
  p_cur_rec                        OUT NOCOPY customer_remittances%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cur_id                         IN         customer_remittances.cur_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cur_id                         IN         customer_remittances.cur_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cur_id                         IN         customer_remittances.cur_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cur_id                         IN         customer_remittances.cur_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cur_id                         IN         customer_remittances.cur_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_cur_fca_year                   IN         customer_remittances.cur_fca_year%TYPE,
  p_cur_fca_period                 IN         customer_remittances.cur_fca_period%TYPE,
  p_cur_cus_code                   IN         customer_remittances.cur_cus_code%TYPE,
  p_cur_prd_code                   IN         customer_remittances.cur_prd_code%TYPE,
  p_cur_whs_delivery_code          IN         customer_remittances.cur_whs_delivery_code%TYPE,
  p_cur_dvn_code                   IN         customer_remittances.cur_dvn_code%TYPE,
  p_cur_rec                        OUT NOCOPY customer_remittances%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cur_fca_year                   IN         customer_remittances.cur_fca_year%TYPE,
  p_cur_fca_period                 IN         customer_remittances.cur_fca_period%TYPE,
  p_cur_cus_code                   IN         customer_remittances.cur_cus_code%TYPE,
  p_cur_prd_code                   IN         customer_remittances.cur_prd_code%TYPE,
  p_cur_whs_delivery_code          IN         customer_remittances.cur_whs_delivery_code%TYPE,
  p_cur_dvn_code                   IN         customer_remittances.cur_dvn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cur_fca_year                   IN         customer_remittances.cur_fca_year%TYPE,
  p_cur_fca_period                 IN         customer_remittances.cur_fca_period%TYPE,
  p_cur_cus_code                   IN         customer_remittances.cur_cus_code%TYPE,
  p_cur_prd_code                   IN         customer_remittances.cur_prd_code%TYPE,
  p_cur_whs_delivery_code          IN         customer_remittances.cur_whs_delivery_code%TYPE,
  p_cur_dvn_code                   IN         customer_remittances.cur_dvn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cur_fca_year                   IN         customer_remittances.cur_fca_year%TYPE,
  p_cur_fca_period                 IN         customer_remittances.cur_fca_period%TYPE,
  p_cur_cus_code                   IN         customer_remittances.cur_cus_code%TYPE,
  p_cur_prd_code                   IN         customer_remittances.cur_prd_code%TYPE,
  p_cur_whs_delivery_code          IN         customer_remittances.cur_whs_delivery_code%TYPE,
  p_cur_dvn_code                   IN         customer_remittances.cur_dvn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cur_fca_year                   IN         customer_remittances.cur_fca_year%TYPE,
  p_cur_fca_period                 IN         customer_remittances.cur_fca_period%TYPE,
  p_cur_cus_code                   IN         customer_remittances.cur_cus_code%TYPE,
  p_cur_prd_code                   IN         customer_remittances.cur_prd_code%TYPE,
  p_cur_whs_delivery_code          IN         customer_remittances.cur_whs_delivery_code%TYPE,
  p_cur_dvn_code                   IN         customer_remittances.cur_dvn_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cur_fca_year                   IN         customer_remittances.cur_fca_year%TYPE,
  p_cur_fca_period                 IN         customer_remittances.cur_fca_period%TYPE,
  p_cur_cus_code                   IN         customer_remittances.cur_cus_code%TYPE,
  p_cur_prd_code                   IN         customer_remittances.cur_prd_code%TYPE,
  p_cur_whs_delivery_code          IN         customer_remittances.cur_whs_delivery_code%TYPE,
  p_cur_dvn_code                   IN         customer_remittances.cur_dvn_code%TYPE);


FUNCTION INSERT_FUNC(
  p_cur_fca_year                IN         customer_remittances.cur_fca_year%TYPE,
  p_cur_fca_period              IN         customer_remittances.cur_fca_period%TYPE,
  p_cur_cus_code                IN         customer_remittances.cur_cus_code%TYPE,
  p_cur_whs_delivery_code       IN         customer_remittances.cur_whs_delivery_code%TYPE,
  p_cur_dvn_code                IN         customer_remittances.cur_dvn_code%TYPE,
  p_cur_prog_distr_amount       IN         customer_remittances.cur_prog_distr_amount%TYPE,
  p_cur_prog_distr_vol_amount   IN         customer_remittances.cur_prog_distr_vol_amount%TYPE,
  p_cur_quart_drop_amount       IN         customer_remittances.cur_quart_drop_amount%TYPE,
  p_cur_quart_drop_vol_amount   IN         customer_remittances.cur_quart_drop_vol_amount%TYPE,
  p_cur_term_drop_amount        IN         customer_remittances.cur_term_drop_amount%TYPE,
  p_cur_term_drop_vol_amount    IN         customer_remittances.cur_term_drop_vol_amount%TYPE,
  p_cur_quart_whouse_amount     IN         customer_remittances.cur_quart_whouse_amount%TYPE,
  p_cur_quart_whouse_vol_amount IN         customer_remittances.cur_quart_whouse_vol_amount%TYPE,
  p_cur_transport_amount        IN         customer_remittances.cur_transport_amount%TYPE,
  p_cur_transport_vol_amount    IN         customer_remittances.cur_transport_vol_amount%TYPE,
  p_cur_prog_collected_amount   IN         customer_remittances.cur_prog_collected_amount%TYPE,
  p_cur_growth_amount           IN         customer_remittances.cur_growth_amount%TYPE,
  p_cur_additional_amount       IN         customer_remittances.cur_additional_amount%TYPE,
  p_cur_internal_admin_cost     IN         customer_remittances.cur_internal_admin_cost%TYPE,
  p_cur_prd_code                IN         customer_remittances.cur_prd_code%TYPE                     DEFAULT NULL,
  p_cur_inh_id                  IN         customer_remittances.cur_inh_id%TYPE                       DEFAULT NULL,
  p_cur_to_accpac_date          IN         customer_remittances.cur_to_accpac_date%TYPE               DEFAULT NULL,
  p_cur_quart_inh_id            IN         customer_remittances.cur_quart_inh_id%TYPE                 DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_remittances%ROWTYPE)
RETURN NUMBER;

END CUR_PACK;
/