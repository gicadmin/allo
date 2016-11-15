CREATE OR REPLACE PACKAGE phenix.TWD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  transit_warehouse_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_twd_pmh_id                     IN         transit_warehouse_details.twd_pmh_id%TYPE,
  p_twd_twh_plh_id                 IN         transit_warehouse_details.twd_twh_plh_id%TYPE,
  p_twd_rec                        OUT NOCOPY transit_warehouse_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_twd_pmh_id                     IN         transit_warehouse_details.twd_pmh_id%TYPE,
  p_twd_twh_plh_id                 IN         transit_warehouse_details.twd_twh_plh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_twd_pmh_id                     IN         transit_warehouse_details.twd_pmh_id%TYPE,
  p_twd_twh_plh_id                 IN         transit_warehouse_details.twd_twh_plh_id%TYPE)
RETURN NUMBER;


PROCEDURE INSERT_PROC(
  p_twd_pmh_id           IN         transit_warehouse_details.twd_pmh_id%TYPE,
  p_twd_twh_plh_id       IN         transit_warehouse_details.twd_twh_plh_id%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY transit_warehouse_details%ROWTYPE);

END TWD_PACK;
/