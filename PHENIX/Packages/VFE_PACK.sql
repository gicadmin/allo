CREATE OR REPLACE PACKAGE phenix.VFE_PACK AS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_format_equivalences%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vfe_ven_code                   IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_fmt_code                   IN         vendor_format_equivalences.vfe_fmt_code%TYPE,
  p_vfe_rec                        OUT NOCOPY vendor_format_equivalences%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vfe_ven_code                   IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_fmt_code                   IN         vendor_format_equivalences.vfe_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vfe_ven_code                   IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_fmt_code                   IN         vendor_format_equivalences.vfe_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vfe_ven_code                   IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_fmt_code                   IN         vendor_format_equivalences.vfe_fmt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vfe_ven_code                   IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_fmt_code                   IN         vendor_format_equivalences.vfe_fmt_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_vfe_ven_code                   IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_vendor_format              IN         vendor_format_equivalences.vfe_vendor_format%TYPE,
  p_vfe_rec                        OUT NOCOPY vendor_format_equivalences%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vfe_ven_code                   IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_vendor_format              IN         vendor_format_equivalences.vfe_vendor_format%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vfe_ven_code                   IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_vendor_format              IN         vendor_format_equivalences.vfe_vendor_format%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vfe_ven_code                   IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_vendor_format              IN         vendor_format_equivalences.vfe_vendor_format%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vfe_ven_code                   IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_vendor_format              IN         vendor_format_equivalences.vfe_vendor_format%TYPE);


PROCEDURE INSERT_PROC(
  p_vfe_ven_code         IN         vendor_format_equivalences.vfe_ven_code%TYPE,
  p_vfe_fmt_code         IN         vendor_format_equivalences.vfe_fmt_code%TYPE,
  p_vfe_vendor_format    IN         vendor_format_equivalences.vfe_vendor_format%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_format_equivalences%ROWTYPE);

END VFE_PACK;
/