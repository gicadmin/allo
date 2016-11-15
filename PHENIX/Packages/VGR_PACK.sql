CREATE OR REPLACE PACKAGE phenix.VGR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_groups%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vgr_code                       IN         vendor_groups.vgr_code%TYPE,
  p_vgr_rec                        OUT NOCOPY vendor_groups%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vgr_code                       IN         vendor_groups.vgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vgr_code                       IN         vendor_groups.vgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_vgr_code                       IN         vendor_groups.vgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vgr_code                       IN         vendor_groups.vgr_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vgr_code                       IN         vendor_groups.vgr_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vgr_code             IN         vendor_groups.vgr_code%TYPE,
  p_vgr_description      IN         vendor_groups.vgr_description%TYPE,
  p_vgr_alt_description  IN         vendor_groups.vgr_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_groups%ROWTYPE);

END VGR_PACK;
/