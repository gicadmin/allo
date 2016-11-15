CREATE OR REPLACE PACKAGE phenix.TCP_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_customer_price_lists%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tcp_prf_prd_code     IN         temporary_customer_price_lists.tcp_prf_prd_code%TYPE,
  p_tcp_prf_fmt_code     IN         temporary_customer_price_lists.tcp_prf_fmt_code%TYPE,
  p_tcp_selling_retail   IN         temporary_customer_price_lists.tcp_selling_retail%TYPE,
  p_tcp_promotion_amount IN         temporary_customer_price_lists.tcp_promotion_amount%TYPE,
  p_tcp_discount_amount  IN         temporary_customer_price_lists.tcp_discount_amount%TYPE,
  p_tcp_pricing_source   IN         temporary_customer_price_lists.tcp_pricing_source%TYPE,
  p_tcp_cpr_pty_code     IN         temporary_customer_price_lists.tcp_cpr_pty_code%TYPE          DEFAULT NULL,
  p_tcp_cpr_from_date    IN         temporary_customer_price_lists.tcp_cpr_from_date%TYPE         DEFAULT NULL,
  p_tcp_cpr_to_date      IN         temporary_customer_price_lists.tcp_cpr_to_date%TYPE           DEFAULT NULL,
  p_tcp_prf_description  IN         temporary_customer_price_lists.tcp_prf_description%TYPE       DEFAULT NULL,
  p_tcp_prd_description  IN         temporary_customer_price_lists.tcp_prd_description%TYPE       DEFAULT NULL,
  p_tcp_brn_description  IN         temporary_customer_price_lists.tcp_brn_description%TYPE       DEFAULT NULL,
  p_tcp_prf_upc_code     IN         temporary_customer_price_lists.tcp_prf_upc_code%TYPE          DEFAULT NULL,
  p_tcp_prd_ven_name     IN         temporary_customer_price_lists.tcp_prd_ven_name%TYPE          DEFAULT NULL,
  p_tcp_prd_ctg_code     IN         temporary_customer_price_lists.tcp_prd_ctg_code%TYPE          DEFAULT NULL,
  p_tcp_ctg_description  IN         temporary_customer_price_lists.tcp_ctg_description%TYPE       DEFAULT NULL,
  p_tcp_profil_switch    IN         temporary_customer_price_lists.tcp_profil_switch%TYPE         DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_customer_price_lists%ROWTYPE);

END TCP_PACK;
/