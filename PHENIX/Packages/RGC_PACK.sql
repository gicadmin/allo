CREATE OR REPLACE PACKAGE phenix.RGC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  route_grouping_codes%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rgc_code                       IN         route_grouping_codes.rgc_code%TYPE,
  p_rgc_rec                        OUT NOCOPY route_grouping_codes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rgc_code                       IN         route_grouping_codes.rgc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rgc_code                       IN         route_grouping_codes.rgc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_rgc_code                       IN         route_grouping_codes.rgc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rgc_code                       IN         route_grouping_codes.rgc_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rgc_code                       IN         route_grouping_codes.rgc_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rgc_code                  IN         route_grouping_codes.rgc_code%TYPE,
  p_rgc_description           IN         route_grouping_codes.rgc_description%TYPE,
  p_rgc_alt_description       IN         route_grouping_codes.rgc_alt_description%TYPE            DEFAULT NULL,
  p_rgc_cdk_code              IN         route_grouping_codes.rgc_cdk_code%TYPE                   DEFAULT NULL,
  p_rgc_route_shipment_switch IN         route_grouping_codes.rgc_route_shipment_switch%TYPE      DEFAULT 1);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY route_grouping_codes%ROWTYPE);

END RGC_PACK;
/