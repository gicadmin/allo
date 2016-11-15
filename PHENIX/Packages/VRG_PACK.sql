CREATE OR REPLACE PACKAGE phenix.VRG_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  volume_rebate_grids%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vrg_code                       IN         volume_rebate_grids.vrg_code%TYPE,
  p_vrg_rec                        OUT NOCOPY volume_rebate_grids%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vrg_code                       IN         volume_rebate_grids.vrg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vrg_code                       IN         volume_rebate_grids.vrg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_vrg_code                       IN         volume_rebate_grids.vrg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vrg_code                       IN         volume_rebate_grids.vrg_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vrg_code                       IN         volume_rebate_grids.vrg_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vrg_code                     IN         volume_rebate_grids.vrg_code%TYPE,
  p_vrg_description              IN         volume_rebate_grids.vrg_description%TYPE,
  p_vrg_alt_description          IN         volume_rebate_grids.vrg_alt_description%TYPE               DEFAULT NULL,
  p_vrg_rebate_frequency         IN         volume_rebate_grids.vrg_rebate_frequency%TYPE              DEFAULT 'A' ,
  p_vrg_exclude_royalty_switch   IN         volume_rebate_grids.vrg_exclude_royalty_switch%TYPE        DEFAULT 0 ,
  p_vrg_ven_exc_whs_sales_switch IN         volume_rebate_grids.vrg_ven_exc_whs_sales_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY volume_rebate_grids%ROWTYPE);

END VRG_PACK;
/