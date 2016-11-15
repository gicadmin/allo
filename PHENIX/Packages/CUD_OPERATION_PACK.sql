CREATE OR REPLACE PACKAGE phenix.CUD_OPERATION_PACK IS

FUNCTION GET_SURCHARGE_AMOUNT_FUNC(
  p_cus_code  IN customers.cus_code%TYPE,
  p_prd_code  IN products.prd_code%TYPE,
  p_fmt_code  IN formats.fmt_code%TYPE,
  p_price     IN NUMBER
)
RETURN NUMBER;

PROCEDURE VALIDATE_CUD_ADMIN_PROC(
  p_cus_code       IN customer_discounts.cud_cus_code%TYPE,
  p_dgt_code       IN customer_discounts.cud_dgt_code%TYPE,
  p_admin_percent  IN customer_discounts.cud_admin_percent%TYPE
);

FUNCTION GET_ADMIN_PERCENT_PGR_FMT_FUNC(
  p_prf_prd_code       IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code       IN product_formats.prf_fmt_code%TYPE,
  p_cud_group_fmt_code IN customer_discounts.cud_group_fmt_code%TYPE,
  p_cud_admin_percent  IN customer_discounts.cud_admin_percent%TYPE
)
RETURN NUMBER;

FUNCTION GET_CUD_INFO_FUNC(
  p_cud_cus_code     IN customer_discounts.cud_cus_code%TYPE,
  p_cus_dgt_code     IN customer_discounts.cud_dgt_code%TYPE,
  p_cud_prf_prd_code IN customer_discounts.cud_prf_prd_code%TYPE,
  p_cud_prf_fmt_code IN customer_discounts.cud_prf_fmt_code%TYPE,
  p_cud_pgr_code     IN customer_discounts.cud_pgr_code%TYPE DEFAULT NULL
)
RETURN customer_discounts%ROWTYPE;

FUNCTION GET_CUD_SURCHARGE_INFO_FUNC(
  p_cud_cus_code     IN customer_discounts.cud_cus_code%TYPE,
  p_cus_dgt_code     IN customer_discounts.cud_dgt_code%TYPE,
  p_cud_prf_prd_code IN customer_discounts.cud_prf_prd_code%TYPE,
  p_cud_prf_fmt_code IN customer_discounts.cud_prf_fmt_code%TYPE,
  p_cud_pgr_code     IN customer_discounts.cud_pgr_code%TYPE DEFAULT NULL
)
RETURN customer_discounts%ROWTYPE;

FUNCTION EXIST_CUS_CODE_FUNC(
  p_cud_cus_code  IN customer_discounts.cud_cus_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE LOCK_DGT_FOR_DELETE_PROC(
  p_to_dgt_code  customer_discounts.cud_dgt_code%TYPE
);

PROCEDURE LOCK_CUS_FOR_DELETE_PROC(
  p_to_cus_code  customer_discounts.cud_cus_code%TYPE
);

PROCEDURE COPY_GRID_PROC(
  p_cud_dgt_code_source       IN customer_discounts.cud_dgt_code%TYPE,
  p_cud_dgt_code_destination  IN customer_discounts.cud_dgt_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_cud_prf_prd_code IN customer_discounts.cud_prf_prd_code%TYPE,
  p_cud_prf_fmt_code IN customer_discounts.cud_prf_fmt_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_cud_prd_code IN customer_discounts.cud_prd_code%TYPE
);

PROCEDURE UPDATE_CUS_PROFILES_PROC (
 p_cud_cus_code IN customer_discounts.cud_cus_code%TYPE
);

PROCEDURE DISCOUNT_PRD_TO_PROFIL_PROC(
  p_jsc_id   IN job_schedules.jsc_id%TYPE
);

FUNCTION COPY_GRID_TO_GRID_FUNC(
  p_dgt_code_source       IN customer_discounts.cud_dgt_code%TYPE,
  p_dgt_code_destination  IN customer_discounts.cud_dgt_code%TYPE
) RETURN NUMBER;

FUNCTION COPY_CUS_TO_GRID_FUNC(
  p_cus_code_source       IN customer_discounts.cud_cus_code%TYPE,
  p_dgt_code_destination  IN customer_discounts.cud_dgt_code%TYPE
) RETURN NUMBER;

FUNCTION COPY_CUS_TO_CUS_FUNC(
  p_cus_code_source       IN customer_discounts.cud_cus_code%TYPE,
  p_cus_code_destination  IN customer_discounts.cud_cus_code%TYPE
) RETURN NUMBER;

FUNCTION COPY_GRID_TO_CUS_FUNC(
  p_dgt_code_source       IN customer_discounts.cud_dgt_code%TYPE,
  p_cus_code_destination  IN customer_discounts.cud_cus_code%TYPE
) RETURN NUMBER;

FUNCTION EXISTS_DGT_CODE_FUNC(
   p_cud_dgt_code IN customer_discounts.cud_dgt_code%TYPE
 )
RETURN BOOLEAN;

--BEA238 fonction qui applique une grille d'escompte donnée sur un prix,
--et qui peut appliquer cette grille sur un price change futur mais avant une date donnée
FUNCTION APPLY_DISCOUNT_FUNC(
  p_dgt_code                IN NUMBER,
  p_prd_code                IN VARCHAR2,
  p_fmt_code                IN VARCHAR2,
  p_whs_code                IN VARCHAR2,
  p_nselling_retail         IN OUT NUMBER,
  p_ccr_code                IN OUT NUMBER,
  p_check_for_prx_switch    IN NUMBER DEFAULT 0,  --doit avoir une date (prx_to_date) pour que la switch soit utilisée
  p_prx_to_date             IN DATE DEFAULT NULL  --a un impact juste si la switch check_for_prx est à 1
)
RETURN BOOLEAN;

END CUD_OPERATION_PACK;
/