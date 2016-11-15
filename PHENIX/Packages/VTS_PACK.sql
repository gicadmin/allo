CREATE OR REPLACE PACKAGE phenix.VTS_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_transport_service_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vts_code                       IN         vendor_transport_service_types.vts_code%TYPE,
  p_vts_rec                        OUT NOCOPY vendor_transport_service_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vts_code                       IN         vendor_transport_service_types.vts_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vts_code                       IN         vendor_transport_service_types.vts_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_vts_code                       IN         vendor_transport_service_types.vts_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vts_code                       IN         vendor_transport_service_types.vts_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vts_code                       IN         vendor_transport_service_types.vts_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vts_code                  IN         vendor_transport_service_types.vts_code%TYPE,
  p_vts_description           IN         vendor_transport_service_types.vts_description%TYPE,
  p_vts_provincial_tax_switch IN         vendor_transport_service_types.vts_provincial_tax_switch%TYPE,
  p_vts_federal_tax_switch    IN         vendor_transport_service_types.vts_federal_tax_switch%TYPE,
  p_vts_alt_description       IN         vendor_transport_service_types.vts_alt_description%TYPE            DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_transport_service_types%ROWTYPE);

END VTS_PACK;
/