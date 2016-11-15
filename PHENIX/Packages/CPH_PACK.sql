CREATE OR REPLACE PACKAGE phenix.CPH_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  console_pick_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cph_pmh_id                     IN         console_pick_headers.cph_pmh_id%TYPE,
  p_cph_rec                        OUT NOCOPY console_pick_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cph_pmh_id                     IN         console_pick_headers.cph_pmh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cph_pmh_id                     IN         console_pick_headers.cph_pmh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cph_pmh_id                     IN         console_pick_headers.cph_pmh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cph_pmh_id                     IN         console_pick_headers.cph_pmh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cph_pmh_id                     IN         console_pick_headers.cph_pmh_id%TYPE);


PROCEDURE INSERT_PROC(
  p_cph_pmh_id                IN         console_pick_headers.cph_pmh_id%TYPE,
  p_cph_pmh_status            IN         console_pick_headers.cph_pmh_status%TYPE,
  p_cph_pmh_type              IN         console_pick_headers.cph_pmh_type%TYPE,
  p_cph_pmh_whs_picking_code  IN         console_pick_headers.cph_pmh_whs_picking_code%TYPE,
  p_cph_pmh_whs_delivery_code IN         console_pick_headers.cph_pmh_whs_delivery_code%TYPE,
  p_cph_pmh_cus_code          IN         console_pick_headers.cph_pmh_cus_code%TYPE               DEFAULT NULL,
  p_cph_pmh_rou_code          IN         console_pick_headers.cph_pmh_rou_code%TYPE               DEFAULT NULL,
  p_cph_pmh_route_date        IN         console_pick_headers.cph_pmh_route_date%TYPE             DEFAULT NULL,
  p_cph_pmh_whz_code          IN         console_pick_headers.cph_pmh_whz_code%TYPE               DEFAULT NULL,
  p_cph_pmh_ven_code          IN         console_pick_headers.cph_pmh_ven_code%TYPE               DEFAULT NULL,
  p_cph_pmh_pco_id            IN         console_pick_headers.cph_pmh_pco_id%TYPE                 DEFAULT NULL,
  p_cph_pmh_prw_whz_code      IN         console_pick_headers.cph_pmh_prw_whz_code%TYPE           DEFAULT NULL,
  p_cph_pmh_counter_switch    IN         console_pick_headers.cph_pmh_counter_switch%TYPE         DEFAULT 0 ,
  p_cph_pmh_overstock_switch  IN         console_pick_headers.cph_pmh_overstock_switch%TYPE       DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY console_pick_headers%ROWTYPE);


--procédure qui recharge au complet les tables CPH et CPD
PROCEDURE RELOAD_ALL_CPH_PROC;



END CPH_PACK;
/