CREATE OR REPLACE PACKAGE phenix.PGP_OPERATION_PACK AS

FUNCTION CHECK_DATE_FUNC(
  p_date  VARCHAR2,
  p_mask  VARCHAR2
) RETURN BOOLEAN;
PROCEDURE PURGE_PROC;

PROCEDURE INSERT_OR_UPDATE_PROC(
  p_pgp_pug_code         IN         purchasing_group_products.pgp_pug_code%TYPE,
  p_pgp_prd_code         IN         purchasing_group_products.pgp_prd_code%TYPE,
  p_pgp_effective_date   IN         purchasing_group_products.pgp_effective_date%TYPE,
  p_pgp_base_cost        IN         purchasing_group_products.pgp_base_cost%TYPE
);

FUNCTION GET_PGP_PRICE_FUNC(
  p_qtd_prf_prd_code          IN   quotation_details.qtd_prf_prd_code%TYPE,
  p_qth_start_date            IN   quotation_headers.qth_start_date%TYPE,
  p_qth_end_date              IN   quotation_headers.qth_end_date%TYPE,
  p_qth_price_change_percent  IN   quotation_headers.qth_price_change_percent%TYPE,
  p_qth_cus_code              IN   quotation_headers.qth_cus_code %TYPE,
  p_qth_qty_code              IN   quotation_headers.qth_qty_code%TYPE
) RETURN NUMBER ;
PROCEDURE VALID_PGP(
  p_file     IN VARCHAR2,
  p_language IN VARCHAR2
  );
PROCEDURE IMPORT_PGP_PROC (
  p_jsc_id   IN NUMBER,
  p_log_id	 IN NUMBER);

PROCEDURE EXTRACT_PUG_PROC (
  p_pug_code IN purchasing_groups.pug_code%TYPE,
  p_language IN VARCHAR2
) ;
FUNCTION VALIDATE_QUOTATION (
  p_qtd_base_cost_type IN NUMBER,
  p_pug_code           IN NUMBER,
  p_qtd_prf_prd_code   IN VARCHAR2,
  p_qth_start_date     IN DATE,
  p_qth_end_date       IN DATE ,
  p_trouve_pgp         OUT BOOLEAN,
  p_trouve_date        OUT BOOLEAN
)RETURN BOOLEAN;

FUNCTION EXISTS_PUG_DATE_PRD_FUNC(
  p_pgp_id             IN  purchasing_group_products.pgp_id%TYPE,
  p_pgp_prd_code       IN  purchasing_group_products.pgp_prd_code%TYPE,
  p_pgp_pug_code       IN  purchasing_group_products.pgp_pug_code%TYPE,
  p_pgp_effective_date IN  purchasing_group_products.pgp_effective_date%TYPE
)RETURN BOOLEAN;

FUNCTION EXISTS_ACTIVE_QTD_FUNC(
  p_pgp_prd_code       IN  purchasing_group_products.pgp_prd_code%TYPE,
  p_pgp_pug_code       IN  purchasing_group_products.pgp_pug_code%TYPE,
  p_qtd_base_cost_type IN  quotation_details.qtd_base_cost_type%TYPE
)RETURN BOOLEAN;

PROCEDURE DELETE_PROC(
  p_pgp_pug_code       IN  purchasing_group_products.pgp_pug_code%TYPE,
  p_pgp_prd_code       IN  purchasing_group_products.pgp_prd_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_pgp_prd_code IN purchasing_group_products.pgp_prd_code%TYPE
);

END PGP_OPERATION_PACK;
/