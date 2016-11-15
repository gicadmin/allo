CREATE OR REPLACE PACKAGE phenix.ACCPAC_DROP_PACK IS

--fonction directement appellé par l'écran confirm_process.fmb
FUNCTION AP_AR_RECONCILIATION_FUNC (
	p_use_code 	              IN NUMBER,
	p_sqlerrm 	              OUT VARCHAR2,
	p_try_only_for_validation IN NUMBER    --csc8090
)
RETURN BOOLEAN;

FUNCTION AP_RECONCIL_DROP_FUNC(
	p_log_id 	                IN NUMBER,	--usg323
	p_sqlerrm                 OUT VARCHAR2,
	p_try_only_for_validation IN NUMBER    --csc8090
)
RETURN BOOLEAN;

FUNCTION AR_RECONCIL_GLOBAL_FUNC (
	p_use_code 		            IN NUMBER,
	p_log_id 			            IN NUMBER,
	p_list_inh_id	            OUT VARCHAR2,
	p_sqlerrm 		            OUT VARCHAR2,
	p_try_only_for_validation IN NUMBER    --csc8090
)
RETURN BOOLEAN;

FUNCTION AR_RECONCIL_SINGLE_FUNC (
	p_use_code 		            IN NUMBER,
	p_log_id			            IN NUMBER,
	p_list_inh_id	            OUT VARCHAR2,
	p_sqlerrm 		            OUT VARCHAR2,
	p_try_only_for_validation IN NUMBER --csc8090
)
RETURN BOOLEAN;

FUNCTION AR_CREATE_SINGLE_FUNC(
	p_log_id	IN NUMBER,
	p_sqlerrm	OUT VARCHAR2,
  p_try_only_for_validation IN NUMBER --csc8090
)
RETURN BOOLEAN;

FUNCTION AR_RECONCIL_MULTIPLE_FUNC (
	p_use_code 			          IN NUMBER,
	p_log_id 				          IN NUMBER,
	p_list_inh_id 	          OUT VARCHAR2,
	p_sqlerrm				          OUT VARCHAR2,
  p_try_only_for_validation IN  NUMBER
)
RETURN BOOLEAN;

--CSC1266 procédure pour la réconciliation des DROP arrivé par fichier 810 EDI
-- (basé sur le code de AR_RECONCIL_MULTIPLE_PROC en grande partie...)
FUNCTION AR_RECONCIL_810_FUNC (
	p_use_code 		            IN NUMBER,
	p_log_id			            IN NUMBER,
	p_list_inh_id	            OUT VARCHAR2,
	p_sqlerrm			            OUT VARCHAR2,
  p_try_only_for_validation IN NUMBER   --csc8090
)
RETURN BOOLEAN;

FUNCTION ACC_INSERT_INVOICE_FUNC (
  p_log_id					      IN NUMBER,	--usg323
  p_inh_id                IN NUMBER,
  p_cus_code              IN NUMBER,
  p_amount                IN NUMBER,
  p_provicial_tax         IN NUMBER,
  p_federal_tax           IN NUMBER,
  p_use_code       	      IN NUMBER,	--utiliser le use_code au lieu du login
  p_sqlerrm					      OUT VARCHAR2,	--usg323
  p_ref_number            IN VARCHAR2 DEFAULT NULL,         --csc1266
  p_surcharge_drop_amount IN NUMBER   DEFAULT NULL--USG851
)
RETURN BOOLEAN;

PROCEDURE AP_AR_RECONCIL_AUTOMAT_PROC (
 p_jsc_id IN NUMBER
);

END ACCPAC_DROP_PACK;
/