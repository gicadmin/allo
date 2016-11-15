CREATE OR REPLACE PACKAGE phenix.DVN_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  division_names%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dvn_code                       IN         division_names.dvn_code%TYPE,
  p_dvn_rec                        OUT NOCOPY division_names%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dvn_code                       IN         division_names.dvn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dvn_code                       IN         division_names.dvn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_dvn_code                       IN         division_names.dvn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dvn_code                       IN         division_names.dvn_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dvn_code                       IN         division_names.dvn_code%TYPE);


PROCEDURE INSERT_PROC(
  p_dvn_code                    IN         division_names.dvn_code%TYPE,
  p_dvn_description             IN         division_names.dvn_description%TYPE,
  p_dvn_alt_description         IN         division_names.dvn_alt_description%TYPE              DEFAULT NULL,
  p_dvn_additional_alloc_switch IN         division_names.dvn_additional_alloc_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY division_names%ROWTYPE);

END DVN_PACK;
/