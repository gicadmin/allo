CREATE OR REPLACE PACKAGE phenix.CSD_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_schedules%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_csd_id                         IN         customer_schedules.csd_id%TYPE,
  p_csd_rec                        OUT NOCOPY customer_schedules%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_csd_id                         IN         customer_schedules.csd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_csd_id                         IN         customer_schedules.csd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_csd_id                         IN         customer_schedules.csd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_csd_id                         IN         customer_schedules.csd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_csd_cus_code             IN         customer_schedules.csd_cus_code%TYPE,
  p_csd_ordered_switch       IN         customer_schedules.csd_ordered_switch%TYPE,
  p_csd_processed_switch     IN         customer_schedules.csd_processed_switch%TYPE,
  p_csd_outgoing_call_switch IN         customer_schedules.csd_outgoing_call_switch%TYPE,
  p_csd_sch_code             IN         customer_schedules.csd_sch_code%TYPE,
  p_csd_hour                 IN         customer_schedules.csd_hour%TYPE                      DEFAULT NULL,
  p_csd_minute               IN         customer_schedules.csd_minute%TYPE                    DEFAULT NULL,
  p_csd_position             IN         customer_schedules.csd_position%TYPE                  DEFAULT NULL,
  p_csd_notes                IN         customer_schedules.csd_notes%TYPE                     DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_schedules%ROWTYPE)
RETURN NUMBER;

END CSD_PACK;
/