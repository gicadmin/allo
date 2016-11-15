CREATE OR REPLACE PACKAGE phenix.VED_OPERATION_PACK IS

FUNCTION EXIST_VED_FOR_VSA_FUNC(
  p_ved_vsa_code vendor_agreement_details.ved_vsa_code%TYPE
) RETURN BOOLEAN ;

FUNCTION EXIST_PROD_NO_DATE_FUNC(
  p_ved_vsa_code      IN vendor_agreement_details.ved_vsa_code%TYPE,
  p_ved_prf_prd_code  IN vendor_agreement_details.ved_prf_prd_code%TYPE,
  p_ved_prf_fmt_code  IN vendor_agreement_details.ved_prf_fmt_code%TYPE,
  p_ved_id            IN vendor_agreement_details.ved_id%TYPE
) RETURN BOOLEAN;

FUNCTION EXIST_PROD_WITH_DATE_FUNC(
  p_ved_vsa_code      IN vendor_agreement_details.ved_vsa_code%TYPE,
  p_ved_prf_prd_code  IN vendor_agreement_details.ved_prf_prd_code%TYPE,
  p_ved_prf_fmt_code  IN vendor_agreement_details.ved_prf_fmt_code%TYPE,
  p_ved_id            IN vendor_agreement_details.ved_id%TYPE,
  p_ved_start_date    IN vendor_agreement_details.ved_start_date%TYPE,
  p_ved_end_date      IN vendor_agreement_details.ved_end_date%TYPE
) RETURN BOOLEAN;

FUNCTION EXIST_GROUP_NO_DATE_FUNC(
  p_ved_vsa_code  IN vendor_agreement_details.ved_vsa_code%TYPE,
  p_ved_pgr_code  IN vendor_agreement_details.ved_prf_prd_code%TYPE,
  p_ved_id        IN vendor_agreement_details.ved_id%TYPE
) RETURN BOOLEAN;

FUNCTION EXIST_GROUP_WITH_DATE_FUNC(
  p_ved_vsa_code    IN vendor_agreement_details.ved_vsa_code%TYPE,
  p_ved_pgr_code    IN vendor_agreement_details.ved_prf_prd_code%TYPE,
  p_ved_id          IN vendor_agreement_details.ved_id%TYPE,
  p_ved_start_date  IN vendor_agreement_details.ved_start_date%TYPE,
  p_ved_end_date    IN vendor_agreement_details.ved_end_date%TYPE
) RETURN BOOLEAN;

FUNCTION DELETE_VED_VSA_CODE_FUNC (
  p_ved_vsa_code  vendor_agreement_details.ved_vsa_code%TYPE
) return NUMBER;

PROCEDURE PURGE_PROC(
  p_ved_prf_prd_code IN vendor_agreement_details.ved_prf_prd_code%TYPE,
  p_ved_prf_fmt_code IN vendor_agreement_details.ved_prf_fmt_code%TYPE
);

FUNCTION VALIDATE_DATES_FUNC(
  p_ved_pgr_code    IN  vendor_agreement_details.ved_pgr_code%TYPE,
  p_ved_start_date  IN  vendor_agreement_details.ved_start_date%TYPE,
  p_ved_end_date    IN  vendor_agreement_details.ved_end_date%TYPE,
  p_ved_vsa_code    IN  vendor_agreement_details.ved_vsa_code%TYPE,
  p_ved_id          IN  vendor_agreement_details.ved_id%TYPE
)
RETURN NUMBER;

FUNCTION VALIDATE_DATES_FUNC(
  p_ved_prf_prd_code  IN  vendor_agreement_details.ved_prf_prd_code%TYPE,
  p_ved_prf_fmt_code  IN  vendor_agreement_details.ved_prf_fmt_code%TYPE,
  p_ved_start_date    IN  vendor_agreement_details.ved_start_date%TYPE,
  p_ved_end_date      IN  vendor_agreement_details.ved_end_date%TYPE,
  p_ved_vsa_code      IN  vendor_agreement_details.ved_vsa_code%TYPE,
  p_ved_id            IN  vendor_agreement_details.ved_id%TYPE
)
RETURN NUMBER;

PROCEDURE SET_DATES_BY_VSA_PROC(
  p_ved_vsa_code    IN  vendor_agreement_details.ved_vsa_code%TYPE,
  p_ved_start_date  IN  vendor_agreement_details.ved_start_date%TYPE,
  p_ved_end_date    IN  vendor_agreement_details.ved_end_date%TYPE,
  p_ved_not_updated OUT NUMBER,
  p_ved_locked      OUT NUMBER
);

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep IN NUMBER,
  p_max_items       IN NUMBER
);

--BER7378 valider si un autre fournisseur (soit le courtier ou le manuf) a une entente coutant garanti qui entre en conflit de date
--et dont les mêmes clients/qty/nac sont en commun aussi...
FUNCTION VALIDATE_OTHER_VSA_FOR_GC_FUNC(
  p_ved_prf_prd_code  IN vendor_agreement_details.ved_prf_prd_code%TYPE,
  p_ved_prf_fmt_code  IN vendor_agreement_details.ved_prf_fmt_code%TYPE,
  p_ved_start_date    IN vendor_agreement_details.ved_start_date%TYPE,
  p_ved_end_date      IN vendor_agreement_details.ved_end_date%TYPE,
  p_ved_vsa_code      IN vendor_agreement_details.ved_vsa_code%TYPE,
  p_ved_id            IN vendor_agreement_details.ved_id%TYPE
) RETURN BOOLEAN;

--BER7378 valider si un fournisseur (habituellement le courtier) a des ententes coutants garanti pour un produit donné (peu importe le format)
FUNCTION DOES_VENDOR_HAVE_GC_FUNC(
  p_ven_code  IN NUMBER,
  p_prd_code  IN VARCHAR2
)
RETURN BOOLEAN;

END VED_OPERATION_PACK;
/