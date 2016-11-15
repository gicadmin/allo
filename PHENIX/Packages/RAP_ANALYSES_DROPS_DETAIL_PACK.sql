CREATE OR REPLACE PACKAGE phenix.RAP_ANALYSES_DROPS_DETAIL_PACK IS

PROCEDURE RAP_ANALYSES_DROPS_DETAIL_PROC (
	p_cus_code				      IN NUMBER,
	p_ven_code				      IN NUMBER,
	p_rct_code				      IN NUMBER,
	p_div_code              IN NUMBER,
  p_facturees_incluses    IN VARCHAR2,
  p_program_method        IN VARCHAR2,
	p_de_date 						  IN DATE,
	p_a_date 							  IN DATE,
  p_afficher_fournisseur  IN VARCHAR2,
  p_afficher_volume       IN VARCHAR2,
  p_language_rapport      IN VARCHAR2 DEFAULT 'FR'
);
PROCEDURE INSERT_TDD_PROC (
	p_tdd_cus_code	            IN NUMBER,
	p_tdd_cus_name	            IN VARCHAR2,
	p_tdd_rcl_id                IN NUMBER,
	p_tdd_rcl_name	            IN VARCHAR2,
	p_tdd_ven_code	            IN NUMBER,
	p_tdd_ven_name	            IN VARCHAR2,
 	p_tdd_rcl_prv_code	        IN VARCHAR2,
	p_tdd_vta_rebate_percent	  IN NUMBER,
	p_tdd_cds_sales_amount	    IN NUMBER,
	p_tdd_crc_cus_client_code   IN VARCHAR2,  --bea53
	p_tdd_rebate_amount	        IN NUMBER,
	p_tdd_nb_frs_vol_diff_zero  IN NUMBER,
	p_tdd_count_tot_frs		      IN NUMBER
);

END RAP_ANALYSES_DROPS_DETAIL_PACK;
/