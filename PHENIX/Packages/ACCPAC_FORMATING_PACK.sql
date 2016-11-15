CREATE OR REPLACE PACKAGE phenix.ACCPAC_FORMATING_PACK IS

FUNCTION ACC_AP_WRITE_FUNC (
  p_ven_code           	IN  NUMBER,
  p_vds_id             	IN  VARCHAR2,
  p_type               	IN  VARCHAR2,
  p_date               	IN  DATE,
  p_amount             	IN  NUMBER,
  p_amount_tot         	IN  NUMBER,
  p_divsion_ar_drop    	IN  VARCHAR2,
  p_provicial_tax      	IN  NUMBER,
  p_federal_tax        	IN  NUMBER,
  p_tobacco_tax        	IN  NUMBER,
  p_reference_number   	IN  VARCHAR2,
  p_terms              	IN  VARCHAR2,
  p_grand_livre        	IN  VARCHAR2,
  p_transaction        	IN  VARCHAR2,
  p_other_reference			IN 	VARCHAR2 DEFAULT NULL	--USG623
)
RETURN VARCHAR2;

FUNCTION ACC_AR_WRITE_FUNC (
  p_cus_code           	IN  VARCHAR2,
  p_invoice            	IN  NUMBER,
  p_type               	IN  VARCHAR2,
  p_province_code      	IN  VARCHAR2,
  p_divsion_ar_drop    	IN  VARCHAR2,
  p_provicial_tax      	IN  NUMBER,
  p_federal_tax        	IN  NUMBER,
  p_amount_sales       	IN  NUMBER,
  p_reference_number   	IN  VARCHAR2,	--csc1254 était number... est devenu varchar2
  p_grand_livre        	IN  VARCHAR2,
  p_transaction        	IN  VARCHAR2,
  p_date               	IN  DATE DEFAULT SYSDATE,                 --CSC1653
  p_other_reference			IN 	VARCHAR2 DEFAULT NULL	--USG623
)
RETURN VARCHAR2;

--cvi105 nouvelle fonction pour le posting des coutants
FUNCTION ACC_GL_WRITE_FUNC (
  p_accpac_trans   IN NUMBER,
  p_transaction    IN VARCHAR2,
  p_gl_account     IN VARCHAR2,
  p_invoice        IN NUMBER,
  p_gl_description IN VARCHAR2,
  p_amount_cost    IN NUMBER
)
RETURN VARCHAR2;

--CSC8489 copie presque exacte de ACC GL WRITE FUNC, mais avec des descriptions pouvant être différentes pour les champs 4 et 5
FUNCTION ACC_GL_EXTRA_DESC_WRITE_FUNC (
  p_accpac_trans         IN NUMBER,
  p_transaction_part_1   IN VARCHAR2,
  p_transaction_part_2   IN VARCHAR2,
  p_gl_account           IN VARCHAR2,
  p_invoice              IN NUMBER,
  p_gl_description       IN VARCHAR2,
  p_amount_cost          IN NUMBER,
  p_date                 IN DATE DEFAULT SYSDATE  --CSC8720
)
RETURN VARCHAR2;

FUNCTION ACC_CUST_WRITE_FUNC (
  p_cus_code                IN VARCHAR2,
  p_cus_name                IN VARCHAR2,
  p_cus_cus_code            IN VARCHAR2,        --ROL648
  p_custmomer_alpha_index   IN VARCHAR2,
  p_address                 IN VARCHAR2,
  p_city                    IN VARCHAR2,
  p_province                IN VARCHAR2,
  p_country                 IN VARCHAR2,
  p_postal_code             IN VARCHAR2,
  p_telephone               IN NUMBER,
  p_extension               IN NUMBER,
  p_fax                     IN NUMBER,
  p_contact_name            IN VARCHAR2,
  p_territory               IN NUMBER,
  p_interest                IN NUMBER,
  p_terms                   IN VARCHAR2,
  p_prv_code                IN VARCHAR2,
  p_federal_tax             IN NUMBER,
  p_provicial_tax           IN NUMBER,
  p_federal_tax_number      IN VARCHAR2,
  p_provicial_tax_number    IN VARCHAR2,
  p_credit_limit            IN NUMBER,
  p_language_flag           IN VARCHAR2,
  p_tfe_switch              IN VARCHAR2,
  p_bank_account_number     IN VARCHAR2,
  p_institution_number      IN VARCHAR2,
  p_update_code             IN VARCHAR2,
  p_cus_use_code            IN NUMBER,
  p_cus_deleted_switch      IN NUMBER,
  p_cus_elimination_date    IN DATE
)
RETURN VARCHAR2;

FUNCTION ACC_VEND_WRITE_FUNC (
  p_ven_code               IN NUMBER,
  p_ven_name               IN VARCHAR2,
  p_short_name             IN VARCHAR2,
  p_address                IN VARCHAR2,
  p_city                   IN VARCHAR2,
  p_province               IN VARCHAR2,
  p_country                IN VARCHAR2,
  p_postal_code            IN VARCHAR2,
  p_telephone              IN NUMBER,
  p_extension              IN NUMBER,
  p_fax                    IN NUMBER,
  p_contact_name           IN VARCHAR2,
  p_terms                  IN VARCHAR2,
  p_prv_code               IN VARCHAR2,
  p_provicial_tax          IN NUMBER,
  p_federal_tax            IN NUMBER,
  p_update_code            IN VARCHAR2,
  p_ven_ven_payable_code   IN NUMBER,
  p_ven_status             IN vendors.ven_status%TYPE,
  p_ven_elimination_date   IN vendors.ven_elimination_date%TYPE
)
RETURN VARCHAR2;

--csc2074 création initiale de la procédure pour le partenariat
FUNCTION ACC_RCL_WRITE_FUNC(
	p_retail_client_prefix 	IN VARCHAR2,
	p_rcl_id 								IN VARCHAR2,
	p_rcl_name							IN VARCHAR2,
	p_address								IN VARCHAR2,
	p_city									IN VARCHAR2,
	p_prv_name							IN VARCHAR2,
	p_cun_description				IN VARCHAR2,
	p_postal_code						IN VARCHAR2,
	p_telephone_number			IN NUMBER,
	p_fax_number						IN NUMBER,
	p_contact_name					IN VARCHAR2,
	p_terms 								IN VARCHAR2,
	p_prv_code							IN VARCHAR2,
	p_provincial_tax				IN NUMBER,
	p_federal_tax						IN NUMBER,
	p_update_code						IN VARCHAR2
)
RETURN VARCHAR2;

--csc2074 création initiale de la procédure pour le partenariat
FUNCTION ACC_AP_RCL_WRITE_FUNC(
	p_prefix 						IN VARCHAR2,
	p_rcl_id 						IN NUMBER,
	p_inh_id 						IN NUMBER,
	p_type 							IN VARCHAR2,
	p_date 							IN DATE,
	p_amount 						IN NUMBER,
	p_gl_account 				IN VARCHAR2,
	p_prov_tax_amount 	IN NUMBER,
	p_fed_tax_amount 		IN NUMBER,
	p_reference_number 	IN VARCHAR2,
	p_terms							IN VARCHAR2,
	p_message 					IN VARCHAR2,
	p_prv_code 					IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION ACC_PAYMENT_WRITE_FUNC(
  p_srth_date       IN sales_register_trans_headers.srth_date%TYPE,
  p_srth_inh_id     IN sales_register_trans_headers.srth_inh_id%TYPE,
  p_srth_cre_code   IN sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_whs_code   IN sales_register_trans_headers.srth_whs_code%TYPE,
  p_srtd_tty_code   IN sales_register_trans_details.srtd_tty_code%TYPE,
  p_cus_code        IN customers.cus_code%TYPE,
  p_amount          IN NUMBER,
  p_refund_switch   IN NUMBER,
  p_rounding_amount IN NUMBER
)
RETURN VARCHAR2;

END ACCPAC_FORMATING_PACK;
/