CREATE OR REPLACE PACKAGE phenix.RSC_PACK AS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  route_shipment_conditions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rsc_id                         IN         route_shipment_conditions.rsc_id%TYPE,
  p_rsc_rec                        OUT NOCOPY route_shipment_conditions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rsc_id                         IN         route_shipment_conditions.rsc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rsc_id                         IN         route_shipment_conditions.rsc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rsc_id                         IN         route_shipment_conditions.rsc_id%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_rsc_rsh_id                     IN         route_shipment_conditions.rsc_rsh_id%TYPE,
  p_rsc_whc_code                   IN         route_shipment_conditions.rsc_whc_code%TYPE,
  p_rsc_rec                        OUT NOCOPY route_shipment_conditions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rsc_rsh_id                     IN         route_shipment_conditions.rsc_rsh_id%TYPE,
  p_rsc_whc_code                   IN         route_shipment_conditions.rsc_whc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rsc_rsh_id                     IN         route_shipment_conditions.rsc_rsh_id%TYPE,
  p_rsc_whc_code                   IN         route_shipment_conditions.rsc_whc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rsc_rsh_id                     IN         route_shipment_conditions.rsc_rsh_id%TYPE,
  p_rsc_whc_code                   IN         route_shipment_conditions.rsc_whc_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rsc_rsh_id            IN         route_shipment_conditions.rsc_rsh_id%TYPE,
  p_rsc_whc_code          IN         route_shipment_conditions.rsc_whc_code%TYPE,
  p_rsc_truck_temperature IN         route_shipment_conditions.rsc_truck_temperature%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY route_shipment_conditions%ROWTYPE)
RETURN NUMBER;

END RSC_PACK;
/