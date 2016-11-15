CREATE OR REPLACE PACKAGE phenix.TCR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_customer_remittances%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tcr_year                       IN         temporary_customer_remittances.tcr_year%TYPE,
  p_tcr_period                     IN         temporary_customer_remittances.tcr_period%TYPE,
  p_tcr_cus_code                   IN         temporary_customer_remittances.tcr_cus_code%TYPE,
  p_tcr_cus_name                   IN         temporary_customer_remittances.tcr_cus_name%TYPE                        DEFAULT NULL,
  p_tcr_inh_id                     IN         temporary_customer_remittances.tcr_inh_id%TYPE                          DEFAULT NULL,
  p_tcr_inh_invoice_date           IN         temporary_customer_remittances.tcr_inh_invoice_date%TYPE                DEFAULT NULL,
  p_tcr_inh_type                   IN         temporary_customer_remittances.tcr_inh_type%TYPE                        DEFAULT NULL,
  p_tcr_cus_transport_alloc_perc   IN         temporary_customer_remittances.tcr_cus_transport_alloc_perc%TYPE        DEFAULT NULL,
  p_tcr_cus_whs_vol_alloc_percen   IN         temporary_customer_remittances.tcr_cus_whs_vol_alloc_percent%TYPE       DEFAULT NULL,
  p_tcr_cus_drop_vol_alloc_perce   IN         temporary_customer_remittances.tcr_cus_drop_vol_alloc_percent%TYPE      DEFAULT NULL,
  p_tcr_cus_internal_admin_perce   IN         temporary_customer_remittances.tcr_cus_internal_admin_percent%TYPE      DEFAULT NULL,
  p_tcr_cus_addition_alloc_perce   IN         temporary_customer_remittances.tcr_cus_addition_alloc_percent%TYPE      DEFAULT NULL,
  p_tcr_prd_code                   IN         temporary_customer_remittances.tcr_prd_code%TYPE                        DEFAULT NULL,
  p_tcr_prd_description            IN         temporary_customer_remittances.tcr_prd_description%TYPE                 DEFAULT NULL,
  p_tcr_prd_ven_code               IN         temporary_customer_remittances.tcr_prd_ven_code%TYPE                    DEFAULT NULL,
  p_tcr_ven_name                   IN         temporary_customer_remittances.tcr_ven_name%TYPE                        DEFAULT NULL,
  p_tcr_vcg_category_code          IN         temporary_customer_remittances.tcr_vcg_category_code%TYPE               DEFAULT NULL,
  p_tcr_vcg_qualifier              IN         temporary_customer_remittances.tcr_vcg_qualifier%TYPE                   DEFAULT NULL,
  p_tcr_vcg_quart_whs_avr_percen   IN         temporary_customer_remittances.tcr_vcg_quart_whs_avr_percent%TYPE       DEFAULT NULL,
  p_tcr_vcg_quart_whs_avr_amount   IN         temporary_customer_remittances.tcr_vcg_quart_whs_avr_amount%TYPE        DEFAULT NULL,
  p_tcr_sales_amount               IN         temporary_customer_remittances.tcr_sales_amount%TYPE                    DEFAULT NULL,
  p_tcr_nb_items                   IN         temporary_customer_remittances.tcr_nb_items%TYPE                        DEFAULT NULL,
  p_tcr_nb_killograms              IN         temporary_customer_remittances.tcr_nb_killograms%TYPE                   DEFAULT NULL,
  p_tcr_nb_livres                  IN         temporary_customer_remittances.tcr_nb_livres%TYPE                       DEFAULT NULL,
  p_tcr_nb_litters                 IN         temporary_customer_remittances.tcr_nb_litters%TYPE                      DEFAULT NULL,
  p_tcr_rem_transport              IN         temporary_customer_remittances.tcr_rem_transport%TYPE                   DEFAULT NULL,
  p_tcr_ret_transport              IN         temporary_customer_remittances.tcr_ret_transport%TYPE                   DEFAULT NULL,
  p_tcr_cm_inh_id                  IN         temporary_customer_remittances.tcr_cm_inh_id%TYPE                       DEFAULT NULL,
  p_tcr_rem_quart                  IN         temporary_customer_remittances.tcr_rem_quart%TYPE                       DEFAULT NULL,
  p_tcr_ret_quart                  IN         temporary_customer_remittances.tcr_ret_quart%TYPE                       DEFAULT NULL,
  p_tcr_quart_admin_cost           IN         temporary_customer_remittances.tcr_quart_admin_cost%TYPE                DEFAULT NULL,
  p_tcr_rem_quart_drop             IN         temporary_customer_remittances.tcr_rem_quart_drop%TYPE                  DEFAULT NULL,
  p_tcr_ret_quart_drop             IN         temporary_customer_remittances.tcr_ret_quart_drop%TYPE                  DEFAULT NULL,
  p_tcr_rem_quart_terme_drop       IN         temporary_customer_remittances.tcr_rem_quart_terme_drop%TYPE            DEFAULT NULL,
  p_tcr_ret_quart_terme_drop       IN         temporary_customer_remittances.tcr_ret_quart_terme_drop%TYPE            DEFAULT NULL,
  p_tcr_admin_quart_drop_and_ter   IN         temporary_customer_remittances.tcr_admin_quart_drop_and_term%TYPE       DEFAULT NULL,
  p_tcr_cds_reference_number       IN         temporary_customer_remittances.tcr_cds_reference_number%TYPE            DEFAULT NULL,
  p_tcr_vds_reference_number       IN         temporary_customer_remittances.tcr_vds_reference_number%TYPE            DEFAULT NULL,
  p_tcr_ven_drop_terms             IN         temporary_customer_remittances.tcr_ven_drop_terms%TYPE                  DEFAULT NULL,
  p_tcr_ven_quart_drop_ship_avr    IN         temporary_customer_remittances.tcr_ven_quart_drop_ship_avr%TYPE         DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_customer_remittances%ROWTYPE);

END TCR_PACK;
/