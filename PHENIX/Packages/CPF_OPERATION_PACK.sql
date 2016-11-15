CREATE OR REPLACE PACKAGE phenix.CPF_OPERATION_PACK IS

PROCEDURE DELETE_ALL_INVALID_CPF_PROC(
  p_log_id                      IN NUMBER,
  p_cou_or_con_or_not_sellable  OUT NUMBER,
  p_class_not_allowed           OUT NUMBER,
  p_alc_or_tob_not_allowed      OUT NUMBER,
  p_no_qtd_for_product          OUT NUMBER
);

--fonction appeller par la purge des profils
--validation des produits saisonnier et delete les profils pas commandé depuis trop longtemps (en comptant les semaines de saison seulement)
FUNCTION FIND_SEASONAL_AND_DELETE_FUNC(
  p_log_id                      IN NUMBER,
  p_ctr_profile_weeks_seasonal  IN NUMBER,
  p_ctr_week_for_average        IN NUMBER,
  p_cpf_date_purge              OUT NUMBER,
  p_cpw_date_purge              OUT NUMBER
)
RETURN BOOLEAN;

--fonction appeller par la purge des profils
--validation des produits régulier (non saisonnier) et delete les profils pas commandé depuis trop longtemps
FUNCTION FIND_NOT_SEASONAL_AND_DEL_FUNC(
  p_log_id                    IN NUMBER,
  p_ctr_profile_weeks_regular IN NUMBER,
  p_ctr_week_for_average      IN NUMBER,
  p_cpf_date_purge            OUT NUMBER,
  p_cpw_date_purge            OUT NUMBER
)
RETURN BOOLEAN;

FUNCTION DELETE_CPF_BY_LAST_DATE_FUNC(
  p_last_date IN DATE,
  p_prd_code  IN VARCHAR2 DEFAULT NULL  --sans code produit, on delete seulement les produits NON SAISONNIER
)
RETURN NUMBER;

PROCEDURE UPDATE_CPF_INFO_PROC;

PROCEDURE CREATE_STATS_MISSING_FOR_PROC(
  p_ctr_week_for_average  IN NUMBER,
  p_log_id                IN NUMBER,
  p_nb_calculated         OUT NUMBER,
  p_nb_locked             OUT NUMBER
);

PROCEDURE UPDATE_CUSTOMER_PROFILES_PROC(
  p_inh_id                IN  invoice_headers.inh_id%TYPE
);

PROCEDURE UPDATE_ALL_CUST_PROFILES_PROC;

PROCEDURE PURGE_PROC(
  p_cpf_prf_prd_code IN customer_profiles.cpf_prf_prd_code%TYPE,
  p_cpf_prf_fmt_code IN customer_profiles.cpf_prf_fmt_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_cpf_ven_code IN customer_profiles.cpf_ven_next_delivery_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_cpf_cus_code IN customer_profiles.cpf_cus_code%TYPE
);

END CPF_OPERATION_PACK;
/