CREATE OR REPLACE PACKAGE phenix.ACCPAC_LOADING_PACK IS

PROCEDURE UPDATE_ACC_CUSTOMER_PROC (
  p_from_cus_code IN NUMBER,
  p_to_cus_code   IN NUMBER,
  p_update_code   IN VARCHAR2
);

PROCEDURE UPDATE_ACC_VENDOR_PROC (
  p_from_ven_code IN NUMBER,
  p_to_ven_code   IN NUMBER,
  p_update_code   IN VARCHAR2   --'A ' pour ajouter    'M' pour modifier ...
);

PROCEDURE ACCPAC_SINGLE_CUSTOMER_PROC (
  p_cus_code                  IN NUMBER,
  p_cus_name                  IN VARCHAR2,
  p_cus_cus_code              IN NUMBER,     --ROL648
  p_cus_customer_alpha_index  IN VARCHAR2,
  p_cus_address               IN VARCHAR2,
  p_cus_city                  IN VARCHAR2,
  p_cus_postal_code           IN VARCHAR2,
  p_cus_telephone             IN NUMBER,
  p_cus_fax_number            IN NUMBER,
  p_cus_trt_code              IN NUMBER,
  p_cus_interest              IN NUMBER,
  p_cus_terms                 IN VARCHAR2,
  p_prv_code                  IN VARCHAR2,
  p_cus_federal_tax_number    IN VARCHAR2,
  p_cus_provincial_tax_number IN VARCHAR2,
  p_cus_credit_limit          IN NUMBER,
  p_cus_language_flag         IN VARCHAR2,
  p_tfe_switch                IN VARCHAR2,
  p_bank_account_number       IN VARCHAR2,
  p_institution_number        IN VARCHAR2,
  p_update_flag               IN VARCHAR2,
  p_cus_use_code              IN NUMBER,
  p_cus_deleted_switch        IN NUMBER,
  p_cus_elimination_date      IN DATE
);

PROCEDURE LOAD_INITIAL_CUS_PROC (
  p_from_cus_code IN NUMBER,
  p_to_cus_code   IN NUMBER,
  p_update_code   IN VARCHAR2
);

--csc2074 création initiale de la procédure pour le partenariat
PROCEDURE ACC_UPDATE_RCL_PROC(
	p_from_rcl_id IN NUMBER,
	p_to_rcl_id 	IN NUMBER,
	p_flag 				IN VARCHAR2
);

--csc2074 function appellé par define_retail_client_types
--lorsqu'un type de détaillant devient "partenariat" pour que le select etc soit plus rapide dans la BD que dans la forme
--puisque plusieurs détaillants doivent être envoyés en même temps
FUNCTION SEND_RCL_TO_ACCPAC_FUNC(
	p_rct_code 	IN NUMBER,
	p_sqlerrm 	OUT VARCHAR2
)
RETURN BOOLEAN;

END ACCPAC_LOADING_PACK;
/