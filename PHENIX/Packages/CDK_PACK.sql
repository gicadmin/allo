CREATE OR REPLACE PACKAGE phenix.CDK_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  cross_docks%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cdk_code                       IN         cross_docks.cdk_code%TYPE,
  p_cdk_rec                        OUT NOCOPY cross_docks%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cdk_code                       IN         cross_docks.cdk_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cdk_code                       IN         cross_docks.cdk_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cdk_code                       IN         cross_docks.cdk_code%TYPE);


PROCEDURE INSERT_PROC(
  p_cdk_code             IN         cross_docks.cdk_code%TYPE,
  p_cdk_name             IN         cross_docks.cdk_name%TYPE,
  p_cdk_address          IN         cross_docks.cdk_address%TYPE,
  p_cdk_city             IN         cross_docks.cdk_city%TYPE,
  p_cdk_prv_code         IN         cross_docks.cdk_prv_code%TYPE,
  p_cdk_postal_code      IN         cross_docks.cdk_postal_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY cross_docks%ROWTYPE);

END CDK_PACK;
/