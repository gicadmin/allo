CREATE OR REPLACE PACKAGE phenix.VTL_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_transport_levels%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vtl_id                         IN         vendor_transport_levels.vtl_id%TYPE,
  p_vtl_rec                        OUT NOCOPY vendor_transport_levels%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vtl_id                         IN         vendor_transport_levels.vtl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_vtl_id                         IN         vendor_transport_levels.vtl_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vtl_id                         IN         vendor_transport_levels.vtl_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vtl_vtr_id           IN         vendor_transport_levels.vtl_vtr_id%TYPE,
  p_vtl_lower_boundary   IN         vendor_transport_levels.vtl_lower_boundary%TYPE,
  p_vtl_upper_boundary   IN         vendor_transport_levels.vtl_upper_boundary%TYPE,
  p_vtl_charge_rate      IN         vendor_transport_levels.vtl_charge_rate%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_transport_levels%ROWTYPE)
RETURN NUMBER;

END VTL_PACK;
/