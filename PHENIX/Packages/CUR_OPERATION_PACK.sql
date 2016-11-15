CREATE OR REPLACE PACKAGE phenix.CUR_OPERATION_PACK IS

PROCEDURE GET_CUS_ALLOC_SALES_PROC(
  p_cus_code                      IN NUMBER,
  p_prd_code                      IN VARCHAR2,
  p_prd_ven_code                  IN NUMBER,
  p_prd_definition                IN VARCHAR2,
  p_sum_amount_sales              IN NUMBER,
  p_sum_inventory_quantity        IN NUMBER,
  p_sum_weight                    IN NUMBER,
  p_prog_distributed              OUT NUMBER,
  p_prog_collected                OUT NUMBER,
  p_prog_volume                   OUT NUMBER,
  p_quart_whouse                  OUT NUMBER,
  p_quart_whouse_volume           OUT NUMBER,
  p_transport                     OUT NUMBER,
  p_transport_volume              OUT NUMBER,
  p_growth                        OUT NUMBER,
  p_additionnal                   OUT NUMBER,
  p_internal_admin_cost           OUT NUMBER,
  p_dvn_code                      OUT NUMBER,
  p_log_id                        IN NUMBER,
  p_call_type                     IN VARCHAR2, --CSC8830
  p_invoice_date                  IN DATE,
  p_tcr_cus_transport_alloc_perc  OUT NUMBER,
  p_tcr_cus_whs_vol_alloc_percen  OUT NUMBER,
  p_tcr_cus_internal_admin_perce  OUT NUMBER,
  p_tcr_vcg_category_code         OUT VARCHAR2,
  p_tcr_vcg_qualifier             OUT VARCHAR2,
  p_tcr_vcg_quart_whs_avr_percen  OUT NUMBER,
  p_tcr_vcg_quart_whs_avr_amount  OUT NUMBER,
  p_tcr_nb_items                  OUT NUMBER,
  p_tcr_nb_killograms             OUT NUMBER,
  p_tcr_nb_livres                 OUT NUMBER,
  p_tcr_nb_litters                OUT NUMBER,
  p_tcr_sales_amount              OUT NUMBER,
  p_tcr_ret_transport             OUT NUMBER,
  p_tcr_ret_quart                 OUT NUMBER
);

PROCEDURE GET_CUS_ALLOC_DROP_PROC(
  p_cus_code                    IN NUMBER,
  p_ven_code                    IN NUMBER,
  p_sum_amount_sales            IN NUMBER,
  p_prog_distributed            OUT NUMBER,
  p_prog_collected              OUT NUMBER,
  p_prog_volume                 OUT NUMBER,
  p_quart_drop                  OUT NUMBER,
  p_quart_drop_volume           OUT NUMBER,
  p_term_drop                   OUT NUMBER,
  p_term_drop_volume            OUT NUMBER,
  p_additionnal                 OUT NUMBER,
  p_internal_admin_cost         OUT NUMBER,
  p_dvn_code                    OUT NUMBER,
  p_log_id                      IN NUMBER,
  p_call_type                   IN VARCHAR2, --CSC8830
  p_invoice_date                IN DATE,
  p_tcr_cus_addition_alloc_perc OUT NUMBER,
  p_tcr_cus_drop_vol_alloc_perc OUT NUMBER,
  p_tcr_cus_internal_admin_perc OUT NUMBER,
  p_tcr_ven_drop_terms          OUT NUMBER,
  p_tcr_ven_quart_drop_ship_avr OUT NUMBER,
  p_tcr_ret_quart_drop          OUT NUMBER,
  p_tcr_ret_quart_terme_drop    OUT NUMBER
);

PROCEDURE TREAT_COD_PROC(
  p_inh_id    IN invoice_headers.inh_id%TYPE,
  p_log_id    IN NUMBER,
  p_call_type IN VARCHAR2 DEFAULT 'R' --CSC8830
);

PROCEDURE TREAT_CAD_PROC(
  p_inh_id    IN invoice_headers.inh_id%TYPE,
  p_log_id    IN NUMBER,
  p_call_type IN VARCHAR2 DEFAULT 'R' --CSC8830
);

PROCEDURE TREAT_CDS_PROC(
  p_inh_id    IN invoice_headers.inh_id%TYPE,
  p_log_id    IN NUMBER,
  p_call_type IN VARCHAR2 DEFAULT 'R' --CSC8830
);

PROCEDURE CALCULATE_REMITTANCES_PROC(
  p_jsc_id IN NUMBER
);

--csc8675 ajouter les CUR dans la purge des INH
PROCEDURE PURGE_PROC(
  p_inh_id  IN invoice_headers.inh_id%TYPE
);

PROCEDURE GEN_REMITTANCE_DETAILS_PROC (
  p_de_date 			  IN DATE,
  p_a_date 				  IN DATE,
  p_du_client 			IN NUMBER,
  p_au_client 		  IN NUMBER
);
END CUR_OPERATION_PACK;
/