CREATE OR REPLACE PACKAGE phenix.ACCPAC_INFO_PACK IS

PROCEDURE AC_CALCULATE_AMOUNT_DUE_PROC (
  p_cus_code                 IN  NUMBER,
  p_amount_due               OUT NUMBER,
  p_head_office_amount_due   OUT NUMBER,
  p_amount_pass              OUT NUMBER,--fre2924
  p_head_office_amount_pass  OUT NUMBER --fre2924
);

FUNCTION GET_CUSTOMER_AGEING_FUNC (
  p_cus_code                IN  NUMBER,
  p_term                    IN  VARCHAR2,
 	p_include_unposted_switch IN  NUMBER,  --USG366
 	p_amount_current					OUT NUMBER,  --USG366
  p_amount_1_to_7 					OUT NUMBER,
  p_amount_8_to_14 					OUT NUMBER,
  p_amount_15_to_21				  OUT NUMBER,
  p_amount_22_to_28					OUT NUMBER,
  p_amount_29_plus 					OUT NUMBER,
  p_postdated_checks_amount OUT NUMBER,
  p_credit_amount           OUT NUMBER,
  p_term_description        OUT VARCHAR2,
  p_include_open_switch     IN  NUMBER DEFAULT 1 --FRE4579
)
RETURN NUMBER;

FUNCTION FIND_AMOUNT_INVOICE (
	p_cus_code IN NUMBER,
  p_include_open_switch IN NUMBER DEFAULT 1 --FRE4579
)
RETURN NUMBER;

--CVI64 fonction utilisée pour déterminé le bon compte GL lorsque le systeme post par territories seulement
--cvi105 Modifier la fonction pour prendre en compte les nouveaux comptes GL pour les coutants.
--les valeurs du paramétre p_transaction_type sont:
--  DR = drop,            CR = credit/débit,          SR = sales,
--  DC = drop_coutant,    CC = credit/débit_coutant,  SC = sales_coutant,
--  TI = etiquettes,      TR = transport
FUNCTION DETERMINE_GL_FUNC(
	p_transaction_type 	IN VARCHAR2,
	p_cus_code 					IN NUMBER,
	p_prd_code 					IN VARCHAR2 DEFAULT NULL,
	p_cus_trt_code			IN NUMBER DEFAULT NULL,
	p_prd_pgr_code			IN NUMBER DEFAULT NULL
)
RETURN VARCHAR2;

PROCEDURE GET_TERM_INFO_PROC(
  p_cus_terms  IN  customers.cus_terms%TYPE,
  p_pctdisc    OUT arrtb.pctdisc%TYPE,
  p_numdays    OUT arrtb.numdays%TYPE,
  p_textdesc   OUT arrta.textdesc%TYPE
);

PROCEDURE GET_BANC_INFO_PROC(
  p_cus_code               IN  customers.cus_code%TYPE,
  p_tfe                    OUT arcuso.value%TYPE,
  p_cus_bank_account_numb  OUT arcuso.value%TYPE,
  p_cus_institution_numb   OUT arcuso.value%TYPE
);

FUNCTION GET_MAX_DAY_PAST_FUNC (
  p_cus_code                IN  NUMBER
 )
RETURN NUMBER;

FUNCTION EXISTS_IN_ACCPAC_FUNC(
  p_cus_code IN customers.cus_code%TYPE,
  p_inh_id   IN invoice_headers.inh_id%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_LEFT_TO_PAY_FUNC(
  p_cus_code IN customers.cus_code%TYPE,
  p_include_open_switch IN NUMBER DEFAULT 1 --FRE4579
)
RETURN NUMBER;

FUNCTION GET_AVAILABLE_CREDIT_FUNC(
  p_cus_code IN customers.cus_code%TYPE
)
RETURN NUMBER;

FUNCTION EXISTS_IDCUST_FUNC(
  p_cus_code IN customers.cus_code%TYPE
)
RETURN BOOLEAN;

END ACCPAC_INFO_PACK;
/