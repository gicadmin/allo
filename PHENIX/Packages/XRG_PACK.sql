CREATE OR REPLACE PACKAGE phenix.XRG_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  xref_grids%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_xrg_code                       IN         xref_grids.xrg_code%TYPE,
  p_xrg_rec                        OUT NOCOPY xref_grids%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_xrg_code                       IN         xref_grids.xrg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_xrg_code                       IN         xref_grids.xrg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_xrg_code                       IN         xref_grids.xrg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_xrg_code                       IN         xref_grids.xrg_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_xrg_code                       IN         xref_grids.xrg_code%TYPE);


PROCEDURE INSERT_PROC(
  p_xrg_code             IN         xref_grids.xrg_code%TYPE,
  p_xrg_description      IN         xref_grids.xrg_description%TYPE,
  p_xrg_alt_description  IN         xref_grids.xrg_alt_description%TYPE       DEFAULT NULL,
  p_xrg_interface_switch IN         xref_grids.xrg_interface_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY xref_grids%ROWTYPE);

END XRG_PACK;
/