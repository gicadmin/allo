CREATE OR REPLACE PACKAGE phenix.PWP_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  program_warehouse_printers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pwp_pro_id                     IN         program_warehouse_printers.pwp_pro_id%TYPE,
  p_pwp_whs_code                   IN         program_warehouse_printers.pwp_whs_code%TYPE,
  p_pwp_rec                        OUT NOCOPY program_warehouse_printers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwp_pro_id                     IN         program_warehouse_printers.pwp_pro_id%TYPE,
  p_pwp_whs_code                   IN         program_warehouse_printers.pwp_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwp_pro_id                     IN         program_warehouse_printers.pwp_pro_id%TYPE,
  p_pwp_whs_code                   IN         program_warehouse_printers.pwp_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwp_pro_id                     IN         program_warehouse_printers.pwp_pro_id%TYPE,
  p_pwp_whs_code                   IN         program_warehouse_printers.pwp_whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwp_pro_id                     IN         program_warehouse_printers.pwp_pro_id%TYPE,
  p_pwp_whs_code                   IN         program_warehouse_printers.pwp_whs_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pwp_pro_id           IN         program_warehouse_printers.pwp_pro_id%TYPE,
  p_pwp_whs_code         IN         program_warehouse_printers.pwp_whs_code%TYPE,
  p_pwp_prn_id           IN         program_warehouse_printers.pwp_prn_id%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY program_warehouse_printers%ROWTYPE);

END PWP_PACK;
/